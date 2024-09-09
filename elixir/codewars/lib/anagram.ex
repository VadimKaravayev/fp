defmodule Anagram do
  def anagram?(a, b) do
    normalize(a) == normalize(b)
  end

  defp normalize(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
