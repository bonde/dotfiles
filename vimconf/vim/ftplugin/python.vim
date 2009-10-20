function PySpacesCfg()
  setlocal expandtab
  setlocal tabstop=8
  setlocal softtabstop=4
  setlocal shiftwidth=4
endfunction

function PyTabsCfg()
  setlocal noexpandtab
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
endfunction

function PyIsTabIndent()
  let lnum = 1
  let got_cols = 0  " 1 if previous lines ended with columns
  while lnum <= 100
    let line = getline(lnum)
    let lnum = lnum + 1
    if got_cols == 1
      if line =~ "^\t\t"  " two tabs to prevent false positives
        return 1
      endif
    endif
    if line =~ ":\s*$"
      let got_cols = 1
    else
      let got_cols = 0
    endif
  endwhile
  return 0
endfunction

"function PyIndentAutoCfg()
if PyIsTabIndent()
  call PyTabsCfg()
else
  call PySpacesCfg()
endif
"endfunction
