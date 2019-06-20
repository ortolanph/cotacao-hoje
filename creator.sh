#!/usr/bin/env bash

MOEDA=$1
ARQUIVO=$2

if [ -z "$MOEDA" ]
then
      echo "Necessita informar símbolo de moeda"
      exit -1
fi

if [ -z "$ARQUIVO" ]
then
      echo "Necessita informar script"
      exit -1
fi

cat > $ARQUIVO << EOF
#!/usr/bin/env bash

source lib/cotacao.conf
source lib/cotacao_lib.sh

imprimirDadosCotacao "$MOEDA"
EOF
