-- question1: Requête pour clôturer un événement
UPDATE Evenement
SET cloture = TRUE, date_cloture = CURRENT_DATE
WHERE id = :evenement_id
AND NOT EXISTS (
    SELECT 1
    FROM Repartition r
    JOIN Depense d ON r.depense_id = d.id
    WHERE r.montant > 0
    AND d.evenement_id = :evenement_id
    AND r.montant_dus > 0
);

-- question2: Déclencheur pour vérifier la possibilité de clôturer un événement
CREATE OR REPLACE FUNCTION verifier_cloture_evenement()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Repartition r
        JOIN Depense d ON r.depense_id = d.id
        WHERE d.evenement_id = NEW.evenement_id
        AND r.montant_dus > 0
    ) THEN
        RAISE EXCEPTION 'Il y a encore des montants dus.';
    END IF;


    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verifier_cloture_evenement
BEFORE UPDATE ON Repartition
FOR EACH ROW
EXECUTE FUNCTION verifier_cloture_evenement();

