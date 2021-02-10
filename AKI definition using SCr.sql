/*
target_population_1593/1594/total
#1593 IV Vancomycin (normal kidney function)
#1594 IV Vancomycin (PHx. of kidney disease)
일회성으로 투여된 vancomycin은 제외하기 위해서 2일 이상의 투여기간을 가진 사람들만 포함 (cohort start date != cohort end date)
total cohort는 공통으로 사용할 outcome cohort를 만들기 위해 생성
*/

/*
target_population
*/

select subject_id, cohort_start_date, cohort_end_date
into #target_population_1593
from CDMPv532.results_v274.cohort
where cohort_definition_id=1593 and cohort_start_date != cohort_end_date
--9227 rows

select subject_id, cohort_start_date, cohort_end_date
into #target_population_1594
from CDMPv532.results_v274.cohort
where cohort_definition_id=1594 and cohort_start_date != cohort_end_date
--3312 rows

select *
into #target_population_total
from (select * from #target_population_1593
	  union
	  select * from #target_population_1594) total
--12539 rows

/*
kidney injury criteria 1: 0.3mg/dL increase in 48h(2d)
*/

--1.cohort의 각 case에서 vancomycin 투여일부터의 경과 일수 별로 min SCr과 max SCr 추출

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min1, max(b.value_as_number) as max1
into #day1
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=1 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min2, max(b.value_as_number) as max2
into #day2
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=2 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min3, max(b.value_as_number) as max3
into #day3
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=3 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min4, max(b.value_as_number) as max4
into #day4
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=4 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min5, max(b.value_as_number) as max5
into #day5
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=5 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min6, max(b.value_as_number) as max6
into #day6
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=6 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min7, max(b.value_as_number) as max7
into #day7
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=7 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min8, max(b.value_as_number) as max8
into #day8
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=8 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min9, max(b.value_as_number) as max9
into #day9
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=9 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min10, max(b.value_as_number) as max10
into #day10
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=10 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min11, max(b.value_as_number) as max11
into #day11
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=11 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min12, max(b.value_as_number) as max12
into #day12
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=12 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min13, max(b.value_as_number) as max13
into #day13
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=13 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min14, max(b.value_as_number) as max14
into #day14
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)=14 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date

--2.full outer join으로 모든 경과 일수의 min SCr과 max SCr을 case별로 join (0 day SCr은 0 day 당일 뿐 아니라 Baseline SCr을 사용한다)

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as min0, max(b.value_as_number) as max0 
into #day0
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, b.measurement_date, a.cohort_start_date)>=0 and datediff(day, b.measurement_date, a.cohort_start_date)<=2 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date
--10344 rows

--아래처럼 기준이 되는 population 목록을 따로 안 만들어 두면 full outer join 시 subject는 없고 값만 있는 행이 생긴다
select *
into #population
from(
select subject_id, cohort_start_date, cohort_end_date
from #day0
union
select subject_id, cohort_start_date, cohort_end_date
from #day1
union
select subject_id, cohort_start_date, cohort_end_date
from #day2
union
select subject_id, cohort_start_date, cohort_end_date
from #day3
union
select subject_id, cohort_start_date, cohort_end_date
from #day4
union
select subject_id, cohort_start_date, cohort_end_date
from #day5
union
select subject_id, cohort_start_date, cohort_end_date
from #day6
union
select subject_id, cohort_start_date, cohort_end_date
from #day7
union
select subject_id, cohort_start_date, cohort_end_date
from #day8
union
select subject_id, cohort_start_date, cohort_end_date
from #day9
union
select subject_id, cohort_start_date, cohort_end_date
from #day10
union
select subject_id, cohort_start_date, cohort_end_date
from #day11
union
select subject_id, cohort_start_date, cohort_end_date
from #day12
union
select subject_id, cohort_start_date, cohort_end_date
from #day13
union
select subject_id, cohort_start_date, cohort_end_date
from #day14) a
--11754 rows

select a.*, min0, max0, min1, max1, min2, max2, min3, max3, min4, max4, min5, max5, min6, max6, min7, max7, min8, max8, min9, max9, min10, max10,min11, max11, min12, max12, min13, max13, min14, max14
into #SCr_total
from #population a
full outer join #day1 b on a.subject_id=b.subject_id and a.cohort_start_date=b.cohort_start_date
full outer join #day2 c on a.subject_id=c.subject_id and a.cohort_start_date=c.cohort_start_date
full outer join #day3 d on a.subject_id=d.subject_id and a.cohort_start_date=d.cohort_start_date
full outer join #day4 e on a.subject_id=e.subject_id and a.cohort_start_date=e.cohort_start_date
full outer join #day5 f on a.subject_id=f.subject_id and a.cohort_start_date=f.cohort_start_date
full outer join #day6 g on a.subject_id=g.subject_id and a.cohort_start_date=g.cohort_start_date
full outer join #day7 h on a.subject_id=h.subject_id and a.cohort_start_date=h.cohort_start_date
full outer join #day8 i on a.subject_id=i.subject_id and a.cohort_start_date=i.cohort_start_date
full outer join #day9 j on a.subject_id=j.subject_id and a.cohort_start_date=j.cohort_start_date
full outer join #day10 k on a.subject_id=k.subject_id and a.cohort_start_date=k.cohort_start_date
full outer join #day11 l on a.subject_id=l.subject_id and a.cohort_start_date=l.cohort_start_date
full outer join #day12 m on a.subject_id=m.subject_id and a.cohort_start_date=m.cohort_start_date
full outer join #day13 n on a.subject_id=n.subject_id and a.cohort_start_date=n.cohort_start_date
full outer join #day14 o on a.subject_id=o.subject_id and a.cohort_start_date=o.cohort_start_date
full outer join #day0 p on a.subject_id=p.subject_id and a.cohort_start_date=p.cohort_start_date
--11754 rows

--3.원래는 48h이지만 measurement_datetime이 order가 나간 시간으로 추정되기 때문에 measurement-date로 최장 2일 안에서 0.3이상의 상승을 추출하기로 함

select *
into #criteria1
from #SCr_total
where 
max0-min0>=0.3 or
max1-min1>=0.3 or
max2-min2>=0.3 or
max3-min3>=0.3 or
max4-min4>=0.3 or
max5-min5>=0.3 or
max6-min6>=0.3 or
max7-min7>=0.3 or
max8-min8>=0.3 or
max9-min9>=0.3 or
max10-min10>=0.3 or
max11-min11>=0.3 or
max12-min12>=0.3 or
max13-min13>=0.3 or
max14-min14>=0.3 or
max1-min0>=0.3 or
max2-min1>=0.3 or
max3-min2>=0.3 or
max4-min3>=0.3 or
max5-min4>=0.3 or
max6-min5>=0.3 or
max7-min6>=0.3 or
max8-min7>=0.3 or
max9-min8>=0.3 or
max10-min9>=0.3 or
max11-min10>=0.3 or
max12-min11>=0.3 or
max13-min12>=0.3 or
max14-min13>=0.3 or
max2-min0>=0.3 or
max3-min1>=0.3 or
max4-min2>=0.3 or
max5-min3>=0.3 or
max6-min4>=0.3 or
max7-min5>=0.3 or
max8-min6>=0.3 or
max9-min7>=0.3 or
max10-min8>=0.3 or
max11-min9>=0.3 or
max12-min10>=0.3 or
max13-min12>=0.3 or
max14-min13>=0.3
--3806 rows

/*
criteria2: baseline Cr의 1.5배 상승
*/

--1.baseline SCr (SCr ID: 3016723)

select a.subject_id, a.cohort_start_date, a.cohort_end_date, min(b.value_as_number) as value_as_number
into #SCr_baseline
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, b.measurement_date, a.cohort_start_date)>=0 and datediff(day, b.measurement_date, a.cohort_start_date)<=2 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date
--10344 rows

--2.max SCr in 14 days

select a.subject_id, a.cohort_start_date, a.cohort_end_date, max(b.value_as_number) as value_as_number
into #SCr_14d_max
from (select *
	  from #target_population_total) a
join (select *
	  from CDMPv532.dbo.measurement
	  where measurement_concept_id=3016723) b
on a.subject_id=b.person_id
where datediff(day, a.cohort_start_date, b.measurement_date)>=1 and datediff(day, a.cohort_start_date, b.measurement_date)<=14 and b.value_as_number is not null and b.value_as_number!=0
group by a.subject_id, a.cohort_start_date, a.cohort_end_date
--11279 rows

--3.x1.5 increase in 14d

select a.subject_id, a.cohort_start_date, a.cohort_end_date, b.value_as_number/a.value_as_number as rate
into #criteria2
from #SCr_baseline a
join #SCr_14d_max b
on a.subject_id=b.subject_id and a.cohort_start_date=b.cohort_start_date and a.cohort_end_date=b.cohort_end_date
where b.value_as_number/a.value_as_number >= 1.5
--2488 rows

/*
최종 outcome cohort
#1597 continuous renal replacement therapy도 포함시켜야 함
plp에서 잡을 수 있도록 cohort start date에서 하루 미룬다
*/

select *
into #outcome_cohort
from (
select 1597 as cohort_definition_id, subject_id, dateadd(day, 1, cohort_start_date) as cohort_start_date, dateadd(day, 1, cohort_start_date) as cohort_end_date from #criteria1
union
select 1597 as cohort_definition_id, subject_id, dateadd(day, 1, cohort_start_date) as cohort_start_date, dateadd(day, 1, cohort_start_date) as cohort_end_date from #criteria2
union
select * from CDMPv532.results_v274.cohort where cohort_definition_id=1597) outcome
--7324 rows

/*
PLP 패키지에 물릴 cohort 생성
*/

select *
into cohortDb.dbo.SHJin_VancomycinInducedAKI_cohort
from (
select * from CDMPv532.results_v274.cohort where cohort_definition_id=1593
union all
select * from CDMPv532.results_v274.cohort where cohort_definition_id=1594
union all
select * from #outcome_cohort) cohort
--25025 rows
