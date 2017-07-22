// com efeito colateral
contador = 0
function incremento(){
  contador++;
}
incremento();
console.log(contador); // 1

// sem efeito colateral
function incremento_puro(contador){
  return contador + 1;
}
novo_contador = incremento_puro(contador);
console.log(novo_contador) // 2
console.log(contador) // 1

