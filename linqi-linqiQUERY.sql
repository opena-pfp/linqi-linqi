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