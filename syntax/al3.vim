" Vim syntax file
"

if exists ("b:current_syntax")
  finish
endif

syn region al3Line start=/^\d/ end=/$/ contains=al3Header
" syn region bisLine start=/^5BIS/ end=/$/ contains=al3Header,nameType,namedInsured

" syn match nameType /^5BIS.\{26\}[CPFG]/ containedin=bisLine nextgroup=namedInsured
" syn match namedInsured /^5BIS.\{27\}\zs.\{59\}/ containedin=bisLine
syn match al3Version /\v<[0-9A-Z ]>/ contained nextgroup=groupLevel
syn match controlGroupLine /^[1-3].\+$/
syn match al3Header /^[5-9].\{29\}/ contains=@baseGroupInfo,@parentInfo contained
syn match al3Group /[5-9][A-Z]\{3\}/ contains=locationRecord,buildingRecord,soiRecord,packageRecord,coverageRecord,glRecord,policyInfoRecord contained nextgroup=al3Length,groupLevel
syn match al3Length /\d\{3\}/ contained nextgroup=al3Version

syn match locationRecord  /^5LAG/ contained
syn match buildingRecord  /^5SLC/ contained
syn match soiRecord  /^6SOI/ contained
syn match packageRecord  /^5PIG/ contained
syn match coverageRecord  /^6COL\|5DCV\|5PIN/ contained
syn match glRecord  /^6GLC/ contained
syn match policyInfoRecord  /^5BPI/ contained
syn match groupLevel /[A-Z]\d/ nextgroup=groupIteration contained
syn match groupIteration /\d\{4\}/ contained
syn cluster baseGroupInfo contains=al3Group,al3Length,al3Version,groupLevel,groupIteration 
syn cluster parentInfo contains=al3Group,groupLevel,groupIteration

hi def link groupLevel Function
hi def link groupIteration Number
hi def link locationRecord Identifier
hi def link buildingRecord Identifier
hi def link soiRecord Identifier
hi def link packageRecord Identifier
hi def link coverageRecord Identifier
hi def link glRecord Identifier
hi def link policyInfoRecord Title
hi def link packageRecord Title
hi def link controlGroupLine Comment
hi def link al3Length Float
hi def link al3Group Keyword
" Normal
" Boolean
" Character
" Comment
" Conditional
" Constant
" Cursor
" CursorLine
" CursorColumn
" Debug
" Define
" Delimiter
" DiffAdd
" DiffChange
" DiffDelete
" DiffText
" Directory
" ErrorMsg
" Error
" Exception
" Float
" FoldColumn
" Folded
" Function
" Identifier
" IncSearch
" Keyword
" Label
" LineNr
" Macro
" ModeMsg
" MoreMsg
" NonText
" Number
" Operator
" PreCondit
" PreProc
" Question
" Repeat
" Search
" SpecialChar
" SpecialComment
" Special
" SpecialKey
" Statement
" StatusLine
" StatusLineNC
" StorageClass
" String
" Structure
" Tag
" Title
" Todo
" Typedef
" Type
" Underlined
" VertSplit
" VisualNOS
" WarningMsg
" WildMenu
