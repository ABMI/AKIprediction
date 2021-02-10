/*
target_population_1593/1594/total
#1593 IV Vancomycin (normal kidney function)
#1594 IV Vancomycin (PHx. of kidney disease)
��ȸ������ ������ vancomycin�� �����ϱ� ���ؼ� 2�� �̻��� �����Ⱓ�� ���� ����鸸 ���� (cohort start date != cohort end date)
total cohort�� �������� ����� outcome cohort�� ����� ���� ����
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

--1.cohort�� �� case���� vancomycin �����Ϻ����� ��� �ϼ� ���� min SCr�� max SCr ����

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

--2.full outer join���� ��� ��� �ϼ��� min SCr�� max SCr�� case���� join (0 day SCr�� 0 day ���� �� �ƴ϶� Baseline SCr�� ����Ѵ�)

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

--�Ʒ�ó�� ������ �Ǵ� population ����� ���� �� ����� �θ� full outer join �� subject�� ���� ���� �ִ� ���� �����
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

--3.������ 48h������ measurement_datetime�� order�� ���� �ð����� �����Ǳ� ������ measurement-date�� ���� 2�� �ȿ��� 0.3�̻��� ����� �����ϱ�� ��

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
criteria2: baseline Cr�� 1.5�� ���
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
���� outcome cohort
#1597 continuous renal replacement therapy�� ���Խ��Ѿ� ��
plp���� ���� �� �ֵ��� cohort start date���� �Ϸ� �̷��
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
PLP ��Ű���� ���� cohort ����
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
