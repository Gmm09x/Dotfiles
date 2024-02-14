" Define a command to toggle comment status of selected lines
command! -range Comment call ToggleComment(<line1>, <line2>)

function! ToggleComment(line1, line2)
    let comment_char = '#'

    " Iterate over the selected range of lines
    for line in range(a:line1, a:line2)
        " Check if the line is already commented
        if getline(line) =~ '^\s*'.comment_char
            " Uncomment the line by removing the comment character
            execute line . 's/^'.comment_char.'\s*//e'
        else
            " Comment the line by adding the comment character
            execute line . 's/^/'.comment_char.' /'
        endif
    endfor
endfunction

