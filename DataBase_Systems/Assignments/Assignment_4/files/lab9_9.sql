ALTER TABLE dept
COMMENT = 'This table stores department information';

ALTER TABLE emp
COMMENT = 'This table stores employee information';

SELECT table_name, table_comment
FROM information_schema.tables
WHERE table_name IN ('dept', 'emp');
