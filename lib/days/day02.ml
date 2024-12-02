let parse input =
  let parse_line line = String.split_on_char ' ' line |> List.map int_of_string in
  input |> String.split_on_char '\n' |> List.map parse_line
;;

let safe nums =
  let rec check increasing = function
    | x :: y :: rest ->
      let diff = y - x in
      if increasing
      then (1 <= diff && diff <= 3) && check true (y :: rest)
      else (-3 <= diff && diff <= -1) && check false (y :: rest)
    | _ -> true
  in
  check true nums || check false nums
;;

let part1 input = parse input |> List.filter safe |> List.length |> string_of_int

let part2 input =
  let damped_sublists nums =
    let rec aux acc remaining = function
      | [] -> List.rev acc
      | hd :: tl ->
        let sublist = List.rev_append remaining tl in
        aux (sublist :: acc) (hd :: remaining) tl
    in
    aux [] [] nums
  in
  let safe_with_dampener nums = safe nums || List.exists safe (damped_sublists nums) in
  parse input |> List.filter safe_with_dampener |> List.length |> string_of_int
;;
