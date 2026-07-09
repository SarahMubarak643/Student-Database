# SQL Fundamentals Assignment - README

**Student Name:** Sarah Mubarak
**Database Tool Used:** MySQL (MySQL Workbench)
**Database Name:** training_center_db
**SQL File:** assignment2.sql

## How to Run

1. Open the file in MySQL Workbench.
2. Run the entire script from top to bottom.
3. The script drops and recreates `training_center_db`, so it can be run fresh at any time without manual fixes.

## Notes

- Course "Network Security Essentials" (course_id 7) has no enrollments, used to test LEFT JOIN.
- Deleting course_id 5 in Task 3 also removes its related enrollments automatically (ON DELETE CASCADE).
- View `vw_student_course_summary` is created, then replaced with an added `grade_status` column.
- Window functions (bonus section) are not included in this submission.
