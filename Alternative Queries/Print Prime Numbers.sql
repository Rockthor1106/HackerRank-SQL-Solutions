--by @Rockthor1106
CREATE TABLE result (
    p_number INT
);

DELIMITER $$

CREATE PROCEDURE generate_prime_numbers (until_p_number INT)
    BEGIN
    
    SET @counter = 2;
    
    WHILE @counter <= until_p_number DO
        SET @divider = @counter - 1;
        SET @prime = 1; 
       
            WHILE @divider > 1 DO
                IF @counter % @divider = 0 THEN
                SET @prime = 0;
            END IF;
                SET @divider = @divider - 1;
            END WHILE;
        IF @prime = 1 THEN
            INSERT INTO result (p_number) VALUES (@counter);
        END IF;
       SET @counter = @counter + 1;
    END WHILE;
END $$

CALL generate_prime_numbers(10) $$

SELECT GROUP_CONCAT(p_number SEPARATOR '&') FROM result;

--Another version
CREATE TABLE result (
    p_number INT
);

DELIMITER $$

CREATE PROCEDURE generate_prime_numbers (until_p_number INT)
    BEGIN
    
    SET @counter = 2;
    
    REPEAT
        SET @divider = @counter - 1;
        SET @prime = 1;
        REPEAT
            IF @counter % @divider = 0 AND @counter <> 2 THEN 
                SET @prime = 0;
            END IF;
            SET @divider = @divider - 1;
        UNTIL @divider <= 1 END REPEAT;
        IF @prime = 1 THEN
            INSERT INTO result VALUES (@counter);
        END IF;
        SET @counter = @counter + 1;
    UNTIL @counter >= (until_p_number + 1) END REPEAT;
END $$

CALL generate_prime_numbers(1000) $$

SELECT GROUP_CONCAT(p_number SEPARATOR '&') FROM result;