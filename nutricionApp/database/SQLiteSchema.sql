CREATE TABLE "nutricionApp_alimento" (
  "id" int(11) NOT NULL ,
  "nombre" varchar(50) NOT NULL,
  "codigo_fao" varchar(50) NOT NULL,
  "tags" varchar(80) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "nutricionApp_cantidad_nutriente_alimento" (
  "id" int(11) NOT NULL ,
  "nutriente_id" int(11) NOT NULL,
  "alimento_id" int(11) NOT NULL,
  "cantidad_gr" decimal(15,3) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "nutricionApp_c_alimento_id_4765b3df_fk_nutricionApp_nutriente_id" FOREIGN KEY ("alimento_id") REFERENCES "nutricionApp_nutriente" ("id"),
  CONSTRAINT "nutricionApp_c_nutriente_id_51408d1f_fk_nutricionApp_alimento_id" FOREIGN KEY ("nutriente_id") REFERENCES "nutricionApp_alimento" ("id")
);
CREATE TABLE "nutricionApp_etiqueta" (
  "id" int(11) NOT NULL ,
  "nombre" varchar(50) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "nutricionApp_funcion_lineal" (
  "id" int(11) NOT NULL ,
  "m" decimal(8,4) NOT NULL,
  "b" decimal(8,4) NOT NULL,
  "conjunto_id" int(11) NOT NULL,
  "x1" decimal(8,4) NOT NULL,
  "x2" decimal(8,4) NOT NULL,
  "unidad_medida" varchar(1) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "nutri_conjunto_id_6d0ca822_fk_nutricionApp_nutriente_etiqueta_id" FOREIGN KEY ("conjunto_id") REFERENCES "nutricionApp_nutriente_etiqueta" ("id")
);
CREATE TABLE "nutricionApp_gramosporporcion" (
  "id" int(11) NOT NULL ,
  "nombre_porcion" varchar(254) NOT NULL,
  "valor_gramos" decimal(5,2) NOT NULL,
  "alimento" int(11) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "nutricionApp_nutriente" (
  "id" int(11) NOT NULL ,
  "nombre" varchar(50) NOT NULL,
  "kcalxgramo" int(11) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "nutricionApp_nutriente_etiqueta" (
  "id" int(11) NOT NULL ,
  "nutriente_id" int(11) NOT NULL,
  "etiqueta_id" int(11) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "nutricionApp_nu_etiqueta_id_36101deb_fk_nutricionApp_etiqueta_id" FOREIGN KEY ("etiqueta_id") REFERENCES "nutricionApp_etiqueta" ("id"),
  CONSTRAINT "nutricionApp_n_nutriente_id_7d4dc48_fk_nutricionApp_nutriente_id" FOREIGN KEY ("nutriente_id") REFERENCES "nutricionApp_nutriente" ("id")
);
CREATE TABLE "nutricionApp_precendente_regla" (
  "id" int(11) NOT NULL ,
  "regla_id" int(11) NOT NULL,
  "precendente_id" int(11) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "nutricionApp_precende_regla_id_4f5a3056_fk_nutricionApp_regla_id" FOREIGN KEY ("regla_id") REFERENCES "nutricionApp_regla" ("id"),
  CONSTRAINT "nut_precendente_id_10b31a2_fk_nutricionApp_nutriente_etiqueta_id" FOREIGN KEY ("precendente_id") REFERENCES "nutricionApp_nutriente_etiqueta" ("id")
);
CREATE TABLE "nutricionApp_recomendacion" (
  "id" int(11) NOT NULL ,
  "descripcion" varchar(256) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "nutricionApp_regla" (
  "id" int(11) NOT NULL ,
  "nombre" varchar(50) NOT NULL,
  "recomendacion_id" int(11) NOT NULL,
  "consecuente_id" int(11) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "nutri_recomendacion_id_6d99e128_fk_nutricionApp_recomendacion_id" FOREIGN KEY ("recomendacion_id") REFERENCES "nutricionApp_recomendacion" ("id"),
  CONSTRAINT "nu_consecuente_id_76647c1f_fk_nutricionApp_nutriente_etiqueta_id" FOREIGN KEY ("consecuente_id") REFERENCES "nutricionApp_nutriente_etiqueta" ("id")
);
CREATE TABLE "nutricionApp_usuario_alimento_porcion" (
  "id" int(11) NOT NULL ,
  "usuario_id" int(11) NOT NULL,
  "alimento_porcion_id" int(11) NOT NULL,
  "tamano_porcion" decimal(15,3) NOT NULL,
  "fecha_consumo" datetime NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "dd787ab933d85a61efd324338631bdf3" FOREIGN KEY ("alimento_porcion_id") REFERENCES "nutricionApp_gramosporporcion" ("id"),
  CONSTRAINT "nutricionApp_usua_usuario_id_1bee68fc_fk_nutricionApp_usuario_id" FOREIGN KEY ("usuario_id") REFERENCES "nutricionApp_usuario" ("id")
);
CREATE INDEX "nutricionApp_etiqueta_nombre" ON "nutricionApp_etiqueta" ("nombre");
CREATE INDEX "nutricionApp_cantidad_nutriente_alimento_nutricionApp_c_nutriente_id_51408d1f_fk_nutricionApp_alimento_id" ON "nutricionApp_cantidad_nutriente_alimento" ("nutriente_id");
CREATE INDEX "nutricionApp_cantidad_nutriente_alimento_nutricionApp_c_alimento_id_4765b3df_fk_nutricionApp_nutriente_id" ON "nutricionApp_cantidad_nutriente_alimento" ("alimento_id");
CREATE INDEX "nutricionApp_funcion_lineal_nutri_conjunto_id_6d0ca822_fk_nutricionApp_nutriente_etiqueta_id" ON "nutricionApp_funcion_lineal" ("conjunto_id");
CREATE INDEX "nutricionApp_precendente_regla_nutricionApp_precende_regla_id_4f5a3056_fk_nutricionApp_regla_id" ON "nutricionApp_precendente_regla" ("regla_id");
CREATE INDEX "nutricionApp_precendente_regla_nut_precendente_id_10b31a2_fk_nutricionApp_nutriente_etiqueta_id" ON "nutricionApp_precendente_regla" ("precendente_id");
CREATE INDEX "nutricionApp_alimento_nombre" ON "nutricionApp_alimento" ("nombre");
CREATE INDEX "nutricionApp_alimento_codigo_fao" ON "nutricionApp_alimento" ("codigo_fao");
CREATE INDEX "nutricionApp_regla_nombre" ON "nutricionApp_regla" ("nombre");
CREATE INDEX "nutricionApp_regla_nutri_recomendacion_id_6d99e128_fk_nutricionApp_recomendacion_id" ON "nutricionApp_regla" ("recomendacion_id");
CREATE INDEX "nutricionApp_regla_nu_consecuente_id_76647c1f_fk_nutricionApp_nutriente_etiqueta_id" ON "nutricionApp_regla" ("consecuente_id");
CREATE INDEX "nutricionApp_nutriente_nombre" ON "nutricionApp_nutriente" ("nombre");
CREATE INDEX "nutricionApp_usuario_alimento_porcion_nutricionApp_usua_usuario_id_1bee68fc_fk_nutricionApp_usuario_id" ON "nutricionApp_usuario_alimento_porcion" ("usuario_id");
CREATE INDEX "nutricionApp_usuario_alimento_porcion_dd787ab933d85a61efd324338631bdf3" ON "nutricionApp_usuario_alimento_porcion" ("alimento_porcion_id");
CREATE INDEX "nutricionApp_nutriente_etiqueta_nutricionApp_n_nutriente_id_7d4dc48_fk_nutricionApp_nutriente_id" ON "nutricionApp_nutriente_etiqueta" ("nutriente_id");
CREATE INDEX "nutricionApp_nutriente_etiqueta_nutricionApp_nu_etiqueta_id_36101deb_fk_nutricionApp_etiqueta_id" ON "nutricionApp_nutriente_etiqueta" ("etiqueta_id");
END TRANSACTION;
