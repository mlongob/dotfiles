" Functions

function TrimWhitespace()
  %s/\s\+$//e
  ''
endfunction

" toggle syntax on/off
function ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

" toggle absolute/relative numbering
function ToggleNumbering()
    set relativenumber!
endfunction

" Get OS Platform
function GetPlatform()
    if has('win32') || has('win64')
        return "Windows"
    elseif has("unix")
        return substitute(system("uname"), "\n", "", "g")
    else
        return "Unknown"
    endif
endfunction
