let version = "1.0"
let build_info = "RWO"

let run_command =
  Command.basic
    ~summary:"Run Advent of Code Solution."
    ~readme:(fun () -> "Runs the specified day and part of Advent of Code.")
    (let%map_open.Command day = flag "-day" (required int) ~doc:"DAY the day to run."
     and part = flag "-part" (required int) ~doc:"PART the part to run."
     and from_file =
       flag "-from-file" no_arg ~doc:"whether to read input from file in input/."
     in
     fun () ->
       try
         match from_file with
         | true ->
           let result = Runner.run day part in
           print_endline result
         | false ->
           let input = In_channel.input_all In_channel.stdin in
           let result = Runner.run_with_input day part input in
           print_endline result
       with
       | Failure msg -> print_endline msg
       | _ -> print_endline "An unknown error occurred.")
;;

let () = Command_unix.run ~version ~build_info run_command
