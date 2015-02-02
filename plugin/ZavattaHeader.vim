autocmd	BufNewFile *.c		call ZavattaHeader()
autocmd	BufNewFile *.cpp	call ZavattaHeader()
autocmd	BufNewFile *.h		call ZavattaHeader()
autocmd	BufNewFile *.hpp	call ZavattaHeader()
autocmd	BufNewFile Makefile	call ZavattaHeaderMakefile()

function! ZavattaHeader ()
	let s:zav = system("echo $USER | tr -d '\n'")
	call append( 0, "/* ========================================================================== */")
	call append( 1, "/*                                                                            */")
	call append( 2, "/*    ██╗  ██╗██████╗   █████╗ ██╗   ██╗                                      */")
	call append( 3, "/*    ██║  ██║╚════██╗ ██╔══██╗██║   ██║                                      */")
	call LineBy()
	call LineWhen()
	call append( 6, "/*         ██║███████╗ ██║  ██║ ╚████╔╝                                       */")
	call append( 7, "/*         ╚═╝╚══════╝ ╚═╝  ╚═╝  ╚═══╝                                        */")
	call append( 8, "/*                                                                            */")
	call append( 9, "/* ========================================================================== */")
	call append(10, "")
	unlet s:zav
endfunction

function! ZavattaHeaderMakefile ()
	let s:zav = system("echo $USER | tr -d '\n'")
	call append( 0, "# ============================================================================ #")
	call append( 1, "#                                                                              #")
	call append( 2, "#    ██╗  ██╗██████╗   █████╗ ██╗   ██╗                                        #")
	call append( 3, "#    ██║  ██║╚════██╗ ██╔══██╗██║   ██║                                        #")
	call LineByMakefile()
	call LineWhenMakefile()
	call append( 6, "#         ██║███████╗ ██║  ██║ ╚████╔╝                                         #")
	call append( 7, "#         ╚═╝╚══════╝ ╚═╝  ╚═╝  ╚═══╝                                          #")
	call append( 8, "#                                                                              #")
	call append( 9, "# ============================================================================ #")
	call append(10, "")
	unlet s:zav
endfunction

function! LineBy ()
	let l:line = "/*    ███████║ █████╔╝ ███████║██║   ██║       by: "
	let l:line = l:line . s:zav

	let l:cmd = "echo " . s:zav . " | wc -c | awk '{print $1}' | tr -d '\n'"
	let l:len = system(l:cmd)
	let l:space = 27 - l:len
	while l:space >= 0
		let l:line = l:line . " "
		let l:space -= 1
	endwhile

	let l:line = l:line . "*/"
	call append( 4, l:line)
endfunction

function! LineWhen ()
	let l:line = "/*    ╚════██║██╔═══╝  ██╔══██║╚██╗ ██╔╝       at: " . strftime("%Y/%m/%d %H:%M:%S") . "        */"
	call append( 5, l:line)
endfunction

function! LineByMakefile ()
	let l:line = "#    ███████║ █████╔╝ ███████║██║   ██║       by: "
	let l:line = l:line . s:zav

	let l:cmd = "echo " . s:zav . " | wc -c | awk '{print $1}' | tr -d '\n'"
	let l:len = system(l:cmd)
	let l:space = 29 - l:len
	while l:space >= 0
		let l:line = l:line . " "
		let l:space -= 1
	endwhile

	let l:line = l:line . "#"
	call append( 4, l:line)
endfunction

function! LineWhenMakefile ()
	let l:line = "#    ╚════██║██╔═══╝  ██╔══██║╚██╗ ██╔╝       at: " . strftime("%Y/%m/%d %H:%M:%S") . "          #"
	call append( 5, l:line)
endfunction
