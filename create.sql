
CREATE TABLE Utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL
);


CREATE TABLE Evenement (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    icone TEXT,
    devise CHAR(3) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    utilisateur_id INT NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateur(id) ON DELETE CASCADE
);


CREATE TABLE Participant (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    evenement_id INT NOT NULL,
    FOREIGN KEY (evenement_id) REFERENCES Evenement(id) ON DELETE CASCADE
);


CREATE TABLE Depense (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    montant NUMERIC(10, 2) NOT NULL,
    devise CHAR(3) NOT NULL,
    note TEXT,
    date DATE NOT NULL,
    etiquette VARCHAR(100),
    evenement_id INT NOT NULL,
    acheteur_id INT,
    FOREIGN KEY (evenement_id) REFERENCES Evenement(id) ON DELETE CASCADE,
    FOREIGN KEY (acheteur_id) REFERENCES Participant(id) ON DELETE SET NULL
);

CREATE TABLE Repartition (
    id SERIAL PRIMARY KEY,
    depense_id INT NOT NULL,
    participant_id INT NOT NULL,
    montant NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (depense_id) REFERENCES Depense(id) ON DELETE CASCADE,
    FOREIGN KEY (participant_id) REFERENCES Participant(id) ON DELETE CASCADE
);

CREATE TABLE MoyenPaiement (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    details TEXT,
    participant_id INT NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES Participant(id) ON DELETE CASCADE
);


CREATE TABLE Cagnotte (
    id SERIAL PRIMARY KEY,
    montant NUMERIC(10, 2) DEFAULT 0.00,
    evenement_id INT NOT NULL,
    FOREIGN KEY (evenement_id) REFERENCES Evenement(id) ON DELETE CASCADE
);


CREATE TABLE ConversionDevise (
    id SERIAL PRIMARY KEY,
    devise_source CHAR(3) NOT NULL,
    devise_cible CHAR(3) NOT NULL,
    taux NUMERIC(10, 6) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

