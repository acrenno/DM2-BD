--Q1
SELECT 
    u.nom,
    SUM(CASE 
            WHEN p1.participant_id = u.id THEN r.montant 
            ELSE 0 
        END) - 
    SUM(CASE 
            WHEN p2.participant_id = u.id THEN r.montant 
            ELSE 0 
        END) AS solde_global
FROM Utilisateur u
LEFT JOIN Repartition r ON r.participant_id = u.id
LEFT JOIN Depense d ON d.id = r.depense_id
LEFT JOIN Participant p1 ON p1.id = d.evenement_id
LEFT JOIN Participant p2 ON p2.id = d.evenement_id
WHERE u.nom = 'Saitama'
GROUP BY u.nom;


-- Q2
SELECT e.titre, e.date
FROM Evenement e
JOIN Depense d ON e.id = d.evenement_id
JOIN Repartition r ON r.depense_id = d.id
JOIN Participant p ON p.evenement_id = e.id
WHERE p.nom = 'Onizuka'
AND r.montant > 0;



-- Q3
SELECT e.titre, e.date
FROM Evenement e
JOIN Depense d ON e.id = d.evenement_id
JOIN Repartition r ON r.depense_id = d.id
JOIN Participant p ON p.evenement_id = e.id
WHERE p.nom = 'Kaneda'
AND r.montant > 0;


-- Q4
SELECT 
    u.nom, 
    d.etiquette, 
    SUM(r.montant) AS total
FROM Utilisateur u
JOIN Repartition r ON r.participant_id = u.id
JOIN Depense d ON d.id = r.depense_id
GROUP BY u.nom, d.etiquette
ORDER BY u.nom, d.etiquette;



-- Q5
SELECT 
    EXTRACT(YEAR FROM e.date) AS annee,
    EXTRACT(MONTH FROM e.date) AS mois,
    EXTRACT(WEEK FROM e.date) AS semaine,
    EXTRACT(DAY FROM e.date) AS jour,
    e.type_evenement, 
    SUM(r.montant) AS total
FROM Evenement e
JOIN Depense d ON e.id = d.evenement_id
JOIN Repartition r ON r.depense_id = d.id
JOIN Participant p ON p.evenement_id = e.id
WHERE p.nom = 'Kaneda'
GROUP BY annee, mois, semaine, jour, e.type_evenement
ORDER BY annee, mois, semaine, jour, e.type_evenement;

