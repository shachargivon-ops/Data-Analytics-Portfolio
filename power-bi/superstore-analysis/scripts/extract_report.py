import pathlib,zipfile,json,hashlib,collections
root=pathlib.Path(__file__).resolve().parents[1];p=root/'Project 4 Analyze Data with Power BI Superstore (Shachar Givon).pbix'
assert hashlib.sha256(p.read_bytes()).hexdigest() == 'c20515770f4c8b33533fc21d21f299c1dfa5edd4663ae18765b2375bb1aeca33', 'Unexpected PBIX hash; review the new source before regenerating evidence.'
z=zipfile.ZipFile(p)
def read(n):
 b=z.read(n);return json.loads(b.decode('utf-16-le') if b[1]==0 else b.decode('utf-8-sig'))
def walk(x,key):
 if isinstance(x,dict):
  for k,v in x.items():
   if k==key:yield v
   yield from walk(v,key)
 elif isinstance(x,list):
  for v in x:yield from walk(v,key)
order=read('Report/definition/pages/pages.json')['pageOrder'];pages=[]
for pid in order:
 prefix='Report/definition/pages/'+pid+'/';pg=read(prefix+'page.json');vs=[]
 for n in z.namelist():
  if n.startswith(prefix) and n.endswith('/visual.json'):
   v=read(n);vs.append({'source':n,'id':v['name'],'type':v['visual']['visualType'],'fields':sorted(set(walk(v,'queryRef'))),'definition':v})
 pages.append({'source':prefix+'page.json','name':pg['displayName'],'id':pid,'definition':pg,'visuals':vs})
evidence={'primary_file':p.name,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'git_blob_sha':hashlib.sha1(b'blob '+str(p.stat().st_size).encode()+b'\0'+p.read_bytes()).hexdigest(),'method':'Read-only ZIP member parsing; no report execution. Compressed semantic-model metadata not extracted.','members':[{'name':i.filename,'bytes':i.file_size} for i in z.infolist()],'diagram':read('DiagramLayout'),'report':read('Report/definition/report.json'),'pages':pages,'bookmarks':[{ 'source':n,'definition':read(n)} for n in z.namelist() if n.endswith('.bookmark.json')]}
(root/'report-structure.json').write_text(json.dumps(evidence,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
print('pages',len(pages),'visuals',sum(len(p['visuals']) for p in pages),'sha256',evidence['sha256'])
print('measures',sorted({m['Property'] for pg in pages for v in pg['visuals'] for m in walk(v['definition'],'Measure')}))
