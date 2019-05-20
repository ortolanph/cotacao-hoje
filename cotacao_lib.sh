#!/usr/bin/env sh

function obterCotaca() {
  MOEDA=$1
  echo $(curl $CURL_PARAMETERS $SOURCE_DATA$MOEDA$SOURCE_COMMON_SUFFIX)
}

function oterDataDeTimestamp() {
  echo $(date -d @$1)
}

function obterCampoDoJSON() {
  MOEDA=$1
  CAMPO=$2
  echo $(jq $JQ_OUTPUT .$MOEDA$CAMPO)
}

function imprimirDadosCotacao() {
  echo $SAIDA_CONSOLE <<EOF
Valor moeda:

$COTACAO_NAME - ($COTACAO_CODE)
----------------------------------------------
Máximo      $COTACAO_MAXIMO
Mínimo      $COTACAO_MINIMO
Compra      $COTACAO_COMPRA
Venda       $COTACAO_VENDA

Atualizado em: $(obterDataDeTimestamp $COTACAO_TIMESTAMP)

EOF
}
