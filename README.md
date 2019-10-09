NormaPDM2QGIS 2019
==================

Oficina de Dados Abertos, 3 e 4 de outubro 2019, Águeda

Contributos iniciais:

•	Carlos Lima (Município de Águeda)

•	Catarina Pinheiro (Município de Vale de Cambra)

•	Manuel Venâncio Jesus (Município de Águeda)

•	Rute Santos (Município de Vale de Cambra)

•	Sandra Lopes (Município de Mealhada)

•	Sandra Santos (CCDRC)

•	Zulmira Duarte (CCDRC)


Descrição
---------
Aplicação da Norma técnica sobre o Modelo de Dados e Sistematização da Informação Gráfica dos Planos Diretores Municipais – Documento de trabalho datado de 23 maio 2019 - no QGIS.

Objetivos
----------
Facilitar o trabalho das Câmara Municipais e dos Gabinetes/Equipas Técnicas na utilização do QGIS para a elaboração/revisão dos Planos Municipais de Ordenamento do Território, nomeadamente dos Planos Diretores Municipais e Planos de Urbanização, através de:

- Construção da simbologia oficial tal como explanada na Norma Técnica;
- Criação dos scripts necessários para construção da base de dados;
- Cumprir ao máximo os requisitos da Norma Técnica sobre o Modelo de Dados para o PDM;
- Utilizar formatos abertos que potenciem a interoperabilidade entre diversas ferramentas;
- Utilizar recursos abertos que possam ser usados livremente para os fins pretendidos. Um exemplo claro é a utilização de símbolos cartográficos que tenham licenças que permitam a sua utilização;
- Utilizar ferramentas de código aberto que possam ser adaptadas e mantidas se for necessário;
- Facilitar o acesso em múltiplas plataformas (web, móvel, linux, windows, macOS);
- Facilitar o acesso por parte de utilizadores menos experientes.

Este objetivos deste projeto são ambiciosos e no âmbito da Oficina de Dados Abertos, 3 e 4 de outubro, 2019, Águeda o trabalho incidiu no primeiro objetivo, a Construção, em QGIS, da simbologia oficial da Norma Técnica.

Ao explorar a norma deparamo-nos com o facto de faltar simbologia para a Carta da REN e para as Faixas de salvaguarda (…) dos POC (no caso da Região Centro, POC-OMG).

Assim, tendo em conta o Artigo 4.º do Decreto-Lei n.º 124/2019, de 28 de agosto, que altera o regime jurídico da Reserva Ecológica Nacional (REN), realizámos a construção de uma proposta de simbologia para as tipologias de Áreas integradas em REN. Uma vez que essas áreas estão divididas em três grupos:

- Áreas de Proteção do Litoral (APL)
- Áreas relevantes para a sustentabilidade do Ciclo Hidrológico terrestre (ACH)
- Áreas de Prevenção de Riscos naturais (APR)

Optámos ao criar as diferentes simbologias utilizar uma cor dominante para cada um dos grupos. Assim as Áreas de Proteção do Litoral (APL) ficaram com a cor amarelo-torrada (que faz lembrar as praias), as Áreas da sustentabilidade do Ciclo Hidrológico terrestre (ACH) com a cor azul (que faz lembrar a água) e as Áreas de Prevenção de Riscos naturais (APR) com a cor vermelha (que associamos a perigo).

Foram criadas 30 simbologias para a REN:

Áreas relevantes para a sustentabilidade do ciclo hidrológico - ACH (10 simbologias)

- ACH Albufeiras (leitos)
- ACH Albufeiras (margens)
- ACH Albufeiras (faixas de proteção)
- ACH Cursos de água (leitos)
- ACH Cursos de água (leitos) (Linha)
- ACH Cursos de água (margens)
- ACH Lagoas e lagos (faixas de proteção)
- ACH Lagoas e lagos (leitos)
- ACH Lagoas e lagos (margens)
- ACH Áreas estratégicas de infiltração e de proteção e recarga de aquíferos

Áreas de proteção do litoral – APL (14 simbologias)

- APL Arribas e respetivas faixas de proteção
- APL Barreiras detríticas
- APL Dunas costeiras (interiores)
- APL Dunas costeiras (litorais)
- APL Dunas fósseis
- APL Faixa marítima de proteção costeira
- APL Faixa terrestre de proteção costeira
- APL Ilhéus e rochedos emersos no mar
- APL Praias
- APL Sapais
- APL Tômbolos
- APL Águas de transição (faixas de proteção)
- APL Águas de transição (leitos)
- APL Águas de transição (margens)

Áreas de prevenção de riscos naturais – APR (6 simbologias)

- APR Zonas adjacentes
- APR Zonas ameaçadas pelas cheias
- APR Zonas ameaçadas pelo mar
- APR Áreas de elevado risco de erosão hídrica do solo
- APR Áreas de instabilidade de vertentes (AIV)
- APR Áreas de instabilidade de vertentes (Escarpas)


Documentos de apoio
-------------------
Norma técnica sobre o modelo de dados e sistematização da informação gráfica dos planos diretores municipais
Anexo I - Catálogo de objetos do plano, com a organização dos objetos na planta de ordenamento (Anexo I-A) e na planta de condicionantes (Anexo I-B);
Anexo II - Estrutura da base de dados geográfica das plantas que constituem o PDM;
Anexo III - Catálogo de simbologia, com as características gráficas dos objetos, a utilizar na elaboração das plantas.


Tecnologias
-----------
### Base de dados

Pretende-se utilizar um Sistema de Gestão de Base de Dados (SGBD) geo-relacional. Todas as opções em análise são suportadas pelo QGIS.

#### PostGIS ([http://postgis.net/](http://postgis.net/))
- SGBD robusto;
- Arquitetura cliente/servidor;
- Apropriado para instalações em larga escala, com utilização concorrente;
- A instalação e configuração é mais complexa do que as restantes ferramentas;
- Implementa inúmeras funções espaciais;
- Implementa o modelo Simple Features do OGC;
- Permite guardar simbologia SLD e QGS diretamente na base de dados.

### Simbologia

#### Formato XML
- Standard OGC para representação gráfica de elementos;
- Utilizado em muitos software SIG, proeminentemente no GeoServer.

Licença
-----------
Todos os ficheiros que se encontram neste repositório são software livre; pode ser redistribuido e/ou modificado [nos termos da Licença Pública Geral GNU versão 2 (GPL2)](http://www.gnu.org/licenses/gpl-2.0.txt) como publicada pela [Fundação do Software Livre (FSF)](http://www.fsf.org/).
