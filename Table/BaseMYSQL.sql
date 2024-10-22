CREATE TABLE institut(
    id_Institut INT AUTO_INCREMENT PRIMARY KEY,
    Logo VARCHAR(100) NOT NULL,
    nom_institut VARCHAR(100) NOT NULL,
    description VARCHAR(3000) NOT NULL,
    motdirecteur VARCHAR(3000) NOT NULL,
    agrement VARCHAR(3000),
    siege VARCHAR(200)
);
insert into institut(Logo, Nom_Institut, description, motdirecteur, agrement, siege) VALUES ('AAA','IS-INFO','DESCRIPTION','MOT','AGREMENT','Ampasamadinika');
CREATE TABLE evenement(
    id_evenement INT AUTO_INCREMENT PRIMARY KEY,
    date_evenement date,
    lieu_evenement VARCHAR(100),
    decription VARCHAR(3000) NOT NULL,
    evenement VARCHAR(200),
    image VARCHAR(300)
);
CREATE TABLE role (
    id_role INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);
insert into role(nom) VALUES('ADMIN');
CREATE TABLE formation(
    id_formation INT AUTO_INCREMENT PRIMARY KEY,
    nom_formation VARCHAR(100) NOT NULL,
    codef VARCHAR(10) NOT NULL);

CREATE TABLE filiere(
    id_filiere INT AUTO_INCREMENT PRIMARY KEY,
    codef VARCHAR(20) NOT NULL,
    filiere VARCHAR(100) NOT NULL);

CREATE TABLE semestre(
     id_semestre INT AUTO_INCREMENT PRIMARY KEY,
     semestre VARCHAR(100)
);
CREATE TABLE promotion(
      id_promotion INT AUTO_INCREMENT PRIMARY KEY,
      codep VARCHAR(20) NOT NULL,
      anne_promotion VARCHAR(20) NOT NULL,
      filiere_id  INT REFERENCES FILIERE(id_filiere),
      formation_id  INT REFERENCES FORMATION(id_Formation)
);
CREATE TABLE genre(
  id_genre INT AUTO_INCREMENT PRIMARY KEY ,
  nom VARCHAR(100)
);
insert into genre(nom) VALUES('Masculin');
insert into genre(nom) VALUES('Feminin');
CREATE TABLE personne(
     id_personne INT AUTO_INCREMENT PRIMARY KEY,
     nom VARCHAR(300) NOT NULL,
     prenom VARCHAR(300) NOT NULL,
     telephone VARCHAR(16) NOT NULL,
     id_genre INT REFERENCES genre(id_genre),
     email VARCHAR(100),
     adresse VARCHAR(200)
);
INSERT INTO personne(nom, prenom, telephone, id_genre, email, adresse) VALUES('raherimanana','Toky','0343562462',1,'zosephatoky@gmail.com','FAIV 410 B');
CREATE TABLE etudiant(
     id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
     matricule VARCHAR(10) ,
     id_personne INT REFERENCES personne(id_personne),
     promotion_id INT REFERENCES promotion(id_Promotion)
);
CREATE TABLE utilisateur(
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    idrole INT REFERENCES role(id_role),
    id_personne INT REFERENCES personne(id_personne)
);
insert into utilisateur(Password,idrole,id_personne) VALUES('$2a$10$ROMDmYEmfiUILVeIdH5fnOQVJyEMHFVZQ37GIskFMgi9F7lDaOTxm',1,1);
CREATE TABLE niveaux(
    id_niveaux INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100)
);
CREATE TABLE cours(
      id_cours INT AUTO_INCREMENT PRIMARY KEY,
      date_debut DATE,
      date_fin DATE,
      promotion_id INT REFERENCES PROMOTION(id_Promotion),
      id_niveaux INT REFERENCES niveaux(id_niveaux)
);
CREATE TABLE Liste_Etudiant_Inscrit_Cours(
    id_liste_etudiant_inscrit_cours INT AUTO_INCREMENT PRIMARY KEY,
    id_cours INT REFERENCES COURS(id_Cours),
    id_etudiant INT REFERENCES Etudiant(id_Etudiant)
);

CREATE TABLE prix_ecolage(
     id_prix_ecolage INT AUTO_INCREMENT PRIMARY KEY,
     valeur float,
     dates date,
     id_niveau INT REFERENCES niveaux(id_niveaux)
);
CREATE TABLE ecolage(
    id_ecolage INT AUTO_INCREMENT PRIMARY KEY,
    dates Date ,
    date_payement date,
    prix float,
    id_cours INT REFERENCES cours(id_cours),
    etudiant_id INT REFERENCES Etudiant(id_Etudiant)
);
CREATE TABLE professeur(
    id_professeur INT AUTO_INCREMENT PRIMARY KEY,
    id_personne INT REFERENCES personne(id_personne)
);
CREATE TABLE matiere(
    id_matiere INT AUTO_INCREMENT PRIMARY KEY,
    Nom_matiere VARCHAR(100) NOT NULL,
    coeff INT
);
CREATE TABLE professeur_matiere(
    id_professeur_matiere INT AUTO_INCREMENT PRIMARY KEY ,
    professeur_id INT REFERENCES PROFESSEUR(id_Professeur),
    matiere_id INT REFERENCES MATIERE(id_Matiere),
    id_cours INT REFERENCES COURS(id_Cours)
);

CREATE TABLE examen(
  id_examen INT AUTO_INCREMENT PRIMARY KEY ,
  date_debut date,
  date_fin date,
  cours_id INT REFERENCES COURS(id_Cours),
  semestre_id INT REFERENCES SEMESTRE(id_Semestre)
);
CREATE TABLE note_examen(
  id_note_examen INT AUTO_INCREMENT PRIMARY KEY ,
  id_examen INT REFERENCES examen(id_examen),
  id_etudiant INT REFERENCES ETUDIANT(id_Etudiant),
  id_professeur_matiere INT REFERENCES professeur_matiere(id_professeur_matiere),
  note float
);





