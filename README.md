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

#### Spatialite ([https://www.gaia-gis.it/fossil/libspatialite/home](https://www.gaia-gis.it/fossil/libspatialite/home))
- Baseado em SQLite;
- Um único ficheiro;
- Uma espécie de PostGIS para tótós, implementando a maioria das funções espaciais, mas mais fácil de instalar:
- Suportado também em Android;
- Permite guardar simbologia SLD e QGS directamente na base de dados (XmlBlob).

#### GeoPackage ([http://www.geopackage.org/](http://www.geopackage.org/))
- Standard OGC para intercâmbio de dados;
- Pretende substituir (finalmente) o Shapefile;
- Baseado em SQLite, tal como o Spatialite, mas é mais simples de criar;
- Standard recente, mas que já é suportado pela OGR, ESRI, GeoTools.

### Simbologia
Ambas as opções em análise são suportadas pelo QGIS.

#### QGS - QGIS Layer Style format
- Formato nativo do QGIS;
- Muitas opções de representação gráfica.

#### SLD - OGC Styled Layer Descriptor
- Standard OGC para representação gráfica de elementos;
- Utilizado em muitos software SIG, proeminentemente no GeoServer.

Licença
-----------
Todos os ficheiros que se encontram neste repositório são software livre; pode ser redistribuido e/ou modificado [nos termos da Licença Pública Geral GNU versão 2 (GPL2)](http://www.gnu.org/licenses/gpl-2.0.txt) como publicada pela [Fundação do Software Livre (FSF)](http://www.fsf.org/).
