## 1. What is PostgreSQL?

**PostgreSQL** হলো একটি ওপেন সোর্স, অবজেক্ট রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম, যা ডাটা স্টোর, ডাটা ম্যানেজ এবং ডাটা প্রসেস করার জন্য ব্যবহৃত হয়। এটি অ্যাডভান্সড কুয়েরি, JSON ডাটা টাইপ,  ACID ট্রানজ্যাকশন, ইনডেক্সিং, এবং এক্সটেনসিবিলিটির জন্য জনপ্রিয়।

## 2. What is the purpose of a database schema in PostgreSQL?

একটি **স্কিমা** PostgreSQL - এ ডাটাবেজ অবজেক্ট গুলোর লজিক্যাল গ্রুপিং তৈরি করতে সাহায্য করে। PostgreSQL-এ, স্কিমা হলো টেবিল, ভিউ, ফাংশন, কনস্ট্রেইন্ট, ইনডেক্স, সিকোয়েন্স ইত্যাদি। একটি টেবিল এর অনেক গুলো স্কিমা থাকতে পারে। ডিফল্ট স্কিমা হলো **public**। 

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Primary Key**
- এমন একটি কলাম যা প্রতিটি সারিকে উইনিকভাবে চিহ্নিত করে।
- প্রতিটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে।
- এটি NULL বা ডুপ্লিকেট ভ্যালু গ্রহণ করে না।

**উদাহরণ:**
```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
```
**Foreign Key**
- এটি অন্য একটি টেবিলের Primary Key কে রেফারেন্স করে।
**উদাহরণ:**
```sql
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    course_id INT
);
```
## 4. What is the difference between the VARCHAR and CHAR data types?

**VARCHAR** এবং **CHAR** দুটোই টেক্সট ডেটা সংরক্ষণের জন্য ব্যবহৃত হয়, তবে এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য রয়েছে।

**VARCHAR**
- VARCHAR হলো ভ্যারিয়েবল-সাইজের ডেটা টাইপ, যা টেক্সট ডেটা সংরক্ষণ করে।
- এটি শুধুমাত্র **যতটুকু ক্যারেক্টার প্রয়োজন, ততটুকু জায়গা** ব্যবহার করে, ফলে এটি জায়গা সাশ্রয়ী।

**VARCHAR**
- CHAR হলো ফিক্সড-সাইজ ডেটা টাইপ, যা একটি নির্দিষ্ট দৈর্ঘ্য পর্যন্ত ক্যারেক্টার সংরক্ষণ করে।
- যখন আপনি CHAR কলাম ব্যবহার করেন, এটি নির্দিষ্ট দৈর্ঘ্য অনুযায়ী স্থান বরাদ্দ করে এবং যদি ডেটা ছোট হয়, তাহলে বাকি জায়গা প্লেসহোল্ডার হিসেবে স্পেস দিয়ে পূর্ণ করা হয়।

## 5. Explain the purpose of the WHERE clause in a SELECT statement.

**WHERE** ক্লজ একটি SQL স্টেটমেন্টের অংশ যা একটি টেবিল থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা নির্বাচন করতে ব্যবহৃত হয়। এটি শুধুমাত্র সেই রেকর্ডগুলো নির্বাচন করে, যেগুলি নির্দিষ্ট শর্ত বা কন্ডিশন পূরণ করে।

**উদাহরণ:**
```sql
SELECT * FROM employees
WHERE age > 30;
```
এখানে, WHERE ক্লজটি শুধুমাত্র সেই সমস্ত employees রেকর্ড নির্বাচন করবে, যাদের বয়স 30 বছরের বেশি।

## 6. What are the LIMIT and OFFSET clauses used for?

- **LIMIT** – কতগুলো সারি ফেরত আনবে সেটি নির্ধারণ করে।

- **OFFSET** – কতগুলো সারি স্কিপ করবে সেটি নির্ধারণ করে (pagination-এর জন্য দরকারি)।

**উদাহরণ:**
```sql
SELECT * FROM students 
ORDER BY id 
LIMIT 5 OFFSET 10;
```

## 7. How can you modify data using UPDATE statements?

**UPDATE**
- UPDATE একটি বিদ্যমান ডাটা আপডেট করতে ব্যবহৃত হয়।
- যদি WHERE ক্লজ ব্যবহার না করা হয়, তবে সব রেকর্ড আপডেট হয়ে যাবে।

**উদাহরণ:**
```sql
UPDATE students 
set age = 20
WHERE name = 'sujon';
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

**JOIN** দুই বা ততোধিক টেবিলের সম্পর্কিত ডাটা একত্রিত করতে ব্যবহৃত হয়।

**JOIN-এর ধরন:**
**INNER JOIN** – শুধুমাত্র ম্যাচিং ডাটা ফেরত দেয়।

**LEFT JOIN** – বাম টেবিলের সব ডাটা ফেরত দেয়, কিন্তু ডান টেবিল থেকে শুধুমাত্র ম্যাচিং ডাটা।

**RIGHT JOIN** – ডান টেবিলের সব ডাটা ফেরত দেয়, কিন্তু বাম টেবিল থেকে শুধুমাত্র ম্যাচিং ডাটা।

**FULL JOIN** – উভয় টেবিলের সমস্ত ডাটা ফেরত দেয়, যেখানে ম্যাচ পাওয়া যায় না সেখানে NULL দেখায়।

**উদাহরণ:**
```sql
SELECT students.name, courses.course_name 
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id;
```

## 9. Explain the GROUP BY clause and its role in aggregation operations.

**GROUP BY** একই রকম ডাটা গ্রুপ করে এবং অ্যাগ্রিগেট ফাংশন (COUNT, SUM, AVG) প্রয়োগ করতে সাহায্য করে।

**উদাহরণ:**
```sql
SELECT course_id, COUNT(student_id) AS student_count
FROM enrollments
GROUP BY course_id;
```

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

**COUNT()** – কতটি সারি আছে তা গণনা করে।

**SUM()** – নির্দিষ্ট কলামের মোট যোগফল প্রদান করে।

**AVG()** – নির্দিষ্ট কলামের গড় মান বের করে।

**উদাহরণ:**
```sql
SELECT COUNT(*) FROM students;

SELECT student_id, SUM(frontend_mark + backend_mark) FROM students GROUP BY student_id;

SELECT AVG(age) FROM students;
```

