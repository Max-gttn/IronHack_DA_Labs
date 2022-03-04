```python
# clue 1 : You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​
```


```python
# check element in the crime_scene_report
SELECT * FROM crime_scene_report
WHERE city='SQL City' and date = 20180115 and type = 'murder';

# clue 2 : Security footage shows that there were 2 witnesses. 
#The first witness lives at the last house on "Northwestern Dr". 
#The second witness, named Annabel, lives somewhere on "Franklin Ave".
```


```python
#retrieve witness 2
SELECT * FROM person
WHERE name like "Annabel%" and address_street_name like "%Franklin Ave%";
# clue 3 : id = 16371, Annabel Miller, licence_id = 490173, ssn = 318771143
```


```python
# check interview Annabel
SELECT * FROM interview
WHERE person_id = 16371

# clue 4 : transcript : I saw the murder happen, and 
#I recognized the killer from my gym when I was working out last week on January the 9th.
```


```python
#check gym membership Annabel : : id membership : 90081, membership start date: 20160208, status: gold
SELECT * FROM get_fit_now_member
WHERE name = 'Annabel Miller';

# verify Annabel statement
SELECT * FROM get_fit_now_check_in
WHERE membership_id = 90081;

#check check in date : ok with interview (2018-01-09) at the gym between 16h and 17h
```


```python
#check other members of gym present between 16h and 17h
SELECT * FROM get_fit_now_check_in
WHERE check_in_date = 20180109 and check_out_time > 1600;
#clue 5 : 
#suspect 1: membership_id = 48Z7A
#suspect : membership_id = 48Z55
```


```python
# retrieve suspect names and id
SELECT * FROM get_fit_now_member
WHERE id = '48Z7A' or id = '48Z55';

#clue 6
# suspect 1: person_id=67318 , name = 'Jeremy Bowers'
# suspect 1: person_id=28819, name = 'Joe Germuska'
```


```python
# retrieve interview from suspect

#clue 7
# suspect 1 : Jeremy Bowers, interview :  was hired by a woman with a lot of money. 
#I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
#She has red hair and she drives a Tesla Model S. 
#I know that she attended the SQL Symphony Concert 3 times in December 2017.
```


```python
# retrieve employer of Jeremy Bowers

#check who went to symphony concert 3 times in december 2017
SELECT person_id, COUNT(*) FROM facebook_event_checkin
WHERE event_name like '%Symphony Concert%' and date between 20171130 and 20171231
GROUP BY person_id
ORDER BY 2 DESC

#clue 8 : person_id=24556 & person_id=99716

SELECT * FROM person
WHERE id = 24556 or id=99716

# clue 9 : employer probably id=99716 Miranda Priestly, ssn=987756388,license_id=202298 because female
#check if Miranda is indeed the employer of Jeremy
SELECT * FROM drivers_license
WHERE id =202298
# Miranda owns a Tesla Model S as describe by Jeremy, she is the murderer!
```
