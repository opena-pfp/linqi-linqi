---
description: Información para almacenar en la base de datos de mi proyecto
---

# Informe Backend - DB

### Descripción general

**¿De qué trata tu web?**

Aplicación web diseñada para el aprendizaje y la práctica acerca de la masterización de audio.

**¿Qué funcionalidades ofrecerá a los usuarios?**

La aplicación permite al usuario crearse una cuenta, crear proyectos, añadir y modificar efectos, e importar sus propios archivos de audio MP3 y para después, exportarlo de vuelta con el resultado final.

***

### Identificación de entidades principales

**¿Qué elementos importantes hay en tu web que necesitan almacenarse?**

Los elementos que deberán almacenarse son los datos de usuarios y sus proyectos, datos de los audios subidos y datos sobre los efectos.

**¿Qué tema de información almacena?**

* _UserProfile_
* _Project_
* _Audio_
* _Effect_

***

### Datos que se deben guardar de cada entidad (atributos)

<details>

<summary><em><strong>UserProfile</strong></em></summary>

* Nombre de usuario — Texto — VARCHAR
* Nombre — Texto — VARCHAR
* Apellidos — Texto — VARCHAR
* Correo electrónico — Texto — VARCHAR
* Contraseña — Texto — VARCHAR
* Fecha de registro — Fecha — TIMESTAMP

</details>

<details>

<summary><em><strong>Project</strong></em></summary>

* Nombre de proyecto — Texto — VARCHAR
* Fecha de creación — Fecha — TIMESTAMP
* Fecha de modificación — Fecha — DATETIME

</details>

<details>

<summary><em><strong>Audio</strong></em></summary>

* Nombre de audio — Texto — VARCHAR
* Tamaño (MB) — Número — DECIMAL
* Fecha de subida — Fecha — DATETIME

</details>

<details>

<summary><em><strong>Effect</strong></em></summary>

* Nombre de efecto — Texto — VARCHAR
* Descripción — Texto — TEXT
* URL — Texto — VARCHAR

</details>

***

### Relaciones entre las entidades

¿Cómo se relacionan unas entidades con otras?

* Un usuario puede crear muchos proyectos.
* Un proyecto solo puede tener un audio.

***

### Ejemplo de datos (simulación)

{% tabs %}
{% tab title="UserProfile" icon="user" %}
* _Nombre de usuario:_ ackackack
* _Nombre:_ Oriol
* _Apellidos:_ Peña
* _Email:_ [openaopena@gmail.com](https://dmuwut6e40u5o.cloudfront.net/ultra/uiv4001.4.0-rel.31_82fdb43)
* _Contraseña:_ a5d1d4bd24b50c460c023388de22b15ebc4d70c86619bcd2347fb35ae04526105bca2b224da0c9cba49f57f9c7a5c25cd7d9e30d71e76d9ca91e11ae27276580
* _Fecha de registro:_ 10/09/2026
{% endtab %}

{% tab title="Project" icon="folder" %}
* _Nombre de proyecto:_ Proyecto 1
* _Fecha de creación:_ 10/09/2026
* _Fecha de modificación:_ 13/09/2026
{% endtab %}

{% tab title="Audio" icon="volume-high" %}
* _Nombre de audio:_ Maqueta\_20261006
* _Tamaño (MB)_: 12.30
* _Fecha de subida:_ 10/09/2026
{% endtab %}

{% tab title="Effect" icon="waveform" %}
* _Nombre de efecto:_ EQ
* _Descripción:_ Un ecualizador paramétrico (EQ paramétrico) es una herramienta de procesamiento de audio que permite modificar el volumen de frecuencias específicas con total precisión.
* _URL:_ ¯\\\_(o.o')\_/¯
{% endtab %}
{% endtabs %}

#### BBDD

```sql
CREATE DATABASE linqilinqi;
USE linqilinqi;

CREATE TABLE UserProfile (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    FirstName VARCHAR(25) NOT NULL,
    SecondName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Pass VARCHAR(255) NOT NULL,
    RegistryDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB;

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectUserID INT NOT NULL,
    ProjectName VARCHAR(255) NOT NULL,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModDate TIMESTAMP,
    
    CONSTRAINT FK_User_ID
    FOREIGN KEY (ProjectUserID)
    REFERENCES UserProfile(UserID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Audio (
    AudioID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectAudioID INT NOT NULL,
    AudioName VARCHAR(255) NOT NULL,
    SizeMB DECIMAL(8,2) NOT NULL,
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT FK_ProjectAudio_ID
    FOREIGN KEY (ProjectAudioID)
    REFERENCES Project(ProjectID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE Effect (
    EffectID INT PRIMARY KEY AUTO_INCREMENT,
    EffectName VARCHAR(25) NOT NULL,
    EffectDesc TEXT NOT NULL,
    Url VARCHAR(255) NOT NULL
    
)ENGINE=InnoDB;

CREATE TABLE ProjectEffect (
	ProjectEffectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectPID INT NOT NULL,
    EffectEID INT NOT NULL,
    
	CONSTRAINT FK_Project_ID
    FOREIGN KEY (ProjectPID)
    REFERENCES Project(ProjectID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    
    CONSTRAINT FK_Effect_ID
    FOREIGN KEY (EffectEID)
    REFERENCES Effect(EffectID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)ENGINE=InnoDB;
```

#### _Query_

```sql
INSERT INTO UserProfile (Username, FirstName, SecondName, Email, Pass)
VALUE ("aqueleque", "Oriol", "Peña", "altair.uri95@gmail", "yadayada"),
	    ("ackackack", "Bastian", "Schweinsteiger", "b.schweinsteiger@hotmail.com", "$chweinsTiger"),
      ("pootie_tang", "Pootie", "Tang", "ptang@outlook.com", "Sepatown");

SELECT * FROM UserProfile;

INSERT INTO Project(ProjectUserID, ProjectName)
VALUE (1, "Melocotón (Premaster)"),
	    (2, "Acktung!"),
      (3, "Baby, I'm going to sine your pitty on the runny kine!");

SELECT * FROM Project;
```

***

### Reflexiones, dificultades y dudas que tienes sobre la base de datos

Pensar tanto en los datos, como en todas las posibles relaciones y, tratar de darle forma teniendo delante una hoja en blanco es, por mucho, lo que se ha antojado más difícil inicialmente.

Las dudas que pueda tener ahora, son más por toda la información y/o tablas que puedan surgir según avance el proyecto.
