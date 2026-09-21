"""Execute the corrected notebook in source order without a Jupyter server.

Checks notebook schema and all inline validation assertions; regenerates tables
and PNG assets. Does not change either notebook or the source workbooks.
"""
from pathlib import Path
import hashlib
import os
import tempfile

os.environ.setdefault('MPLCONFIGDIR', str(Path(tempfile.gettempdir()) / 'nfl-matplotlib'))
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import nbformat
import IPython.display

root = Path(__file__).resolve().parent
os.chdir(root)
protected = [*root.glob('*.xlsx'), root / 'Project 3 NFL Passing Statistics Analysis (Shachar Givon) .ipynb']
before = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}
notebook = nbformat.read(root / 'nfl-quarterback-analysis-corrected.ipynb', as_version=4)
nbformat.validate(notebook)
IPython.display.display = lambda *args, **kwargs: None
plt.show = lambda: plt.close('all')
namespace = {'__name__': '__main__'}
executed = 0
for index, cell in enumerate(notebook.cells, 1):
    if cell.cell_type == 'code':
        exec(compile(cell.source, f'notebook cell {index}', 'exec'), namespace)
        executed += 1
assert before == {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}
assert namespace['career'].Player.is_unique
assert len(namespace['data']) == len(namespace['raw'])
assert namespace['contracts'].Contract_Status.eq('source-labeled historical').all()
# Independently verify the era selection remains correct after index permutation.
annual = namespace['season_means'].sample(frac=1, random_state=42).reset_index(drop=True)
selected = annual.loc[annual.Year.between(2001, 2010)]
assert set(selected.Year) == (set(range(2001, 2011)) - {2007})
# Independent pooled completion control (not a mean of source percentages).
rows = namespace['career_rows']
player = namespace['career'].iloc[0]
source_rows = rows.loc[rows.Player == player.Player]
assert abs(player.Completion - 100 * sum(source_rows.Cmp) / sum(source_rows.Att)) < 1e-10
assert len(list((root / 'assets').glob('*.png'))) >= 4
print(f'PASS: {executed} code cells; schema, source preservation, cohort and aggregate checks.')
