" Vim syntax file
"

if exists ("b:current_syntax")
  finish
endif

syn match locationRecord  /5LAG/
syn match buildingRecord  /5SLC/
syn match soiRecord  /6SOI/
syn match packageRecord  /5PIG/
syn match coverageRecord  /6COL\|5DCV\|5PIN/
syn match glRecord  /6GLC/
syn match policyInfoRecord  /5BPI/
syn match locationNumber /\d[A-Z]\{3\}\d\{4\}/hs=s+4
syn match header /^.\{48\}/

hi def link locationRecord Keyword
hi def link locationNumber Identifier
hi def link buildingRecord Keyword
hi def link soiRecord Keyword
hi def link packageRecord Keyword
hi def link coverageRecord Keyword
hi def link glRecord Keyword
hi def link policyInfoRecord Title
hi def link header Comment 
