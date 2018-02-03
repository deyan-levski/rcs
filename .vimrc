:filetype plugin on
:filetype indent on
:syntax on
map <F1> :!ls<CR>:e
:set hlsearch
nnoremap <esc> :noh<return><esc>

nnoremap <F2> :gg=G
nnoremap <F3> :%retab! 

"set lines=50 columns=100 " set starting window size
nnoremap <F4> :VimroomToggle<CR>
nnoremap <F5> :!/usr/local/bin/markdown.pl --html4tags
nnoremap <F6> :!sh run.sh
nnoremap <F7> :!afs -f psfbin --mt 4 -q 0 control.sp
nnoremap <F8> :!spectre +mt=4 control.sp
nnoremap <F9> :!nanospice +spice -format psfascii control.sp
nnoremap <F10> :!octave --persist --no-gui
nnoremap <F11> :let &background = ( &background == "dark"? "light" : "dark" ) <CR>
au BufNewFile,BufRead *.net setlocal ft=spice
au BufNewFile,BufRead *.vcd setlocal ft=spice
au BufNewFile,BufRead *.vec setlocal ft=spice
au BufNewFile,BufRead *.sp setlocal ft=spice
au BufNewFile,BufRead *.scs setlocal ft=spice
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown



:set backup
:set backupext=.bak
:set clipboard=unnamedplus

set grepprg=grep\ -nH\ $*

colorscheme default "solarized

filetype indent on " sets automatic indentation

let g:tex_flavor='latex'


:menu OmniVision.Run\ AFS 		:!afs -f psfbin --mt 4 -q 0 control.sp <CR>
:menu OmniVision.Run\ Spectre		:!spectre +mt=4 control.sp <CR>
:menu OmniVision.Run\ NanoSpice 	:!nanospice +spice -format psfascii control.sp <CR>
:menu OmniVision.Start\ Octave		:!octave <CR>
:menu OmniVision.lmstat			:!lmstat -f <CR>
:menu OmniVision.Open\ SOS		:!sos <CR>

" map ,co O*<Esc>50*<Esc>50\|D<CR>i*<CR><Esc>i**<Esc>50a*<Esc>50\|D<Esc>kA
" map ,cos O**************************************************<CR>*<CR>**************************************************<Esc>50\|Dkk50\|DjA

" autocmd FileType sp 	let b:comment_leader = '* '
" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

nnoremap TT	:TableModeToggle <CR>
nnoremap RR	:NERDTreeToggle <CR>
nnoremap RE	:NERDTreeFind <CR>
nnoremap ``	:tabnew <CR>
nnoremap `1	:tabnext <CR>
nnoremap `2	:tabclose <CR>

nnoremap gC :'a,. s/^/\-- / <CR>

"vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
"map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>
"
"

function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  new
  setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20
  for [key,value] in items(frequencies)
    call append('$', key."\t".value)
  endfor
  sort i
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()

