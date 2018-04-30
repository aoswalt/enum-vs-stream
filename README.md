# Enum vs Stream

Stream is not a magic bullet to make all Enum operations faster.

## Simple Benchmarking

For simplicity and convenience, we can build a simple module to time operations using `:timer.tc`.

```elixir
defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
```

## Test Operations

For a list of integers, convert them to strings and split them into their graphemes.

#### Full Enum List

```elixir
1..1_000_000
|> Enum.map(&Integer.to_string/1)
|> Enum.map(&String.graphemes/1)
```

#### Full Stream List

```elixir
1..1_000_000
|> Stream.map(&Integer.to_string/1)
|> Stream.map(&String.graphemes/1)
|> Enum.to_list
```

The same operations with a limited output tell a different story.

#### Shortened Enum List

```elixir
1..1_000_000
|> Enum.map(&Integer.to_string/1)
|> Enum.map(&String.graphemes/1)
|> Enum.take(5)
```

#### Shortened Stream List

```elixir
1..1_000_000
|> Stream.map(&Integer.to_string/1)
|> Stream.map(&String.graphemes/1)
|> Enum.take(5)
```

## Result Observations

If the final operation acts on the entire set of data,
using `Stream` in place of `Enum` will likely lead to more time taken instead of less.

### References

* [Benchmark measure function](https://stackoverflow.com/a/29674651)
* [Talk about enum vs stream](https://www.youtube.com/watch?v=Bnqvz5W87Yo)
