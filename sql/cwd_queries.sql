-- ============================================================
-- Chronic Wasting Disease (CWD) — SQL Analysis
-- Data: USGS CWD Distribution by State and County (ver. 3.0)
-- Author: Dr. Maria Julia Judson, DVM, MSc
-- ============================================================
-- Table structure assumed:
--   cwd_wild    (state TEXT, county TEXT)
--   cwd_captive (state TEXT, county TEXT)
-- ============================================================


-- ------------------------------------------------------------
-- QUERY 1: Total affected counties per population type
-- Concept: SELECT, COUNT, UNION ALL
-- ------------------------------------------------------------

SELECT 'Wild'    AS population,
       COUNT(*)  AS affected_counties
FROM cwd_wild

UNION ALL

SELECT 'Captive' AS population,
       COUNT(*)  AS affected_counties
FROM cwd_captive;


-- ------------------------------------------------------------
-- QUERY 2: Total affected states per population type
-- Concept: COUNT DISTINCT
-- ------------------------------------------------------------

SELECT 'Wild'             AS population,
       COUNT(DISTINCT state) AS affected_states
FROM cwd_wild

UNION ALL

SELECT 'Captive'          AS population,
       COUNT(DISTINCT state) AS affected_states
FROM cwd_captive;


-- ------------------------------------------------------------
-- QUERY 3: Top 10 states by wild CWD affected counties
-- Concept: GROUP BY, COUNT, ORDER BY, LIMIT
-- ------------------------------------------------------------

SELECT state,
       COUNT(*) AS wild_affected_counties
FROM cwd_wild
GROUP BY state
ORDER BY wild_affected_counties DESC
LIMIT 10;


-- ------------------------------------------------------------
-- QUERY 4: Top 10 states by captive CWD affected counties
-- Concept: GROUP BY, COUNT, ORDER BY, LIMIT
-- ------------------------------------------------------------

SELECT state,
       COUNT(*) AS captive_affected_counties
FROM cwd_captive
GROUP BY state
ORDER BY captive_affected_counties DESC
LIMIT 10;


-- ------------------------------------------------------------
-- QUERY 5: Wild vs captive county burden by state
-- Concept: JOIN, calculated columns, COALESCE
-- ------------------------------------------------------------

SELECT COALESCE(w.state, c.state) AS state,
       COALESCE(w.wild_counties, 0)    AS wild_counties,
       COALESCE(c.captive_counties, 0) AS captive_counties,
       COALESCE(w.wild_counties, 0) - COALESCE(c.captive_counties, 0) AS difference
FROM (
    SELECT state, COUNT(*) AS wild_counties
    FROM cwd_wild
    GROUP BY state
) w
FULL OUTER JOIN (
    SELECT state, COUNT(*) AS captive_counties
    FROM cwd_captive
    GROUP BY state
) c ON w.state = c.state
ORDER BY wild_counties DESC;


-- ------------------------------------------------------------
-- QUERY 6: States with BOTH wild and captive CWD presence
-- Concept: INNER JOIN, data quality, risk interface
-- ------------------------------------------------------------

SELECT DISTINCT w.state
FROM cwd_wild w
INNER JOIN cwd_captive c
    ON w.state = c.state
ORDER BY w.state;


-- ------------------------------------------------------------
-- QUERY 7: States with wild CWD but NO captive CWD
-- Concept: LEFT JOIN with NULL filter
-- ------------------------------------------------------------

SELECT DISTINCT w.state
FROM cwd_wild w
LEFT JOIN cwd_captive c
    ON w.state = c.state
WHERE c.state IS NULL
ORDER BY w.state;


-- ------------------------------------------------------------
-- QUERY 8: States above average wild CWD county burden
-- Concept: Subquery, HAVING, AVG
-- ------------------------------------------------------------

SELECT state,
       COUNT(*) AS wild_counties
FROM cwd_wild
GROUP BY state
HAVING COUNT(*) > (
    SELECT AVG(state_count)
    FROM (
        SELECT COUNT(*) AS state_count
        FROM cwd_wild
        GROUP BY state
    )
)
ORDER BY wild_counties DESC;


-- ------------------------------------------------------------
-- QUERY 9: Wild-to-captive county ratio by state
-- Concept: JOIN, ROUND, CAST, NULLIF
-- ------------------------------------------------------------

SELECT w.state,
       w.wild_counties,
       COALESCE(c.captive_counties, 0) AS captive_counties,
       ROUND(
           CAST(w.wild_counties AS FLOAT) /
           NULLIF(COALESCE(c.captive_counties, 0), 0),
           1
       ) AS wild_to_captive_ratio
FROM (
    SELECT state, COUNT(*) AS wild_counties
    FROM cwd_wild
    GROUP BY state
) w
LEFT JOIN (
    SELECT state, COUNT(*) AS captive_counties
    FROM cwd_captive
    GROUP BY state
) c ON w.state = c.state
ORDER BY wild_to_captive_ratio DESC;
