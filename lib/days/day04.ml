let parse input =
  input
  |> String.split_on_char '\n'
  |> List.map String.to_seq
  |> List.map Array.of_seq
  |> Array.of_list
;;

let check row col grid word =
  let directions = [| 1, 0; -1, 0; 0, 1; 0, -1; -1, -1; -1, 1; 1, -1; 1, 1 |] in
  let word = List.of_seq (String.to_seq word) in
  let valid row col =
    row >= 0 && row < Array.length grid && col >= 0 && col < Array.length grid.(0)
  in
  let rec aux row col direction = function
    | [] -> 1
    | x :: xs when valid row col && grid.(row).(col) = x ->
      aux (row + fst direction) (col + snd direction) direction xs
    | _ -> 0
  in
  Array.fold_left (fun acc direction -> acc + aux row col direction word) 0 directions
;;

let part1 input =
  let grid = parse input in
  let rows, cols = Array.length grid, Array.length grid.(0) in
  let indices =
    List.init rows (fun row -> List.init cols (fun col -> row, col)) |> List.concat
  in
  List.fold_left (fun count (row, col) -> count + check row col grid "XMAS") 0 indices
  |> string_of_int
;;

let part2 input =
  let grid = parse input in
  let rows, cols = Array.length grid, Array.length grid.(0) in
  let indices =
    List.init rows (fun row -> List.init cols (fun col -> row, col)) |> List.concat
  in
  let valid row col =
    row >= 1 && row < Array.length grid - 1 && col >= 1 && col < Array.length grid.(0) - 1
  in
  let aux row col =
    grid.(row).(col) = 'A'
    && valid row col
    && ((grid.(row - 1).(col - 1) = 'M' && grid.(row + 1).(col + 1) = 'S')
        || (grid.(row - 1).(col - 1) = 'S' && grid.(row + 1).(col + 1) = 'M'))
    && ((grid.(row - 1).(col + 1) = 'M' && grid.(row + 1).(col - 1) = 'S')
        || (grid.(row - 1).(col + 1) = 'S' && grid.(row + 1).(col - 1) = 'M'))
  in
  List.fold_left (fun count (row, col) -> count + if aux row col then 1 else 0) 0 indices
  |> string_of_int
;;
