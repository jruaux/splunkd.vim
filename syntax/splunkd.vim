" Vim syntax file
" Language:         splunkd log file
" Maintainer:       Julien Ruaux <jruaux at splunk>
" Latest Revision:  2015-11-23

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   splunkdBegin       display '^' nextgroup=splunkdDate

syn match   splunkdDate        contained display '\d\d-\d\d-\d\{4}'
                                \ nextgroup=splunkdTime

syn match   splunkdTime        contained display ' \d\d:\d\d:\d\d\(\.\d\+\)\s\-\d\{4}'
                                \ nextgroup=splunkdError,splunkdWarning

syn match   splunkdError       contained ' \(CRITICAL\|ERROR\) .*'

syn match   splunkdWarning     contained ' \(WARN\|WARNING\) .*'

hi def link splunkdDate        Constant
hi def link splunkdTime        Type
hi def link splunkdError       ErrorMsg
hi def link splunkdWarning     WarningMsg


let b:current_syntax = "splunkd"

let &cpo = s:cpo_save
unlet s:cpo_save
