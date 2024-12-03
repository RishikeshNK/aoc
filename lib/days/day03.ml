let find_all_matches str pattern =
  let regex = Re2.create_exn pattern in
  Re2.find_all_exn regex str
;;

let extract_numbers str = find_all_matches str "(\\d+)" |> List.map int_of_string

let part1 input =
  find_all_matches input "mul\\((\\d+),(\\d+)\\)"
  |> List.map extract_numbers
  |> List.map (fun nums -> List.fold_left ( * ) 1 nums)
  |> List.fold_left ( + ) 0
  |> string_of_int
;;

let part2 input =
  let matches = find_all_matches input "do\\(\\)|don't\\(\\)|mul\\((\\d+),(\\d+)\\)" in
  let rec aux acc enabled = function
    | [] -> acc
    | "do()" :: rest -> aux acc true rest
    | "don't()" :: rest -> aux acc false rest
    | hd :: tl ->
      let nums = extract_numbers hd in
      let product = List.fold_left ( * ) 1 nums in
      if enabled then aux (acc + product) enabled tl else aux acc enabled tl
  in
  aux 0 true matches |> string_of_int
;;
