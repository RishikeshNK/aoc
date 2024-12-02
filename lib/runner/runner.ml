let run_with_input day part input =
  match day, part with
  | 1, 1 -> Days.Day01.part1 input
  | 1, 2 -> Days.Day01.part2 input
  | day, part -> failwith (Printf.sprintf "Day %d, part %d not implemented" day part)
;;

let run day part =
  let path = Printf.sprintf "input/day%02d.txt" day in
  try
    let input = In_channel.read_all path in
    run_with_input day part input
  with
  | Sys_error _ -> failwith (Printf.sprintf "No input file for day %d" day)
;;
