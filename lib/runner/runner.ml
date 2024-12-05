let run_with_input day part input =
  match day, part with
  | 1, 1 -> Days.Day01.part1 input
  | 1, 2 -> Days.Day01.part2 input
  | 2, 1 -> Days.Day02.part1 input
  | 2, 2 -> Days.Day02.part2 input
  | 3, 1 -> Days.Day03.part1 input
  | 3, 2 -> Days.Day03.part2 input
  | 4, 1 -> Days.Day04.part1 input
  | 4, 2 -> Days.Day04.part2 input
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
