" Vim syntax file
" Language:     Tupfile

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax match comment ,^\s*#.*$,
syntax match rule ,^\s*[:,],
syntax match bang ,![a-zA-Z0-9_.-]*,
syntax match chain ,^*[a-zA-Z0-9_-][a-zA-Z0-9_-]*,
syntax match chain ,[^a-zA-Z0-9_-]\*[a-zA-Z0-9_-][a-zA-Z0-9_-]*,
syntax match separator /|>/
syntax match reverseseparator /<|/
syntax match format display "%\([%efoOBb]\)" contained
syntax match errfmt display "%\([^%efoOBb]\)" contained
syntax match variable /$([^)]*)/
syntax match variable /{[^}]*}/
syntax match atvar /@([^)]*)/
syntax match atvar /$(CONFIG_[^)]*)/
syntax match control "^\(ifeq\>\|ifneq\>\|else\>\|endif\>\|include\>\|include_rules\>\|\.gitignore\>\)"
syntax match backslash /\\$/
syntax keyword keys foreach
syntax region ifdef matchgroup=control start=/^ifdef / start=/^ifndef / end=/$/
syntax region varsed matchgroup=rule start=/,/ end=/$/ contains=separator,format,variable,errfmt
syntax region command matchgroup=separator start=/|>/ end=/|>/ end=/$/ contains=format,variable,atvar,bang,errfmt,chain
syntax region reversecommand matchgroup=reverseseparator start=/<|/ end=/<|/ end=/$/ contains=format,variable,atvar,bang,errfmt,chain

highlight link comment Comment
highlight link command String
highlight link reversecommand String
highlight link rule Operator
highlight link separator Keyword
highlight link reverseseparator Keyword
highlight link keys Keyword
highlight link format Special
highlight link errfmt Error
highlight link variable Special
highlight link control Include
highlight link bang Type
highlight def chain ctermfg=green cterm=bold
highlight def atvar ctermfg=red cterm=bold
highlight def ifdef ctermfg=red cterm=bold
highlight def backslash ctermfg=red cterm=bold
