#!/usr/bin/env sh

function obterCotacao() {
  MOEDA=$1
  echo $(curl -sb -H "Accept: application/json" $SOURCE_DATA$MOEDA$SOURCE_COMMON_SUFFIX)
}

function obterDataDeTimestamp() {
  echo $(date -d @$1)
}

function imprimirDadosCotacao() {
  MOEDA=$1
  JSON=$( obterCotacao $1 )

  COTACAO_NAME=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_NAME)
  COTACAO_CODE=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_CODE)

  COTACAO_MAXIMO=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_HIGH)
  COTACAO_MINIMO=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_LOW)
  COTACAO_COMPRA=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_BID)
  COTACAO_VENDA=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_ASK)

  COTACAO_TIMESTAMP=$(echo $JSON | jq --raw-output .$MOEDA$JQ_EXPR_TIMESTAMP)

  echo "$COTACAO_NAME - ($COTACAO_CODE)"
  echo "----------------------------------------------"
  echo "Máximo      R\$ $COTACAO_MAXIMO"
  echo "Mínimo      R\$ $COTACAO_MINIMO"
  echo "Compra      R\$ $COTACAO_COMPRA"
  echo "Venda       R\$ $COTACAO_VENDA"
  echo
  echo "Atualizado em: $(obterDataDeTimestamp $COTACAO_TIMESTAMP)"
}
