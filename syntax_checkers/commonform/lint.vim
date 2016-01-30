"File:        commonform.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Kyle E. Mitchell <kyle at kemitchell dot com>
"License:     The Apache License, Version 2.0

if exists('g:loaded_syntastic_commonform_lint_checker')
    finish
endif
let g:loaded_syntastic_commonform_lint_checker = 1

if !exists('g:syntastic_commonform_lint_sort')
    let g:syntastic_commonform_lint_sort = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_commonform_lint_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': 'lint' })

    let errorformat =
        \ '%E%f:%l: %m,'.
        \ '%W%f: Kramdown Warning: %m found on line %l'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'commonform',
    \ 'name': 'comonform'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
