"""Render the supplied final report PDF unchanged; requires pypdfium2 and Pillow."""
import argparse, hashlib, json, pathlib
import pypdfium2
from PIL import Image

PDF_SHA256 = '2f1fcf0c17bc14516b2eae0f2119bb0ad5e2ef2b2b99980281558e9dc75fc10e'  # Set after the supplied PDF is audited.
FILES = ['sales-overview', 'product-analysis', 'customer-analysis', 'regional-analysis',
         'shipping-operations', 'returns-analysis', 'growth-trends', 'executive-summary']

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('pdf', type=pathlib.Path)
    parser.add_argument('--output', type=pathlib.Path, default=pathlib.Path(__file__).resolve().parents[1] / 'assets')
    args = parser.parse_args()
    digest = hashlib.sha256(args.pdf.read_bytes()).hexdigest()
    if digest != PDF_SHA256:
        raise ValueError('Unexpected PDF hash; audit the new source before rendering.')
    doc = pypdfium2.PdfDocument(str(args.pdf))
    if len(doc) != len(FILES):
        raise ValueError('Expected exactly eight report pages.')
    args.output.mkdir(parents=True, exist_ok=True)
    records = []
    for index, filename in enumerate(FILES):
        page = doc[index]
        bitmap = page.render(scale=2)
        rendered = bitmap.to_pil().convert('RGB')
        path = args.output / (filename + '.png')
        rendered.save(path, format='PNG', optimize=True)
        with Image.open(path) as saved:
            if saved.convert('RGB').tobytes() != rendered.tobytes():
                raise ValueError('PNG pixels do not match the PDF rendering.')
        records.append({'pdf_page': index + 1, 'file': path.name, 'pixels': list(rendered.size),
                        'sha256': hashlib.sha256(path.read_bytes()).hexdigest()})
        bitmap.close()
        page.close()
    doc.close()
    (args.output / 'dashboard-provenance.json').write_text(json.dumps({
        'source_pdf': args.pdf.name, 'source_sha256': digest,
        'method': 'PDFium render at 144 dpi; RGB PNG with lossless optimization; no crop, redraw or visual edits.',
        'pages': records}, indent=2) + '\n', encoding='utf-8')

if __name__ == '__main__':
    main()
