defmodule Benchmark do
  @moduledoc """
  Simple function timing.
  """

  @doc """
  Get the number of seconds a function takes to run.
  """
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
