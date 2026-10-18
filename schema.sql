/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     09/12/2025 12:16:54                          */
/*==============================================================*/


alter table AVALIACAO_CLIENTE
   drop constraint FK_AVALIACA_REALIZA_ENTREGA;

alter table AVALIACAO_MOTORISTA
   drop constraint FK_AVALIACA_EFETUA_ENTREGA;

alter table CANCELAMENTO
   drop constraint FK_CANCELAM_PODE_TER2_RESERVA;

alter table CONTA
   drop constraint FK_CONTA_POSSUI_CLIENTE;

alter table ENTREGA
   drop constraint FK_ENTREGA_TEM_RECOLHA;

alter table PAGAMENTO_CLIENTE
   drop constraint FK_PAGAMENT_ABARCA_RESERVA;

alter table PAGAMENTO_MOTORISTA
   drop constraint FK_PAGAMENT_CONTIDO_ENTREGA;

alter table PEDIDO
   drop constraint FK_PEDIDO_E_ASSOCIA_RESERVA;

alter table PEDIDO
   drop constraint FK_PEDIDO_FAZ_CONTA;

alter table RECOLHA
   drop constraint FK_RECOLHA_INCLUI2_RESERVA;

alter table RESERVA
   drop constraint FK_RESERVA_E_ATRIBUI_MOTORIST;

drop table AVALIACAO_CLIENTE cascade constraints;

drop table AVALIACAO_MOTORISTA cascade constraints;

drop table CANCELAMENTO cascade constraints;

drop table CLIENTE cascade constraints;

drop table CONTA cascade constraints;

drop table ENTREGA cascade constraints;

drop table MOTORISTA cascade constraints;

drop table PAGAMENTO_CLIENTE cascade constraints;

drop table PAGAMENTO_MOTORISTA cascade constraints;

drop table PEDIDO cascade constraints;

drop table RECOLHA cascade constraints;

drop table RESERVA cascade constraints;

/*==============================================================*/
/* Table: AVALIACAO_CLIENTE                                     */
/*==============================================================*/
create table AVALIACAO_CLIENTE 
(
   ID_AVALIACAO_CLIENTE NUMBER               not null,
   ID_ENTREGA           NUMBER,
   NOTA_MOTORISTA       FLOAT,
   constraint PK_AVALIACAO_CLIENTE primary key (ID_AVALIACAO_CLIENTE)
);

/*==============================================================*/
/* Table: AVALIACAO_MOTORISTA                                   */
/*==============================================================*/
create table AVALIACAO_MOTORISTA 
(
   ID_AVALIACAO_MOTORISTA NUMBER               not null,
   ID_ENTREGA           NUMBER,
   NOTA_CLIENTE         FLOAT,
   constraint PK_AVALIACAO_MOTORISTA primary key (ID_AVALIACAO_MOTORISTA)
);

/*==============================================================*/
/* Table: CANCELAMENTO                                          */
/*==============================================================*/
create table CANCELAMENTO 
(
   ID_CANCELAMENTO      NUMBER               not null,
   ID_RESERVA           NUMBER,
   CLIENTE_CANCEL       SMALLINT             not null,
   MOTORISTA_CANCEL     SMALLINT             not null,
   MOTIVO_CANCELAMENTO  VARCHAR2(500),
   constraint PK_CANCELAMENTO primary key (ID_CANCELAMENTO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           NUMBER               not null,
   DATA_ATUAL_CLIENTE   DATE,
   AVALIACAO_CLIENTE    FLOAT,
   LOCAL_ATUAL_CLIENTE  VARCHAR2(255),
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CONTA                                                 */
/*==============================================================*/
create table CONTA 
(
   ID_CONTA             NUMBER               not null,
   ID_CLIENTE           NUMBER,
   NOME                 VARCHAR2(100)        not null,
   GENERO               VARCHAR2(10),
   N_TEL                NUMBER               not null,
   EMAIL                VARCHAR2(255)        not null,
   PASSWORD             VARCHAR2(255)        not null,
   constraint PK_CONTA primary key (ID_CONTA)
);

/*==============================================================*/
/* Table: ENTREGA                                               */
/*==============================================================*/
create table ENTREGA 
(
   ID_ENTREGA           NUMBER               not null,
   ID_RECOLHA           NUMBER,
   DATA_ENTREGA         DATE                 not null,
   LOCAL_ENTREGA        VARCHAR2(255)        not null,
   constraint PK_ENTREGA primary key (ID_ENTREGA)
);

/*==============================================================*/
/* Table: MOTORISTA                                             */
/*==============================================================*/
create table MOTORISTA 
(
   ID_MOTORISTA         NUMBER               not null,
   LOCAL_ATUAL_MOTORISTA VARCHAR2(255),
   AVALIACAO_MOTORISTA  FLOAT,
   DATA_ATUAL_MOTORISTA DATE,
   N_LUGARES            NUMBER(1),
   COR                  VARCHAR2(15),
   MATRICULA            VARCHAR2(15),
   TIPO                 VARCHAR2(30),
   MARCA                VARCHAR2(30),
   MODELO               VARCHAR2(30),
   constraint PK_MOTORISTA primary key (ID_MOTORISTA)
);

/*==============================================================*/
/* Table: PAGAMENTO_CLIENTE                                     */
/*==============================================================*/
create table PAGAMENTO_CLIENTE 
(
   ID_PAGAMENTO_CLIENTE NUMBER               not null,
   ID_RESERVA           NUMBER,
   METODO_PAG           VARCHAR2(30)         not null,
   constraint PK_PAGAMENTO_CLIENTE primary key (ID_PAGAMENTO_CLIENTE)
);

/*==============================================================*/
/* Table: PAGAMENTO_MOTORISTA                                   */
/*==============================================================*/
create table PAGAMENTO_MOTORISTA 
(
   ID_PAGAMENTO_MOTORISTA NUMBER               not null,
   ID_ENTREGA           NUMBER,
   VALOR                FLOAT                not null,
   constraint PK_PAGAMENTO_MOTORISTA primary key (ID_PAGAMENTO_MOTORISTA)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO 
(
   ID_PEDIDO            NUMBER               not null,
   ID_RESERVA           NUMBER               not null,
   ID_CONTA             NUMBER,
   LOCAL_RECOLHA_PEDIDO VARCHAR2(255)        not null,
   TIPO                 VARCHAR2(30)         not null,
   VALOR                FLOAT                not null,
   DATA_PEDIDO          DATE                 not null,
   constraint PK_PEDIDO primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Table: RECOLHA                                               */
/*==============================================================*/
create table RECOLHA 
(
   ID_RECOLHA           NUMBER               not null,
   ID_RESERVA           NUMBER               not null,
   DATA_RECOLHA         DATE                 not null,
   LOCAL_RECOLHA        VARCHAR2(255)        not null,
   constraint PK_RECOLHA primary key (ID_RECOLHA)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA 
(
   ID_RESERVA           NUMBER               not null,
   ID_MOTORISTA         NUMBER,
   DISTANCIA            FLOAT                not null,
   AVG_VTAT             FLOAT,
   AVG_CTAT             FLOAT,
   ESTADO               VARCHAR2(30)         not null,
   DATA_RESERVA         DATE                 not null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

alter table AVALIACAO_CLIENTE
   add constraint FK_AVALIACA_REALIZA_ENTREGA foreign key (ID_ENTREGA)
      references ENTREGA (ID_ENTREGA);

alter table AVALIACAO_MOTORISTA
   add constraint FK_AVALIACA_EFETUA_ENTREGA foreign key (ID_ENTREGA)
      references ENTREGA (ID_ENTREGA);

alter table CANCELAMENTO
   add constraint FK_CANCELAM_PODE_TER2_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table CONTA
   add constraint FK_CONTA_POSSUI_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE);

alter table ENTREGA
   add constraint FK_ENTREGA_TEM_RECOLHA foreign key (ID_RECOLHA)
      references RECOLHA (ID_RECOLHA);

alter table PAGAMENTO_CLIENTE
   add constraint FK_PAGAMENT_ABARCA_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table PAGAMENTO_MOTORISTA
   add constraint FK_PAGAMENT_CONTIDO_ENTREGA foreign key (ID_ENTREGA)
      references ENTREGA (ID_ENTREGA);

alter table PEDIDO
   add constraint FK_PEDIDO_E_ASSOCIA_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table PEDIDO
   add constraint FK_PEDIDO_FAZ_CONTA foreign key (ID_CONTA)
      references CONTA (ID_CONTA);

alter table RECOLHA
   add constraint FK_RECOLHA_INCLUI2_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA);

alter table RESERVA
   add constraint FK_RESERVA_E_ATRIBUI_MOTORIST foreign key (ID_MOTORISTA)
      references MOTORISTA (ID_MOTORISTA);

