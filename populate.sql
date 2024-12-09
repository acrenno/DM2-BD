INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
    ('Alice', 'alice@example.com', 'password123'),
    ('Bob', 'bob@example.com', 'password456'),
    ('Charlie', 'charlie@example.com', 'password789'),
    ('Diana', 'diana@example.com', 'password321'),
    ('Eve', 'eve@example.com', 'password654'),
    ('Lucas', 'lucas@example.com', 'password111'),
    ('Anna', 'anna@example.com', 'password222'),
    ('Nicole', 'nicole@example.com', 'password333'),
    ('Didi', 'didi@example.com', 'password444');

INSERT INTO Evenement (titre, icone, devise, utilisateur_id)
VALUES 
    ('Vacances en Espagne', '🌴', 'EUR', 1),
    ('Anniversaire de Bob', '🎂', 'EUR', 2),
    ('Voyage à New York', '🗽', 'USD', 3),
    ('Mariage de Diana', '💍', 'EUR', 4),
    ('Excursion en montagne', '⛰️', 'CHF', 5),
    ('Soirée karaoké', '🎤', 'EUR', 6),
    ('Road trip en Italie', '🚗', 'EUR', 7);

INSERT INTO Participant (nom, email, evenement_id)
VALUES 
    ('Alice', 'alice@example.com', 1),
    ('Bob', 'bob@example.com', 1),
    ('Charlie', 'charlie@example.com', 1),
    ('Diana', 'diana@example.com', 1),
    ('Lucas', 'lucas@example.com', 1),
    ('Anna', 'anna@example.com', 2),
    ('Nicole', 'nicole@example.com', 2),
    ('Didi', 'didi@example.com', 2),
    ('Lucas', 'lucas@example.com', 3),
    ('Anna', 'anna@example.com', 3),
    ('Nicole', 'nicole@example.com', 3),
    ('Didi', 'didi@example.com', 3),
    ('Alice', 'alice@example.com', 4),
    ('Lucas', 'lucas@example.com', 4),
    ('Diana', 'diana@example.com', 4),
    ('Eve', 'eve@example.com', 4),
    ('Charlie', 'charlie@example.com', 5),
    ('Didi', 'didi@example.com', 5),
    ('Nicole', 'nicole@example.com', 5);

INSERT INTO Depense (titre, montant, devise, note, date, etiquette, evenement_id, acheteur_id)
VALUES 
    ('Location de voiture', 300.00, 'EUR', 'Pour le séjour complet', '2024-01-10', 'Transport', 1, 1),
    ('Dîner au restaurant', 150.00, 'EUR', 'Repas pour 5 personnes', '2024-01-11', 'Nourriture', 1, 2),
    ('Billets d\'avion', 1200.00, 'USD', 'Aller-retour à New York', '2024-02-01', 'Transport', 3, 9),
    ('Hôtel à Manhattan', 2000.00, 'USD', '3 nuits', '2024-02-02', 'Hébergement', 3, 10),
    ('Cadeau de mariage', 500.00, 'EUR', 'Participation commune', '2024-03-15', 'Cadeau', 4, 4),
    ('Équipement de randonnée', 200.00, 'CHF', 'Pour l\'excursion', '2024-04-10', 'Loisir', 5, 18),
    ('Location de salle', 300.00, 'EUR', 'Pour la soirée karaoké', '2024-05-01', 'Loisir', 6, 6),
    ('Carburant pour road trip', 120.00, 'EUR', 'Essence pour la voiture', '2024-06-15', 'Transport', 7, 7);

INSERT INTO Repartition (depense_id, participant_id, montant)
VALUES 
    (1, 1, 60.00), (1, 2, 60.00), (1, 3, 60.00), (1, 4, 60.00), (1, 5, 60.00),
    (2, 1, 30.00), (2, 2, 30.00), (2, 3, 30.00), (2, 4, 30.00), (2, 5, 30.00),
    (3, 9, 300.00), (3, 10, 300.00), (3, 11, 300.00), (3, 12, 300.00),
    (4, 9, 500.00), (5, 18, 100.00), (5, 19, 100.00),
    (6, 6, 100.00), (6, 8, 100.00), (6, 9, 100.00),
    (7, 7, 120.00);

INSERT INTO MoyenPaiement (type, details, participant_id)
VALUES 
    ('Virement bancaire', 'IBAN: FR76 1234 5678 9012', 1),
    ('PayPal', 'bob@paypal.com', 2),
    ('Apple Pay', 'Charlie\'s Apple ID', 3),
    ('Google Pay', 'diana@google.com', 4),
    ('Espèces', NULL, 5),
    ('PayPal', 'lucas@paypal.com', 9),
    ('Virement bancaire', 'IBAN: IT60 9876 5432', 7);

INSERT INTO Cagnotte (montant, evenement_id)
VALUES 
    (1000.00, 1),
    (500.00, 2),
    (200.00, 3),
    (700.00, 4),
    (300.00, 5),
    (150.00, 6),
    (400.00, 7);

INSERT INTO ConversionDevise (devise_source, devise_cible, taux)
VALUES 
    ('EUR', 'USD', 1.10),
    ('USD', 'EUR', 0.91),
    ('EUR', 'CHF', 1.05),
    ('CHF', 'EUR', 0.95),
    ('USD', 'CHF', 0.98),
    ('CHF', 'USD', 1.02),
    ('EUR', 'GBP', 0.85),
    ('GBP', 'EUR', 1.18);

