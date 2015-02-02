autocmd	BufNewFile *.c		call ZavattaHeader()
autocmd	BufNewFile *.cpp	call ZavattaHeader()

function!	ZavattaHeader()
	let s:zav = system("echo $USER | tr -d '\n'")
	call append( 0, "/* ========================================================================== */")
	call append( 1, "/*                                                                            */")
	call append( 2, "/*    ██╗  ██╗██████╗   █████╗ ██╗   ██╗                                      */")
	call append( 3, "/*    ██║  ██║╚════██╗ ██╔══██╗██║   ██║                                      */")
	call append( 4, "/*    ███████║ █████╔╝ ███████║██║   ██║       created by: TheScaffolder      */")
	call append( 5, "/*    ╚════██║██╔═══╝  ██╔══██║╚██╗ ██╔╝       at: 2015-02-02 00:42:02        */")
	call append( 6, "/*         ██║███████╗ ██║  ██║ ╚████╔╝                                       */")
	call append( 7, "/*         ╚═╝╚══════╝ ╚═╝  ╚═╝  ╚═══╝                                        */")
	call append( 8, "/*                                                                            */")
	call append( 9, "/* ========================================================================== */")
	call append(10, "")
	unlet s:zav
endfunction
