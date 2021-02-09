DROP DATABASE IF EXISTS vorwerk;

CREATE DATABASE vorwerk;
USE vorwerk;

DROP user IF EXISTS 'tsw'@'localhost';
CREATE USER 'tsw'@'localhost' IDENTIFIED BY 'adminadmin';
GRANT ALL ON vorwerk.* TO 'tsw'@'localhost';


CREATE TABLE robot (
	`code` int AUTO_INCREMENT,
	name char(30) not null,
	description char(255) not null,
	price int default 0 not null,
	quantity int default 0 not null,
    photo mediumblob,
    PRIMARY KEY (`code`)
);

CREATE TABLE utente (
	email VARCHAR(50) NOT NULL,
	`password` VARCHAR(20) NOT NULL,
    punti int NOT NULL DEFAULT 0,
    `role` ENUM('ACCOUNT', 'ADMINISTRATOR') NOT NULL,
    data_di_nascita date NOT NULL,
	PRIMARY KEY (`email`)
);

CREATE TABLE premio (
	`name` char(30) not null,
    description char(255) not null,
    punti int default 0 not null,
    quantity int default 0 not null,
    photo mediumblob,
    PRIMARY KEY (`name`)
);

CREATE TABLE carrello (
	email VARCHAR(50),
	codeRobot INT NOT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY (`codeRobot`) REFERENCES robot(`code`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (email, codeRobot)
);

CREATE TABLE ordine (
	codeOrdine int AUTO_INCREMENT,
	email VARCHAR(50),
	idRobot INT NOT NULL,
	nameRobot CHAR(30) NOT NULL,
	quantità_scelta INT NOT NULL,
	price INT NOT NULL,
    data_richiesta date NOT NULL,
	FOREIGN KEY (`email`) REFERENCES utente(`email`),
	PRIMARY KEY (codeOrdine)
);

CREATE TABLE premioInOrdine (
	codeOrdine int AUTO_INCREMENT,
	email VARCHAR(50),
	idPremio CHAR(30) NOT NULL,
	quantità_scelta INT NOT NULL,
    punti INT NOT NULL,
    data_richiesta date NOT NULL,
	FOREIGN KEY (`email`) REFERENCES utente(`email`),
	PRIMARY KEY (codeOrdine)
);


/*INSERIMENTO ROBOT*/
INSERT INTO robot values (1,"T8","Macina bene",550,2, null);
INSERT INTO robot values (2,"T9","Robot da cucina intelligente. Riscoprire il piacere dell'esperienza di cucinare piu facilmente, velocemente e senza complicazioni.",390,500, null);
INSERT INTO robot values (3,"T9 PRO","Con un design elegante e finitura in metallo spazzolato, il nuovo robot da cucina multifunzione T9 PRO di VORWERK e il nuovo robot da cucina multifunzione di cui ogni casa ha bisogno.",259,500, null);
INSERT INTO robot values (4,"T10","Sistema Quick Slice System, sostituzione rapida delle lame: Senza smontare la ciotola, e grazie al suo design intelligente, e possibile sostituire le robuste lame in acciaio inox.",640,500, null);
INSERT INTO robot values (5,"T1","DEPAN 710-IK ha 17 programmi automatici e una selezione fino a 3 formati di pane: 500g, 700g e 900g.",189,500, null);
INSERT INTO robot values (6,"T2","Con una doppia potenza di lavorazione: 1200W che vengono trasferiti a 24000 giri/min alle sue lame Ultra-Slice, in grado di tritare il ghiaccio e 800W di potenza per riscaldare gli alimenti.",199,500, null);
INSERT INTO robot values (7,"T3","Le sue lame sono realizzate in acciaio inox di grande resistenza e durata. Sono progettati per tagliare a 17000 rpm, ma si puo anche impastare o frullare con loro.",199,500, null);
INSERT INTO robot values (8,"T4","Una macchina compatta e ad alta capacita: fino a 3,5 litri, molto facile da conservare e soprattutto da pulire.",349,500, null);
INSERT INTO robot values (9,"TES 8000","Interattivo Con schermo SoftTouch a colori da 5 pollici e connessione Wi-Fi.",399,500, null);

/*INSERIMENTO PREMI*/
INSERT INTO premio values ("Pentole","Set di pentole",350,25, null);
INSERT INTO premio values ("Coltelli","Set di coltelli, utili per tagliare in modo piu preciso le vostre prelibatezze fatte in casa.",350,23, null);
INSERT INTO premio values ("Cestelli","Set di cestelli di misure diverse.",350,22, null);
INSERT INTO premio values ("Fullmix Stylance","Cucina facilmente con una sola mano. Con il Frullatore manuale FULLMIX STYLANCE e tutto cosi semplificato che tornerai subito a godere del piacere di cucinare.",700,21, null);
INSERT INTO premio values ("Pentola lenta","Combinando tecnologia moderna e design il fornello elettrico lento 3,5L puo cucinare automaticamente in 3 modalita : lento, veloce, e poi mantenere il cibo caldo senza ulteriori cotture.",700,21, null);
INSERT INTO premio values ("Pentola a vapore","Triplo livello: ciotola con superficie trasparente, non solo ti consente di cucinare a vapore sano, ma puoi preparare diversi piatti contemporaneamente nei diversi livelli del robot.",700,21, null);
INSERT INTO premio values ("Kettle Retro","E ora che ti rilassi. Con il nuovo bollitore d'acqua KETTLE RETRO potrai avere 1 litro d'acqua bollente pronto in soli 3 minuti.",700,21, null);
INSERT INTO premio values ("Caffettiera","Con un motore al 100% in rame che imprime una potenza di 300W alle sue affilate lame in titanio, permette di ottenere sempre il grado di macinatura desiderato.",1400,10, null);
INSERT INTO premio values ("Cestello a vapore","Cucina al vapore in 3 livelli, prepara piatti molto piu sani e privi di grassi e mantiene tutte le proprieta nutrizionali degli alimenti.",350,21, null);
INSERT INTO premio values ("Montalatte","Riscalda e spuma il latte: puoi riscaldare fino a un massimo di 350 ml di latte intero o schiuma fino a 160 ml, sia a freddo che a caldo.",700,40, null);
INSERT INTO premio values ("FILTRO per caffe","Filtro per caffe macinato.",350,50, null);
INSERT INTO premio values ("Insalatrice","Accessorio per insalata. Tritura i tuoi alimenti con questo pratico accessorio.",350,34, null);



/*INSERIMENTO UTENTE*/
INSERT INTO `utente`(email, password, role, data_di_nascita) VALUES('demo@gmail.com', 'Prova123', 'ADMINISTRATOR', '1999-05-31');
INSERT INTO `utente`(email, password, role, data_di_nascita) VALUES('123', 'Prova123', 'ADMINISTRATOR', '1999-05-31');
INSERT INTO `utente`(email, password, role, data_di_nascita) VALUES('we@gmail.com', 'Prova123', 'ACCOUNT', '1999-05-31');
INSERT INTO `utente`(email, password, role, data_di_nascita) VALUES('vincenzo', 'Prova123', 'ACCOUNT', '1999-05-31');
INSERT INTO `utente`(email, password, role, data_di_nascita) VALUES('annalisa', 'Prova123', 'ACCOUNT', '1999-05-31');