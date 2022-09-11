"Marca la extencion de archivo compatibles
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

"Distingue entre etiquetas con mayusculas y minusculas
let g:closetag_emptyTags_caseSensitive = 1

"Desabilita el plugin si no esta en la region correcta
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>' "Atajo para cerrar etiqueta
let g:closetag_close_shortcut = '<leader>>' "Agregar el simbolo > sin cerrar la etiqueta
let g:closetag_enable_react_fragment = 1 "Abilita las etiquetas para los fragments de react
