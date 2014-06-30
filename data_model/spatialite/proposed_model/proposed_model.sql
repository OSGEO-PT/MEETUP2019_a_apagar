-- SQL DDL commands for the database structured mandated by the Technical
-- Paper on portuguese Plano Director Municipal
-- This file assumes a Spatialite database will be created

-- for each table, be sure to include:
-- proper comments
-- * creation of indexes
-- * creatio of spatial columns
-- * appropriate triggers
-- * appropriate restrictions

--
-- table Entidade
--

DROP TABLE IF EXISTS Entidade;

CREATE TABLE Entidade (
    -- Physical entities being represented in the object catalogue

    identificador INTEGER NOT NULL,
    dtcc TEXT NOT NULL,
    designacao TEXT,

    CONSTRAINT pk_ent
        PRIMARY KEY (identificador)
);

--
-- table ObjectoCatalogo
--

DROP TABLE IF EXISTS ObjectoCatalogo;

CREATE TABLE ObjectoCatalogo (
    -- Object types being drawn

    indice_sequencial INTEGER NOT NULL,
    entidade INTEGER NOT NULL,
    simbologia TEXT, -- to be replaced by an XmlBlob

    CONSTRAINT pk_objcat
        PRIMARY KEY (indice_sequencial),
    CONSTRAINT fk_objcat_ent
        FOREIGN KEY (entidade) 
            REFERENCES Entidade
);

DROP INDEX IF EXISTS idx_objcat_ent;

CREATE INDEX idx_objcat_ent ON ObjectoCatalogo (entidade);

--
-- table MudancaEstado
--

DROP TABLE IF EXISTS MudancaEstado;

CREATE TABLE MudancaEstado (
    -- Object types being drawn

    identificador INTEGER NOT NULL,
    objecto INTEGER NOT NULL,
    designacao TEXT NOT NULL,
    diploma_acto_pdm TEXT NOT NULL,
    data_acto_pdm TEXT NOT NULL,
    observacoes TEXT,

    CONSTRAINT pk_mudest
        PRIMARY KEY (identificador),
    CONSTRAINT fk_mudest_objcat
        FOREIGN KEY (objecto) 
            REFERENCES ObjectoCatalogo,
    CONSTRAINT check_mudest_des
        CHECK (designacao IN ('Activo', 'Alteracao',
                              'Alteracao por adaptacao',
                              'Alteracao simplificada',
                              'Correcao material',
                              'Rectificacao')),
    CONSTRAINT check_mudest_data
        CHECK (data_acto_pdm == strftime('%Y-%m-%d', data_acto_pdm))
);

DROP INDEX IF EXISTS idx_mudest_objcat;

CREATE INDEX idx_mudest_objcat ON MudancaEstado (objecto);

--
-- table TemaCondicionante
--

DROP TABLE IF EXISTS TemaCondicionante;

CREATE TABLE TemaCondicionante (
    -- Object types being drawn

    identificador INTEGER NOT NULL,
    designacao TEXT,
    subtema TEXT,

    CONSTRAINT pk_temcon
        PRIMARY KEY (identificador)
);

--
-- table ObjectoCondicionante
--

DROP TABLE IF EXISTS ObjectoCondicionante;

CREATE TABLE ObjectoCondicionante (

    objecto INTEGER NOT NULL,
    tema INTEGER NOT NULL,
    designacao TEXT,

    CONSTRAINT pk_objcon
        PRIMARY KEY (objecto),
    CONSTRAINT fk_objcon_objcat
        FOREIGN KEY (objecto) 
            REFERENCES ObjectoCatalogo,
    CONSTRAINT fk_objcon_temcon
        FOREIGN KEY (tema) 
            REFERENCES TemaCondicionante
);

DROP INDEX IF EXISTS idx_objcon_temcon;

CREATE INDEX idx_objcon_temcon ON ObjectoCondicionante (tema);

--
-- table LegislacaoAssociada
--

DROP TABLE IF EXISTS LegislacaoAssociada;

CREATE TABLE LegislacaoAssociada (

    identificador INTEGER NOT NULL,
    objecto INTEGER NOT NULL,
    diploma_especifico TEXT NOT NULL,
    observacoes TEXT,

    CONSTRAINT pk_legass
        PRIMARY KEY (identificador),
    CONSTRAINT fk_legass_objcon
        FOREIGN KEY (objecto) 
            REFERENCES ObjectoCatalogo
);

DROP INDEX IF EXISTS idx_legass_objcon;

CREATE INDEX idx_legass_objcon ON LegislacaoAssociada (objecto);

--
-- table PlanoDirectorMunicipal
--

DROP TABLE IF EXISTS PlanoDirectorMunicipal;

CREATE TABLE PlanoDirectorMunicipal (

    identificador INTEGER NOT NULL,
    publicacao TEXT NOT NULL,
    versao TEXT NOT NULL,

    CONSTRAINT pk_pdm
        PRIMARY KEY (identificador),
    CONSTRAINT check_pdm_data
        CHECK (publicacao == strftime('%Y-%m-%d', publicacao))
);

--
-- table PlantaCondicionantes
--

DROP TABLE IF EXISTS PlantaCondicionantes;

CREATE TABLE PlantaCondicionantes (

    identificador INTEGER NOT NULL,
    pdm INTEGER NOT NULL,
    publicacao TEXT NOT NULL,
    revisao TEXT NOT NULL,

    CONSTRAINT pk_plcon
        PRIMARY KEY (identificador),
    CONSTRAINT fk_plcon_pdm
        FOREIGN KEY (pdm) 
            REFERENCES PlanoDirectorMunicipal,
    CONSTRAINT check_plcon_data
        CHECK (publicacao == strftime('%Y-%m-%d', publicacao))
);

DROP INDEX IF EXISTS idx_plcon_pdm;

CREATE INDEX idx_plcon_pdm ON PlantaCondicionantes (pdm);

--
-- table ObjectoPlantaCondicionantes
--

DROP TABLE IF EXISTS ObjectoPlantaCondicionantes;

CREATE TABLE ObjectoPlantaCondicionantes (

    identificador INTEGER NOT NULL,
    planta INTEGER NOT NULL,
    objecto INTEGER NOT NULL,
    origem_informacao TEXT,
    data_informacao TEXT,
    especificacao_particular TEXT,
    etiqueta TEXT,

    CONSTRAINT pk_objplcon
        PRIMARY KEY (identificador),
    CONSTRAINT fk_objplcon_plcon
        FOREIGN KEY (planta) 
            REFERENCES PlantaCondicionantes,
    CONSTRAINT fk_objplcon_objcon
        FOREIGN KEY (objecto) 
            REFERENCES ObjectoCondicionante,
    CONSTRAINT check_objplcon
        CHECK (data_informacao == strftime('%Y-%m-%d', data_informacao))
);

DROP INDEX IF EXISTS idx_objplcon_plcon;

CREATE INDEX idx_objplcon_plcon ON ObjectoPlantaCondicionantes (planta);

DROP INDEX IF EXISTS idx_objplcon_objcon;

CREATE INDEX idx_objplcon_objcon ON ObjectoPlantaCondicionantes (objecto);

--
-- table PoligonoPlantaCondicionantes
--

DROP TABLE IF EXISTS PoligonoPlantaCondicionantes;

CREATE TABLE PoligonoPlantaCondicionantes (

    objecto INTEGER NOT NULL,

    CONSTRAINT pk_polcon
        PRIMARY KEY (objecto)
);

SELECT AddGeometryColumn('PoligonoPlantaCondicionantes', 'geom', 3763, 'POLYGON', 'XY');