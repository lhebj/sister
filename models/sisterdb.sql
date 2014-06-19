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
INSERT INTO sister_brand_brd VALUES(1, "钻石项链", 1, 1); 
INSERT INTO sister_brand_brd VALUES(2, "手链", 2, 1);
INSERT INTO sister_brand_brd VALUES(3, "宝石", 3, 1);  
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

insert into sister_content_con values (1,'brand-1.png','brand-1.png','667648','png','utf-8','brand/2014-02-01/brand-1.png','2014-02-01 15:12:00','brand');
insert into sister_content_con values (2,'brand-2.png','brand-2.png','667648','png','utf-8','brand/2014-02-01/brand-2.png','2014-02-01 15:12:00','brand');
insert into sister_content_con values (3,'brand-3.png','brand-3.png','667648','png','utf-8','brand/2014-02-01/brand-3.png','2014-02-01 15:12:00','brand');
insert into sister_content_con values (4,'brand-4.png','brand-4.png','667648','png','utf-8','brand/2014-02-01/brand-4.png','2014-02-01 15:12:00','brand');

insert into sister_content_con values (5,'b1p1-logo.png','b1p1-logo.png','667648','png','utf-8','brand/2014-02-01/b1p1-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (6,'b1p1-1.png','b1p1-1.png','667648','png','utf-8','product/2014-02-01/b1p1-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (7,'b1p1-2.png','b1p1-2.png','667648','png','utf-8','product/2014-02-01/b1p1-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (8,'b1p1-3.png','b1p1-3.png','667648','png','utf-8','product/2014-02-01/b1p1-3.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (9,'b1p1-4.png','b1p1-4.png','667648','png','utf-8','product/2014-02-01/b1p1-4.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (10,'b1p1-5.png','b1p1-5.png','667648','png','utf-8','product/2014-02-01/b1p1-5.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (11,'b1p2-logo.png','b1p2-logo.png','667648','png','utf-8','brand/2014-02-01/b1p2-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (12,'b1p2-1.png','b1p2-1.png','667648','png','utf-8','product/2014-02-01/b1p2-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (13,'b1p2-2.png','b1p2-2.png','667648','png','utf-8','product/2014-02-01/b1p2-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (14,'b1p2-3.png','b1p2-3.png','667648','png','utf-8','product/2014-02-01/b1p2-3.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (15,'b1p3-logo.png','b1p3-logo.png','667648','png','utf-8','brand/2014-02-01/b1p3-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (16,'b1p3-1.png','b1p3-1.png','667648','png','utf-8','product/2014-02-01/b1p3-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (17,'b1p3-2.png','b1p3-2.png','667648','png','utf-8','product/2014-02-01/b1p3-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (18,'b1p3-3.png','b1p3-3.png','667648','png','utf-8','product/2014-02-01/b1p3-3.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (19,'b1p4-logo.png','b1p4-logo.png','667648','png','utf-8','brand/2014-02-01/b1p4-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (20,'b1p4-1.png','b1p4-1.png','667648','png','utf-8','product/2014-02-01/b1p4-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (21,'b1p4-2.png','b1p4-2.png','667648','png','utf-8','product/2014-02-01/b1p4-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (22,'b1p4-3.png','b1p4-3.png','667648','png','utf-8','product/2014-02-01/b1p4-3.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (23,'b1p4-4.png','b1p4-4.png','667648','png','utf-8','product/2014-02-01/b1p4-4.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (24,'b1p4-5.png','b1p4-5.png','667648','png','utf-8','product/2014-02-01/b1p4-5.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (25,'b1p5-logo.png','b1p5-logo.png','667648','png','utf-8','brand/2014-02-01/b1p5-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (26,'b1p5-1.png','b1p5-1.png','667648','png','utf-8','product/2014-02-01/b1p5-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (27,'b1p5-2.png','b1p5-2.png','667648','png','utf-8','product/2014-02-01/b1p5-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (28,'b1p5-3.png','b1p5-3.png','667648','png','utf-8','product/2014-02-01/b1p5-3.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (29,'b1p5-4.png','b1p5-4.png','667648','png','utf-8','product/2014-02-01/b1p5-4.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (30,'b1p5-5.png','b1p5-5.png','667648','png','utf-8','product/2014-02-01/b1p5-5.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (31,'b1p6-logo.png','b1p6-logo.png','667648','png','utf-8','brand/2014-02-01/b1p6-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (32,'b1p6-1.png','b1p6-1.png','667648','png','utf-8','product/2014-02-01/b1p6-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (33,'b1p6-2.png','b1p6-2.png','667648','png','utf-8','product/2014-02-01/b1p6-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (34,'b1p6-3.png','b1p6-3.png','667648','png','utf-8','product/2014-02-01/b1p6-3.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (35,'b1p7-logo.png','b1p7-logo.png','667648','png','utf-8','brand/2014-02-01/b1p7-logo.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (36,'b1p7-1.png','b1p7-1.png','667648','png','utf-8','product/2014-02-01/b1p7-1.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (37,'b1p7-2.png','b1p7-2.png','667648','png','utf-8','product/2014-02-01/b1p7-2.png','2014-02-01 15:12:00','product');
insert into sister_content_con values (38,'b1p7-3.png','b1p7-3.png','667648','png','utf-8','product/2014-02-01/b1p7-3.png','2014-02-01 15:12:00','product');

insert into sister_content_con values (39,'about.jpg','about.jpg','667648','jpg','utf-8','about/2014-02-01/about.jpg','2014-02-01 15:12:00','about');
insert into sister_content_con values (40,'news.jpg','news.jpg','667648','jpg','utf-8','news/2014-02-01/news.jpg','2014-02-01 15:12:00','news');
insert into sister_content_con values (41,'contact.jpg','contact.jpg','667648','jpg','utf-8','contact/2014-02-01/contact.jpg','2014-02-01 15:12:00','contact');


/*==============================================================*/
/* Table: sister_product_pic_prdp                                */
/*==============================================================*/
create table sister_product_pic_prdp
(
   id_prdp               bigint NOT NULL AUTO_INCREMENT,
   id_prd_prdp           bigint,
   info_prdp             text comment '产品图片描述',
   info_en_prdp          text comment '英文产品图片描述',
   id_pic_prdp           bigint comment '产品图片',
   date_create_prdp      datetime comment '创建时间',
   primary key (id_prdp)
);

alter table sister_product_pic_prdp comment '产品图片';
INSERT INTO sister_product_pic_prdp VALUES(1, 1, "", "",6, "2014-02-01 15:12:00");
INSERT INTO sister_product_pic_prdp VALUES(2, 1, "", "",7, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(3, 1, "", "",8, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(4, 1, "", "",9, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(5, 1, "", "",10, "2014-02-01 15:12:00");  

INSERT INTO sister_product_pic_prdp VALUES(6, 2, "", "",12, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(7, 2, "", "",13, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(8, 2, "", "",14, "2014-02-01 15:12:00"); 

INSERT INTO sister_product_pic_prdp VALUES(9, 3, "", "",16, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(10, 3, "", "",17, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(11, 3, "", "",18, "2014-02-01 15:12:00");

INSERT INTO sister_product_pic_prdp VALUES(12, 4, "", "",20, "2014-02-01 15:12:00");
INSERT INTO sister_product_pic_prdp VALUES(13, 4, "", "",21, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(14, 4, "", "",22, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(15, 4, "", "",23, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(16, 4, "", "",24, "2014-02-01 15:12:00");

INSERT INTO sister_product_pic_prdp VALUES(17, 5, "", "",26, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(18, 5, "", "",27, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(19, 5, "", "",28, "2014-02-01 15:12:00");
INSERT INTO sister_product_pic_prdp VALUES(20, 5, "", "",29, "2014-02-01 15:12:00");
INSERT INTO sister_product_pic_prdp VALUES(21, 5, "", "",30, "2014-02-01 15:12:00"); 

INSERT INTO sister_product_pic_prdp VALUES(22, 6, "", "",31, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(23, 6, "", "",32, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(24, 6, "", "",33, "2014-02-01 15:12:00");

INSERT INTO sister_product_pic_prdp VALUES(25, 7, "", "",34, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(26, 7, "", "",35, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_pic_prdp VALUES(27, 7, "", "",36, "2014-02-01 15:12:00");
/*==============================================================*/
/* Table: sister_product_prd                                    */
/*==============================================================*/
create table sister_product_prd
(
   id_prd               bigint NOT NULL AUTO_INCREMENT,
   name_prd             varchar(256),
   id_brd_prd           bigint,
   info_prd             text comment '产品描述',
   info_en_prd          text comment '英文产品描述',
   id_logo_prd          bigint comment '产品图片',
   date_create_prd      datetime comment '创建时间',
   primary key (id_prd)
);

alter table sister_product_prd comment '产品';
INSERT INTO sister_product_prd VALUES(1, "钻石项链-a", 1, "", "", 5, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_prd VALUES(2, "钻石项链-a", 1, "", "",11, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_prd VALUES(3, "钻石项链-a", 1, "", "",15, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_prd VALUES(4, "钻石项链-a", 1, "", "",19, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_prd VALUES(5, "钻石项链-a", 1, "", "",25, "2014-02-01 15:12:00"); 
INSERT INTO sister_product_prd VALUES(6, "钻石项链-a", 1, "", "",31, "2014-02-01 15:12:00");
INSERT INTO sister_product_prd VALUES(7, "钻石项链-a", 1, "", "",35, "2014-02-01 15:12:00");  
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
   id_pic_ab          bigint comment '图片',
   content_ab          text,
   content_en_ab       text,   
   date_create_ab      datetime,
   PRIMARY KEY(id_ab)
);

insert into sister_about_ab values (1,'about',39,'珍珠是一种古老的有机宝石，主要产在珍珠贝类和珠母贝类软体动物体内；而由于内分泌作用而生成的 含碳酸钙的矿物（文石）珠粒，是由大量微小的文石晶体集合而成的。根据地质学和考古学的研究证明，在两亿年前，地球上就已经有了珍珠。国际宝石界还将珍珠列为六月生辰的幸运石，结婚十三周年和三十周年的纪念石。具有瑰丽色彩和高雅气质的珍珠，象征着健康、纯洁、富有和幸福，自古以来为人们所喜爱。2006年一场台风被命名为“珍珠”。','Method Ringing peals today usually consist of between 5000-5280 changes, or permutations. On seven or more bells they must be rung without repetition of any of the changes. Most peals are composed and rung in compliance with the decisions of the Central Council of Church Bell Ringers, allowing them to be recorded in that organisation’s peal records. Many peals are also recorded on peal boards attached to the walls of the ringing rooms in the towers where they took place, and in the peal books of local change-ringing associations.','2014-04-12 10:00:00');
insert into sister_about_ab values (2,'contact',41,'<p>工作时间</p><p>周一至周五</p><p>9:00~18:00</p><p>电话</p><p>010-66668888</p><p>传真</p><p>010-66668888</p><p>邮件</p><p>info@handz.com.cn</p>','contact','2014-04-12 10:00:00');
insert into sister_about_ab values (3,'news',40,'珍珠是一种古老的有机宝石，主要产在珍珠贝类和珠母贝类软体动物体内；而由于内分泌作用而生成的 含碳酸钙的矿物（文石）珠粒，是由大量微小的文石晶体集合而成的。根据地质学和考古学的研究证明，在两亿年前，地球上就已经有了珍珠。国际宝石界还将珍珠列为六月生辰的幸运石，结婚十三周年和三十周年的纪念石。具有瑰丽色彩和高雅气质的珍珠，象征着健康、纯洁、富有和幸福，自古以来为人们所喜爱。2006年一场台风被命名为“珍珠”。','Method Ringing peals today usually consist of between 5000-5280 changes, or permutations. On seven or more bells they must be rung without repetition of any of the changes. Most peals are composed and rung in compliance with the decisions of the Central Council of Church Bell Ringers, allowing them to be recorded in that organisation’s peal records. Many peals are also recorded on peal boards attached to the walls of the ringing rooms in the towers where they took place, and in the peal books of local change-ringing associations.','2014-04-12 10:00:00');

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
