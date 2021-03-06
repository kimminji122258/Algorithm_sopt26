-- 입양 간 기록은 있는데, 보호소에 들어온 기록은 없는 동물 찾기(차집합)
-- 차집합은 반대 테이블의 값이 NULL인 친구를 찾으면 된다.
-- https://programmers.co.kr/learn/courses/30/lessons/59042
SELECT
AO.ANIMAL_ID, AO.NAME
FROM ANIMAL_OUTS AO
LEFT OUTER JOIN ANIMAL_INS AI ON AO.ANIMAL_ID = AI.ANIMAL_ID WHERE AI.ANIMAL_ID IS NULL;

SELECT OUTS.ANIMAL_ID, OUTS.NAME
FROM ANIMAL_INS INS
RIGHT JOIN ANIMAL_OUTS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE INS.INTAKE_CONDITION IS NULL
ORDER BY OUTS.ANIMAL_ID



-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름 조회
-- https://programmers.co.kr/learn/courses/30/lessons/59043
SELECT
AO.ANIMAL_ID, AO.NAME
FROM ANIMAL_OUTS AO
JOIN ANIMAL_INS AI ON AO.ANIMAL_ID = AI.ANIMAL_ID 
where AI.DATETIME > AO.DATETIME
ORDER BY AI.DATETIME;

SELECT INS.ANIMAL_ID, INS.NAME
FROM ANIMAL_INS INS
JOIN ANIMAL_OUTS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE OUTS.DATETIME < INS.DATETIME
ORDER BY INS.DATETIME


-- 아직 입양을 못 간 동물중, 가장 오래 보호소에 있었던 동물 3마리의 이름 조회(차집합)
-- https://programmers.co.kr/learn/courses/30/lessons/59044
SELECT
AI.NAME, AI.DATETIME 
FROM ANIMAL_OUTS AO
RIGHT OUTER JOIN ANIMAL_INS AI ON AO.ANIMAL_ID = AI.ANIMAL_ID
WHERE AO.ANIMAL_ID IS NULL ORDER BY AI.DATETIME LIMIT 3;

SELECT INS.NAME, INS.DATETIME
FROM ANIMAL_INS INS
LEFT JOIN ANIMAL_OUTS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE OUTS.SEX_UPON_OUTCOME IS NULL
ORDER BY INS.DATETIME ASC LIMIT 3


-- 보호소에 들어올 때는 중성화 되지 않았지만, 보호소에서 나갈 당시 중성화된 동물 조회
-- https://programmers.co.kr/learn/courses/30/lessons/59045
SELECT INS.ANIMAL_ID, INS.ANIMAL_TYPE, INS.NAME
FROM ANIMAL_INS INS
INNER JOIN ANIMAL_OUTS OUTS
ON INS.ANIMAL_ID = OUTS.ANIMAL_ID AND INS.SEX_UPON_INTAKE <> OUTS.SEX_UPON_OUTCOME;

SELECT INS.ANIMAL_ID, INS.ANIMAL_TYPE, INS.NAME
FROM ANIMAL_INS INS
JOIN ANIMAL_OUTS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE INS.SEX_UPON_INTAKE <> OUTS.SEX_UPON_OUTCOME
ORDER BY INS.ANIMAL_ID