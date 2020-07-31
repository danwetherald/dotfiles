function! helpers#lightline#fileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
***REMOVED***if
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
***REMOVED***function

function! helpers#lightline#fileEncoding()
    " only show the file encoding if it's not 'utf-8'
    return &fileencoding == 'utf-8' ? '' : &fileencoding
***REMOVED***function

function! helpers#lightline#fileFormat()
    " only show the file format if it's not 'unix'
    let format = &fileformat == 'unix' ? '' : &fileformat
    return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() . ' ' : ''
***REMOVED***function

function! helpers#lightline#fileType()
    return WebDevIconsGetFileTypeSymbol()
***REMOVED***function

function! helpers#lightline#gitBranch()
    return "\uE725" . (exists('*fugitive#head') ? ' ' . fugitive#head() : '')
***REMOVED***function

function! helpers#lightline#currentFunction()
    return get(b:, 'coc_current_function', '')
***REMOVED***function

function! helpers#lightline#gitBlame()
    return winwidth(0) > 100 ? strpart(substitute(get(b:, 'coc_git_blame', ''), '[\(\)]', '', 'g'), 0, 50) : ''
    " return winwidth(0) > 100 ? strpart(get(b:, 'coc_git_blame', ''), 0, 20) : ''
***REMOVED***function
