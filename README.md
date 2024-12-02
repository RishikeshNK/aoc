# Advent of Code

My attempt to learn OCaml by, you guessed it, solving Advent of Code 2024.

## Code Structure

- `bin/`: Contains the main executable.

- `lib/`: Houses the core logic.

  - `days/`: Individual day solutions.
  - `runner/`: Solution runner logic.

- `input/`: Input data for each day's puzzle.

- `test/`: Test suite for the project.

## Installation

1. Clone the repository

```bash
git clone https://github.com/RishikeshNK/aoc
cd aoc
```

2. Install dependencies

```bash
opam install . --deps-only
```

3. Build the project

```bash
opam build
```

## Usage

- To run a specific day's solution

  ```bash
  dune exec aoc -- -day DAY -part PART -from-file
  ```

- To run using custom input
  ```
  cat input.txt | dune exec aoc -- -day DAY -part PART
  ```
