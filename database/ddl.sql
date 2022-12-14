/*
	DDL - Creación de tablas para backend web
*/
/* Inicio */
	DROP DATABASE IF EXISTS marce_banizi;
	CREATE DATABASE IF NOT EXISTS marce_banizi;
	USE marce_banizi;
	/* Creación de tablas */
		use marce_banizi;
		CREATE TABLE servicio_cat_bck (
			id MEDIUMINT NOT NULL AUTO_INCREMENT,
			nombre TEXT,
			descripcion MEDIUMTEXT,
			precio MEDIUMINT DEFAULT 0,
			imagenMuestra MEDIUMINT,
			PRIMARY KEY (id),
			CONSTRAINT fk_servicio_cat_bck_id_img FOREIGN KEY (imagenMuestra) REFERENCES img_servicio_cat_bck (idi)
		) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; 

		CREATE TABLE subservicio_cat_bck (
			ids MEDIUMINT NOT NULL AUTO_INCREMENT,
			id MEDIUMINT NOT NULL,
			nombre TEXT,
			descripcion MEDIUMTEXT,
			precio MEDIUMINT DEFAULT 0,
			imagenMuestra MEDIUMINT,
			PRIMARY KEY (ids, id),
			CONSTRAINT fk_subservicio_cat_bck_id FOREIGN KEY (id) REFERENCES servicio_cat_bck (id),
			CONSTRAINT fk_subservicio_cat_bck_id_img FOREIGN KEY (imagenMuestra) REFERENCES img_subservicio_cat_bck (idi)
		) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; 

		CREATE TABLE img_servicio_cat_bck (
			idi MEDIUMINT NOT NULL AUTO_INCREMENT,
			id MEDIUMINT NOT NULL,
			url MEDIUMTEXT,	
			PRIMARY KEY (idi, id),
			CONSTRAINT fk_img_servicio_cat_bck_id FOREIGN KEY (id) REFERENCES servicio_cat_bck (id)
		) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 

		CREATE TABLE img_subservicio_cat_bck (
			idi MEDIUMINT NOT NULL AUTO_INCREMENT,
			id MEDIUMINT NOT NULL,
			url MEDIUMTEXT,	
			PRIMARY KEY (idi, id),
			CONSTRAINT fk_img_subservicio_cat_bck_id FOREIGN KEY (id) REFERENCES subservicio_cat_bck (ids)
		) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 

		CREATE TABLE img_portfolio_cat_bck (
			id MEDIUMINT NOT NULL AUTO_INCREMENT,
			url MEDIUMTEXT,	
			PRIMARY KEY (id)
		) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 
		
		CREATE TABLE app_urls (
			id MEDIUMINT NOT NULL AUTO_INCREMENT,
			nombre MEDIUMTEXT,
			url MEDIUMTEXT,	
			PRIMARY KEY (id)
		) ENGINE = InnoDB DEFAULT CHARSET = UTF8; 

		CREATE TABLE home_services (
			idhs MEDIUMINT NOT NULL AUTO_INCREMENT,
			id MEDIUMINT,
            ids MEDIUMINT,
			PRIMARY KEY (idhs),
			CONSTRAINT fk_home_servicio_cat_bck_id FOREIGN KEY (id) REFERENCES servicio_cat_bck (id),
            CONSTRAINT fk_home_subservicio_cat_bck_id FOREIGN KEY (ids) REFERENCES subservicio_cat_bck (ids)
		) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4; 
    /* Fin de tablas */
	/* Creación de vistas */
		CREATE VIEW serviciosNavbar as (
			select distinct servicio_cat_bck.id, servicio_cat_bck.nombre, 
			if(subservicio_cat_bck.id is not null,'1','0') as tienesubservicio 
			From servicio_cat_bck left join subservicio_cat_bck on servicio_cat_bck.id = subservicio_cat_bck.id
		);
	/* Fin de vistas */
/* Fin */
