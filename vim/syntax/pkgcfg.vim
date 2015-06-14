"------------------------------------------------------------------------------
" $Id$
" $URL$
"------------------------------------------------------------------------------
" 
" VIM Plugin for BPKG
"
" .pkgcfg syntax highlighting
"
"------------------------------------------------------------------------------

if exists("b:current_syntax")
    finish
endif

" Comments lines are any line where the first non-whitespace character is a
" '#'
syntax match pkgcfgComment "\v#.*$" oneline

" Match section names - which begin with a full stop and must be UPPERCASE
" (can include underscores).  pkgcfgBadSectionName is for use in unrecognised
" sections so we can highlight them as errors.
syntax match pkgcfgSectionName "^\s*\.[A-Z_]\+\>" oneline contained
syntax match pkgcfgBadSectionName "^\s*\.[A-Z_]\+\>" oneline contained


" Recognise any generic section.  This must come before the rules for the
" sections that we do recgonise, as that is how vim works.
" Note that all section rules use 'me=s-1' for the end match, so that the next
" section name doesn't get swallowed.
syntax region pkgcfgUnknownSection
    \ start="\v^\s*\.[A-Z_]+.*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgBadSectionName,pkgcfgComment


" .CONTROL section.
syntax region pkgcfgControlSection
    \ start="^\s*\.CONTROL\>\s*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgDependencyLine,pkgcfgArchitecturesLine,pkgcfgBuildDirLine,pkgcfgSectionName,pkgcfgComment


syntax region pkgcfgDependencyLine
    \ start="^\s*dependency\>"
    \ end ="$"
    \ oneline contained
    \ contains=pkgcfgDependencyKeyword,pkgcfgDependencyVersion

syntax keyword pkgcfgDependencyKeyword dependency contained

syntax match pkgcfgDependencyVersion "\v-(\d+\.)+\d+"hs=s+1 contained


syntax region pkgcfgArchitecturesLine
    \ start="^\s*architectures\>"
    \ end ="$"
    \ oneline contained
    \ contains=pkgcfgArchitecturesKeyword,pkgcfgArchitectureNames

syntax keyword pkgcfgArchitecturesKeyword architectures contained

syntax keyword pkgcfgArchitectureNames ibm contained
syntax keyword pkgcfgArchitectureNames sun contained
syntax keyword pkgcfgArchitectureNames linux contained

syntax match pkgcfgBuildDirLine "^\s*\(ibm\|sun\|linux\)-build-dir " contained

" .DATA section.
syntax region pkgcfgDataSection
    \ start="^\s*\.DATA\%(\s\+\%(sun\|ibm\|linux\)\)\=\s*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgSectionName,pkgcfgComment,pkgcfgArchcode

syntax match pkgcfgArchcode "(ARCHCODE)" contained


" .EXTERNAL sections
syntax region pkgcfgExternalSection
    \ start="^\s*\.EXTERNAL\>.*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgSectionName,pkgcfgComment



" .EXTERNAL sbuild section.
syntax region pkgcfgExternalSbuildSection
    \ start="^\s*\.EXTERNAL\s\+sbuild\>\s*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgSectionName,pkgcfgComment,pkgcfgSbuildCommand

syntax match pkgcfgSbuildCommand "^\s*plink\>" contained
syntax match pkgcfgSbuildCommand "^\s*gmake\>" contained



" .SETTINGS section.
syntax region pkgcfgSettingsSection
    \ start="^\s*\.SETTINGS\>\s*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgSectionName,pkgcfgComment


" .ACTIONS section.
syntax region pkgcfgSettingsSection
    \ start="^\s*\.ACTIONS\>\s*$"
    \ end="^\s*\.[A-Z]"me=s-1 
    \ contains=pkgcfgSectionName,pkgcfgComment




highlight link pkgcfgComment Comment

highlight link pkgcfgSectionName Type
highlight link pkgcfgBadSectionName Error

highlight link pkgcfgArchitecturesKeyword Statement
highlight link pkgcfgArchitectureNames Identifier

highlight link pkgcfgDependencyKeyword Statement
highlight link pkgcfgDependencyVersion Number

highlight link pkgcfgBuildDirLine Statement

highlight link pkgcfgSbuildCommand Statement

highlight link pkgcfgArchcode  Identifier

let b:current_syntax = "pkgcfg"
