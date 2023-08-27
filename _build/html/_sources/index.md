# CSC 331: Operating Systems

## Instructor
- **Instructor**: Linh B. Ngo
- **Office**: Room 138, 25 University Avenue (UNA building)
- **Office Hours**: TBD
- **Email**: lngo AT wcupa DOT edu
- **Phone**: 610-436-2595 (don’t call, email)



## Course Description
This course will introduce three fundamental concepts in operating system (OS): Virtualization, 
Concurrency, and Persistence.

- In Virtualization, we learn how OS creates abstractions through which programmers can interact 
with the underlying hardware. Examples of these abstractions include processes, memory spaces, 
and CPU scheduling.

- In Concurrency, we learn about how OS supports sharing of physical resources among these 
abstractions. These include thread, lock, and semaphores.

- In Persistence, we learn about how OS enables the long term management of information, produced 
or required by computer programs, in a manner that persists beyond the scope or the 
duration of these programs.

Understanding how operating systems work will facilitate better understanding about how programs 
are run by the computer hardware. This will lead to more efficient, stable, and secure programs.



## Learning Objectives


### Course Student Learning Outcomes (CSLO)
  1. Be able to create and manipulate processes, manage run-time memory, 
  and read and write to file systems
  2. Be able to create and manage threads and navigate around the potential 
  issues in thread concurrency.
  3. Be able to implement architectural changes to an OS.

### CS Program Objectives (CSPO):
  1. Be able to apply theory, techniques, and methodologies to create and/or 
  maintain high quality computing systems that function effectively and reliably 
  in the emerging and future information infrastructure (CSLO 1, 2, 3).

### CS/ABET Program Outcomes (ABET):
  1. ABET 1: Analyze a complex computing problem and to apply principles of 
  computing and other relevant disciplines to identify solutions (CSLO 1).
  2. ABET 2: Design, implement, and evaluate a computing-based solution to meet 
  a given set of computing requirements in the context of the program’s 
  discipline (CSLO 2, 3).
  3. ABET 5: Function effectively as a member or leader of a team engaged in 
  activities appropriate to the program’s discipline (CSLO 4, 5).

### Course Topics:
- Virtualization
  - Process 
  - CPU scheduling
  - Memory management 
- Concurrency
  - Threads
  - Locks and condition variables
  - Semaphores and deadlocks
- Persistence
  - Input/output
  - File systems
- Real-time OS and security issues
- Distributed OS and security issues

### Artifacts used to demonstrate Student Learning Outcomes:
- Assignments: In writing and running programs and analyzing execution performances, 
students will be assessed on SLO1 and SLO2.
  - Writing C codes that demonstrate understanding and the ability to:
    - create and manipulate processes.
    - manage run-time memory.
    - read and write to file systems. 
  - Writing C codes that demonstrate understanding and the ability to:
    - create and manage threads. 
    - navigate around the potential issues in thread concurrency. 
- Lab: Working as a team to modify existing codes in the xv6 OS to implement architectural 
  changes to the OS. 
- Quizzes and Exams: Students will be assessed on their understanding of theoretical concepts
necessary to support the tasks decribed in the assignments.


## Prerequisites
- Foundation of Computer Science (CSC 220)
- Computer Science III (CSC 240)
- Computer Organizations (CSC 242) or Computer Systems (CSC 231)
- Data Structures and Algorithms (CSC 241)


## Required Text (either print or e-book):

**Operating Systems: Three Easy Pieces** by Remzi H. Arpaci-Dusseau and Andrea C. Arpaci-Dusseau.
The authors offer free downloadable PDF of all the book's chapters on [the book's website][ostep]. 


## Assessments and Grading:

### Method of Evaluation

```{list-table} Method of Evaluation
:header-rows: 1
:name: method-of-evaluation

* - Assessment
  - \% of Final Grade
  - Course Objectives Assessed
  - Program Objectives Assessed
  - ABET Objectives Assessed
* - Programming Assignments
  - 40\%
  - CSLO 1, 2, 3
  - CSPO 1
  - ABET 1, 2, 3
* - Quizzes
  - 35\%
  - CSLO 1, 2, 3
  - CSPO 1
  - ABET 1, 3
* - Exams
  - 25\%
  - CSLO 1, 2, 3
  - CSPO 1
  - ABET 1, 3
```

### Grade Scale:

| Numeric | Letter |
| ---------- | ----- |
| 100-93 |	A |
| 92-90	| A- |
| 89-87	| B+ |
| 86-83	| B |
| 82-80	| B- |
| 79-77	| C+ |
| 76-73	| C |
| 72-70	| C- |
| 69-67	| D+ |
| 66-63	| D |
| 62-60	| D- |
| <= 59	| F |

Refer to the [Grading Information section](https://catalog.wcupa.edu/undergraduate/academic-policies-procedures/grading-information/) 
section of the Undergraduate Catalog for description  of NG (No Grade), 
W, Z, and other grades. 



## Policy

### Students with Disabilities
If you have a disability that requires accommodations under the Americans with Disabilities Act (ADA), please present your letter of accommodations and meet with me as soon as possible so that I can support your success in an informed manner. Accommodations cannot be granted retroactively. If you would like to know more about West Chester University’s Services for Students with Disabilities (OSSD), please visit them at 223 Lawrence Center. Their phone number is 610-436-2564, their fax number is 610-436-2600, their email address is ossd@wcupa.edu, and their website is at https://www.wcupa.edu/universityCollege/ossd/.  In an effort to assist students who either receive or may believe they are entitled to receive accommodations under the Americans with Disabilities Act and Section 504 of the Rehabilitation Act of 1973, the University has appointed a student advocate to be a contact for students who have questions regarding the provision of their accommodations or their right to accommodations. The advocate will assist any student who may have questions regarding these rights. The Director for Equity and Compliance/Title IX Coordinator has been designated in this role. Students who need assistance with their rights to accommodations should contact them at 610-436-2433.

### Excused Absences Policy
Students are advised to carefully read and comply with the excused absences policy, including absences for university-sanctioned events, contained in the WCU Undergraduate Catalog. In particular, please note that the “responsibility for meeting academic requirements rests with the student,” that this policy does not excuse students from completing required academic work, and that professors can require a “fair alternative” to attendance on those days that students must be absent from class in order to participate in a University-Sanctioned Event.

### Electronic Mail Policy 
It is expected that faculty, staff, and students activate and maintain regular access to University provided e-mail accounts. Official university communications, including those from your instructor, will be sent through your university e-mail account. You are responsible for accessing that mail to be sure to obtain official University communications. Failure to access will not exempt individuals from the responsibilities associated with this course.

### Academic & Personal Integrity
It is the responsibility of each student to adhere to the university’s standards for academic integrity. Violations of academic integrity include any act that violates the rights of another student in academic work, that involves misrepresentation of your own work, or that disrupts the instruction of the course. Other violations include (but are not limited to): cheating on assignments or examinations; plagiarizing, which means copying any part of another’s work and/or using ideas of another and presenting them as one’s own without giving proper credit to the source; selling, purchasing, or exchanging of term papers; falsifying of information; and using your own work from one class to fulfill the assignment for another class without significant modification. Proof of academic misconduct can result in the automatic failure and removal from this course. For questions regarding Academic Integrity, the No-Grade Policy, Sexual Harassment, or the Student Code of Conduct, students are encouraged to refer to the Department Undergraduate Handbook, the Undergraduate Catalog, the Ram’s Eye View, and the University website at www.wcupa.edu. 

### Computer Science Department Dishonesty Policy:
The Computer Science Committee has adopted the following policies in regard
to academic dishonesty in Computer Science classes:
1. A student found to be academically dishonest in an assignment will receive
zero for that assignment if it is his/her first offense in that class [the
course, not the class period], but an F for the course if it is for his/her
second offense in that class [the course].  
2. A student found to be academically dishonest in a test will receive the
grade of F in that class [the course].
3. For the purposes of this document on academic dishonesty, every form or
method of evaluation in a class will be considered as being of one of two
types: an assignment or a test. Assignments include homework assignments, and
short quizzes [and labs]. Tests include final exams and major exams. An
instructor has, subject to these guidelines, the discretion to determine the
type of any other form of evaluation, such as a project, in his/her class.
4. A student who has received the grade of F in a course because of academic
dishonesty and who wants or is required to repeat that course may re-take
that course only as a regularly scheduled course that is open to the student
community in general. In exceptional circumstances, this condition may be
revoked, but only by an explicit action to that effect by the full Computer
Science Committee, and only then on a case by case basis.
5. The term academic dishonesty is used throughout in the sense provided by
the rules and regulations of West Chester University. The following is taken
from The Ram's Eye View of 1997-1998: **“Academic dishonesty as it applies to
students includes but is not limited to academic cheating; plagiarism; the
sale, purchase, or exchange of term papers or research papers; falsification
of information which includes any form of providing false or misleading
information, written, electronic, or oral; or of altering or falsifying
official institutional records. Plagiarism is defined as copying another's
work or portion thereof and/or using ideas and concepts of another and
presenting them as one's own without giving proper credit to the source.”**

### No-Grade, Violation of Academic Integrity, and Violation of Student Code of Conduct Policy:
For questions regarding Academic Dishonesty, the No-Grade policy, Sexual
Harassment, or the Student Code of Conduct, students are encouraged to refer
to their major department’s handbook, the Undergraduate Course Catalogue, the
Rams Eye View, or the University Web Site. Please understand that improper
conduct in any of these areas will not be tolerated and may result in
immediate ejections from the class.

### Reporting Incidents of Sexual Violence
West Chester University and its faculty are committed to assuring a safe and productive educational environment for all students. In order to comply with the requirements of Title IX of the Education Amendments of 1972 and the University’s commitment to offering supportive measures in accordance with the new regulations issued under Title IX, the University requires faculty members to report incidents of sexual violence shared by students to the University's Title IX Coordinator. The only exceptions to the faculty member's reporting obligation are when incidents of sexual violence are communicated by a student during a classroom discussion, in a writing assignment for a class, or as part of a University-approved research project. Faculty members are obligated to report sexual violence or any other abuse of a student who was, or is, a child (a person under 18 years of age) when the abuse allegedly occurred to the person designated in the University Protection of Minors Policy. Information regarding the reporting of sexual violence and the resources that are available to victims of sexual violence is set forth at: https://www.wcupa.edu/_admin/diversityEquityInclusion/sexualMisconduct/default.aspx

### Inclusive Learning Environment and Anti-racist Statement
Diversity, equity, and inclusion are central to West Chester University’s mission as reflected in our Mission Statement, Values Statement, Vision Statement and Strategic Plan: Pathways to Student Success. We disavow racism and all actions that silence, threaten, or degrade historically marginalized groups in the U.S. We acknowledge that all members of this learning community may experience harm stemming from forms of oppression including but not limited to classism, ableism, heterosexism, sexism, Islamophobia, anti-Semitism, and xenophobia, and recognize that these forms of oppression are compounded by racism. 
Our core commitment as an institution of higher education shapes our expectation for behavior within this learning community, which represents diverse individual beliefs, backgrounds, and experiences. Courteous and respectful behavior, interactions, and responses are expected from all members of the University. We must work together to make this a safe and productive learning environment for everyone. Part of this work is recognizing how race and other aspects of who we are shape our beliefs and our experiences as individuals. It is not enough to condemn acts of racism. For real, sustainable change, we must stand together as a diverse coalition against racism and oppression of any form, anywhere, at any time. 
Resources for education and action are available through WCU’s Office for Diversity, Equity, and Inclusion (ODEI), DEI committees within departments or colleges, the student ombudsperson, and centers on campus committed to doing this work (e.g., Dowdy Multicultural Center, Center for Women and Gender Equity, and the Center for Trans and Queer Advocacy). 
Guidance on how to report incidents of discrimination and harassment is available at the University’s Office of Diversity, Equity and Inclusion.

### Emergency Preparedness
All students are encouraged to sign up for the University’s free WCU ALERT service, which delivers official WCU emergency text messages directly to your cell phone.  For more information, visit www.wcupa.edu/wcualert. To report an emergency, call the Department of Public Safety at 610-436-3311.



