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
  JSON=$3
  echo $(echo $JSON | jq $JQ_OUTPUT .$MOEDA$CAMPO)
}

function imprimirDadosCotacao() {
  MOEDA=$1
  JSON=$2

  COTACAO_NAME=$(obterCampoDoJSON $MOEDA $JQ_EXPR_NAME $JSON)
  COTACAO_CODE=$(obterCampoDoJSON )

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
