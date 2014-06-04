/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/5/13 22:32:02                           */
/*==============================================================*/
DROP DATABASE IF EXISTS sisterdb;

CREATE DATABASE IF NOT EXISTS sisterdb DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE sisterdb;

drop table if exists sister_authority_aut;

drop table if exists sister_brand_brd;

drop table if exists sister_content_con;

drop table if exists sister_product_pic_prd;

drop table if exists sister_product_prd;

drop table if exists sister_user_authority_uaut;

drop table if exists sister_user_u;

drop table if exists sister_about_ab;

drop table if exists sister_message_msg;

/*==============================================================*/
/* Table: sister_authority_aut                                  */
/*==============================================================*/
create table sister_authority_aut
(
   id_aut               bigint NOT NULL AUTO_INCREMENT,
   authority_aut        varchar(64) comment '授权名称',
   type_aut             varchar(32) comment '角色类型',
   protectedres_aut     varchar(64),
   display_aut          varchar(64) comment '显示名称',
   primary key (id_aut)
);
INSERT INTO sister_authority_aut VALUES(1, "AUTH_ADMIN", "ADMIN", "AMDIN", "ADMIN"); 
INSERT INTO sister_authority_aut VALUES(2, "AUTH_ANONYMOUS", "ANONYMOUS", "ANONYMOUS", "GUEST");
INSERT INTO sister_authority_aut VALUES(3, "AUTH_USER","USER","USER","USER");
alter table sister_authority_aut comment '授权表';

/*==============================================================*/
/* Table: sister_brand_brd                                      */
/*==============================================================*/
create table sister_brand_brd
(
   id_brd               bigint NOT NULL AUTO_INCREMENT,
   name_brd             varchar(128),
   id_pic_brd           bigint comment '品牌图片',
   is_enabled_brd		bit,
   primary key (id_brd)
);

alter table sister_brand_brd comment '品牌';

/*==============================================================*/
/* Table: sister_content_con                                    */
/*==============================================================*/
create table sister_content_con
(
   id_con               bigint NOT NULL AUTO_INCREMENT,
   original_filename_con varchar(128),
   filename_con         varchar(128) comment '文件名',
   filesize_con         bigint comment '文件大小',
   mimetype_con         varchar(32) comment '类型',
   encoding_con         varchar(16) comment ' 编码',
   filepath_con         varchar(256) comment '文件路径',
   date_create_con      datetime comment '创建时间',
   src_con              varchar(32) comment '文件来源',
   primary key (id_con)
);

alter table sister_content_con comment '文件存储表';

/*==============================================================*/
/* Table: sister_product_pic_prdp                                */
/*==============================================================*/
create table sister_product_pic_prdp
(
   id_prdp               bigint NOT NULL AUTO_INCREMENT,
   id_prd_prdp           bigint,
   info_prdp             varchar(256) comment '产品图片描述',
   id_pic_prdp           bigint comment '产品图片',
   date_create_prdp      datetime comment '创建时间',
   primary key (id_prdp)
);

alter table sister_product_pic_prdp comment '产品图片';

/*==============================================================*/
/* Table: sister_product_prd                                    */
/*==============================================================*/
create table sister_product_prd
(
   id_prd               bigint NOT NULL AUTO_INCREMENT,
   name_prd             varchar(256),
   id_brd_prd           bigint,
   info_prd             varchar(8192) comment '产品描述',
   id_logo_prd           bigint comment '产品图片',
   date_create_prd      datetime comment '创建时间',
   primary key (id_prd)
);

alter table sister_product_prd comment '产品';

/*==============================================================*/
/* Table: sister_user_authority_uaut                            */
/*==============================================================*/
create table sister_user_authority_uaut
(
   id_uaut               bigint NOT NULL AUTO_INCREMENT,
   idu_uaut              bigint comment '用户id',
   idaut_uaut            bigint comment '授权id',
   PRIMARY KEY(id_uaut)
);
CREATE INDEX idx_idu_uaut ON sister_user_authority_uaut(idu_uaut);
CREATE INDEX idx_idaut_uaut ON sister_user_authority_uaut(idaut_uaut);
INSERT INTO sister_user_authority_uaut VALUES(1, 1, 1);
INSERT INTO sister_user_authority_uaut VALUES(2, 1, 3);
alter table sister_user_authority_uaut comment '用户授权表 ';

/*==============================================================*/
/* Table: sister_user_u                                         */
/*==============================================================*/
create table sister_user_u
(
   id_u                 bigint NOT NULL AUTO_INCREMENT,
   username_u           varchar(64),
   password_u           varchar(64),
   salt_u				varchar(16),
   email_u              varchar(128),
   date_register_u      datetime,
   ip_u                 varchar(16),
   referer_u            varchar(512),
   is_enabled_u         bit,
   primary key (id_u)
);
CREATE unique INDEX idx_username_u ON sister_user_u(username_u);
CREATE unique INDEX idx_email_u ON sister_user_u(email_u);
INSERT INTO sister_user_u VALUES(1,'admin' , '9cbd581a0698b3228ffc18eda8a2c730','0516','admin@knx.com', '2014-01-29 11:23:10','127.0.0.1',null,1);
INSERT INTO sister_user_u VALUES(2,'guest' , '9cbd581a0698b3228ffc18eda8a2c730','0516','guest@knx.com', '2014-01-29 11:23:10','127.0.0.1',null,0);
alter table sister_user_u comment '用户表';



/*==============================================================*/
/* Table: sister_about_ab                                      */
/*==============================================================*/
create table sister_about_ab
(
   id_ab               bigint NOT NULL AUTO_INCREMENT,
   type_ab			   enum('about','contact','news'),
   content_ab          text,
   date_create_ab      datetime,
   PRIMARY KEY(id_ab)
);

insert into sister_about_ab values (1,'about','关于我们，介绍','2014-04-12 10:00:00');
insert into sister_about_ab values (2,'contact','<p>工作时间</p><p>周一至周五</p><p>9:00~18:00</p><p>电话</p><p>010-66668888</p><p>传真</p><p>010-66668888</p><p>邮件</p><p>info@handz.com.cn</p>','2014-04-12 10:00:00');
insert into sister_about_ab values (3,'news','<p>工作时间</p><p>周一至周五</p><p>9:00~18:00</p><p>电话</p><p>010-66668888</p><p>传真</p><p>010-66668888</p><p>邮件</p><p>info@handz.com.cn</p>','2014-04-12 10:00:00');

alter table sister_about_ab comment '关于';

/*==============================================================*/
/* Table: pro_message_msg                                       */
/*==============================================================*/
create table sister_message_msg
(
   id_msg               bigint NOT NULL AUTO_INCREMENT,
   message_msg          varchar(8192) comment '留言内容',
   date_create_msg      datetime,
   ip_msg               varchar(16) comment '用户ip',
   PRIMARY KEY(id_msg)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

alter table sister_message_msg comment '留言';
