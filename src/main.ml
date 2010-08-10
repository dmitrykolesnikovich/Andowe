let parse_error s lexbuf =
    let pos = lexbuf.Lexing.lex_curr_p in 
    let linenum = pos.Lexing.pos_lnum in
    print_endline ("Error on line " ^ (string_of_int linenum) ^ ":");
    print_endline s

let main () =
    print_endline "Andowe 0.0.0";
    let lexbuf = Lexing.from_channel stdin in
    try
        Parser.parse Lexer.lex_cache lexbuf;
        print_endline "Program is syntactically correct"
    with Message.Error s ->
        parse_error s lexbuf
        | Parser.Error ->
            parse_error "Syntax error" lexbuf
        | End_of_file ->
                print_endline ""

let _ = Printexc.print main ()
