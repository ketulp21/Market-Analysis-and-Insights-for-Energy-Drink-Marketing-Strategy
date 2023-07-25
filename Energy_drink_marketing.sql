use dim_repondents;

SELECT * FROM dim_repondents.dim_repondents;

-- Who prefers energy drink more? 

SELECT Gender, count(gender) from dim_repondents group by Gender;

-- Which age group prefers energy drinks more?

SELECT age, count(age) from dim_repondents group by age;

-- Joining two table
SELECT *
FROM dim_repondents
JOIN fact_survey_responses 
ON dim_repondents.Respondent_ID = fact_survey_responses.Respondent_ID;



-- Which type of marketing reaches the most Youth (15-30)?

SELECT r.age, s.Marketing_channels, count(s.Marketing_channels)
FROM dim_repondents r
JOIN fact_survey_responses s ON r.Respondent_ID = s.Respondent_ID
WHERE r.age = '15-18' OR r.age = '19-30'
GROUP BY r.age, s.Marketing_channels;

-- Which type of marketing reaches the most Youth (15-30)?

SELECT fact_survey_responses.Marketing_channels, count(fact_survey_responses.Marketing_channels)
FROM dim_repondents
JOIN fact_survey_responses ON dim_repondents.Respondent_ID = fact_survey_responses.Respondent_ID
WHERE dim_repondents.age = '15-18' OR dim_repondents.age = '19-30'
GROUP BY fact_survey_responses.Marketing_channels;

-- What are the preferred ingredients of energy drinks among respondents?

SELECT s.Ingredients_expected,count(s.Ingredients_expected)
FROM dim_repondents r
JOIN fact_survey_responses s ON r.Respondent_ID = s.Respondent_ID
group by s.Ingredients_expected;

-- What packaging preferences do respondents have for energy drinks?

SELECT s.Packaging_preference,count(s.Packaging_preference)
FROM dim_repondents r
JOIN fact_survey_responses s ON r.Respondent_ID = s.Respondent_ID
group by s.Packaging_preference;

-- Who are the current market leaders?

select s.current_brands,count(s.current_brands)
from fact_survey_responses s
group by s.current_brands;

-- What are the primary reasons consumers prefer those brands over ours?

select s.Reasons_for_choosing_brands, count(s.Reasons_for_choosing_brands)
from fact_survey_responses s
where not current_brands='codex'
group by s.Reasons_for_choosing_brands;

-- Which marketing channel can be used to reach more customers?

select s.Marketing_channels, count(s.Marketing_channels)
from fact_survey_responses s
group by s.Marketing_channels ;

-- How effective are different marketing strategies and channels in reaching our customers?

select s.Marketing_channels, count(s.Marketing_channels)
from fact_survey_responses s
where s.current_brands='Codex'
group by s.Marketing_channels ;

-- How is our brand perception?

select s.brand_perception, count(s.brand_perception)
from fact_survey_responses s
where not current_brands='codex'
group by s.brand_perception;

-- How is our brand performing in different cities?

SELECT dc.city, count(dc.city)
FROM fact_survey_responses AS fsr
JOIN dim_repondents AS dr ON fsr.respondent_id = dr.respondent_id
JOIN dim_cities AS dc ON dr.city_id = dc.city_id
where fsr.current_brands="codex"
group by dc.city;

-- Where do respondents prefer to purchase energy drinks?

select s.purchase_location, count(s.purchase_location)
from fact_survey_responses s
group by s.purchase_location;

-- What are the typical consumption situations for energy drinks among respondents?

select s.Typical_consumption_situations, count(s.Typical_consumption_situations)
from fact_survey_responses s
group by s.Typical_consumption_situations;

-- What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

select s.Limited_edition_packaging, count(s.Limited_edition_packaging)
from fact_survey_responses s
group by s.Limited_edition_packaging;

select s.price_range, count(s.price_range)
from fact_survey_responses s
group by s.price_range;

select s.Reasons_for_choosing_brands, count(s.Reasons_for_choosing_brands)
from fact_survey_responses s
where current_brands='codex'
group by s.Reasons_for_choosing_brands;
