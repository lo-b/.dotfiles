" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

let b:ale_completion_autoimport = 1

" Remap to create docstring
nmap <silent> <leader>ds <Plug>(pydocstring)
