class Matriz
  attr_reader :linhas, :colunas  #definindo bagulhos

  # Construtor Recebe linhas e colunas como argumentos
  def initialize(linhas, colunas)
    #inicialize a variável linhas com o argumento dado
    @linhas = linhas
    #inicializa a variável colunas com o argumento dado
    @colunas = colunas
    #cria um array 2d cheio de zeros para guardar os dados
    @data = Array.new(linhas) { Array.new(colunas, 0) }
  end

  #Método para setar um valor baseado nas coordenadas dadas
  def set_valor(linha, coluna, valor)
    @data[linha][coluna] = valor
  end

  #método para get um valor na matriz baseado em suas coordenadas
  def get_valor(linha, coluna)
    @data[linha][coluna]
  end

  #método para somar uma matriz com a outra, criando uma matriz nova.
  def soma_matriz(outra_matriz)
    raise "Erro: Matrizes devem ter as mesmas dimensões." unless @linhas == outra_matriz.linhas && @colunas == outra_matriz.colunas

    resultado = Matriz.new(@linhas, @colunas)

    @linhas.times do |i|  # itera sobre linhas
      @colunas.times do |j|  # itera sobre colunas
        # Soma elementos das duas matrizes baseado em sua posição
        resultado.set_valor(i, j, @data[i][j] + outra_matriz.get_valor(i, j))
      end
    end

    # retorna a matriz somada.
    resultado
  end

  #método para mostrar a matriz
  def display_matriz
    @linhas.times do |i|
      @colunas.times do |j|
        print "#{@data[i][j]} "  # printa o elemento
      end
      puts  # para proxima linha
    end
  end
end

matriz1 = Matriz.new(2, 2)
matriz1.set_valor(0, 0, 1)
matriz1.set_valor(0, 1, 2)
matriz1.set_valor(1, 0, 3)
matriz1.set_valor(1, 1, 4)

matriz2 = Matriz.new(2, 2)
matriz2.set_valor(0, 0, 1)
matriz2.set_valor(0, 1, 2)
matriz2.set_valor(1, 0, 3)
matriz2.set_valor(1, 1, 4)

#debug
#puts "Matriz 1 dimensions: #{matriz1.linhas} x #{matriz1.colunas}"
#puts "Matriz 2 dimensions: #{matriz2.linhas} x #{matriz2.colunas}"

matrizresultado = matriz1.soma_matriz(matriz2)
matrizresultado.display_matriz()
