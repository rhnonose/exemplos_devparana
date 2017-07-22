//"Função" para filtrar valores ímpares
​public​ List<Integer> filtraImpares(List<Integer> lista) {
​  List<Integer> listaFiltrada = ​new​ ArrayList<Integer>();
​
  ​for​(Integer elemento : lista) {
​    ​if​(1 == elemento % 2) {
​      listaFiltrada.add(elemento);
​    }
​  }
  return listaFiltrada;
}

//"Função" com lógica parametrizada
​public​ List<Integer> filtra(List<Integer> lista, Predicado predicado) {
​  List<Integer> listaFiltrada = ​new​ ArrayList<Integer>();
​ 
    ​for​ (Integer elemento : lista) {
​        ​if​ (predicado.avaliar(elemento)) {
​            listaFiltrada.add(elemento);
​        }
​    }
​    ​return​ listaFiltrada;
​}

public​ ​interface​ Predicado {
    public​ ​boolean​ avaliar(Integer argumento);
}

​​class​ EhPar ​implements​ Predicado {
​
    ​public​ ​boolean​ avaliar(Integer argumento) {
​        ​return​ 0 == argumento % 2;
​    }
}

​class​ EhImpar ​implements​ Predicado {
​
    ​public​ ​boolean​ avaliar(Integer argumento) {
​        ​return​ 1 == argumento % 2;
​    }
​}

filtra(Arrays.asList(1,2,3,4), new EhPar());
filtra(Arrays.asList(1,2,3,4), new EhImpar());

//Java 8
Arrays
  .asList("elm", "elixir", "scala", "clojure", "haskell")
  .stream()
  .filter(str -> !"elixir".equals(str))
  .collect(Collectors.toList());


//fibonacci iterativo
static int fibo_iter(int n) {
    int x = 0, y = 1, z = 1;
    for (int i = 0; i < n; i++) {
        x = y;
        y = z;
        z = x + y;
    }
    return x;
}

//fibonacci recursivo
static int fibo_recur(int  n) {
    if ((n == 1) || (n == 0)) {
        return n;
    }
    return fibo_recur(n - 1) + fibo_recur(n - 2);
}
