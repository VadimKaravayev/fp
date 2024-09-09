defmodule BraceValidator do
  def valid_braces(braces) do
    braces
    |> String.graphemes()
    |> Enum.reduce([], &check_braces/2)
    |> Enum.empty?()
  end

  defp check_braces("(", stack), do: ["(" | stack]
  defp check_braces("{", stack), do: ["{" | stack]
  defp check_braces("[", stack), do: ["[" | stack]
  defp check_braces(")", ["(" | stack]), do: stack
  defp check_braces("}", ["{" | stack]), do: stack
  defp check_braces("]", ["[" | stack]), do: stack
  defp check_braces(x, stack), do: [x | stack]
end

#  BEST PRACTICE
# defmodule Challenge do
#   def valid_braces(braces) do
#     validate(String.codepoints(braces), [])
#   end

#   defp validate([")" | tail], ["(" | tokens]), do: validate(tail, tokens)
#   defp validate(["]" | tail], ["[" | tokens]), do: validate(tail, tokens)
#   defp validate(["}" | tail], ["{" | tokens]), do: validate(tail, tokens)
#   defp validate([head | tail], tokens) when head in ["(", "[", "{"], do: validate(tail, [head | tokens])
#   defp validate([], []), do: true
#   defp validate(_, _), do: false
# end

# defmodule Challenge do
#   def valid_braces(braces), do: valid_braces(braces, [])

#   def valid_braces("(" <> rest, opened), do: valid_braces(rest, ["(" | opened])
#   def valid_braces("[" <> rest, opened), do: valid_braces(rest, ["[" | opened])
#   def valid_braces("{" <> rest, opened), do: valid_braces(rest, ["{" | opened])

#   def valid_braces(")" <> rest, ["(" | opened]), do: valid_braces(rest, opened)
#   def valid_braces("]" <> rest, ["[" | opened]), do: valid_braces(rest, opened)
#   def valid_braces("}" <> rest, ["{" | opened]), do: valid_braces(rest, opened)

#   def valid_braces("", []), do: true
#   def valid_braces(_, _), do: false
# end
