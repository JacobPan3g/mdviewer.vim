" File: markdown.vim
" Author: Jacob Pan (jacobpan3g.github.com/cn)
" Version: 1.0
" Last Modified: January 16, 2019
" Copyright: Copyright (C) 2019-2024 Yegappan Lakshmanan
"            Permission is hereby granted to use and distribute this code,
"            with or without modifications, provided that this copyright
"            notice is copied with it. Like anything else that's free,
"            taglist.vim is provided *as is* and comes with no warranty of any
"            kind, either expressed or implied. In no event will the copyright
"            holder be liable for any damamges resulting from the use of this
"            software.
"
" The "mdviewer" plugin is a markdown browser plugin for Vim where taglist
" plugin has been insatalled. mdviewer provides an overview of the structure
" of the markdown files and allows you to efficiently browse through markdown
" files and has a pretty clear view of you writting.

if exists('s:TR_txt_ftpulgin')
    finish
endif
let s:TR_txt_ftpulgin=1

if !exists('Tlist_Ctags_Cmd')
	echomsg 'TxtReader: Taglist(http://www.vim.org/scripts/script.php?script_id=273) ' .
				\ 'not found. Plugin is not loaded.'
	" Skip loading the plugin
	finish
endif

if !exists('TxtReader_Ctags_Cmd')
	let TxtReader_Ctags_Cmd = Tlist_Ctags_Cmd
endif

let s:TxtReader_Config = ' --langdef=markdown --langmap=markdown:.markdown.md'
let s:TxtReader_Config .= ' --regex-markdown="/(^([A-Z][a-z]+)($|[A-Za-z0-9 \-]*( [A-Z][a-z]+)$))/\1/c,content/"' "will modify
let s:TxtReader_Config .= ' --regex-markdown="/(^=+$)/\1/c,content/"'
let s:TxtReader_Config .= ' --regex-markdown="/^#[ \t]([^ ].*)/\1/c,content/"'
let s:TxtReader_Config .= ' --regex-markdown="/^##[ \t]+(.*)/. \1/c,content/"'
let s:TxtReader_Config .= ' --regex-markdown="/^###[ \t]+(.*)/.. \1/c,content/"'
let s:TxtReader_Config .= ' --regex-markdown="/^####[ \t]+(.*)/... \1/c,content/"'
let s:TxtReader_Config .= ' --regex-markdown="/^#####[ \t]+(.*)/\1/l,Heading_L5/"'
let s:TxtReader_Config .= ' --regex-markdown="/^######[ \t]+(.*)/-> \1/s,sample/"'

let tlist_markdown_settings = 'markdown;c:content;s:sample'
let Tlist_Ctags_Cmd = TxtReader_Ctags_Cmd . s:TxtReader_Config


" specific setting
set linebreak
set textwidth=0

" format as md
nnoremap <space> i<space><esc> 
nnoremap <cr> o<esc>k
command -nargs=0 -bar TRmd exec "%s/’/'/g | %s/“/\"/g | %s/”/\"/g | %s/‘/'/g"

" make included
vnoremap <leader>` <esc>a`<esc>`<i`<esc>`>
nnoremap <leader>` viw<esc>a`<esc>`<i`<esc>`>
vnoremap <leader>* <esc>a*<esc>`<i*<esc>`>
nnoremap <leader>* viw<esc>a*<esc>`<i*<esc>`>

vnoremap <leader>cb <esc>a```<cr><esc>`<i```<cr><esc>`>

" fold marker
nnoremap {1 A {{{1<esc>
nnoremap {2 A {{{2<esc>
nnoremap {3 A {{{3<esc>
nnoremap {4 A {{{4<esc>
nnoremap {5 A {{{5<esc>
nnoremap {6 A {{{6<esc>
nnoremap {7 A {{{7<esc>
nnoremap {8 A {{{8<esc>
nnoremap {9 A {{{9<esc>

vnoremap \| :normal I  <cr>
