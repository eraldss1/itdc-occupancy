-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 10:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `itdc`
--
--
-- Dumping data for table `master_area`
--
INSERT INTO
    `master_area` (`ID_Area`, `Area`)
VALUES
    (1001, 'Nasional'),
    (2001, 'Bali'),
    (2002, 'NTB'),
    (2003, 'NTT');

--
-- Dumping data for table `master_kawasan`
--
INSERT INTO
    `master_kawasan` (`ID_Kawasan`, `Kawasan`, `ID_Area`)
VALUES
    (3001, 'The Nusa Dua', 2001),
    (3002, 'The Mandalika', 2002),
    (3003, 'The Golo Mori', 2003);

--
-- Dumping data for table `master_negara`
--
INSERT INTO
    `master_negara` (`ID`, `ID_2`, `Negara`, `Region`)
VALUES
    ('AD', 'AND', 'Andorra', 'Europe'),
    ('AE', 'ARE', 'United Arab Emirates', 'Asia'),
    ('AF', 'AFG', 'Afghanistan', 'Asia'),
    ('AG', 'ATG', 'Antigua and Barbuda', 'Americas'),
    ('AI', 'AIA', 'Anguilla', 'Americas'),
    ('AL', 'ALB', 'Albania', 'Europe'),
    ('AM', 'ARM', 'Armenia', 'Asia'),
    ('AO', 'AGO', 'Angola', 'Africa'),
    ('AQ', 'ATA', 'Antarctica', ''),
    ('AR', 'ARG', 'Argentina', 'Americas'),
    ('AS', 'ASM', 'American Samoa', 'Oceania'),
    ('AT', 'AUT', 'Austria', 'Europe'),
    ('AU', 'AUS', 'Australia', 'Oceania'),
    ('AW', 'ABW', 'Aruba', 'Americas'),
    ('AX', 'ALA', 'Ãland Islands', 'Europe'),
    ('AZ', 'AZE', 'Azerbaijan', 'Asia'),
    ('BA', 'BIH', 'Bosnia and Herzegovina', 'Europe'),
    ('BB', 'BRB', 'Barbados', 'Americas'),
    ('BD', 'BGD', 'Bangladesh', 'Asia'),
    ('BE', 'BEL', 'Belgium', 'Europe'),
    ('BF', 'BFA', 'Burkina Faso', 'Africa'),
    ('BG', 'BGR', 'Bulgaria', 'Europe'),
    ('BH', 'BHR', 'Bahrain', 'Asia'),
    ('BI', 'BDI', 'Burundi', 'Africa'),
    ('BJ', 'BEN', 'Benin', 'Africa'),
    ('BL', 'BLM', 'Saint BarthÃ©lemy', 'Americas'),
    ('BM', 'BMU', 'Bermuda', 'Americas'),
    ('BN', 'BRN', 'Brunei Darussalam', 'Asia'),
    (
        'BO',
        'BOL',
        'Bolivia (Plurinational State of)',
        'Americas'
    ),
    (
        'BQ',
        'BES',
        'Bonaire, Sint Eustatius and Saba',
        'Americas'
    ),
    ('BR', 'BRA', 'Brazil', 'Americas'),
    ('BS', 'BHS', 'Bahamas', 'Americas'),
    ('BT', 'BTN', 'Bhutan', 'Asia'),
    ('BV', 'BVT', 'Bouvet Island', 'Americas'),
    ('BW', 'BWA', 'Botswana', 'Africa'),
    ('BY', 'BLR', 'Belarus', 'Europe'),
    ('BZ', 'BLZ', 'Belize', 'Americas'),
    ('CA', 'CAN', 'Canada', 'Americas'),
    (
        'CC',
        'CCK',
        'Cocos (Keeling) Islands',
        'Oceania'
    ),
    (
        'CD',
        'COD',
        'Congo, Democratic Republic of the',
        'Africa'
    ),
    (
        'CF',
        'CAF',
        'Central African Republic',
        'Africa'
    ),
    ('CG', 'COG', 'Congo', 'Africa'),
    ('CH', 'CHE', 'Switzerland', 'Europe'),
    ('CI', 'CIV', 'CÃte dIvoire', 'Africa'),
    ('CK', 'COK', 'Cook Islands', 'Oceania'),
    ('CL', 'CHL', 'Chile', 'Americas'),
    ('CM', 'CMR', 'Cameroon', 'Africa'),
    ('CN', 'CHN', 'China', 'Asia'),
    ('CO', 'COL', 'Colombia', 'Americas'),
    ('CR', 'CRI', 'Costa Rica', 'Americas'),
    ('CU', 'CUB', 'Cuba', 'Americas'),
    ('CV', 'CPV', 'Cabo Verde', 'Africa'),
    ('CW', 'CUW', 'CuraÃ§ao', 'Americas'),
    ('CX', 'CXR', 'Christmas Island', 'Oceania'),
    ('CY', 'CYP', 'Cyprus', 'Asia'),
    ('CZ', 'CZE', 'Czechia', 'Europe'),
    ('DE', 'DEU', 'Germany', 'Europe'),
    ('DJ', 'DJI', 'Djibouti', 'Africa'),
    ('DK', 'DNK', 'Denmark', 'Europe'),
    ('DM', 'DMA', 'Dominica', 'Americas'),
    ('DO', 'DOM', 'Dominican Republic', 'Americas'),
    ('DZ', 'DZA', 'Algeria', 'Africa'),
    ('EC', 'ECU', 'Ecuador', 'Americas'),
    ('EE', 'EST', 'Estonia', 'Europe'),
    ('EG', 'EGY', 'Egypt', 'Africa'),
    ('EH', 'ESH', 'Western Sahara', 'Africa'),
    ('ER', 'ERI', 'Eritrea', 'Africa'),
    ('ES', 'ESP', 'Spain', 'Europe'),
    ('ET', 'ETH', 'Ethiopia', 'Africa'),
    ('FI', 'FIN', 'Finland', 'Europe'),
    ('FJ', 'FJI', 'Fiji', 'Oceania'),
    (
        'FK',
        'FLK',
        'Falkland Islands (Malvinas)',
        'Americas'
    ),
    (
        'FM',
        'FSM',
        'Micronesia (Federated States of)',
        'Oceania'
    ),
    ('FO', 'FRO', 'Faroe Islands', 'Europe'),
    ('FR', 'FRA', 'France', 'Europe'),
    ('GA', 'GAB', 'Gabon', 'Africa'),
    (
        'GB',
        'GBR',
        'United Kingdom of Great Britain and Northern Ireland',
        'Europe'
    ),
    ('GD', 'GRD', 'Grenada', 'Americas'),
    ('GE', 'GEO', 'Georgia', 'Asia'),
    ('GF', 'GUF', 'French Guiana', 'Americas'),
    ('GG', 'GGY', 'Guernsey', 'Europe'),
    ('GH', 'GHA', 'Ghana', 'Africa'),
    ('GI', 'GIB', 'Gibraltar', 'Europe'),
    ('GL', 'GRL', 'Greenland', 'Americas'),
    ('GM', 'GMB', 'Gambia', 'Africa'),
    ('GN', 'GIN', 'Guinea', 'Africa'),
    ('GP', 'GLP', 'Guadeloupe', 'Americas'),
    ('GQ', 'GNQ', 'Equatorial Guinea', 'Africa'),
    ('GR', 'GRC', 'Greece', 'Europe'),
    (
        'GS',
        'SGS',
        'South Georgia and the South Sandwich Islands',
        'Americas'
    ),
    ('GT', 'GTM', 'Guatemala', 'Americas'),
    ('GU', 'GUM', 'Guam', 'Oceania'),
    ('GW', 'GNB', 'Guinea-Bissau', 'Africa'),
    ('GY', 'GUY', 'Guyana', 'Americas'),
    ('HK', 'HKG', 'Hong Kong', 'Asia'),
    (
        'HM',
        'HMD',
        'Heard Island and McDonald Islands',
        'Oceania'
    ),
    ('HN', 'HND', 'Honduras', 'Americas'),
    ('HR', 'HRV', 'Croatia', 'Europe'),
    ('HT', 'HTI', 'Haiti', 'Americas'),
    ('HU', 'HUN', 'Hungary', 'Europe'),
    ('ID', 'IDN', 'Indonesia', 'Asia'),
    ('IE', 'IRL', 'Ireland', 'Europe'),
    ('IL', 'ISR', 'Israel', 'Asia'),
    ('IM', 'IMN', 'Isle of Man', 'Europe'),
    ('IN', 'IND', 'India', 'Asia'),
    (
        'IO',
        'IOT',
        'British Indian Ocean Territory',
        'Africa'
    ),
    ('IQ', 'IRQ', 'Iraq', 'Asia'),
    (
        'IR',
        'IRN',
        'Iran (Islamic Republic of)',
        'Asia'
    ),
    ('IS', 'ISL', 'Iceland', 'Europe'),
    ('IT', 'ITA', 'Italy', 'Europe'),
    ('JE', 'JEY', 'Jersey', 'Europe'),
    ('JM', 'JAM', 'Jamaica', 'Americas'),
    ('JO', 'JOR', 'Jordan', 'Asia'),
    ('JP', 'JPN', 'Japan', 'Asia'),
    ('KE', 'KEN', 'Kenya', 'Africa'),
    ('KG', 'KGZ', 'Kyrgyzstan', 'Asia'),
    ('KH', 'KHM', 'Cambodia', 'Asia'),
    ('KI', 'KIR', 'Kiribati', 'Oceania'),
    ('KM', 'COM', 'Comoros', 'Africa'),
    ('KN', 'KNA', 'Saint Kitts and Nevis', 'Americas'),
    (
        'KP',
        'PRK',
        'Korea (Democratic Peoples Republic of)',
        'Asia'
    ),
    ('KR', 'KOR', 'Korea, Republic of', 'Asia'),
    ('KW', 'KWT', 'Kuwait', 'Asia'),
    ('KY', 'CYM', 'Cayman Islands', 'Americas'),
    ('KZ', 'KAZ', 'Kazakhstan', 'Asia'),
    (
        'LA',
        'LAO',
        'Lao Peoples Democratic Republic',
        'Asia'
    ),
    ('LB', 'LBN', 'Lebanon', 'Asia'),
    ('LC', 'LCA', 'Saint Lucia', 'Americas'),
    ('LI', 'LIE', 'Liechtenstein', 'Europe'),
    ('LK', 'LKA', 'Sri Lanka', 'Asia'),
    ('LR', 'LBR', 'Liberia', 'Africa'),
    ('LS', 'LSO', 'Lesotho', 'Africa'),
    ('LT', 'LTU', 'Lithuania', 'Europe'),
    ('LU', 'LUX', 'Luxembourg', 'Europe'),
    ('LV', 'LVA', 'Latvia', 'Europe'),
    ('LY', 'LBY', 'Libya', 'Africa'),
    ('MA', 'MAR', 'Morocco', 'Africa'),
    ('MC', 'MCO', 'Monaco', 'Europe'),
    ('MD', 'MDA', 'Moldova, Republic of', 'Europe'),
    ('ME', 'MNE', 'Montenegro', 'Europe'),
    (
        'MF',
        'MAF',
        'Saint Martin (French part)',
        'Americas'
    ),
    ('MG', 'MDG', 'Madagascar', 'Africa'),
    ('MH', 'MHL', 'Marshall Islands', 'Oceania'),
    ('MK', 'MKD', 'North Macedonia', 'Europe'),
    ('ML', 'MLI', 'Mali', 'Africa'),
    ('MM', 'MMR', 'Myanmar', 'Asia'),
    ('MN', 'MNG', 'Mongolia', 'Asia'),
    ('MO', 'MAC', 'Macao', 'Asia'),
    (
        'MP',
        'MNP',
        'Northern Mariana Islands',
        'Oceania'
    ),
    ('MQ', 'MTQ', 'Martinique', 'Americas'),
    ('MR', 'MRT', 'Mauritania', 'Africa'),
    ('MS', 'MSR', 'Montserrat', 'Americas'),
    ('MT', 'MLT', 'Malta', 'Europe'),
    ('MU', 'MUS', 'Mauritius', 'Africa'),
    ('MV', 'MDV', 'Maldives', 'Asia'),
    ('MW', 'MWI', 'Malawi', 'Africa'),
    ('MX', 'MEX', 'Mexico', 'Americas'),
    ('MY', 'MYS', 'Malaysia', 'Asia'),
    ('MZ', 'MOZ', 'Mozambique', 'Africa'),
    ('NA', 'NAM', 'Namibia', 'Africa'),
    ('NC', 'NCL', 'New Caledonia', 'Oceania'),
    ('NE', 'NER', 'Niger', 'Africa'),
    ('NF', 'NFK', 'Norfolk Island', 'Oceania'),
    ('NG', 'NGA', 'Nigeria', 'Africa'),
    ('NI', 'NIC', 'Nicaragua', 'Americas'),
    ('NL', 'NLD', 'Netherlands', 'Europe'),
    ('NO', 'NOR', 'Norway', 'Europe'),
    ('NP', 'NPL', 'Nepal', 'Asia'),
    ('NR', 'NRU', 'Nauru', 'Oceania'),
    ('NU', 'NIU', 'Niue', 'Oceania'),
    ('NZ', 'NZL', 'New Zealand', 'Oceania'),
    ('OM', 'OMN', 'Oman', 'Asia'),
    ('PA', 'PAN', 'Panama', 'Americas'),
    ('PE', 'PER', 'Peru', 'Americas'),
    ('PF', 'PYF', 'French Polynesia', 'Oceania'),
    ('PG', 'PNG', 'Papua New Guinea', 'Oceania'),
    ('PH', 'PHL', 'Philippines', 'Asia'),
    ('PK', 'PAK', 'Pakistan', 'Asia'),
    ('PL', 'POL', 'Poland', 'Europe'),
    (
        'PM',
        'SPM',
        'Saint Pierre and Miquelon',
        'Americas'
    ),
    ('PN', 'PCN', 'Pitcairn', 'Oceania'),
    ('PR', 'PRI', 'Puerto Rico', 'Americas'),
    ('PS', 'PSE', 'Palestine, State of', 'Asia'),
    ('PT', 'PRT', 'Portugal', 'Europe'),
    ('PW', 'PLW', 'Palau', 'Oceania'),
    ('PY', 'PRY', 'Paraguay', 'Americas'),
    ('QA', 'QAT', 'Qatar', 'Asia'),
    ('RE', 'REU', 'RÃ©union', 'Africa'),
    ('RO', 'ROU', 'Romania', 'Europe'),
    ('RS', 'SRB', 'Serbia', 'Europe'),
    ('RU', 'RUS', 'Russian Federation', 'Europe'),
    ('RW', 'RWA', 'Rwanda', 'Africa'),
    ('SA', 'SAU', 'Saudi Arabia', 'Asia'),
    ('SB', 'SLB', 'Solomon Islands', 'Oceania'),
    ('SC', 'SYC', 'Seychelles', 'Africa'),
    ('SD', 'SDN', 'Sudan', 'Africa'),
    ('SE', 'SWE', 'Sweden', 'Europe'),
    ('SG', 'SGP', 'Singapore', 'Asia'),
    (
        'SH',
        'SHN',
        'Saint Helena, Ascension and Tristan da Cunha',
        'Africa'
    ),
    ('SI', 'SVN', 'Slovenia', 'Europe'),
    ('SJ', 'SJM', 'Svalbard and Jan Mayen', 'Europe'),
    ('SK', 'SVK', 'Slovakia', 'Europe'),
    ('SL', 'SLE', 'Sierra Leone', 'Africa'),
    ('SM', 'SMR', 'San Marino', 'Europe'),
    ('SN', 'SEN', 'Senegal', 'Africa'),
    ('SO', 'SOM', 'Somalia', 'Africa'),
    ('SR', 'SUR', 'Suriname', 'Americas'),
    ('SS', 'SSD', 'South Sudan', 'Africa'),
    ('ST', 'STP', 'Sao Tome and Principe', 'Africa'),
    ('SV', 'SLV', 'El Salvador', 'Americas'),
    (
        'SX',
        'SXM',
        'Sint Maarten (Dutch part)',
        'Americas'
    ),
    ('SY', 'SYR', 'Syrian Arab Republic', 'Asia'),
    ('SZ', 'SWZ', 'Eswatini', 'Africa'),
    (
        'TC',
        'TCA',
        'Turks and Caicos Islands',
        'Americas'
    ),
    ('TD', 'TCD', 'Chad', 'Africa'),
    (
        'TF',
        'ATF',
        'French Southern Territories',
        'Africa'
    ),
    ('TG', 'TGO', 'Togo', 'Africa'),
    ('TH', 'THA', 'Thailand', 'Asia'),
    ('TJ', 'TJK', 'Tajikistan', 'Asia'),
    ('TK', 'TKL', 'Tokelau', 'Oceania'),
    ('TL', 'TLS', 'Timor-Leste', 'Asia'),
    ('TM', 'TKM', 'Turkmenistan', 'Asia'),
    ('TN', 'TUN', 'Tunisia', 'Africa'),
    ('TO', 'TON', 'Tonga', 'Oceania'),
    ('TR', 'TUR', 'Turkey', 'Asia'),
    ('TT', 'TTO', 'Trinidad and Tobago', 'Americas'),
    ('TV', 'TUV', 'Tuvalu', 'Oceania'),
    ('TW', 'TWN', 'Taiwan, Province of China', 'Asia'),
    (
        'TZ',
        'TZA',
        'Tanzania, United Republic of',
        'Africa'
    ),
    ('UA', 'UKR', 'Ukraine', 'Europe'),
    ('UG', 'UGA', 'Uganda', 'Africa'),
    (
        'UM',
        'UMI',
        'United States Minor Outlying Islands',
        'Oceania'
    ),
    (
        'US',
        'USA',
        'United States of America',
        'Americas'
    ),
    ('UY', 'URY', 'Uruguay', 'Americas'),
    ('UZ', 'UZB', 'Uzbekistan', 'Asia'),
    ('VA', 'VAT', 'Holy See', 'Europe'),
    (
        'VC',
        'VCT',
        'Saint Vincent and the Grenadines',
        'Americas'
    ),
    (
        'VE',
        'VEN',
        'Venezuela (Bolivarian Republic of)',
        'Americas'
    ),
    (
        'VG',
        'VGB',
        'Virgin Islands (British)',
        'Americas'
    ),
    ('VI', 'VIR', 'Virgin Islands (U.S.)', 'Americas'),
    ('VN', 'VNM', 'Viet Nam', 'Asia'),
    ('VU', 'VUT', 'Vanuatu', 'Oceania'),
    ('WF', 'WLF', 'Wallis and Futuna', 'Oceania'),
    ('WS', 'WSM', 'Samoa', 'Oceania'),
    ('YE', 'YEM', 'Yemen', 'Asia'),
    ('YT', 'MYT', 'Mayotte', 'Africa'),
    ('ZA', 'ZAF', 'South Africa', 'Africa'),
    ('ZM', 'ZMB', 'Zambia', 'Africa'),
    ('ZW', 'ZWE', 'Zimbabwe', 'Africa');

--
-- Dumping data for table `master_unit`
--
INSERT INTO
    `master_unit` (`ID_Unit`, `Unit`, `Keterangan`)
VALUES
    (
        'Blok B',
        'Amarterra Villas Bali Nusa Dua- Mgallery',
        '-'
    ),
    ('Blok RA-6', 'The Grand Bali Nusa Dua', '-'),
    ('Blok T', 'The Grand Whiz Hotel Nusa Dua', '-'),
    (
        'Bloks S',
        'Kayumanis Nusa Dua Private Villa & Spa',
        '-'
    ),
    ('N-1', 'Melia Bali', '-'),
    ('N-2', 'The Laguna Resort and Spa Nusa Dua', '-'),
    ('N-3', 'The Westin Resort Nusa Dua Bali', '-'),
    ('N-4', 'Nusa Dua Beach Hotel & Spa', '-'),
    ('N-5', 'Sofitel Bali Nusa Dua Beach Resort', '-'),
    ('N-6', 'Club Med Bali', '-'),
    ('NW-1', 'Bali Nusa Dua Hotel (BNDCC)', '-'),
    (
        'NW2-3',
        'Awarta Nusa Dua Resort & Villas',
        'Masih Close'
    ),
    ('S-3', 'Merusaka', '-'),
    ('S-4', 'Ayodya Resort Bali', '-'),
    ('S-6', 'The St. Regis Bali Resort', '-'),
    ('S1-2', 'Grand Hyatt Bali', '-'),
    ('SW-1', 'Courtyard by Marriott Bali', '-'),
    (
        'SW-2',
        'Novotel Bali Nusa Dua Hotel & Residences',
        '-'
    ),
    ('SW-3', 'Mercure Bali Nusa Dua', '-'),
    (
        'SW-4',
        'Marriott\'\'s Bali Nusa Dua Gardens',
        '-'
    ),
    ('SW4-5', 'The Renaissance Nusa Dua', '-'),
    (
        'SW4-6',
        'Marriott\'\'s Bali Nusa Dua Terrace',
        '-'
    );

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;