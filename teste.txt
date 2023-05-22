defmodule Playground do
  def area(a, b), do: a * b

  defmodule Circle do
    def area(r) do
      3.14 * r * r
    end
  end

  def run, do: area(10,20)


  def tuple do
    {:ok, 1} #tuple, mais proximo de um array
  end

  def list do
    [:ok, 2, 3] #linked list, não é um array
  end

  def map do
    new_map = %{ok: 1, error: 2} #map
    # new_map = %{:ok => 1, :error => 2} # ambos modos são válidos
    new_map.ok
    # new_map[:ok] o mesmo aqui
    # da pra criar propriedades de objetos utilizando esse formato, porem não é recomendado
    # ideal seria ultilizar defmodules, assim como o Circle
    # pode-se definir metodos dentro do objeto e trata-lo como uma "classe"
  end
  def cat, do: %{name: "Garfield", age: 10, colors: ["orange", "black"]}

  def pessoa_qualquer do
    nome = "João"
    sobrenome = "Silva"
    {nome, sobrenome}
  end
end

IO.puts "Hello Mom"
range = 1..10 # range
Enum.each(range, &IO.puts/1) # each, tipo um foreach
cat = [name: "Garfield", age: 10, colors: ["orange", "black"]] # keywords, tipo um objeto ou um map
IO.puts cat[:name] # acessando propriedades do objeto
# IO.puts cat.name nao funciona com listas
date = ~D[2023-04-23] # date
IO.puts date.year # acessando propriedades do objeto
IO.puts date.month
IO.puts date.day

time = ~T[12:34:56.789] # time
IO.puts time.hour # acessando propriedades do objeto
IO.puts time.minute
IO.puts time.second
# IO.puts time.microsecond é uma tupla, IO.puts não consegue imprimir
# time.microsecond == {789, 56}

naive_datetime = ~N[2023-04-23 12:34:56.789] # naive_datetime
IO.puts naive_datetime.year # acessando propriedades do objeto
IO.puts naive_datetime.month
IO.puts naive_datetime.day
IO.puts naive_datetime.hour
IO.puts naive_datetime.minute
IO.puts naive_datetime.second
# IO.puts naive_datetime.microsecond é uma tupla, IO.puts não consegue imprimir
# naive_datetime.microsecond == {789, 56}

datetime = ~U[2023-04-23 12:34:56.789Z] # datetime
# also accepts ~U[2023-04-23 12:34:56.789+03:00]
# and DateTime.from_naive!(~N[2023-04-23 12:34:56.789], "Etc/UTC")
IO.puts datetime.time_zone # acessando propriedades do objeto



{nome, sobrenome} = Playground.pessoa_qualquer
IO.puts nome
IO.puts sobrenome
x = 10

{^x, _} = {10, 20} # ^x é uma variavel imutavel, não pode ser alterada
# nesse caso, o _ é uma variavel que não será utilizada, pode ser qualquer coisa
# nao retorna erro, pois x é igual a 10

# {^x, ^x} = {10, 20} # retorna erro, pois x é igual a 10 e nao 20
# o mesmo acontece em {^x, _} = {11, 20}, pois x é igual a 10 e nao 11

# caso queira ignorar o valor de uma variavel, pode-se utilizar o _
# {x, _} = {11, 20} não retorna erro, porém x é reatribuido para 11

# maps são um pouco diferentes
%{name: name} = %{name: "Garfield", age: 10, colors: ["orange", "black"]}
IO.puts name
# retorna Garfield
# é possivel buscar apenas um item de um map, não importando a ordem ou quantidade de itens
# %{} = %{name: "Garfield", age: 10, colors: ["orange", "black"]}
# retorna %{}
# %{age: age} = %{name: "Garfield", age: 10, colors: ["orange", "black"]}
# retorna %{age: 10}

# caso nao exista o item no map, retorna erro
# %{name: name, weight: weight} = %{name: "Garfield", age: 10, colors: ["orange", "black"]}
# retorna erro

# é possivel buscar itens dentro de itens de uma map ou lista
%{:colors => [color1, color2]} = %{name: "Garfield", age: 10, colors: ["orange", "black"]}
IO.puts color1
IO.puts color2

# numa lista de tuplas
[_, [name: name, age: age]] = [[name: "Frajola", age: 8], [name: "Garfield", age: 10]]

IO.puts name
IO.puts age

# chaining pattern matching

date_time = {_{hour, _, _}} = :calendar.local_time
IO.puts hour

# nesse caso, date_time possui o valor completo de local time e hour possui apenas a hora


defmodule Geometry do
  def area({:rectangle, w, h}) do
    w * h
  end
  def area({:square, s}) do
    s * s
  end
  def area({:circle, r}) do
    3.14 * r * r
  end
  def area({:triangle, b, h}) do
    0.5 * b * h
  end
  def area(unknown) do # caso não seja nenhum dos anteriores, lembrando sempre de colocar o mais especifico primeiro
    {:error, {:unknown_shape, unknown}}
  end
end
