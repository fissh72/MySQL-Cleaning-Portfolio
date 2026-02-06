--- DATA CLEANING
select *
from layoffs;



--- 1,Remove duplicates
--- 2 Standardize the data
--- 3 Dealing Null values or blank
--- 4 Remove any columns

--- 1,Remove duplicates

CREATE TABLE Layoffs_staging
Like layoffs;

select *
from Layoffs_staging;

INSERT Layoffs_staging 
SELECT *
FROM layoffs;


select *,
row_number()  over(partition by
 company,industry,total_laid_off,percentage_laid_off,'date') as row_num
from Layoffs_staging;

WITH duplicate_cte AS (
select *,
row_number()  over(partition by
 company,location,
 industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from Layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoffs_staging
where company ='casper';


WITH duplicate_cte AS (
select *,
row_number()  over(partition by
 company,location,
 industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from Layoffs_staging
)
 DELETE
from duplicate_cte
where row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2;


INSERT INTO layoffs_staging2
select *,
row_number()  over(partition by
 company,location,
 industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) as row_num
from Layoffs_staging;


select *
from layoffs_staging2;

DELETE
from layoffs_staging2
where row_num >1;
SET SQL_SAFE_UPDATES = 0;

--- 2 Standardize the data

select company,trim(company)
from layoffs_staging2;

UPDATE layoffs_staging2
set company = trim(company);


select distinct industry
from layoffs_staging2
order by 1;

select distinct industry
from layoffs_staging2
order by 1;

update layoffs_staging2
set industry = 'Crypto'
where industry like 'crypto%';

select distinct industry
from layoffs_staging2;

select *
from layoffs_staging2
where country like 'united states%';

select distinct country,trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select distinct country
from layoffs_staging2
order by 1;

select `date`,
str_to_date(`date`,' %m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,' %m/%d/%Y');

select `date` 
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2;

--- 3, Dealing with null values or blank

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null 
or industry = '';

select *
from layoffs_staging2
where company like 'bally%';

select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company =t2.company
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;


update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company =t2.company
set t1.industry =t2.industry
where  t1.industry is null
and t2.industry is not null;

--- since it is not working we got to update the blank '' with null and try updating it again 
update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null 
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null 
and percentage_laid_off is null;

--- 4 remove any columns
select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

