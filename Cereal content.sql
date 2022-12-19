CREATE SCHEMA cereals_content_analysis;

SELECT * 
FROM cereals_content_analysis.cereal;

/* Data Cleaning
remove the negative values in sugars and potass columns*/

DELETE 
FROM  `cereals_content_analysis`.`cereal`
WHERE sugars =-1;

DELETE
FROM `cereals_content_analysis`.`cereal`
WHERE potass=-1;




-- What is the average content of each nutrient and element per manufacturer?
SELECT 
mfr,
round( AVG(calories),2) AS calories,
round( AVG(protein),2) AS protein,
round( AVG(fat),2) AS fat,
round( AVG(sugars),2) AS sugars,
round( AVG(sodium),2) AS sodium,
round( AVG(fiber),2) AS fiber,
round( AVG(carbo),2) AS carbo,
round(AVG(potass),2) AS potass,
round(AVG(vitamins),2) AS vitamins,
round( AVG(weight),2) AS weight,
round( AVG(cups),2) AS cups
FROM cereals_content_analysis.cereal
GROUP BY mfr;

/* What is the number of calories per ounce for each product?
 1 calories= 0.0045714286 
 Most raisins products have the high number of ounces per serving*/

SELECT 
name,
calories,
round((calories*0.0045714286),2) AS oz
FROM cereals_content_analysis.cereal
GROUP BY name
ORDER BY round((calories*0.0045714286),2) DESC;

-- 1. What is the average rating per manufacturer? Is it somehow connected to average nutrient content?
SELECT 
mfr,
round(AVG(rating),2) AS avg_rating,
(protein+fat+fiber+carbo)/4 AS avg_nutrient,
AVG(protein) AS avg_protein,
AVG(fat) AS avg_fat,
AVG(fiber) AS avg_fiber,
AVG(carbo) AS avg_carbo
FROM  cereals_content_analysis.cereal
GROUP BY mfr
ORDER BY round(AVG(rating),2) DESC;
-- 2. Which manufacturer possesses the best shelf location?
SELECT 
mfr,
shelf
FROM `cereals_content_analysis`.`cereal`
GROUP BY mfr
ORDER BY shelf ;

-- 3. What is the nutritional value of each cereal according to protein, fat, and carbohydrate data.
SELECT 
name,
protein,
fat,
carbo
FROM `cereals_content_analysis`.`cereal`
GROUP BY name
ORDER BY carbo DESC;

-- 4. Which cereal has the highest sugar levels
SELECT 
name,
mfr,
sugars,
type,
rating
FROM `cereals_content_analysis`.`cereal`
GROUP BY name,mfr
ORDER BY sugars DESC;

-- 5. What is the relationship between fiber,protein and rating
SELECT 
name,
fiber,
protein,
rating
FROM `cereals_content_analysis`.`cereal`
GROUP BY name
ORDER BY fiber DESC;
-- 6. What are the top 10 cereals with the highest number of elements
SELECT 
name,
sodium,
potass,
vitamins
FROM `cereals_content_analysis`.`cereal`
GROUP BY name
ORDER BY sodium DESC
LIMIT 10;
-- Best kind of cereals
SELECT 
name,
fat,
calories,
sugars,
fiber,
protein
FROM `cereals_content_analysis`.`cereal`
GROUP BY name
ORDER BY sugars DESC






