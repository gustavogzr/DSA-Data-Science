# Instalação do Apache Spark

## Instalação do Apache Spark no Windows via PySpark

### Pré-requisitos

- Interpretador Python 3.8+
- Java 8/11/17

### Instalação do Java e do PySpark

Vou utilizar o Eclipse Temurin como JDK 17 (x64).

Conferindo as versões do Java e do Python:

```bash
java -version
python --version
```

Instalação do PySpark via pip:

```bash
pip install pyspark
pyspark # para testar a instalação
```

Se aparecer a mensagem de erro `Python não encontrado; execute sem argumentos para instalar na Microsoft Store ou desabilite este atalho a partir de Configurações > Gerenciar Aliases de Execução do Aplicativo.`, siga os seguintes passos:

1. Na barra de pesquisa do Windows, digite `Gerenciar Aliases de Execução do Aplicativo` e clique na opção que aparecer.
2. Desabilite a opção `Python` e `Python3`.

Se aparecer a mensagem de erro `Missing Python executable 'python3'`, siga os seguintes passos:

1. Procurar por `Editar as variáveis de ambiente do sistema` na barra de pesquisa do Windows.
2. Adicionar a variável `PYSPARK_DRIVER_PYTHON` com o valor `python`.
