-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 21, 2014 at 12:40 AM
-- Server version: 5.6.19
-- PHP Version: 5.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `an_a_train`
--

-- --------------------------------------------------------

--
-- Table structure for table `station_info`
--

CREATE TABLE IF NOT EXISTS `station_info` (
  `station_name` varchar(50) NOT NULL,
  `station_code` varchar(50) NOT NULL,
  `latitude` float(14,7) NOT NULL,
  `longitude` float(14,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_info`
--

INSERT INTO `station_info` (`station_name`, `station_code`, `latitude`, `longitude`) VALUES
('AMBIKAPUR (ABKP)', 'ABKP', 23.6098976, 89.8185654),
('ADILABAD (ADB)', 'ADB', 19.6805859, 78.5361786),
('AHMEDABAD JN (ADI)', 'ADI', 23.0225048, 72.5713654),
('ADRA JN (ADRA)', 'ADRA', 0.0000000, 0.0000000),
('AGRA FORT (AF)', 'AF', 27.1825714, 78.0182266),
('AGRA CANTT (AGC)', 'AGC', 27.1589413, 77.9908447),
('AGARTALA (AGTL)', 'AGTL', 24.8591881, 92.3733444),
('AJMER JN (AII)', 'AII', 26.4498959, 74.6399155),
('ALLAHABAD JN (ALD)', 'ALD', 25.4358006, 81.8463135),
('ALLEPPEY (ALLP)', 'ALLP', 9.4836006, 76.3222961),
('ALLAHABAD CITY (ALY)', 'ALY', 25.4388218, 81.8518066),
('AZAMGARH (AMH)', 'AMH', 26.0390511, 83.1617203),
('AMRAVATI (AMI)', 'AMI', 20.9315567, 77.7584381),
('ADRSH NGR DELHI (ANDI)', 'ANDI', 0.0000000, 0.0000000),
('ANAND VIHAR (ANVR)', 'ANVR', 28.6502171, 77.3151398),
('ANAND VIHAR TRM (ANVT)', 'ANVT', 0.0000000, 0.0000000),
('ALIPUR DUAR JN (APDJ)', 'APDJ', 0.0000000, 0.0000000),
('AISHBAGH (ASH)', 'ASH', 26.8361855, 80.9086761),
('ASANSOL JN (ASN)', 'ASN', 23.6800003, 86.9899979),
('AMRITSAR JN (ASR)', 'ASR', 31.6339798, 74.8722610),
('ATARI (ATT)', 'ATT', 31.5943184, 74.6068268),
('AURANGABAD (AWB)', 'AWB', 19.8596172, 75.3109741),
('AZIMGANJ JN (AZ)', 'AZ', 0.0000000, 0.0000000),
('BANKA (BAKA)', 'BAKA', 23.2244568, 87.0747604),
('BARABIL (BBN)', 'BBN', 22.1053391, 85.3789673),
('BHUBANESWAR (BBS)', 'BBS', 20.3825817, 85.8351364),
('MUMBAI CENTRAL (BCT)', 'BCT', 19.0380917, 72.8670578),
('BANDRA TERMINUS (BDTS)', 'BDTS', 19.0623703, 72.8410263),
('BAREILLY (BE)', 'BE', 28.3371334, 79.4108276),
('BAGALKOT (BGK)', 'BGK', 16.3450241, 75.9000778),
('BHAGAT KI KOTHI (BGKT)', 'BGKT', 26.2507935, 73.0145645),
('BHAGALPUR (BGP)', 'BGP', 25.2419510, 86.9725800),
('BOLPUR S NIKTN (BHP)', 'BHP', 23.6686897, 87.6827698),
('BHUJ (BHUJ)', 'BHUJ', 23.2567291, 69.6762543),
('BHIND (BIX)', 'BIX', 26.5886650, 78.7771988),
('BIJAPUR (BJP)', 'BJP', 16.3450241, 75.9000778),
('BARAUNI JN (BJU)', 'BJU', 0.0000000, 0.0000000),
('BIKANER JN (BKN)', 'BKN', 28.0166664, 73.3119431),
('VALSAD (BL)', 'BL', 20.6078587, 72.9335556),
('BALURGHAT (BLGT)', 'BLGT', 25.2199993, 88.7699966),
('BARMER (BME)', 'BME', 25.7461758, 71.3975983),
('BHIWANI (BNW)', 'BNW', 28.7979565, 76.1251068),
('BERHAMPORE CRT (BPC)', 'BPC', 24.0893536, 88.2639084),
('BHOPAL  JN (BPL)', 'BPL', 23.2599335, 77.4126129),
('BARIPADA (BPO)', 'BPO', 21.9233074, 86.7377853),
('BALHARSHAH (BPQ)', 'BPQ', 19.8333321, 79.3499985),
('VADODARA JN (BRC)', 'BRC', 22.3071594, 73.1812210),
('BARKA KANA (BRKA)', 'BRKA', 23.6231861, 85.4679489),
('BARWADIH JN (BRWD)', 'BRWD', 0.0000000, 0.0000000),
('VARANASI JN (BSB)', 'BSB', 25.3176460, 82.9739151),
('BHUSAVAL JN (BSL)', 'BSL', 0.0000000, 0.0000000),
('BILASPUR JN (BSP)', 'BSP', 22.0796242, 82.1391449),
('BALAGHAT JN (BTC)', 'BTC', 0.0000000, 0.0000000),
('BHATINDA JN (BTI)', 'BTI', 30.2109947, 74.9454727),
('BALLIA (BUI)', 'BUI', 25.7572670, 84.1470566),
('BHAVNAGAR TRMUS (BVC)', 'BVC', 21.7644730, 72.1519318),
('VIJAYAWADA JN (BZA)', 'BZA', 16.5061741, 80.6480179),
('KANNUR (CAN)', 'CAN', 11.8712234, 75.3680954),
('KANYAKUMARI (CAPE)', 'CAPE', 14.0972090, 77.5978699),
('COIMBATORE JN (CBE)', 'CBE', 11.0168447, 76.9558334),
('KAKINADA TOWN (CCT)', 'CCT', 16.9674606, 82.2333755),
('CHANDIGARH (CDG)', 'CDG', 30.6961002, 76.7972794),
('CHIRMIRI (CHRM)', 'CHRM', 23.1899548, 82.3500214),
('KOZHIKKODE (CLT)', 'CLT', 11.2451935, 75.7816467),
('KANPUR CENTRAL (CNB)', 'CNB', 26.4543495, 80.3512497),
('KAKINADA PORT (COA)', 'COA', 16.9511108, 82.2527771),
('KANPUR ANWRGANJ (CPA)', 'CPA', 26.4558811, 80.3281021),
('CHHAPRA (CPR)', 'CPR', 25.8277645, 84.4271698),
('MUMBAI CST (CSTM)', 'CSTM', 19.0901756, 72.8687363),
('CHITTOR (CTO)', 'CTO', 13.2166920, 79.1039886),
('CHHINDWARA JN (CWA)', 'CWA', 22.0574379, 78.9381714),
('DHARMABAD (DAB)', 'DAB', 18.8887920, 77.8487015),
('DARBHANGA JN (DBG)', 'DBG', 26.1604977, 85.8997803),
('DIBRUGARH (DBRG)', 'DBRG', 27.4728336, 94.9119644),
('DIBRUGARH TOWN (DBRT)', 'DBRT', 27.4728336, 94.9119644),
('DEHRADUN (DDN)', 'DDN', 30.3138885, 78.0334549),
('DADAR (DDR)', 'DDR', 19.0180817, 72.8436127),
('DELHI S ROHILLA (DEE)', 'DEE', 28.6661072, 77.1854324),
('DIGHA FLAG STN (DGHA)', 'DGHA', 21.6266174, 87.5074310),
('DHACA CANTT (DHCA)', 'DHCA', 0.0000000, 0.0000000),
('DHULE (DHI)', 'DHI', 20.8878441, 74.7682266),
('DHANBAD JN (DHN)', 'DHN', 23.7956524, 86.4303894),
('DARJEELING (DJ)', 'DJ', 27.0376453, 88.2629700),
('TO DARJEELING (DJRZ)', 'DJRZ', 0.0000000, 0.0000000),
('DELHI (DLI)', 'DLI', 28.9201736, 77.6486359),
('DHEMAJI (DMC)', 'DMC', 27.4891052, 94.5422974),
('DIMAPUR (DMV)', 'DMV', 25.9059048, 93.7281189),
('DANAPUR (DNR)', 'DNR', 18.9424095, 82.5157089),
('DADAR (DR)', 'DR', 19.0180817, 72.8436127),
('DURG (DURG)', 'DURG', 21.2000237, 81.2914505),
('DHARWAR (DWR)', 'DWR', 15.4473381, 75.0041580),
('ERODE JN (ED)', 'ED', 0.0000000, 0.0000000),
('ERANAKULAM JN (ERS)', 'ERS', 0.0000000, 0.0000000),
('ITARSI JN (ET)', 'ET', 22.6054859, 77.7535477),
('FAIZABAD JN (FD)', 'FD', 0.0000000, 0.0000000),
('FIROZPUR CANT (FZR)', 'FZR', 30.9418964, 74.6182632),
('GONDIA JN (G)', 'G', 0.0000000, 0.0000000),
('GAYA JN (GAYA)', 'GAYA', 0.0000000, 0.0000000),
('GONDA JN (GD)', 'GD', 0.0000000, 0.0000000),
('GADAG JN (GDG)', 'GDG', 15.4324656, 75.6380310),
('GUDUR JN (GDR)', 'GDR', 14.1463184, 79.8503876),
('GUWAHATI (GHY)', 'GHY', 26.1812115, 91.7496948),
('GANDHIDHAM BG (GIMB)', 'GIMB', 23.0687904, 70.1480026),
('GORAKHPUR JN (GKP)', 'GKP', 26.7605553, 83.3731689),
('GUNTUR JN (GNT)', 'GNT', 16.3066521, 80.4365387),
('GIRIDIH (GRD)', 'GRD', 24.1819611, 86.3141403),
('GURUVAYUR (GUV)', 'GUV', 10.5971260, 76.0456314),
('GWALIOR (GWL)', 'GWL', 26.2142658, 78.1818390),
('HAPA (HAPA)', 'HAPA', 23.5430584, 72.9413071),
('HABIBGANJ (HBJ)', 'HBJ', 23.2212772, 77.4415131),
('HALDIBARI (HDB)', 'HDB', 0.0000000, 0.0000000),
('HANUMANGARH JN (HMH)', 'HMH', 29.6224442, 74.2942200),
('HISAR (HSR)', 'HSR', 18.1163864, 83.3928680),
('HOSHIARPUR (HSX)', 'HSX', 31.5246239, 75.9059448),
('HATIA (HTE)', 'HTE', 23.3095837, 85.3096848),
('HINDUPUR (HUP)', 'HUP', 13.8187799, 77.5001297),
('HARIDWAR JN (HW)', 'HW', 29.9456902, 78.1642456),
('HOWRAH JN (HWH)', 'HWH', 22.5957680, 88.2636414),
('HYDERABAD DECAN (HYB)', 'HYB', 17.3850441, 78.4866714),
('INDORE JN BG (INDB)', 'INDB', 22.7195683, 75.8577271),
('ISLAMPUR (IPR)', 'IPR', 26.2701778, 88.1856842),
('JAMNAGAR (JAM)', 'JAM', 22.3175640, 70.7948685),
('JAMMU TAWI (JAT)', 'JAT', 32.7065468, 74.8806839),
('JOGBANI (JBN)', 'JBN', 0.0000000, 0.0000000),
('JABALPUR (JBP)', 'JBP', 23.1648045, 79.9503937),
('JHARGRAM (JGM)', 'JGM', 0.0000000, 0.0000000),
('JHANSI JN (JHS)', 'JHS', 25.4484253, 78.5684586),
('JAMALPUR JN (JMP)', 'JMP', 0.0000000, 0.0000000),
('JAIPUR (JP)', 'JP', 26.8266506, 75.8059540),
('JAISALMER (JSM)', 'JSM', 26.9284592, 71.9205704),
('JODHPUR JN (JU)', 'JU', 26.2389469, 73.0243073),
('JALANDHAR CITY (JUC)', 'JUC', 31.3316174, 75.5913467),
('JAYNAGAR (JYG)', 'JYG', 15.4436903, 75.0025940),
('KACHEGUDA (KCG)', 'KCG', 17.3759308, 78.4942780),
('KOCHUVELI (KCVL)', 'KCVL', 8.5107822, 76.8968277),
('KENDUJHARGARH (KDJR)', 'KDJR', 21.6605854, 85.6265411),
('KATHGODAM (KGM)', 'KGM', 29.2158928, 79.5316086),
('KURSEONG (KGN)', 'KGN', 26.8778267, 88.2772903),
('KHARAGPUR JN (KGP)', 'KGP', 22.3302383, 87.3236542),
('KATIHAR JN (KIR)', 'KIR', 25.5335083, 87.5837479),
('KALKA (KLK)', 'KLK', 30.8382244, 76.9320755),
('KUMBAKONAM (KMU)', 'KMU', 10.7666903, 79.6348801),
('KISHANGANJ (KNE)', 'KNE', 28.6642475, 77.2008133),
('KOLKATA (KOAA)', 'KOAA', 22.7039490, 88.3418198),
('C SHAHUMHARAJ T (KOP)', 'KOP', 0.0000000, 0.0000000),
('KOTA JN (KOTA)', 'KOTA', 0.0000000, 0.0000000),
('KORBA (KRBA)', 'KRBA', 22.3375034, 82.7128754),
('KIRANDUL (KRDL)', 'KRDL', 18.6389866, 81.2599030),
('KURNOOL TOWN (KRNT)', 'KRNT', 15.8335323, 78.0335083),
('KORAPUT (KRPU)', 'KRPU', 18.8895206, 82.5482712),
('KASGANJ (KSJ)', 'KSJ', 27.8293552, 78.6771622),
('KOTDWARA (KTW)', 'KTW', 29.7425957, 78.5210953),
('KHAJURAHO (KURJ)', 'KURJ', 24.7970085, 79.8890076),
('KAMAKHYA (KYQ)', 'KYQ', 26.1569023, 91.6908035),
('LEDO (LEDO)', 'LEDO', 27.2912788, 95.7384567),
('LOWER HAFLONG (LFG)', 'LFG', 0.0000000, 0.0000000),
('LALGOLA (LGL)', 'LGL', 24.4166679, 88.2500000),
('LUCKNOW (LJN)', 'LJN', 26.8310719, 80.9256134),
('LUCKNOW (LKO)', 'LKO', 26.8310719, 80.9256134),
('LAL KUAN (LKU)', 'LKU', 28.5024815, 77.2831955),
('LUMDING JN (LMG)', 'LMG', 25.7516270, 93.1728745),
('LOKMANYATILAK T (LTT)', 'LTT', 0.0000000, 0.0000000),
('LATUR (LUR)', 'LUR', 18.4292145, 76.5564117),
('MANGALORE JN (MAJN)', 'MAJN', 12.9141417, 74.8559570),
('MADGAON (MAO)', 'MAO', 15.2736111, 73.9580536),
('MANGALORE CNTL (MAQ)', 'MAQ', 12.9141417, 74.8559570),
('CHENNAI CENTRAL (MAS)', 'MAS', 13.1083822, 80.1802597),
('MUNABAO (MBF)', 'MBF', 25.7429504, 70.2768250),
('MADURAI JN (MDU)', 'MDU', 9.9252005, 78.1197739),
('MUZAFFARPUR JN (MFP)', 'MFP', 26.1208878, 85.3647232),
('MAHUVA JN (MHV)', 'MHV', 0.0000000, 0.0000000),
('MOTIHARI (MKI)', 'MKI', 26.6308727, 84.9055939),
('MANIKPUR JN (MKP)', 'MKP', 0.0000000, 0.0000000),
('MALDA TOWN (MLDT)', 'MLDT', 25.0280685, 88.1271362),
('MANMAD JN (MMR)', 'MMR', 20.2511787, 74.4365997),
('MIRAJ JN (MRJ)', 'MRJ', 0.0000000, 0.0000000),
('CHENNAI EGMORE (MS)', 'MS', 13.0777416, 80.2612762),
('MEERUT CITY (MTC)', 'MTC', 28.9794102, 77.6897049),
('METUR DAM (MTDM)', 'MTDM', 0.0000000, 0.0000000),
('MATHURA JN (MTJ)', 'MTJ', 27.4924126, 77.6736755),
('MACHELIPATNAM (MTM)', 'MTM', 0.0000000, 0.0000000),
('METUPALAIYAM (MTP)', 'MTP', 11.3002310, 76.9349594),
('MANDUADIH (MUV)', 'MUV', 25.3078918, 82.9732361),
('MAYILADUTURAI J (MV)', 'MV', 0.0000000, 0.0000000),
('MARIANI JN (MXN)', 'MXN', 0.0000000, 0.0000000),
('MYSORE JN (MYS)', 'MYS', 12.2958107, 76.6393814),
('NEW COOCH BEHAR (NCB)', 'NCB', 26.3529320, 89.4696426),
('NAGERCOIL JN (NCJ)', 'NCJ', 8.1832857, 77.4119034),
('NAGORE (NCR)', 'NCR', 10.8186388, 79.8462143),
('NANDURBAR (NDB)', 'NDB', 21.3739471, 74.2448959),
('NEW DELHI (NDLS)', 'NDLS', 28.6413841, 77.2184830),
('NANDED (NED)', 'NED', 19.1606216, 77.3105240),
('NEW FARAKKA JN (NFK)', 'NFK', 0.0000000, 0.0000000),
('NAGPUR (NGP)', 'NGP', 21.1512909, 79.0879745),
('NAGAPPATTINAM (NGT)', 'NGT', 10.8199911, 79.8458252),
('NEW JALPAIGURI (NJP)', 'NJP', 26.6829567, 88.4434204),
('NIMACH (NMH)', 'NMH', 24.4629936, 74.8491592),
('NEW ALIPURDAUR (NOQ)', 'NOQ', 26.4859619, 89.5413589),
('NARASAPUR (NS)', 'NS', 16.4457951, 81.6997070),
('NAUTANWA (NTV)', 'NTV', 27.4251709, 83.4200287),
('NIZAMABAD (NZB)', 'NZB', 18.7016563, 78.0499725),
('H NIZAMUDDIN (NZM)', 'NZM', 28.5867252, 77.2528763),
('OKHA (OKHA)', 'OKHA', 28.5594063, 77.2655487),
('PURNA JN (PAU)', 'PAU', 0.0000000, 0.0000000),
('PARTAPGARH JN (PBH)', 'PBH', 0.0000000, 0.0000000),
('PORBANDAR (PBR)', 'PBR', 21.6434631, 69.6114044),
('PONDICHERRY (PDY)', 'PDY', 11.9250002, 79.8277512),
('PALGHAT TOWN (PGTN)', 'PGTN', 10.7708073, 76.6519089),
('PATNA JN (PNBE)', 'PNBE', 25.3680840, 85.9897385),
('PANIPAT JN (PNP)', 'PNP', 29.3395672, 76.9396362),
('PRAYAG (PRG)', 'PRG', 25.4682407, 81.8673019),
('PURULIA JN (PRR)', 'PRR', 23.3320770, 86.3652115),
('PATHANKOT (PTK)', 'PTK', 32.2715797, 75.6451721),
('PUNE JN2 (PUNE)', 'PUNE', 18.5200672, 73.8673630),
('PURI (PURI)', 'PURI', 28.6644287, 77.1837616),
('PANDHARPUR (PVR)', 'PVR', 17.6745529, 75.3237228),
('QUILON JN (QLN)', 'QLN', 9.0366507, 76.6000061),
('RAIPUR JN (R)', 'R', 21.2513847, 81.6296387),
('RAE BARELI JN (RBL)', 'RBL', 26.2299995, 81.2500000),
('RADHIKAPUR (RDP)', 'RDP', 25.6431084, 88.4478378),
('REWA (REWA)', 'REWA', 24.5365238, 81.2606125),
('RAJGIR (RGD)', 'RGD', 25.0172577, 85.4161606),
('RAYAGADA (RGDA)', 'RGDA', 19.1758137, 83.4106522),
('RAIGARH (RIG)', 'RIG', 19.0099449, 73.0943909),
('RJNDR NGR BIHAR (RJPB)', 'RJPB', 0.0000000, 0.0000000),
('RAJKOT JN (RJT)', 'RJT', 22.3038940, 70.8021622),
('RISHIKESH (RKSH)', 'RKSH', 30.1077042, 78.2879868),
('RAMESWARAM (RMM)', 'RMM', 9.2813873, 79.3066559),
('RAMNAGAR (RMR)', 'RMR', 21.6770153, 87.5536957),
('RANCHI (RNC)', 'RNC', 23.3493786, 85.3351059),
('RANGIYA JN (RNY)', 'RNY', 0.0000000, 0.0000000),
('ROHTAK JN (ROK)', 'ROK', 28.8908997, 76.5795975),
('ROURKELA (ROU)', 'ROU', 22.2280197, 84.8617325),
('RAMPUR HAT (RPH)', 'RPH', 25.3226662, 88.6915131),
('RATANGARH JN (RTGH)', 'RTGH', 0.0000000, 0.0000000),
('RATLAM JN (RTM)', 'RTM', 23.3341694, 75.0376358),
('RAXUAL JN (RXL)', 'RXL', 0.0000000, 0.0000000),
('BANGALORE CY JN (SBC)', 'SBC', 12.9715986, 77.5945663),
('SAHIBGANJ JN (SBG)', 'SBG', 0.0000000, 0.0000000),
('SAMBALPUR (SBP)', 'SBP', 21.4835835, 83.9607849),
('SECUNDERABAD JN (SC)', 'SC', 17.4399300, 78.4982758),
('SILCHAR (SCL)', 'SCL', 24.8300533, 92.7873993),
('SENGOTTAI (SCT)', 'SCT', 8.9873371, 77.2421722),
('SEALDAH (SDAH)', 'SDAH', 22.5677242, 88.3731003),
('SADULPUR JN (SDLP)', 'SDLP', 0.0000000, 0.0000000),
('SONPUR JN (SEE)', 'SEE', 0.0000000, 0.0000000),
('SHRI GANGANAGAR (SGNR)', 'SGNR', 29.9321918, 73.8718643),
('SINGRAULI (SGRL)', 'SGRL', 24.2046242, 82.6427765),
('SILIGURI JN (SGUJ)', 'SGUJ', 26.7083817, 88.4268723),
('SAHARSA JN (SHC)', 'SHC', 0.0000000, 0.0000000),
('SHALIMAR (SHM)', 'SHM', 22.5567150, 88.3160324),
('SHAKTI NAGAR (SKTN)', 'SKTN', 24.1213799, 82.7026138),
('SIRPUR KAGAZNGR (SKZR)', 'SKZR', 0.0000000, 0.0000000),
('SULTANPUR (SLN)', 'SLN', 26.2639866, 82.0681839),
('SHIMOGA TOWN (SMET)', 'SMET', 13.9410830, 75.5821686),
('SITAMARHI (SMI)', 'SMI', 26.5949116, 85.5050125),
('SIMLA (SML)', 'SML', 27.0720158, 72.1247025),
('SOMNATH (SMNH)', 'SMNH', 20.8956947, 70.4079742),
('SAINAGAR SHIRDI (SNSI)', 'SNSI', 0.0000000, 0.0000000),
('SANTRAGACHI JN (SRC)', 'SRC', 0.0000000, 0.0000000),
('SAHARANPUR (SRE)', 'SRE', 29.8577251, 77.8815231),
('SHORANUR JN (SRR)', 'SRR', 10.7700005, 76.2799988),
('SAI P NILAYAM (SSPN)', 'SSPN', 18.7882156, 78.9102631),
('SURAT (ST)', 'ST', 21.2048931, 72.8408432),
('SOLAPUR JN (SUR)', 'SUR', 17.6599197, 75.9063873),
('SIURI (SURI)', 'SURI', 0.0000000, 0.0000000),
('SAWANTWADI ROAD (SWV)', 'SWV', 15.9052629, 73.8213196),
('TATANAGAR JN (TATA)', 'TATA', 0.0000000, 0.0000000),
('TIRUCHENDUR (TCN)', 'TCN', 8.5025177, 78.1175232),
('TIRUNELVELI (TEN)', 'TEN', 8.6800900, 77.5626831),
('TITLAGARH (TIG)', 'TIG', 20.2870369, 83.1550293),
('TUTICORIN (TN)', 'TN', 8.8061104, 78.1553726),
('TIRUCHCHIRAPALI JN (TPJ)', 'TPJ', 0.0000000, 0.0000000),
('TIRUPATI (TPTY)', 'TPTY', 19.0152512, 73.0962906),
('TANAKPUR (TPU)', 'TPU', 29.0673485, 80.1095581),
('TRIVANDRUM CNTL (TVC)', 'TVC', 8.4875002, 76.9524994),
('UDAGAMANDALAM (UAM)', 'UAM', 11.4099998, 76.6999969),
('HUBLI JN (UBL)', 'UBL', 15.3647079, 75.1239548),
('UDAIPUR CITY (UDZ)', 'UDZ', 24.5956116, 73.6922379),
('UNA HIMACHAL (UHL)', 'UHL', 0.0000000, 0.0000000),
('UDHAMPUR (UHP)', 'UHP', 32.9262047, 75.1542664),
('UJJAIN JN (UJN)', 'UJN', 23.1793022, 75.7849121),
('AMBALA CANT JN (UMB)', 'UMB', 30.3781796, 76.7766953),
('VIKARABAD JN (VKB)', 'VKB', 17.3364296, 77.9048462),
('VERAVAL (VRL)', 'VRL', 20.9158974, 70.3628540),
('VASCO DA GAMA (VSG)', 'VSG', 0.0000000, 0.0000000),
('VISHAKAPATNAM (VSKP)', 'VSKP', 17.7221069, 83.2911224),
('YESVANTPUR JN (YPR)', 'YPR', 0.0000000, 0.0000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `station_info`
--
ALTER TABLE `station_info`
 ADD UNIQUE KEY `station_code` (`station_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;