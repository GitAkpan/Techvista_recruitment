
-- TechVista Solutions - Extended Recruitment Database


CREATE DATABASE IF NOT EXISTS techvista_hr_extended;
USE techvista_hr_extended;

-- Drop tables if they exist (for clean re-runs)
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS interviews;
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS departments;


-- TABLE 1: DEPARTMENTS
-- Stores department information and budget

CREATE TABLE departments (
    department_id   INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    manager_name    VARCHAR(100),
    annual_budget   DECIMAL(12, 2) NOT NULL,
    headcount_limit INT NOT NULL,
    location        VARCHAR(50)
);

INSERT INTO departments (department_name, manager_name, annual_budget, headcount_limit, location) VALUES
('IT',        'Dr. Adewale Thompson',  15000000.00, 45, 'Lagos - Victoria Island'),
('HR',        'Mrs. Chinelo Adebayo',   8000000.00, 20, 'Lagos - Ikoyi'),
('Finance',   'Mr. Ibrahim Kazeem',    12000000.00, 25, 'Lagos - Victoria Island'),
('Marketing', 'Ms. Funke Olatunde',    10000000.00, 30, 'Lagos - Lekki');

-- TABLE 2: POSITIONS
-- Stores job positions with salary ranges and requirements

CREATE TABLE positions (
    position_id         INT PRIMARY KEY AUTO_INCREMENT,
    position_name       VARCHAR(100) NOT NULL,
    department_id       INT NOT NULL,
    min_salary          DECIMAL(10, 2) NOT NULL,
    max_salary          DECIMAL(10, 2) NOT NULL,
    min_experience_yrs  INT NOT NULL,
    required_degree     VARCHAR(100),
    status              VARCHAR(20) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO positions (position_name, department_id, min_salary, max_salary, min_experience_yrs, required_degree, status) VALUES
-- IT Positions
('Software Developer',      1, 35000.00,  85000.00, 2, 'Computer Science/Software Engineering', 'Active'),
('Data Analyst',            1, 40000.00,  75000.00, 2, 'Computer Science/Statistics/Mathematics', 'Active'),
('Cybersecurity Analyst',   1, 50000.00,  90000.00, 3, 'Cybersecurity/Computer Science', 'Active'),
('UI/UX Designer',          1, 30000.00,  70000.00, 1, 'Design/HCI/Computer Science', 'Active'),
('Systems Administrator',   1, 45000.00,  80000.00, 3, 'Computer Science/Information Technology', 'Active'),

-- HR Positions
('HR Manager',              2, 55000.00,  85000.00, 5, 'Human Resources/Business Administration', 'Active'),
('Recruitment Officer',     2, 30000.00,  55000.00, 2, 'Human Resources/Psychology', 'Active'),
('HR Generalist',           2, 35000.00,  60000.00, 2, 'Human Resources/Business Administration', 'Active'),

-- Finance Positions
('Financial Analyst',       3, 45000.00,  80000.00, 3, 'Finance/Accounting/Economics', 'Active'),
('Accountant',              3, 35000.00,  70000.00, 2, 'Accounting/Finance', 'Active'),
('Budget Analyst',          3, 40000.00,  75000.00, 3, 'Finance/Accounting/Economics', 'Active'),

-- Marketing Positions
('Marketing Manager',       4, 50000.00,  85000.00, 4, 'Marketing/Business Administration', 'Active'),
('Digital Marketer',        4, 30000.00,  65000.00, 1, 'Marketing/Communications/Digital Media', 'Active'),
('Brand Strategist',        4, 40000.00,  75000.00, 3, 'Marketing/Communications/Business', 'Active'),
('Content Writer',          4, 25000.00,  55000.00, 1, 'Communications/English/Journalism', 'Active');


-- TABLE 3: CANDIDATES
-- Stores candidate personal and professional information
CREATE TABLE candidates (
    candidate_id     INT PRIMARY KEY AUTO_INCREMENT,
    full_name        VARCHAR(100) NOT NULL,
    email            VARCHAR(100) NOT NULL UNIQUE,
    phone            VARCHAR(20),
    years_experience INT NOT NULL,
    highest_degree   VARCHAR(50) NOT NULL,
    current_company  VARCHAR(100),
    referral_source  VARCHAR(50),
    registered_date  DATE NOT NULL
);

INSERT INTO candidates (full_name, email, phone, years_experience, highest_degree, current_company, referral_source, registered_date) VALUES
-- IT Candidates
('Chukwuemeka Obi',      'c.obi@email.com',         '080-1234-5601', 6, 'Bachelor', 'SystemSpecs', 'LinkedIn', '2024-01-05'),
('Amaka Nwosu',          'a.nwosu@email.com',       '080-1234-5602', 2, 'Bachelor', 'Freelancer', 'Jobberman', '2024-01-12'),
('Tunde Adeyemi',        't.adeyemi@email.com',     '080-1234-5603', 4, 'Master', 'Interswitch', 'Employee Referral', '2024-01-18'),
('Ngozi Eze',            'n.eze@email.com',         '080-1234-5604', 7, 'Bachelor', 'Andela', 'LinkedIn', '2024-01-30'),
('Seun Afolabi',         's.afolabi@email.com',     '080-1234-5605', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-02-05'),
('Kelechi Nwachukwu',    'k.nwachukwu@email.com',   '080-1234-5606', 5, 'Master', 'MainOne', 'LinkedIn', '2024-02-14'),
('Bisi Okonkwo',         'b.okonkwo@email.com',     '080-1234-5607', 3, 'Bachelor', 'Flutterwave', 'Employee Referral', '2024-02-20'),
('Emeka Chukwu',         'e.chukwu@email.com',      '080-1234-5608', 8, 'Master', 'Paystack', 'LinkedIn', '2024-02-28'),
('Funmi Adeleke',        'f.adeleke@email.com',     '080-1234-5609', 2, 'Bachelor', 'Konga', 'Jobberman', '2024-03-06'),
('Gbenga Salami',        'g.salami@email.com',      '080-1234-5610', 4, 'Bachelor', 'Jumia', 'Company Website', '2024-03-14'),
('Hauwa Musa',           'h.musa@email.com',        '080-1234-5611', 5, 'Bachelor', 'NIIT', 'LinkedIn', '2024-03-21'),
('Ifeanyi Onyekwere',    'i.onyekwere@email.com',   '080-1234-5612', 9, 'Master', 'MTN Nigeria', 'LinkedIn', '2024-03-28'),
('Jumoke Fashola',       'j.fashola@email.com',     '080-1234-5613', 3, 'Bachelor', 'Freelancer', 'Company Website', '2024-04-04'),
('Kingsley Ogbonna',     'k.ogbonna@email.com',     '080-1234-5614', 6, 'Master', 'Andela', 'Employee Referral', '2024-04-11'),
('Lola Akinwande',       'l.akinwande@email.com',   '080-1234-5615', 1, 'Bachelor', 'Recent Graduate', 'Jobberman', '2024-04-18'),
('Musa Dangana',         'm.dangana@email.com',     '080-1234-5616', 5, 'Bachelor', 'SystemSpecs', 'LinkedIn', '2024-05-02'),
('Nkechi Obiora',        'n.obiora@email.com',      '080-1234-5617', 4, 'Bachelor', 'Interswitch', 'Employee Referral', '2024-05-09'),
('Obinna Nzekwe',        'o.nzekwe@email.com',      '080-1234-5618', 2, 'Bachelor', 'Freelancer', 'Company Website', '2024-05-16'),
('Patience Udo',         'p.udo@email.com',         '080-1234-5619', 6, 'Master', 'Flutterwave', 'LinkedIn', '2024-05-23'),
('Rotimi Adebayo',       'r.adebayo@email.com',     '080-1234-5620', 3, 'Bachelor', 'Paystack', 'Jobberman', '2024-05-30'),
('Sola Badmus',          's.badmus@email.com',      '080-1234-5621', 7, 'Master', 'Konga', 'LinkedIn', '2024-06-06'),
('Taiwo Ogunleye',       't.ogunleye@email.com',    '080-1234-5622', 2, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-06-13'),
('Uche Okoro',           'u.okoro@email.com',       '080-1234-5623', 5, 'Bachelor', 'Jumia', 'Employee Referral', '2024-06-20'),
('Vera Okafor',          'v.okafor@email.com',      '080-1234-5624', 4, 'Bachelor', 'NIIT', 'LinkedIn', '2024-06-27'),
('Wale Oshodi',          'w.oshodi@email.com',      '080-1234-5625', 8, 'Master', 'MTN Nigeria', 'LinkedIn', '2024-07-04'),
('Yemi Olawale',         'y.olawale@email.com',     '080-1234-5626', 3, 'Bachelor', 'Freelancer', 'Jobberman', '2024-07-11'),
('Zainab Yakubu',        'z.yakubu@email.com',      '080-1234-5627', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-07-18'),
('Abel Okonkwo',         'a.okonkwo@email.com',     '080-1234-5628', 5, 'Bachelor', 'SystemSpecs', 'Employee Referral', '2024-08-01'),
('Blessing Nnaji',       'b.nnaji@email.com',       '080-1234-5629', 6, 'Master', 'Andela', 'LinkedIn', '2024-08-08'),
('Chisom Aneke',         'c.aneke@email.com',       '080-1234-5630', 2, 'Bachelor', 'Interswitch', 'Jobberman', '2024-08-15'),

-- HR Candidates
('Damilola Bello',       'd.bello@email.com',       '080-1234-5631', 7, 'Master', 'Access Bank', 'LinkedIn', '2024-01-07'),
('Esther Nwofor',        'e.nwofor@email.com',      '080-1234-5632', 2, 'Bachelor', 'GTBank', 'Jobberman', '2024-01-21'),
('Fatima Abubakar',      'f.abubakar@email.com',    '080-1234-5633', 4, 'Bachelor', 'First Bank', 'Employee Referral', '2024-02-04'),
('George Eneh',          'g.eneh@email.com',        '080-1234-5634', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-02-18'),
('Helen Nwosu',          'h.nwosu@email.com',       '080-1234-5635', 9, 'Master', 'Zenith Bank', 'LinkedIn', '2024-03-03'),
('Ibrahim Sule',         'i.sule@email.com',        '080-1234-5636', 3, 'Bachelor', 'UBA', 'Jobberman', '2024-03-17'),
('Janet Adeola',         'j.adeola@email.com',      '080-1234-5637', 5, 'Bachelor', 'Stanbic IBTC', 'Employee Referral', '2024-03-31'),
('Kenneth Eze',          'k.eze@email.com',         '080-1234-5638', 6, 'Master', 'FCMB', 'LinkedIn', '2024-04-14'),
('Lydia Okeke',          'l.okeke@email.com',       '080-1234-5639', 2, 'Bachelor', 'Ecobank', 'Company Website', '2024-04-28'),
('Michael Obi',          'm.obi@email.com',         '080-1234-5640', 4, 'Bachelor', 'Sterling Bank', 'Employee Referral', '2024-05-12'),
('Nancy Adaobi',         'n.adaobi@email.com',      '080-1234-5641', 1, 'Bachelor', 'Recent Graduate', 'Jobberman', '2024-05-26'),
('Oscar Igwe',           'o.igwe@email.com',        '080-1234-5642', 8, 'Master', 'Union Bank', 'LinkedIn', '2024-06-09'),
('Priscilla Osei',       'p.osei@email.com',        '080-1234-5643', 3, 'Bachelor', 'Wema Bank', 'Company Website', '2024-06-23'),
('Queen Adesanya',       'q.adesanya@email.com',    '080-1234-5644', 5, 'Bachelor', 'Access Bank', 'Employee Referral', '2024-07-07'),
('Richard Nwachukwu',    'r.nwachukwu@email.com',   '080-1234-5645', 4, 'Bachelor', 'GTBank', 'LinkedIn', '2024-07-21'),
('Sandra Obioma',        's.obioma@email.com',      '080-1234-5646', 6, 'Master', 'First Bank', 'LinkedIn', '2024-08-04'),
('Thomas Emeka',         't.emeka@email.com',       '080-1234-5647', 2, 'Bachelor', 'Zenith Bank', 'Jobberman', '2024-08-18'),

-- Finance Candidates
('Usman Bello',          'u.bello@email.com',       '080-1234-5648', 5, 'Bachelor', 'PwC Nigeria', 'LinkedIn', '2024-01-09'),
('Victoria Okafor',      'v.okafor2@email.com',     '080-1234-5649', 3, 'Bachelor', 'KPMG Nigeria', 'Jobberman', '2024-01-23'),
('Williams Adeyemi',     'w.adeyemi@email.com',     '080-1234-5650', 7, 'Master', 'Deloitte Nigeria', 'Employee Referral', '2024-02-06'),
('Xena Obi',             'x.obi@email.com',         '080-1234-5651', 2, 'Bachelor', 'EY Nigeria', 'Company Website', '2024-02-20'),
('Yusuf Mohammed',       'y.mohammed@email.com',    '080-1234-5652', 6, 'Master', 'PwC Nigeria', 'LinkedIn', '2024-03-05'),
('Zoe Nwosu',            'z.nwosu@email.com',       '080-1234-5653', 1, 'Bachelor', 'Recent Graduate', 'Jobberman', '2024-03-19'),
('Aaron Okolie',         'a.okolie@email.com',      '080-1234-5654', 4, 'Bachelor', 'KPMG Nigeria', 'Employee Referral', '2024-04-02'),
('Beatrice Eze',         'b.eze@email.com',         '080-1234-5655', 8, 'Master', 'Deloitte Nigeria', 'LinkedIn', '2024-04-16'),
('Charles Okonkwo',      'c.okonkwo2@email.com',    '080-1234-5656', 3, 'Bachelor', 'EY Nigeria', 'Company Website', '2024-04-30'),
('Diana Nwofor',         'd.nwofor@email.com',      '080-1234-5657', 5, 'Bachelor', 'PwC Nigeria', 'Employee Referral', '2024-05-14'),
('Edward Bello',         'e.bello@email.com',       '080-1234-5658', 2, 'Bachelor', 'KPMG Nigeria', 'Jobberman', '2024-05-28'),
('Florence Afolabi',     'f.afolabi@email.com',     '080-1234-5659', 7, 'Master', 'Deloitte Nigeria', 'LinkedIn', '2024-06-11'),
('Gabriel Udo',          'g.udo@email.com',         '080-1234-5660', 4, 'Bachelor', 'EY Nigeria', 'Employee Referral', '2024-06-25'),
('Hannah Igwe',          'h.igwe@email.com',        '080-1234-5661', 6, 'Master', 'PwC Nigeria', 'LinkedIn', '2024-07-09'),
('Isaac Osei',           'i.osei@email.com',        '080-1234-5662', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-07-23'),
('Joyce Nwosu',          'j.nwosu@email.com',       '080-1234-5663', 9, 'Master', 'KPMG Nigeria', 'LinkedIn', '2024-08-06'),
('Kevin Eze',            'k.eze2@email.com',        '080-1234-5664', 3, 'Bachelor', 'Deloitte Nigeria', 'Jobberman', '2024-08-20'),
('Laura Adeoye',         'l.adeoye@email.com',      '080-1234-5665', 5, 'Bachelor', 'EY Nigeria', 'Employee Referral', '2024-09-03'),

-- Marketing Candidates
('Marcus Okonkwo',       'm.okonkwo@email.com',     '080-1234-5666', 6, 'Bachelor', 'Ogilvy Nigeria', 'LinkedIn', '2024-01-11'),
('Ngozi Okafor',         'n.okafor@email.com',      '080-1234-5667', 2, 'Bachelor', 'SO&U Nigeria', 'Jobberman', '2024-01-25'),
('Obioma Chukwu',        'o.chukwu@email.com',      '080-1234-5668', 4, 'Bachelor', 'Insight Publicis', 'Employee Referral', '2024-02-08'),
('Philomena Eze',        'p.eze@email.com',         '080-1234-5669', 1, 'Bachelor', 'Freelancer', 'Company Website', '2024-02-22'),
('Quincy Adebayo',       'q.adebayo@email.com',     '080-1234-5670', 7, 'Master', 'The Hook', 'LinkedIn', '2024-03-07'),
('Rebecca Nwachukwu',    'r.nwachukwu2@email.com',  '080-1234-5671', 3, 'Bachelor', 'Redbox', 'Jobberman', '2024-03-21'),
('Samuel Olawale',       's.olawale@email.com',     '080-1234-5672', 5, 'Bachelor', 'SO&U Nigeria', 'Employee Referral', '2024-04-04'),
('Theresa Musa',         't.musa@email.com',        '080-1234-5673', 2, 'Bachelor', 'Freelancer', 'Company Website', '2024-04-18'),
('Uchenna Obiora',       'u.obiora@email.com',      '080-1234-5674', 6, 'Master', 'Ogilvy Nigeria', 'LinkedIn', '2024-05-02'),
('Violet Nnaji',         'v.nnaji@email.com',       '080-1234-5675', 4, 'Bachelor', 'Insight Publicis', 'Jobberman', '2024-05-16'),
('Walter Aneke',         'w.aneke@email.com',       '080-1234-5676', 8, 'Master', 'The Hook', 'LinkedIn', '2024-05-30'),
('Xavier Bello',         'x.bello@email.com',       '080-1234-5677', 3, 'Bachelor', 'Redbox', 'Employee Referral', '2024-06-13'),
('Yetunde Fashola',      'y.fashola@email.com',     '080-1234-5678', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-06-27'),
('Zachariah Salami',     'z.salami@email.com',      '080-1234-5679', 5, 'Bachelor', 'SO&U Nigeria', 'LinkedIn', '2024-07-11'),
('Adaeze Okonkwo',       'a.okonkwo2@email.com',    '080-1234-5680', 2, 'Bachelor', 'Freelancer', 'Jobberman', '2024-07-25'),
('Babatunde Nwosu',      'b.nwosu@email.com',       '080-1234-5681', 7, 'Master', 'Ogilvy Nigeria', 'LinkedIn', '2024-08-08'),
('Chiamaka Eze',         'c.eze@email.com',         '080-1234-5682', 4, 'Bachelor', 'Insight Publicis', 'Employee Referral', '2024-08-22'),
('David Osei',           'd.osei@email.com',        '080-1234-5683', 6, 'Master', 'The Hook', 'LinkedIn', '2024-09-05'),
('Ebele Okoro',          'e.okoro@email.com',       '080-1234-5684', 3, 'Bachelor', 'Redbox', 'Company Website', '2024-09-19'),
('Felix Adeyemi',        'f.adeyemi@email.com',     '080-1234-5685', 5, 'Bachelor', 'SO&U Nigeria', 'Employee Referral', '2024-10-03'),
('Grace Nwofor',         'g.nwofor@email.com',      '080-1234-5686', 2, 'Bachelor', 'Freelancer', 'Jobberman', '2024-10-17'),
('Henry Obi',            'h.obi@email.com',         '080-1234-5687', 1, 'Bachelor', 'Recent Graduate', 'Company Website', '2024-10-31'),
('Ifeoma Igwe',          'i.igwe@email.com',        '080-1234-5688', 4, 'Bachelor', 'Ogilvy Nigeria', 'Employee Referral', '2024-11-14'),
('James Oluwaseun',      'j.oluwaseun@email.com',   '080-1234-5689', 8, 'Master', 'Insight Publicis', 'LinkedIn', '2024-11-28'),
('Kemi Adaobi',          'k.adaobi@email.com',      '080-1234-5690', 3, 'Bachelor', 'The Hook', 'Jobberman', '2024-12-12'),
('Leonard Nwankwo',      'l.nwankwo@email.com',     '080-1234-5691', 2, 'Bachelor', 'Freelancer', 'Company Website', '2024-09-07'),
('Mercy Okeke',          'm.okeke@email.com',       '080-1234-5692', 6, 'Master', 'Redbox', 'Employee Referral', '2024-09-21'),
('Nathaniel Eze',        'n.eze2@email.com',        '080-1234-5693', 4, 'Bachelor', 'SO&U Nigeria', 'LinkedIn', '2024-10-05'),
('Olive Adebayo',        'o.adebayo@email.com',     '080-1234-5694', 7, 'Master', 'Ogilvy Nigeria', 'LinkedIn', '2024-10-19'),
('Peter Okonkwo',        'p.okonkwo@email.com',     '080-1234-5695', 3, 'Bachelor', 'Freelancer', 'Jobberman', '2024-11-02'),
('Rose Chukwu',          'r.chukwu@email.com',      '080-1234-5696', 5, 'Bachelor', 'Insight Publicis', 'Employee Referral', '2024-11-16'),
('Stephen Nwosu',        's.nwosu@email.com',       '080-1234-5697', 2, 'Bachelor', 'The Hook', 'Company Website', '2024-11-30'),
('Tina Okafor',          't.okafor@email.com',      '080-1234-5698', 1, 'Bachelor', 'Recent Graduate', 'Jobberman', '2024-12-14'),
('Victor Eze',           'v.eze@email.com',         '080-1234-5699', 6, 'Master', 'Redbox', 'LinkedIn', '2024-12-17'),
('Winnie Adeyemi',       'w.adeyemi2@email.com',    '080-1234-5700', 4, 'Bachelor', 'SO&U Nigeria', 'Employee Referral', '2024-12-20');

-- TABLE 4: APPLICATIONS
-- Links candidates to positions with application details

CREATE TABLE applications (
    application_id   INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id     INT NOT NULL,
    position_id      INT NOT NULL,
    application_date DATE NOT NULL,
    expected_salary  DECIMAL(10, 2) NOT NULL,
    cover_letter     VARCHAR(255),
    resume_score     INT,
    application_status VARCHAR(30) NOT NULL,
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

INSERT INTO applications (candidate_id, position_id, application_date, expected_salary, cover_letter, resume_score, application_status) VALUES
-- IT Applications
(1,  1, '2024-01-08', 72000.00, 'Submitted', 85, 'Hired'),
(2,  1, '2024-01-15', 38000.00, 'Submitted', 68, 'Rejected - Salary Negotiation Failed'),
(3,  2, '2024-01-22', 47000.00, 'Submitted', 78, 'Hired'),
(4,  5, '2024-02-03', 80000.00, 'Submitted', 88, 'Rejected - Overqualified'),
(5,  1, '2024-02-10', 30000.00, 'Submitted', 55, 'Rejected - Failed Technical Test'),
(6,  3, '2024-02-18', 65000.00, 'Submitted', 82, 'Hired'),
(7,  2, '2024-02-25', 43000.00, 'Submitted', 76, 'Hired'),
(8,  1, '2024-03-04', 95000.00, 'Submitted', 92, 'Rejected - Budget Constraint'),
(9,  4, '2024-03-11', 35000.00, 'Submitted', 72, 'Hired'),
(10, 5, '2024-03-19', 52000.00, 'Submitted', 70, 'Rejected - Position Filled'),
(11, 1, '2024-03-26', 60000.00, 'Submitted', 80, 'Hired'),
(12, 3, '2024-04-02', 110000.00, 'Submitted', 95, 'Rejected - Budget Constraint'),
(13, 4, '2024-04-09', 40000.00, 'Submitted', 65, 'Rejected - Weak Portfolio'),
(14, 2, '2024-04-16', 70000.00, 'Submitted', 86, 'Hired'),
(15, 1, '2024-04-23', 28000.00, 'Submitted', 52, 'Rejected - Insufficient Experience'),
(16, 5, '2024-05-07', 63000.00, 'Submitted', 79, 'Hired'),
(17, 1, '2024-05-14', 50000.00, 'Submitted', 75, 'Hired'),
(18, 3, '2024-05-21', 39000.00, 'Submitted', 64, 'Rejected - Failed Technical Test'),
(19, 4, '2024-05-28', 68000.00, 'Submitted', 84, 'Hired'),
(20, 2, '2024-06-04', 44000.00, 'Submitted', 71, 'Rejected - Position Filled'),
(21, 1, '2024-06-11', 85000.00, 'Submitted', 89, 'Rejected - Budget Constraint'),
(22, 1, '2024-06-18', 33000.00, 'Submitted', 58, 'Rejected - Failed Technical Test'),
(23, 5, '2024-06-25', 61000.00, 'Submitted', 77, 'Hired'),
(24, 3, '2024-07-02', 55000.00, 'Submitted', 81, 'Hired'),
(25, 2, '2024-07-09', 92000.00, 'Submitted', 91, 'Rejected - Budget Constraint'),
(26, 1, '2024-07-16', 42000.00, 'Submitted', 74, 'Hired'),
(27, 4, '2024-07-23', 27000.00, 'Submitted', 50, 'Rejected - Insufficient Experience'),
(28, 1, '2024-08-06', 58000.00, 'Submitted', 78, 'Hired'),
(29, 3, '2024-08-13', 75000.00, 'Submitted', 87, 'Rejected - Position Filled'),
(30, 2, '2024-08-20', 36000.00, 'Submitted', 62, 'Rejected - Failed Technical Test'),

-- HR Applications
(31, 6, '2024-01-10', 70000.00, 'Submitted', 83, 'Hired'),
(32, 7, '2024-01-24', 32000.00, 'Submitted', 66, 'Rejected - Weak Interview'),
(33, 8, '2024-02-07', 45000.00, 'Submitted', 75, 'Hired'),
(34, 7, '2024-02-21', 25000.00, 'Submitted', 53, 'Rejected - Insufficient Experience'),
(35, 6, '2024-03-06', 90000.00, 'Submitted', 90, 'Rejected - Budget Constraint'),
(36, 8, '2024-03-20', 38000.00, 'Submitted', 68, 'Rejected - Position Filled'),
(37, 7, '2024-04-03', 50000.00, 'Submitted', 77, 'Hired'),
(38, 6, '2024-04-17', 65000.00, 'Submitted', 81, 'Hired'),
(39, 8, '2024-05-01', 30000.00, 'Submitted', 60, 'Rejected - Weak Interview'),
(40, 7, '2024-05-15', 42000.00, 'Submitted', 73, 'Hired'),
(41, 8, '2024-05-29', 24000.00, 'Submitted', 51, 'Rejected - Insufficient Experience'),
(42, 6, '2024-06-12', 82000.00, 'Submitted', 88, 'Rejected - Budget Constraint'),
(43, 7, '2024-06-26', 36000.00, 'Submitted', 64, 'Rejected - Position Filled'),
(44, 8, '2024-07-10', 52000.00, 'Submitted', 76, 'Hired'),
(45, 6, '2024-07-24', 48000.00, 'Submitted', 70, 'Rejected - Weak Interview'),
(46, 7, '2024-08-07', 58000.00, 'Submitted', 79, 'Hired'),
(47, 8, '2024-08-21', 29000.00, 'Submitted', 57, 'Rejected - Failed Assessment'),

-- Finance Applications
(48, 9,  '2024-01-12', 62000.00, 'Submitted', 80, 'Hired'),
(49, 10, '2024-01-26', 40000.00, 'Submitted', 67, 'Rejected - Weak Interview'),
(50, 11, '2024-02-09', 78000.00, 'Submitted', 85, 'Hired'),
(51, 9,  '2024-02-23', 35000.00, 'Submitted', 63, 'Rejected - Failed Technical Test'),
(52, 10, '2024-03-08', 68000.00, 'Submitted', 82, 'Hired'),
(53, 11, '2024-03-22', 26000.00, 'Submitted', 54, 'Rejected - Insufficient Experience'),
(54, 9,  '2024-04-05', 50000.00, 'Submitted', 74, 'Hired'),
(55, 10, '2024-04-19', 90000.00, 'Submitted', 91, 'Rejected - Budget Constraint'),
(56, 11, '2024-05-03', 42000.00, 'Submitted', 69, 'Rejected - Position Filled'),
(57, 9,  '2024-05-17', 60000.00, 'Submitted', 78, 'Hired'),
(58, 10, '2024-05-31', 33000.00, 'Submitted', 61, 'Rejected - Weak Interview'),
(59, 11, '2024-06-14', 80000.00, 'Submitted', 87, 'Rejected - Budget Constraint'),
(60, 9,  '2024-06-28', 53000.00, 'Submitted', 75, 'Hired'),
(61, 10, '2024-07-12', 65000.00, 'Submitted', 81, 'Hired'),
(62, 11, '2024-07-26', 24000.00, 'Submitted', 52, 'Rejected - Insufficient Experience'),
(63, 9,  '2024-08-09', 105000.00, 'Submitted', 94, 'Rejected - Budget Constraint'),
(64, 10, '2024-08-23', 38000.00, 'Submitted', 65, 'Rejected - Failed Technical Test'),
(65, 11, '2024-09-06', 57000.00, 'Submitted', 77, 'Hired'),

-- Marketing Applications
(66, 12, '2024-01-14', 68000.00, 'Submitted', 82, 'Hired'),
(67, 13, '2024-01-28', 34000.00, 'Submitted', 66, 'Rejected - Weak Portfolio'),
(68, 14, '2024-02-11', 48000.00, 'Submitted', 74, 'Hired'),
(69, 15, '2024-02-25', 22000.00, 'Submitted', 50, 'Rejected - Insufficient Experience'),
(70, 13, '2024-03-10', 79000.00, 'Submitted', 86, 'Rejected - Budget Constraint'),
(71, 12, '2024-03-24', 43000.00, 'Submitted', 68, 'Rejected - Position Filled'),
(72, 14, '2024-04-07', 58000.00, 'Submitted', 77, 'Hired'),
(73, 15, '2024-04-21', 30000.00, 'Submitted', 59, 'Rejected - Weak Writing Sample'),
(74, 13, '2024-05-05', 70000.00, 'Submitted', 83, 'Hired'),
(75, 12, '2024-05-19', 52000.00, 'Submitted', 71, 'Rejected - Weak Interview'),
(76, 15, '2024-06-02', 88000.00, 'Submitted', 89, 'Rejected - Budget Constraint'),
(77, 14, '2024-06-16', 40000.00, 'Submitted', 72, 'Hired'),
(78, 13, '2024-06-30', 25000.00, 'Submitted', 53, 'Rejected - Insufficient Experience'),
(79, 12, '2024-07-14', 62000.00, 'Submitted', 79, 'Hired'),
(80, 15, '2024-07-28', 28000.00, 'Submitted', 56, 'Rejected - Weak Writing Sample'),
(81, 14, '2024-08-11', 82000.00, 'Submitted', 87, 'Rejected - Budget Constraint'),
(82, 13, '2024-08-25', 46000.00, 'Submitted', 73, 'Hired'),
(83, 12, '2024-09-08', 72000.00, 'Submitted', 84, 'Rejected - Position Filled'),
(84, 15, '2024-09-22', 35000.00, 'Submitted', 64, 'Rejected - Weak Writing Sample'),
(85, 14, '2024-10-06', 55000.00, 'Submitted', 76, 'Hired'),
(86, 13, '2024-10-20', 31000.00, 'Submitted', 60, 'Rejected - Weak Portfolio'),
(87, 15, '2024-11-03', 23000.00, 'Submitted', 49, 'Rejected - Insufficient Experience'),
(88, 14, '2024-11-17', 49000.00, 'Submitted', 75, 'Hired'),
(89, 12, '2024-12-01', 96000.00, 'Submitted', 92, 'Rejected - Budget Constraint'),
(90, 13, '2024-12-15', 37000.00, 'Submitted', 67, 'Rejected - Weak Portfolio'),
(91, 15, '2024-09-10', 29000.00, 'Submitted', 58, 'Rejected - Weak Writing Sample'),
(92, 14, '2024-09-24', 66000.00, 'Submitted', 81, 'Hired'),
(93, 13, '2024-10-08', 47000.00, 'Submitted', 74, 'Hired'),
(94, 12, '2024-10-22', 80000.00, 'Submitted', 88, 'Rejected - Budget Constraint'),
(95, 15, '2024-11-05', 33000.00, 'Submitted', 62, 'Rejected - Weak Writing Sample'),
(96, 14, '2024-11-19', 56000.00, 'Submitted', 78, 'Hired'),
(97, 13, '2024-12-03', 32000.00, 'Submitted', 65, 'Rejected - Position Filled'),
(98, 15, '2024-12-17', 24000.00, 'Submitted', 51, 'Rejected - Insufficient Experience'),
(99, 14, '2024-12-20', 69000.00, 'Submitted', 83, 'Hired'),
(100, 12, '2024-12-23', 51000.00, 'Submitted', 70, 'Rejected - Weak Interview');


-- TABLE 5: INTERVIEWS
-- Tracks interview process for shortlisted candidates

CREATE TABLE interviews (
    interview_id     INT PRIMARY KEY AUTO_INCREMENT,
    application_id   INT NOT NULL,
    interview_round  VARCHAR(50) NOT NULL,
    interview_date   DATE NOT NULL,
    interviewer_name VARCHAR(100) NOT NULL,
    technical_score  INT,
    cultural_fit_score INT,
    communication_score INT,
    interview_notes  TEXT,
    outcome          VARCHAR(30) NOT NULL,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

INSERT INTO interviews (application_id, interview_round, interview_date, interviewer_name, technical_score, cultural_fit_score, communication_score, interview_notes, outcome) VALUES
-- Hired candidates got multiple interview rounds
-- IT Hired
(1,  'Phone Screen',      '2024-01-10', 'Sarah Johnson',         82, 85, 88, 'Strong technical background, good communicator', 'Passed'),
(1,  'Technical',         '2024-01-12', 'Michael Chen',          87, 90, 85, 'Excellent problem-solving skills', 'Passed'),
(1,  'Final',             '2024-01-15', 'Dr. Adewale Thompson',  85, 88, 90, 'Great fit for the team', 'Hired'),

(3,  'Phone Screen',      '2024-01-24', 'Sarah Johnson',         75, 78, 82, 'Good analytical skills', 'Passed'),
(3,  'Technical',         '2024-01-26', 'Michael Chen',          80, 75, 78, 'Solid SQL and Python knowledge', 'Passed'),
(3,  'Final',             '2024-01-29', 'Dr. Adewale Thompson',  78, 82, 80, 'Approved for hire', 'Hired'),

(6,  'Phone Screen',      '2024-02-20', 'Sarah Johnson',         80, 83, 85, 'Strong security background', 'Passed'),
(6,  'Technical',         '2024-02-22', 'Michael Chen',          85, 88, 82, 'Impressive security knowledge', 'Passed'),
(6,  'Final',             '2024-02-25', 'Dr. Adewale Thompson',  83, 85, 87, 'Excellent candidate', 'Hired'),

(7,  'Phone Screen',      '2024-02-27', 'Sarah Johnson',         74, 76, 79, 'Good data analysis skills', 'Passed'),
(7,  'Technical',         '2024-02-29', 'Michael Chen',          78, 74, 76, 'Strong in statistics', 'Passed'),
(7,  'Final',             '2024-03-03', 'Dr. Adewale Thompson',  76, 78, 75, 'Good addition to team', 'Hired'),

(9,  'Phone Screen',      '2024-03-13', 'Sarah Johnson',         70, 75, 77, 'Creative portfolio', 'Passed'),
(9,  'Technical',         '2024-03-15', 'Michael Chen',          74, 78, 73, 'Good design thinking', 'Passed'),
(9,  'Final',             '2024-03-18', 'Dr. Adewale Thompson',  72, 76, 75, 'Approved', 'Hired'),

(11, 'Phone Screen',      '2024-03-28', 'Sarah Johnson',         78, 80, 82, 'Solid coding skills', 'Passed'),
(11, 'Technical',         '2024-03-30', 'Michael Chen',          82, 78, 80, 'Good technical depth', 'Passed'),
(11, 'Final',             '2024-04-02', 'Dr. Adewale Thompson',  80, 82, 81, 'Strong hire', 'Hired'),

(14, 'Phone Screen',      '2024-04-18', 'Sarah Johnson',         84, 85, 83, 'Excellent data skills', 'Passed'),
(14, 'Technical',         '2024-04-20', 'Michael Chen',          88, 82, 85, 'Very impressive', 'Passed'),
(14, 'Final',             '2024-04-23', 'Dr. Adewale Thompson',  86, 84, 87, 'Top candidate', 'Hired'),

(16, 'Phone Screen',      '2024-05-09', 'Sarah Johnson',         76, 79, 78, 'Good systems knowledge', 'Passed'),
(16, 'Technical',         '2024-05-11', 'Michael Chen',          80, 76, 79, 'Strong technical skills', 'Passed'),
(16, 'Final',             '2024-05-14', 'Dr. Adewale Thompson',  78, 80, 77, 'Approved for hire', 'Hired'),

(17, 'Phone Screen',      '2024-05-16', 'Sarah Johnson',         73, 76, 75, 'Good developer', 'Passed'),
(17, 'Technical',         '2024-05-18', 'Michael Chen',          77, 74, 76, 'Solid coding ability', 'Passed'),
(17, 'Final',             '2024-05-21', 'Dr. Adewale Thompson',  75, 77, 74, 'Good fit', 'Hired'),

(19, 'Phone Screen',      '2024-05-30', 'Sarah Johnson',         82, 84, 86, 'Excellent designer', 'Passed'),
(19, 'Technical',         '2024-06-01', 'Michael Chen',          85, 83, 84, 'Strong portfolio', 'Passed'),
(19, 'Final',             '2024-06-04', 'Dr. Adewale Thompson',  84, 85, 85, 'Great hire', 'Hired'),

(23, 'Phone Screen',      '2024-06-27', 'Sarah Johnson',         75, 78, 76, 'Good systems admin', 'Passed'),
(23, 'Technical',         '2024-06-29', 'Michael Chen',          79, 75, 78, 'Strong technical knowledge', 'Passed'),
(23, 'Final',             '2024-07-02', 'Dr. Adewale Thompson',  77, 79, 76, 'Approved', 'Hired'),

(24, 'Phone Screen',      '2024-07-04', 'Sarah Johnson',         79, 81, 80, 'Good security knowledge', 'Passed'),
(24, 'Technical',         '2024-07-06', 'Michael Chen',          83, 79, 81, 'Solid security skills', 'Passed'),
(24, 'Final',             '2024-07-09', 'Dr. Adewale Thompson',  81, 82, 80, 'Good candidate', 'Hired'),

(26, 'Phone Screen',      '2024-07-18', 'Sarah Johnson',         72, 74, 73, 'Decent developer', 'Passed'),
(26, 'Technical',         '2024-07-20', 'Michael Chen',          76, 72, 74, 'Acceptable skills', 'Passed'),
(26, 'Final',             '2024-07-23', 'Dr. Adewale Thompson',  74, 75, 73, 'Approved', 'Hired'),

(28, 'Phone Screen',      '2024-08-08', 'Sarah Johnson',         76, 78, 77, 'Good developer', 'Passed'),
(28, 'Technical',         '2024-08-10', 'Michael Chen',          80, 76, 78, 'Strong coder', 'Passed'),
(28, 'Final',             '2024-08-13', 'Dr. Adewale Thompson',  78, 79, 77, 'Good hire', 'Hired'),

-- HR Hired
(31, 'Phone Screen',      '2024-01-12', 'Patricia Williams',     81, 84, 86, 'Strong HR background', 'Passed'),
(31, 'Final',             '2024-01-15', 'Mrs. Chinelo Adebayo',  83, 85, 87, 'Excellent manager', 'Hired'),

(33, 'Phone Screen',      '2024-02-09', 'Patricia Williams',     73, 76, 75, 'Good generalist', 'Passed'),
(33, 'Final',             '2024-02-12', 'Mrs. Chinelo Adebayo',  75, 77, 76, 'Approved', 'Hired'),

(37, 'Phone Screen',      '2024-04-05', 'Patricia Williams',     75, 78, 77, 'Good recruiter', 'Passed'),
(37, 'Final',             '2024-04-08', 'Mrs. Chinelo Adebayo',  77, 79, 78, 'Good addition', 'Hired'),

(38, 'Phone Screen',      '2024-04-19', 'Patricia Williams',     79, 81, 82, 'Strong manager', 'Passed'),
(38, 'Final',             '2024-04-22', 'Mrs. Chinelo Adebayo',  81, 82, 83, 'Excellent hire', 'Hired'),

(40, 'Phone Screen',      '2024-05-17', 'Patricia Williams',     71, 74, 73, 'Decent recruiter', 'Passed'),
(40, 'Final',             '2024-05-20', 'Mrs. Chinelo Adebayo',  73, 75, 74, 'Approved', 'Hired'),

(44, 'Phone Screen',      '2024-07-12', 'Patricia Williams',     74, 76, 75, 'Good generalist', 'Passed'),
(44, 'Final',             '2024-07-15', 'Mrs. Chinelo Adebayo',  76, 78, 76, 'Good fit', 'Hired'),

(46, 'Phone Screen',      '2024-08-09', 'Patricia Williams',     77, 79, 78, 'Strong recruiter', 'Passed'),
(46, 'Final',             '2024-08-12', 'Mrs. Chinelo Adebayo',  79, 80, 79, 'Good hire', 'Hired'),

-- Finance Hired
(48, 'Phone Screen',      '2024-01-14', 'David Martinez',        78, 80, 79, 'Good analyst', 'Passed'),
(48, 'Final',             '2024-01-17', 'Mr. Ibrahim Kazeem',    80, 81, 80, 'Approved', 'Hired'),

(50, 'Phone Screen',      '2024-02-11', 'David Martinez',        83, 85, 84, 'Excellent analyst', 'Passed'),
(50, 'Final',             '2024-02-14', 'Mr. Ibrahim Kazeem',    85, 86, 85, 'Strong hire', 'Hired'),

(52, 'Phone Screen',      '2024-03-10', 'David Martinez',        80, 82, 81, 'Good accountant', 'Passed'),
(52, 'Final',             '2024-03-13', 'Mr. Ibrahim Kazeem',    82, 83, 82, 'Excellent candidate', 'Hired'),

(54, 'Phone Screen',      '2024-04-07', 'David Martinez',        72, 75, 74, 'Decent analyst', 'Passed'),
(54, 'Final',             '2024-04-10', 'Mr. Ibrahim Kazeem',    74, 76, 75, 'Approved', 'Hired'),

(57, 'Phone Screen',      '2024-05-19', 'David Martinez',        76, 78, 77, 'Good analyst', 'Passed'),
(57, 'Final',             '2024-05-22', 'Mr. Ibrahim Kazeem',    78, 79, 78, 'Good hire', 'Hired'),

(60, 'Phone Screen',      '2024-06-30', 'David Martinez',        73, 75, 74, 'Solid analyst', 'Passed'),
(60, 'Final',             '2024-07-03', 'Mr. Ibrahim Kazeem',    75, 76, 75, 'Approved', 'Hired'),

(61, 'Phone Screen',      '2024-07-14', 'David Martinez',        79, 81, 80, 'Strong accountant', 'Passed'),
(61, 'Final',             '2024-07-17', 'Mr. Ibrahim Kazeem',    81, 82, 81, 'Excellent hire', 'Hired'),

(65, 'Phone Screen',      '2024-09-08', 'David Martinez',        75, 77, 76, 'Good analyst', 'Passed'),
(65, 'Final',             '2024-09-11', 'Mr. Ibrahim Kazeem',    77, 78, 77, 'Approved', 'Hired'),

-- Marketing Hired
(66, 'Phone Screen',      '2024-01-16', 'Emily Rodriguez',       80, 82, 83, 'Strong manager', 'Passed'),
(66, 'Final',             '2024-01-19', 'Ms. Funke Olatunde',    82, 83, 84, 'Excellent hire', 'Hired'),

(68, 'Phone Screen',      '2024-02-13', 'Emily Rodriguez',       72, 75, 74, 'Good strategist', 'Passed'),
(68, 'Final',             '2024-02-16', 'Ms. Funke Olatunde',    74, 76, 75, 'Approved', 'Hired'),

(72, 'Phone Screen',      '2024-04-09', 'Emily Rodriguez',       75, 77, 76, 'Good strategist', 'Passed'),
(72, 'Final',             '2024-04-12', 'Ms. Funke Olatunde',    77, 78, 77, 'Good addition', 'Hired'),

(74, 'Phone Screen',      '2024-05-07', 'Emily Rodriguez',       81, 83, 82, 'Strong marketer', 'Passed'),
(74, 'Final',             '2024-05-10', 'Ms. Funke Olatunde',    83, 84, 83, 'Excellent candidate', 'Hired'),

(77, 'Phone Screen',      '2024-06-18', 'Emily Rodriguez',       70, 73, 72, 'Decent strategist', 'Passed'),
(77, 'Final',             '2024-06-21', 'Ms. Funke Olatunde',    72, 74, 73, 'Approved', 'Hired'),

(79, 'Phone Screen',      '2024-07-16', 'Emily Rodriguez',       77, 79, 78, 'Good manager', 'Passed'),
(79, 'Final',             '2024-07-19', 'Ms. Funke Olatunde',    79, 80, 79, 'Strong hire', 'Hired'),

(82, 'Phone Screen',      '2024-08-27', 'Emily Rodriguez',       71, 74, 73, 'Good marketer', 'Passed'),
(82, 'Final',             '2024-08-30', 'Ms. Funke Olatunde',    73, 75, 74, 'Approved', 'Hired'),

(85, 'Phone Screen',      '2024-10-08', 'Emily Rodriguez',       74, 76, 75, 'Good strategist', 'Passed'),
(85, 'Final',             '2024-10-11', 'Ms. Funke Olatunde',    76, 77, 76, 'Good fit', 'Hired'),

(88, 'Phone Screen',      '2024-11-19', 'Emily Rodriguez',       73, 75, 74, 'Good strategist', 'Passed'),
(88, 'Final',             '2024-11-22', 'Ms. Funke Olatunde',    75, 76, 75, 'Approved', 'Hired'),

(92, 'Phone Screen',      '2024-09-26', 'Emily Rodriguez',       79, 81, 80, 'Strong strategist', 'Passed'),
(92, 'Final',             '2024-09-29', 'Ms. Funke Olatunde',    81, 82, 81, 'Excellent hire', 'Hired'),

(93, 'Phone Screen',      '2024-10-10', 'Emily Rodriguez',       72, 74, 73, 'Good marketer', 'Passed'),
(93, 'Final',             '2024-10-13', 'Ms. Funke Olatunde',    74, 75, 74, 'Approved', 'Hired'),

(96, 'Phone Screen',      '2024-11-21', 'Emily Rodriguez',       76, 78, 77, 'Good strategist', 'Passed'),
(96, 'Final',             '2024-11-24', 'Ms. Funke Olatunde',    78, 79, 78, 'Good hire', 'Hired'),

(99, 'Phone Screen',      '2024-12-22', 'Emily Rodriguez',       81, 83, 82, 'Excellent strategist', 'Passed'),
(99, 'Final',             '2024-12-25', 'Ms. Funke Olatunde',    83, 84, 83, 'Strong hire', 'Hired'),

-- Some rejected candidates also got interviews (failed at various stages)
(2,  'Phone Screen',      '2024-01-17', 'Sarah Johnson',         65, 68, 70, 'Weak technical skills', 'Rejected'),
(5,  'Phone Screen',      '2024-02-12', 'Sarah Johnson',         52, 55, 58, 'Insufficient experience', 'Rejected'),
(8,  'Phone Screen',      '2024-03-06', 'Sarah Johnson',         90, 88, 92, 'Excellent but salary too high', 'Rejected'),
(12, 'Phone Screen',      '2024-04-04', 'Sarah Johnson',         93, 90, 95, 'Outstanding but budget constraint', 'Rejected'),
(15, 'Phone Screen',      '2024-04-25', 'Sarah Johnson',         50, 53, 55, 'Lacks experience', 'Rejected'),
(32, 'Phone Screen',      '2024-01-26', 'Patricia Williams',     64, 67, 65, 'Weak interview performance', 'Rejected'),
(49, 'Phone Screen',      '2024-01-28', 'David Martinez',        65, 68, 67, 'Not strong enough', 'Rejected');

-- ANSWERS


--  SECTION 2: SALARY & BUDGET ANALYSIS
 
SELECT 
    p.position_name,
    ROUND(AVG(a.expected_salary), 2) AS avg_expected_salary,
    p.min_salary,
    p.max_salary,
    ROUND(AVG(a.expected_salary) - p.max_salary, 2) AS salary_gap,
    ROUND(SUM(CASE
                WHEN a.expected_salary > p.max_salary THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS pct_above_budget
FROM
    applications a
        JOIN
    positions p ON a.position_id = p.position_id
GROUP BY p.position_name , p.min_salary , p.max_salary
ORDER BY salary_gap DESC;
 
-- Q2.1b: Overall - what % of candidates expect above budget?
SELECT 
    COUNT(*) AS total_applications,
    SUM(CASE WHEN a.expected_salary > p.max_salary THEN 1 ELSE 0 END) AS above_budget_count,
    ROUND(SUM(CASE WHEN a.expected_salary > p.max_salary THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS pct_above_budget
FROM
    applications a
        JOIN
    positions p ON a.position_id = p.position_id;
 
 
-- Q2.2: Salary Impact on Hiring Success
SELECT 
    CASE
        WHEN a.expected_salary > 60000 THEN 'High (> 60,000)'
        ELSE 'Moderate (≤ 60,000)'
    END AS salary_band,
    COUNT(*) AS total_candidates,
    SUM(CASE WHEN a.application_status = 'Hired' THEN 1 ELSE 0 END) AS hired,
    ROUND(SUM(CASE WHEN a.application_status = 'Hired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS hiring_rate_pct
FROM
    applications a
GROUP BY salary_band
ORDER BY salary_band DESC;

-- Q2.2b: Salary band vs hiring rate by department
SELECT
    d.department_name,
    CASE
        WHEN a.expected_salary > 60000 THEN 'High (> ₦60,000)'
        ELSE 'Moderate (≤ ₦60,000)'
    END                                                            AS salary_band,
    COUNT(*)                                                       AS total_candidates,
    SUM(CASE WHEN a.application_status = 'Hired' THEN 1 ELSE 0 END) AS hired,
    ROUND(
        SUM(CASE WHEN a.application_status = 'Hired' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    )AS hiring_rate_pct
    
FROM applications a

JOIN positions   p ON a.position_id    = p.position_id
JOIN departments d ON p.department_id  = d.department_id
GROUP BY d.department_name, salary_band
ORDER BY d.department_name, salary_band;
 
-- Q2.2c: Top rejection reasons for high-salary candidates
SELECT
    a.application_status AS rejection_reason,
    COUNT(*)AS count
FROM applications a
WHERE a.expected_salary > 60000
  AND a.application_status NOT IN ('Hired', 'Under Review')
GROUP BY a.application_status
ORDER BY count DESC;
 
 
-- Q2.3: Budget Constraint Rejections - Quality of Lost Talent
SELECT
    d.department_name,
    COUNT(*)AS budget_rejected_count,
    ROUND(AVG(a.resume_score), 2)AS avg_resume_score_rejected,
    ROUND(AVG(a.expected_salary), 2)AS avg_expected_salary
FROM applications a
JOIN positions   p ON a.position_id   = p.position_id
JOIN departments d ON p.department_id = d.department_id
WHERE a.application_status LIKE '%Budget%'
GROUP BY d.department_name
ORDER BY avg_resume_score_rejected DESC;
 
-- Q2.3b: Compare budget-rejected candidates vs hired candidates
SELECT
    'Budget Rejected' AS candidate_group,
    COUNT(*) AS total,
    ROUND(AVG(a.resume_score), 2) AS avg_resume_score,
    ROUND(AVG(a.expected_salary), 2) AS avg_expected_salary
FROM applications a
WHERE a.application_status LIKE '%Budget%'
UNION ALL
SELECT
    'Hired' AS candidate_group,
    COUNT(*),
    ROUND(AVG(a.resume_score), 2),
    ROUND(AVG(a.expected_salary), 2)
FROM applications a
WHERE a.application_status = 'Hired';
 
 
--  SECTION 6: POSITION & DEPARTMENT PERFORMANCE

 
SELECT 
    p.position_name,
    d.department_name,
    COUNT(a.application_id) AS total_applications,
    SUM(CASE
        WHEN a.application_status = 'Hired' THEN 1
        ELSE 0
    END) AS total_hired,
    ROUND(COUNT(a.application_id) * 1.0 / NULLIF(SUM(CASE
                        WHEN a.application_status = 'Hired' THEN 1
                        ELSE 0
                    END),
                    0),
            1) AS applications_per_hire,
    ROUND(AVG(DATEDIFF(last_i.max_date, a.application_date)),
            1) AS avg_days_to_fill,
    p.max_salary,
    ROUND(AVG(a.expected_salary), 2) AS avg_expected_salary
FROM
    positions p
        JOIN
    departments d ON p.department_id = d.department_id
        JOIN
    applications a ON p.position_id = a.position_id
        LEFT JOIN
    (SELECT 
        application_id, MAX(interview_date) AS max_date
    FROM
        interviews
    GROUP BY application_id) last_i ON a.application_id = last_i.application_id
GROUP BY p.position_name , d.department_name , p.max_salary
ORDER BY applications_per_hire DESC;
 
 
-- Q6.2: Department Headcount vs Budget Capacity
SELECT 
    d.department_name,
    d.headcount_limit,
    d.annual_budget,
    SUM(CASE
        WHEN a.application_status = 'Hired' THEN 1
        ELSE 0
    END) AS current_hires,
    d.headcount_limit - SUM(CASE
        WHEN a.application_status = 'Hired' THEN 1
        ELSE 0
    END) AS headcount_remaining,
    ROUND(SUM(CASE
                WHEN a.application_status = 'Hired' THEN 1
                ELSE 0
            END) * 100.0 / d.headcount_limit,
            2) AS headcount_utilization_pct,
    CASE
        WHEN
            SUM(CASE
                WHEN a.application_status = 'Hired' THEN 1
                ELSE 0
            END) >= d.headcount_limit
        THEN
            'At/Over Capacity'
        ELSE 'Has Hiring Room'
    END AS capacity_status
FROM
    departments d
        JOIN
    positions p ON d.department_id = p.department_id
        JOIN
    applications a ON p.position_id = a.position_id
GROUP BY d.department_name , d.headcount_limit , d.annual_budget
ORDER BY headcount_utilization_pct DESC;
 
 
-- Q6.3: Position Attractiveness Score
SELECT
    p.position_name,
    d.department_name,
    COUNT(a.application_id) AS total_applications,
    ROUND(AVG(a.resume_score), 2) AS avg_resume_score,
    p.max_salary,
    ROUND(AVG(a.expected_salary), 2) AS avg_expected_salary,
    ROUND(
        (p.max_salary - AVG(a.expected_salary)) / p.max_salary * 100, 2
    )                                                               AS salary_competitiveness_index,
    RANK() OVER (ORDER BY COUNT(a.application_id) DESC)             AS application_volume_rank
FROM positions    p
JOIN departments  d ON p.department_id = d.department_id
JOIN applications a ON p.position_id  = a.position_id
GROUP BY p.position_name, d.department_name, p.max_salary
ORDER BY avg_resume_score DESC;
 
 
