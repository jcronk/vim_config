" Vim syntax file
"

if exists ("b:current_syntax")
  finish
endif

syn region al3Header start=/^[5-9]/ end=/^.{29}\zs./

