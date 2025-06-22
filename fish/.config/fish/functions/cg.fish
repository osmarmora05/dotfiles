function cg --description "alias cg=cargo wrapper: cg r, cg t, cg b, cg c"
    switch $argv[1]
        case r
            cargo run $argv[2..]
        case t
            cargo test $argv[2..]
        case b
            cargo build $argv[2..]
        case c
            cargo check $argv[2..]
    end
end
