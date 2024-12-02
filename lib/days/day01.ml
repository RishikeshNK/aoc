let parse input =
  let parse_line line =
    match String.split_on_char ' ' line |> List.filter (( <> ) "") with
    | [ a; b ] -> int_of_string a, int_of_string b
    | _ -> failwith "Invalid input"
  in
  input |> String.split_on_char '\n' |> List.map parse_line |> List.split
;;

let part1 input =
  let l, r = parse input in
  List.combine (List.sort compare l) (List.sort compare r)
  |> List.fold_left (fun acc (x, y) -> acc + abs (x - y)) 0
  |> string_of_int
;;

let part2 input =
  let count num list =
    List.fold_left (fun acc x -> if x = num then acc + 1 else acc) 0 list
  in
  let l, r = parse input in
  List.fold_left (fun acc x -> acc + (x * count x r)) 0 l |> string_of_int
;;
