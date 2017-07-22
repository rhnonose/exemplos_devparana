require Integer
#função anônima 1
Enum.filter([1,2,3,4], fn n -> rem(n, 2) == 0 end)
Enum.filter([1,2,3,4], fn n -> rem(n, 2) == 1 end)

#função anônima 2
Enum.filter([1,2,3,4], &(rem(&1, 2) == 0))
Enum.filter([1,2,3,4], &(rem(&1, 2) == 1))

#função existente do módulo Integer
Enum.filter([1,2,3,4], &Integer.is_even/1)
Enum.filter([1,2,3,4], &Integer.is_odd/1)


defmodule MeuEnum do

  def filter(list, function) do
    do_filter(list, function, [])
  end

  defp do_filter([], _, matches), do: matches
  defp do_filter([element | rest], function, matches) do
    if function.(element) do
      do_filter(rest, function, [element | matches])
    else
      do_filter(rest, function, matches)
    end
  end

end

defmodule Test do

  def fibo(0), do: 1
  def fibo(1), do: 1
  def fibo(n) do
    fibo(n - 1) + fibo(n - 2)
  end

  def formata_nome(nome)

end

a = 0
#declaração
incremento = fn ->
  a = a + 1
end
incremento.() # 1
a # 0

Enum.map(
  String.split(
    String.downcase(
      "ELIXIR-ELM"),
    "-"),
  &String.capitalize/1)
# ["Elixir", "Elm"]

"ELIXIR-ELM"
|> String.downcase()
|> String.split("-")
|> Enum.map(&String.capitalize/1)
# ["Elixir", "Elm"]

