-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2018 at 09:18 AM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_indicator_calc`
--

CREATE TABLE `mdl_analytics_indicator_calc` (
  `id` bigint(10) NOT NULL,
  `starttime` bigint(10) NOT NULL,
  `endtime` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sampleorigin` varchar(255) NOT NULL DEFAULT '',
  `sampleid` bigint(10) NOT NULL,
  `indicator` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(10,2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stored indicator calculations' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_models`
--

CREATE TABLE `mdl_analytics_models` (
  `id` bigint(10) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `trained` tinyint(1) NOT NULL DEFAULT '0',
  `target` varchar(255) NOT NULL DEFAULT '',
  `indicators` longtext NOT NULL,
  `timesplitting` varchar(255) DEFAULT NULL,
  `version` bigint(10) NOT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Analytic models.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_analytics_models`
--

INSERT INTO `mdl_analytics_models` (`id`, `enabled`, `trained`, `target`, `indicators`, `timesplitting`, `version`, `timecreated`, `timemodified`, `usermodified`) VALUES
(1, 0, 0, '\\core\\analytics\\target\\course_dropout', '["\\\\mod_assign\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_assign\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_book\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_book\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_chat\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_chat\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_choice\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_choice\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_data\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_data\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_feedback\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_feedback\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_folder\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_folder\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_forum\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_forum\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_glossary\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_glossary\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_imscp\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_imscp\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_label\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_label\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_lesson\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_lesson\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_lti\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_lti\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_page\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_page\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_quiz\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_quiz\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_resource\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_resource\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_scorm\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_scorm\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_survey\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_survey\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_url\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_url\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_wiki\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_wiki\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_workshop\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_workshop\\\\analytics\\\\indicator\\\\social_breadth","\\\\core_course\\\\analytics\\\\indicator\\\\completion_enabled","\\\\core_course\\\\analytics\\\\indicator\\\\potential_cognitive_depth","\\\\core_course\\\\analytics\\\\indicator\\\\potential_social_breadth","\\\\core\\\\analytics\\\\indicator\\\\any_access_after_end","\\\\core\\\\analytics\\\\indicator\\\\any_access_before_start","\\\\core\\\\analytics\\\\indicator\\\\any_write_action_in_course","\\\\core\\\\analytics\\\\indicator\\\\read_actions"]', NULL, 1524839716, 1524839716, 1524839716, 0),
(2, 1, 1, '\\core\\analytics\\target\\no_teaching', '["\\\\core_course\\\\analytics\\\\indicator\\\\no_teacher","\\\\core_course\\\\analytics\\\\indicator\\\\no_student"]', '\\core\\analytics\\time_splitting\\single_range', 1524839716, 1524839716, 1524839716, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_models_log`
--

CREATE TABLE `mdl_analytics_models_log` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL,
  `version` bigint(10) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '',
  `indicators` longtext NOT NULL,
  `timesplitting` varchar(255) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `info` longtext,
  `dir` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Analytic models changes during evaluation.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_predictions`
--

CREATE TABLE `mdl_analytics_predictions` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sampleid` bigint(10) NOT NULL,
  `rangeindex` mediumint(5) NOT NULL,
  `prediction` decimal(10,2) NOT NULL,
  `predictionscore` decimal(10,5) NOT NULL,
  `calculations` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Predictions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_prediction_actions`
--

CREATE TABLE `mdl_analytics_prediction_actions` (
  `id` bigint(10) NOT NULL,
  `predictionid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `actionname` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Register of user actions over predictions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_predict_samples`
--

CREATE TABLE `mdl_analytics_predict_samples` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL,
  `analysableid` bigint(10) NOT NULL,
  `timesplitting` varchar(255) NOT NULL DEFAULT '',
  `rangeindex` bigint(10) NOT NULL,
  `sampleids` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Samples already used for predictions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_train_samples`
--

CREATE TABLE `mdl_analytics_train_samples` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL,
  `analysableid` bigint(10) NOT NULL,
  `timesplitting` varchar(255) NOT NULL DEFAULT '',
  `fileid` bigint(10) NOT NULL,
  `sampleids` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Samples used for training' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_used_analysables`
--

CREATE TABLE `mdl_analytics_used_analysables` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL,
  `action` varchar(50) NOT NULL DEFAULT '',
  `analysableid` bigint(10) NOT NULL,
  `timeanalysed` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of analysables used by each model' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_used_files`
--

CREATE TABLE `mdl_analytics_used_files` (
  `id` bigint(10) NOT NULL,
  `modelid` bigint(10) NOT NULL DEFAULT '0',
  `fileid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `time` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Files that have already been used for training and predictio' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `gradingduedate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table saves information about an instance of mod_assign' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Text feedback for submitted assignments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores annotations added to pdfs submitted by students' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores comments added to pdfs' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_queue`
--

CREATE TABLE `mdl_assignfeedback_editpdf_queue` (
  `id` bigint(10) NOT NULL,
  `submissionid` bigint(10) NOT NULL,
  `submissionattempt` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Queue for processing.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores teacher specified quicklist comments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores info about the number of files submitted by a student' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines assignments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about submitted assignments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_upgrade`
--

CREATE TABLE `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about upgraded assignments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about file submissions for assignments' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Info about onlinetext submission' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Grading information about a single assignment submission.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_overrides`
--

CREATE TABLE `mdl_assign_overrides` (
  `id` bigint(10) NOT NULL,
  `assignid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `allowsubmissionsfromdate` bigint(10) DEFAULT NULL,
  `duedate` bigint(10) DEFAULT NULL,
  `cutoffdate` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The overrides to assign settings.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Config data for an instance of a plugin in an assignment.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about student interactions with' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of flags that can be set for a single user in a single ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Map an assignment specific id number to a user' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_auth_oauth2_linked_login`
--

CREATE TABLE `mdl_auth_oauth2_linked_login` (
  `id` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` longtext NOT NULL,
  `confirmtoken` varchar(64) NOT NULL DEFAULT '',
  `confirmtokenexpires` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Accounts linked to a users Moodle account.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store the backup_controllers as they are used' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store every course backup status' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='To store all the logs from backup and restore operations (by' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines badge' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines settings for connecting external backpack' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines criteria for issuing badges' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines criteria that were met for an issued badge' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines parameters for badges criteria' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Setting for external badges display' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines issued badges' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Track manual award criteria for badges' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='contains all installed blocks' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'activity_results', 0, 0, 1),
(3, 'admin_bookmarks', 0, 0, 1),
(4, 'badges', 0, 0, 1),
(5, 'blog_menu', 0, 0, 1),
(6, 'blog_recent', 0, 0, 1),
(7, 'blog_tags', 0, 0, 1),
(8, 'calendar_month', 0, 0, 1),
(9, 'calendar_upcoming', 0, 0, 1),
(10, 'comments', 0, 0, 1),
(11, 'community', 0, 0, 1),
(12, 'completionstatus', 0, 0, 1),
(13, 'course_list', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 1),
(16, 'globalsearch', 0, 0, 1),
(17, 'glossary_random', 0, 0, 1),
(18, 'html', 0, 0, 1),
(19, 'login', 0, 0, 1),
(20, 'lp', 0, 0, 1),
(21, 'mentees', 0, 0, 1),
(22, 'mnet_hosts', 0, 0, 1),
(23, 'myoverview', 0, 0, 1),
(24, 'myprofile', 0, 0, 1),
(25, 'navigation', 0, 0, 1),
(26, 'news_items', 0, 0, 1),
(27, 'online_users', 0, 0, 1),
(28, 'participants', 0, 0, 1),
(29, 'private_files', 0, 0, 1),
(30, 'quiz_results', 0, 0, 0),
(31, 'recent_activity', 86400, 0, 1),
(32, 'rss_client', 300, 0, 1),
(33, 'search_forums', 0, 0, 1),
(34, 'section_links', 0, 0, 1),
(35, 'selfcompletion', 0, 0, 1),
(36, 'settings', 0, 0, 1),
(37, 'site_main_menu', 0, 0, 1),
(38, 'social_activities', 0, 0, 1),
(39, 'tag_flickr', 0, 0, 1),
(40, 'tag_youtube', 0, 0, 0),
(41, 'tags', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Community block' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `requiredbytheme` smallint(4) NOT NULL DEFAULT '0',
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores block instances. The type of block this is' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `requiredbytheme`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`, `timecreated`, `timemodified`) VALUES
(1, 'admin_bookmarks', 1, 0, 0, 'admin-*', NULL, 'side-pre', 2, '', 1524839756, 1524839756),
(2, 'private_files', 1, 0, 0, 'my-index', '2', 'side-post', 0, '', 1524839756, 1524839756),
(3, 'online_users', 1, 0, 0, 'my-index', '2', 'side-post', 1, '', 1524839756, 1524839756),
(4, 'badges', 1, 0, 0, 'my-index', '2', 'side-post', 2, '', 1524839756, 1524839756),
(5, 'calendar_month', 1, 0, 0, 'my-index', '2', 'side-post', 3, '', 1524839756, 1524839756),
(6, 'calendar_upcoming', 1, 0, 0, 'my-index', '2', 'side-post', 4, '', 1524839756, 1524839756),
(7, 'lp', 1, 0, 0, 'my-index', '2', 'content', 0, '', 1524839756, 1524839756),
(8, 'myoverview', 1, 0, 0, 'my-index', '2', 'content', 1, '', 1524839756, 1524839756),
(9, 'private_files', 5, 0, 0, 'my-index', '3', 'side-post', 0, '', 1524840244, 1524840244),
(10, 'online_users', 5, 0, 0, 'my-index', '3', 'side-post', 1, '', 1524840244, 1524840244),
(11, 'badges', 5, 0, 0, 'my-index', '3', 'side-post', 2, '', 1524840244, 1524840244),
(12, 'calendar_month', 5, 0, 0, 'my-index', '3', 'side-post', 3, '', 1524840244, 1524840244),
(13, 'calendar_upcoming', 5, 0, 0, 'my-index', '3', 'side-post', 4, '', 1524840244, 1524840244),
(14, 'lp', 5, 0, 0, 'my-index', '3', 'content', 0, '', 1524840244, 1524840244),
(15, 'myoverview', 5, 0, 0, 'my-index', '3', 'content', 1, '', 1524840244, 1524840244);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the position of a sticky block_instance on a another ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_recent_activity`
--

CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Recent activity block' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Remote news feed information. Contains the news feed id, the' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Associations of blog entries with courses and module instanc' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='External blog links used for RSS copying of blog entries to ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines book' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines book_chapters' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For keeping information about cached data' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cache of time-sensitive flags' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1525097518, '1', 1525104718),
(2, 'accesslib/dirtycontexts', '/1/5/21', 1524853632, '1', 1524860832),
(3, 'accesslib/dirtycontexts', '/1/5/22', 1524853633, '1', 1524860833);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this defines all capabilities' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:configview', 'read', 10, 'moodle', 0),
(3, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(4, 'moodle/site:manageallmessaging', 'write', 10, 'moodle', 8),
(5, 'moodle/site:deleteanymessage', 'write', 10, 'moodle', 32),
(6, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(7, 'moodle/site:deleteownmessage', 'write', 10, 'moodle', 0),
(8, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(9, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(12, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(13, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(14, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(15, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(16, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(17, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(18, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(23, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(24, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(25, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(26, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(27, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(28, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(29, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(30, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(31, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(32, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(33, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(34, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(35, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(36, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(37, 'moodle/user:create', 'write', 10, 'moodle', 24),
(38, 'moodle/user:delete', 'write', 10, 'moodle', 40),
(39, 'moodle/user:update', 'write', 10, 'moodle', 24),
(40, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(41, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(42, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
(43, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(44, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(45, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(47, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(48, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(49, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(50, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(51, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(52, 'moodle/role:review', 'read', 50, 'moodle', 8),
(53, 'moodle/role:override', 'write', 50, 'moodle', 28),
(54, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(55, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(56, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(57, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(58, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(59, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(60, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(61, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:create', 'write', 40, 'moodle', 4),
(63, 'moodle/course:request', 'write', 10, 'moodle', 0),
(64, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(65, 'moodle/course:update', 'write', 50, 'moodle', 4),
(66, 'moodle/course:view', 'read', 50, 'moodle', 0),
(67, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(68, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(69, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
(70, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(71, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(72, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(73, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(74, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(75, 'moodle/course:ignoreavailabilityrestrictions', 'read', 70, 'moodle', 0),
(76, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(77, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(78, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(79, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(80, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(81, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(82, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(83, 'moodle/course:renameroles', 'write', 50, 'moodle', 0),
(84, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(85, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(86, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(87, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(88, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(89, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(90, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(91, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(92, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(93, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(94, 'moodle/course:tag', 'write', 50, 'moodle', 16),
(95, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(96, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(97, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(98, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(99, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(100, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(101, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(102, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(103, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(104, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(105, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(106, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(107, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(108, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(109, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(110, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(111, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(112, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(113, 'moodle/question:add', 'write', 50, 'moodle', 20),
(114, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(115, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(116, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(117, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(118, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(119, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(120, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(121, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(122, 'moodle/question:config', 'write', 10, 'moodle', 2),
(123, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(124, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(125, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(126, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(127, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(128, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(129, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(130, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(131, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(132, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(133, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(134, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(135, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(136, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(137, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(138, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(139, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(140, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(141, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(142, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(143, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(144, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(145, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(146, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(148, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(149, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(150, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(151, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(152, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(153, 'moodle/block:view', 'read', 80, 'moodle', 0),
(154, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(155, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(156, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(157, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(158, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(159, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(160, 'moodle/webservice:managealltokens', 'write', 10, 'moodle', 42),
(161, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(162, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(163, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(164, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(165, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(166, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(167, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(168, 'moodle/course:overridecompletion', 'write', 50, 'moodle', 0),
(169, 'moodle/community:add', 'write', 10, 'moodle', 0),
(170, 'moodle/community:download', 'write', 10, 'moodle', 0),
(171, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(172, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(173, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(174, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(175, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(176, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(177, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(178, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(179, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 4),
(180, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(181, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(182, 'moodle/badges:revokebadge', 'write', 50, 'moodle', 16),
(183, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(184, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
(185, 'moodle/search:query', 'read', 10, 'moodle', 0),
(186, 'moodle/competency:competencymanage', 'write', 40, 'moodle', 0),
(187, 'moodle/competency:competencyview', 'read', 40, 'moodle', 0),
(188, 'moodle/competency:competencygrade', 'write', 50, 'moodle', 0),
(189, 'moodle/competency:coursecompetencymanage', 'write', 50, 'moodle', 0),
(190, 'moodle/competency:coursecompetencyconfigure', 'write', 70, 'moodle', 0),
(191, 'moodle/competency:coursecompetencygradable', 'read', 50, 'moodle', 0),
(192, 'moodle/competency:coursecompetencyview', 'read', 50, 'moodle', 0),
(193, 'moodle/competency:evidencedelete', 'write', 30, 'moodle', 0),
(194, 'moodle/competency:planmanage', 'write', 30, 'moodle', 0),
(195, 'moodle/competency:planmanagedraft', 'write', 30, 'moodle', 0),
(196, 'moodle/competency:planmanageown', 'write', 30, 'moodle', 0),
(197, 'moodle/competency:planmanageowndraft', 'write', 30, 'moodle', 0),
(198, 'moodle/competency:planview', 'read', 30, 'moodle', 0),
(199, 'moodle/competency:planviewdraft', 'read', 30, 'moodle', 0),
(200, 'moodle/competency:planviewown', 'read', 30, 'moodle', 0),
(201, 'moodle/competency:planviewowndraft', 'read', 30, 'moodle', 0),
(202, 'moodle/competency:planrequestreview', 'write', 30, 'moodle', 0),
(203, 'moodle/competency:planrequestreviewown', 'write', 30, 'moodle', 0),
(204, 'moodle/competency:planreview', 'write', 30, 'moodle', 0),
(205, 'moodle/competency:plancomment', 'write', 30, 'moodle', 0),
(206, 'moodle/competency:plancommentown', 'write', 30, 'moodle', 0),
(207, 'moodle/competency:usercompetencyview', 'read', 30, 'moodle', 0),
(208, 'moodle/competency:usercompetencyrequestreview', 'write', 30, 'moodle', 0),
(209, 'moodle/competency:usercompetencyrequestreviewown', 'write', 30, 'moodle', 0),
(210, 'moodle/competency:usercompetencyreview', 'write', 30, 'moodle', 0),
(211, 'moodle/competency:usercompetencycomment', 'write', 30, 'moodle', 0),
(212, 'moodle/competency:usercompetencycommentown', 'write', 30, 'moodle', 0),
(213, 'moodle/competency:templatemanage', 'write', 40, 'moodle', 0),
(214, 'moodle/analytics:listinsights', 'read', 50, 'moodle', 8),
(215, 'moodle/analytics:managemodels', 'write', 10, 'moodle', 2),
(216, 'moodle/competency:templateview', 'read', 40, 'moodle', 0),
(217, 'moodle/competency:userevidencemanage', 'write', 30, 'moodle', 0),
(218, 'moodle/competency:userevidencemanageown', 'write', 30, 'moodle', 0),
(219, 'moodle/competency:userevidenceview', 'read', 30, 'moodle', 0),
(220, 'moodle/site:maintenanceaccess', 'write', 10, 'moodle', 0),
(221, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(222, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(223, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(224, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(225, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(226, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
(227, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(228, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(229, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(230, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(231, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(232, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(233, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
(234, 'mod/assign:viewblinddetails', 'write', 70, 'mod_assign', 8),
(235, 'mod/assign:receivegradernotifications', 'read', 70, 'mod_assign', 0),
(236, 'mod/assign:manageoverrides', 'write', 70, 'mod_assign', 0),
(237, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(238, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(239, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(240, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(241, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(242, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(243, 'mod/book:read', 'read', 70, 'mod_book', 0),
(244, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(245, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(246, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(247, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(248, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(249, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(250, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(251, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(252, 'mod/chat:view', 'read', 70, 'mod_chat', 0),
(253, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(254, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(255, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(256, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(257, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(258, 'mod/choice:view', 'read', 70, 'mod_choice', 0),
(259, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(260, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(261, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(262, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(263, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(264, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(265, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(266, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(267, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(268, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(269, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(270, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(271, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(272, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(273, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(274, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(275, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(276, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(277, 'mod/data:view', 'read', 70, 'mod_data', 0),
(278, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(279, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(280, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(281, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(282, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(283, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(284, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(285, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(286, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(287, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(288, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(289, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(290, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(291, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(292, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(293, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(294, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(295, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(296, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(297, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(298, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(299, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(300, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(301, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(302, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(303, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(304, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(305, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(306, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(307, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(308, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(309, 'mod/forum:pindiscussions', 'write', 70, 'mod_forum', 0),
(310, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(311, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(312, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(313, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(314, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(315, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(316, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(317, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(318, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(319, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(320, 'mod/forum:canposttomygroups', 'write', 70, 'mod_forum', 0),
(321, 'mod/forum:canoverridediscussionlock', 'write', 70, 'mod_forum', 0),
(322, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(323, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(324, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(325, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(326, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(327, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(328, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(329, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(330, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(331, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(332, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(333, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(334, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(335, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(336, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(337, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(338, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(339, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(340, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(341, 'mod/label:view', 'read', 70, 'mod_label', 0),
(342, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(343, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(344, 'mod/lesson:grade', 'write', 70, 'mod_lesson', 20),
(345, 'mod/lesson:viewreports', 'read', 70, 'mod_lesson', 8),
(346, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(347, 'mod/lesson:manageoverrides', 'write', 70, 'mod_lesson', 0),
(348, 'mod/lesson:view', 'read', 70, 'mod_lesson', 0),
(349, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(350, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(351, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(352, 'mod/lti:admin', 'write', 70, 'mod_lti', 8),
(353, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(354, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(355, 'mod/page:view', 'read', 70, 'mod_page', 0),
(356, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(357, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(358, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(359, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(360, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(361, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(362, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(363, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(364, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
(365, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(366, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(367, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(368, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(369, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(370, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(371, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(372, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(373, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(374, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(375, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(376, 'mod/scorm:skipview', 'read', 70, 'mod_scorm', 0),
(377, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(378, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(379, 'mod/scorm:deleteresponses', 'write', 70, 'mod_scorm', 0),
(380, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(381, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(382, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(383, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(384, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(385, 'mod/url:view', 'read', 70, 'mod_url', 0),
(386, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(387, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(388, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(389, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(390, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(391, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(392, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(393, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(394, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(395, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(396, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(397, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(398, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(399, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(400, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(401, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(402, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(403, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(404, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(405, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(406, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(407, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(408, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(409, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(410, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(411, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(412, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(413, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(414, 'mod/workshop:deletesubmissions', 'write', 70, 'mod_workshop', 0),
(415, 'mod/workshop:exportsubmissions', 'read', 70, 'mod_workshop', 0),
(416, 'auth/oauth2:managelinkedlogins', 'write', 30, 'auth_oauth2', 0),
(417, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(418, 'enrol/category:config', 'write', 50, 'enrol_category', 0),
(419, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(420, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(421, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(422, 'enrol/database:config', 'write', 50, 'enrol_database', 0),
(423, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(424, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(425, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(426, 'enrol/imsenterprise:config', 'write', 50, 'enrol_imsenterprise', 0),
(427, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(428, 'enrol/lti:config', 'write', 50, 'enrol_lti', 0),
(429, 'enrol/lti:unenrol', 'write', 50, 'enrol_lti', 0),
(430, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(431, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(432, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(433, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(434, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(435, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(436, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(437, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(438, 'enrol/mnet:config', 'write', 50, 'enrol_mnet', 0),
(439, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(440, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(441, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(442, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(443, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(444, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(445, 'enrol/self:holdkey', 'write', 50, 'enrol_self', 0),
(446, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(447, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(448, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
(449, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(450, 'block/activity_results:addinstance', 'write', 80, 'block_activity_results', 20),
(451, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(452, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(453, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(454, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(455, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(456, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(457, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(458, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(459, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(460, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(461, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(462, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(463, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(464, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(465, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(466, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(467, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(468, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(469, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(470, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(471, 'block/globalsearch:myaddinstance', 'write', 10, 'block_globalsearch', 0),
(472, 'block/globalsearch:addinstance', 'write', 80, 'block_globalsearch', 0),
(473, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(474, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(475, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(476, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(477, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(478, 'block/lp:addinstance', 'write', 10, 'block_lp', 0),
(479, 'block/lp:myaddinstance', 'write', 10, 'block_lp', 0),
(480, 'block/lp:view', 'read', 10, 'block_lp', 0),
(481, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(482, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(483, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(484, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(485, 'block/myoverview:myaddinstance', 'write', 10, 'block_myoverview', 0),
(486, 'block/myoverview:addinstance', 'write', 80, 'block_myoverview', 20),
(487, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(488, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(489, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(490, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(491, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(492, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(493, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(494, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(495, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(496, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(497, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(498, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(499, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(500, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(501, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
(502, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
(503, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(504, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(505, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(506, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(507, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(508, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(509, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(510, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(511, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(512, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(513, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(514, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(515, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(516, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(517, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(518, 'report/completion:view', 'read', 50, 'report_completion', 8),
(519, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(520, 'report/log:view', 'read', 50, 'report_log', 8),
(521, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(522, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(523, 'report/outline:view', 'read', 50, 'report_outline', 8),
(524, 'report/participation:view', 'read', 50, 'report_participation', 8),
(525, 'report/performance:view', 'read', 10, 'report_performance', 2),
(526, 'report/progress:view', 'read', 50, 'report_progress', 8),
(527, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(528, 'report/security:view', 'read', 10, 'report_security', 2),
(529, 'report/stats:view', 'read', 50, 'report_stats', 8),
(530, 'report/usersessions:manageownsessions', 'write', 30, 'report_usersessions', 0),
(531, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(532, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(533, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(534, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(535, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(536, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(537, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(538, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(539, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(540, 'gradeimport/direct:view', 'write', 50, 'gradeimport_direct', 0),
(541, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(542, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(543, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(544, 'gradereport/history:view', 'read', 50, 'gradereport_history', 8),
(545, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(546, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(547, 'gradereport/singleview:view', 'read', 50, 'gradereport_singleview', 8),
(548, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(549, 'webservice/rest:use', 'read', 50, 'webservice_rest', 0),
(550, 'webservice/soap:use', 'read', 50, 'webservice_soap', 0),
(551, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 0),
(552, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(553, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(554, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(555, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(556, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(557, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(558, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(559, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(560, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(561, 'repository/local:view', 'read', 70, 'repository_local', 0),
(562, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(563, 'repository/onedrive:view', 'read', 70, 'repository_onedrive', 0),
(564, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(565, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(566, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(567, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(568, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(569, 'repository/url:view', 'read', 70, 'repository_url', 0),
(570, 'repository/user:view', 'read', 70, 'repository_user', 0),
(571, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(572, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(573, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(574, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(575, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(576, 'tool/lpmigrate:frameworksmigrate', 'write', 10, 'tool_lpmigrate', 0),
(577, 'tool/monitor:subscribe', 'read', 50, 'tool_monitor', 8),
(578, 'tool/monitor:managerules', 'write', 50, 'tool_monitor', 4),
(579, 'tool/monitor:managetool', 'write', 10, 'tool_monitor', 4),
(580, 'tool/recyclebin:deleteitems', 'write', 50, 'tool_recyclebin', 32),
(581, 'tool/recyclebin:restoreitems', 'write', 50, 'tool_recyclebin', 0),
(582, 'tool/recyclebin:viewitems', 'read', 50, 'tool_recyclebin', 0),
(583, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(584, 'tool/usertours:managetours', 'write', 10, 'tool_usertours', 4),
(585, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(586, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(587, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(588, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(589, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(590, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each of these is a chat room' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `issystem` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all the actual chat messages' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `issystem` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores current session' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of which users are in which chat rooms' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Available choices are stored here' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='choices performed by users' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='available options to choice' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record represents one cohort (aka site-wide group).' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a user to a cohort.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='moodle comments module' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency`
--

CREATE TABLE `mdl_competency` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `competencyframeworkid` bigint(10) NOT NULL,
  `parentid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL,
  `ruletype` varchar(100) DEFAULT NULL,
  `ruleoutcome` tinyint(2) NOT NULL DEFAULT '0',
  `ruleconfig` longtext,
  `scaleid` bigint(10) DEFAULT NULL,
  `scaleconfiguration` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains the master record of each competency in ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_coursecomp`
--

CREATE TABLE `mdl_competency_coursecomp` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a course.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_coursecompsetting`
--

CREATE TABLE `mdl_competency_coursecompsetting` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `pushratingstouserplans` tinyint(2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains the course specific settings for compete' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_evidence`
--

CREATE TABLE `mdl_competency_evidence` (
  `id` bigint(10) NOT NULL,
  `usercompetencyid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `actionuserid` bigint(10) DEFAULT NULL,
  `descidentifier` varchar(255) NOT NULL DEFAULT '',
  `desccomponent` varchar(255) NOT NULL DEFAULT '',
  `desca` longtext,
  `url` varchar(255) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `note` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The evidence linked to a user competency' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_framework`
--

CREATE TABLE `mdl_competency_framework` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `scaleid` bigint(11) DEFAULT NULL,
  `scaleconfiguration` longtext NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of competency frameworks.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_modulecomp`
--

CREATE TABLE `mdl_competency_modulecomp` (
  `id` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a module.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_plan`
--

CREATE TABLE `mdl_competency_plan` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `templateid` bigint(10) DEFAULT NULL,
  `origtemplateid` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint(10) DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Learning plans' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_plancomp`
--

CREATE TABLE `mdl_competency_plancomp` (
  `id` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Plan competencies' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_relatedcomp`
--

CREATE TABLE `mdl_competency_relatedcomp` (
  `id` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `relatedcompetencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Related competencies' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_template`
--

CREATE TABLE `mdl_competency_template` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `duedate` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Learning plan templates.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_templatecohort`
--

CREATE TABLE `mdl_competency_templatecohort` (
  `id` bigint(10) NOT NULL,
  `templateid` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default comment for the table, please edit me' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_templatecomp`
--

CREATE TABLE `mdl_competency_templatecomp` (
  `id` bigint(10) NOT NULL,
  `templateid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a competency to a learning plan template.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercomp`
--

CREATE TABLE `mdl_competency_usercomp` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercompcourse`
--

CREATE TABLE `mdl_competency_usercompcourse` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies in a course' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercompplan`
--

CREATE TABLE `mdl_competency_usercompplan` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User competencies plans' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_userevidence`
--

CREATE TABLE `mdl_competency_userevidence` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The evidence of prior learning' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_userevidencecomp`
--

CREATE TABLE `mdl_competency_userevidencecomp` (
  `id` bigint(10) NOT NULL,
  `userevidenceid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Relationship between user evidence and competencies' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Moodle configuration variables' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(5, 'theme', 'boost'),
(6, 'filter_multilang_converted', '1'),
(7, 'siteidentifier', 'UZgeFVEvGCfpJWlu5e4N9gQzJ0ec8thxlocalhost'),
(8, 'backup_version', '2008111700'),
(9, 'backup_release', '2.0 dev'),
(10, 'mnet_dispatcher_mode', 'off'),
(11, 'sessiontimeout', '7200'),
(12, 'stringfilters', ''),
(13, 'filterall', '0'),
(14, 'texteditors', 'atto,tinymce,textarea'),
(15, 'antiviruses', ''),
(16, 'media_plugins_sortorder', 'videojs,youtube,swf'),
(17, 'upgrade_extracreditweightsstepignored', '1'),
(18, 'upgrade_calculatedgradeitemsignored', '1'),
(19, 'upgrade_letterboundarycourses', '1'),
(20, 'mnet_localhost_id', '1'),
(21, 'mnet_all_hosts_id', '2'),
(22, 'siteguest', '1'),
(23, 'siteadmins', '2'),
(24, 'themerev', '1524852836'),
(25, 'jsrev', '1524852836'),
(26, 'gdversion', '2'),
(27, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(28, 'version', '2017111302'),
(29, 'enableoutcomes', '0'),
(30, 'usecomments', '1'),
(31, 'usetags', '1'),
(32, 'enablenotes', '1'),
(33, 'enableportfolios', '0'),
(34, 'enablewebservices', '0'),
(35, 'messaging', '1'),
(36, 'messaginghidereadnotifications', '0'),
(37, 'messagingdeletereadnotificationsdelay', '604800'),
(38, 'messagingallowemailoverride', '0'),
(39, 'enablestats', '0'),
(40, 'enablerssfeeds', '0'),
(41, 'enableblogs', '1'),
(42, 'enablecompletion', '1'),
(43, 'completiondefault', '1'),
(44, 'enableavailability', '1'),
(45, 'enableplagiarism', '0'),
(46, 'enablebadges', '1'),
(47, 'enableglobalsearch', '0'),
(48, 'allowstealth', '0'),
(49, 'defaultpreference_maildisplay', '2'),
(50, 'defaultpreference_mailformat', '1'),
(51, 'defaultpreference_maildigest', '0'),
(52, 'defaultpreference_autosubscribe', '1'),
(53, 'defaultpreference_trackforums', '0'),
(54, 'autologinguests', '0'),
(55, 'hiddenuserfields', ''),
(56, 'showuseridentity', 'email'),
(57, 'fullnamedisplay', 'language'),
(58, 'alternativefullnameformat', 'language'),
(59, 'maxusersperpage', '100'),
(60, 'enablegravatar', '0'),
(61, 'gravatardefaulturl', 'mm'),
(62, 'enablecourserequests', '0'),
(63, 'defaultrequestcategory', '1'),
(64, 'requestcategoryselection', '0'),
(65, 'courserequestnotify', ''),
(66, 'grade_profilereport', 'user'),
(67, 'grade_aggregationposition', '1'),
(68, 'grade_includescalesinaggregation', '1'),
(69, 'grade_hiddenasdate', '0'),
(70, 'gradepublishing', '0'),
(71, 'grade_export_displaytype', '1'),
(72, 'grade_export_decimalpoints', '2'),
(73, 'grade_navmethod', '1'),
(74, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(75, 'grade_export_customprofilefields', ''),
(76, 'recovergradesdefault', '0'),
(77, 'gradeexport', ''),
(78, 'unlimitedgrades', '0'),
(79, 'grade_report_showmin', '1'),
(80, 'gradepointmax', '100'),
(81, 'gradepointdefault', '100'),
(82, 'grade_minmaxtouse', '1'),
(83, 'grade_mygrades_report', 'overview'),
(84, 'gradereport_mygradeurl', ''),
(85, 'grade_hideforcedsettings', '1'),
(86, 'grade_aggregation', '13'),
(87, 'grade_aggregation_flag', '0'),
(88, 'grade_aggregations_visible', '13'),
(89, 'grade_aggregateonlygraded', '1'),
(90, 'grade_aggregateonlygraded_flag', '2'),
(91, 'grade_aggregateoutcomes', '0'),
(92, 'grade_aggregateoutcomes_flag', '2'),
(93, 'grade_keephigh', '0'),
(94, 'grade_keephigh_flag', '3'),
(95, 'grade_droplow', '0'),
(96, 'grade_droplow_flag', '2'),
(97, 'grade_overridecat', '1'),
(98, 'grade_displaytype', '1'),
(99, 'grade_decimalpoints', '2'),
(100, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(101, 'grade_report_studentsperpage', '100'),
(102, 'grade_report_showonlyactiveenrol', '1'),
(103, 'grade_report_quickgrading', '1'),
(104, 'grade_report_showquickfeedback', '0'),
(105, 'grade_report_meanselection', '1'),
(106, 'grade_report_enableajax', '0'),
(107, 'grade_report_showcalculations', '1'),
(108, 'grade_report_showeyecons', '0'),
(109, 'grade_report_showaverages', '1'),
(110, 'grade_report_showlocks', '0'),
(111, 'grade_report_showranges', '0'),
(112, 'grade_report_showanalysisicon', '1'),
(113, 'grade_report_showuserimage', '1'),
(114, 'grade_report_showactivityicons', '1'),
(115, 'grade_report_shownumberofgrades', '0'),
(116, 'grade_report_averagesdisplaytype', 'inherit'),
(117, 'grade_report_rangesdisplaytype', 'inherit'),
(118, 'grade_report_averagesdecimalpoints', 'inherit'),
(119, 'grade_report_rangesdecimalpoints', 'inherit'),
(120, 'grade_report_historyperpage', '50'),
(121, 'grade_report_overview_showrank', '0'),
(122, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(123, 'grade_report_user_showrank', '0'),
(124, 'grade_report_user_showpercentage', '1'),
(125, 'grade_report_user_showgrade', '1'),
(126, 'grade_report_user_showfeedback', '1'),
(127, 'grade_report_user_showrange', '1'),
(128, 'grade_report_user_showweight', '1'),
(129, 'grade_report_user_showaverage', '0'),
(130, 'grade_report_user_showlettergrade', '0'),
(131, 'grade_report_user_rangedecimals', '0'),
(132, 'grade_report_user_showhiddenitems', '1'),
(133, 'grade_report_user_showtotalsifcontainhidden', '0'),
(134, 'grade_report_user_showcontributiontocoursetotal', '1'),
(135, 'badges_defaultissuername', ''),
(136, 'badges_defaultissuercontact', ''),
(137, 'badges_badgesalt', 'badges1524839710'),
(138, 'badges_allowexternalbackpack', '1'),
(139, 'badges_allowcoursebadges', '1'),
(141, 'forcetimezone', '99'),
(142, 'country', '0'),
(143, 'defaultcity', ''),
(144, 'geoip2file', '/var/www/data/geoip/GeoLite2-City.mmdb'),
(145, 'googlemapkey3', ''),
(146, 'allcountrycodes', ''),
(147, 'autolang', '1'),
(148, 'lang', 'en'),
(149, 'langmenu', '1'),
(150, 'langlist', ''),
(151, 'langrev', '1524852836'),
(152, 'langcache', '1'),
(153, 'langstringcache', '1'),
(154, 'locale', ''),
(155, 'latinexcelexport', '0'),
(156, 'requiremodintro', '0'),
(158, 'authloginviaemail', '0'),
(159, 'allowaccountssameemail', '0'),
(160, 'authpreventaccountcreation', '0'),
(161, 'loginpageautofocus', '0'),
(162, 'guestloginbutton', '1'),
(163, 'limitconcurrentlogins', '0'),
(164, 'alternateloginurl', ''),
(165, 'forgottenpasswordurl', ''),
(166, 'auth_instructions', ''),
(167, 'allowemailaddresses', ''),
(168, 'denyemailaddresses', ''),
(169, 'verifychangedemail', '1'),
(170, 'recaptchapublickey', ''),
(171, 'recaptchaprivatekey', ''),
(172, 'filteruploadedfiles', '0'),
(173, 'filtermatchoneperpage', '0'),
(174, 'filtermatchonepertext', '0'),
(175, 'sitedefaultlicense', 'allrightsreserved'),
(176, 'media_default_width', '400'),
(177, 'media_default_height', '300'),
(178, 'portfolio_moderate_filesize_threshold', '1048576'),
(179, 'portfolio_high_filesize_threshold', '5242880'),
(180, 'portfolio_moderate_db_threshold', '20'),
(181, 'portfolio_high_db_threshold', '50'),
(182, 'repositorycacheexpire', '120'),
(183, 'repositorygetfiletimeout', '30'),
(184, 'repositorysyncfiletimeout', '1'),
(185, 'repositorysyncimagetimeout', '3'),
(186, 'repositoryallowexternallinks', '1'),
(187, 'legacyfilesinnewcourses', '0'),
(188, 'legacyfilesaddallowed', '1'),
(189, 'searchengine', 'solr'),
(190, 'searchindexwhendisabled', '0'),
(191, 'searchindextime', '600'),
(192, 'searchallavailablecourses', '0'),
(193, 'enablewsdocumentation', '0'),
(194, 'agedigitalconsentverification', '0'),
(195, 'agedigitalconsentmap', '*, 16\nAT, 14\nCZ, 13\nDE, 14\nDK, 13\nES, 13\nFI, 15\nGB, 13\nHU, 14\nIE, 13\nLT, 16\nLU, 16\nNL, 16\nPL, 13\nSE, 13'),
(196, 'sitepolicy', ''),
(197, 'sitepolicyguest', ''),
(198, 'allowbeforeblock', '0'),
(199, 'allowedip', ''),
(200, 'blockedip', ''),
(201, 'protectusernames', '1'),
(202, 'forcelogin', '0'),
(203, 'forceloginforprofiles', '1'),
(204, 'forceloginforprofileimage', '0'),
(205, 'opentogoogle', '0'),
(206, 'allowindexing', '0'),
(207, 'maxbytes', '0'),
(208, 'userquota', '104857600'),
(209, 'allowobjectembed', '0'),
(210, 'enabletrusttext', '0'),
(211, 'maxeditingtime', '1800'),
(212, 'extendedusernamechars', '0'),
(213, 'keeptagnamecase', '1'),
(214, 'profilesforenrolledusersonly', '1'),
(215, 'cronclionly', '1'),
(216, 'cronremotepassword', ''),
(217, 'lockoutthreshold', '0'),
(218, 'lockoutwindow', '1800'),
(219, 'lockoutduration', '1800'),
(220, 'passwordpolicy', '1'),
(221, 'minpasswordlength', '8'),
(222, 'minpassworddigits', '1'),
(223, 'minpasswordlower', '1'),
(224, 'minpasswordupper', '1'),
(225, 'minpasswordnonalphanum', '1'),
(226, 'maxconsecutiveidentchars', '0'),
(227, 'passwordreuselimit', '0'),
(228, 'pwresettime', '1800'),
(229, 'passwordchangelogout', '0'),
(230, 'passwordchangetokendeletion', '0'),
(231, 'tokenduration', '7257600'),
(232, 'groupenrolmentkeypolicy', '1'),
(233, 'disableuserimages', '0'),
(234, 'emailchangeconfirmation', '1'),
(235, 'rememberusername', '2'),
(236, 'strictformsrequired', '0'),
(237, 'cookiesecure', '1'),
(238, 'cookiehttponly', '0'),
(239, 'allowframembedding', '0'),
(240, 'curlsecurityblockedhosts', ''),
(241, 'curlsecurityallowedport', ''),
(242, 'displayloginfailures', '0'),
(243, 'notifyloginfailures', ''),
(244, 'notifyloginthreshold', '10'),
(245, 'themelist', ''),
(246, 'themedesignermode', '0'),
(247, 'allowuserthemes', '0'),
(248, 'allowcoursethemes', '0'),
(249, 'allowcategorythemes', '0'),
(250, 'allowthemechangeonurl', '0'),
(251, 'allowuserblockhiding', '1'),
(252, 'allowblockstodock', '1'),
(253, 'custommenuitems', ''),
(254, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),
(255, 'enabledevicedetection', '1'),
(256, 'devicedetectregex', '[]'),
(257, 'calendartype', 'gregorian'),
(258, 'calendar_adminseesall', '0'),
(259, 'calendar_site_timeformat', '0'),
(260, 'calendar_startwday', '1'),
(261, 'calendar_weekend', '65'),
(262, 'calendar_lookahead', '21'),
(263, 'calendar_maxevents', '10'),
(264, 'enablecalendarexport', '1'),
(265, 'calendar_customexport', '1'),
(266, 'calendar_exportlookahead', '365'),
(267, 'calendar_exportlookback', '5'),
(268, 'calendar_exportsalt', 'xM2DiwezZfgggdeRZuZsjwZ8eYgDZXY5JJ4rx5HPMdWv74Lp1yV4yo8vPTzk'),
(269, 'calendar_showicalsource', '1'),
(270, 'useblogassociations', '1'),
(271, 'bloglevel', '4'),
(272, 'useexternalblogs', '1'),
(273, 'externalblogcrontime', '86400'),
(274, 'maxexternalblogsperuser', '1'),
(275, 'blogusecomments', '1'),
(276, 'blogshowcommentscount', '1'),
(277, 'defaulthomepage', '1'),
(278, 'allowguestmymoodle', '1'),
(279, 'navshowfullcoursenames', '0'),
(280, 'navshowcategories', '1'),
(281, 'navshowmycoursecategories', '0'),
(282, 'navshowallcourses', '0'),
(283, 'navsortmycoursessort', 'sortorder'),
(284, 'navcourselimit', '10'),
(285, 'usesitenameforsitepages', '0'),
(286, 'linkadmincategories', '1'),
(287, 'linkcoursesections', '1'),
(288, 'navshowfrontpagemods', '1'),
(289, 'navadduserpostslinks', '1'),
(290, 'formatstringstriptags', '1'),
(291, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(292, 'docroot', 'http://docs.moodle.org'),
(293, 'doclang', ''),
(294, 'doctonewwindow', '0'),
(295, 'courselistshortnames', '0'),
(296, 'coursesperpage', '20'),
(297, 'courseswithsummarieslimit', '10'),
(298, 'courseoverviewfileslimit', '1'),
(299, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(300, 'useexternalyui', '0'),
(301, 'yuicomboloading', '1'),
(302, 'cachejs', '1'),
(303, 'modchooserdefault', '1'),
(304, 'additionalhtmlhead', ''),
(305, 'additionalhtmltopofbody', ''),
(306, 'additionalhtmlfooter', ''),
(307, 'pathtodu', ''),
(308, 'aspellpath', ''),
(309, 'pathtodot', ''),
(310, 'pathtogs', '/usr/bin/gs'),
(311, 'pathtopython', ''),
(312, 'supportname', 'Admin User'),
(313, 'supportemail', ''),
(314, 'supportpage', ''),
(315, 'dbsessions', '0'),
(316, 'sessioncookie', ''),
(317, 'sessioncookiepath', ''),
(318, 'sessioncookiedomain', ''),
(319, 'statsfirstrun', 'none'),
(320, 'statsmaxruntime', '0'),
(321, 'statsruntimedays', '31'),
(322, 'statsuserthreshold', '0'),
(323, 'slasharguments', '1'),
(324, 'getremoteaddrconf', '0'),
(325, 'proxyhost', ''),
(326, 'proxyport', '0'),
(327, 'proxytype', 'HTTP'),
(328, 'proxyuser', ''),
(329, 'proxypassword', ''),
(330, 'proxybypass', 'localhost, 127.0.0.1'),
(331, 'maintenance_enabled', '0'),
(332, 'maintenance_message', ''),
(333, 'deleteunconfirmed', '168'),
(334, 'deleteincompleteusers', '0'),
(335, 'disablegradehistory', '0'),
(336, 'gradehistorylifetime', '0'),
(337, 'tempdatafoldercleanup', '168'),
(338, 'extramemorylimit', '512M'),
(339, 'maxtimelimit', '0'),
(340, 'curlcache', '120'),
(341, 'curltimeoutkbitrate', '56'),
(342, 'smtphosts', ''),
(343, 'smtpsecure', ''),
(344, 'smtpauthtype', 'LOGIN'),
(345, 'smtpuser', ''),
(346, 'smtppass', ''),
(347, 'smtpmaxbulk', '1'),
(348, 'allowedemaildomains', ''),
(349, 'sitemailcharset', '0'),
(350, 'allowusermailcharset', '0'),
(351, 'allowattachments', '1'),
(352, 'mailnewline', 'LF'),
(353, 'emailfromvia', '1'),
(354, 'updateautocheck', '1'),
(355, 'updateminmaturity', '200'),
(356, 'updatenotifybuilds', '0'),
(357, 'enablesafebrowserintegration', '0'),
(358, 'dndallowtextandlinks', '0'),
(359, 'debug', '0'),
(360, 'debugdisplay', '0'),
(361, 'debugsmtp', '0'),
(362, 'perfdebug', '7'),
(363, 'debugstringids', '0'),
(364, 'debugvalidators', '0'),
(365, 'debugpageinfo', '0'),
(366, 'profilingenabled', '0'),
(367, 'profilingincluded', ''),
(368, 'profilingexcluded', ''),
(369, 'profilingautofrec', '0'),
(370, 'profilingallowme', '0'),
(371, 'profilingallowall', '0'),
(372, 'profilinglifetime', '1440'),
(373, 'profilingimportprefix', '(I)'),
(374, 'release', '3.4.2 (Build: 20180319)'),
(375, 'branch', '34'),
(376, 'localcachedirpurged', '1524852836'),
(377, 'scheduledtaskreset', '1524852836'),
(378, 'allversionshash', 'e910610e804958651bc8725b6d1dab86be88f070'),
(380, 'registrationpending', '0'),
(381, 'notloggedinroleid', '6'),
(382, 'guestroleid', '6'),
(383, 'defaultuserroleid', '7'),
(384, 'creatornewroleid', '3'),
(385, 'restorernewroleid', '3'),
(386, 'gradebookroles', '5'),
(387, 'chat_method', 'ajax'),
(388, 'chat_refresh_userlist', '10'),
(389, 'chat_old_ping', '35'),
(390, 'chat_refresh_room', '5'),
(391, 'chat_normal_updatemode', 'jsupdate'),
(392, 'chat_serverhost', 'localhost'),
(393, 'chat_serverip', '127.0.0.1'),
(394, 'chat_serverport', '9111'),
(395, 'chat_servermax', '100'),
(396, 'data_enablerssfeeds', '0'),
(397, 'feedback_allowfullanonymous', '0'),
(398, 'forum_displaymode', '3'),
(399, 'forum_shortpost', '300'),
(400, 'forum_longpost', '600'),
(401, 'forum_manydiscussions', '100'),
(402, 'forum_maxbytes', '512000'),
(403, 'forum_maxattachments', '9'),
(404, 'forum_subscription', '0'),
(405, 'forum_trackingtype', '1'),
(406, 'forum_trackreadposts', '1'),
(407, 'forum_allowforcedreadtracking', '0'),
(408, 'forum_oldpostdays', '14'),
(409, 'forum_usermarksread', '0'),
(410, 'forum_cleanreadtime', '2'),
(411, 'digestmailtime', '17'),
(412, 'forum_enablerssfeeds', '0'),
(413, 'forum_enabletimedposts', '1'),
(414, 'glossary_entbypage', '10'),
(415, 'glossary_dupentries', '0'),
(416, 'glossary_allowcomments', '0'),
(417, 'glossary_linkbydefault', '1'),
(418, 'glossary_defaultapproval', '1'),
(419, 'glossary_enablerssfeeds', '0'),
(420, 'glossary_linkentries', '0'),
(421, 'glossary_casesensitive', '0'),
(422, 'glossary_fullmatch', '0'),
(423, 'block_course_list_adminview', 'all'),
(424, 'block_course_list_hideallcourseslink', '0'),
(425, 'block_html_allowcssclasses', '0'),
(426, 'block_online_users_timetosee', '5'),
(427, 'block_rss_client_num_entries', '5'),
(428, 'block_rss_client_timeout', '30'),
(429, 'pathtounoconv', '/usr/bin/unoconv'),
(430, 'filter_multilang_force_old', '0'),
(431, 'filter_censor_badwords', ''),
(432, 'logguests', '1'),
(433, 'loglifetime', '0'),
(434, 'jabberhost', ''),
(435, 'jabberserver', ''),
(436, 'jabberusername', ''),
(437, 'jabberpassword', ''),
(438, 'jabberport', '5222'),
(439, 'airnotifierurl', 'https://messages.moodle.net'),
(440, 'airnotifierport', '443'),
(441, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
(442, 'airnotifierappname', 'commoodlemoodlemobile'),
(443, 'airnotifieraccesskey', ''),
(444, 'sitepolicyhandler', ''),
(445, 'profileroles', '5,4,3'),
(446, 'coursecontact', '3'),
(447, 'frontpage', '6'),
(448, 'frontpageloggedin', '6'),
(449, 'maxcategorydepth', '2'),
(450, 'frontpagecourselimit', '200'),
(451, 'commentsperpage', '15'),
(452, 'defaultfrontpageroleid', '8'),
(453, 'messageinbound_enabled', '0'),
(454, 'messageinbound_mailbox', ''),
(455, 'messageinbound_domain', ''),
(456, 'messageinbound_host', ''),
(457, 'messageinbound_hostssl', 'ssl'),
(458, 'messageinbound_hostuser', ''),
(459, 'messageinbound_hostpass', ''),
(460, 'enablemobilewebservice', '0'),
(461, 'timezone', 'America/Guatemala'),
(462, 'registerauth', ''),
(463, 'noreplyaddress', 'codificandoideas@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Changes done in server configuration through admin UI' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1524839719, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1524839719, NULL, 'usecomments', '1', NULL),
(3, 0, 1524839719, NULL, 'usetags', '1', NULL),
(4, 0, 1524839719, NULL, 'enablenotes', '1', NULL),
(5, 0, 1524839719, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1524839719, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1524839719, NULL, 'messaging', '1', NULL),
(8, 0, 1524839719, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1524839719, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1524839719, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1524839719, NULL, 'enablestats', '0', NULL),
(12, 0, 1524839719, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1524839719, NULL, 'enableblogs', '1', NULL),
(14, 0, 1524839719, NULL, 'enablecompletion', '1', NULL),
(15, 0, 1524839719, NULL, 'completiondefault', '1', NULL),
(16, 0, 1524839720, NULL, 'enableavailability', '1', NULL),
(17, 0, 1524839720, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1524839720, NULL, 'enablebadges', '1', NULL),
(19, 0, 1524839720, NULL, 'enableglobalsearch', '0', NULL),
(20, 0, 1524839720, NULL, 'allowstealth', '0', NULL),
(21, 0, 1524839720, NULL, 'defaultpreference_maildisplay', '2', NULL),
(22, 0, 1524839720, NULL, 'defaultpreference_mailformat', '1', NULL),
(23, 0, 1524839720, NULL, 'defaultpreference_maildigest', '0', NULL),
(24, 0, 1524839720, NULL, 'defaultpreference_autosubscribe', '1', NULL),
(25, 0, 1524839720, NULL, 'defaultpreference_trackforums', '0', NULL),
(26, 0, 1524839720, NULL, 'autologinguests', '0', NULL),
(27, 0, 1524839720, NULL, 'hiddenuserfields', '', NULL),
(28, 0, 1524839720, NULL, 'showuseridentity', 'email', NULL),
(29, 0, 1524839720, NULL, 'fullnamedisplay', 'language', NULL),
(30, 0, 1524839720, NULL, 'alternativefullnameformat', 'language', NULL),
(31, 0, 1524839720, NULL, 'maxusersperpage', '100', NULL),
(32, 0, 1524839720, NULL, 'enablegravatar', '0', NULL),
(33, 0, 1524839720, NULL, 'gravatardefaulturl', 'mm', NULL),
(34, 0, 1524839720, 'moodlecourse', 'visible', '1', NULL),
(35, 0, 1524839720, 'moodlecourse', 'format', 'topics', NULL),
(36, 0, 1524839720, 'moodlecourse', 'maxsections', '52', NULL),
(37, 0, 1524839720, 'moodlecourse', 'numsections', '4', NULL),
(38, 0, 1524839720, 'moodlecourse', 'hiddensections', '0', NULL),
(39, 0, 1524839720, 'moodlecourse', 'coursedisplay', '0', NULL),
(40, 0, 1524839720, 'moodlecourse', 'courseenddateenabled', '1', NULL),
(41, 0, 1524839720, 'moodlecourse', 'courseduration', '31536000', NULL),
(42, 0, 1524839720, 'moodlecourse', 'lang', '', NULL),
(43, 0, 1524839720, 'moodlecourse', 'newsitems', '5', NULL),
(44, 0, 1524839720, 'moodlecourse', 'showgrades', '1', NULL),
(45, 0, 1524839720, 'moodlecourse', 'showreports', '0', NULL),
(46, 0, 1524839720, 'moodlecourse', 'maxbytes', '0', NULL),
(47, 0, 1524839720, 'moodlecourse', 'enablecompletion', '1', NULL),
(48, 0, 1524839720, 'moodlecourse', 'groupmode', '0', NULL),
(49, 0, 1524839720, 'moodlecourse', 'groupmodeforce', '0', NULL),
(50, 0, 1524839720, NULL, 'enablecourserequests', '0', NULL),
(51, 0, 1524839720, NULL, 'defaultrequestcategory', '1', NULL),
(52, 0, 1524839720, NULL, 'requestcategoryselection', '0', NULL),
(53, 0, 1524839720, NULL, 'courserequestnotify', '', NULL),
(54, 0, 1524839720, 'backup', 'loglifetime', '30', NULL),
(55, 0, 1524839720, 'backup', 'backup_general_users', '1', NULL),
(56, 0, 1524839720, 'backup', 'backup_general_users_locked', '', NULL),
(57, 0, 1524839720, 'backup', 'backup_general_anonymize', '0', NULL),
(58, 0, 1524839720, 'backup', 'backup_general_anonymize_locked', '', NULL),
(59, 0, 1524839720, 'backup', 'backup_general_role_assignments', '1', NULL),
(60, 0, 1524839720, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(61, 0, 1524839720, 'backup', 'backup_general_activities', '1', NULL),
(62, 0, 1524839720, 'backup', 'backup_general_activities_locked', '', NULL),
(63, 0, 1524839720, 'backup', 'backup_general_blocks', '1', NULL),
(64, 0, 1524839720, 'backup', 'backup_general_blocks_locked', '', NULL),
(65, 0, 1524839720, 'backup', 'backup_general_filters', '1', NULL),
(66, 0, 1524839720, 'backup', 'backup_general_filters_locked', '', NULL),
(67, 0, 1524839720, 'backup', 'backup_general_comments', '1', NULL),
(68, 0, 1524839720, 'backup', 'backup_general_comments_locked', '', NULL),
(69, 0, 1524839720, 'backup', 'backup_general_badges', '1', NULL),
(70, 0, 1524839720, 'backup', 'backup_general_badges_locked', '', NULL),
(71, 0, 1524839720, 'backup', 'backup_general_calendarevents', '1', NULL),
(72, 0, 1524839720, 'backup', 'backup_general_calendarevents_locked', '', NULL),
(73, 0, 1524839720, 'backup', 'backup_general_userscompletion', '1', NULL),
(74, 0, 1524839720, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(75, 0, 1524839720, 'backup', 'backup_general_logs', '0', NULL),
(76, 0, 1524839720, 'backup', 'backup_general_logs_locked', '', NULL),
(77, 0, 1524839720, 'backup', 'backup_general_histories', '0', NULL),
(78, 0, 1524839720, 'backup', 'backup_general_histories_locked', '', NULL),
(79, 0, 1524839720, 'backup', 'backup_general_questionbank', '1', NULL),
(80, 0, 1524839720, 'backup', 'backup_general_questionbank_locked', '', NULL),
(81, 0, 1524839720, 'backup', 'backup_general_groups', '1', NULL),
(82, 0, 1524839721, 'backup', 'backup_general_groups_locked', '', NULL),
(83, 0, 1524839721, 'backup', 'backup_general_competencies', '1', NULL),
(84, 0, 1524839721, 'backup', 'backup_general_competencies_locked', '', NULL),
(85, 0, 1524839721, 'backup', 'import_general_maxresults', '10', NULL),
(86, 0, 1524839721, 'backup', 'import_general_duplicate_admin_allowed', '0', NULL),
(87, 0, 1524839721, 'backup', 'backup_import_activities', '1', NULL),
(88, 0, 1524839721, 'backup', 'backup_import_activities_locked', '', NULL),
(89, 0, 1524839721, 'backup', 'backup_import_blocks', '1', NULL),
(90, 0, 1524839721, 'backup', 'backup_import_blocks_locked', '', NULL),
(91, 0, 1524839721, 'backup', 'backup_import_filters', '1', NULL),
(92, 0, 1524839721, 'backup', 'backup_import_filters_locked', '', NULL),
(93, 0, 1524839721, 'backup', 'backup_import_calendarevents', '1', NULL),
(94, 0, 1524839721, 'backup', 'backup_import_calendarevents_locked', '', NULL),
(95, 0, 1524839721, 'backup', 'backup_import_questionbank', '1', NULL),
(96, 0, 1524839721, 'backup', 'backup_import_questionbank_locked', '', NULL),
(97, 0, 1524839721, 'backup', 'backup_import_groups', '1', NULL),
(98, 0, 1524839721, 'backup', 'backup_import_groups_locked', '', NULL),
(99, 0, 1524839721, 'backup', 'backup_import_competencies', '1', NULL),
(100, 0, 1524839721, 'backup', 'backup_import_competencies_locked', '', NULL),
(101, 0, 1524839721, 'backup', 'backup_auto_active', '0', NULL),
(102, 0, 1524839721, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(103, 0, 1524839721, 'backup', 'backup_auto_hour', '0', NULL),
(104, 0, 1524839721, 'backup', 'backup_auto_minute', '0', NULL),
(105, 0, 1524839721, 'backup', 'backup_auto_storage', '0', NULL),
(106, 0, 1524839721, 'backup', 'backup_auto_destination', '', NULL),
(107, 0, 1524839721, 'backup', 'backup_auto_max_kept', '1', NULL),
(108, 0, 1524839721, 'backup', 'backup_auto_delete_days', '0', NULL),
(109, 0, 1524839721, 'backup', 'backup_auto_min_kept', '0', NULL),
(110, 0, 1524839721, 'backup', 'backup_shortname', '0', NULL),
(111, 0, 1524839721, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(112, 0, 1524839721, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(113, 0, 1524839721, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(114, 0, 1524839721, 'backup', 'backup_auto_users', '1', NULL),
(115, 0, 1524839721, 'backup', 'backup_auto_role_assignments', '1', NULL),
(116, 0, 1524839721, 'backup', 'backup_auto_activities', '1', NULL),
(117, 0, 1524839721, 'backup', 'backup_auto_blocks', '1', NULL),
(118, 0, 1524839721, 'backup', 'backup_auto_filters', '1', NULL),
(119, 0, 1524839721, 'backup', 'backup_auto_comments', '1', NULL),
(120, 0, 1524839721, 'backup', 'backup_auto_badges', '1', NULL),
(121, 0, 1524839721, 'backup', 'backup_auto_calendarevents', '1', NULL),
(122, 0, 1524839721, 'backup', 'backup_auto_userscompletion', '1', NULL),
(123, 0, 1524839721, 'backup', 'backup_auto_logs', '0', NULL),
(124, 0, 1524839721, 'backup', 'backup_auto_histories', '0', NULL),
(125, 0, 1524839721, 'backup', 'backup_auto_questionbank', '1', NULL),
(126, 0, 1524839721, 'backup', 'backup_auto_groups', '1', NULL),
(127, 0, 1524839721, 'backup', 'backup_auto_competencies', '1', NULL),
(128, 0, 1524839721, 'restore', 'restore_general_users', '1', NULL),
(129, 0, 1524839721, 'restore', 'restore_general_users_locked', '', NULL),
(130, 0, 1524839721, 'restore', 'restore_general_enrolments', '1', NULL),
(131, 0, 1524839721, 'restore', 'restore_general_enrolments_locked', '', NULL),
(132, 0, 1524839721, 'restore', 'restore_general_role_assignments', '1', NULL),
(133, 0, 1524839721, 'restore', 'restore_general_role_assignments_locked', '', NULL),
(134, 0, 1524839721, 'restore', 'restore_general_activities', '1', NULL),
(135, 0, 1524839721, 'restore', 'restore_general_activities_locked', '', NULL),
(136, 0, 1524839721, 'restore', 'restore_general_blocks', '1', NULL),
(137, 0, 1524839721, 'restore', 'restore_general_blocks_locked', '', NULL),
(138, 0, 1524839721, 'restore', 'restore_general_filters', '1', NULL),
(139, 0, 1524839721, 'restore', 'restore_general_filters_locked', '', NULL),
(140, 0, 1524839721, 'restore', 'restore_general_comments', '1', NULL),
(141, 0, 1524839721, 'restore', 'restore_general_comments_locked', '', NULL),
(142, 0, 1524839721, 'restore', 'restore_general_badges', '1', NULL),
(143, 0, 1524839721, 'restore', 'restore_general_badges_locked', '', NULL),
(144, 0, 1524839721, 'restore', 'restore_general_calendarevents', '1', NULL),
(145, 0, 1524839721, 'restore', 'restore_general_calendarevents_locked', '', NULL),
(146, 0, 1524839721, 'restore', 'restore_general_userscompletion', '1', NULL),
(147, 0, 1524839721, 'restore', 'restore_general_userscompletion_locked', '', NULL),
(148, 0, 1524839721, 'restore', 'restore_general_logs', '1', NULL),
(149, 0, 1524839721, 'restore', 'restore_general_logs_locked', '', NULL),
(150, 0, 1524839722, 'restore', 'restore_general_histories', '1', NULL),
(151, 0, 1524839722, 'restore', 'restore_general_histories_locked', '', NULL),
(152, 0, 1524839722, 'restore', 'restore_general_groups', '1', NULL),
(153, 0, 1524839722, 'restore', 'restore_general_groups_locked', '', NULL),
(154, 0, 1524839722, 'restore', 'restore_general_competencies', '1', NULL),
(155, 0, 1524839722, 'restore', 'restore_general_competencies_locked', '', NULL),
(156, 0, 1524839722, 'restore', 'restore_merge_overwrite_conf', '0', NULL),
(157, 0, 1524839722, 'restore', 'restore_merge_overwrite_conf_locked', '', NULL),
(158, 0, 1524839722, 'restore', 'restore_merge_course_fullname', '1', NULL),
(159, 0, 1524839722, 'restore', 'restore_merge_course_fullname_locked', '', NULL),
(160, 0, 1524839722, 'restore', 'restore_merge_course_shortname', '1', NULL),
(161, 0, 1524839722, 'restore', 'restore_merge_course_shortname_locked', '', NULL),
(162, 0, 1524839722, 'restore', 'restore_merge_course_startdate', '1', NULL),
(163, 0, 1524839722, 'restore', 'restore_merge_course_startdate_locked', '', NULL),
(164, 0, 1524839722, 'restore', 'restore_replace_overwrite_conf', '0', NULL),
(165, 0, 1524839722, 'restore', 'restore_replace_overwrite_conf_locked', '', NULL),
(166, 0, 1524839722, 'restore', 'restore_replace_course_fullname', '1', NULL),
(167, 0, 1524839722, 'restore', 'restore_replace_course_fullname_locked', '', NULL),
(168, 0, 1524839722, 'restore', 'restore_replace_course_shortname', '1', NULL),
(169, 0, 1524839722, 'restore', 'restore_replace_course_shortname_locked', '', NULL),
(170, 0, 1524839722, 'restore', 'restore_replace_course_startdate', '1', NULL),
(171, 0, 1524839722, 'restore', 'restore_replace_course_startdate_locked', '', NULL),
(172, 0, 1524839722, 'restore', 'restore_replace_keep_roles_and_enrolments', '0', NULL),
(173, 0, 1524839722, 'restore', 'restore_replace_keep_roles_and_enrolments_locked', '', NULL),
(174, 0, 1524839722, 'restore', 'restore_replace_keep_groups_and_groupings', '0', NULL),
(175, 0, 1524839722, 'restore', 'restore_replace_keep_groups_and_groupings_locked', '', NULL),
(176, 0, 1524839722, NULL, 'grade_profilereport', 'user', NULL),
(177, 0, 1524839722, NULL, 'grade_aggregationposition', '1', NULL),
(178, 0, 1524839722, NULL, 'grade_includescalesinaggregation', '1', NULL),
(179, 0, 1524839722, NULL, 'grade_hiddenasdate', '0', NULL),
(180, 0, 1524839722, NULL, 'gradepublishing', '0', NULL),
(181, 0, 1524839722, NULL, 'grade_export_displaytype', '1', NULL),
(182, 0, 1524839722, NULL, 'grade_export_decimalpoints', '2', NULL),
(183, 0, 1524839722, NULL, 'grade_navmethod', '1', NULL),
(184, 0, 1524839722, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(185, 0, 1524839722, NULL, 'grade_export_customprofilefields', '', NULL),
(186, 0, 1524839722, NULL, 'recovergradesdefault', '0', NULL),
(187, 0, 1524839722, NULL, 'gradeexport', '', NULL),
(188, 0, 1524839722, NULL, 'unlimitedgrades', '0', NULL),
(189, 0, 1524839722, NULL, 'grade_report_showmin', '1', NULL),
(190, 0, 1524839722, NULL, 'gradepointmax', '100', NULL),
(191, 0, 1524839722, NULL, 'gradepointdefault', '100', NULL),
(192, 0, 1524839722, NULL, 'grade_minmaxtouse', '1', NULL),
(193, 0, 1524839722, NULL, 'grade_mygrades_report', 'overview', NULL),
(194, 0, 1524839722, NULL, 'gradereport_mygradeurl', '', NULL),
(195, 0, 1524839722, NULL, 'grade_hideforcedsettings', '1', NULL),
(196, 0, 1524839722, NULL, 'grade_aggregation', '13', NULL),
(197, 0, 1524839722, NULL, 'grade_aggregation_flag', '0', NULL),
(198, 0, 1524839722, NULL, 'grade_aggregations_visible', '13', NULL),
(199, 0, 1524839722, NULL, 'grade_aggregateonlygraded', '1', NULL),
(200, 0, 1524839722, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(201, 0, 1524839722, NULL, 'grade_aggregateoutcomes', '0', NULL),
(202, 0, 1524839722, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(203, 0, 1524839722, NULL, 'grade_keephigh', '0', NULL),
(204, 0, 1524839722, NULL, 'grade_keephigh_flag', '3', NULL),
(205, 0, 1524839722, NULL, 'grade_droplow', '0', NULL),
(206, 0, 1524839722, NULL, 'grade_droplow_flag', '2', NULL),
(207, 0, 1524839722, NULL, 'grade_overridecat', '1', NULL),
(208, 0, 1524839722, NULL, 'grade_displaytype', '1', NULL),
(209, 0, 1524839722, NULL, 'grade_decimalpoints', '2', NULL),
(210, 0, 1524839722, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(211, 0, 1524839722, NULL, 'grade_report_studentsperpage', '100', NULL),
(212, 0, 1524839722, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(213, 0, 1524839722, NULL, 'grade_report_quickgrading', '1', NULL),
(214, 0, 1524839722, NULL, 'grade_report_showquickfeedback', '0', NULL),
(215, 0, 1524839722, NULL, 'grade_report_meanselection', '1', NULL),
(216, 0, 1524839723, NULL, 'grade_report_enableajax', '0', NULL),
(217, 0, 1524839723, NULL, 'grade_report_showcalculations', '1', NULL),
(218, 0, 1524839723, NULL, 'grade_report_showeyecons', '0', NULL),
(219, 0, 1524839723, NULL, 'grade_report_showaverages', '1', NULL),
(220, 0, 1524839723, NULL, 'grade_report_showlocks', '0', NULL),
(221, 0, 1524839723, NULL, 'grade_report_showranges', '0', NULL),
(222, 0, 1524839723, NULL, 'grade_report_showanalysisicon', '1', NULL),
(223, 0, 1524839723, NULL, 'grade_report_showuserimage', '1', NULL),
(224, 0, 1524839723, NULL, 'grade_report_showactivityicons', '1', NULL),
(225, 0, 1524839723, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(226, 0, 1524839723, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(227, 0, 1524839723, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(228, 0, 1524839723, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(229, 0, 1524839723, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(230, 0, 1524839723, NULL, 'grade_report_historyperpage', '50', NULL),
(231, 0, 1524839723, NULL, 'grade_report_overview_showrank', '0', NULL),
(232, 0, 1524839723, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(233, 0, 1524839723, NULL, 'grade_report_user_showrank', '0', NULL),
(234, 0, 1524839723, NULL, 'grade_report_user_showpercentage', '1', NULL),
(235, 0, 1524839723, NULL, 'grade_report_user_showgrade', '1', NULL),
(236, 0, 1524839723, NULL, 'grade_report_user_showfeedback', '1', NULL),
(237, 0, 1524839723, NULL, 'grade_report_user_showrange', '1', NULL),
(238, 0, 1524839723, NULL, 'grade_report_user_showweight', '1', NULL),
(239, 0, 1524839723, NULL, 'grade_report_user_showaverage', '0', NULL),
(240, 0, 1524839723, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(241, 0, 1524839723, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(242, 0, 1524839723, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(243, 0, 1524839723, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(244, 0, 1524839723, NULL, 'grade_report_user_showcontributiontocoursetotal', '1', NULL),
(245, 0, 1524839723, 'analytics', 'predictionsprocessor', '\\mlbackend_php\\processor', NULL),
(246, 0, 1524839723, 'analytics', 'timesplittings', '\\core\\analytics\\time_splitting\\quarters_accum,\\core\\analytics\\time_splitting\\quarters,\\core\\analytics\\time_splitting\\single_range', NULL),
(247, 0, 1524839723, 'analytics', 'modeloutputdir', '/var/www/data/models', NULL),
(248, 0, 1524839723, 'analytics', 'onlycli', '1', NULL),
(249, 0, 1524839723, 'analytics', 'modeltimelimit', '1200', NULL),
(250, 0, 1524839723, 'core_competency', 'enabled', '1', NULL),
(251, 0, 1524839723, 'core_competency', 'pushcourseratingstouserplans', '1', NULL),
(252, 0, 1524839723, NULL, 'badges_defaultissuername', '', NULL),
(253, 0, 1524839723, NULL, 'badges_defaultissuercontact', '', NULL),
(254, 0, 1524839723, NULL, 'badges_badgesalt', 'badges1524839710', NULL),
(255, 0, 1524839723, NULL, 'badges_allowexternalbackpack', '1', NULL),
(256, 0, 1524839723, NULL, 'badges_allowcoursebadges', '1', NULL),
(257, 0, 1524839723, NULL, 'timezone', 'America/Chicago', NULL),
(258, 0, 1524839724, NULL, 'forcetimezone', '99', NULL),
(259, 0, 1524839724, NULL, 'country', '0', NULL),
(260, 0, 1524839724, NULL, 'defaultcity', '', NULL),
(261, 0, 1524839724, NULL, 'geoip2file', '/var/www/data/geoip/GeoLite2-City.mmdb', NULL),
(262, 0, 1524839724, NULL, 'googlemapkey3', '', NULL),
(263, 0, 1524839724, NULL, 'allcountrycodes', '', NULL),
(264, 0, 1524839724, NULL, 'autolang', '1', NULL),
(265, 0, 1524839724, NULL, 'lang', 'en', NULL),
(266, 0, 1524839724, NULL, 'langmenu', '1', NULL),
(267, 0, 1524839724, NULL, 'langlist', '', NULL),
(268, 0, 1524839724, NULL, 'langcache', '1', NULL),
(269, 0, 1524839724, NULL, 'langstringcache', '1', NULL),
(270, 0, 1524839724, NULL, 'locale', '', NULL),
(271, 0, 1524839724, NULL, 'latinexcelexport', '0', NULL),
(272, 0, 1524839724, NULL, 'requiremodintro', '0', NULL),
(273, 0, 1524839724, NULL, 'registerauth', '', NULL),
(274, 0, 1524839724, NULL, 'authloginviaemail', '0', NULL),
(275, 0, 1524839724, NULL, 'allowaccountssameemail', '0', NULL),
(276, 0, 1524839724, NULL, 'authpreventaccountcreation', '0', NULL),
(277, 0, 1524839724, NULL, 'loginpageautofocus', '0', NULL),
(278, 0, 1524839724, NULL, 'guestloginbutton', '1', NULL),
(279, 0, 1524839724, NULL, 'limitconcurrentlogins', '0', NULL),
(280, 0, 1524839724, NULL, 'alternateloginurl', '', NULL),
(281, 0, 1524839724, NULL, 'forgottenpasswordurl', '', NULL),
(282, 0, 1524839724, NULL, 'auth_instructions', '', NULL),
(283, 0, 1524839724, NULL, 'allowemailaddresses', '', NULL),
(284, 0, 1524839724, NULL, 'denyemailaddresses', '', NULL),
(285, 0, 1524839724, NULL, 'verifychangedemail', '1', NULL),
(286, 0, 1524839724, NULL, 'recaptchapublickey', '', NULL),
(287, 0, 1524839724, NULL, 'recaptchaprivatekey', '', NULL),
(288, 0, 1524839724, 'cachestore_apcu', 'testperformance', '0', NULL),
(289, 0, 1524839724, 'cachestore_memcache', 'testservers', '', NULL),
(290, 0, 1524839724, 'cachestore_memcached', 'testservers', '', NULL),
(291, 0, 1524839724, 'cachestore_mongodb', 'testserver', '', NULL),
(292, 0, 1524839724, 'cachestore_redis', 'test_server', '', NULL),
(293, 0, 1524839724, 'cachestore_redis', 'test_password', '', NULL),
(294, 0, 1524839724, NULL, 'filteruploadedfiles', '0', NULL),
(295, 0, 1524839724, NULL, 'filtermatchoneperpage', '0', NULL),
(296, 0, 1524839724, NULL, 'filtermatchonepertext', '0', NULL),
(297, 0, 1524839724, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(298, 0, 1524839724, NULL, 'media_default_width', '400', NULL),
(299, 0, 1524839724, NULL, 'media_default_height', '300', NULL),
(300, 0, 1524839724, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(301, 0, 1524839724, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(302, 0, 1524839724, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(303, 0, 1524839724, NULL, 'portfolio_high_db_threshold', '50', NULL),
(304, 0, 1524839724, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(305, 0, 1524839724, 'question_preview', 'correctness', '1', NULL),
(306, 0, 1524839724, 'question_preview', 'marks', '2', NULL),
(307, 0, 1524839724, 'question_preview', 'markdp', '2', NULL),
(308, 0, 1524839724, 'question_preview', 'feedback', '1', NULL),
(309, 0, 1524839724, 'question_preview', 'generalfeedback', '1', NULL),
(310, 0, 1524839724, 'question_preview', 'rightanswer', '1', NULL),
(311, 0, 1524839725, 'question_preview', 'history', '0', NULL),
(312, 0, 1524839725, NULL, 'repositorycacheexpire', '120', NULL),
(313, 0, 1524839725, NULL, 'repositorygetfiletimeout', '30', NULL),
(314, 0, 1524839725, NULL, 'repositorysyncfiletimeout', '1', NULL),
(315, 0, 1524839725, NULL, 'repositorysyncimagetimeout', '3', NULL),
(316, 0, 1524839725, NULL, 'repositoryallowexternallinks', '1', NULL),
(317, 0, 1524839725, NULL, 'legacyfilesinnewcourses', '0', NULL),
(318, 0, 1524839725, NULL, 'legacyfilesaddallowed', '1', NULL),
(319, 0, 1524839725, NULL, 'searchengine', 'solr', NULL),
(320, 0, 1524839725, NULL, 'searchindexwhendisabled', '0', NULL),
(321, 0, 1524839725, NULL, 'searchindextime', '600', NULL),
(322, 0, 1524839725, NULL, 'searchallavailablecourses', '0', NULL),
(323, 0, 1524839725, NULL, 'enablewsdocumentation', '0', NULL),
(324, 0, 1524839725, NULL, 'agedigitalconsentverification', '0', NULL),
(325, 0, 1524839725, NULL, 'agedigitalconsentmap', '*, 16\nAT, 14\nCZ, 13\nDE, 14\nDK, 13\nES, 13\nFI, 15\nGB, 13\nHU, 14\nIE, 13\nLT, 16\nLU, 16\nNL, 16\nPL, 13\nSE, 13', NULL),
(326, 0, 1524839725, NULL, 'sitepolicy', '', NULL),
(327, 0, 1524839725, NULL, 'sitepolicyguest', '', NULL),
(328, 0, 1524839725, NULL, 'allowbeforeblock', '0', NULL),
(329, 0, 1524839725, NULL, 'allowedip', '', NULL),
(330, 0, 1524839725, NULL, 'blockedip', '', NULL),
(331, 0, 1524839725, NULL, 'protectusernames', '1', NULL),
(332, 0, 1524839725, NULL, 'forcelogin', '0', NULL),
(333, 0, 1524839725, NULL, 'forceloginforprofiles', '1', NULL),
(334, 0, 1524839725, NULL, 'forceloginforprofileimage', '0', NULL),
(335, 0, 1524839725, NULL, 'opentogoogle', '0', NULL),
(336, 0, 1524839725, NULL, 'allowindexing', '0', NULL),
(337, 0, 1524839725, NULL, 'maxbytes', '0', NULL),
(338, 0, 1524839725, NULL, 'userquota', '104857600', NULL),
(339, 0, 1524839725, NULL, 'allowobjectembed', '0', NULL),
(340, 0, 1524839725, NULL, 'enabletrusttext', '0', NULL),
(341, 0, 1524839725, NULL, 'maxeditingtime', '1800', NULL),
(342, 0, 1524839725, NULL, 'extendedusernamechars', '0', NULL),
(343, 0, 1524839725, NULL, 'keeptagnamecase', '1', NULL),
(344, 0, 1524839725, NULL, 'profilesforenrolledusersonly', '1', NULL),
(345, 0, 1524839725, NULL, 'cronclionly', '1', NULL),
(346, 0, 1524839725, NULL, 'cronremotepassword', '', NULL),
(347, 0, 1524839725, 'tool_task', 'enablerunnow', '1', NULL),
(348, 0, 1524839725, NULL, 'lockoutthreshold', '0', NULL),
(349, 0, 1524839725, NULL, 'lockoutwindow', '1800', NULL),
(350, 0, 1524839725, NULL, 'lockoutduration', '1800', NULL),
(351, 0, 1524839725, NULL, 'passwordpolicy', '1', NULL),
(352, 0, 1524839725, NULL, 'minpasswordlength', '8', NULL),
(353, 0, 1524839725, NULL, 'minpassworddigits', '1', NULL),
(354, 0, 1524839725, NULL, 'minpasswordlower', '1', NULL),
(355, 0, 1524839725, NULL, 'minpasswordupper', '1', NULL),
(356, 0, 1524839725, NULL, 'minpasswordnonalphanum', '1', NULL),
(357, 0, 1524839725, NULL, 'maxconsecutiveidentchars', '0', NULL),
(358, 0, 1524839725, NULL, 'passwordreuselimit', '0', NULL),
(359, 0, 1524839725, NULL, 'pwresettime', '1800', NULL),
(360, 0, 1524839725, NULL, 'passwordchangelogout', '0', NULL),
(361, 0, 1524839725, NULL, 'passwordchangetokendeletion', '0', NULL),
(362, 0, 1524839725, NULL, 'tokenduration', '7257600', NULL),
(363, 0, 1524839725, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(364, 0, 1524839725, NULL, 'disableuserimages', '0', NULL),
(365, 0, 1524839725, NULL, 'emailchangeconfirmation', '1', NULL),
(366, 0, 1524839725, NULL, 'rememberusername', '2', NULL),
(367, 0, 1524839725, NULL, 'strictformsrequired', '0', NULL),
(368, 0, 1524839725, NULL, 'cookiesecure', '1', NULL),
(369, 0, 1524839725, NULL, 'cookiehttponly', '0', NULL),
(370, 0, 1524839725, NULL, 'allowframembedding', '0', NULL),
(371, 0, 1524839725, NULL, 'curlsecurityblockedhosts', '', NULL),
(372, 0, 1524839725, NULL, 'curlsecurityallowedport', '', NULL),
(373, 0, 1524839725, NULL, 'displayloginfailures', '0', NULL),
(374, 0, 1524839726, NULL, 'notifyloginfailures', '', NULL),
(375, 0, 1524839726, NULL, 'notifyloginthreshold', '10', NULL),
(376, 0, 1524839726, NULL, 'themelist', '', NULL),
(377, 0, 1524839726, NULL, 'themedesignermode', '0', NULL),
(378, 0, 1524839726, NULL, 'allowuserthemes', '0', NULL),
(379, 0, 1524839726, NULL, 'allowcoursethemes', '0', NULL),
(380, 0, 1524839726, NULL, 'allowcategorythemes', '0', NULL),
(381, 0, 1524839726, NULL, 'allowthemechangeonurl', '0', NULL),
(382, 0, 1524839726, NULL, 'allowuserblockhiding', '1', NULL),
(383, 0, 1524839726, NULL, 'allowblockstodock', '1', NULL),
(384, 0, 1524839726, NULL, 'custommenuitems', '', NULL),
(385, 0, 1524839726, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences', NULL),
(386, 0, 1524839726, NULL, 'enabledevicedetection', '1', NULL),
(387, 0, 1524839726, NULL, 'devicedetectregex', '[]', NULL),
(388, 0, 1524839726, 'theme_boost', 'preset', 'default.scss', NULL),
(389, 0, 1524839726, 'theme_boost', 'presetfiles', '', NULL),
(390, 0, 1524839726, 'theme_boost', 'backgroundimage', '', NULL),
(391, 0, 1524839726, 'theme_boost', 'brandcolor', '', NULL),
(392, 0, 1524839726, 'theme_boost', 'scsspre', '', NULL),
(393, 0, 1524839726, 'theme_boost', 'scss', '', NULL),
(394, 0, 1524839726, 'theme_clean', 'invert', '0', NULL),
(395, 0, 1524839726, 'theme_clean', 'logo', '', NULL),
(396, 0, 1524839726, 'theme_clean', 'smalllogo', '', NULL),
(397, 0, 1524839726, 'theme_clean', 'sitename', '1', NULL),
(398, 0, 1524839726, 'theme_clean', 'customcss', '', NULL),
(399, 0, 1524839726, 'theme_clean', 'footnote', '', NULL),
(400, 0, 1524839726, 'theme_more', 'textcolor', '#333366', NULL),
(401, 0, 1524839726, 'theme_more', 'linkcolor', '#FF6500', NULL),
(402, 0, 1524839726, 'theme_more', 'bodybackground', '', NULL),
(403, 0, 1524839726, 'theme_more', 'backgroundimage', '', NULL),
(404, 0, 1524839726, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
(405, 0, 1524839726, 'theme_more', 'backgroundposition', '0', NULL),
(406, 0, 1524839726, 'theme_more', 'backgroundfixed', '0', NULL),
(407, 0, 1524839726, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
(408, 0, 1524839726, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
(409, 0, 1524839726, 'theme_more', 'invert', '1', NULL),
(410, 0, 1524839726, 'theme_more', 'logo', '', NULL),
(411, 0, 1524839726, 'theme_more', 'smalllogo', '', NULL),
(412, 0, 1524839726, 'theme_more', 'sitename', '1', NULL),
(413, 0, 1524839726, 'theme_more', 'customcss', '', NULL),
(414, 0, 1524839726, 'theme_more', 'footnote', '', NULL),
(415, 0, 1524839726, 'core_admin', 'logo', '', NULL),
(416, 0, 1524839726, 'core_admin', 'logocompact', '', NULL),
(417, 0, 1524839726, NULL, 'calendartype', 'gregorian', NULL),
(418, 0, 1524839726, NULL, 'calendar_adminseesall', '0', NULL),
(419, 0, 1524839726, NULL, 'calendar_site_timeformat', '0', NULL),
(420, 0, 1524839726, NULL, 'calendar_startwday', '1', NULL),
(421, 0, 1524839726, NULL, 'calendar_weekend', '65', NULL),
(422, 0, 1524839726, NULL, 'calendar_lookahead', '21', NULL),
(423, 0, 1524839726, NULL, 'calendar_maxevents', '10', NULL),
(424, 0, 1524839726, NULL, 'enablecalendarexport', '1', NULL),
(425, 0, 1524839726, NULL, 'calendar_customexport', '1', NULL),
(426, 0, 1524839726, NULL, 'calendar_exportlookahead', '365', NULL),
(427, 0, 1524839726, NULL, 'calendar_exportlookback', '5', NULL),
(428, 0, 1524839726, NULL, 'calendar_exportsalt', 'xM2DiwezZfgggdeRZuZsjwZ8eYgDZXY5JJ4rx5HPMdWv74Lp1yV4yo8vPTzk', NULL),
(429, 0, 1524839726, NULL, 'calendar_showicalsource', '1', NULL),
(430, 0, 1524839726, NULL, 'useblogassociations', '1', NULL),
(431, 0, 1524839726, NULL, 'bloglevel', '4', NULL),
(432, 0, 1524839726, NULL, 'useexternalblogs', '1', NULL),
(433, 0, 1524839726, NULL, 'externalblogcrontime', '86400', NULL),
(434, 0, 1524839726, NULL, 'maxexternalblogsperuser', '1', NULL),
(435, 0, 1524839726, NULL, 'blogusecomments', '1', NULL),
(436, 0, 1524839726, NULL, 'blogshowcommentscount', '1', NULL),
(437, 0, 1524839726, NULL, 'defaulthomepage', '1', NULL),
(438, 0, 1524839726, NULL, 'allowguestmymoodle', '1', NULL),
(439, 0, 1524839726, NULL, 'navshowfullcoursenames', '0', NULL),
(440, 0, 1524839727, NULL, 'navshowcategories', '1', NULL),
(441, 0, 1524839727, NULL, 'navshowmycoursecategories', '0', NULL),
(442, 0, 1524839727, NULL, 'navshowallcourses', '0', NULL),
(443, 0, 1524839727, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(444, 0, 1524839727, NULL, 'navcourselimit', '10', NULL),
(445, 0, 1524839727, NULL, 'usesitenameforsitepages', '0', NULL),
(446, 0, 1524839727, NULL, 'linkadmincategories', '1', NULL),
(447, 0, 1524839727, NULL, 'linkcoursesections', '1', NULL),
(448, 0, 1524839727, NULL, 'navshowfrontpagemods', '1', NULL),
(449, 0, 1524839727, NULL, 'navadduserpostslinks', '1', NULL),
(450, 0, 1524839727, NULL, 'formatstringstriptags', '1', NULL),
(451, 0, 1524839727, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(452, 0, 1524839727, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(453, 0, 1524839727, NULL, 'doclang', '', NULL),
(454, 0, 1524839727, NULL, 'doctonewwindow', '0', NULL),
(455, 0, 1524839727, NULL, 'courselistshortnames', '0', NULL),
(456, 0, 1524839727, NULL, 'coursesperpage', '20', NULL),
(457, 0, 1524839727, NULL, 'courseswithsummarieslimit', '10', NULL),
(458, 0, 1524839727, NULL, 'courseoverviewfileslimit', '1', NULL),
(459, 0, 1524839727, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(460, 0, 1524839727, NULL, 'useexternalyui', '0', NULL),
(461, 0, 1524839727, NULL, 'yuicomboloading', '1', NULL),
(462, 0, 1524839727, NULL, 'cachejs', '1', NULL),
(463, 0, 1524839727, NULL, 'modchooserdefault', '1', NULL),
(464, 0, 1524839727, NULL, 'additionalhtmlhead', '', NULL),
(465, 0, 1524839727, NULL, 'additionalhtmltopofbody', '', NULL),
(466, 0, 1524839727, NULL, 'additionalhtmlfooter', '', NULL),
(467, 0, 1524839727, NULL, 'pathtodu', '', NULL),
(468, 0, 1524839727, NULL, 'aspellpath', '', NULL),
(469, 0, 1524839727, NULL, 'pathtodot', '', NULL),
(470, 0, 1524839727, NULL, 'pathtogs', '/usr/bin/gs', NULL),
(471, 0, 1524839727, NULL, 'pathtopython', '', NULL),
(472, 0, 1524839727, NULL, 'supportname', 'Admin User', NULL),
(473, 0, 1524839727, NULL, 'supportemail', '', NULL),
(474, 0, 1524839727, NULL, 'supportpage', '', NULL),
(475, 0, 1524839727, NULL, 'dbsessions', '0', NULL),
(476, 0, 1524839727, NULL, 'sessioncookie', '', NULL),
(477, 0, 1524839727, NULL, 'sessioncookiepath', '', NULL),
(478, 0, 1524839727, NULL, 'sessioncookiedomain', '', NULL),
(479, 0, 1524839727, NULL, 'statsfirstrun', 'none', NULL),
(480, 0, 1524839727, NULL, 'statsmaxruntime', '0', NULL),
(481, 0, 1524839727, NULL, 'statsruntimedays', '31', NULL),
(482, 0, 1524839727, NULL, 'statsuserthreshold', '0', NULL),
(483, 0, 1524839727, NULL, 'slasharguments', '1', NULL),
(484, 0, 1524839727, NULL, 'getremoteaddrconf', '0', NULL),
(485, 0, 1524839727, NULL, 'proxyhost', '', NULL),
(486, 0, 1524839727, NULL, 'proxyport', '0', NULL),
(487, 0, 1524839727, NULL, 'proxytype', 'HTTP', NULL),
(488, 0, 1524839727, NULL, 'proxyuser', '', NULL),
(489, 0, 1524839727, NULL, 'proxypassword', '', NULL),
(490, 0, 1524839727, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(491, 0, 1524839727, NULL, 'maintenance_enabled', '0', NULL),
(492, 0, 1524839727, NULL, 'maintenance_message', '', NULL),
(493, 0, 1524839727, NULL, 'deleteunconfirmed', '168', NULL),
(494, 0, 1524839727, NULL, 'deleteincompleteusers', '0', NULL),
(495, 0, 1524839727, NULL, 'disablegradehistory', '0', NULL),
(496, 0, 1524839727, NULL, 'gradehistorylifetime', '0', NULL),
(497, 0, 1524839727, NULL, 'tempdatafoldercleanup', '168', NULL),
(498, 0, 1524839727, NULL, 'extramemorylimit', '512M', NULL),
(499, 0, 1524839727, NULL, 'maxtimelimit', '0', NULL),
(500, 0, 1524839727, NULL, 'curlcache', '120', NULL),
(501, 0, 1524839727, NULL, 'curltimeoutkbitrate', '56', NULL),
(502, 0, 1524839728, NULL, 'smtphosts', '', NULL),
(503, 0, 1524839728, NULL, 'smtpsecure', '', NULL),
(504, 0, 1524839728, NULL, 'smtpauthtype', 'LOGIN', NULL),
(505, 0, 1524839728, NULL, 'smtpuser', '', NULL),
(506, 0, 1524839728, NULL, 'smtppass', '', NULL),
(507, 0, 1524839728, NULL, 'smtpmaxbulk', '1', NULL),
(508, 0, 1524839728, NULL, 'allowedemaildomains', '', NULL),
(509, 0, 1524839728, NULL, 'sitemailcharset', '0', NULL),
(510, 0, 1524839728, NULL, 'allowusermailcharset', '0', NULL),
(511, 0, 1524839728, NULL, 'allowattachments', '1', NULL),
(512, 0, 1524839728, NULL, 'mailnewline', 'LF', NULL),
(513, 0, 1524839728, NULL, 'emailfromvia', '1', NULL),
(514, 0, 1524839728, NULL, 'updateautocheck', '1', NULL),
(515, 0, 1524839728, NULL, 'updateminmaturity', '200', NULL),
(516, 0, 1524839728, NULL, 'updatenotifybuilds', '0', NULL),
(517, 0, 1524839728, NULL, 'enablesafebrowserintegration', '0', NULL),
(518, 0, 1524839728, NULL, 'dndallowtextandlinks', '0', NULL),
(519, 0, 1524839728, NULL, 'debug', '0', NULL),
(520, 0, 1524839728, NULL, 'debugdisplay', '0', NULL),
(521, 0, 1524839728, NULL, 'debugsmtp', '0', NULL),
(522, 0, 1524839728, NULL, 'perfdebug', '7', NULL),
(523, 0, 1524839728, NULL, 'debugstringids', '0', NULL),
(524, 0, 1524839728, NULL, 'debugvalidators', '0', NULL),
(525, 0, 1524839728, NULL, 'debugpageinfo', '0', NULL),
(526, 0, 1524839728, NULL, 'profilingenabled', '0', NULL),
(527, 0, 1524839728, NULL, 'profilingincluded', '', NULL),
(528, 0, 1524839728, NULL, 'profilingexcluded', '', NULL),
(529, 0, 1524839728, NULL, 'profilingautofrec', '0', NULL),
(530, 0, 1524839728, NULL, 'profilingallowme', '0', NULL),
(531, 0, 1524839728, NULL, 'profilingallowall', '0', NULL),
(532, 0, 1524839728, NULL, 'profilinglifetime', '1440', NULL),
(533, 0, 1524839728, NULL, 'profilingimportprefix', '(I)', NULL),
(534, 0, 1524839756, 'activitynames', 'filter_active', '1', ''),
(535, 0, 1524839757, 'mathjaxloader', 'filter_active', '1', ''),
(536, 0, 1524839757, 'mediaplugin', 'filter_active', '1', ''),
(537, 2, 1524840107, NULL, 'notloggedinroleid', '6', NULL),
(538, 2, 1524840107, NULL, 'guestroleid', '6', NULL),
(539, 2, 1524840107, NULL, 'defaultuserroleid', '7', NULL),
(540, 2, 1524840107, NULL, 'creatornewroleid', '3', NULL),
(541, 2, 1524840107, NULL, 'restorernewroleid', '3', NULL),
(542, 2, 1524840107, NULL, 'gradebookroles', '5', NULL),
(543, 2, 1524840107, 'analytics', 'logstore', 'logstore_standard', NULL),
(544, 2, 1524840107, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(545, 2, 1524840107, 'assign', 'showrecentsubmissions', '0', NULL),
(546, 2, 1524840107, 'assign', 'submissionreceipts', '1', NULL),
(547, 2, 1524840107, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(548, 2, 1524840107, 'assign', 'maxperpage', '-1', NULL),
(549, 2, 1524840107, 'assign', 'alwaysshowdescription', '1', NULL),
(550, 2, 1524840107, 'assign', 'alwaysshowdescription_adv', '', NULL),
(551, 2, 1524840107, 'assign', 'alwaysshowdescription_locked', '', NULL),
(552, 2, 1524840107, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(553, 2, 1524840107, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(554, 2, 1524840107, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(555, 2, 1524840107, 'assign', 'duedate', '604800', NULL),
(556, 2, 1524840107, 'assign', 'duedate_enabled', '1', NULL),
(557, 2, 1524840107, 'assign', 'duedate_adv', '', NULL),
(558, 2, 1524840107, 'assign', 'cutoffdate', '1209600', NULL),
(559, 2, 1524840107, 'assign', 'cutoffdate_enabled', '', NULL),
(560, 2, 1524840107, 'assign', 'cutoffdate_adv', '', NULL),
(561, 2, 1524840107, 'assign', 'gradingduedate', '1209600', NULL),
(562, 2, 1524840107, 'assign', 'gradingduedate_enabled', '1', NULL),
(563, 2, 1524840107, 'assign', 'gradingduedate_adv', '', NULL),
(564, 2, 1524840107, 'assign', 'submissiondrafts', '0', NULL),
(565, 2, 1524840107, 'assign', 'submissiondrafts_adv', '', NULL),
(566, 2, 1524840107, 'assign', 'submissiondrafts_locked', '', NULL),
(567, 2, 1524840107, 'assign', 'requiresubmissionstatement', '0', NULL),
(568, 2, 1524840107, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(569, 2, 1524840107, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(570, 2, 1524840107, 'assign', 'attemptreopenmethod', 'none', NULL),
(571, 2, 1524840107, 'assign', 'attemptreopenmethod_adv', '', NULL),
(572, 2, 1524840107, 'assign', 'attemptreopenmethod_locked', '', NULL),
(573, 2, 1524840107, 'assign', 'maxattempts', '-1', NULL),
(574, 2, 1524840107, 'assign', 'maxattempts_adv', '', NULL),
(575, 2, 1524840107, 'assign', 'maxattempts_locked', '', NULL),
(576, 2, 1524840107, 'assign', 'teamsubmission', '0', NULL),
(577, 2, 1524840107, 'assign', 'teamsubmission_adv', '', NULL),
(578, 2, 1524840107, 'assign', 'teamsubmission_locked', '', NULL),
(579, 2, 1524840107, 'assign', 'preventsubmissionnotingroup', '0', NULL),
(580, 2, 1524840107, 'assign', 'preventsubmissionnotingroup_adv', '', NULL),
(581, 2, 1524840107, 'assign', 'preventsubmissionnotingroup_locked', '', NULL),
(582, 2, 1524840107, 'assign', 'requireallteammemberssubmit', '0', NULL),
(583, 2, 1524840107, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(584, 2, 1524840107, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(585, 2, 1524840107, 'assign', 'teamsubmissiongroupingid', '', NULL),
(586, 2, 1524840107, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(587, 2, 1524840107, 'assign', 'sendnotifications', '0', NULL),
(588, 2, 1524840107, 'assign', 'sendnotifications_adv', '', NULL),
(589, 2, 1524840107, 'assign', 'sendnotifications_locked', '', NULL),
(590, 2, 1524840107, 'assign', 'sendlatenotifications', '0', NULL),
(591, 2, 1524840107, 'assign', 'sendlatenotifications_adv', '', NULL),
(592, 2, 1524840107, 'assign', 'sendlatenotifications_locked', '', NULL),
(593, 2, 1524840107, 'assign', 'sendstudentnotifications', '1', NULL),
(594, 2, 1524840108, 'assign', 'sendstudentnotifications_adv', '', NULL),
(595, 2, 1524840108, 'assign', 'sendstudentnotifications_locked', '', NULL),
(596, 2, 1524840108, 'assign', 'blindmarking', '0', NULL),
(597, 2, 1524840108, 'assign', 'blindmarking_adv', '', NULL),
(598, 2, 1524840108, 'assign', 'blindmarking_locked', '', NULL),
(599, 2, 1524840108, 'assign', 'markingworkflow', '0', NULL),
(600, 2, 1524840108, 'assign', 'markingworkflow_adv', '', NULL),
(601, 2, 1524840108, 'assign', 'markingworkflow_locked', '', NULL),
(602, 2, 1524840108, 'assign', 'markingallocation', '0', NULL),
(603, 2, 1524840108, 'assign', 'markingallocation_adv', '', NULL),
(604, 2, 1524840108, 'assign', 'markingallocation_locked', '', NULL),
(605, 2, 1524840108, 'assignsubmission_file', 'default', '1', NULL),
(606, 2, 1524840108, 'assignsubmission_file', 'maxfiles', '20', NULL),
(607, 2, 1524840108, 'assignsubmission_file', 'filetypes', '', NULL),
(608, 2, 1524840108, 'assignsubmission_file', 'maxbytes', '0', NULL),
(609, 2, 1524840108, 'assignsubmission_onlinetext', 'default', '0', NULL),
(610, 2, 1524840108, 'assignfeedback_comments', 'default', '1', NULL),
(611, 2, 1524840108, 'assignfeedback_comments', 'inline', '0', NULL),
(612, 2, 1524840108, 'assignfeedback_comments', 'inline_adv', '', NULL),
(613, 2, 1524840108, 'assignfeedback_comments', 'inline_locked', '', NULL),
(614, 2, 1524840108, 'assignfeedback_editpdf', 'stamps', '', NULL),
(615, 2, 1524840108, 'assignfeedback_file', 'default', '0', NULL),
(616, 2, 1524840108, 'assignfeedback_offline', 'default', '0', NULL),
(617, 2, 1524840108, 'book', 'numberingoptions', '0,1,2,3', NULL),
(618, 2, 1524840108, 'book', 'navoptions', '0,1,2', NULL),
(619, 2, 1524840108, 'book', 'numbering', '1', NULL),
(620, 2, 1524840108, 'book', 'navstyle', '1', NULL),
(621, 2, 1524840108, NULL, 'chat_method', 'ajax', NULL),
(622, 2, 1524840108, NULL, 'chat_refresh_userlist', '10', NULL),
(623, 2, 1524840108, NULL, 'chat_old_ping', '35', NULL),
(624, 2, 1524840108, NULL, 'chat_refresh_room', '5', NULL),
(625, 2, 1524840108, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(626, 2, 1524840108, NULL, 'chat_serverhost', 'localhost', NULL),
(627, 2, 1524840108, NULL, 'chat_serverip', '127.0.0.1', NULL),
(628, 2, 1524840108, NULL, 'chat_serverport', '9111', NULL),
(629, 2, 1524840108, NULL, 'chat_servermax', '100', NULL),
(630, 2, 1524840108, NULL, 'data_enablerssfeeds', '0', NULL),
(631, 2, 1524840108, NULL, 'feedback_allowfullanonymous', '0', NULL),
(632, 2, 1524840108, 'resource', 'framesize', '130', NULL),
(633, 2, 1524840108, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(634, 2, 1524840108, 'resource', 'printintro', '1', NULL),
(635, 2, 1524840108, 'resource', 'display', '0', NULL),
(636, 2, 1524840108, 'resource', 'showsize', '0', NULL),
(637, 2, 1524840108, 'resource', 'showtype', '0', NULL),
(638, 2, 1524840108, 'resource', 'showdate', '0', NULL),
(639, 2, 1524840108, 'resource', 'popupwidth', '620', NULL),
(640, 2, 1524840108, 'resource', 'popupheight', '450', NULL),
(641, 2, 1524840108, 'resource', 'filterfiles', '0', NULL),
(642, 2, 1524840108, 'folder', 'showexpanded', '1', NULL),
(643, 2, 1524840108, 'folder', 'maxsizetodownload', '0', NULL),
(644, 2, 1524840108, NULL, 'forum_displaymode', '3', NULL),
(645, 2, 1524840108, NULL, 'forum_shortpost', '300', NULL),
(646, 2, 1524840108, NULL, 'forum_longpost', '600', NULL),
(647, 2, 1524840108, NULL, 'forum_manydiscussions', '100', NULL),
(648, 2, 1524840108, NULL, 'forum_maxbytes', '512000', NULL),
(649, 2, 1524840108, NULL, 'forum_maxattachments', '9', NULL),
(650, 2, 1524840108, NULL, 'forum_subscription', '0', NULL),
(651, 2, 1524840108, NULL, 'forum_trackingtype', '1', NULL),
(652, 2, 1524840108, NULL, 'forum_trackreadposts', '1', NULL),
(653, 2, 1524840108, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(654, 2, 1524840108, NULL, 'forum_oldpostdays', '14', NULL),
(655, 2, 1524840108, NULL, 'forum_usermarksread', '0', NULL),
(656, 2, 1524840108, NULL, 'forum_cleanreadtime', '2', NULL),
(657, 2, 1524840108, NULL, 'digestmailtime', '17', NULL),
(658, 2, 1524840108, NULL, 'forum_enablerssfeeds', '0', NULL),
(659, 2, 1524840108, NULL, 'forum_enabletimedposts', '1', NULL),
(660, 2, 1524840108, NULL, 'glossary_entbypage', '10', NULL),
(661, 2, 1524840109, NULL, 'glossary_dupentries', '0', NULL),
(662, 2, 1524840109, NULL, 'glossary_allowcomments', '0', NULL),
(663, 2, 1524840109, NULL, 'glossary_linkbydefault', '1', NULL),
(664, 2, 1524840109, NULL, 'glossary_defaultapproval', '1', NULL),
(665, 2, 1524840109, NULL, 'glossary_enablerssfeeds', '0', NULL),
(666, 2, 1524840109, NULL, 'glossary_linkentries', '0', NULL),
(667, 2, 1524840109, NULL, 'glossary_casesensitive', '0', NULL),
(668, 2, 1524840109, NULL, 'glossary_fullmatch', '0', NULL),
(669, 2, 1524840109, 'imscp', 'keepold', '1', NULL),
(670, 2, 1524840109, 'imscp', 'keepold_adv', '', NULL),
(671, 2, 1524840109, 'label', 'dndmedia', '1', NULL),
(672, 2, 1524840109, 'label', 'dndresizewidth', '400', NULL),
(673, 2, 1524840109, 'label', 'dndresizeheight', '400', NULL),
(674, 2, 1524840109, 'mod_lesson', 'mediafile', '', NULL),
(675, 2, 1524840109, 'mod_lesson', 'mediafile_adv', '1', NULL),
(676, 2, 1524840109, 'mod_lesson', 'mediawidth', '640', NULL),
(677, 2, 1524840109, 'mod_lesson', 'mediaheight', '480', NULL),
(678, 2, 1524840109, 'mod_lesson', 'mediaclose', '0', NULL),
(679, 2, 1524840109, 'mod_lesson', 'progressbar', '0', NULL),
(680, 2, 1524840109, 'mod_lesson', 'progressbar_adv', '', NULL),
(681, 2, 1524840109, 'mod_lesson', 'ongoing', '0', NULL),
(682, 2, 1524840109, 'mod_lesson', 'ongoing_adv', '1', NULL),
(683, 2, 1524840109, 'mod_lesson', 'displayleftmenu', '0', NULL),
(684, 2, 1524840109, 'mod_lesson', 'displayleftmenu_adv', '', NULL),
(685, 2, 1524840109, 'mod_lesson', 'displayleftif', '0', NULL),
(686, 2, 1524840109, 'mod_lesson', 'displayleftif_adv', '1', NULL),
(687, 2, 1524840109, 'mod_lesson', 'slideshow', '0', NULL),
(688, 2, 1524840109, 'mod_lesson', 'slideshow_adv', '1', NULL),
(689, 2, 1524840109, 'mod_lesson', 'slideshowwidth', '640', NULL),
(690, 2, 1524840109, 'mod_lesson', 'slideshowheight', '480', NULL),
(691, 2, 1524840109, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF', NULL),
(692, 2, 1524840109, 'mod_lesson', 'maxanswers', '5', NULL),
(693, 2, 1524840109, 'mod_lesson', 'maxanswers_adv', '1', NULL),
(694, 2, 1524840109, 'mod_lesson', 'defaultfeedback', '0', NULL),
(695, 2, 1524840109, 'mod_lesson', 'defaultfeedback_adv', '1', NULL),
(696, 2, 1524840109, 'mod_lesson', 'activitylink', '', NULL),
(697, 2, 1524840109, 'mod_lesson', 'activitylink_adv', '1', NULL),
(698, 2, 1524840109, 'mod_lesson', 'timelimit', '0', NULL),
(699, 2, 1524840109, 'mod_lesson', 'timelimit_adv', '', NULL),
(700, 2, 1524840109, 'mod_lesson', 'password', '0', NULL),
(701, 2, 1524840109, 'mod_lesson', 'password_adv', '1', NULL),
(702, 2, 1524840109, 'mod_lesson', 'modattempts', '0', NULL),
(703, 2, 1524840109, 'mod_lesson', 'modattempts_adv', '', NULL),
(704, 2, 1524840109, 'mod_lesson', 'displayreview', '0', NULL),
(705, 2, 1524840109, 'mod_lesson', 'displayreview_adv', '', NULL),
(706, 2, 1524840109, 'mod_lesson', 'maximumnumberofattempts', '1', NULL),
(707, 2, 1524840109, 'mod_lesson', 'maximumnumberofattempts_adv', '', NULL),
(708, 2, 1524840109, 'mod_lesson', 'defaultnextpage', '0', NULL),
(709, 2, 1524840109, 'mod_lesson', 'defaultnextpage_adv', '1', NULL),
(710, 2, 1524840109, 'mod_lesson', 'numberofpagestoshow', '1', NULL),
(711, 2, 1524840109, 'mod_lesson', 'numberofpagestoshow_adv', '1', NULL),
(712, 2, 1524840109, 'mod_lesson', 'practice', '0', NULL),
(713, 2, 1524840109, 'mod_lesson', 'practice_adv', '', NULL),
(714, 2, 1524840109, 'mod_lesson', 'customscoring', '1', NULL),
(715, 2, 1524840109, 'mod_lesson', 'customscoring_adv', '1', NULL),
(716, 2, 1524840109, 'mod_lesson', 'retakesallowed', '0', NULL),
(717, 2, 1524840109, 'mod_lesson', 'retakesallowed_adv', '', NULL),
(718, 2, 1524840109, 'mod_lesson', 'handlingofretakes', '0', NULL),
(719, 2, 1524840109, 'mod_lesson', 'handlingofretakes_adv', '1', NULL),
(720, 2, 1524840109, 'mod_lesson', 'minimumnumberofquestions', '0', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(721, 2, 1524840109, 'mod_lesson', 'minimumnumberofquestions_adv', '1', NULL),
(722, 2, 1524840109, 'page', 'displayoptions', '5', NULL),
(723, 2, 1524840109, 'page', 'printheading', '1', NULL),
(724, 2, 1524840109, 'page', 'printintro', '0', NULL),
(725, 2, 1524840109, 'page', 'display', '5', NULL),
(726, 2, 1524840109, 'page', 'popupwidth', '620', NULL),
(727, 2, 1524840109, 'page', 'popupheight', '450', NULL),
(728, 2, 1524840109, 'quiz', 'timelimit', '0', NULL),
(729, 2, 1524840109, 'quiz', 'timelimit_adv', '', NULL),
(730, 2, 1524840109, 'quiz', 'overduehandling', 'autosubmit', NULL),
(731, 2, 1524840109, 'quiz', 'overduehandling_adv', '', NULL),
(732, 2, 1524840109, 'quiz', 'graceperiod', '86400', NULL),
(733, 2, 1524840109, 'quiz', 'graceperiod_adv', '', NULL),
(734, 2, 1524840109, 'quiz', 'graceperiodmin', '60', NULL),
(735, 2, 1524840110, 'quiz', 'attempts', '0', NULL),
(736, 2, 1524840110, 'quiz', 'attempts_adv', '', NULL),
(737, 2, 1524840110, 'quiz', 'grademethod', '1', NULL),
(738, 2, 1524840110, 'quiz', 'grademethod_adv', '', NULL),
(739, 2, 1524840110, 'quiz', 'maximumgrade', '10', NULL),
(740, 2, 1524840110, 'quiz', 'questionsperpage', '1', NULL),
(741, 2, 1524840110, 'quiz', 'questionsperpage_adv', '', NULL),
(742, 2, 1524840110, 'quiz', 'navmethod', 'free', NULL),
(743, 2, 1524840110, 'quiz', 'navmethod_adv', '1', NULL),
(744, 2, 1524840110, 'quiz', 'shuffleanswers', '1', NULL),
(745, 2, 1524840110, 'quiz', 'shuffleanswers_adv', '', NULL),
(746, 2, 1524840110, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(747, 2, 1524840110, 'quiz', 'canredoquestions', '0', NULL),
(748, 2, 1524840110, 'quiz', 'canredoquestions_adv', '1', NULL),
(749, 2, 1524840110, 'quiz', 'attemptonlast', '0', NULL),
(750, 2, 1524840110, 'quiz', 'attemptonlast_adv', '1', NULL),
(751, 2, 1524840110, 'quiz', 'reviewattempt', '69904', NULL),
(752, 2, 1524840110, 'quiz', 'reviewcorrectness', '69904', NULL),
(753, 2, 1524840110, 'quiz', 'reviewmarks', '69904', NULL),
(754, 2, 1524840110, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(755, 2, 1524840110, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(756, 2, 1524840110, 'quiz', 'reviewrightanswer', '69904', NULL),
(757, 2, 1524840110, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(758, 2, 1524840110, 'quiz', 'showuserpicture', '0', NULL),
(759, 2, 1524840110, 'quiz', 'showuserpicture_adv', '', NULL),
(760, 2, 1524840110, 'quiz', 'decimalpoints', '2', NULL),
(761, 2, 1524840110, 'quiz', 'decimalpoints_adv', '', NULL),
(762, 2, 1524840110, 'quiz', 'questiondecimalpoints', '-1', NULL),
(763, 2, 1524840110, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(764, 2, 1524840110, 'quiz', 'showblocks', '0', NULL),
(765, 2, 1524840110, 'quiz', 'showblocks_adv', '1', NULL),
(766, 2, 1524840110, 'quiz', 'password', '', NULL),
(767, 2, 1524840110, 'quiz', 'password_adv', '', NULL),
(768, 2, 1524840110, 'quiz', 'subnet', '', NULL),
(769, 2, 1524840110, 'quiz', 'subnet_adv', '1', NULL),
(770, 2, 1524840110, 'quiz', 'delay1', '0', NULL),
(771, 2, 1524840110, 'quiz', 'delay1_adv', '1', NULL),
(772, 2, 1524840110, 'quiz', 'delay2', '0', NULL),
(773, 2, 1524840110, 'quiz', 'delay2_adv', '1', NULL),
(774, 2, 1524840110, 'quiz', 'browsersecurity', '-', NULL),
(775, 2, 1524840110, 'quiz', 'browsersecurity_adv', '1', NULL),
(776, 2, 1524840110, 'quiz', 'initialnumfeedbacks', '2', NULL),
(777, 2, 1524840110, 'quiz', 'autosaveperiod', '60', NULL),
(778, 2, 1524840110, 'scorm', 'displaycoursestructure', '0', NULL),
(779, 2, 1524840110, 'scorm', 'displaycoursestructure_adv', '', NULL),
(780, 2, 1524840110, 'scorm', 'popup', '0', NULL),
(781, 2, 1524840110, 'scorm', 'popup_adv', '', NULL),
(782, 2, 1524840110, 'scorm', 'displayactivityname', '1', NULL),
(783, 2, 1524840110, 'scorm', 'framewidth', '100', NULL),
(784, 2, 1524840110, 'scorm', 'framewidth_adv', '1', NULL),
(785, 2, 1524840110, 'scorm', 'frameheight', '500', NULL),
(786, 2, 1524840110, 'scorm', 'frameheight_adv', '1', NULL),
(787, 2, 1524840110, 'scorm', 'winoptgrp_adv', '1', NULL),
(788, 2, 1524840110, 'scorm', 'scrollbars', '0', NULL),
(789, 2, 1524840110, 'scorm', 'directories', '0', NULL),
(790, 2, 1524840110, 'scorm', 'location', '0', NULL),
(791, 2, 1524840110, 'scorm', 'menubar', '0', NULL),
(792, 2, 1524840110, 'scorm', 'toolbar', '0', NULL),
(793, 2, 1524840110, 'scorm', 'status', '0', NULL),
(794, 2, 1524840110, 'scorm', 'skipview', '0', NULL),
(795, 2, 1524840110, 'scorm', 'skipview_adv', '1', NULL),
(796, 2, 1524840110, 'scorm', 'hidebrowse', '0', NULL),
(797, 2, 1524840110, 'scorm', 'hidebrowse_adv', '1', NULL),
(798, 2, 1524840110, 'scorm', 'hidetoc', '0', NULL),
(799, 2, 1524840110, 'scorm', 'hidetoc_adv', '1', NULL),
(800, 2, 1524840110, 'scorm', 'nav', '1', NULL),
(801, 2, 1524840110, 'scorm', 'nav_adv', '1', NULL),
(802, 2, 1524840110, 'scorm', 'navpositionleft', '-100', NULL),
(803, 2, 1524840110, 'scorm', 'navpositionleft_adv', '1', NULL),
(804, 2, 1524840110, 'scorm', 'navpositiontop', '-100', NULL),
(805, 2, 1524840110, 'scorm', 'navpositiontop_adv', '1', NULL),
(806, 2, 1524840110, 'scorm', 'collapsetocwinsize', '767', NULL),
(807, 2, 1524840110, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(808, 2, 1524840110, 'scorm', 'displayattemptstatus', '1', NULL),
(809, 2, 1524840110, 'scorm', 'displayattemptstatus_adv', '', NULL),
(810, 2, 1524840110, 'scorm', 'grademethod', '1', NULL),
(811, 2, 1524840110, 'scorm', 'maxgrade', '100', NULL),
(812, 2, 1524840111, 'scorm', 'maxattempt', '0', NULL),
(813, 2, 1524840111, 'scorm', 'whatgrade', '0', NULL),
(814, 2, 1524840111, 'scorm', 'forcecompleted', '0', NULL),
(815, 2, 1524840111, 'scorm', 'forcenewattempt', '0', NULL),
(816, 2, 1524840111, 'scorm', 'autocommit', '0', NULL),
(817, 2, 1524840111, 'scorm', 'masteryoverride', '1', NULL),
(818, 2, 1524840111, 'scorm', 'lastattemptlock', '0', NULL),
(819, 2, 1524840111, 'scorm', 'auto', '0', NULL),
(820, 2, 1524840111, 'scorm', 'updatefreq', '0', NULL),
(821, 2, 1524840111, 'scorm', 'scorm12standard', '1', NULL),
(822, 2, 1524840111, 'scorm', 'allowtypeexternal', '0', NULL),
(823, 2, 1524840111, 'scorm', 'allowtypelocalsync', '0', NULL),
(824, 2, 1524840111, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(825, 2, 1524840111, 'scorm', 'allowaicchacp', '0', NULL),
(826, 2, 1524840111, 'scorm', 'aicchacptimeout', '30', NULL),
(827, 2, 1524840111, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(828, 2, 1524840111, 'scorm', 'aiccuserid', '1', NULL),
(829, 2, 1524840111, 'scorm', 'forcejavascript', '1', NULL),
(830, 2, 1524840111, 'scorm', 'allowapidebug', '0', NULL),
(831, 2, 1524840111, 'scorm', 'apidebugmask', '.*', NULL),
(832, 2, 1524840111, 'scorm', 'protectpackagedownloads', '0', NULL),
(833, 2, 1524840111, 'url', 'framesize', '130', NULL),
(834, 2, 1524840111, 'url', 'secretphrase', '', NULL),
(835, 2, 1524840111, 'url', 'rolesinparams', '0', NULL),
(836, 2, 1524840111, 'url', 'displayoptions', '0,1,5,6', NULL),
(837, 2, 1524840111, 'url', 'printintro', '1', NULL),
(838, 2, 1524840111, 'url', 'display', '0', NULL),
(839, 2, 1524840111, 'url', 'popupwidth', '620', NULL),
(840, 2, 1524840111, 'url', 'popupheight', '450', NULL),
(841, 2, 1524840111, 'workshop', 'grade', '80', NULL),
(842, 2, 1524840111, 'workshop', 'gradinggrade', '20', NULL),
(843, 2, 1524840111, 'workshop', 'gradedecimals', '0', NULL),
(844, 2, 1524840111, 'workshop', 'maxbytes', '0', NULL),
(845, 2, 1524840111, 'workshop', 'strategy', 'accumulative', NULL),
(846, 2, 1524840111, 'workshop', 'examplesmode', '0', NULL),
(847, 2, 1524840111, 'workshopallocation_random', 'numofreviews', '5', NULL),
(848, 2, 1524840111, 'workshopform_numerrors', 'grade0', 'No', NULL),
(849, 2, 1524840111, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(850, 2, 1524840111, 'workshopeval_best', 'comparison', '5', NULL),
(851, 2, 1524840111, 'tool_recyclebin', 'coursebinenable', '1', NULL),
(852, 2, 1524840111, 'tool_recyclebin', 'coursebinexpiry', '604800', NULL),
(853, 2, 1524840111, 'tool_recyclebin', 'categorybinenable', '1', NULL),
(854, 2, 1524840111, 'tool_recyclebin', 'categorybinexpiry', '604800', NULL),
(855, 2, 1524840111, 'tool_recyclebin', 'autohide', '1', NULL),
(856, 2, 1524840111, 'antivirus_clamav', 'runningmethod', 'commandline', NULL),
(857, 2, 1524840111, 'antivirus_clamav', 'pathtoclam', '', NULL),
(858, 2, 1524840111, 'antivirus_clamav', 'pathtounixsocket', '', NULL),
(859, 2, 1524840111, 'antivirus_clamav', 'clamfailureonupload', 'donothing', NULL),
(860, 2, 1524840111, 'auth_cas', 'field_map_firstname', '', NULL),
(861, 2, 1524840111, 'auth_cas', 'field_updatelocal_firstname', 'oncreate', NULL),
(862, 2, 1524840111, 'auth_cas', 'field_updateremote_firstname', '0', NULL),
(863, 2, 1524840111, 'auth_cas', 'field_lock_firstname', 'unlocked', NULL),
(864, 2, 1524840111, 'auth_cas', 'field_map_lastname', '', NULL),
(865, 2, 1524840111, 'auth_cas', 'field_updatelocal_lastname', 'oncreate', NULL),
(866, 2, 1524840111, 'auth_cas', 'field_updateremote_lastname', '0', NULL),
(867, 2, 1524840111, 'auth_cas', 'field_lock_lastname', 'unlocked', NULL),
(868, 2, 1524840111, 'auth_cas', 'field_map_email', '', NULL),
(869, 2, 1524840111, 'auth_cas', 'field_updatelocal_email', 'oncreate', NULL),
(870, 2, 1524840111, 'auth_cas', 'field_updateremote_email', '0', NULL),
(871, 2, 1524840111, 'auth_cas', 'field_lock_email', 'unlocked', NULL),
(872, 2, 1524840111, 'auth_cas', 'field_map_city', '', NULL),
(873, 2, 1524840111, 'auth_cas', 'field_updatelocal_city', 'oncreate', NULL),
(874, 2, 1524840111, 'auth_cas', 'field_updateremote_city', '0', NULL),
(875, 2, 1524840111, 'auth_cas', 'field_lock_city', 'unlocked', NULL),
(876, 2, 1524840111, 'auth_cas', 'field_map_country', '', NULL),
(877, 2, 1524840111, 'auth_cas', 'field_updatelocal_country', 'oncreate', NULL),
(878, 2, 1524840111, 'auth_cas', 'field_updateremote_country', '0', NULL),
(879, 2, 1524840111, 'auth_cas', 'field_lock_country', 'unlocked', NULL),
(880, 2, 1524840111, 'auth_cas', 'field_map_lang', '', NULL),
(881, 2, 1524840111, 'auth_cas', 'field_updatelocal_lang', 'oncreate', NULL),
(882, 2, 1524840111, 'auth_cas', 'field_updateremote_lang', '0', NULL),
(883, 2, 1524840111, 'auth_cas', 'field_lock_lang', 'unlocked', NULL),
(884, 2, 1524840111, 'auth_cas', 'field_map_description', '', NULL),
(885, 2, 1524840111, 'auth_cas', 'field_updatelocal_description', 'oncreate', NULL),
(886, 2, 1524840112, 'auth_cas', 'field_updateremote_description', '0', NULL),
(887, 2, 1524840112, 'auth_cas', 'field_lock_description', 'unlocked', NULL),
(888, 2, 1524840112, 'auth_cas', 'field_map_url', '', NULL),
(889, 2, 1524840112, 'auth_cas', 'field_updatelocal_url', 'oncreate', NULL),
(890, 2, 1524840112, 'auth_cas', 'field_updateremote_url', '0', NULL),
(891, 2, 1524840112, 'auth_cas', 'field_lock_url', 'unlocked', NULL),
(892, 2, 1524840112, 'auth_cas', 'field_map_idnumber', '', NULL),
(893, 2, 1524840112, 'auth_cas', 'field_updatelocal_idnumber', 'oncreate', NULL),
(894, 2, 1524840112, 'auth_cas', 'field_updateremote_idnumber', '0', NULL),
(895, 2, 1524840112, 'auth_cas', 'field_lock_idnumber', 'unlocked', NULL),
(896, 2, 1524840112, 'auth_cas', 'field_map_institution', '', NULL),
(897, 2, 1524840112, 'auth_cas', 'field_updatelocal_institution', 'oncreate', NULL),
(898, 2, 1524840112, 'auth_cas', 'field_updateremote_institution', '0', NULL),
(899, 2, 1524840112, 'auth_cas', 'field_lock_institution', 'unlocked', NULL),
(900, 2, 1524840112, 'auth_cas', 'field_map_department', '', NULL),
(901, 2, 1524840112, 'auth_cas', 'field_updatelocal_department', 'oncreate', NULL),
(902, 2, 1524840112, 'auth_cas', 'field_updateremote_department', '0', NULL),
(903, 2, 1524840112, 'auth_cas', 'field_lock_department', 'unlocked', NULL),
(904, 2, 1524840112, 'auth_cas', 'field_map_phone1', '', NULL),
(905, 2, 1524840112, 'auth_cas', 'field_updatelocal_phone1', 'oncreate', NULL),
(906, 2, 1524840112, 'auth_cas', 'field_updateremote_phone1', '0', NULL),
(907, 2, 1524840112, 'auth_cas', 'field_lock_phone1', 'unlocked', NULL),
(908, 2, 1524840112, 'auth_cas', 'field_map_phone2', '', NULL),
(909, 2, 1524840112, 'auth_cas', 'field_updatelocal_phone2', 'oncreate', NULL),
(910, 2, 1524840112, 'auth_cas', 'field_updateremote_phone2', '0', NULL),
(911, 2, 1524840112, 'auth_cas', 'field_lock_phone2', 'unlocked', NULL),
(912, 2, 1524840112, 'auth_cas', 'field_map_address', '', NULL),
(913, 2, 1524840112, 'auth_cas', 'field_updatelocal_address', 'oncreate', NULL),
(914, 2, 1524840112, 'auth_cas', 'field_updateremote_address', '0', NULL),
(915, 2, 1524840112, 'auth_cas', 'field_lock_address', 'unlocked', NULL),
(916, 2, 1524840112, 'auth_cas', 'field_map_firstnamephonetic', '', NULL),
(917, 2, 1524840112, 'auth_cas', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(918, 2, 1524840112, 'auth_cas', 'field_updateremote_firstnamephonetic', '0', NULL),
(919, 2, 1524840112, 'auth_cas', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(920, 2, 1524840112, 'auth_cas', 'field_map_lastnamephonetic', '', NULL),
(921, 2, 1524840112, 'auth_cas', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(922, 2, 1524840112, 'auth_cas', 'field_updateremote_lastnamephonetic', '0', NULL),
(923, 2, 1524840112, 'auth_cas', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(924, 2, 1524840112, 'auth_cas', 'field_map_middlename', '', NULL),
(925, 2, 1524840112, 'auth_cas', 'field_updatelocal_middlename', 'oncreate', NULL),
(926, 2, 1524840112, 'auth_cas', 'field_updateremote_middlename', '0', NULL),
(927, 2, 1524840112, 'auth_cas', 'field_lock_middlename', 'unlocked', NULL),
(928, 2, 1524840112, 'auth_cas', 'field_map_alternatename', '', NULL),
(929, 2, 1524840112, 'auth_cas', 'field_updatelocal_alternatename', 'oncreate', NULL),
(930, 2, 1524840112, 'auth_cas', 'field_updateremote_alternatename', '0', NULL),
(931, 2, 1524840112, 'auth_cas', 'field_lock_alternatename', 'unlocked', NULL),
(932, 2, 1524840112, 'auth_email', 'recaptcha', '0', NULL),
(933, 2, 1524840112, 'auth_email', 'field_lock_firstname', 'unlocked', NULL),
(934, 2, 1524840112, 'auth_email', 'field_lock_lastname', 'unlocked', NULL),
(935, 2, 1524840112, 'auth_email', 'field_lock_email', 'unlocked', NULL),
(936, 2, 1524840112, 'auth_email', 'field_lock_city', 'unlocked', NULL),
(937, 2, 1524840112, 'auth_email', 'field_lock_country', 'unlocked', NULL),
(938, 2, 1524840112, 'auth_email', 'field_lock_lang', 'unlocked', NULL),
(939, 2, 1524840112, 'auth_email', 'field_lock_description', 'unlocked', NULL),
(940, 2, 1524840112, 'auth_email', 'field_lock_url', 'unlocked', NULL),
(941, 2, 1524840112, 'auth_email', 'field_lock_idnumber', 'unlocked', NULL),
(942, 2, 1524840112, 'auth_email', 'field_lock_institution', 'unlocked', NULL),
(943, 2, 1524840112, 'auth_email', 'field_lock_department', 'unlocked', NULL),
(944, 2, 1524840112, 'auth_email', 'field_lock_phone1', 'unlocked', NULL),
(945, 2, 1524840112, 'auth_email', 'field_lock_phone2', 'unlocked', NULL),
(946, 2, 1524840112, 'auth_email', 'field_lock_address', 'unlocked', NULL),
(947, 2, 1524840112, 'auth_email', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(948, 2, 1524840112, 'auth_email', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(949, 2, 1524840112, 'auth_email', 'field_lock_middlename', 'unlocked', NULL),
(950, 2, 1524840112, 'auth_email', 'field_lock_alternatename', 'unlocked', NULL),
(951, 2, 1524840112, 'auth_db', 'host', '127.0.0.1', NULL),
(952, 2, 1524840112, 'auth_db', 'type', 'mysqli', NULL),
(953, 2, 1524840112, 'auth_db', 'sybasequoting', '0', NULL),
(954, 2, 1524840112, 'auth_db', 'name', '', NULL),
(955, 2, 1524840112, 'auth_db', 'user', '', NULL),
(956, 2, 1524840112, 'auth_db', 'pass', '', NULL),
(957, 2, 1524840112, 'auth_db', 'table', '', NULL),
(958, 2, 1524840112, 'auth_db', 'fielduser', '', NULL),
(959, 2, 1524840112, 'auth_db', 'fieldpass', '', NULL),
(960, 2, 1524840113, 'auth_db', 'passtype', 'plaintext', NULL),
(961, 2, 1524840113, 'auth_db', 'extencoding', 'utf-8', NULL),
(962, 2, 1524840113, 'auth_db', 'setupsql', '', NULL),
(963, 2, 1524840113, 'auth_db', 'debugauthdb', '0', NULL),
(964, 2, 1524840113, 'auth_db', 'changepasswordurl', '', NULL),
(965, 2, 1524840113, 'auth_db', 'removeuser', '0', NULL),
(966, 2, 1524840113, 'auth_db', 'updateusers', '0', NULL),
(967, 2, 1524840113, 'auth_db', 'field_map_firstname', '', NULL),
(968, 2, 1524840113, 'auth_db', 'field_updatelocal_firstname', 'oncreate', NULL),
(969, 2, 1524840113, 'auth_db', 'field_updateremote_firstname', '0', NULL),
(970, 2, 1524840113, 'auth_db', 'field_lock_firstname', 'unlocked', NULL),
(971, 2, 1524840113, 'auth_db', 'field_map_lastname', '', NULL),
(972, 2, 1524840113, 'auth_db', 'field_updatelocal_lastname', 'oncreate', NULL),
(973, 2, 1524840113, 'auth_db', 'field_updateremote_lastname', '0', NULL),
(974, 2, 1524840113, 'auth_db', 'field_lock_lastname', 'unlocked', NULL),
(975, 2, 1524840113, 'auth_db', 'field_map_email', '', NULL),
(976, 2, 1524840113, 'auth_db', 'field_updatelocal_email', 'oncreate', NULL),
(977, 2, 1524840113, 'auth_db', 'field_updateremote_email', '0', NULL),
(978, 2, 1524840113, 'auth_db', 'field_lock_email', 'unlocked', NULL),
(979, 2, 1524840113, 'auth_db', 'field_map_city', '', NULL),
(980, 2, 1524840113, 'auth_db', 'field_updatelocal_city', 'oncreate', NULL),
(981, 2, 1524840113, 'auth_db', 'field_updateremote_city', '0', NULL),
(982, 2, 1524840113, 'auth_db', 'field_lock_city', 'unlocked', NULL),
(983, 2, 1524840113, 'auth_db', 'field_map_country', '', NULL),
(984, 2, 1524840113, 'auth_db', 'field_updatelocal_country', 'oncreate', NULL),
(985, 2, 1524840113, 'auth_db', 'field_updateremote_country', '0', NULL),
(986, 2, 1524840113, 'auth_db', 'field_lock_country', 'unlocked', NULL),
(987, 2, 1524840113, 'auth_db', 'field_map_lang', '', NULL),
(988, 2, 1524840113, 'auth_db', 'field_updatelocal_lang', 'oncreate', NULL),
(989, 2, 1524840113, 'auth_db', 'field_updateremote_lang', '0', NULL),
(990, 2, 1524840113, 'auth_db', 'field_lock_lang', 'unlocked', NULL),
(991, 2, 1524840113, 'auth_db', 'field_map_description', '', NULL),
(992, 2, 1524840113, 'auth_db', 'field_updatelocal_description', 'oncreate', NULL),
(993, 2, 1524840113, 'auth_db', 'field_updateremote_description', '0', NULL),
(994, 2, 1524840113, 'auth_db', 'field_lock_description', 'unlocked', NULL),
(995, 2, 1524840113, 'auth_db', 'field_map_url', '', NULL),
(996, 2, 1524840113, 'auth_db', 'field_updatelocal_url', 'oncreate', NULL),
(997, 2, 1524840113, 'auth_db', 'field_updateremote_url', '0', NULL),
(998, 2, 1524840113, 'auth_db', 'field_lock_url', 'unlocked', NULL),
(999, 2, 1524840113, 'auth_db', 'field_map_idnumber', '', NULL),
(1000, 2, 1524840113, 'auth_db', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1001, 2, 1524840113, 'auth_db', 'field_updateremote_idnumber', '0', NULL),
(1002, 2, 1524840113, 'auth_db', 'field_lock_idnumber', 'unlocked', NULL),
(1003, 2, 1524840113, 'auth_db', 'field_map_institution', '', NULL),
(1004, 2, 1524840113, 'auth_db', 'field_updatelocal_institution', 'oncreate', NULL),
(1005, 2, 1524840113, 'auth_db', 'field_updateremote_institution', '0', NULL),
(1006, 2, 1524840113, 'auth_db', 'field_lock_institution', 'unlocked', NULL),
(1007, 2, 1524840113, 'auth_db', 'field_map_department', '', NULL),
(1008, 2, 1524840113, 'auth_db', 'field_updatelocal_department', 'oncreate', NULL),
(1009, 2, 1524840113, 'auth_db', 'field_updateremote_department', '0', NULL),
(1010, 2, 1524840113, 'auth_db', 'field_lock_department', 'unlocked', NULL),
(1011, 2, 1524840113, 'auth_db', 'field_map_phone1', '', NULL),
(1012, 2, 1524840113, 'auth_db', 'field_updatelocal_phone1', 'oncreate', NULL),
(1013, 2, 1524840113, 'auth_db', 'field_updateremote_phone1', '0', NULL),
(1014, 2, 1524840113, 'auth_db', 'field_lock_phone1', 'unlocked', NULL),
(1015, 2, 1524840113, 'auth_db', 'field_map_phone2', '', NULL),
(1016, 2, 1524840113, 'auth_db', 'field_updatelocal_phone2', 'oncreate', NULL),
(1017, 2, 1524840113, 'auth_db', 'field_updateremote_phone2', '0', NULL),
(1018, 2, 1524840113, 'auth_db', 'field_lock_phone2', 'unlocked', NULL),
(1019, 2, 1524840113, 'auth_db', 'field_map_address', '', NULL),
(1020, 2, 1524840113, 'auth_db', 'field_updatelocal_address', 'oncreate', NULL),
(1021, 2, 1524840113, 'auth_db', 'field_updateremote_address', '0', NULL),
(1022, 2, 1524840113, 'auth_db', 'field_lock_address', 'unlocked', NULL),
(1023, 2, 1524840113, 'auth_db', 'field_map_firstnamephonetic', '', NULL),
(1024, 2, 1524840113, 'auth_db', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1025, 2, 1524840113, 'auth_db', 'field_updateremote_firstnamephonetic', '0', NULL),
(1026, 2, 1524840113, 'auth_db', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1027, 2, 1524840113, 'auth_db', 'field_map_lastnamephonetic', '', NULL),
(1028, 2, 1524840113, 'auth_db', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1029, 2, 1524840113, 'auth_db', 'field_updateremote_lastnamephonetic', '0', NULL),
(1030, 2, 1524840113, 'auth_db', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1031, 2, 1524840113, 'auth_db', 'field_map_middlename', '', NULL),
(1032, 2, 1524840113, 'auth_db', 'field_updatelocal_middlename', 'oncreate', NULL),
(1033, 2, 1524840114, 'auth_db', 'field_updateremote_middlename', '0', NULL),
(1034, 2, 1524840114, 'auth_db', 'field_lock_middlename', 'unlocked', NULL),
(1035, 2, 1524840114, 'auth_db', 'field_map_alternatename', '', NULL),
(1036, 2, 1524840114, 'auth_db', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1037, 2, 1524840114, 'auth_db', 'field_updateremote_alternatename', '0', NULL),
(1038, 2, 1524840114, 'auth_db', 'field_lock_alternatename', 'unlocked', NULL),
(1039, 2, 1524840114, 'auth_ldap', 'field_map_firstname', '', NULL),
(1040, 2, 1524840114, 'auth_ldap', 'field_updatelocal_firstname', 'oncreate', NULL),
(1041, 2, 1524840114, 'auth_ldap', 'field_updateremote_firstname', '0', NULL),
(1042, 2, 1524840114, 'auth_ldap', 'field_lock_firstname', 'unlocked', NULL),
(1043, 2, 1524840114, 'auth_ldap', 'field_map_lastname', '', NULL),
(1044, 2, 1524840114, 'auth_ldap', 'field_updatelocal_lastname', 'oncreate', NULL),
(1045, 2, 1524840114, 'auth_ldap', 'field_updateremote_lastname', '0', NULL),
(1046, 2, 1524840114, 'auth_ldap', 'field_lock_lastname', 'unlocked', NULL),
(1047, 2, 1524840114, 'auth_ldap', 'field_map_email', '', NULL),
(1048, 2, 1524840114, 'auth_ldap', 'field_updatelocal_email', 'oncreate', NULL),
(1049, 2, 1524840114, 'auth_ldap', 'field_updateremote_email', '0', NULL),
(1050, 2, 1524840114, 'auth_ldap', 'field_lock_email', 'unlocked', NULL),
(1051, 2, 1524840114, 'auth_ldap', 'field_map_city', '', NULL),
(1052, 2, 1524840114, 'auth_ldap', 'field_updatelocal_city', 'oncreate', NULL),
(1053, 2, 1524840114, 'auth_ldap', 'field_updateremote_city', '0', NULL),
(1054, 2, 1524840114, 'auth_ldap', 'field_lock_city', 'unlocked', NULL),
(1055, 2, 1524840114, 'auth_ldap', 'field_map_country', '', NULL),
(1056, 2, 1524840114, 'auth_ldap', 'field_updatelocal_country', 'oncreate', NULL),
(1057, 2, 1524840114, 'auth_ldap', 'field_updateremote_country', '0', NULL),
(1058, 2, 1524840114, 'auth_ldap', 'field_lock_country', 'unlocked', NULL),
(1059, 2, 1524840114, 'auth_ldap', 'field_map_lang', '', NULL),
(1060, 2, 1524840114, 'auth_ldap', 'field_updatelocal_lang', 'oncreate', NULL),
(1061, 2, 1524840114, 'auth_ldap', 'field_updateremote_lang', '0', NULL),
(1062, 2, 1524840114, 'auth_ldap', 'field_lock_lang', 'unlocked', NULL),
(1063, 2, 1524840114, 'auth_ldap', 'field_map_description', '', NULL),
(1064, 2, 1524840114, 'auth_ldap', 'field_updatelocal_description', 'oncreate', NULL),
(1065, 2, 1524840114, 'auth_ldap', 'field_updateremote_description', '0', NULL),
(1066, 2, 1524840114, 'auth_ldap', 'field_lock_description', 'unlocked', NULL),
(1067, 2, 1524840114, 'auth_ldap', 'field_map_url', '', NULL),
(1068, 2, 1524840114, 'auth_ldap', 'field_updatelocal_url', 'oncreate', NULL),
(1069, 2, 1524840114, 'auth_ldap', 'field_updateremote_url', '0', NULL),
(1070, 2, 1524840114, 'auth_ldap', 'field_lock_url', 'unlocked', NULL),
(1071, 2, 1524840114, 'auth_ldap', 'field_map_idnumber', '', NULL),
(1072, 2, 1524840114, 'auth_ldap', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1073, 2, 1524840114, 'auth_ldap', 'field_updateremote_idnumber', '0', NULL),
(1074, 2, 1524840114, 'auth_ldap', 'field_lock_idnumber', 'unlocked', NULL),
(1075, 2, 1524840114, 'auth_ldap', 'field_map_institution', '', NULL),
(1076, 2, 1524840114, 'auth_ldap', 'field_updatelocal_institution', 'oncreate', NULL),
(1077, 2, 1524840114, 'auth_ldap', 'field_updateremote_institution', '0', NULL),
(1078, 2, 1524840114, 'auth_ldap', 'field_lock_institution', 'unlocked', NULL),
(1079, 2, 1524840114, 'auth_ldap', 'field_map_department', '', NULL),
(1080, 2, 1524840114, 'auth_ldap', 'field_updatelocal_department', 'oncreate', NULL),
(1081, 2, 1524840114, 'auth_ldap', 'field_updateremote_department', '0', NULL),
(1082, 2, 1524840114, 'auth_ldap', 'field_lock_department', 'unlocked', NULL),
(1083, 2, 1524840114, 'auth_ldap', 'field_map_phone1', '', NULL),
(1084, 2, 1524840114, 'auth_ldap', 'field_updatelocal_phone1', 'oncreate', NULL),
(1085, 2, 1524840114, 'auth_ldap', 'field_updateremote_phone1', '0', NULL),
(1086, 2, 1524840114, 'auth_ldap', 'field_lock_phone1', 'unlocked', NULL),
(1087, 2, 1524840114, 'auth_ldap', 'field_map_phone2', '', NULL),
(1088, 2, 1524840114, 'auth_ldap', 'field_updatelocal_phone2', 'oncreate', NULL),
(1089, 2, 1524840114, 'auth_ldap', 'field_updateremote_phone2', '0', NULL),
(1090, 2, 1524840114, 'auth_ldap', 'field_lock_phone2', 'unlocked', NULL),
(1091, 2, 1524840114, 'auth_ldap', 'field_map_address', '', NULL),
(1092, 2, 1524840114, 'auth_ldap', 'field_updatelocal_address', 'oncreate', NULL),
(1093, 2, 1524840114, 'auth_ldap', 'field_updateremote_address', '0', NULL),
(1094, 2, 1524840114, 'auth_ldap', 'field_lock_address', 'unlocked', NULL),
(1095, 2, 1524840114, 'auth_ldap', 'field_map_firstnamephonetic', '', NULL),
(1096, 2, 1524840114, 'auth_ldap', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1097, 2, 1524840114, 'auth_ldap', 'field_updateremote_firstnamephonetic', '0', NULL),
(1098, 2, 1524840114, 'auth_ldap', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1099, 2, 1524840114, 'auth_ldap', 'field_map_lastnamephonetic', '', NULL),
(1100, 2, 1524840114, 'auth_ldap', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1101, 2, 1524840115, 'auth_ldap', 'field_updateremote_lastnamephonetic', '0', NULL),
(1102, 2, 1524840115, 'auth_ldap', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1103, 2, 1524840115, 'auth_ldap', 'field_map_middlename', '', NULL),
(1104, 2, 1524840115, 'auth_ldap', 'field_updatelocal_middlename', 'oncreate', NULL),
(1105, 2, 1524840115, 'auth_ldap', 'field_updateremote_middlename', '0', NULL),
(1106, 2, 1524840115, 'auth_ldap', 'field_lock_middlename', 'unlocked', NULL),
(1107, 2, 1524840115, 'auth_ldap', 'field_map_alternatename', '', NULL),
(1108, 2, 1524840115, 'auth_ldap', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1109, 2, 1524840115, 'auth_ldap', 'field_updateremote_alternatename', '0', NULL),
(1110, 2, 1524840115, 'auth_ldap', 'field_lock_alternatename', 'unlocked', NULL),
(1111, 2, 1524840115, 'auth_manual', 'expiration', '0', NULL),
(1112, 2, 1524840115, 'auth_manual', 'expirationtime', '30', NULL),
(1113, 2, 1524840115, 'auth_manual', 'expiration_warning', '0', NULL),
(1114, 2, 1524840115, 'auth_manual', 'field_lock_firstname', 'unlocked', NULL),
(1115, 2, 1524840115, 'auth_manual', 'field_lock_lastname', 'unlocked', NULL),
(1116, 2, 1524840115, 'auth_manual', 'field_lock_email', 'unlocked', NULL),
(1117, 2, 1524840115, 'auth_manual', 'field_lock_city', 'unlocked', NULL),
(1118, 2, 1524840115, 'auth_manual', 'field_lock_country', 'unlocked', NULL),
(1119, 2, 1524840115, 'auth_manual', 'field_lock_lang', 'unlocked', NULL),
(1120, 2, 1524840115, 'auth_manual', 'field_lock_description', 'unlocked', NULL),
(1121, 2, 1524840115, 'auth_manual', 'field_lock_url', 'unlocked', NULL),
(1122, 2, 1524840115, 'auth_manual', 'field_lock_idnumber', 'unlocked', NULL),
(1123, 2, 1524840115, 'auth_manual', 'field_lock_institution', 'unlocked', NULL),
(1124, 2, 1524840115, 'auth_manual', 'field_lock_department', 'unlocked', NULL),
(1125, 2, 1524840115, 'auth_manual', 'field_lock_phone1', 'unlocked', NULL),
(1126, 2, 1524840115, 'auth_manual', 'field_lock_phone2', 'unlocked', NULL),
(1127, 2, 1524840115, 'auth_manual', 'field_lock_address', 'unlocked', NULL),
(1128, 2, 1524840115, 'auth_manual', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1129, 2, 1524840115, 'auth_manual', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1130, 2, 1524840115, 'auth_manual', 'field_lock_middlename', 'unlocked', NULL),
(1131, 2, 1524840115, 'auth_manual', 'field_lock_alternatename', 'unlocked', NULL),
(1132, 2, 1524840115, 'auth_mnet', 'rpc_negotiation_timeout', '30', NULL),
(1133, 2, 1524840115, 'auth_none', 'field_lock_firstname', 'unlocked', NULL),
(1134, 2, 1524840115, 'auth_none', 'field_lock_lastname', 'unlocked', NULL),
(1135, 2, 1524840115, 'auth_none', 'field_lock_email', 'unlocked', NULL),
(1136, 2, 1524840115, 'auth_none', 'field_lock_city', 'unlocked', NULL),
(1137, 2, 1524840115, 'auth_none', 'field_lock_country', 'unlocked', NULL),
(1138, 2, 1524840115, 'auth_none', 'field_lock_lang', 'unlocked', NULL),
(1139, 2, 1524840115, 'auth_none', 'field_lock_description', 'unlocked', NULL),
(1140, 2, 1524840115, 'auth_none', 'field_lock_url', 'unlocked', NULL),
(1141, 2, 1524840115, 'auth_none', 'field_lock_idnumber', 'unlocked', NULL),
(1142, 2, 1524840115, 'auth_none', 'field_lock_institution', 'unlocked', NULL),
(1143, 2, 1524840115, 'auth_none', 'field_lock_department', 'unlocked', NULL),
(1144, 2, 1524840115, 'auth_none', 'field_lock_phone1', 'unlocked', NULL),
(1145, 2, 1524840115, 'auth_none', 'field_lock_phone2', 'unlocked', NULL),
(1146, 2, 1524840115, 'auth_none', 'field_lock_address', 'unlocked', NULL),
(1147, 2, 1524840115, 'auth_none', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1148, 2, 1524840115, 'auth_none', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1149, 2, 1524840115, 'auth_none', 'field_lock_middlename', 'unlocked', NULL),
(1150, 2, 1524840115, 'auth_none', 'field_lock_alternatename', 'unlocked', NULL),
(1151, 2, 1524840115, 'auth_oauth2', 'field_lock_firstname', 'unlocked', NULL),
(1152, 2, 1524840115, 'auth_oauth2', 'field_lock_lastname', 'unlocked', NULL),
(1153, 2, 1524840115, 'auth_oauth2', 'field_lock_email', 'unlocked', NULL),
(1154, 2, 1524840115, 'auth_oauth2', 'field_lock_city', 'unlocked', NULL),
(1155, 2, 1524840115, 'auth_oauth2', 'field_lock_country', 'unlocked', NULL),
(1156, 2, 1524840115, 'auth_oauth2', 'field_lock_lang', 'unlocked', NULL),
(1157, 2, 1524840115, 'auth_oauth2', 'field_lock_description', 'unlocked', NULL),
(1158, 2, 1524840115, 'auth_oauth2', 'field_lock_url', 'unlocked', NULL),
(1159, 2, 1524840115, 'auth_oauth2', 'field_lock_idnumber', 'unlocked', NULL),
(1160, 2, 1524840115, 'auth_oauth2', 'field_lock_institution', 'unlocked', NULL),
(1161, 2, 1524840115, 'auth_oauth2', 'field_lock_department', 'unlocked', NULL),
(1162, 2, 1524840115, 'auth_oauth2', 'field_lock_phone1', 'unlocked', NULL),
(1163, 2, 1524840115, 'auth_oauth2', 'field_lock_phone2', 'unlocked', NULL),
(1164, 2, 1524840115, 'auth_oauth2', 'field_lock_address', 'unlocked', NULL),
(1165, 2, 1524840115, 'auth_oauth2', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1166, 2, 1524840115, 'auth_oauth2', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1167, 2, 1524840115, 'auth_oauth2', 'field_lock_middlename', 'unlocked', NULL),
(1168, 2, 1524840115, 'auth_oauth2', 'field_lock_alternatename', 'unlocked', NULL),
(1169, 2, 1524840115, 'auth_shibboleth', 'user_attribute', '', NULL),
(1170, 2, 1524840115, 'auth_shibboleth', 'convert_data', '', NULL),
(1171, 2, 1524840115, 'auth_shibboleth', 'alt_login', 'off', NULL),
(1172, 2, 1524840115, 'auth_shibboleth', 'organization_selection', 'urn:mace:organization1:providerID, Example Organization 1\n        https://another.idp-id.com/shibboleth, Other Example Organization, /Shibboleth.sso/DS/SWITCHaai\n        urn:mace:organization2:providerID, Example Organization 2, /Shibboleth.sso/WAYF/SWITCHaai', NULL),
(1173, 2, 1524840115, 'auth_shibboleth', 'logout_handler', '', NULL),
(1174, 2, 1524840116, 'auth_shibboleth', 'logout_return_url', '', NULL),
(1175, 2, 1524840116, 'auth_shibboleth', 'login_name', 'Shibboleth Login', NULL),
(1176, 2, 1524840116, 'auth_shibboleth', 'auth_instructions', 'Use the <a href="http://localhost/SchoolSystem/auth/shibboleth/index.php">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.', NULL),
(1177, 2, 1524840116, 'auth_shibboleth', 'changepasswordurl', '', NULL),
(1178, 2, 1524840116, 'auth_shibboleth', 'field_map_firstname', '', NULL),
(1179, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_firstname', 'oncreate', NULL),
(1180, 2, 1524840116, 'auth_shibboleth', 'field_lock_firstname', 'unlocked', NULL),
(1181, 2, 1524840116, 'auth_shibboleth', 'field_map_lastname', '', NULL),
(1182, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_lastname', 'oncreate', NULL),
(1183, 2, 1524840116, 'auth_shibboleth', 'field_lock_lastname', 'unlocked', NULL),
(1184, 2, 1524840116, 'auth_shibboleth', 'field_map_email', '', NULL),
(1185, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_email', 'oncreate', NULL),
(1186, 2, 1524840116, 'auth_shibboleth', 'field_lock_email', 'unlocked', NULL),
(1187, 2, 1524840116, 'auth_shibboleth', 'field_map_city', '', NULL),
(1188, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_city', 'oncreate', NULL),
(1189, 2, 1524840116, 'auth_shibboleth', 'field_lock_city', 'unlocked', NULL),
(1190, 2, 1524840116, 'auth_shibboleth', 'field_map_country', '', NULL),
(1191, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_country', 'oncreate', NULL),
(1192, 2, 1524840116, 'auth_shibboleth', 'field_lock_country', 'unlocked', NULL),
(1193, 2, 1524840116, 'auth_shibboleth', 'field_map_lang', '', NULL),
(1194, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_lang', 'oncreate', NULL),
(1195, 2, 1524840116, 'auth_shibboleth', 'field_lock_lang', 'unlocked', NULL),
(1196, 2, 1524840116, 'auth_shibboleth', 'field_map_description', '', NULL),
(1197, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_description', 'oncreate', NULL),
(1198, 2, 1524840116, 'auth_shibboleth', 'field_lock_description', 'unlocked', NULL),
(1199, 2, 1524840116, 'auth_shibboleth', 'field_map_url', '', NULL),
(1200, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_url', 'oncreate', NULL),
(1201, 2, 1524840116, 'auth_shibboleth', 'field_lock_url', 'unlocked', NULL),
(1202, 2, 1524840116, 'auth_shibboleth', 'field_map_idnumber', '', NULL),
(1203, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1204, 2, 1524840116, 'auth_shibboleth', 'field_lock_idnumber', 'unlocked', NULL),
(1205, 2, 1524840116, 'auth_shibboleth', 'field_map_institution', '', NULL),
(1206, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_institution', 'oncreate', NULL),
(1207, 2, 1524840116, 'auth_shibboleth', 'field_lock_institution', 'unlocked', NULL),
(1208, 2, 1524840116, 'auth_shibboleth', 'field_map_department', '', NULL),
(1209, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_department', 'oncreate', NULL),
(1210, 2, 1524840116, 'auth_shibboleth', 'field_lock_department', 'unlocked', NULL),
(1211, 2, 1524840116, 'auth_shibboleth', 'field_map_phone1', '', NULL),
(1212, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_phone1', 'oncreate', NULL),
(1213, 2, 1524840116, 'auth_shibboleth', 'field_lock_phone1', 'unlocked', NULL),
(1214, 2, 1524840116, 'auth_shibboleth', 'field_map_phone2', '', NULL),
(1215, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_phone2', 'oncreate', NULL),
(1216, 2, 1524840116, 'auth_shibboleth', 'field_lock_phone2', 'unlocked', NULL),
(1217, 2, 1524840116, 'auth_shibboleth', 'field_map_address', '', NULL),
(1218, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_address', 'oncreate', NULL),
(1219, 2, 1524840116, 'auth_shibboleth', 'field_lock_address', 'unlocked', NULL),
(1220, 2, 1524840116, 'auth_shibboleth', 'field_map_firstnamephonetic', '', NULL),
(1221, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1222, 2, 1524840116, 'auth_shibboleth', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1223, 2, 1524840116, 'auth_shibboleth', 'field_map_lastnamephonetic', '', NULL),
(1224, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1225, 2, 1524840116, 'auth_shibboleth', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1226, 2, 1524840116, 'auth_shibboleth', 'field_map_middlename', '', NULL),
(1227, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_middlename', 'oncreate', NULL),
(1228, 2, 1524840116, 'auth_shibboleth', 'field_lock_middlename', 'unlocked', NULL),
(1229, 2, 1524840116, 'auth_shibboleth', 'field_map_alternatename', '', NULL),
(1230, 2, 1524840116, 'auth_shibboleth', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1231, 2, 1524840116, 'auth_shibboleth', 'field_lock_alternatename', 'unlocked', NULL),
(1232, 2, 1524840116, 'block_activity_results', 'config_showbest', '3', NULL),
(1233, 2, 1524840116, 'block_activity_results', 'config_showbest_locked', '', NULL),
(1234, 2, 1524840116, 'block_activity_results', 'config_showworst', '0', NULL),
(1235, 2, 1524840116, 'block_activity_results', 'config_showworst_locked', '', NULL),
(1236, 2, 1524840116, 'block_activity_results', 'config_usegroups', '0', NULL),
(1237, 2, 1524840116, 'block_activity_results', 'config_usegroups_locked', '', NULL),
(1238, 2, 1524840116, 'block_activity_results', 'config_nameformat', '1', NULL),
(1239, 2, 1524840116, 'block_activity_results', 'config_nameformat_locked', '', NULL),
(1240, 2, 1524840116, 'block_activity_results', 'config_gradeformat', '1', NULL),
(1241, 2, 1524840116, 'block_activity_results', 'config_gradeformat_locked', '', NULL),
(1242, 2, 1524840116, 'block_activity_results', 'config_decimalpoints', '2', NULL),
(1243, 2, 1524840116, 'block_activity_results', 'config_decimalpoints_locked', '', NULL),
(1244, 2, 1524840116, 'block_myoverview', 'defaulttab', 'timeline', NULL),
(1245, 2, 1524840116, NULL, 'block_course_list_adminview', 'all', NULL),
(1246, 2, 1524840117, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(1247, 2, 1524840117, NULL, 'block_html_allowcssclasses', '0', NULL),
(1248, 2, 1524840117, NULL, 'block_online_users_timetosee', '5', NULL),
(1249, 2, 1524840117, NULL, 'block_rss_client_num_entries', '5', NULL),
(1250, 2, 1524840117, NULL, 'block_rss_client_timeout', '30', NULL),
(1251, 2, 1524840117, 'block_section_links', 'numsections1', '22', NULL),
(1252, 2, 1524840117, 'block_section_links', 'incby1', '2', NULL),
(1253, 2, 1524840117, 'block_section_links', 'numsections2', '40', NULL),
(1254, 2, 1524840117, 'block_section_links', 'incby2', '5', NULL),
(1255, 2, 1524840117, 'block_tag_youtube', 'apikey', '', NULL),
(1256, 2, 1524840117, 'format_singleactivity', 'activitytype', 'forum', NULL),
(1257, 2, 1524840117, 'fileconverter_googledrive', 'issuerid', '', NULL),
(1258, 2, 1524840117, NULL, 'pathtounoconv', '/usr/bin/unoconv', NULL),
(1259, 2, 1524840117, 'enrol_cohort', 'roleid', '5', NULL),
(1260, 2, 1524840117, 'enrol_cohort', 'unenrolaction', '0', NULL),
(1261, 2, 1524840117, 'enrol_meta', 'nosyncroleids', '', NULL),
(1262, 2, 1524840117, 'enrol_meta', 'syncall', '1', NULL),
(1263, 2, 1524840117, 'enrol_meta', 'unenrolaction', '3', NULL),
(1264, 2, 1524840117, 'enrol_meta', 'coursesort', 'sortorder', NULL),
(1265, 2, 1524840117, 'enrol_database', 'dbtype', '', NULL),
(1266, 2, 1524840117, 'enrol_database', 'dbhost', 'localhost', NULL),
(1267, 2, 1524840117, 'enrol_database', 'dbuser', '', NULL),
(1268, 2, 1524840117, 'enrol_database', 'dbpass', '', NULL),
(1269, 2, 1524840117, 'enrol_database', 'dbname', '', NULL),
(1270, 2, 1524840117, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(1271, 2, 1524840117, 'enrol_database', 'dbsetupsql', '', NULL),
(1272, 2, 1524840117, 'enrol_database', 'dbsybasequoting', '0', NULL),
(1273, 2, 1524840117, 'enrol_database', 'debugdb', '0', NULL),
(1274, 2, 1524840117, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(1275, 2, 1524840117, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(1276, 2, 1524840117, 'enrol_database', 'localrolefield', 'shortname', NULL),
(1277, 2, 1524840117, 'enrol_database', 'localcategoryfield', 'id', NULL),
(1278, 2, 1524840117, 'enrol_database', 'remoteenroltable', '', NULL),
(1279, 2, 1524840117, 'enrol_database', 'remotecoursefield', '', NULL),
(1280, 2, 1524840117, 'enrol_database', 'remoteuserfield', '', NULL),
(1281, 2, 1524840117, 'enrol_database', 'remoterolefield', '', NULL),
(1282, 2, 1524840117, 'enrol_database', 'remoteotheruserfield', '', NULL),
(1283, 2, 1524840117, 'enrol_database', 'defaultrole', '5', NULL),
(1284, 2, 1524840117, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(1285, 2, 1524840117, 'enrol_database', 'unenrolaction', '0', NULL),
(1286, 2, 1524840117, 'enrol_database', 'newcoursetable', '', NULL),
(1287, 2, 1524840117, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(1288, 2, 1524840117, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(1289, 2, 1524840117, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(1290, 2, 1524840117, 'enrol_database', 'newcoursecategory', '', NULL),
(1291, 2, 1524840117, 'enrol_database', 'defaultcategory', '1', NULL),
(1292, 2, 1524840117, 'enrol_database', 'templatecourse', '', NULL),
(1293, 2, 1524840117, 'enrol_flatfile', 'location', '', NULL),
(1294, 2, 1524840117, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(1295, 2, 1524840117, 'enrol_flatfile', 'mailstudents', '0', NULL),
(1296, 2, 1524840117, 'enrol_flatfile', 'mailteachers', '0', NULL),
(1297, 2, 1524840117, 'enrol_flatfile', 'mailadmins', '0', NULL),
(1298, 2, 1524840117, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(1299, 2, 1524840117, 'enrol_flatfile', 'expiredaction', '3', NULL),
(1300, 2, 1524840117, 'enrol_guest', 'requirepassword', '0', NULL),
(1301, 2, 1524840117, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(1302, 2, 1524840117, 'enrol_guest', 'showhint', '0', NULL),
(1303, 2, 1524840117, 'enrol_guest', 'defaultenrol', '1', NULL),
(1304, 2, 1524840117, 'enrol_guest', 'status', '1', NULL),
(1305, 2, 1524840117, 'enrol_guest', 'status_adv', '', NULL),
(1306, 2, 1524840117, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(1307, 2, 1524840117, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(1308, 2, 1524840117, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(1309, 2, 1524840117, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(1310, 2, 1524840117, 'enrol_imsenterprise', 'imsupdateusers', '0', NULL),
(1311, 2, 1524840117, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(1312, 2, 1524840118, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(1313, 2, 1524840118, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(1314, 2, 1524840118, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(1315, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(1316, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(1317, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(1318, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(1319, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(1320, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(1321, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(1322, 2, 1524840118, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(1323, 2, 1524840118, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(1324, 2, 1524840118, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(1325, 2, 1524840118, 'enrol_imsenterprise', 'updatecourses', '0', NULL),
(1326, 2, 1524840118, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(1327, 2, 1524840118, 'enrol_imsenterprise', 'nestedcategories', '0', NULL),
(1328, 2, 1524840118, 'enrol_imsenterprise', 'categoryidnumber', '0', NULL),
(1329, 2, 1524840118, 'enrol_imsenterprise', 'categoryseparator', '', NULL),
(1330, 2, 1524840118, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(1331, 2, 1524840118, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(1332, 2, 1524840118, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(1333, 2, 1524840118, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(1334, 2, 1524840118, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(1335, 2, 1524840118, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(1336, 2, 1524840118, 'enrol_manual', 'expiredaction', '1', NULL),
(1337, 2, 1524840118, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(1338, 2, 1524840118, 'enrol_manual', 'defaultenrol', '1', NULL),
(1339, 2, 1524840118, 'enrol_manual', 'status', '0', NULL),
(1340, 2, 1524840118, 'enrol_manual', 'roleid', '5', NULL),
(1341, 2, 1524840118, 'enrol_manual', 'enrolstart', '4', NULL),
(1342, 2, 1524840118, 'enrol_manual', 'enrolperiod', '0', NULL),
(1343, 2, 1524840118, 'enrol_manual', 'expirynotify', '0', NULL),
(1344, 2, 1524840118, 'enrol_manual', 'expirythreshold', '86400', NULL),
(1345, 2, 1524840118, 'enrol_mnet', 'roleid', '5', NULL),
(1346, 2, 1524840118, 'enrol_mnet', 'roleid_adv', '1', NULL),
(1347, 2, 1524840118, 'enrol_paypal', 'paypalbusiness', '', NULL),
(1348, 2, 1524840118, 'enrol_paypal', 'mailstudents', '0', NULL),
(1349, 2, 1524840118, 'enrol_paypal', 'mailteachers', '0', NULL),
(1350, 2, 1524840118, 'enrol_paypal', 'mailadmins', '0', NULL),
(1351, 2, 1524840118, 'enrol_paypal', 'expiredaction', '3', NULL),
(1352, 2, 1524840118, 'enrol_paypal', 'status', '1', NULL),
(1353, 2, 1524840118, 'enrol_paypal', 'cost', '0', NULL),
(1354, 2, 1524840118, 'enrol_paypal', 'currency', 'USD', NULL),
(1355, 2, 1524840118, 'enrol_paypal', 'roleid', '5', NULL),
(1356, 2, 1524840118, 'enrol_paypal', 'enrolperiod', '0', NULL),
(1357, 2, 1524840118, 'enrol_lti', 'emaildisplay', '2', NULL),
(1358, 2, 1524840118, 'enrol_lti', 'city', '', NULL),
(1359, 2, 1524840118, 'enrol_lti', 'country', '', NULL),
(1360, 2, 1524840118, 'enrol_lti', 'timezone', '99', NULL),
(1361, 2, 1524840118, 'enrol_lti', 'lang', 'en', NULL),
(1362, 2, 1524840118, 'enrol_lti', 'institution', '', NULL),
(1363, 2, 1524840118, 'enrol_self', 'requirepassword', '0', NULL),
(1364, 2, 1524840118, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(1365, 2, 1524840118, 'enrol_self', 'showhint', '0', NULL),
(1366, 2, 1524840118, 'enrol_self', 'expiredaction', '1', NULL),
(1367, 2, 1524840118, 'enrol_self', 'expirynotifyhour', '6', NULL),
(1368, 2, 1524840118, 'enrol_self', 'defaultenrol', '1', NULL),
(1369, 2, 1524840118, 'enrol_self', 'status', '1', NULL),
(1370, 2, 1524840118, 'enrol_self', 'newenrols', '1', NULL),
(1371, 2, 1524840118, 'enrol_self', 'groupkey', '0', NULL),
(1372, 2, 1524840118, 'enrol_self', 'roleid', '5', NULL),
(1373, 2, 1524840118, 'enrol_self', 'enrolperiod', '0', NULL),
(1374, 2, 1524840118, 'enrol_self', 'expirynotify', '0', NULL),
(1375, 2, 1524840118, 'enrol_self', 'expirythreshold', '86400', NULL),
(1376, 2, 1524840118, 'enrol_self', 'longtimenosee', '0', NULL),
(1377, 2, 1524840118, 'enrol_self', 'maxenrolled', '0', NULL),
(1378, 2, 1524840118, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(1379, 2, 1524840118, 'filter_urltolink', 'formats', '0', NULL),
(1380, 2, 1524840118, 'filter_urltolink', 'embedimages', '1', NULL),
(1381, 2, 1524840118, 'filter_emoticon', 'formats', '1,4,0', NULL),
(1382, 2, 1524840119, 'filter_mathjaxloader', 'httpsurl', 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js', NULL),
(1383, 2, 1524840119, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
(1384, 2, 1524840119, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n', NULL),
(1385, 2, 1524840119, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
(1386, 2, 1524840119, NULL, 'filter_multilang_force_old', '0', NULL),
(1387, 2, 1524840119, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(1388, 2, 1524840119, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
(1389, 2, 1524840119, 'filter_tex', 'density', '120', NULL),
(1390, 2, 1524840119, 'filter_tex', 'pathlatex', '/usr/bin/latex', NULL),
(1391, 2, 1524840119, 'filter_tex', 'pathdvips', '/usr/bin/dvips', NULL),
(1392, 2, 1524840119, 'filter_tex', 'pathconvert', '/usr/bin/convert', NULL),
(1393, 2, 1524840119, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm', NULL),
(1394, 2, 1524840119, 'filter_tex', 'pathmimetex', '', NULL),
(1395, 2, 1524840119, 'filter_tex', 'convertformat', 'gif', NULL),
(1396, 2, 1524840119, NULL, 'filter_censor_badwords', '', NULL),
(1397, 2, 1524840119, 'logstore_database', 'dbdriver', '', NULL),
(1398, 2, 1524840119, 'logstore_database', 'dbhost', '', NULL),
(1399, 2, 1524840119, 'logstore_database', 'dbuser', '', NULL),
(1400, 2, 1524840119, 'logstore_database', 'dbpass', '', NULL),
(1401, 2, 1524840119, 'logstore_database', 'dbname', '', NULL),
(1402, 2, 1524840119, 'logstore_database', 'dbtable', '', NULL),
(1403, 2, 1524840119, 'logstore_database', 'dbpersist', '0', NULL),
(1404, 2, 1524840119, 'logstore_database', 'dbsocket', '', NULL),
(1405, 2, 1524840119, 'logstore_database', 'dbport', '', NULL),
(1406, 2, 1524840119, 'logstore_database', 'dbschema', '', NULL),
(1407, 2, 1524840119, 'logstore_database', 'dbcollation', '', NULL),
(1408, 2, 1524840119, 'logstore_database', 'dbhandlesoptions', '0', NULL),
(1409, 2, 1524840119, 'logstore_database', 'buffersize', '50', NULL),
(1410, 2, 1524840119, 'logstore_database', 'logguests', '0', NULL),
(1411, 2, 1524840119, 'logstore_database', 'includelevels', '1,2,0', NULL),
(1412, 2, 1524840119, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
(1413, 2, 1524840119, 'logstore_legacy', 'loglegacy', '0', NULL),
(1414, 2, 1524840119, NULL, 'logguests', '1', NULL),
(1415, 2, 1524840119, NULL, 'loglifetime', '0', NULL),
(1416, 2, 1524840119, 'logstore_standard', 'logguests', '1', NULL),
(1417, 2, 1524840119, 'logstore_standard', 'loglifetime', '0', NULL),
(1418, 2, 1524840119, 'logstore_standard', 'buffersize', '50', NULL),
(1419, 2, 1524840119, 'media_videojs', 'videoextensions', 'html_video,.f4v,.flv', NULL),
(1420, 2, 1524840119, 'media_videojs', 'audioextensions', 'html_audio', NULL),
(1421, 2, 1524840119, 'media_videojs', 'useflash', '0', NULL),
(1422, 2, 1524840119, 'media_videojs', 'youtube', '1', NULL),
(1423, 2, 1524840119, 'media_videojs', 'videocssclass', 'video-js', NULL),
(1424, 2, 1524840119, 'media_videojs', 'audiocssclass', 'video-js', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1425, 2, 1524840119, 'media_videojs', 'limitsize', '1', NULL),
(1426, 2, 1524840119, NULL, 'jabberhost', '', NULL),
(1427, 2, 1524840119, NULL, 'jabberserver', '', NULL),
(1428, 2, 1524840119, NULL, 'jabberusername', '', NULL),
(1429, 2, 1524840119, NULL, 'jabberpassword', '', NULL),
(1430, 2, 1524840119, NULL, 'jabberport', '5222', NULL),
(1431, 2, 1524840119, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
(1432, 2, 1524840119, NULL, 'airnotifierport', '443', NULL),
(1433, 2, 1524840119, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
(1434, 2, 1524840119, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
(1435, 2, 1524840119, NULL, 'airnotifieraccesskey', '', NULL),
(1436, 2, 1524840119, 'qtype_multichoice', 'answerhowmany', '1', NULL),
(1437, 2, 1524840119, 'qtype_multichoice', 'shuffleanswers', '1', NULL),
(1438, 2, 1524840119, 'qtype_multichoice', 'answernumbering', 'abc', NULL),
(1439, 2, 1524840119, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html', NULL),
(1440, 2, 1524840119, 'editor_atto', 'autosavefrequency', '60', NULL),
(1441, 2, 1524840119, 'atto_collapse', 'showgroups', '5', NULL),
(1442, 2, 1524840119, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n', NULL),
(1443, 2, 1524840119, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n', NULL),
(1444, 2, 1524840119, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n', NULL),
(1445, 2, 1524840119, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n', NULL),
(1446, 2, 1524840119, 'atto_table', 'allowborders', '0', NULL),
(1447, 2, 1524840119, 'atto_table', 'allowbackgroundcolour', '0', NULL),
(1448, 2, 1524840119, 'atto_table', 'allowwidth', '0', NULL),
(1449, 2, 1524840120, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(1450, 2, 1524840120, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(1451, 2, 1524840120, 'editor_tinymce', 'customconfig', '', NULL),
(1452, 2, 1524840120, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(1453, 2, 1524840120, 'tinymce_spellchecker', 'spellengine', '', NULL),
(1454, 2, 1524840120, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(1455, 2, 1524840120, NULL, 'sitepolicyhandler', '', NULL),
(1456, 2, 1524840120, NULL, 'profileroles', '5,4,3', NULL),
(1457, 2, 1524840120, NULL, 'coursecontact', '3', NULL),
(1458, 2, 1524840120, NULL, 'frontpage', '6', NULL),
(1459, 2, 1524840120, NULL, 'frontpageloggedin', '6', NULL),
(1460, 2, 1524840120, NULL, 'maxcategorydepth', '2', NULL),
(1461, 2, 1524840120, NULL, 'frontpagecourselimit', '200', NULL),
(1462, 2, 1524840120, NULL, 'commentsperpage', '15', NULL),
(1463, 2, 1524840120, NULL, 'defaultfrontpageroleid', '8', NULL),
(1464, 2, 1524840120, NULL, 'messageinbound_enabled', '0', NULL),
(1465, 2, 1524840120, NULL, 'messageinbound_mailbox', '', NULL),
(1466, 2, 1524840120, NULL, 'messageinbound_domain', '', NULL),
(1467, 2, 1524840120, NULL, 'messageinbound_host', '', NULL),
(1468, 2, 1524840120, NULL, 'messageinbound_hostssl', 'ssl', NULL),
(1469, 2, 1524840120, NULL, 'messageinbound_hostuser', '', NULL),
(1470, 2, 1524840120, NULL, 'messageinbound_hostpass', '', NULL),
(1471, 2, 1524840120, NULL, 'enablemobilewebservice', '0', NULL),
(1472, 2, 1524840176, NULL, 'timezone', 'America/Guatemala', NULL),
(1473, 2, 1524840176, NULL, 'registerauth', '', NULL),
(1474, 2, 1524840243, NULL, 'noreplyaddress', 'codificandoideas@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Moodle modules and plugins configuration variables' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'question', 'multichoice_sortorder', '1'),
(2, 'question', 'truefalse_sortorder', '2'),
(3, 'question', 'match_sortorder', '3'),
(4, 'question', 'shortanswer_sortorder', '4'),
(5, 'question', 'numerical_sortorder', '5'),
(6, 'question', 'essay_sortorder', '6'),
(7, 'moodlecourse', 'visible', '1'),
(8, 'moodlecourse', 'format', 'topics'),
(9, 'moodlecourse', 'maxsections', '52'),
(10, 'moodlecourse', 'numsections', '4'),
(11, 'moodlecourse', 'hiddensections', '0'),
(12, 'moodlecourse', 'coursedisplay', '0'),
(13, 'moodlecourse', 'courseenddateenabled', '1'),
(14, 'moodlecourse', 'courseduration', '31536000'),
(15, 'moodlecourse', 'lang', ''),
(16, 'moodlecourse', 'newsitems', '5'),
(17, 'moodlecourse', 'showgrades', '1'),
(18, 'moodlecourse', 'showreports', '0'),
(19, 'moodlecourse', 'maxbytes', '0'),
(20, 'moodlecourse', 'enablecompletion', '1'),
(21, 'moodlecourse', 'groupmode', '0'),
(22, 'moodlecourse', 'groupmodeforce', '0'),
(23, 'backup', 'loglifetime', '30'),
(24, 'backup', 'backup_general_users', '1'),
(25, 'backup', 'backup_general_users_locked', ''),
(26, 'backup', 'backup_general_anonymize', '0'),
(27, 'backup', 'backup_general_anonymize_locked', ''),
(28, 'backup', 'backup_general_role_assignments', '1'),
(29, 'backup', 'backup_general_role_assignments_locked', ''),
(30, 'backup', 'backup_general_activities', '1'),
(31, 'backup', 'backup_general_activities_locked', ''),
(32, 'backup', 'backup_general_blocks', '1'),
(33, 'backup', 'backup_general_blocks_locked', ''),
(34, 'backup', 'backup_general_filters', '1'),
(35, 'backup', 'backup_general_filters_locked', ''),
(36, 'backup', 'backup_general_comments', '1'),
(37, 'backup', 'backup_general_comments_locked', ''),
(38, 'backup', 'backup_general_badges', '1'),
(39, 'backup', 'backup_general_badges_locked', ''),
(40, 'backup', 'backup_general_calendarevents', '1'),
(41, 'backup', 'backup_general_calendarevents_locked', ''),
(42, 'backup', 'backup_general_userscompletion', '1'),
(43, 'backup', 'backup_general_userscompletion_locked', ''),
(44, 'backup', 'backup_general_logs', '0'),
(45, 'backup', 'backup_general_logs_locked', ''),
(46, 'backup', 'backup_general_histories', '0'),
(47, 'backup', 'backup_general_histories_locked', ''),
(48, 'backup', 'backup_general_questionbank', '1'),
(49, 'backup', 'backup_general_questionbank_locked', ''),
(50, 'backup', 'backup_general_groups', '1'),
(51, 'backup', 'backup_general_groups_locked', ''),
(52, 'backup', 'backup_general_competencies', '1'),
(53, 'backup', 'backup_general_competencies_locked', ''),
(54, 'backup', 'import_general_maxresults', '10'),
(55, 'backup', 'import_general_duplicate_admin_allowed', '0'),
(56, 'backup', 'backup_import_activities', '1'),
(57, 'backup', 'backup_import_activities_locked', ''),
(58, 'backup', 'backup_import_blocks', '1'),
(59, 'backup', 'backup_import_blocks_locked', ''),
(60, 'backup', 'backup_import_filters', '1'),
(61, 'backup', 'backup_import_filters_locked', ''),
(62, 'backup', 'backup_import_calendarevents', '1'),
(63, 'backup', 'backup_import_calendarevents_locked', ''),
(64, 'backup', 'backup_import_questionbank', '1'),
(65, 'backup', 'backup_import_questionbank_locked', ''),
(66, 'backup', 'backup_import_groups', '1'),
(67, 'backup', 'backup_import_groups_locked', ''),
(68, 'backup', 'backup_import_competencies', '1'),
(69, 'backup', 'backup_import_competencies_locked', ''),
(70, 'backup', 'backup_auto_active', '0'),
(71, 'backup', 'backup_auto_weekdays', '0000000'),
(72, 'backup', 'backup_auto_hour', '0'),
(73, 'backup', 'backup_auto_minute', '0'),
(74, 'backup', 'backup_auto_storage', '0'),
(75, 'backup', 'backup_auto_destination', ''),
(76, 'backup', 'backup_auto_max_kept', '1'),
(77, 'backup', 'backup_auto_delete_days', '0'),
(78, 'backup', 'backup_auto_min_kept', '0'),
(79, 'backup', 'backup_shortname', '0'),
(80, 'backup', 'backup_auto_skip_hidden', '1'),
(81, 'backup', 'backup_auto_skip_modif_days', '30'),
(82, 'backup', 'backup_auto_skip_modif_prev', '0'),
(83, 'backup', 'backup_auto_users', '1'),
(84, 'backup', 'backup_auto_role_assignments', '1'),
(85, 'backup', 'backup_auto_activities', '1'),
(86, 'backup', 'backup_auto_blocks', '1'),
(87, 'backup', 'backup_auto_filters', '1'),
(88, 'backup', 'backup_auto_comments', '1'),
(89, 'backup', 'backup_auto_badges', '1'),
(90, 'backup', 'backup_auto_calendarevents', '1'),
(91, 'backup', 'backup_auto_userscompletion', '1'),
(92, 'backup', 'backup_auto_logs', '0'),
(93, 'backup', 'backup_auto_histories', '0'),
(94, 'backup', 'backup_auto_questionbank', '1'),
(95, 'backup', 'backup_auto_groups', '1'),
(96, 'backup', 'backup_auto_competencies', '1'),
(97, 'restore', 'restore_general_users', '1'),
(98, 'restore', 'restore_general_users_locked', ''),
(99, 'restore', 'restore_general_enrolments', '1'),
(100, 'restore', 'restore_general_enrolments_locked', ''),
(101, 'restore', 'restore_general_role_assignments', '1'),
(102, 'restore', 'restore_general_role_assignments_locked', ''),
(103, 'restore', 'restore_general_activities', '1'),
(104, 'restore', 'restore_general_activities_locked', ''),
(105, 'restore', 'restore_general_blocks', '1'),
(106, 'restore', 'restore_general_blocks_locked', ''),
(107, 'restore', 'restore_general_filters', '1'),
(108, 'restore', 'restore_general_filters_locked', ''),
(109, 'restore', 'restore_general_comments', '1'),
(110, 'restore', 'restore_general_comments_locked', ''),
(111, 'restore', 'restore_general_badges', '1'),
(112, 'restore', 'restore_general_badges_locked', ''),
(113, 'restore', 'restore_general_calendarevents', '1'),
(114, 'restore', 'restore_general_calendarevents_locked', ''),
(115, 'restore', 'restore_general_userscompletion', '1'),
(116, 'restore', 'restore_general_userscompletion_locked', ''),
(117, 'restore', 'restore_general_logs', '1'),
(118, 'restore', 'restore_general_logs_locked', ''),
(119, 'restore', 'restore_general_histories', '1'),
(120, 'restore', 'restore_general_histories_locked', ''),
(121, 'restore', 'restore_general_groups', '1'),
(122, 'restore', 'restore_general_groups_locked', ''),
(123, 'restore', 'restore_general_competencies', '1'),
(124, 'restore', 'restore_general_competencies_locked', ''),
(125, 'restore', 'restore_merge_overwrite_conf', '0'),
(126, 'restore', 'restore_merge_overwrite_conf_locked', ''),
(127, 'restore', 'restore_merge_course_fullname', '1'),
(128, 'restore', 'restore_merge_course_fullname_locked', ''),
(129, 'restore', 'restore_merge_course_shortname', '1'),
(130, 'restore', 'restore_merge_course_shortname_locked', ''),
(131, 'restore', 'restore_merge_course_startdate', '1'),
(132, 'restore', 'restore_merge_course_startdate_locked', ''),
(133, 'restore', 'restore_replace_overwrite_conf', '0'),
(134, 'restore', 'restore_replace_overwrite_conf_locked', ''),
(135, 'restore', 'restore_replace_course_fullname', '1'),
(136, 'restore', 'restore_replace_course_fullname_locked', ''),
(137, 'restore', 'restore_replace_course_shortname', '1'),
(138, 'restore', 'restore_replace_course_shortname_locked', ''),
(139, 'restore', 'restore_replace_course_startdate', '1'),
(140, 'restore', 'restore_replace_course_startdate_locked', ''),
(141, 'restore', 'restore_replace_keep_roles_and_enrolments', '0'),
(142, 'restore', 'restore_replace_keep_roles_and_enrolments_locked', ''),
(143, 'restore', 'restore_replace_keep_groups_and_groupings', '0'),
(144, 'restore', 'restore_replace_keep_groups_and_groupings_locked', ''),
(145, 'analytics', 'predictionsprocessor', '\\mlbackend_php\\processor'),
(146, 'analytics', 'timesplittings', '\\core\\analytics\\time_splitting\\quarters_accum,\\core\\analytics\\time_splitting\\quarters,\\core\\analytics\\time_splitting\\single_range'),
(147, 'analytics', 'modeloutputdir', '/var/www/data/models'),
(148, 'analytics', 'onlycli', '1'),
(149, 'analytics', 'modeltimelimit', '1200'),
(150, 'core_competency', 'enabled', '1'),
(151, 'core_competency', 'pushcourseratingstouserplans', '1'),
(152, 'cachestore_apcu', 'testperformance', '0'),
(153, 'cachestore_memcache', 'testservers', ''),
(154, 'cachestore_memcached', 'testservers', ''),
(155, 'cachestore_mongodb', 'testserver', ''),
(156, 'cachestore_redis', 'test_server', ''),
(157, 'cachestore_redis', 'test_password', ''),
(158, 'question_preview', 'behaviour', 'deferredfeedback'),
(159, 'question_preview', 'correctness', '1'),
(160, 'question_preview', 'marks', '2'),
(161, 'question_preview', 'markdp', '2'),
(162, 'question_preview', 'feedback', '1'),
(163, 'question_preview', 'generalfeedback', '1'),
(164, 'question_preview', 'rightanswer', '1'),
(165, 'question_preview', 'history', '0'),
(166, 'tool_task', 'enablerunnow', '1'),
(167, 'theme_boost', 'preset', 'default.scss'),
(168, 'theme_boost', 'presetfiles', ''),
(169, 'theme_boost', 'backgroundimage', ''),
(170, 'theme_boost', 'brandcolor', ''),
(171, 'theme_boost', 'scsspre', ''),
(172, 'theme_boost', 'scss', ''),
(173, 'theme_clean', 'invert', '0'),
(174, 'theme_clean', 'logo', ''),
(175, 'theme_clean', 'smalllogo', ''),
(176, 'theme_clean', 'sitename', '1'),
(177, 'theme_clean', 'customcss', ''),
(178, 'theme_clean', 'footnote', ''),
(179, 'theme_more', 'textcolor', '#333366'),
(180, 'theme_more', 'linkcolor', '#FF6500'),
(181, 'theme_more', 'bodybackground', ''),
(182, 'theme_more', 'backgroundimage', ''),
(183, 'theme_more', 'backgroundrepeat', 'repeat'),
(184, 'theme_more', 'backgroundposition', '0'),
(185, 'theme_more', 'backgroundfixed', '0'),
(186, 'theme_more', 'contentbackground', '#FFFFFF'),
(187, 'theme_more', 'secondarybackground', '#FFFFFF'),
(188, 'theme_more', 'invert', '1'),
(189, 'theme_more', 'logo', ''),
(190, 'theme_more', 'smalllogo', ''),
(191, 'theme_more', 'sitename', '1'),
(192, 'theme_more', 'customcss', ''),
(193, 'theme_more', 'footnote', ''),
(194, 'core_admin', 'logo', ''),
(195, 'core_admin', 'logocompact', ''),
(196, 'antivirus_clamav', 'version', '2017111300'),
(197, 'availability_completion', 'version', '2017111300'),
(198, 'availability_date', 'version', '2017111300'),
(199, 'availability_grade', 'version', '2017111300'),
(200, 'availability_group', 'version', '2017111300'),
(201, 'availability_grouping', 'version', '2017111300'),
(202, 'availability_profile', 'version', '2017111300'),
(203, 'qtype_calculated', 'version', '2017111300'),
(204, 'qtype_calculatedmulti', 'version', '2017111300'),
(205, 'qtype_calculatedsimple', 'version', '2017111300'),
(206, 'qtype_ddimageortext', 'version', '2017111300'),
(207, 'qtype_ddmarker', 'version', '2017111300'),
(208, 'qtype_ddwtos', 'version', '2017111300'),
(209, 'qtype_description', 'version', '2017111300'),
(210, 'qtype_essay', 'version', '2017111300'),
(211, 'qtype_gapselect', 'version', '2017111300'),
(212, 'qtype_match', 'version', '2017111300'),
(213, 'qtype_missingtype', 'version', '2017111300'),
(214, 'qtype_multianswer', 'version', '2017111300'),
(215, 'qtype_multichoice', 'version', '2017111300'),
(216, 'qtype_numerical', 'version', '2017111300'),
(217, 'qtype_random', 'version', '2017111300'),
(218, 'qtype_randomsamatch', 'version', '2017111300'),
(219, 'qtype_shortanswer', 'version', '2017111300'),
(220, 'qtype_truefalse', 'version', '2017111300'),
(221, 'mod_assign', 'version', '2017111300'),
(222, 'mod_assignment', 'version', '2017111300'),
(224, 'mod_book', 'version', '2017111300'),
(225, 'mod_chat', 'version', '2017111301'),
(226, 'mod_choice', 'version', '2017111300'),
(227, 'mod_data', 'version', '2017111300'),
(228, 'mod_feedback', 'version', '2017111301'),
(230, 'mod_folder', 'version', '2017111300'),
(232, 'mod_forum', 'version', '2017111300'),
(233, 'mod_glossary', 'version', '2017111300'),
(234, 'mod_imscp', 'version', '2017111300'),
(236, 'mod_label', 'version', '2017111300'),
(237, 'mod_lesson', 'version', '2017111300'),
(238, 'mod_lti', 'version', '2017111301'),
(239, 'mod_page', 'version', '2017111300'),
(241, 'mod_quiz', 'version', '2017111300'),
(242, 'mod_resource', 'version', '2017111300'),
(243, 'mod_scorm', 'version', '2017111300'),
(244, 'mod_survey', 'version', '2017111300'),
(246, 'mod_url', 'version', '2017111300'),
(248, 'mod_wiki', 'version', '2017111300'),
(250, 'mod_workshop', 'version', '2017111300'),
(251, 'auth_cas', 'version', '2017111300'),
(253, 'auth_db', 'version', '2017111300'),
(255, 'auth_email', 'version', '2017111300'),
(256, 'auth_ldap', 'version', '2017111300'),
(258, 'auth_lti', 'version', '2017111300'),
(259, 'auth_manual', 'version', '2017111300'),
(260, 'auth_mnet', 'version', '2017111300'),
(262, 'auth_nologin', 'version', '2017111300'),
(263, 'auth_none', 'version', '2017111300'),
(264, 'auth_oauth2', 'version', '2017111300'),
(265, 'auth_shibboleth', 'version', '2017111300'),
(267, 'auth_webservice', 'version', '2017111300'),
(268, 'calendartype_gregorian', 'version', '2017111300'),
(269, 'enrol_category', 'version', '2017111300'),
(271, 'enrol_cohort', 'version', '2017111300'),
(272, 'enrol_database', 'version', '2017111300'),
(274, 'enrol_flatfile', 'version', '2017111300'),
(276, 'enrol_flatfile', 'map_1', 'manager'),
(277, 'enrol_flatfile', 'map_2', 'coursecreator'),
(278, 'enrol_flatfile', 'map_3', 'editingteacher'),
(279, 'enrol_flatfile', 'map_4', 'teacher'),
(280, 'enrol_flatfile', 'map_5', 'student'),
(281, 'enrol_flatfile', 'map_6', 'guest'),
(282, 'enrol_flatfile', 'map_7', 'user'),
(283, 'enrol_flatfile', 'map_8', 'frontpage'),
(284, 'enrol_guest', 'version', '2017111300'),
(285, 'enrol_imsenterprise', 'version', '2017111300'),
(287, 'enrol_ldap', 'version', '2017111300'),
(289, 'enrol_lti', 'version', '2017111300'),
(290, 'enrol_manual', 'version', '2017111300'),
(292, 'enrol_meta', 'version', '2017111300'),
(294, 'enrol_mnet', 'version', '2017111300'),
(295, 'enrol_paypal', 'version', '2017111300'),
(296, 'enrol_self', 'version', '2017111300'),
(298, 'message_airnotifier', 'version', '2017111300'),
(300, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(301, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(302, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(303, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(304, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(305, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
(306, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(307, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
(308, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
(309, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
(310, 'message', 'airnotifier_provider_mod_forum_digests_permitted', 'permitted'),
(311, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(312, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
(313, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
(314, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(315, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
(316, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
(317, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
(318, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
(319, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
(320, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
(321, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
(322, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
(323, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(324, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(325, 'message', 'airnotifier_provider_moodle_competencyplancomment_permitted', 'permitted'),
(326, 'message', 'airnotifier_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(327, 'message', 'airnotifier_provider_moodle_insights_permitted', 'permitted'),
(328, 'message_email', 'version', '2017111300'),
(330, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(331, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(332, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(333, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(334, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(335, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(336, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(337, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(338, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(339, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(340, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(341, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(342, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(343, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(344, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(345, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(346, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(347, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(348, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(349, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(350, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(351, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(352, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(353, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(354, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(355, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(356, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(357, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(358, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(359, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(360, 'message', 'email_provider_mod_forum_digests_permitted', 'permitted'),
(361, 'message', 'message_provider_mod_forum_digests_loggedin', 'email'),
(362, 'message', 'message_provider_mod_forum_digests_loggedoff', 'email'),
(363, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(364, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(365, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(366, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(367, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(368, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(369, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(370, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(371, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(372, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(373, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(374, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(375, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(376, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(377, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(378, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(379, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(380, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(381, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(382, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(383, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(384, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(385, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(386, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(387, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(388, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(389, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(390, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(391, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(392, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(393, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(394, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(395, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(396, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(397, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(398, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(399, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(400, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(401, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(402, 'message', 'email_provider_moodle_competencyplancomment_permitted', 'permitted'),
(403, 'message', 'message_provider_moodle_competencyplancomment_loggedin', 'email'),
(404, 'message', 'message_provider_moodle_competencyplancomment_loggedoff', 'email'),
(405, 'message', 'email_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(406, 'message', 'message_provider_moodle_competencyusercompcomment_loggedin', 'email'),
(407, 'message', 'message_provider_moodle_competencyusercompcomment_loggedoff', 'email'),
(408, 'message', 'email_provider_moodle_insights_permitted', 'permitted'),
(409, 'message', 'message_provider_moodle_insights_loggedin', 'email'),
(410, 'message', 'message_provider_moodle_insights_loggedoff', 'email'),
(411, 'message_jabber', 'version', '2017111300'),
(413, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(414, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(415, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(416, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(417, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(418, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(419, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(420, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(421, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(422, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(423, 'message', 'jabber_provider_mod_forum_digests_permitted', 'permitted'),
(424, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(425, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(426, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(427, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(428, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(429, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(430, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(431, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(432, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(433, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(434, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(435, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(436, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(437, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(438, 'message', 'jabber_provider_moodle_competencyplancomment_permitted', 'permitted'),
(439, 'message', 'jabber_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(440, 'message', 'jabber_provider_moodle_insights_permitted', 'permitted'),
(441, 'message_popup', 'version', '2017111300'),
(443, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(444, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(445, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(446, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(447, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(448, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(449, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(450, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(451, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(452, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(453, 'message', 'popup_provider_mod_forum_digests_permitted', 'permitted'),
(454, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(455, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(456, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(457, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(458, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(459, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(460, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(461, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(462, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(463, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(464, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(465, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(466, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(467, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(468, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(469, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(470, 'message', 'popup_provider_moodle_competencyplancomment_permitted', 'permitted'),
(471, 'message', 'popup_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(472, 'message', 'popup_provider_moodle_insights_permitted', 'permitted'),
(473, 'block_activity_modules', 'version', '2017111300'),
(474, 'block_activity_results', 'version', '2017111300'),
(475, 'block_admin_bookmarks', 'version', '2017111300'),
(476, 'block_badges', 'version', '2017111300'),
(477, 'block_blog_menu', 'version', '2017111300'),
(478, 'block_blog_recent', 'version', '2017111300'),
(479, 'block_blog_tags', 'version', '2017111300'),
(480, 'block_calendar_month', 'version', '2017111300'),
(481, 'block_calendar_upcoming', 'version', '2017111300'),
(482, 'block_comments', 'version', '2017111300'),
(483, 'block_community', 'version', '2017111300'),
(484, 'block_completionstatus', 'version', '2017111300'),
(485, 'block_course_list', 'version', '2017111300'),
(486, 'block_course_summary', 'version', '2017111300'),
(487, 'block_feedback', 'version', '2017111300'),
(489, 'block_globalsearch', 'version', '2017111300'),
(490, 'block_glossary_random', 'version', '2017111300'),
(491, 'block_html', 'version', '2017111300'),
(492, 'block_login', 'version', '2017111300'),
(493, 'block_lp', 'version', '2017111300'),
(494, 'block_mentees', 'version', '2017111300'),
(495, 'block_mnet_hosts', 'version', '2017111300'),
(496, 'block_myoverview', 'version', '2017111300'),
(497, 'block_myprofile', 'version', '2017111300'),
(498, 'block_navigation', 'version', '2017111300'),
(499, 'block_news_items', 'version', '2017111300'),
(500, 'block_online_users', 'version', '2017111300'),
(501, 'block_participants', 'version', '2017111300'),
(502, 'block_private_files', 'version', '2017111300'),
(503, 'block_quiz_results', 'version', '2017111300'),
(505, 'block_recent_activity', 'version', '2017111300'),
(506, 'block_rss_client', 'version', '2017111300'),
(507, 'block_search_forums', 'version', '2017111300'),
(508, 'block_section_links', 'version', '2017111300'),
(509, 'block_selfcompletion', 'version', '2017111300'),
(510, 'block_settings', 'version', '2017111300'),
(511, 'block_site_main_menu', 'version', '2017111300'),
(512, 'block_social_activities', 'version', '2017111300'),
(513, 'block_tag_flickr', 'version', '2017111300'),
(514, 'block_tag_youtube', 'version', '2017111300'),
(516, 'block_tags', 'version', '2017111300'),
(517, 'media_html5audio', 'version', '2017111300'),
(518, 'media_html5video', 'version', '2017111300'),
(519, 'media_swf', 'version', '2017111300'),
(520, 'media_videojs', 'version', '2017111300'),
(521, 'media_vimeo', 'version', '2017111300'),
(522, 'media_youtube', 'version', '2017111300'),
(523, 'filter_activitynames', 'version', '2017111300'),
(525, 'filter_algebra', 'version', '2017111300'),
(526, 'filter_censor', 'version', '2017111300'),
(527, 'filter_data', 'version', '2017111300'),
(529, 'filter_emailprotect', 'version', '2017111300'),
(530, 'filter_emoticon', 'version', '2017111300'),
(531, 'filter_glossary', 'version', '2017111300'),
(533, 'filter_mathjaxloader', 'version', '2017111300'),
(535, 'filter_mediaplugin', 'version', '2017111300'),
(537, 'filter_multilang', 'version', '2017111300'),
(538, 'filter_tex', 'version', '2017111300'),
(540, 'filter_tidy', 'version', '2017111300'),
(541, 'filter_urltolink', 'version', '2017111300'),
(542, 'editor_atto', 'version', '2017111300'),
(544, 'editor_textarea', 'version', '2017111300'),
(545, 'editor_tinymce', 'version', '2017111300'),
(546, 'format_singleactivity', 'version', '2017111300'),
(547, 'format_social', 'version', '2017111300'),
(548, 'format_topics', 'version', '2017111301'),
(549, 'format_weeks', 'version', '2017111301'),
(550, 'dataformat_csv', 'version', '2017111300'),
(551, 'dataformat_excel', 'version', '2017111300'),
(552, 'dataformat_html', 'version', '2017111300'),
(553, 'dataformat_json', 'version', '2017111300'),
(554, 'dataformat_ods', 'version', '2017111300'),
(555, 'profilefield_checkbox', 'version', '2017111300'),
(556, 'profilefield_datetime', 'version', '2017111300'),
(557, 'profilefield_menu', 'version', '2017111300'),
(558, 'profilefield_text', 'version', '2017111300'),
(559, 'profilefield_textarea', 'version', '2017111300'),
(560, 'report_backups', 'version', '2017111300'),
(561, 'report_competency', 'version', '2017111300'),
(562, 'report_completion', 'version', '2017111300'),
(564, 'report_configlog', 'version', '2017111300'),
(565, 'report_courseoverview', 'version', '2017111300'),
(566, 'report_eventlist', 'version', '2017111300'),
(567, 'report_insights', 'version', '2017111300'),
(568, 'report_log', 'version', '2017111300'),
(570, 'report_loglive', 'version', '2017111300'),
(571, 'report_outline', 'version', '2017111300'),
(573, 'report_participation', 'version', '2017111300'),
(575, 'report_performance', 'version', '2017111300'),
(576, 'report_progress', 'version', '2017111300'),
(578, 'report_questioninstances', 'version', '2017111300'),
(579, 'report_security', 'version', '2017111300'),
(580, 'report_stats', 'version', '2017111300'),
(582, 'report_usersessions', 'version', '2017111300'),
(583, 'gradeexport_ods', 'version', '2017111300'),
(584, 'gradeexport_txt', 'version', '2017111300'),
(585, 'gradeexport_xls', 'version', '2017111300'),
(586, 'gradeexport_xml', 'version', '2017111300'),
(587, 'gradeimport_csv', 'version', '2017111300'),
(588, 'gradeimport_direct', 'version', '2017111300'),
(589, 'gradeimport_xml', 'version', '2017111300'),
(590, 'gradereport_grader', 'version', '2017111300'),
(591, 'gradereport_history', 'version', '2017111300'),
(592, 'gradereport_outcomes', 'version', '2017111300'),
(593, 'gradereport_overview', 'version', '2017111300'),
(594, 'gradereport_singleview', 'version', '2017111300'),
(595, 'gradereport_user', 'version', '2017111300'),
(596, 'gradingform_guide', 'version', '2017111300'),
(597, 'gradingform_rubric', 'version', '2017111300'),
(598, 'mlbackend_php', 'version', '2017111300'),
(599, 'mlbackend_python', 'version', '2017111300'),
(600, 'mnetservice_enrol', 'version', '2017111300'),
(601, 'webservice_rest', 'version', '2017111300'),
(602, 'webservice_soap', 'version', '2017111300'),
(603, 'webservice_xmlrpc', 'version', '2017111300'),
(604, 'repository_areafiles', 'version', '2017111300'),
(606, 'areafiles', 'enablecourseinstances', '0'),
(607, 'areafiles', 'enableuserinstances', '0'),
(608, 'repository_boxnet', 'version', '2017111300'),
(609, 'repository_coursefiles', 'version', '2017111300'),
(610, 'repository_dropbox', 'version', '2017111300'),
(611, 'repository_equella', 'version', '2017111300'),
(612, 'repository_filesystem', 'version', '2017111300'),
(613, 'repository_flickr', 'version', '2017111300'),
(614, 'repository_flickr_public', 'version', '2017111300'),
(615, 'repository_googledocs', 'version', '2017111300'),
(616, 'repository_local', 'version', '2017111300'),
(618, 'local', 'enablecourseinstances', '0'),
(619, 'local', 'enableuserinstances', '0'),
(620, 'repository_merlot', 'version', '2017111300'),
(621, 'repository_onedrive', 'version', '2017111300'),
(622, 'repository_picasa', 'version', '2017111300'),
(623, 'repository_recent', 'version', '2017111300'),
(625, 'recent', 'enablecourseinstances', '0'),
(626, 'recent', 'enableuserinstances', '0'),
(627, 'repository_s3', 'version', '2017111300'),
(628, 'repository_skydrive', 'version', '2017111300'),
(629, 'repository_upload', 'version', '2017111300'),
(631, 'upload', 'enablecourseinstances', '0'),
(632, 'upload', 'enableuserinstances', '0'),
(633, 'repository_url', 'version', '2017111300'),
(635, 'url', 'enablecourseinstances', '0'),
(636, 'url', 'enableuserinstances', '0'),
(637, 'repository_user', 'version', '2017111300'),
(639, 'user', 'enablecourseinstances', '0'),
(640, 'user', 'enableuserinstances', '0'),
(641, 'repository_webdav', 'version', '2017111300'),
(642, 'repository_wikimedia', 'version', '2017111300'),
(644, 'wikimedia', 'enablecourseinstances', '0'),
(645, 'wikimedia', 'enableuserinstances', '0'),
(646, 'repository_youtube', 'version', '2017111300'),
(648, 'portfolio_boxnet', 'version', '2017111300'),
(649, 'portfolio_download', 'version', '2017111300'),
(650, 'portfolio_flickr', 'version', '2017111300'),
(651, 'portfolio_googledocs', 'version', '2017111300'),
(652, 'portfolio_mahara', 'version', '2017111300'),
(653, 'portfolio_picasa', 'version', '2017111300'),
(654, 'search_solr', 'version', '2017111300'),
(655, 'qbehaviour_adaptive', 'version', '2017111300'),
(656, 'qbehaviour_adaptivenopenalty', 'version', '2017111300'),
(657, 'qbehaviour_deferredcbm', 'version', '2017111300'),
(658, 'qbehaviour_deferredfeedback', 'version', '2017111300'),
(659, 'qbehaviour_immediatecbm', 'version', '2017111300'),
(660, 'qbehaviour_immediatefeedback', 'version', '2017111300'),
(661, 'qbehaviour_informationitem', 'version', '2017111300'),
(662, 'qbehaviour_interactive', 'version', '2017111300'),
(663, 'qbehaviour_interactivecountback', 'version', '2017111300'),
(664, 'qbehaviour_manualgraded', 'version', '2017111300'),
(666, 'question', 'disabledbehaviours', 'manualgraded'),
(667, 'qbehaviour_missing', 'version', '2017111300'),
(668, 'qformat_aiken', 'version', '2017111300'),
(669, 'qformat_blackboard_six', 'version', '2017111300'),
(670, 'qformat_examview', 'version', '2017111300'),
(671, 'qformat_gift', 'version', '2017111300'),
(672, 'qformat_missingword', 'version', '2017111300'),
(673, 'qformat_multianswer', 'version', '2017111300'),
(674, 'qformat_webct', 'version', '2017111300'),
(675, 'qformat_xhtml', 'version', '2017111300'),
(676, 'qformat_xml', 'version', '2017111300'),
(677, 'tool_analytics', 'version', '2017111300'),
(678, 'tool_assignmentupgrade', 'version', '2017111300'),
(679, 'tool_availabilityconditions', 'version', '2017111300'),
(680, 'tool_behat', 'version', '2017111300'),
(681, 'tool_capability', 'version', '2017111300'),
(682, 'tool_cohortroles', 'version', '2017111300'),
(683, 'tool_customlang', 'version', '2017111300'),
(685, 'tool_dbtransfer', 'version', '2017111300'),
(686, 'tool_filetypes', 'version', '2017111300'),
(687, 'tool_generator', 'version', '2017111300'),
(688, 'tool_health', 'version', '2017111300'),
(689, 'tool_httpsreplace', 'version', '2017111300'),
(690, 'tool_innodb', 'version', '2017111300'),
(691, 'tool_installaddon', 'version', '2017111300'),
(692, 'tool_langimport', 'version', '2017111300'),
(693, 'tool_log', 'version', '2017111300'),
(695, 'tool_log', 'enabled_stores', 'logstore_standard'),
(696, 'tool_lp', 'version', '2017111300'),
(697, 'tool_lpimportcsv', 'version', '2017111300'),
(698, 'tool_lpmigrate', 'version', '2017111300'),
(699, 'tool_messageinbound', 'version', '2017111300'),
(700, 'message', 'airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(701, 'message', 'email_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(702, 'message', 'jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(703, 'message', 'popup_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(704, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedin', 'email'),
(705, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff', 'email'),
(706, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(707, 'message', 'email_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(708, 'message', 'jabber_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(709, 'message', 'popup_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(710, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedin', 'email'),
(711, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedoff', 'email'),
(712, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(713, 'message', 'email_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(714, 'message', 'jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(715, 'message', 'popup_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(716, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedin', 'email'),
(717, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff', 'email'),
(718, 'tool_mobile', 'version', '2017111300'),
(719, 'tool_monitor', 'version', '2017111300'),
(720, 'message', 'airnotifier_provider_tool_monitor_notification_permitted', 'permitted'),
(721, 'message', 'email_provider_tool_monitor_notification_permitted', 'permitted'),
(722, 'message', 'jabber_provider_tool_monitor_notification_permitted', 'permitted'),
(723, 'message', 'popup_provider_tool_monitor_notification_permitted', 'permitted'),
(724, 'message', 'message_provider_tool_monitor_notification_loggedin', 'email'),
(725, 'message', 'message_provider_tool_monitor_notification_loggedoff', 'email'),
(726, 'tool_multilangupgrade', 'version', '2017111300'),
(727, 'tool_oauth2', 'version', '2017111300'),
(728, 'tool_phpunit', 'version', '2017111300'),
(729, 'tool_profiling', 'version', '2017111300'),
(730, 'tool_recyclebin', 'version', '2017111300'),
(731, 'tool_replace', 'version', '2017111300'),
(732, 'tool_spamcleaner', 'version', '2017111300'),
(733, 'tool_task', 'version', '2017111300'),
(734, 'tool_templatelibrary', 'version', '2017111300'),
(735, 'tool_unsuproles', 'version', '2017111300'),
(737, 'tool_uploadcourse', 'version', '2017111300'),
(738, 'tool_uploaduser', 'version', '2017111300'),
(739, 'tool_usertours', 'version', '2017111300'),
(741, 'tool_xmldb', 'version', '2017111300'),
(742, 'cachestore_apcu', 'version', '2017111300'),
(743, 'cachestore_file', 'version', '2017111300'),
(744, 'cachestore_memcache', 'version', '2017111300'),
(745, 'cachestore_memcached', 'version', '2017111300'),
(746, 'cachestore_mongodb', 'version', '2017111300'),
(747, 'cachestore_redis', 'version', '2017111300'),
(748, 'cachestore_session', 'version', '2017111300'),
(749, 'cachestore_static', 'version', '2017111300'),
(750, 'cachelock_file', 'version', '2017111300'),
(751, 'fileconverter_googledrive', 'version', '2017111300'),
(752, 'fileconverter_unoconv', 'version', '2017111300'),
(754, 'theme_boost', 'version', '2017111300'),
(755, 'theme_bootstrapbase', 'version', '2017111300'),
(756, 'theme_clean', 'version', '2017111300'),
(757, 'theme_more', 'version', '2017111300'),
(759, 'assignsubmission_comments', 'version', '2017111300'),
(761, 'assignsubmission_file', 'sortorder', '1'),
(762, 'assignsubmission_comments', 'sortorder', '2'),
(763, 'assignsubmission_onlinetext', 'sortorder', '0'),
(764, 'assignsubmission_file', 'version', '2017111300'),
(765, 'assignsubmission_onlinetext', 'version', '2017111300'),
(767, 'assignfeedback_comments', 'version', '2017111300'),
(769, 'assignfeedback_comments', 'sortorder', '0'),
(770, 'assignfeedback_editpdf', 'sortorder', '1'),
(771, 'assignfeedback_file', 'sortorder', '3'),
(772, 'assignfeedback_offline', 'sortorder', '2'),
(773, 'assignfeedback_editpdf', 'version', '2017111300'),
(775, 'assignfeedback_file', 'version', '2017111300'),
(777, 'assignfeedback_offline', 'version', '2017111300'),
(778, 'assignment_offline', 'version', '2017111300'),
(779, 'assignment_online', 'version', '2017111300'),
(780, 'assignment_upload', 'version', '2017111300'),
(781, 'assignment_uploadsingle', 'version', '2017111300'),
(782, 'booktool_exportimscp', 'version', '2017111300'),
(783, 'booktool_importhtml', 'version', '2017111300'),
(784, 'booktool_print', 'version', '2017111300'),
(785, 'datafield_checkbox', 'version', '2017111300'),
(786, 'datafield_date', 'version', '2017111300'),
(787, 'datafield_file', 'version', '2017111300'),
(788, 'datafield_latlong', 'version', '2017111300'),
(789, 'datafield_menu', 'version', '2017111300'),
(790, 'datafield_multimenu', 'version', '2017111300'),
(791, 'datafield_number', 'version', '2017111300'),
(792, 'datafield_picture', 'version', '2017111300'),
(793, 'datafield_radiobutton', 'version', '2017111300'),
(794, 'datafield_text', 'version', '2017111300'),
(795, 'datafield_textarea', 'version', '2017111300'),
(796, 'datafield_url', 'version', '2017111300'),
(797, 'datapreset_imagegallery', 'version', '2017111300'),
(798, 'ltiservice_memberships', 'version', '2017111300'),
(799, 'ltiservice_profile', 'version', '2017111300'),
(800, 'ltiservice_toolproxy', 'version', '2017111300'),
(801, 'ltiservice_toolsettings', 'version', '2017111300'),
(802, 'quiz_grading', 'version', '2017111300'),
(804, 'quiz_overview', 'version', '2017111300'),
(806, 'quiz_responses', 'version', '2017111300'),
(808, 'quiz_statistics', 'version', '2017111300'),
(810, 'quizaccess_delaybetweenattempts', 'version', '2017111300'),
(811, 'quizaccess_ipaddress', 'version', '2017111300'),
(812, 'quizaccess_numattempts', 'version', '2017111300'),
(813, 'quizaccess_offlineattempts', 'version', '2017111300'),
(814, 'quizaccess_openclosedate', 'version', '2017111300'),
(815, 'quizaccess_password', 'version', '2017111300'),
(816, 'quizaccess_safebrowser', 'version', '2017111300'),
(817, 'quizaccess_securewindow', 'version', '2017111300'),
(818, 'quizaccess_timelimit', 'version', '2017111300'),
(819, 'scormreport_basic', 'version', '2017111300'),
(820, 'scormreport_graphs', 'version', '2017111300'),
(821, 'scormreport_interactions', 'version', '2017111300'),
(822, 'scormreport_objectives', 'version', '2017111300'),
(823, 'workshopform_accumulative', 'version', '2017111300'),
(825, 'workshopform_comments', 'version', '2017111300'),
(827, 'workshopform_numerrors', 'version', '2017111300'),
(829, 'workshopform_rubric', 'version', '2017111300'),
(831, 'workshopallocation_manual', 'version', '2017111300'),
(832, 'workshopallocation_random', 'version', '2017111300'),
(833, 'workshopallocation_scheduled', 'version', '2017111300'),
(834, 'workshopeval_best', 'version', '2017111300'),
(835, 'atto_accessibilitychecker', 'version', '2017111300'),
(836, 'atto_accessibilityhelper', 'version', '2017111300'),
(837, 'atto_align', 'version', '2017111300'),
(838, 'atto_backcolor', 'version', '2017111300'),
(839, 'atto_bold', 'version', '2017111300'),
(840, 'atto_charmap', 'version', '2017111300'),
(841, 'atto_clear', 'version', '2017111300'),
(842, 'atto_collapse', 'version', '2017111300'),
(843, 'atto_emoticon', 'version', '2017111300'),
(844, 'atto_equation', 'version', '2017111300'),
(845, 'atto_fontcolor', 'version', '2017111300'),
(846, 'atto_html', 'version', '2017111300'),
(847, 'atto_image', 'version', '2017111300'),
(848, 'atto_indent', 'version', '2017111300'),
(849, 'atto_italic', 'version', '2017111300'),
(850, 'atto_link', 'version', '2017111300'),
(851, 'atto_managefiles', 'version', '2017111300'),
(852, 'atto_media', 'version', '2017111300'),
(853, 'atto_noautolink', 'version', '2017111300'),
(854, 'atto_orderedlist', 'version', '2017111300'),
(855, 'atto_rtl', 'version', '2017111300'),
(856, 'atto_strike', 'version', '2017111300'),
(857, 'atto_subscript', 'version', '2017111300'),
(858, 'atto_superscript', 'version', '2017111300'),
(859, 'atto_table', 'version', '2017111300'),
(860, 'atto_title', 'version', '2017111300'),
(861, 'atto_underline', 'version', '2017111300'),
(862, 'atto_undo', 'version', '2017111300'),
(863, 'atto_unorderedlist', 'version', '2017111300'),
(864, 'tinymce_ctrlhelp', 'version', '2017111300'),
(865, 'tinymce_managefiles', 'version', '2017111300'),
(866, 'tinymce_moodleemoticon', 'version', '2017111300'),
(867, 'tinymce_moodleimage', 'version', '2017111300'),
(868, 'tinymce_moodlemedia', 'version', '2017111300'),
(869, 'tinymce_moodlenolink', 'version', '2017111300'),
(870, 'tinymce_pdw', 'version', '2017111300'),
(871, 'tinymce_spellchecker', 'version', '2017111300'),
(873, 'tinymce_wrap', 'version', '2017111300'),
(874, 'logstore_database', 'version', '2017111300'),
(875, 'logstore_legacy', 'version', '2017111300'),
(876, 'logstore_standard', 'version', '2017111300'),
(877, 'analytics', 'logstore', 'logstore_standard'),
(878, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(879, 'assign', 'showrecentsubmissions', '0'),
(880, 'assign', 'submissionreceipts', '1'),
(881, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(882, 'assign', 'maxperpage', '-1'),
(883, 'assign', 'alwaysshowdescription', '1'),
(884, 'assign', 'alwaysshowdescription_adv', ''),
(885, 'assign', 'alwaysshowdescription_locked', ''),
(886, 'assign', 'allowsubmissionsfromdate', '0'),
(887, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(888, 'assign', 'allowsubmissionsfromdate_adv', ''),
(889, 'assign', 'duedate', '604800'),
(890, 'assign', 'duedate_enabled', '1'),
(891, 'assign', 'duedate_adv', ''),
(892, 'assign', 'cutoffdate', '1209600'),
(893, 'assign', 'cutoffdate_enabled', ''),
(894, 'assign', 'cutoffdate_adv', ''),
(895, 'assign', 'gradingduedate', '1209600'),
(896, 'assign', 'gradingduedate_enabled', '1'),
(897, 'assign', 'gradingduedate_adv', ''),
(898, 'assign', 'submissiondrafts', '0'),
(899, 'assign', 'submissiondrafts_adv', ''),
(900, 'assign', 'submissiondrafts_locked', ''),
(901, 'assign', 'requiresubmissionstatement', '0'),
(902, 'assign', 'requiresubmissionstatement_adv', ''),
(903, 'assign', 'requiresubmissionstatement_locked', ''),
(904, 'assign', 'attemptreopenmethod', 'none'),
(905, 'assign', 'attemptreopenmethod_adv', ''),
(906, 'assign', 'attemptreopenmethod_locked', ''),
(907, 'assign', 'maxattempts', '-1'),
(908, 'assign', 'maxattempts_adv', ''),
(909, 'assign', 'maxattempts_locked', ''),
(910, 'assign', 'teamsubmission', '0'),
(911, 'assign', 'teamsubmission_adv', ''),
(912, 'assign', 'teamsubmission_locked', ''),
(913, 'assign', 'preventsubmissionnotingroup', '0'),
(914, 'assign', 'preventsubmissionnotingroup_adv', ''),
(915, 'assign', 'preventsubmissionnotingroup_locked', ''),
(916, 'assign', 'requireallteammemberssubmit', '0'),
(917, 'assign', 'requireallteammemberssubmit_adv', ''),
(918, 'assign', 'requireallteammemberssubmit_locked', ''),
(919, 'assign', 'teamsubmissiongroupingid', ''),
(920, 'assign', 'teamsubmissiongroupingid_adv', ''),
(921, 'assign', 'sendnotifications', '0'),
(922, 'assign', 'sendnotifications_adv', ''),
(923, 'assign', 'sendnotifications_locked', ''),
(924, 'assign', 'sendlatenotifications', '0'),
(925, 'assign', 'sendlatenotifications_adv', ''),
(926, 'assign', 'sendlatenotifications_locked', ''),
(927, 'assign', 'sendstudentnotifications', '1'),
(928, 'assign', 'sendstudentnotifications_adv', ''),
(929, 'assign', 'sendstudentnotifications_locked', ''),
(930, 'assign', 'blindmarking', '0'),
(931, 'assign', 'blindmarking_adv', ''),
(932, 'assign', 'blindmarking_locked', ''),
(933, 'assign', 'markingworkflow', '0'),
(934, 'assign', 'markingworkflow_adv', ''),
(935, 'assign', 'markingworkflow_locked', ''),
(936, 'assign', 'markingallocation', '0'),
(937, 'assign', 'markingallocation_adv', ''),
(938, 'assign', 'markingallocation_locked', ''),
(939, 'assignsubmission_file', 'default', '1'),
(940, 'assignsubmission_file', 'maxfiles', '20'),
(941, 'assignsubmission_file', 'filetypes', ''),
(942, 'assignsubmission_file', 'maxbytes', '0'),
(943, 'assignsubmission_onlinetext', 'default', '0'),
(944, 'assignfeedback_comments', 'default', '1'),
(945, 'assignfeedback_comments', 'inline', '0'),
(946, 'assignfeedback_comments', 'inline_adv', ''),
(947, 'assignfeedback_comments', 'inline_locked', ''),
(948, 'assignfeedback_editpdf', 'stamps', '');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(949, 'assignfeedback_file', 'default', '0'),
(950, 'assignfeedback_offline', 'default', '0'),
(951, 'book', 'numberingoptions', '0,1,2,3'),
(952, 'book', 'navoptions', '0,1,2'),
(953, 'book', 'numbering', '1'),
(954, 'book', 'navstyle', '1'),
(955, 'resource', 'framesize', '130'),
(956, 'resource', 'displayoptions', '0,1,4,5,6'),
(957, 'resource', 'printintro', '1'),
(958, 'resource', 'display', '0'),
(959, 'resource', 'showsize', '0'),
(960, 'resource', 'showtype', '0'),
(961, 'resource', 'showdate', '0'),
(962, 'resource', 'popupwidth', '620'),
(963, 'resource', 'popupheight', '450'),
(964, 'resource', 'filterfiles', '0'),
(965, 'folder', 'showexpanded', '1'),
(966, 'folder', 'maxsizetodownload', '0'),
(967, 'imscp', 'keepold', '1'),
(968, 'imscp', 'keepold_adv', ''),
(969, 'label', 'dndmedia', '1'),
(970, 'label', 'dndresizewidth', '400'),
(971, 'label', 'dndresizeheight', '400'),
(972, 'mod_lesson', 'mediafile', ''),
(973, 'mod_lesson', 'mediafile_adv', '1'),
(974, 'mod_lesson', 'mediawidth', '640'),
(975, 'mod_lesson', 'mediaheight', '480'),
(976, 'mod_lesson', 'mediaclose', '0'),
(977, 'mod_lesson', 'progressbar', '0'),
(978, 'mod_lesson', 'progressbar_adv', ''),
(979, 'mod_lesson', 'ongoing', '0'),
(980, 'mod_lesson', 'ongoing_adv', '1'),
(981, 'mod_lesson', 'displayleftmenu', '0'),
(982, 'mod_lesson', 'displayleftmenu_adv', ''),
(983, 'mod_lesson', 'displayleftif', '0'),
(984, 'mod_lesson', 'displayleftif_adv', '1'),
(985, 'mod_lesson', 'slideshow', '0'),
(986, 'mod_lesson', 'slideshow_adv', '1'),
(987, 'mod_lesson', 'slideshowwidth', '640'),
(988, 'mod_lesson', 'slideshowheight', '480'),
(989, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF'),
(990, 'mod_lesson', 'maxanswers', '5'),
(991, 'mod_lesson', 'maxanswers_adv', '1'),
(992, 'mod_lesson', 'defaultfeedback', '0'),
(993, 'mod_lesson', 'defaultfeedback_adv', '1'),
(994, 'mod_lesson', 'activitylink', ''),
(995, 'mod_lesson', 'activitylink_adv', '1'),
(996, 'mod_lesson', 'timelimit', '0'),
(997, 'mod_lesson', 'timelimit_adv', ''),
(998, 'mod_lesson', 'password', '0'),
(999, 'mod_lesson', 'password_adv', '1'),
(1000, 'mod_lesson', 'modattempts', '0'),
(1001, 'mod_lesson', 'modattempts_adv', ''),
(1002, 'mod_lesson', 'displayreview', '0'),
(1003, 'mod_lesson', 'displayreview_adv', ''),
(1004, 'mod_lesson', 'maximumnumberofattempts', '1'),
(1005, 'mod_lesson', 'maximumnumberofattempts_adv', ''),
(1006, 'mod_lesson', 'defaultnextpage', '0'),
(1007, 'mod_lesson', 'defaultnextpage_adv', '1'),
(1008, 'mod_lesson', 'numberofpagestoshow', '1'),
(1009, 'mod_lesson', 'numberofpagestoshow_adv', '1'),
(1010, 'mod_lesson', 'practice', '0'),
(1011, 'mod_lesson', 'practice_adv', ''),
(1012, 'mod_lesson', 'customscoring', '1'),
(1013, 'mod_lesson', 'customscoring_adv', '1'),
(1014, 'mod_lesson', 'retakesallowed', '0'),
(1015, 'mod_lesson', 'retakesallowed_adv', ''),
(1016, 'mod_lesson', 'handlingofretakes', '0'),
(1017, 'mod_lesson', 'handlingofretakes_adv', '1'),
(1018, 'mod_lesson', 'minimumnumberofquestions', '0'),
(1019, 'mod_lesson', 'minimumnumberofquestions_adv', '1'),
(1020, 'page', 'displayoptions', '5'),
(1021, 'page', 'printheading', '1'),
(1022, 'page', 'printintro', '0'),
(1023, 'page', 'display', '5'),
(1024, 'page', 'popupwidth', '620'),
(1025, 'page', 'popupheight', '450'),
(1026, 'quiz', 'timelimit', '0'),
(1027, 'quiz', 'timelimit_adv', ''),
(1028, 'quiz', 'overduehandling', 'autosubmit'),
(1029, 'quiz', 'overduehandling_adv', ''),
(1030, 'quiz', 'graceperiod', '86400'),
(1031, 'quiz', 'graceperiod_adv', ''),
(1032, 'quiz', 'graceperiodmin', '60'),
(1033, 'quiz', 'attempts', '0'),
(1034, 'quiz', 'attempts_adv', ''),
(1035, 'quiz', 'grademethod', '1'),
(1036, 'quiz', 'grademethod_adv', ''),
(1037, 'quiz', 'maximumgrade', '10'),
(1038, 'quiz', 'questionsperpage', '1'),
(1039, 'quiz', 'questionsperpage_adv', ''),
(1040, 'quiz', 'navmethod', 'free'),
(1041, 'quiz', 'navmethod_adv', '1'),
(1042, 'quiz', 'shuffleanswers', '1'),
(1043, 'quiz', 'shuffleanswers_adv', ''),
(1044, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(1045, 'quiz', 'canredoquestions', '0'),
(1046, 'quiz', 'canredoquestions_adv', '1'),
(1047, 'quiz', 'attemptonlast', '0'),
(1048, 'quiz', 'attemptonlast_adv', '1'),
(1049, 'quiz', 'reviewattempt', '69904'),
(1050, 'quiz', 'reviewcorrectness', '69904'),
(1051, 'quiz', 'reviewmarks', '69904'),
(1052, 'quiz', 'reviewspecificfeedback', '69904'),
(1053, 'quiz', 'reviewgeneralfeedback', '69904'),
(1054, 'quiz', 'reviewrightanswer', '69904'),
(1055, 'quiz', 'reviewoverallfeedback', '4368'),
(1056, 'quiz', 'showuserpicture', '0'),
(1057, 'quiz', 'showuserpicture_adv', ''),
(1058, 'quiz', 'decimalpoints', '2'),
(1059, 'quiz', 'decimalpoints_adv', ''),
(1060, 'quiz', 'questiondecimalpoints', '-1'),
(1061, 'quiz', 'questiondecimalpoints_adv', '1'),
(1062, 'quiz', 'showblocks', '0'),
(1063, 'quiz', 'showblocks_adv', '1'),
(1064, 'quiz', 'password', ''),
(1065, 'quiz', 'password_adv', ''),
(1066, 'quiz', 'subnet', ''),
(1067, 'quiz', 'subnet_adv', '1'),
(1068, 'quiz', 'delay1', '0'),
(1069, 'quiz', 'delay1_adv', '1'),
(1070, 'quiz', 'delay2', '0'),
(1071, 'quiz', 'delay2_adv', '1'),
(1072, 'quiz', 'browsersecurity', '-'),
(1073, 'quiz', 'browsersecurity_adv', '1'),
(1074, 'quiz', 'initialnumfeedbacks', '2'),
(1075, 'quiz', 'autosaveperiod', '60'),
(1076, 'scorm', 'displaycoursestructure', '0'),
(1077, 'scorm', 'displaycoursestructure_adv', ''),
(1078, 'scorm', 'popup', '0'),
(1079, 'scorm', 'popup_adv', ''),
(1080, 'scorm', 'displayactivityname', '1'),
(1081, 'scorm', 'framewidth', '100'),
(1082, 'scorm', 'framewidth_adv', '1'),
(1083, 'scorm', 'frameheight', '500'),
(1084, 'scorm', 'frameheight_adv', '1'),
(1085, 'scorm', 'winoptgrp_adv', '1'),
(1086, 'scorm', 'scrollbars', '0'),
(1087, 'scorm', 'directories', '0'),
(1088, 'scorm', 'location', '0'),
(1089, 'scorm', 'menubar', '0'),
(1090, 'scorm', 'toolbar', '0'),
(1091, 'scorm', 'status', '0'),
(1092, 'scorm', 'skipview', '0'),
(1093, 'scorm', 'skipview_adv', '1'),
(1094, 'scorm', 'hidebrowse', '0'),
(1095, 'scorm', 'hidebrowse_adv', '1'),
(1096, 'scorm', 'hidetoc', '0'),
(1097, 'scorm', 'hidetoc_adv', '1'),
(1098, 'scorm', 'nav', '1'),
(1099, 'scorm', 'nav_adv', '1'),
(1100, 'scorm', 'navpositionleft', '-100'),
(1101, 'scorm', 'navpositionleft_adv', '1'),
(1102, 'scorm', 'navpositiontop', '-100'),
(1103, 'scorm', 'navpositiontop_adv', '1'),
(1104, 'scorm', 'collapsetocwinsize', '767'),
(1105, 'scorm', 'collapsetocwinsize_adv', '1'),
(1106, 'scorm', 'displayattemptstatus', '1'),
(1107, 'scorm', 'displayattemptstatus_adv', ''),
(1108, 'scorm', 'grademethod', '1'),
(1109, 'scorm', 'maxgrade', '100'),
(1110, 'scorm', 'maxattempt', '0'),
(1111, 'scorm', 'whatgrade', '0'),
(1112, 'scorm', 'forcecompleted', '0'),
(1113, 'scorm', 'forcenewattempt', '0'),
(1114, 'scorm', 'autocommit', '0'),
(1115, 'scorm', 'masteryoverride', '1'),
(1116, 'scorm', 'lastattemptlock', '0'),
(1117, 'scorm', 'auto', '0'),
(1118, 'scorm', 'updatefreq', '0'),
(1119, 'scorm', 'scorm12standard', '1'),
(1120, 'scorm', 'allowtypeexternal', '0'),
(1121, 'scorm', 'allowtypelocalsync', '0'),
(1122, 'scorm', 'allowtypeexternalaicc', '0'),
(1123, 'scorm', 'allowaicchacp', '0'),
(1124, 'scorm', 'aicchacptimeout', '30'),
(1125, 'scorm', 'aicchacpkeepsessiondata', '1'),
(1126, 'scorm', 'aiccuserid', '1'),
(1127, 'scorm', 'forcejavascript', '1'),
(1128, 'scorm', 'allowapidebug', '0'),
(1129, 'scorm', 'apidebugmask', '.*'),
(1130, 'scorm', 'protectpackagedownloads', '0'),
(1131, 'url', 'framesize', '130'),
(1132, 'url', 'secretphrase', ''),
(1133, 'url', 'rolesinparams', '0'),
(1134, 'url', 'displayoptions', '0,1,5,6'),
(1135, 'url', 'printintro', '1'),
(1136, 'url', 'display', '0'),
(1137, 'url', 'popupwidth', '620'),
(1138, 'url', 'popupheight', '450'),
(1139, 'workshop', 'grade', '80'),
(1140, 'workshop', 'gradinggrade', '20'),
(1141, 'workshop', 'gradedecimals', '0'),
(1142, 'workshop', 'maxbytes', '0'),
(1143, 'workshop', 'strategy', 'accumulative'),
(1144, 'workshop', 'examplesmode', '0'),
(1145, 'workshopallocation_random', 'numofreviews', '5'),
(1146, 'workshopform_numerrors', 'grade0', 'No'),
(1147, 'workshopform_numerrors', 'grade1', 'Yes'),
(1148, 'workshopeval_best', 'comparison', '5'),
(1149, 'tool_recyclebin', 'coursebinenable', '1'),
(1150, 'tool_recyclebin', 'coursebinexpiry', '604800'),
(1151, 'tool_recyclebin', 'categorybinenable', '1'),
(1152, 'tool_recyclebin', 'categorybinexpiry', '604800'),
(1153, 'tool_recyclebin', 'autohide', '1'),
(1154, 'antivirus_clamav', 'runningmethod', 'commandline'),
(1155, 'antivirus_clamav', 'pathtoclam', ''),
(1156, 'antivirus_clamav', 'pathtounixsocket', ''),
(1157, 'antivirus_clamav', 'clamfailureonupload', 'donothing'),
(1158, 'auth_cas', 'field_map_firstname', ''),
(1159, 'auth_cas', 'field_updatelocal_firstname', 'oncreate'),
(1160, 'auth_cas', 'field_updateremote_firstname', '0'),
(1161, 'auth_cas', 'field_lock_firstname', 'unlocked'),
(1162, 'auth_cas', 'field_map_lastname', ''),
(1163, 'auth_cas', 'field_updatelocal_lastname', 'oncreate'),
(1164, 'auth_cas', 'field_updateremote_lastname', '0'),
(1165, 'auth_cas', 'field_lock_lastname', 'unlocked'),
(1166, 'auth_cas', 'field_map_email', ''),
(1167, 'auth_cas', 'field_updatelocal_email', 'oncreate'),
(1168, 'auth_cas', 'field_updateremote_email', '0'),
(1169, 'auth_cas', 'field_lock_email', 'unlocked'),
(1170, 'auth_cas', 'field_map_city', ''),
(1171, 'auth_cas', 'field_updatelocal_city', 'oncreate'),
(1172, 'auth_cas', 'field_updateremote_city', '0'),
(1173, 'auth_cas', 'field_lock_city', 'unlocked'),
(1174, 'auth_cas', 'field_map_country', ''),
(1175, 'auth_cas', 'field_updatelocal_country', 'oncreate'),
(1176, 'auth_cas', 'field_updateremote_country', '0'),
(1177, 'auth_cas', 'field_lock_country', 'unlocked'),
(1178, 'auth_cas', 'field_map_lang', ''),
(1179, 'auth_cas', 'field_updatelocal_lang', 'oncreate'),
(1180, 'auth_cas', 'field_updateremote_lang', '0'),
(1181, 'auth_cas', 'field_lock_lang', 'unlocked'),
(1182, 'auth_cas', 'field_map_description', ''),
(1183, 'auth_cas', 'field_updatelocal_description', 'oncreate'),
(1184, 'auth_cas', 'field_updateremote_description', '0'),
(1185, 'auth_cas', 'field_lock_description', 'unlocked'),
(1186, 'auth_cas', 'field_map_url', ''),
(1187, 'auth_cas', 'field_updatelocal_url', 'oncreate'),
(1188, 'auth_cas', 'field_updateremote_url', '0'),
(1189, 'auth_cas', 'field_lock_url', 'unlocked'),
(1190, 'auth_cas', 'field_map_idnumber', ''),
(1191, 'auth_cas', 'field_updatelocal_idnumber', 'oncreate'),
(1192, 'auth_cas', 'field_updateremote_idnumber', '0'),
(1193, 'auth_cas', 'field_lock_idnumber', 'unlocked'),
(1194, 'auth_cas', 'field_map_institution', ''),
(1195, 'auth_cas', 'field_updatelocal_institution', 'oncreate'),
(1196, 'auth_cas', 'field_updateremote_institution', '0'),
(1197, 'auth_cas', 'field_lock_institution', 'unlocked'),
(1198, 'auth_cas', 'field_map_department', ''),
(1199, 'auth_cas', 'field_updatelocal_department', 'oncreate'),
(1200, 'auth_cas', 'field_updateremote_department', '0'),
(1201, 'auth_cas', 'field_lock_department', 'unlocked'),
(1202, 'auth_cas', 'field_map_phone1', ''),
(1203, 'auth_cas', 'field_updatelocal_phone1', 'oncreate'),
(1204, 'auth_cas', 'field_updateremote_phone1', '0'),
(1205, 'auth_cas', 'field_lock_phone1', 'unlocked'),
(1206, 'auth_cas', 'field_map_phone2', ''),
(1207, 'auth_cas', 'field_updatelocal_phone2', 'oncreate'),
(1208, 'auth_cas', 'field_updateremote_phone2', '0'),
(1209, 'auth_cas', 'field_lock_phone2', 'unlocked'),
(1210, 'auth_cas', 'field_map_address', ''),
(1211, 'auth_cas', 'field_updatelocal_address', 'oncreate'),
(1212, 'auth_cas', 'field_updateremote_address', '0'),
(1213, 'auth_cas', 'field_lock_address', 'unlocked'),
(1214, 'auth_cas', 'field_map_firstnamephonetic', ''),
(1215, 'auth_cas', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1216, 'auth_cas', 'field_updateremote_firstnamephonetic', '0'),
(1217, 'auth_cas', 'field_lock_firstnamephonetic', 'unlocked'),
(1218, 'auth_cas', 'field_map_lastnamephonetic', ''),
(1219, 'auth_cas', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1220, 'auth_cas', 'field_updateremote_lastnamephonetic', '0'),
(1221, 'auth_cas', 'field_lock_lastnamephonetic', 'unlocked'),
(1222, 'auth_cas', 'field_map_middlename', ''),
(1223, 'auth_cas', 'field_updatelocal_middlename', 'oncreate'),
(1224, 'auth_cas', 'field_updateremote_middlename', '0'),
(1225, 'auth_cas', 'field_lock_middlename', 'unlocked'),
(1226, 'auth_cas', 'field_map_alternatename', ''),
(1227, 'auth_cas', 'field_updatelocal_alternatename', 'oncreate'),
(1228, 'auth_cas', 'field_updateremote_alternatename', '0'),
(1229, 'auth_cas', 'field_lock_alternatename', 'unlocked'),
(1230, 'auth_email', 'recaptcha', '0'),
(1231, 'auth_email', 'field_lock_firstname', 'unlocked'),
(1232, 'auth_email', 'field_lock_lastname', 'unlocked'),
(1233, 'auth_email', 'field_lock_email', 'unlocked'),
(1234, 'auth_email', 'field_lock_city', 'unlocked'),
(1235, 'auth_email', 'field_lock_country', 'unlocked'),
(1236, 'auth_email', 'field_lock_lang', 'unlocked'),
(1237, 'auth_email', 'field_lock_description', 'unlocked'),
(1238, 'auth_email', 'field_lock_url', 'unlocked'),
(1239, 'auth_email', 'field_lock_idnumber', 'unlocked'),
(1240, 'auth_email', 'field_lock_institution', 'unlocked'),
(1241, 'auth_email', 'field_lock_department', 'unlocked'),
(1242, 'auth_email', 'field_lock_phone1', 'unlocked'),
(1243, 'auth_email', 'field_lock_phone2', 'unlocked'),
(1244, 'auth_email', 'field_lock_address', 'unlocked'),
(1245, 'auth_email', 'field_lock_firstnamephonetic', 'unlocked'),
(1246, 'auth_email', 'field_lock_lastnamephonetic', 'unlocked'),
(1247, 'auth_email', 'field_lock_middlename', 'unlocked'),
(1248, 'auth_email', 'field_lock_alternatename', 'unlocked'),
(1249, 'auth_db', 'host', '127.0.0.1'),
(1250, 'auth_db', 'type', 'mysqli'),
(1251, 'auth_db', 'sybasequoting', '0'),
(1252, 'auth_db', 'name', ''),
(1253, 'auth_db', 'user', ''),
(1254, 'auth_db', 'pass', ''),
(1255, 'auth_db', 'table', ''),
(1256, 'auth_db', 'fielduser', ''),
(1257, 'auth_db', 'fieldpass', ''),
(1258, 'auth_db', 'passtype', 'plaintext'),
(1259, 'auth_db', 'extencoding', 'utf-8'),
(1260, 'auth_db', 'setupsql', ''),
(1261, 'auth_db', 'debugauthdb', '0'),
(1262, 'auth_db', 'changepasswordurl', ''),
(1263, 'auth_db', 'removeuser', '0'),
(1264, 'auth_db', 'updateusers', '0'),
(1265, 'auth_db', 'field_map_firstname', ''),
(1266, 'auth_db', 'field_updatelocal_firstname', 'oncreate'),
(1267, 'auth_db', 'field_updateremote_firstname', '0'),
(1268, 'auth_db', 'field_lock_firstname', 'unlocked'),
(1269, 'auth_db', 'field_map_lastname', ''),
(1270, 'auth_db', 'field_updatelocal_lastname', 'oncreate'),
(1271, 'auth_db', 'field_updateremote_lastname', '0'),
(1272, 'auth_db', 'field_lock_lastname', 'unlocked'),
(1273, 'auth_db', 'field_map_email', ''),
(1274, 'auth_db', 'field_updatelocal_email', 'oncreate'),
(1275, 'auth_db', 'field_updateremote_email', '0'),
(1276, 'auth_db', 'field_lock_email', 'unlocked'),
(1277, 'auth_db', 'field_map_city', ''),
(1278, 'auth_db', 'field_updatelocal_city', 'oncreate'),
(1279, 'auth_db', 'field_updateremote_city', '0'),
(1280, 'auth_db', 'field_lock_city', 'unlocked'),
(1281, 'auth_db', 'field_map_country', ''),
(1282, 'auth_db', 'field_updatelocal_country', 'oncreate'),
(1283, 'auth_db', 'field_updateremote_country', '0'),
(1284, 'auth_db', 'field_lock_country', 'unlocked'),
(1285, 'auth_db', 'field_map_lang', ''),
(1286, 'auth_db', 'field_updatelocal_lang', 'oncreate'),
(1287, 'auth_db', 'field_updateremote_lang', '0'),
(1288, 'auth_db', 'field_lock_lang', 'unlocked'),
(1289, 'auth_db', 'field_map_description', ''),
(1290, 'auth_db', 'field_updatelocal_description', 'oncreate'),
(1291, 'auth_db', 'field_updateremote_description', '0'),
(1292, 'auth_db', 'field_lock_description', 'unlocked'),
(1293, 'auth_db', 'field_map_url', ''),
(1294, 'auth_db', 'field_updatelocal_url', 'oncreate'),
(1295, 'auth_db', 'field_updateremote_url', '0'),
(1296, 'auth_db', 'field_lock_url', 'unlocked'),
(1297, 'auth_db', 'field_map_idnumber', ''),
(1298, 'auth_db', 'field_updatelocal_idnumber', 'oncreate'),
(1299, 'auth_db', 'field_updateremote_idnumber', '0'),
(1300, 'auth_db', 'field_lock_idnumber', 'unlocked'),
(1301, 'auth_db', 'field_map_institution', ''),
(1302, 'auth_db', 'field_updatelocal_institution', 'oncreate'),
(1303, 'auth_db', 'field_updateremote_institution', '0'),
(1304, 'auth_db', 'field_lock_institution', 'unlocked'),
(1305, 'auth_db', 'field_map_department', ''),
(1306, 'auth_db', 'field_updatelocal_department', 'oncreate'),
(1307, 'auth_db', 'field_updateremote_department', '0'),
(1308, 'auth_db', 'field_lock_department', 'unlocked'),
(1309, 'auth_db', 'field_map_phone1', ''),
(1310, 'auth_db', 'field_updatelocal_phone1', 'oncreate'),
(1311, 'auth_db', 'field_updateremote_phone1', '0'),
(1312, 'auth_db', 'field_lock_phone1', 'unlocked'),
(1313, 'auth_db', 'field_map_phone2', ''),
(1314, 'auth_db', 'field_updatelocal_phone2', 'oncreate'),
(1315, 'auth_db', 'field_updateremote_phone2', '0'),
(1316, 'auth_db', 'field_lock_phone2', 'unlocked'),
(1317, 'auth_db', 'field_map_address', ''),
(1318, 'auth_db', 'field_updatelocal_address', 'oncreate'),
(1319, 'auth_db', 'field_updateremote_address', '0'),
(1320, 'auth_db', 'field_lock_address', 'unlocked'),
(1321, 'auth_db', 'field_map_firstnamephonetic', ''),
(1322, 'auth_db', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1323, 'auth_db', 'field_updateremote_firstnamephonetic', '0'),
(1324, 'auth_db', 'field_lock_firstnamephonetic', 'unlocked'),
(1325, 'auth_db', 'field_map_lastnamephonetic', ''),
(1326, 'auth_db', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1327, 'auth_db', 'field_updateremote_lastnamephonetic', '0'),
(1328, 'auth_db', 'field_lock_lastnamephonetic', 'unlocked'),
(1329, 'auth_db', 'field_map_middlename', ''),
(1330, 'auth_db', 'field_updatelocal_middlename', 'oncreate'),
(1331, 'auth_db', 'field_updateremote_middlename', '0'),
(1332, 'auth_db', 'field_lock_middlename', 'unlocked'),
(1333, 'auth_db', 'field_map_alternatename', ''),
(1334, 'auth_db', 'field_updatelocal_alternatename', 'oncreate'),
(1335, 'auth_db', 'field_updateremote_alternatename', '0'),
(1336, 'auth_db', 'field_lock_alternatename', 'unlocked'),
(1337, 'auth_ldap', 'field_map_firstname', ''),
(1338, 'auth_ldap', 'field_updatelocal_firstname', 'oncreate'),
(1339, 'auth_ldap', 'field_updateremote_firstname', '0'),
(1340, 'auth_ldap', 'field_lock_firstname', 'unlocked'),
(1341, 'auth_ldap', 'field_map_lastname', ''),
(1342, 'auth_ldap', 'field_updatelocal_lastname', 'oncreate'),
(1343, 'auth_ldap', 'field_updateremote_lastname', '0'),
(1344, 'auth_ldap', 'field_lock_lastname', 'unlocked'),
(1345, 'auth_ldap', 'field_map_email', ''),
(1346, 'auth_ldap', 'field_updatelocal_email', 'oncreate'),
(1347, 'auth_ldap', 'field_updateremote_email', '0'),
(1348, 'auth_ldap', 'field_lock_email', 'unlocked'),
(1349, 'auth_ldap', 'field_map_city', ''),
(1350, 'auth_ldap', 'field_updatelocal_city', 'oncreate'),
(1351, 'auth_ldap', 'field_updateremote_city', '0'),
(1352, 'auth_ldap', 'field_lock_city', 'unlocked'),
(1353, 'auth_ldap', 'field_map_country', ''),
(1354, 'auth_ldap', 'field_updatelocal_country', 'oncreate'),
(1355, 'auth_ldap', 'field_updateremote_country', '0'),
(1356, 'auth_ldap', 'field_lock_country', 'unlocked'),
(1357, 'auth_ldap', 'field_map_lang', ''),
(1358, 'auth_ldap', 'field_updatelocal_lang', 'oncreate'),
(1359, 'auth_ldap', 'field_updateremote_lang', '0'),
(1360, 'auth_ldap', 'field_lock_lang', 'unlocked'),
(1361, 'auth_ldap', 'field_map_description', ''),
(1362, 'auth_ldap', 'field_updatelocal_description', 'oncreate'),
(1363, 'auth_ldap', 'field_updateremote_description', '0'),
(1364, 'auth_ldap', 'field_lock_description', 'unlocked'),
(1365, 'auth_ldap', 'field_map_url', ''),
(1366, 'auth_ldap', 'field_updatelocal_url', 'oncreate'),
(1367, 'auth_ldap', 'field_updateremote_url', '0'),
(1368, 'auth_ldap', 'field_lock_url', 'unlocked'),
(1369, 'auth_ldap', 'field_map_idnumber', ''),
(1370, 'auth_ldap', 'field_updatelocal_idnumber', 'oncreate'),
(1371, 'auth_ldap', 'field_updateremote_idnumber', '0'),
(1372, 'auth_ldap', 'field_lock_idnumber', 'unlocked'),
(1373, 'auth_ldap', 'field_map_institution', ''),
(1374, 'auth_ldap', 'field_updatelocal_institution', 'oncreate'),
(1375, 'auth_ldap', 'field_updateremote_institution', '0'),
(1376, 'auth_ldap', 'field_lock_institution', 'unlocked'),
(1377, 'auth_ldap', 'field_map_department', ''),
(1378, 'auth_ldap', 'field_updatelocal_department', 'oncreate'),
(1379, 'auth_ldap', 'field_updateremote_department', '0'),
(1380, 'auth_ldap', 'field_lock_department', 'unlocked'),
(1381, 'auth_ldap', 'field_map_phone1', ''),
(1382, 'auth_ldap', 'field_updatelocal_phone1', 'oncreate'),
(1383, 'auth_ldap', 'field_updateremote_phone1', '0'),
(1384, 'auth_ldap', 'field_lock_phone1', 'unlocked'),
(1385, 'auth_ldap', 'field_map_phone2', ''),
(1386, 'auth_ldap', 'field_updatelocal_phone2', 'oncreate'),
(1387, 'auth_ldap', 'field_updateremote_phone2', '0'),
(1388, 'auth_ldap', 'field_lock_phone2', 'unlocked'),
(1389, 'auth_ldap', 'field_map_address', ''),
(1390, 'auth_ldap', 'field_updatelocal_address', 'oncreate'),
(1391, 'auth_ldap', 'field_updateremote_address', '0'),
(1392, 'auth_ldap', 'field_lock_address', 'unlocked'),
(1393, 'auth_ldap', 'field_map_firstnamephonetic', ''),
(1394, 'auth_ldap', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1395, 'auth_ldap', 'field_updateremote_firstnamephonetic', '0'),
(1396, 'auth_ldap', 'field_lock_firstnamephonetic', 'unlocked'),
(1397, 'auth_ldap', 'field_map_lastnamephonetic', ''),
(1398, 'auth_ldap', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1399, 'auth_ldap', 'field_updateremote_lastnamephonetic', '0'),
(1400, 'auth_ldap', 'field_lock_lastnamephonetic', 'unlocked'),
(1401, 'auth_ldap', 'field_map_middlename', ''),
(1402, 'auth_ldap', 'field_updatelocal_middlename', 'oncreate'),
(1403, 'auth_ldap', 'field_updateremote_middlename', '0'),
(1404, 'auth_ldap', 'field_lock_middlename', 'unlocked'),
(1405, 'auth_ldap', 'field_map_alternatename', ''),
(1406, 'auth_ldap', 'field_updatelocal_alternatename', 'oncreate'),
(1407, 'auth_ldap', 'field_updateremote_alternatename', '0'),
(1408, 'auth_ldap', 'field_lock_alternatename', 'unlocked'),
(1409, 'auth_manual', 'expiration', '0'),
(1410, 'auth_manual', 'expirationtime', '30'),
(1411, 'auth_manual', 'expiration_warning', '0'),
(1412, 'auth_manual', 'field_lock_firstname', 'unlocked'),
(1413, 'auth_manual', 'field_lock_lastname', 'unlocked'),
(1414, 'auth_manual', 'field_lock_email', 'unlocked'),
(1415, 'auth_manual', 'field_lock_city', 'unlocked'),
(1416, 'auth_manual', 'field_lock_country', 'unlocked'),
(1417, 'auth_manual', 'field_lock_lang', 'unlocked'),
(1418, 'auth_manual', 'field_lock_description', 'unlocked'),
(1419, 'auth_manual', 'field_lock_url', 'unlocked'),
(1420, 'auth_manual', 'field_lock_idnumber', 'unlocked'),
(1421, 'auth_manual', 'field_lock_institution', 'unlocked'),
(1422, 'auth_manual', 'field_lock_department', 'unlocked'),
(1423, 'auth_manual', 'field_lock_phone1', 'unlocked'),
(1424, 'auth_manual', 'field_lock_phone2', 'unlocked'),
(1425, 'auth_manual', 'field_lock_address', 'unlocked'),
(1426, 'auth_manual', 'field_lock_firstnamephonetic', 'unlocked'),
(1427, 'auth_manual', 'field_lock_lastnamephonetic', 'unlocked'),
(1428, 'auth_manual', 'field_lock_middlename', 'unlocked'),
(1429, 'auth_manual', 'field_lock_alternatename', 'unlocked'),
(1430, 'auth_mnet', 'rpc_negotiation_timeout', '30'),
(1431, 'auth_none', 'field_lock_firstname', 'unlocked'),
(1432, 'auth_none', 'field_lock_lastname', 'unlocked'),
(1433, 'auth_none', 'field_lock_email', 'unlocked'),
(1434, 'auth_none', 'field_lock_city', 'unlocked'),
(1435, 'auth_none', 'field_lock_country', 'unlocked'),
(1436, 'auth_none', 'field_lock_lang', 'unlocked'),
(1437, 'auth_none', 'field_lock_description', 'unlocked'),
(1438, 'auth_none', 'field_lock_url', 'unlocked'),
(1439, 'auth_none', 'field_lock_idnumber', 'unlocked'),
(1440, 'auth_none', 'field_lock_institution', 'unlocked'),
(1441, 'auth_none', 'field_lock_department', 'unlocked'),
(1442, 'auth_none', 'field_lock_phone1', 'unlocked'),
(1443, 'auth_none', 'field_lock_phone2', 'unlocked'),
(1444, 'auth_none', 'field_lock_address', 'unlocked'),
(1445, 'auth_none', 'field_lock_firstnamephonetic', 'unlocked'),
(1446, 'auth_none', 'field_lock_lastnamephonetic', 'unlocked'),
(1447, 'auth_none', 'field_lock_middlename', 'unlocked'),
(1448, 'auth_none', 'field_lock_alternatename', 'unlocked'),
(1449, 'auth_oauth2', 'field_lock_firstname', 'unlocked'),
(1450, 'auth_oauth2', 'field_lock_lastname', 'unlocked'),
(1451, 'auth_oauth2', 'field_lock_email', 'unlocked'),
(1452, 'auth_oauth2', 'field_lock_city', 'unlocked'),
(1453, 'auth_oauth2', 'field_lock_country', 'unlocked'),
(1454, 'auth_oauth2', 'field_lock_lang', 'unlocked'),
(1455, 'auth_oauth2', 'field_lock_description', 'unlocked'),
(1456, 'auth_oauth2', 'field_lock_url', 'unlocked'),
(1457, 'auth_oauth2', 'field_lock_idnumber', 'unlocked'),
(1458, 'auth_oauth2', 'field_lock_institution', 'unlocked'),
(1459, 'auth_oauth2', 'field_lock_department', 'unlocked'),
(1460, 'auth_oauth2', 'field_lock_phone1', 'unlocked'),
(1461, 'auth_oauth2', 'field_lock_phone2', 'unlocked'),
(1462, 'auth_oauth2', 'field_lock_address', 'unlocked'),
(1463, 'auth_oauth2', 'field_lock_firstnamephonetic', 'unlocked'),
(1464, 'auth_oauth2', 'field_lock_lastnamephonetic', 'unlocked'),
(1465, 'auth_oauth2', 'field_lock_middlename', 'unlocked'),
(1466, 'auth_oauth2', 'field_lock_alternatename', 'unlocked'),
(1467, 'auth_shibboleth', 'user_attribute', ''),
(1468, 'auth_shibboleth', 'convert_data', ''),
(1469, 'auth_shibboleth', 'alt_login', 'off'),
(1470, 'auth_shibboleth', 'organization_selection', 'urn:mace:organization1:providerID, Example Organization 1\n        https://another.idp-id.com/shibboleth, Other Example Organization, /Shibboleth.sso/DS/SWITCHaai\n        urn:mace:organization2:providerID, Example Organization 2, /Shibboleth.sso/WAYF/SWITCHaai'),
(1471, 'auth_shibboleth', 'logout_handler', ''),
(1472, 'auth_shibboleth', 'logout_return_url', ''),
(1473, 'auth_shibboleth', 'login_name', 'Shibboleth Login'),
(1474, 'auth_shibboleth', 'auth_instructions', 'Use the <a href="http://localhost/SchoolSystem/auth/shibboleth/index.php">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.'),
(1475, 'auth_shibboleth', 'changepasswordurl', ''),
(1476, 'auth_shibboleth', 'field_map_firstname', ''),
(1477, 'auth_shibboleth', 'field_updatelocal_firstname', 'oncreate'),
(1478, 'auth_shibboleth', 'field_lock_firstname', 'unlocked'),
(1479, 'auth_shibboleth', 'field_map_lastname', ''),
(1480, 'auth_shibboleth', 'field_updatelocal_lastname', 'oncreate'),
(1481, 'auth_shibboleth', 'field_lock_lastname', 'unlocked'),
(1482, 'auth_shibboleth', 'field_map_email', ''),
(1483, 'auth_shibboleth', 'field_updatelocal_email', 'oncreate'),
(1484, 'auth_shibboleth', 'field_lock_email', 'unlocked'),
(1485, 'auth_shibboleth', 'field_map_city', ''),
(1486, 'auth_shibboleth', 'field_updatelocal_city', 'oncreate'),
(1487, 'auth_shibboleth', 'field_lock_city', 'unlocked'),
(1488, 'auth_shibboleth', 'field_map_country', ''),
(1489, 'auth_shibboleth', 'field_updatelocal_country', 'oncreate'),
(1490, 'auth_shibboleth', 'field_lock_country', 'unlocked'),
(1491, 'auth_shibboleth', 'field_map_lang', ''),
(1492, 'auth_shibboleth', 'field_updatelocal_lang', 'oncreate'),
(1493, 'auth_shibboleth', 'field_lock_lang', 'unlocked'),
(1494, 'auth_shibboleth', 'field_map_description', ''),
(1495, 'auth_shibboleth', 'field_updatelocal_description', 'oncreate'),
(1496, 'auth_shibboleth', 'field_lock_description', 'unlocked'),
(1497, 'auth_shibboleth', 'field_map_url', ''),
(1498, 'auth_shibboleth', 'field_updatelocal_url', 'oncreate'),
(1499, 'auth_shibboleth', 'field_lock_url', 'unlocked'),
(1500, 'auth_shibboleth', 'field_map_idnumber', ''),
(1501, 'auth_shibboleth', 'field_updatelocal_idnumber', 'oncreate'),
(1502, 'auth_shibboleth', 'field_lock_idnumber', 'unlocked'),
(1503, 'auth_shibboleth', 'field_map_institution', ''),
(1504, 'auth_shibboleth', 'field_updatelocal_institution', 'oncreate'),
(1505, 'auth_shibboleth', 'field_lock_institution', 'unlocked'),
(1506, 'auth_shibboleth', 'field_map_department', ''),
(1507, 'auth_shibboleth', 'field_updatelocal_department', 'oncreate'),
(1508, 'auth_shibboleth', 'field_lock_department', 'unlocked'),
(1509, 'auth_shibboleth', 'field_map_phone1', ''),
(1510, 'auth_shibboleth', 'field_updatelocal_phone1', 'oncreate'),
(1511, 'auth_shibboleth', 'field_lock_phone1', 'unlocked'),
(1512, 'auth_shibboleth', 'field_map_phone2', ''),
(1513, 'auth_shibboleth', 'field_updatelocal_phone2', 'oncreate'),
(1514, 'auth_shibboleth', 'field_lock_phone2', 'unlocked'),
(1515, 'auth_shibboleth', 'field_map_address', ''),
(1516, 'auth_shibboleth', 'field_updatelocal_address', 'oncreate'),
(1517, 'auth_shibboleth', 'field_lock_address', 'unlocked'),
(1518, 'auth_shibboleth', 'field_map_firstnamephonetic', ''),
(1519, 'auth_shibboleth', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1520, 'auth_shibboleth', 'field_lock_firstnamephonetic', 'unlocked'),
(1521, 'auth_shibboleth', 'field_map_lastnamephonetic', ''),
(1522, 'auth_shibboleth', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1523, 'auth_shibboleth', 'field_lock_lastnamephonetic', 'unlocked'),
(1524, 'auth_shibboleth', 'field_map_middlename', ''),
(1525, 'auth_shibboleth', 'field_updatelocal_middlename', 'oncreate'),
(1526, 'auth_shibboleth', 'field_lock_middlename', 'unlocked'),
(1527, 'auth_shibboleth', 'field_map_alternatename', ''),
(1528, 'auth_shibboleth', 'field_updatelocal_alternatename', 'oncreate'),
(1529, 'auth_shibboleth', 'field_lock_alternatename', 'unlocked'),
(1530, 'block_activity_results', 'config_showbest', '3'),
(1531, 'block_activity_results', 'config_showbest_locked', ''),
(1532, 'block_activity_results', 'config_showworst', '0'),
(1533, 'block_activity_results', 'config_showworst_locked', ''),
(1534, 'block_activity_results', 'config_usegroups', '0'),
(1535, 'block_activity_results', 'config_usegroups_locked', ''),
(1536, 'block_activity_results', 'config_nameformat', '1'),
(1537, 'block_activity_results', 'config_nameformat_locked', ''),
(1538, 'block_activity_results', 'config_gradeformat', '1'),
(1539, 'block_activity_results', 'config_gradeformat_locked', ''),
(1540, 'block_activity_results', 'config_decimalpoints', '2'),
(1541, 'block_activity_results', 'config_decimalpoints_locked', ''),
(1542, 'block_myoverview', 'defaulttab', 'timeline'),
(1543, 'block_section_links', 'numsections1', '22'),
(1544, 'block_section_links', 'incby1', '2'),
(1545, 'block_section_links', 'numsections2', '40'),
(1546, 'block_section_links', 'incby2', '5'),
(1547, 'block_tag_youtube', 'apikey', ''),
(1548, 'format_singleactivity', 'activitytype', 'forum'),
(1549, 'fileconverter_googledrive', 'issuerid', ''),
(1550, 'enrol_cohort', 'roleid', '5'),
(1551, 'enrol_cohort', 'unenrolaction', '0'),
(1552, 'enrol_meta', 'nosyncroleids', ''),
(1553, 'enrol_meta', 'syncall', '1'),
(1554, 'enrol_meta', 'unenrolaction', '3'),
(1555, 'enrol_meta', 'coursesort', 'sortorder'),
(1556, 'enrol_database', 'dbtype', ''),
(1557, 'enrol_database', 'dbhost', 'localhost'),
(1558, 'enrol_database', 'dbuser', ''),
(1559, 'enrol_database', 'dbpass', ''),
(1560, 'enrol_database', 'dbname', ''),
(1561, 'enrol_database', 'dbencoding', 'utf-8'),
(1562, 'enrol_database', 'dbsetupsql', ''),
(1563, 'enrol_database', 'dbsybasequoting', '0'),
(1564, 'enrol_database', 'debugdb', '0'),
(1565, 'enrol_database', 'localcoursefield', 'idnumber'),
(1566, 'enrol_database', 'localuserfield', 'idnumber'),
(1567, 'enrol_database', 'localrolefield', 'shortname'),
(1568, 'enrol_database', 'localcategoryfield', 'id'),
(1569, 'enrol_database', 'remoteenroltable', ''),
(1570, 'enrol_database', 'remotecoursefield', ''),
(1571, 'enrol_database', 'remoteuserfield', ''),
(1572, 'enrol_database', 'remoterolefield', ''),
(1573, 'enrol_database', 'remoteotheruserfield', ''),
(1574, 'enrol_database', 'defaultrole', '5'),
(1575, 'enrol_database', 'ignorehiddencourses', '0'),
(1576, 'enrol_database', 'unenrolaction', '0'),
(1577, 'enrol_database', 'newcoursetable', ''),
(1578, 'enrol_database', 'newcoursefullname', 'fullname'),
(1579, 'enrol_database', 'newcourseshortname', 'shortname'),
(1580, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(1581, 'enrol_database', 'newcoursecategory', ''),
(1582, 'enrol_database', 'defaultcategory', '1'),
(1583, 'enrol_database', 'templatecourse', ''),
(1584, 'enrol_flatfile', 'location', ''),
(1585, 'enrol_flatfile', 'encoding', 'UTF-8'),
(1586, 'enrol_flatfile', 'mailstudents', '0'),
(1587, 'enrol_flatfile', 'mailteachers', '0'),
(1588, 'enrol_flatfile', 'mailadmins', '0'),
(1589, 'enrol_flatfile', 'unenrolaction', '3'),
(1590, 'enrol_flatfile', 'expiredaction', '3'),
(1591, 'enrol_guest', 'requirepassword', '0'),
(1592, 'enrol_guest', 'usepasswordpolicy', '0'),
(1593, 'enrol_guest', 'showhint', '0'),
(1594, 'enrol_guest', 'defaultenrol', '1'),
(1595, 'enrol_guest', 'status', '1'),
(1596, 'enrol_guest', 'status_adv', ''),
(1597, 'enrol_imsenterprise', 'imsfilelocation', ''),
(1598, 'enrol_imsenterprise', 'logtolocation', ''),
(1599, 'enrol_imsenterprise', 'mailadmins', '0'),
(1600, 'enrol_imsenterprise', 'createnewusers', '0'),
(1601, 'enrol_imsenterprise', 'imsupdateusers', '0'),
(1602, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(1603, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(1604, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(1605, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(1606, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(1607, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(1608, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(1609, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(1610, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(1611, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(1612, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(1613, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(1614, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(1615, 'enrol_imsenterprise', 'createnewcourses', '0'),
(1616, 'enrol_imsenterprise', 'updatecourses', '0'),
(1617, 'enrol_imsenterprise', 'createnewcategories', '0'),
(1618, 'enrol_imsenterprise', 'nestedcategories', '0'),
(1619, 'enrol_imsenterprise', 'categoryidnumber', '0'),
(1620, 'enrol_imsenterprise', 'categoryseparator', ''),
(1621, 'enrol_imsenterprise', 'imsunenrol', '0'),
(1622, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(1623, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(1624, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(1625, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(1626, 'enrol_imsenterprise', 'imscapitafix', '0'),
(1627, 'enrol_manual', 'expiredaction', '1'),
(1628, 'enrol_manual', 'expirynotifyhour', '6'),
(1629, 'enrol_manual', 'defaultenrol', '1'),
(1630, 'enrol_manual', 'status', '0'),
(1631, 'enrol_manual', 'roleid', '5'),
(1632, 'enrol_manual', 'enrolstart', '4'),
(1633, 'enrol_manual', 'enrolperiod', '0'),
(1634, 'enrol_manual', 'expirynotify', '0'),
(1635, 'enrol_manual', 'expirythreshold', '86400'),
(1636, 'enrol_mnet', 'roleid', '5'),
(1637, 'enrol_mnet', 'roleid_adv', '1'),
(1638, 'enrol_paypal', 'paypalbusiness', ''),
(1639, 'enrol_paypal', 'mailstudents', '0'),
(1640, 'enrol_paypal', 'mailteachers', '0'),
(1641, 'enrol_paypal', 'mailadmins', '0'),
(1642, 'enrol_paypal', 'expiredaction', '3'),
(1643, 'enrol_paypal', 'status', '1'),
(1644, 'enrol_paypal', 'cost', '0'),
(1645, 'enrol_paypal', 'currency', 'USD'),
(1646, 'enrol_paypal', 'roleid', '5'),
(1647, 'enrol_paypal', 'enrolperiod', '0'),
(1648, 'enrol_lti', 'emaildisplay', '2'),
(1649, 'enrol_lti', 'city', ''),
(1650, 'enrol_lti', 'country', ''),
(1651, 'enrol_lti', 'timezone', '99'),
(1652, 'enrol_lti', 'lang', 'en'),
(1653, 'enrol_lti', 'institution', ''),
(1654, 'enrol_self', 'requirepassword', '0'),
(1655, 'enrol_self', 'usepasswordpolicy', '0'),
(1656, 'enrol_self', 'showhint', '0'),
(1657, 'enrol_self', 'expiredaction', '1'),
(1658, 'enrol_self', 'expirynotifyhour', '6'),
(1659, 'enrol_self', 'defaultenrol', '1'),
(1660, 'enrol_self', 'status', '1'),
(1661, 'enrol_self', 'newenrols', '1'),
(1662, 'enrol_self', 'groupkey', '0'),
(1663, 'enrol_self', 'roleid', '5'),
(1664, 'enrol_self', 'enrolperiod', '0'),
(1665, 'enrol_self', 'expirynotify', '0'),
(1666, 'enrol_self', 'expirythreshold', '86400'),
(1667, 'enrol_self', 'longtimenosee', '0'),
(1668, 'enrol_self', 'maxenrolled', '0'),
(1669, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1670, 'filter_urltolink', 'formats', '0'),
(1671, 'filter_urltolink', 'embedimages', '1'),
(1672, 'filter_emoticon', 'formats', '1,4,0'),
(1673, 'filter_mathjaxloader', 'httpsurl', 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js'),
(1674, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
(1675, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n'),
(1676, 'filter_mathjaxloader', 'additionaldelimiters', ''),
(1677, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(1678, 'filter_tex', 'latexbackground', '#FFFFFF'),
(1679, 'filter_tex', 'density', '120'),
(1680, 'filter_tex', 'pathlatex', '/usr/bin/latex'),
(1681, 'filter_tex', 'pathdvips', '/usr/bin/dvips'),
(1682, 'filter_tex', 'pathconvert', '/usr/bin/convert'),
(1683, 'filter_tex', 'pathdvisvgm', '/usr/bin/dvisvgm'),
(1684, 'filter_tex', 'pathmimetex', ''),
(1685, 'filter_tex', 'convertformat', 'gif'),
(1686, 'logstore_database', 'dbdriver', ''),
(1687, 'logstore_database', 'dbhost', ''),
(1688, 'logstore_database', 'dbuser', ''),
(1689, 'logstore_database', 'dbpass', ''),
(1690, 'logstore_database', 'dbname', ''),
(1691, 'logstore_database', 'dbtable', ''),
(1692, 'logstore_database', 'dbpersist', '0'),
(1693, 'logstore_database', 'dbsocket', ''),
(1694, 'logstore_database', 'dbport', ''),
(1695, 'logstore_database', 'dbschema', ''),
(1696, 'logstore_database', 'dbcollation', ''),
(1697, 'logstore_database', 'dbhandlesoptions', '0'),
(1698, 'logstore_database', 'buffersize', '50'),
(1699, 'logstore_database', 'logguests', '0'),
(1700, 'logstore_database', 'includelevels', '1,2,0'),
(1701, 'logstore_database', 'includeactions', 'c,r,u,d'),
(1702, 'logstore_legacy', 'loglegacy', '0'),
(1703, 'logstore_standard', 'logguests', '1'),
(1704, 'logstore_standard', 'loglifetime', '0'),
(1705, 'logstore_standard', 'buffersize', '50'),
(1706, 'media_videojs', 'videoextensions', 'html_video,.f4v,.flv'),
(1707, 'media_videojs', 'audioextensions', 'html_audio'),
(1708, 'media_videojs', 'useflash', '0'),
(1709, 'media_videojs', 'youtube', '1'),
(1710, 'media_videojs', 'videocssclass', 'video-js'),
(1711, 'media_videojs', 'audiocssclass', 'video-js'),
(1712, 'media_videojs', 'limitsize', '1'),
(1713, 'qtype_multichoice', 'answerhowmany', '1'),
(1714, 'qtype_multichoice', 'shuffleanswers', '1'),
(1715, 'qtype_multichoice', 'answernumbering', 'abc'),
(1716, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),
(1717, 'editor_atto', 'autosavefrequency', '60'),
(1718, 'atto_collapse', 'showgroups', '5'),
(1719, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),
(1720, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),
(1721, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),
(1722, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),
(1723, 'atto_table', 'allowborders', '0'),
(1724, 'atto_table', 'allowbackgroundcolour', '0'),
(1725, 'atto_table', 'allowwidth', '0'),
(1726, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1727, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1728, 'editor_tinymce', 'customconfig', ''),
(1729, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1730, 'tinymce_spellchecker', 'spellengine', ''),
(1731, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='one of these must be set' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/6', 2),
(7, 80, 2, '/1/7', 2),
(8, 80, 3, '/1/8', 2),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/5/14', 3),
(15, 80, 10, '/1/5/15', 3),
(16, 80, 11, '/1/5/16', 3),
(17, 80, 12, '/1/5/17', 3),
(18, 80, 13, '/1/5/18', 3),
(19, 80, 14, '/1/5/19', 3),
(20, 80, 15, '/1/5/20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Used by build_context_path() in upgrade and cron to keep con' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `enddate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Central course table' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `enddate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 0, 'System school', 'School', '', '', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1524839710, 1524840176, 0, 0, 0, 1524852836);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course categories' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 0, 1, 1, 1524839710, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion records' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion aggregation methods for criteria' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion criteria' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Course completion user records' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_defaults`
--

CREATE TABLE `mdl_course_completion_defaults` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionusegrade` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `customrules` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Default settings for activities completion' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores format-specific options for the course or course sect' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleoncoursepage` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext,
  `deletioninprogress` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='course_modules table retrofitted from MySQL' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `overrideby` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the completion state (completed or not completed, etc' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about how and when an local courses were publish' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='course requests' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='to define the sections for each course' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `config` longtext,
  `completionentries` bigint(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all database activities' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='the content introduced in each record/fields' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='every field available' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='every record introduced' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_editor_atto_autosave`
--

CREATE TABLE `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL,
  `elementid` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Draft text that is auto-saved every 5 seconds while an edito' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

INSERT INTO `mdl_editor_atto_autosave` (`id`, `elementid`, `contextid`, `pagehash`, `userid`, `drafttext`, `draftid`, `pageinstance`, `timemodified`) VALUES
(1, 'id_summary_editor', 3, 'd95a36df429c791a03f61f84c0ccf86bb85e1346', 2, '', 103900352, 'yui_3_17_2_1_1525096786399_273', 1525096787),
(2, 'id_description_editor', 1, '0a09683d4870941bc86225ed95557b4a454c9e90', 2, '', -1, 'yui_3_17_2_1_1525097354755_112', 1525097355);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Instances of enrolment plugins used in courses, fields marke' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='enrol_flatfile table retrofitted from MySQL' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_consumer`
--

CREATE TABLE `mdl_enrol_lti_lti2_consumer` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `consumerkey256` varchar(255) NOT NULL DEFAULT '',
  `consumerkey` longtext,
  `secret` varchar(1024) NOT NULL DEFAULT '',
  `ltiversion` varchar(10) DEFAULT NULL,
  `consumername` varchar(255) DEFAULT NULL,
  `consumerversion` varchar(255) DEFAULT NULL,
  `consumerguid` varchar(1024) DEFAULT NULL,
  `profile` longtext,
  `toolproxy` longtext,
  `settings` longtext,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enablefrom` bigint(10) DEFAULT NULL,
  `enableuntil` bigint(10) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI consumers interacting with moodle' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_context`
--

CREATE TABLE `mdl_enrol_lti_lti2_context` (
  `id` bigint(11) NOT NULL,
  `consumerid` bigint(11) NOT NULL,
  `lticontextkey` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(100) DEFAULT NULL,
  `settings` longtext,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about a specific LTI contexts from the consumers' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_nonce`
--

CREATE TABLE `mdl_enrol_lti_lti2_nonce` (
  `id` bigint(11) NOT NULL,
  `consumerid` bigint(11) NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Nonce used for authentication between moodle and a consumer' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_resource_link`
--

CREATE TABLE `mdl_enrol_lti_lti2_resource_link` (
  `id` bigint(11) NOT NULL,
  `contextid` bigint(11) DEFAULT NULL,
  `consumerid` bigint(11) DEFAULT NULL,
  `ltiresourcelinkkey` varchar(255) NOT NULL DEFAULT '',
  `settings` longtext,
  `primaryresourcelinkid` bigint(11) DEFAULT NULL,
  `shareapproved` tinyint(1) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link from the consumer to the tool' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_share_key`
--

CREATE TABLE `mdl_enrol_lti_lti2_share_key` (
  `id` bigint(11) NOT NULL,
  `sharekey` varchar(32) NOT NULL DEFAULT '',
  `resourcelinkid` bigint(11) NOT NULL,
  `autoapprove` tinyint(1) NOT NULL,
  `expires` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Resource link share key' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_tool_proxy`
--

CREATE TABLE `mdl_enrol_lti_lti2_tool_proxy` (
  `id` bigint(11) NOT NULL,
  `toolproxykey` varchar(32) NOT NULL DEFAULT '',
  `consumerid` bigint(11) NOT NULL,
  `toolproxy` longtext NOT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A tool proxy between moodle and a consumer' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_user_result`
--

CREATE TABLE `mdl_enrol_lti_lti2_user_result` (
  `id` bigint(11) NOT NULL,
  `resourcelinkid` bigint(11) NOT NULL,
  `ltiuserkey` varchar(255) NOT NULL DEFAULT '',
  `ltiresultsourcedid` varchar(1024) NOT NULL DEFAULT '',
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Results for each user for each resource link' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_tools`
--

CREATE TABLE `mdl_enrol_lti_tools` (
  `id` bigint(10) NOT NULL,
  `enrolid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `institution` varchar(40) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `maxenrolled` bigint(10) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint(10) NOT NULL,
  `rolelearner` bigint(10) NOT NULL,
  `secret` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of tools provided to the remote system' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_tool_consumer_map`
--

CREATE TABLE `mdl_enrol_lti_tool_consumer_map` (
  `id` bigint(10) NOT NULL,
  `toolid` bigint(11) NOT NULL,
  `consumerid` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table that maps the published tool to tool consumers.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_users`
--

CREATE TABLE `mdl_enrol_lti_users` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `toolid` bigint(10) NOT NULL,
  `serviceurl` longtext,
  `sourceid` longtext,
  `consumerkey` longtext,
  `consumersecret` longtext,
  `membershipsurl` longtext,
  `membershipsid` longtext,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User access log and gradeback data' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Holds all known information about PayPal transactions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `type` smallint(4) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `timesort` bigint(10) DEFAULT NULL,
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  `priority` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For everything with a time associated to it' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is for storing which components requests what typ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is for storing queued events. It stores only one ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the list of queued handlers for processing. The even' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks subscriptions to remote calendars.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  `services` varchar(1333) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='list of all external functions' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`, `services`) VALUES
(1, 'core_auth_confirm_user', 'core_auth_external', 'confirm_user', NULL, 'moodle', '', NULL),
(2, 'core_auth_request_password_reset', 'core_auth_external', 'request_password_reset', NULL, 'moodle', '', NULL),
(3, 'core_auth_is_minor', 'core_auth_external', 'is_minor', NULL, 'moodle', '', NULL),
(4, 'core_auth_is_age_digital_consent_verification_enabled', 'core_auth_external', 'is_age_digital_consent_verification_enabled', NULL, 'moodle', '', NULL),
(5, 'core_badges_get_user_badges', 'core_badges_external', 'get_user_badges', NULL, 'moodle', 'moodle/badges:viewotherbadges', 'moodle_mobile_app'),
(6, 'core_calendar_get_calendar_monthly_view', 'core_calendar_external', 'get_calendar_monthly_view', 'calendar/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(7, 'core_calendar_get_calendar_day_view', 'core_calendar_external', 'get_calendar_day_view', 'calendar/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(8, 'core_calendar_get_calendar_upcoming_view', 'core_calendar_external', 'get_calendar_upcoming_view', 'calendar/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(9, 'core_calendar_update_event_start_day', 'core_calendar_external', 'update_event_start_day', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', NULL),
(10, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(11, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(12, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(13, 'core_calendar_get_action_events_by_timesort', 'core_calendar_external', 'get_calendar_action_events_by_timesort', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(14, 'core_calendar_get_action_events_by_course', 'core_calendar_external', 'get_calendar_action_events_by_course', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(15, 'core_calendar_get_action_events_by_courses', 'core_calendar_external', 'get_calendar_action_events_by_courses', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(16, 'core_calendar_get_calendar_event_by_id', 'core_calendar_external', 'get_calendar_event_by_id', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(17, 'core_calendar_submit_create_update_form', 'core_calendar_external', 'submit_create_update_form', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', NULL),
(18, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
(19, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(20, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
(21, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(22, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(23, 'core_cohort_search_cohorts', 'core_cohort_external', 'search_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(24, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(25, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(26, 'core_comment_get_comments', 'core_comment_external', 'get_comments', NULL, 'moodle', 'moodle/comment:view', 'moodle_mobile_app'),
(27, 'core_completion_get_activities_completion_status', 'core_completion_external', 'get_activities_completion_status', NULL, 'moodle', '', 'moodle_mobile_app'),
(28, 'core_completion_get_course_completion_status', 'core_completion_external', 'get_course_completion_status', NULL, 'moodle', 'report/completion:view', 'moodle_mobile_app'),
(29, 'core_completion_mark_course_self_completed', 'core_completion_external', 'mark_course_self_completed', NULL, 'moodle', '', 'moodle_mobile_app'),
(30, 'core_completion_update_activity_completion_status_manually', 'core_completion_external', 'update_activity_completion_status_manually', NULL, 'moodle', '', 'moodle_mobile_app'),
(31, 'core_completion_override_activity_completion_status', 'core_completion_external', 'override_activity_completion_status', NULL, 'moodle', 'moodle/course:overridecompletion', NULL),
(32, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(33, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create, moodle/course:visibility', NULL),
(34, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(35, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete', NULL),
(36, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities', NULL),
(37, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse, moodle/restore:restorecourse, moodle/course:create', NULL),
(38, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories', 'moodle_mobile_app'),
(39, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
(40, 'core_course_get_course_module', 'core_course_external', 'get_course_module', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(41, 'core_course_get_course_module_by_instance', 'core_course_external', 'get_course_module_by_instance', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(42, 'core_course_get_module', 'core_course_external', 'get_module', 'course/externallib.php', 'moodle', '', NULL),
(43, 'core_course_edit_module', 'core_course_external', 'edit_module', 'course/externallib.php', 'moodle', '', NULL),
(44, 'core_course_edit_section', 'core_course_external', 'edit_section', 'course/externallib.php', 'moodle', '', NULL),
(45, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view, moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
(46, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport', NULL),
(47, 'core_course_search_courses', 'core_course_external', 'search_courses', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(48, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(49, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:changecategory, moodle/course:changefullname, moodle/course:changeshortname, moodle/course:changeidnumber, moodle/course:changesummary, moodle/course:visibility', NULL),
(50, 'core_course_view_course', 'core_course_external', 'view_course', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(51, 'core_course_get_activities_overview', 'core_course_external', 'get_activities_overview', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(52, 'core_course_get_user_navigation_options', 'core_course_external', 'get_user_navigation_options', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(53, 'core_course_get_user_administration_options', 'core_course_external', 'get_user_administration_options', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(54, 'core_course_get_courses_by_field', 'core_course_external', 'get_courses_by_field', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(55, 'core_course_check_updates', 'core_course_external', 'check_updates', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(56, 'core_course_get_updates_since', 'core_course_external', 'get_updates_since', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(57, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(58, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
(59, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', '', NULL),
(60, 'core_enrol_get_potential_users', 'core_enrol_external', 'get_potential_users', 'enrol/externallib.php', 'moodle', 'moodle/course:enrolreview', NULL),
(61, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
(62, 'core_enrol_edit_user_enrolment', 'core_enrol_external', 'edit_user_enrolment', 'enrol/externallib.php', 'moodle', '', NULL),
(63, 'core_enrol_unenrol_user_enrolment', 'core_enrol_external', 'unenrol_user_enrolment', 'enrol/externallib.php', 'moodle', '', NULL),
(64, 'core_fetch_notifications', 'core_external', 'fetch_notifications', 'lib/external/externallib.php', 'moodle', '', NULL),
(65, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(66, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', '', NULL),
(67, 'core_form_get_filetypes_browser_data', 'core_form\\external', 'get_filetypes_browser_data', NULL, 'moodle', '', NULL),
(68, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(69, 'core_get_fragment', 'core_external', 'get_fragment', 'lib/external/externallib.php', 'moodle', '', NULL),
(70, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', '', NULL),
(71, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', '', NULL),
(72, 'core_get_user_dates', 'core_external', 'get_user_dates', 'lib/external/externallib.php', 'moodle', '', NULL),
(73, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden', NULL),
(74, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', '', NULL),
(75, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', '', NULL),
(76, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', '', NULL),
(77, 'core_grading_save_definitions', 'core_grading_external', 'save_definitions', NULL, 'moodle', '', NULL),
(78, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(79, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', '', NULL),
(80, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', '', NULL),
(81, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(82, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(83, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', '', NULL),
(84, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(85, 'core_group_get_activity_allowed_groups', 'core_group_external', 'get_activity_allowed_groups', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(86, 'core_group_get_activity_groupmode', 'core_group_external', 'get_activity_groupmode', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(87, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', '', NULL),
(88, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(89, 'core_group_get_course_user_groups', 'core_group_external', 'get_course_user_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', 'moodle_mobile_app'),
(90, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(91, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', '', NULL),
(92, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(93, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', '', NULL),
(94, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', '', NULL),
(95, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(96, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(97, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(98, 'core_message_delete_conversation', 'core_message_external', 'delete_conversation', 'message/externallib.php', 'moodle', 'moodle/site:deleteownmessage', 'moodle_mobile_app'),
(99, 'core_message_delete_message', 'core_message_external', 'delete_message', 'message/externallib.php', 'moodle', 'moodle/site:deleteownmessage', 'moodle_mobile_app'),
(100, 'core_message_get_blocked_users', 'core_message_external', 'get_blocked_users', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(101, 'core_message_data_for_messagearea_search_messages', 'core_message_external', 'data_for_messagearea_search_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(102, 'core_message_data_for_messagearea_search_users', 'core_message_external', 'data_for_messagearea_search_users', 'message/externallib.php', 'moodle', '', NULL),
(103, 'core_message_data_for_messagearea_search_users_in_course', 'core_message_external', 'data_for_messagearea_search_users_in_course', 'message/externallib.php', 'moodle', '', NULL),
(104, 'core_message_data_for_messagearea_conversations', 'core_message_external', 'data_for_messagearea_conversations', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(105, 'core_message_data_for_messagearea_contacts', 'core_message_external', 'data_for_messagearea_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(106, 'core_message_data_for_messagearea_messages', 'core_message_external', 'data_for_messagearea_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(107, 'core_message_data_for_messagearea_get_most_recent_message', 'core_message_external', 'data_for_messagearea_get_most_recent_message', 'message/externallib.php', 'moodle', '', NULL),
(108, 'core_message_data_for_messagearea_get_profile', 'core_message_external', 'data_for_messagearea_get_profile', 'message/externallib.php', 'moodle', '', NULL),
(109, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(110, 'core_message_get_messages', 'core_message_external', 'get_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(111, 'core_message_get_unread_conversations_count', 'core_message_external', 'get_unread_conversations_count', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(112, 'core_message_mark_all_notifications_as_read', 'core_message_external', 'mark_all_notifications_as_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(113, 'core_message_mark_all_messages_as_read', 'core_message_external', 'mark_all_messages_as_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(114, 'core_message_mark_message_read', 'core_message_external', 'mark_message_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(115, 'core_message_message_processor_config_form', 'core_message_external', 'message_processor_config_form', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(116, 'core_message_get_message_processor', 'core_message_external', 'get_message_processor', 'message/externallib.php', 'moodle', '', NULL),
(117, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(118, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage', 'moodle_mobile_app'),
(119, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(120, 'core_message_get_user_notification_preferences', 'core_message_external', 'get_user_notification_preferences', 'message/externallib.php', 'moodle', 'moodle/user:editownmessageprofile', 'moodle_mobile_app'),
(121, 'core_message_get_user_message_preferences', 'core_message_external', 'get_user_message_preferences', 'message/externallib.php', 'moodle', 'moodle/user:editownmessageprofile', 'moodle_mobile_app'),
(122, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
(123, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
(124, 'core_notes_get_course_notes', 'core_notes_external', 'get_course_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
(125, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', NULL),
(126, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', NULL),
(127, 'core_notes_view_notes', 'core_notes_external', 'view_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
(128, 'core_output_load_template', 'core\\output\\external', 'load_template', NULL, 'moodle', '', NULL),
(129, 'core_output_load_fontawesome_icon_map', 'core\\output\\external', 'load_fontawesome_icon_map', NULL, 'moodle', '', NULL),
(130, 'core_question_update_flag', 'core_question_external', 'update_flag', NULL, 'moodle', 'moodle/question:flag', 'moodle_mobile_app'),
(131, 'core_rating_get_item_ratings', 'core_rating_external', 'get_item_ratings', NULL, 'moodle', 'moodle/rating:view', 'moodle_mobile_app'),
(132, 'core_rating_add_rating', 'core_rating_external', 'add_rating', NULL, 'moodle', 'moodle/rating:rate', 'moodle_mobile_app'),
(133, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
(134, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
(135, 'core_tag_get_tagindex', 'core_tag_external', 'get_tagindex', NULL, 'moodle', '', NULL),
(136, 'core_tag_get_tags', 'core_tag_external', 'get_tags', NULL, 'moodle', '', NULL),
(137, 'core_tag_update_tags', 'core_tag_external', 'update_tags', NULL, 'moodle', '', NULL),
(138, 'core_update_inplace_editable', 'core_external', 'update_inplace_editable', 'lib/external/externallib.php', 'moodle', '', NULL),
(139, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(140, 'core_user_add_user_private_files', 'core_user_external', 'add_user_private_files', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles', 'moodle_mobile_app'),
(141, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create', NULL),
(142, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete', NULL),
(143, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
(144, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', NULL),
(145, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', 'moodle_mobile_app'),
(146, 'core_user_remove_user_device', 'core_user_external', 'remove_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(147, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update', NULL),
(148, 'core_user_update_user_preferences', 'core_user_external', 'update_user_preferences', 'user/externallib.php', 'moodle', 'moodle/user:editownmessageprofile, moodle/user:editmessageprofile', 'moodle_mobile_app'),
(149, 'core_user_view_user_list', 'core_user_external', 'view_user_list', 'user/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
(150, 'core_user_view_user_profile', 'core_user_external', 'view_user_profile', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails', 'moodle_mobile_app'),
(151, 'core_user_get_user_preferences', 'core_user_external', 'get_user_preferences', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(152, 'core_user_update_picture', 'core_user_external', 'update_picture', 'user/externallib.php', 'moodle', 'moodle/user:editownprofile, moodle/user:editprofile', 'moodle_mobile_app'),
(153, 'core_user_set_user_preferences', 'core_user_external', 'set_user_preferences', 'user/externallib.php', 'moodle', 'moodle/site:config', NULL),
(154, 'core_user_agree_site_policy', 'core_user_external', 'agree_site_policy', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(155, 'core_user_get_private_files_info', 'core_user_external', 'get_private_files_info', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles', 'moodle_mobile_app'),
(156, 'core_competency_create_competency_framework', 'core_competency\\external', 'create_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(157, 'core_competency_read_competency_framework', 'core_competency\\external', 'read_competency_framework', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(158, 'core_competency_duplicate_competency_framework', 'core_competency\\external', 'duplicate_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(159, 'core_competency_delete_competency_framework', 'core_competency\\external', 'delete_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(160, 'core_competency_update_competency_framework', 'core_competency\\external', 'update_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(161, 'core_competency_list_competency_frameworks', 'core_competency\\external', 'list_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(162, 'core_competency_count_competency_frameworks', 'core_competency\\external', 'count_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(163, 'core_competency_competency_framework_viewed', 'core_competency\\external', 'competency_framework_viewed', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(164, 'core_competency_create_competency', 'core_competency\\external', 'create_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(165, 'core_competency_read_competency', 'core_competency\\external', 'read_competency', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(166, 'core_competency_competency_viewed', 'core_competency\\external', 'competency_viewed', NULL, 'moodle', 'moodle/competency:competencyview', 'moodle_mobile_app'),
(167, 'core_competency_delete_competency', 'core_competency\\external', 'delete_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(168, 'core_competency_update_competency', 'core_competency\\external', 'update_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(169, 'core_competency_list_competencies', 'core_competency\\external', 'list_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(170, 'core_competency_list_competencies_in_template', 'core_competency\\external', 'list_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(171, 'core_competency_count_competencies', 'core_competency\\external', 'count_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(172, 'core_competency_count_competencies_in_template', 'core_competency\\external', 'count_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(173, 'core_competency_search_competencies', 'core_competency\\external', 'search_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(174, 'core_competency_set_parent_competency', 'core_competency\\external', 'set_parent_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(175, 'core_competency_move_up_competency', 'core_competency\\external', 'move_up_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(176, 'core_competency_move_down_competency', 'core_competency\\external', 'move_down_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(177, 'core_competency_list_course_competencies', 'core_competency\\external', 'list_course_competencies', NULL, 'moodle', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(178, 'core_competency_count_competencies_in_course', 'core_competency\\external', 'count_competencies_in_course', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
(179, 'core_competency_count_courses_using_competency', 'core_competency\\external', 'count_courses_using_competency', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
(180, 'core_competency_add_competency_to_course', 'core_competency\\external', 'add_competency_to_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(181, 'core_competency_add_competency_to_template', 'core_competency\\external', 'add_competency_to_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(182, 'core_competency_remove_competency_from_course', 'core_competency\\external', 'remove_competency_from_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(183, 'core_competency_set_course_competency_ruleoutcome', 'core_competency\\external', 'set_course_competency_ruleoutcome', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(184, 'core_competency_remove_competency_from_template', 'core_competency\\external', 'remove_competency_from_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(185, 'core_competency_reorder_course_competency', 'core_competency\\external', 'reorder_course_competency', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(186, 'core_competency_reorder_template_competency', 'core_competency\\external', 'reorder_template_competency', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(187, 'core_competency_create_template', 'core_competency\\external', 'create_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(188, 'core_competency_duplicate_template', 'core_competency\\external', 'duplicate_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(189, 'core_competency_read_template', 'core_competency\\external', 'read_template', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(190, 'core_competency_delete_template', 'core_competency\\external', 'delete_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(191, 'core_competency_update_template', 'core_competency\\external', 'update_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(192, 'core_competency_list_templates', 'core_competency\\external', 'list_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(193, 'core_competency_list_templates_using_competency', 'core_competency\\external', 'list_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(194, 'core_competency_count_templates', 'core_competency\\external', 'count_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(195, 'core_competency_count_templates_using_competency', 'core_competency\\external', 'count_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(196, 'core_competency_create_plan', 'core_competency\\external', 'create_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(197, 'core_competency_update_plan', 'core_competency\\external', 'update_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(198, 'core_competency_complete_plan', 'core_competency\\external', 'complete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(199, 'core_competency_reopen_plan', 'core_competency\\external', 'reopen_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(200, 'core_competency_read_plan', 'core_competency\\external', 'read_plan', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(201, 'core_competency_delete_plan', 'core_competency\\external', 'delete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(202, 'core_competency_list_user_plans', 'core_competency\\external', 'list_user_plans', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(203, 'core_competency_list_plan_competencies', 'core_competency\\external', 'list_plan_competencies', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(204, 'core_competency_add_competency_to_plan', 'core_competency\\external', 'add_competency_to_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(205, 'core_competency_remove_competency_from_plan', 'core_competency\\external', 'remove_competency_from_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(206, 'core_competency_reorder_plan_competency', 'core_competency\\external', 'reorder_plan_competency', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(207, 'core_competency_plan_request_review', 'core_competency\\external', 'plan_request_review', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
(208, 'core_competency_plan_start_review', 'core_competency\\external', 'plan_start_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(209, 'core_competency_plan_stop_review', 'core_competency\\external', 'plan_stop_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(210, 'core_competency_plan_cancel_review_request', 'core_competency\\external', 'plan_cancel_review_request', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
(211, 'core_competency_approve_plan', 'core_competency\\external', 'approve_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(212, 'core_competency_unapprove_plan', 'core_competency\\external', 'unapprove_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(213, 'core_competency_template_has_related_data', 'core_competency\\external', 'template_has_related_data', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(214, 'core_competency_get_scale_values', 'core_competency\\external', 'get_scale_values', NULL, 'moodle', 'moodle/competency:competencymanage', 'moodle_mobile_app'),
(215, 'core_competency_add_related_competency', 'core_competency\\external', 'add_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(216, 'core_competency_remove_related_competency', 'core_competency\\external', 'remove_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(217, 'core_competency_read_user_evidence', 'core_competency\\external', 'read_user_evidence', NULL, 'moodle', 'moodle/competency:userevidenceview', NULL),
(218, 'core_competency_delete_user_evidence', 'core_competency\\external', 'delete_user_evidence', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(219, 'core_competency_create_user_evidence_competency', 'core_competency\\external', 'create_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown, moodle/competency:competencyview', NULL),
(220, 'core_competency_delete_user_evidence_competency', 'core_competency\\external', 'delete_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(221, 'core_competency_user_competency_cancel_review_request', 'core_competency\\external', 'user_competency_cancel_review_request', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(222, 'core_competency_user_competency_request_review', 'core_competency\\external', 'user_competency_request_review', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(223, 'core_competency_user_competency_start_review', 'core_competency\\external', 'user_competency_start_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(224, 'core_competency_user_competency_stop_review', 'core_competency\\external', 'user_competency_stop_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(225, 'core_competency_user_competency_viewed', 'core_competency\\external', 'user_competency_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(226, 'core_competency_user_competency_viewed_in_plan', 'core_competency\\external', 'user_competency_viewed_in_plan', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(227, 'core_competency_user_competency_viewed_in_course', 'core_competency\\external', 'user_competency_viewed_in_course', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(228, 'core_competency_user_competency_plan_viewed', 'core_competency\\external', 'user_competency_plan_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(229, 'core_competency_grade_competency', 'core_competency\\external', 'grade_competency', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(230, 'core_competency_grade_competency_in_plan', 'core_competency\\external', 'grade_competency_in_plan', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(231, 'core_competency_grade_competency_in_course', 'core_competency\\external', 'grade_competency_in_course', NULL, 'moodle', 'moodle/competency:competencygrade', 'moodle_mobile_app'),
(232, 'core_competency_unlink_plan_from_template', 'core_competency\\external', 'unlink_plan_from_template', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(233, 'core_competency_template_viewed', 'core_competency\\external', 'template_viewed', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(234, 'core_competency_request_review_of_user_evidence_linked_competencies', 'core_competency\\external', 'request_review_of_user_evidence_linked_competencies', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(235, 'core_competency_update_course_competency_settings', 'core_competency\\external', 'update_course_competency_settings', NULL, 'moodle', 'moodle/competency:coursecompetencyconfigure', NULL),
(236, 'core_competency_delete_evidence', 'core_competency\\external', 'delete_evidence', NULL, 'moodle', 'moodle/competency:evidencedelete', 'moodle_mobile_app'),
(237, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(238, 'core_block_get_course_blocks', 'core_block_external', 'get_course_blocks', NULL, 'moodle', '', 'moodle_mobile_app'),
(239, 'core_filters_get_available_in_context', 'core_filters\\external', 'get_available_in_context', NULL, 'moodle', '', 'moodle_mobile_app'),
(240, 'mod_assign_copy_previous_attempt', 'mod_assign_external', 'copy_previous_attempt', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:submit', NULL),
(241, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(242, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(243, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(244, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(245, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', 'moodle_mobile_app'),
(246, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(247, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(248, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(249, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(250, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(251, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(252, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(253, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(254, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(255, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(256, 'mod_assign_view_grading_table', 'mod_assign_external', 'view_grading_table', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(257, 'mod_assign_view_submission_status', 'mod_assign_external', 'view_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(258, 'mod_assign_get_submission_status', 'mod_assign_external', 'get_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(259, 'mod_assign_list_participants', 'mod_assign_external', 'list_participants', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(260, 'mod_assign_submit_grading_form', 'mod_assign_external', 'submit_grading_form', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', 'moodle_mobile_app'),
(261, 'mod_assign_get_participant', 'mod_assign_external', 'get_participant', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(262, 'mod_assign_view_assign', 'mod_assign_external', 'view_assign', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(263, 'mod_book_view_book', 'mod_book_external', 'view_book', NULL, 'mod_book', 'mod/book:read', 'moodle_mobile_app'),
(264, 'mod_book_get_books_by_courses', 'mod_book_external', 'get_books_by_courses', NULL, 'mod_book', '', 'moodle_mobile_app'),
(265, 'mod_chat_login_user', 'mod_chat_external', 'login_user', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(266, 'mod_chat_get_chat_users', 'mod_chat_external', 'get_chat_users', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(267, 'mod_chat_send_chat_message', 'mod_chat_external', 'send_chat_message', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(268, 'mod_chat_get_chat_latest_messages', 'mod_chat_external', 'get_chat_latest_messages', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(269, 'mod_chat_view_chat', 'mod_chat_external', 'view_chat', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(270, 'mod_chat_get_chats_by_courses', 'mod_chat_external', 'get_chats_by_courses', NULL, 'mod_chat', '', 'moodle_mobile_app'),
(271, 'mod_choice_get_choice_results', 'mod_choice_external', 'get_choice_results', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(272, 'mod_choice_get_choice_options', 'mod_choice_external', 'get_choice_options', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(273, 'mod_choice_submit_choice_response', 'mod_choice_external', 'submit_choice_response', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(274, 'mod_choice_view_choice', 'mod_choice_external', 'view_choice', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(275, 'mod_choice_get_choices_by_courses', 'mod_choice_external', 'get_choices_by_courses', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(276, 'mod_choice_delete_choice_responses', 'mod_choice_external', 'delete_choice_responses', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(277, 'mod_data_get_databases_by_courses', 'mod_data_external', 'get_databases_by_courses', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(278, 'mod_data_view_database', 'mod_data_external', 'view_database', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(279, 'mod_data_get_data_access_information', 'mod_data_external', 'get_data_access_information', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(280, 'mod_data_get_entries', 'mod_data_external', 'get_entries', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(281, 'mod_data_get_entry', 'mod_data_external', 'get_entry', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(282, 'mod_data_get_fields', 'mod_data_external', 'get_fields', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(283, 'mod_data_search_entries', 'mod_data_external', 'search_entries', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(284, 'mod_data_approve_entry', 'mod_data_external', 'approve_entry', NULL, 'mod_data', 'mod/data:approve', 'moodle_mobile_app'),
(285, 'mod_data_delete_entry', 'mod_data_external', 'delete_entry', NULL, 'mod_data', 'mod/data:manageentries', 'moodle_mobile_app'),
(286, 'mod_data_add_entry', 'mod_data_external', 'add_entry', NULL, 'mod_data', 'mod/data:writeentry', 'moodle_mobile_app'),
(287, 'mod_data_update_entry', 'mod_data_external', 'update_entry', NULL, 'mod_data', 'mod/data:writeentry', 'moodle_mobile_app'),
(288, 'mod_feedback_get_feedbacks_by_courses', 'mod_feedback_external', 'get_feedbacks_by_courses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(289, 'mod_feedback_get_feedback_access_information', 'mod_feedback_external', 'get_feedback_access_information', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(290, 'mod_feedback_view_feedback', 'mod_feedback_external', 'view_feedback', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(291, 'mod_feedback_get_current_completed_tmp', 'mod_feedback_external', 'get_current_completed_tmp', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(292, 'mod_feedback_get_items', 'mod_feedback_external', 'get_items', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(293, 'mod_feedback_launch_feedback', 'mod_feedback_external', 'launch_feedback', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(294, 'mod_feedback_get_page_items', 'mod_feedback_external', 'get_page_items', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(295, 'mod_feedback_process_page', 'mod_feedback_external', 'process_page', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(296, 'mod_feedback_get_analysis', 'mod_feedback_external', 'get_analysis', NULL, 'mod_feedback', 'mod/feedback:viewanalysepage', 'moodle_mobile_app'),
(297, 'mod_feedback_get_unfinished_responses', 'mod_feedback_external', 'get_unfinished_responses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(298, 'mod_feedback_get_finished_responses', 'mod_feedback_external', 'get_finished_responses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(299, 'mod_feedback_get_non_respondents', 'mod_feedback_external', 'get_non_respondents', NULL, 'mod_feedback', 'mod/feedback:viewreports', 'moodle_mobile_app'),
(300, 'mod_feedback_get_responses_analysis', 'mod_feedback_external', 'get_responses_analysis', NULL, 'mod_feedback', 'mod/feedback:viewreports', 'moodle_mobile_app'),
(301, 'mod_feedback_get_last_completed', 'mod_feedback_external', 'get_last_completed', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(302, 'mod_folder_view_folder', 'mod_folder_external', 'view_folder', NULL, 'mod_folder', 'mod/folder:view', 'moodle_mobile_app'),
(303, 'mod_folder_get_folders_by_courses', 'mod_folder_external', 'get_folders_by_courses', NULL, 'mod_folder', 'mod/folder:view', 'moodle_mobile_app'),
(304, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(305, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
(306, 'mod_forum_get_forum_discussions_paginated', 'mod_forum_external', 'get_forum_discussions_paginated', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
(307, 'mod_forum_view_forum', 'mod_forum_external', 'view_forum', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(308, 'mod_forum_view_forum_discussion', 'mod_forum_external', 'view_forum_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(309, 'mod_forum_add_discussion_post', 'mod_forum_external', 'add_discussion_post', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:replypost', 'moodle_mobile_app'),
(310, 'mod_forum_add_discussion', 'mod_forum_external', 'add_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:startdiscussion', 'moodle_mobile_app'),
(311, 'mod_forum_can_add_discussion', 'mod_forum_external', 'can_add_discussion', 'mod/forum/externallib.php', 'mod_forum', '', 'moodle_mobile_app'),
(312, 'mod_glossary_get_glossaries_by_courses', 'mod_glossary_external', 'get_glossaries_by_courses', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(313, 'mod_glossary_view_glossary', 'mod_glossary_external', 'view_glossary', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(314, 'mod_glossary_view_entry', 'mod_glossary_external', 'view_entry', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(315, 'mod_glossary_get_entries_by_letter', 'mod_glossary_external', 'get_entries_by_letter', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(316, 'mod_glossary_get_entries_by_date', 'mod_glossary_external', 'get_entries_by_date', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(317, 'mod_glossary_get_categories', 'mod_glossary_external', 'get_categories', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app');
INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`, `services`) VALUES
(318, 'mod_glossary_get_entries_by_category', 'mod_glossary_external', 'get_entries_by_category', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(319, 'mod_glossary_get_authors', 'mod_glossary_external', 'get_authors', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(320, 'mod_glossary_get_entries_by_author', 'mod_glossary_external', 'get_entries_by_author', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(321, 'mod_glossary_get_entries_by_author_id', 'mod_glossary_external', 'get_entries_by_author_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(322, 'mod_glossary_get_entries_by_search', 'mod_glossary_external', 'get_entries_by_search', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(323, 'mod_glossary_get_entries_by_term', 'mod_glossary_external', 'get_entries_by_term', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(324, 'mod_glossary_get_entries_to_approve', 'mod_glossary_external', 'get_entries_to_approve', NULL, 'mod_glossary', 'mod/glossary:approve', 'moodle_mobile_app'),
(325, 'mod_glossary_get_entry_by_id', 'mod_glossary_external', 'get_entry_by_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(326, 'mod_glossary_add_entry', 'mod_glossary_external', 'add_entry', NULL, 'mod_glossary', 'mod/glossary:write', 'moodle_mobile_app'),
(327, 'mod_imscp_view_imscp', 'mod_imscp_external', 'view_imscp', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app'),
(328, 'mod_imscp_get_imscps_by_courses', 'mod_imscp_external', 'get_imscps_by_courses', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app'),
(329, 'mod_label_get_labels_by_courses', 'mod_label_external', 'get_labels_by_courses', NULL, 'mod_label', 'mod/label:view', 'moodle_mobile_app'),
(330, 'mod_lesson_get_lessons_by_courses', 'mod_lesson_external', 'get_lessons_by_courses', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(331, 'mod_lesson_get_lesson_access_information', 'mod_lesson_external', 'get_lesson_access_information', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(332, 'mod_lesson_view_lesson', 'mod_lesson_external', 'view_lesson', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(333, 'mod_lesson_get_questions_attempts', 'mod_lesson_external', 'get_questions_attempts', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(334, 'mod_lesson_get_user_grade', 'mod_lesson_external', 'get_user_grade', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(335, 'mod_lesson_get_user_attempt_grade', 'mod_lesson_external', 'get_user_attempt_grade', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(336, 'mod_lesson_get_content_pages_viewed', 'mod_lesson_external', 'get_content_pages_viewed', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(337, 'mod_lesson_get_user_timers', 'mod_lesson_external', 'get_user_timers', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(338, 'mod_lesson_get_pages', 'mod_lesson_external', 'get_pages', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(339, 'mod_lesson_launch_attempt', 'mod_lesson_external', 'launch_attempt', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(340, 'mod_lesson_get_page_data', 'mod_lesson_external', 'get_page_data', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(341, 'mod_lesson_process_page', 'mod_lesson_external', 'process_page', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(342, 'mod_lesson_finish_attempt', 'mod_lesson_external', 'finish_attempt', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(343, 'mod_lesson_get_attempts_overview', 'mod_lesson_external', 'get_attempts_overview', NULL, 'mod_lesson', 'mod/lesson:viewreports', 'moodle_mobile_app'),
(344, 'mod_lesson_get_user_attempt', 'mod_lesson_external', 'get_user_attempt', NULL, 'mod_lesson', 'mod/lesson:viewreports', 'moodle_mobile_app'),
(345, 'mod_lesson_get_pages_possible_jumps', 'mod_lesson_external', 'get_pages_possible_jumps', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(346, 'mod_lesson_get_lesson', 'mod_lesson_external', 'get_lesson', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(347, 'mod_lti_get_tool_launch_data', 'mod_lti_external', 'get_tool_launch_data', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(348, 'mod_lti_get_ltis_by_courses', 'mod_lti_external', 'get_ltis_by_courses', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(349, 'mod_lti_view_lti', 'mod_lti_external', 'view_lti', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(350, 'mod_lti_get_tool_proxies', 'mod_lti_external', 'get_tool_proxies', NULL, 'mod_lti', 'moodle/site:config', NULL),
(351, 'mod_lti_create_tool_proxy', 'mod_lti_external', 'create_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
(352, 'mod_lti_delete_tool_proxy', 'mod_lti_external', 'delete_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
(353, 'mod_lti_get_tool_proxy_registration_request', 'mod_lti_external', 'get_tool_proxy_registration_request', NULL, 'mod_lti', 'moodle/site:config', NULL),
(354, 'mod_lti_get_tool_types', 'mod_lti_external', 'get_tool_types', NULL, 'mod_lti', 'moodle/site:config', NULL),
(355, 'mod_lti_create_tool_type', 'mod_lti_external', 'create_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(356, 'mod_lti_update_tool_type', 'mod_lti_external', 'update_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(357, 'mod_lti_delete_tool_type', 'mod_lti_external', 'delete_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(358, 'mod_lti_is_cartridge', 'mod_lti_external', 'is_cartridge', NULL, 'mod_lti', 'moodle/site:config', NULL),
(359, 'mod_page_view_page', 'mod_page_external', 'view_page', NULL, 'mod_page', 'mod/page:view', 'moodle_mobile_app'),
(360, 'mod_page_get_pages_by_courses', 'mod_page_external', 'get_pages_by_courses', NULL, 'mod_page', 'mod/page:view', 'moodle_mobile_app'),
(361, 'mod_quiz_get_quizzes_by_courses', 'mod_quiz_external', 'get_quizzes_by_courses', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(362, 'mod_quiz_view_quiz', 'mod_quiz_external', 'view_quiz', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(363, 'mod_quiz_get_user_attempts', 'mod_quiz_external', 'get_user_attempts', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(364, 'mod_quiz_get_user_best_grade', 'mod_quiz_external', 'get_user_best_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(365, 'mod_quiz_get_combined_review_options', 'mod_quiz_external', 'get_combined_review_options', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(366, 'mod_quiz_start_attempt', 'mod_quiz_external', 'start_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(367, 'mod_quiz_get_attempt_data', 'mod_quiz_external', 'get_attempt_data', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(368, 'mod_quiz_get_attempt_summary', 'mod_quiz_external', 'get_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(369, 'mod_quiz_save_attempt', 'mod_quiz_external', 'save_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(370, 'mod_quiz_process_attempt', 'mod_quiz_external', 'process_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(371, 'mod_quiz_get_attempt_review', 'mod_quiz_external', 'get_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
(372, 'mod_quiz_view_attempt', 'mod_quiz_external', 'view_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(373, 'mod_quiz_view_attempt_summary', 'mod_quiz_external', 'view_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(374, 'mod_quiz_view_attempt_review', 'mod_quiz_external', 'view_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
(375, 'mod_quiz_get_quiz_feedback_for_grade', 'mod_quiz_external', 'get_quiz_feedback_for_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(376, 'mod_quiz_get_quiz_access_information', 'mod_quiz_external', 'get_quiz_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(377, 'mod_quiz_get_attempt_access_information', 'mod_quiz_external', 'get_attempt_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(378, 'mod_quiz_get_quiz_required_qtypes', 'mod_quiz_external', 'get_quiz_required_qtypes', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(379, 'mod_resource_view_resource', 'mod_resource_external', 'view_resource', NULL, 'mod_resource', 'mod/resource:view', 'moodle_mobile_app'),
(380, 'mod_resource_get_resources_by_courses', 'mod_resource_external', 'get_resources_by_courses', NULL, 'mod_resource', 'mod/resource:view', 'moodle_mobile_app'),
(381, 'mod_scorm_view_scorm', 'mod_scorm_external', 'view_scorm', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(382, 'mod_scorm_get_scorm_attempt_count', 'mod_scorm_external', 'get_scorm_attempt_count', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(383, 'mod_scorm_get_scorm_scoes', 'mod_scorm_external', 'get_scorm_scoes', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(384, 'mod_scorm_get_scorm_user_data', 'mod_scorm_external', 'get_scorm_user_data', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(385, 'mod_scorm_insert_scorm_tracks', 'mod_scorm_external', 'insert_scorm_tracks', NULL, 'mod_scorm', 'mod/scorm:savetrack', 'moodle_mobile_app'),
(386, 'mod_scorm_get_scorm_sco_tracks', 'mod_scorm_external', 'get_scorm_sco_tracks', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(387, 'mod_scorm_get_scorms_by_courses', 'mod_scorm_external', 'get_scorms_by_courses', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(388, 'mod_scorm_launch_sco', 'mod_scorm_external', 'launch_sco', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(389, 'mod_survey_get_surveys_by_courses', 'mod_survey_external', 'get_surveys_by_courses', NULL, 'mod_survey', '', 'moodle_mobile_app'),
(390, 'mod_survey_view_survey', 'mod_survey_external', 'view_survey', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(391, 'mod_survey_get_questions', 'mod_survey_external', 'get_questions', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(392, 'mod_survey_submit_answers', 'mod_survey_external', 'submit_answers', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(393, 'mod_url_view_url', 'mod_url_external', 'view_url', NULL, 'mod_url', 'mod/url:view', 'moodle_mobile_app'),
(394, 'mod_url_get_urls_by_courses', 'mod_url_external', 'get_urls_by_courses', NULL, 'mod_url', 'mod/url:view', 'moodle_mobile_app'),
(395, 'mod_wiki_get_wikis_by_courses', 'mod_wiki_external', 'get_wikis_by_courses', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(396, 'mod_wiki_view_wiki', 'mod_wiki_external', 'view_wiki', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(397, 'mod_wiki_view_page', 'mod_wiki_external', 'view_page', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(398, 'mod_wiki_get_subwikis', 'mod_wiki_external', 'get_subwikis', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(399, 'mod_wiki_get_subwiki_pages', 'mod_wiki_external', 'get_subwiki_pages', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(400, 'mod_wiki_get_subwiki_files', 'mod_wiki_external', 'get_subwiki_files', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(401, 'mod_wiki_get_page_contents', 'mod_wiki_external', 'get_page_contents', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(402, 'mod_wiki_get_page_for_editing', 'mod_wiki_external', 'get_page_for_editing', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(403, 'mod_wiki_new_page', 'mod_wiki_external', 'new_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(404, 'mod_wiki_edit_page', 'mod_wiki_external', 'edit_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(405, 'mod_workshop_get_workshops_by_courses', 'mod_workshop_external', 'get_workshops_by_courses', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(406, 'mod_workshop_get_workshop_access_information', 'mod_workshop_external', 'get_workshop_access_information', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(407, 'mod_workshop_get_user_plan', 'mod_workshop_external', 'get_user_plan', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(408, 'mod_workshop_view_workshop', 'mod_workshop_external', 'view_workshop', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(409, 'mod_workshop_add_submission', 'mod_workshop_external', 'add_submission', NULL, 'mod_workshop', 'mod/workshop:submit', 'moodle_mobile_app'),
(410, 'mod_workshop_update_submission', 'mod_workshop_external', 'update_submission', NULL, 'mod_workshop', 'mod/workshop:submit', 'moodle_mobile_app'),
(411, 'mod_workshop_delete_submission', 'mod_workshop_external', 'delete_submission', NULL, 'mod_workshop', 'mod/workshop:submit', 'moodle_mobile_app'),
(412, 'mod_workshop_get_submissions', 'mod_workshop_external', 'get_submissions', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(413, 'mod_workshop_get_submission', 'mod_workshop_external', 'get_submission', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(414, 'mod_workshop_get_submission_assessments', 'mod_workshop_external', 'get_submission_assessments', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(415, 'mod_workshop_get_assessment', 'mod_workshop_external', 'get_assessment', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(416, 'mod_workshop_get_assessment_form_definition', 'mod_workshop_external', 'get_assessment_form_definition', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(417, 'mod_workshop_get_reviewer_assessments', 'mod_workshop_external', 'get_reviewer_assessments', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(418, 'mod_workshop_update_assessment', 'mod_workshop_external', 'update_assessment', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(419, 'mod_workshop_get_grades', 'mod_workshop_external', 'get_grades', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(420, 'mod_workshop_evaluate_assessment', 'mod_workshop_external', 'evaluate_assessment', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(421, 'mod_workshop_get_grades_report', 'mod_workshop_external', 'get_grades_report', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(422, 'mod_workshop_view_submission', 'mod_workshop_external', 'view_submission', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(423, 'mod_workshop_evaluate_submission', 'mod_workshop_external', 'evaluate_submission', NULL, 'mod_workshop', '', 'moodle_mobile_app'),
(424, 'auth_email_get_signup_settings', 'auth_email_external', 'get_signup_settings', NULL, 'auth_email', '', NULL),
(425, 'auth_email_signup_user', 'auth_email_external', 'signup_user', NULL, 'auth_email', '', NULL),
(426, 'enrol_guest_get_instance_info', 'enrol_guest_external', 'get_instance_info', NULL, 'enrol_guest', '', 'moodle_mobile_app'),
(427, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol', NULL),
(428, 'enrol_manual_unenrol_users', 'enrol_manual_external', 'unenrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:unenrol', NULL),
(429, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
(430, 'enrol_self_enrol_user', 'enrol_self_external', 'enrol_user', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
(431, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(432, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(433, 'message_airnotifier_get_user_devices', 'message_airnotifier_external', 'get_user_devices', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(434, 'message_airnotifier_enable_device', 'message_airnotifier_external', 'enable_device', 'message/output/airnotifier/externallib.php', 'message_airnotifier', 'message/airnotifier:managedevice', 'moodle_mobile_app'),
(435, 'message_popup_get_popup_notifications', 'message_popup_external', 'get_popup_notifications', 'message/output/popup/externallib.php', 'message_popup', '', 'moodle_mobile_app'),
(436, 'message_popup_get_unread_popup_notification_count', 'message_popup_external', 'get_unread_popup_notification_count', 'message/output/popup/externallib.php', 'message_popup', '', 'moodle_mobile_app'),
(437, 'report_competency_data_for_report', 'report_competency\\external', 'data_for_report', NULL, 'report_competency', 'moodle/competency:coursecompetencyview', NULL),
(438, 'report_insights_set_notuseful_prediction', 'report_insights\\external', 'set_notuseful_prediction', NULL, 'report_insights', '', 'moodle_mobile_app'),
(439, 'report_insights_set_fixed_prediction', 'report_insights\\external', 'set_fixed_prediction', NULL, 'report_insights', '', 'moodle_mobile_app'),
(440, 'gradereport_overview_get_course_grades', 'gradereport_overview_external', 'get_course_grades', NULL, 'gradereport_overview', '', 'moodle_mobile_app'),
(441, 'gradereport_overview_view_grade_report', 'gradereport_overview_external', 'view_grade_report', NULL, 'gradereport_overview', 'gradereport/overview:view', 'moodle_mobile_app'),
(442, 'gradereport_user_get_grades_table', 'gradereport_user_external', 'get_grades_table', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(443, 'gradereport_user_view_grade_report', 'gradereport_user_external', 'view_grade_report', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(444, 'gradereport_user_get_grade_items', 'gradereport_user_external', 'get_grade_items', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(445, 'tool_lp_data_for_competency_frameworks_manage_page', 'tool_lp\\external', 'data_for_competency_frameworks_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(446, 'tool_lp_data_for_competency_summary', 'tool_lp\\external', 'data_for_competency_summary', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(447, 'tool_lp_data_for_competencies_manage_page', 'tool_lp\\external', 'data_for_competencies_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(448, 'tool_lp_list_courses_using_competency', 'tool_lp\\external', 'list_courses_using_competency', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', NULL),
(449, 'tool_lp_data_for_course_competencies_page', 'tool_lp\\external', 'data_for_course_competencies_page', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(450, 'tool_lp_data_for_template_competencies_page', 'tool_lp\\external', 'data_for_template_competencies_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
(451, 'tool_lp_data_for_templates_manage_page', 'tool_lp\\external', 'data_for_templates_manage_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
(452, 'tool_lp_data_for_plans_page', 'tool_lp\\external', 'data_for_plans_page', NULL, 'tool_lp', 'moodle/competency:planviewown', 'moodle_mobile_app'),
(453, 'tool_lp_data_for_plan_page', 'tool_lp\\external', 'data_for_plan_page', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(454, 'tool_lp_data_for_related_competencies_section', 'tool_lp\\external', 'data_for_related_competencies_section', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(455, 'tool_lp_search_users', 'tool_lp\\external', 'search_users', NULL, 'tool_lp', '', NULL),
(456, 'tool_lp_search_cohorts', 'core_cohort_external', 'search_cohorts', 'cohort/externallib.php', 'tool_lp', 'moodle/cohort:view', NULL),
(457, 'tool_lp_data_for_user_evidence_list_page', 'tool_lp\\external', 'data_for_user_evidence_list_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
(458, 'tool_lp_data_for_user_evidence_page', 'tool_lp\\external', 'data_for_user_evidence_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
(459, 'tool_lp_data_for_user_competency_summary', 'tool_lp\\external', 'data_for_user_competency_summary', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(460, 'tool_lp_data_for_user_competency_summary_in_plan', 'tool_lp\\external', 'data_for_user_competency_summary_in_plan', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(461, 'tool_lp_data_for_user_competency_summary_in_course', 'tool_lp\\external', 'data_for_user_competency_summary_in_course', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(462, 'tool_mobile_get_plugins_supporting_mobile', 'tool_mobile\\external', 'get_plugins_supporting_mobile', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(463, 'tool_mobile_get_public_config', 'tool_mobile\\external', 'get_public_config', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(464, 'tool_mobile_get_config', 'tool_mobile\\external', 'get_config', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(465, 'tool_mobile_get_autologin_key', 'tool_mobile\\external', 'get_autologin_key', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(466, 'tool_templatelibrary_list_templates', 'tool_templatelibrary\\external', 'list_templates', NULL, 'tool_templatelibrary', '', NULL),
(467, 'tool_templatelibrary_load_canonical_template', 'tool_templatelibrary\\external', 'load_canonical_template', NULL, 'tool_templatelibrary', '', NULL),
(468, 'tool_usertours_fetch_and_start_tour', 'tool_usertours\\external\\tour', 'fetch_and_start_tour', NULL, 'tool_usertours', '', NULL),
(469, 'tool_usertours_step_shown', 'tool_usertours\\external\\tour', 'step_shown', NULL, 'tool_usertours', '', NULL),
(470, 'tool_usertours_complete_tour', 'tool_usertours\\external\\tour', 'complete_tour', NULL, 'tool_usertours', '', NULL),
(471, 'tool_usertours_reset_tour', 'tool_usertours\\external\\tour', 'reset_tour', NULL, 'tool_usertours', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='built in and custom external services' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1524839718, 1524840120, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lists functions available in each service group' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'core_badges_get_user_badges'),
(2, 1, 'core_calendar_get_calendar_monthly_view'),
(3, 1, 'core_calendar_get_calendar_day_view'),
(4, 1, 'core_calendar_get_calendar_upcoming_view'),
(5, 1, 'core_calendar_create_calendar_events'),
(6, 1, 'core_calendar_delete_calendar_events'),
(7, 1, 'core_calendar_get_calendar_events'),
(8, 1, 'core_calendar_get_action_events_by_timesort'),
(9, 1, 'core_calendar_get_action_events_by_course'),
(10, 1, 'core_calendar_get_action_events_by_courses'),
(11, 1, 'core_calendar_get_calendar_event_by_id'),
(12, 1, 'core_comment_get_comments'),
(13, 1, 'core_completion_get_activities_completion_status'),
(14, 1, 'core_completion_get_course_completion_status'),
(15, 1, 'core_completion_mark_course_self_completed'),
(16, 1, 'core_completion_update_activity_completion_status_manually'),
(17, 1, 'core_course_get_categories'),
(18, 1, 'core_course_get_contents'),
(19, 1, 'core_course_get_course_module'),
(20, 1, 'core_course_get_course_module_by_instance'),
(21, 1, 'core_course_get_courses'),
(22, 1, 'core_course_search_courses'),
(23, 1, 'core_course_view_course'),
(24, 1, 'core_course_get_activities_overview'),
(25, 1, 'core_course_get_user_navigation_options'),
(26, 1, 'core_course_get_user_administration_options'),
(27, 1, 'core_course_get_courses_by_field'),
(28, 1, 'core_course_check_updates'),
(29, 1, 'core_course_get_updates_since'),
(30, 1, 'core_enrol_get_course_enrolment_methods'),
(31, 1, 'core_enrol_get_enrolled_users'),
(32, 1, 'core_enrol_get_users_courses'),
(33, 1, 'core_files_get_files'),
(34, 1, 'core_get_component_strings'),
(35, 1, 'core_group_get_activity_allowed_groups'),
(36, 1, 'core_group_get_activity_groupmode'),
(37, 1, 'core_group_get_course_user_groups'),
(38, 1, 'core_message_block_contacts'),
(39, 1, 'core_message_create_contacts'),
(40, 1, 'core_message_delete_contacts'),
(41, 1, 'core_message_delete_conversation'),
(42, 1, 'core_message_delete_message'),
(43, 1, 'core_message_get_blocked_users'),
(44, 1, 'core_message_data_for_messagearea_search_messages'),
(45, 1, 'core_message_data_for_messagearea_conversations'),
(46, 1, 'core_message_data_for_messagearea_contacts'),
(47, 1, 'core_message_data_for_messagearea_messages'),
(48, 1, 'core_message_get_contacts'),
(49, 1, 'core_message_get_messages'),
(50, 1, 'core_message_get_unread_conversations_count'),
(51, 1, 'core_message_mark_all_notifications_as_read'),
(52, 1, 'core_message_mark_all_messages_as_read'),
(53, 1, 'core_message_mark_message_read'),
(54, 1, 'core_message_message_processor_config_form'),
(55, 1, 'core_message_search_contacts'),
(56, 1, 'core_message_send_instant_messages'),
(57, 1, 'core_message_unblock_contacts'),
(58, 1, 'core_message_get_user_notification_preferences'),
(59, 1, 'core_message_get_user_message_preferences'),
(60, 1, 'core_notes_create_notes'),
(61, 1, 'core_notes_delete_notes'),
(62, 1, 'core_notes_get_course_notes'),
(63, 1, 'core_notes_view_notes'),
(64, 1, 'core_question_update_flag'),
(65, 1, 'core_rating_get_item_ratings'),
(66, 1, 'core_rating_add_rating'),
(67, 1, 'core_user_add_user_device'),
(68, 1, 'core_user_add_user_private_files'),
(69, 1, 'core_user_get_course_user_profiles'),
(70, 1, 'core_user_get_users_by_field'),
(71, 1, 'core_user_remove_user_device'),
(72, 1, 'core_user_update_user_preferences'),
(73, 1, 'core_user_view_user_list'),
(74, 1, 'core_user_view_user_profile'),
(75, 1, 'core_user_get_user_preferences'),
(76, 1, 'core_user_update_picture'),
(77, 1, 'core_user_agree_site_policy'),
(78, 1, 'core_user_get_private_files_info'),
(79, 1, 'core_competency_competency_viewed'),
(80, 1, 'core_competency_list_course_competencies'),
(81, 1, 'core_competency_get_scale_values'),
(82, 1, 'core_competency_user_competency_viewed'),
(83, 1, 'core_competency_user_competency_viewed_in_plan'),
(84, 1, 'core_competency_user_competency_viewed_in_course'),
(85, 1, 'core_competency_user_competency_plan_viewed'),
(86, 1, 'core_competency_grade_competency_in_course'),
(87, 1, 'core_competency_delete_evidence'),
(88, 1, 'core_webservice_get_site_info'),
(89, 1, 'core_block_get_course_blocks'),
(90, 1, 'core_filters_get_available_in_context'),
(91, 1, 'mod_assign_get_grades'),
(92, 1, 'mod_assign_get_assignments'),
(93, 1, 'mod_assign_get_submissions'),
(94, 1, 'mod_assign_get_user_flags'),
(95, 1, 'mod_assign_set_user_flags'),
(96, 1, 'mod_assign_get_user_mappings'),
(97, 1, 'mod_assign_revert_submissions_to_draft'),
(98, 1, 'mod_assign_lock_submissions'),
(99, 1, 'mod_assign_unlock_submissions'),
(100, 1, 'mod_assign_save_submission'),
(101, 1, 'mod_assign_submit_for_grading'),
(102, 1, 'mod_assign_save_grade'),
(103, 1, 'mod_assign_save_grades'),
(104, 1, 'mod_assign_save_user_extensions'),
(105, 1, 'mod_assign_reveal_identities'),
(106, 1, 'mod_assign_view_grading_table'),
(107, 1, 'mod_assign_view_submission_status'),
(108, 1, 'mod_assign_get_submission_status'),
(109, 1, 'mod_assign_list_participants'),
(110, 1, 'mod_assign_submit_grading_form'),
(111, 1, 'mod_assign_get_participant'),
(112, 1, 'mod_assign_view_assign'),
(113, 1, 'mod_book_view_book'),
(114, 1, 'mod_book_get_books_by_courses'),
(115, 1, 'mod_chat_login_user'),
(116, 1, 'mod_chat_get_chat_users'),
(117, 1, 'mod_chat_send_chat_message'),
(118, 1, 'mod_chat_get_chat_latest_messages'),
(119, 1, 'mod_chat_view_chat'),
(120, 1, 'mod_chat_get_chats_by_courses'),
(121, 1, 'mod_choice_get_choice_results'),
(122, 1, 'mod_choice_get_choice_options'),
(123, 1, 'mod_choice_submit_choice_response'),
(124, 1, 'mod_choice_view_choice'),
(125, 1, 'mod_choice_get_choices_by_courses'),
(126, 1, 'mod_choice_delete_choice_responses'),
(127, 1, 'mod_data_get_databases_by_courses'),
(128, 1, 'mod_data_view_database'),
(129, 1, 'mod_data_get_data_access_information'),
(130, 1, 'mod_data_get_entries'),
(131, 1, 'mod_data_get_entry'),
(132, 1, 'mod_data_get_fields'),
(133, 1, 'mod_data_search_entries'),
(134, 1, 'mod_data_approve_entry'),
(135, 1, 'mod_data_delete_entry'),
(136, 1, 'mod_data_add_entry'),
(137, 1, 'mod_data_update_entry'),
(138, 1, 'mod_feedback_get_feedbacks_by_courses'),
(139, 1, 'mod_feedback_get_feedback_access_information'),
(140, 1, 'mod_feedback_view_feedback'),
(141, 1, 'mod_feedback_get_current_completed_tmp'),
(142, 1, 'mod_feedback_get_items'),
(143, 1, 'mod_feedback_launch_feedback'),
(144, 1, 'mod_feedback_get_page_items'),
(145, 1, 'mod_feedback_process_page'),
(146, 1, 'mod_feedback_get_analysis'),
(147, 1, 'mod_feedback_get_unfinished_responses'),
(148, 1, 'mod_feedback_get_finished_responses'),
(149, 1, 'mod_feedback_get_non_respondents'),
(150, 1, 'mod_feedback_get_responses_analysis'),
(151, 1, 'mod_feedback_get_last_completed'),
(152, 1, 'mod_folder_view_folder'),
(153, 1, 'mod_folder_get_folders_by_courses'),
(154, 1, 'mod_forum_get_forums_by_courses'),
(155, 1, 'mod_forum_get_forum_discussion_posts'),
(156, 1, 'mod_forum_get_forum_discussions_paginated'),
(157, 1, 'mod_forum_view_forum'),
(158, 1, 'mod_forum_view_forum_discussion'),
(159, 1, 'mod_forum_add_discussion_post'),
(160, 1, 'mod_forum_add_discussion'),
(161, 1, 'mod_forum_can_add_discussion'),
(162, 1, 'mod_glossary_get_glossaries_by_courses'),
(163, 1, 'mod_glossary_view_glossary'),
(164, 1, 'mod_glossary_view_entry'),
(165, 1, 'mod_glossary_get_entries_by_letter'),
(166, 1, 'mod_glossary_get_entries_by_date'),
(167, 1, 'mod_glossary_get_categories'),
(168, 1, 'mod_glossary_get_entries_by_category'),
(169, 1, 'mod_glossary_get_authors'),
(170, 1, 'mod_glossary_get_entries_by_author'),
(171, 1, 'mod_glossary_get_entries_by_author_id'),
(172, 1, 'mod_glossary_get_entries_by_search'),
(173, 1, 'mod_glossary_get_entries_by_term'),
(174, 1, 'mod_glossary_get_entries_to_approve'),
(175, 1, 'mod_glossary_get_entry_by_id'),
(176, 1, 'mod_glossary_add_entry'),
(177, 1, 'mod_imscp_view_imscp'),
(178, 1, 'mod_imscp_get_imscps_by_courses'),
(179, 1, 'mod_label_get_labels_by_courses'),
(180, 1, 'mod_lesson_get_lessons_by_courses'),
(181, 1, 'mod_lesson_get_lesson_access_information'),
(182, 1, 'mod_lesson_view_lesson'),
(183, 1, 'mod_lesson_get_questions_attempts'),
(184, 1, 'mod_lesson_get_user_grade'),
(185, 1, 'mod_lesson_get_user_attempt_grade'),
(186, 1, 'mod_lesson_get_content_pages_viewed'),
(187, 1, 'mod_lesson_get_user_timers'),
(188, 1, 'mod_lesson_get_pages'),
(189, 1, 'mod_lesson_launch_attempt'),
(190, 1, 'mod_lesson_get_page_data'),
(191, 1, 'mod_lesson_process_page'),
(192, 1, 'mod_lesson_finish_attempt'),
(193, 1, 'mod_lesson_get_attempts_overview'),
(194, 1, 'mod_lesson_get_user_attempt'),
(195, 1, 'mod_lesson_get_pages_possible_jumps'),
(196, 1, 'mod_lesson_get_lesson'),
(197, 1, 'mod_lti_get_tool_launch_data'),
(198, 1, 'mod_lti_get_ltis_by_courses'),
(199, 1, 'mod_lti_view_lti'),
(200, 1, 'mod_page_view_page'),
(201, 1, 'mod_page_get_pages_by_courses'),
(202, 1, 'mod_quiz_get_quizzes_by_courses'),
(203, 1, 'mod_quiz_view_quiz'),
(204, 1, 'mod_quiz_get_user_attempts'),
(205, 1, 'mod_quiz_get_user_best_grade'),
(206, 1, 'mod_quiz_get_combined_review_options'),
(207, 1, 'mod_quiz_start_attempt'),
(208, 1, 'mod_quiz_get_attempt_data'),
(209, 1, 'mod_quiz_get_attempt_summary'),
(210, 1, 'mod_quiz_save_attempt'),
(211, 1, 'mod_quiz_process_attempt'),
(212, 1, 'mod_quiz_get_attempt_review'),
(213, 1, 'mod_quiz_view_attempt'),
(214, 1, 'mod_quiz_view_attempt_summary'),
(215, 1, 'mod_quiz_view_attempt_review'),
(216, 1, 'mod_quiz_get_quiz_feedback_for_grade'),
(217, 1, 'mod_quiz_get_quiz_access_information'),
(218, 1, 'mod_quiz_get_attempt_access_information'),
(219, 1, 'mod_quiz_get_quiz_required_qtypes'),
(220, 1, 'mod_resource_view_resource'),
(221, 1, 'mod_resource_get_resources_by_courses'),
(222, 1, 'mod_scorm_view_scorm'),
(223, 1, 'mod_scorm_get_scorm_attempt_count'),
(224, 1, 'mod_scorm_get_scorm_scoes'),
(225, 1, 'mod_scorm_get_scorm_user_data'),
(226, 1, 'mod_scorm_insert_scorm_tracks'),
(227, 1, 'mod_scorm_get_scorm_sco_tracks'),
(228, 1, 'mod_scorm_get_scorms_by_courses'),
(229, 1, 'mod_scorm_launch_sco'),
(230, 1, 'mod_survey_get_surveys_by_courses'),
(231, 1, 'mod_survey_view_survey'),
(232, 1, 'mod_survey_get_questions'),
(233, 1, 'mod_survey_submit_answers'),
(234, 1, 'mod_url_view_url'),
(235, 1, 'mod_url_get_urls_by_courses'),
(236, 1, 'mod_wiki_get_wikis_by_courses'),
(237, 1, 'mod_wiki_view_wiki'),
(238, 1, 'mod_wiki_view_page'),
(239, 1, 'mod_wiki_get_subwikis'),
(240, 1, 'mod_wiki_get_subwiki_pages'),
(241, 1, 'mod_wiki_get_subwiki_files'),
(242, 1, 'mod_wiki_get_page_contents'),
(243, 1, 'mod_wiki_get_page_for_editing'),
(244, 1, 'mod_wiki_new_page'),
(245, 1, 'mod_wiki_edit_page'),
(246, 1, 'mod_workshop_get_workshops_by_courses'),
(247, 1, 'mod_workshop_get_workshop_access_information'),
(248, 1, 'mod_workshop_get_user_plan'),
(249, 1, 'mod_workshop_view_workshop'),
(250, 1, 'mod_workshop_add_submission'),
(251, 1, 'mod_workshop_update_submission'),
(252, 1, 'mod_workshop_delete_submission'),
(253, 1, 'mod_workshop_get_submissions'),
(254, 1, 'mod_workshop_get_submission'),
(255, 1, 'mod_workshop_get_submission_assessments'),
(256, 1, 'mod_workshop_get_assessment'),
(257, 1, 'mod_workshop_get_assessment_form_definition'),
(258, 1, 'mod_workshop_get_reviewer_assessments'),
(259, 1, 'mod_workshop_update_assessment'),
(260, 1, 'mod_workshop_get_grades'),
(261, 1, 'mod_workshop_evaluate_assessment'),
(262, 1, 'mod_workshop_get_grades_report'),
(263, 1, 'mod_workshop_view_submission'),
(264, 1, 'mod_workshop_evaluate_submission'),
(265, 1, 'enrol_guest_get_instance_info'),
(266, 1, 'enrol_self_get_instance_info'),
(267, 1, 'enrol_self_enrol_user'),
(268, 1, 'message_airnotifier_is_system_configured'),
(269, 1, 'message_airnotifier_are_notification_preferences_configured'),
(270, 1, 'message_airnotifier_get_user_devices'),
(271, 1, 'message_airnotifier_enable_device'),
(272, 1, 'message_popup_get_popup_notifications'),
(273, 1, 'message_popup_get_unread_popup_notification_count'),
(274, 1, 'report_insights_set_notuseful_prediction'),
(275, 1, 'report_insights_set_fixed_prediction'),
(276, 1, 'gradereport_overview_get_course_grades'),
(277, 1, 'gradereport_overview_view_grade_report'),
(278, 1, 'gradereport_user_get_grades_table'),
(279, 1, 'gradereport_user_view_grade_report'),
(280, 1, 'gradereport_user_get_grade_items'),
(281, 1, 'tool_lp_data_for_course_competencies_page'),
(282, 1, 'tool_lp_data_for_plans_page'),
(283, 1, 'tool_lp_data_for_plan_page'),
(284, 1, 'tool_lp_data_for_user_evidence_list_page'),
(285, 1, 'tool_lp_data_for_user_evidence_page'),
(286, 1, 'tool_lp_data_for_user_competency_summary'),
(287, 1, 'tool_lp_data_for_user_competency_summary_in_plan'),
(288, 1, 'tool_lp_data_for_user_competency_summary_in_course'),
(289, 1, 'tool_mobile_get_plugins_supporting_mobile'),
(290, 1, 'tool_mobile_get_public_config'),
(291, 1, 'tool_mobile_get_config'),
(292, 1, 'tool_mobile_get_autologin_key');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='users allowed to use services with restricted users flag' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL,
  `token` varchar(128) NOT NULL DEFAULT '',
  `privatetoken` varchar(64) DEFAULT NULL,
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Security tokens for accessing of external services' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all feedbacks' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='filled out feedback' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='filled out feedback' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='feedback_items' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='feedback sitecourse map' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='templates of feedbackstructures' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='values of the completeds' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='values of the completedstmp' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='description of files, content is stored in sha1 file pool' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', 'a48e186a2cc853a9e94e9305f4e9bc086391212d', 1, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd1da7ab1bb9c08a926037367bf8ce9a838034ead', 1, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(3, '5f8e911d0da441e36f47c5c46f4393269211ca56', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1085, 'image/png', 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(5, '75c101cb8cb34ea573cd25ac38f8157b1de901b8', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 966, 'image/png', 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(6, '0c5190a24c3943966541401c883eacaa20ca20cb', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1039, 'image/png', 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(7, '8c96a486d5801e0f4ab8c411f561f1c687e1f865', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 861, 'image/png', 0, NULL, NULL, NULL, 1524839775, 1524839775, 0, NULL),
(8, 'b6f78c0b769c9d712de1398327b7d1c8b04dcf61', 'a24dc5699dbfdc849cf28c5c66a3898d7f8d2d0a', 5, 'user', 'draft', 558814418, '/', 'user_account_profile_avatar_person_student_female-512.png', 2, 30174, 'image/png', 0, 'O:8:"stdClass":1:{s:6:"source";s:57:"user_account_profile_avatar_person_student_female-512.png";}', 'Admin User', 'allrightsreserved', 1524853576, 1524853576, 0, NULL),
(9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '41003989f7163725df61e2e3a440fe046e2a1b53', 5, 'user', 'draft', 558814418, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1524853576, 1524853576, 0, NULL),
(10, '8b3ade083a79734e1760c6f26070d4a883e5db63', 'a5f4372f0f0db0ef493fed5d78381594e1e0b2e5', 1, 'core', 'preview', 0, '/thumb/', 'b6f78c0b769c9d712de1398327b7d1c8b04dcf61', NULL, 12005, 'image/png', 0, NULL, NULL, NULL, 1524853576, 1524853576, 0, NULL),
(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '74c104d54c05b5f8c633a36da516d37e6c5279e4', 1, 'core', 'preview', 0, '/thumb/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1524853576, 1524853576, 0, NULL),
(12, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '884555719c50529b9df662a38619d04b5b11e25c', 1, 'core', 'preview', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1524853576, 1524853576, 0, NULL),
(15, '765a735e5b6863446722d057ec39be8e4e6dca8b', '1c43628aa186dc380c301b3250a3afbd74e62c2b', 5, 'user', 'icon', 0, '/', 'f1.png', NULL, 14929, 'image/png', 0, NULL, NULL, NULL, 1524853578, 1524853578, 0, NULL),
(16, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '535824e8097c2aef8aa81b506a392b2bc65f58f0', 5, 'user', 'icon', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1524853578, 1524853578, 0, NULL),
(17, 'a474e071450a500c374da0c946ce9949f90295b6', '0e935ee776b28b0546bf5bcd8b81d65a4dd888f8', 5, 'user', 'icon', 0, '/', 'f2.png', NULL, 2361, 'image/png', 0, NULL, NULL, NULL, 1524853578, 1524853578, 0, NULL),
(18, 'e6d1a326adf6f9d38c023755553ca3d7147b023b', '1486473a480bed8006fce8a14aed94a11246a0f7', 5, 'user', 'icon', 0, '/', 'f3.png', NULL, 55924, 'image/png', 0, NULL, NULL, NULL, 1524853578, 1524853578, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store files references' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_file_conversion`
--

CREATE TABLE `mdl_file_conversion` (
  `id` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sourcefileid` bigint(10) NOT NULL,
  `targetformat` varchar(100) NOT NULL DEFAULT '',
  `status` bigint(10) DEFAULT '0',
  `statusmessage` longtext,
  `converter` varchar(255) DEFAULT NULL,
  `destfileid` bigint(10) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to track file conversions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores information about which filters are active in which c' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 2),
(2, 'mathjaxloader', 1, 1, 1),
(3, 'mediaplugin', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores per-context configuration settings for filters which ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each record is one folder resource' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  `lockdiscussionafter` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Forums contain and structure discussion' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of user mail delivery preferences for each forum' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Forums are composed of discussions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussion_subs`
--

CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users may choose to subscribe and unsubscribe from specific ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='All posts are stored in this table' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For keeping track of posts that will be mailed in digest for' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks each users read posts' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of who is subscribed to what forum' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tracks each users untracked forums' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all glossaries' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='entries alias' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all categories for glossary entries' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='all glossary entries' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='categories of each glossary entry' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) DEFAULT NULL,
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Setting of the display formats' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `showtabs`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, 'standard,category,date', '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, 'standard', '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, 'standard,category,date,author', '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, 'standard,category,date,author', '', '', '', ''),
(5, 'faq', 'faq', 1, 1, 'standard,category,date,author', '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, 'standard,category,date,author', '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, 'standard,category,date', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about categories, used for grou' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History of grade_categories' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='grade_grades  This table keeps individual grades for each us' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History table' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='temporary table for storing new grade_item names from grade ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Temporary table for importing grades' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table keeps information about gradeable items (ie colum' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History of grade_items' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Repository for grade letters, for courses and other moodle e' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table describes the outcomes used in the system. An out' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores what outcomes are used in what courses.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History table' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='gradebook settings' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='frequently used comments used in marking guide' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the rows of the criteria grid.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the data of how the guide is filled by a particular r' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the rows of the rubric grid.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the data of how the rubric is filled by a particular ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the columns of the rubric grid.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Identifies gradable areas where advanced grading can happen.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the basic information about an advanced grading for' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Grading form instance is an assessment record for one gradab' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a grouping to a group (note, groups can be in multiple ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record represents a group.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Link a user to a group.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='each record is one imscp resource' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines labels' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_answers' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_attempts' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='branches for each lesson/user' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_grades' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_overrides`
--

CREATE TABLE `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The overrides to lesson settings.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines lesson_pages' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `timemodifiedoffline` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='lesson timer for each lesson' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='store licenses used by moodle' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lock_db`
--

CREATE TABLE `mdl_lock_db` (
  `id` bigint(10) NOT NULL,
  `resourcekey` varchar(255) NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores active and inactive lock types for db locking method.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Every action is logged as far as possible' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_logstore_standard_log`
--

CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `objecttable` varchar(50) DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Standard log table' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1524839809, 'web', '0:0:0:0:0:0:0:1', NULL),
(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1524840106, 'web', '0:0:0:0:0:0:0:1', NULL),
(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524840106, 'web', '0:0:0:0:0:0:0:1', NULL),
(4, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 537, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"notloggedinroleid";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(5, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 538, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"guestroleid";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(6, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 539, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"defaultuserroleid";s:8:"oldvalue";N;s:5:"value";s:1:"7";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(7, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 540, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"creatornewroleid";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(8, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 541, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"restorernewroleid";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(9, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 542, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"gradebookroles";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";N;}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(10, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 543, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"logstore";s:8:"oldvalue";N;s:5:"value";s:17:"logstore_standard";s:6:"plugin";s:9:"analytics";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(11, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 544, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"feedback_plugin_for_gradebook";s:8:"oldvalue";N;s:5:"value";s:23:"assignfeedback_comments";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(12, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 545, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"showrecentsubmissions";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(13, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 546, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"submissionreceipts";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(14, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 547, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"submissionstatement";s:8:"oldvalue";N;s:5:"value";s:102:"This assignment is my own work, except where I have acknowledged the use of the works of other people.";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(15, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 548, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"maxperpage";s:8:"oldvalue";N;s:5:"value";s:2:"-1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(16, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 549, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"alwaysshowdescription";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(17, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 550, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"alwaysshowdescription_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(18, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 551, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"alwaysshowdescription_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(19, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 552, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"allowsubmissionsfromdate";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(20, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 553, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:32:"allowsubmissionsfromdate_enabled";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(21, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 554, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"allowsubmissionsfromdate_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(22, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 555, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"duedate";s:8:"oldvalue";N;s:5:"value";s:6:"604800";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(23, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 556, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"duedate_enabled";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(24, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 557, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"duedate_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(25, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 558, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"cutoffdate";s:8:"oldvalue";N;s:5:"value";s:7:"1209600";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(26, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 559, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"cutoffdate_enabled";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(27, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 560, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"cutoffdate_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(28, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 561, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"gradingduedate";s:8:"oldvalue";N;s:5:"value";s:7:"1209600";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(29, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 562, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"gradingduedate_enabled";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(30, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 563, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"gradingduedate_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(31, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 564, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"submissiondrafts";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(32, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 565, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"submissiondrafts_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(33, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 566, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"submissiondrafts_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(34, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 567, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"requiresubmissionstatement";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(35, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 568, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"requiresubmissionstatement_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(36, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 569, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:33:"requiresubmissionstatement_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(37, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 570, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"attemptreopenmethod";s:8:"oldvalue";N;s:5:"value";s:4:"none";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(38, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 571, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"attemptreopenmethod_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(39, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 572, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"attemptreopenmethod_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(40, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 573, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"maxattempts";s:8:"oldvalue";N;s:5:"value";s:2:"-1";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(41, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 574, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"maxattempts_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(42, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 575, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"maxattempts_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(43, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 576, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"teamsubmission";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(44, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 577, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"teamsubmission_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(45, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 578, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"teamsubmission_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(46, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 579, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"preventsubmissionnotingroup";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(47, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 580, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"preventsubmissionnotingroup_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(48, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 581, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"preventsubmissionnotingroup_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(49, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 582, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"requireallteammemberssubmit";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(50, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 583, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"requireallteammemberssubmit_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(51, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 584, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"requireallteammemberssubmit_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(52, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 585, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"teamsubmissiongroupingid";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(53, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 586, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"teamsubmissiongroupingid_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(54, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 587, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"sendnotifications";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(55, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 588, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"sendnotifications_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(56, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 589, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"sendnotifications_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(57, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 590, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"sendlatenotifications";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(58, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 591, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"sendlatenotifications_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(59, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 592, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"sendlatenotifications_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840107, 'web', '0:0:0:0:0:0:0:1', NULL),
(60, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 593, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"sendstudentnotifications";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(61, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 594, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"sendstudentnotifications_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(62, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 595, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"sendstudentnotifications_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(63, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 596, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"blindmarking";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(64, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 597, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"blindmarking_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(65, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 598, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"blindmarking_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(66, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 599, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"markingworkflow";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(67, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 600, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"markingworkflow_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(68, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 601, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"markingworkflow_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(69, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 602, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"markingallocation";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(70, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 603, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"markingallocation_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(71, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 604, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"markingallocation_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:6:"assign";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(72, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 605, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"default";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:21:"assignsubmission_file";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(73, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 606, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"maxfiles";s:8:"oldvalue";N;s:5:"value";s:2:"20";s:6:"plugin";s:21:"assignsubmission_file";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(74, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 607, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"filetypes";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:21:"assignsubmission_file";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(75, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 608, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"maxbytes";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:21:"assignsubmission_file";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(76, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 609, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"default";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:27:"assignsubmission_onlinetext";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(77, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 610, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"default";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:23:"assignfeedback_comments";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(78, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 611, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"inline";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:23:"assignfeedback_comments";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(79, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 612, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"inline_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:23:"assignfeedback_comments";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(80, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 613, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"inline_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:23:"assignfeedback_comments";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(81, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 614, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"stamps";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"assignfeedback_editpdf";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(82, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 615, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"default";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"assignfeedback_file";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(83, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 616, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"default";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:22:"assignfeedback_offline";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(84, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 617, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"numberingoptions";s:8:"oldvalue";N;s:5:"value";s:7:"0,1,2,3";s:6:"plugin";s:4:"book";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(85, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 618, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"navoptions";s:8:"oldvalue";N;s:5:"value";s:5:"0,1,2";s:6:"plugin";s:4:"book";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(86, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 619, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"numbering";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"book";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(87, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 620, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"navstyle";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"book";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(88, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 621, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"chat_method";s:8:"oldvalue";N;s:5:"value";s:4:"ajax";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(89, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 622, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"chat_refresh_userlist";s:8:"oldvalue";N;s:5:"value";s:2:"10";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(90, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 623, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"chat_old_ping";s:8:"oldvalue";N;s:5:"value";s:2:"35";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(91, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 624, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"chat_refresh_room";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(92, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 625, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"chat_normal_updatemode";s:8:"oldvalue";N;s:5:"value";s:8:"jsupdate";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(93, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 626, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"chat_serverhost";s:8:"oldvalue";N;s:5:"value";s:9:"localhost";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(94, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 627, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"chat_serverip";s:8:"oldvalue";N;s:5:"value";s:9:"127.0.0.1";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(95, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 628, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"chat_serverport";s:8:"oldvalue";N;s:5:"value";s:4:"9111";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(96, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 629, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"chat_servermax";s:8:"oldvalue";N;s:5:"value";s:3:"100";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(97, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 630, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"data_enablerssfeeds";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(98, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 631, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"feedback_allowfullanonymous";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(99, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 632, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"framesize";s:8:"oldvalue";N;s:5:"value";s:3:"130";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(100, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 633, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"displayoptions";s:8:"oldvalue";N;s:5:"value";s:9:"0,1,4,5,6";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(101, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 634, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"printintro";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(102, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 635, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"display";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(103, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 636, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"showsize";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(104, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 637, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"showtype";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(105, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 638, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"showdate";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(106, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 639, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"popupwidth";s:8:"oldvalue";N;s:5:"value";s:3:"620";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(107, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 640, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"popupheight";s:8:"oldvalue";N;s:5:"value";s:3:"450";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(108, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 641, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"filterfiles";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"resource";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(109, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 642, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"showexpanded";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:6:"folder";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(110, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 643, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"maxsizetodownload";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:6:"folder";}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(111, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 644, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"forum_displaymode";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(112, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 645, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"forum_shortpost";s:8:"oldvalue";N;s:5:"value";s:3:"300";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(113, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 646, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"forum_longpost";s:8:"oldvalue";N;s:5:"value";s:3:"600";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(114, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 647, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"forum_manydiscussions";s:8:"oldvalue";N;s:5:"value";s:3:"100";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(115, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 648, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"forum_maxbytes";s:8:"oldvalue";N;s:5:"value";s:6:"512000";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(116, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 649, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"forum_maxattachments";s:8:"oldvalue";N;s:5:"value";s:1:"9";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(117, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 650, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"forum_subscription";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(118, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 651, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"forum_trackingtype";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(119, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 652, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"forum_trackreadposts";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(120, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 653, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"forum_allowforcedreadtracking";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(121, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 654, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"forum_oldpostdays";s:8:"oldvalue";N;s:5:"value";s:2:"14";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(122, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 655, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"forum_usermarksread";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(123, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 656, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"forum_cleanreadtime";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(124, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 657, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"digestmailtime";s:8:"oldvalue";N;s:5:"value";s:2:"17";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(125, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 658, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"forum_enablerssfeeds";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(126, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 659, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"forum_enabletimedposts";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(127, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 660, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"glossary_entbypage";s:8:"oldvalue";N;s:5:"value";s:2:"10";s:6:"plugin";N;}', 1524840108, 'web', '0:0:0:0:0:0:0:1', NULL),
(128, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 661, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"glossary_dupentries";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(129, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 662, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"glossary_allowcomments";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(130, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 663, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"glossary_linkbydefault";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(131, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 664, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"glossary_defaultapproval";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(132, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 665, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"glossary_enablerssfeeds";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(133, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 666, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"glossary_linkentries";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(134, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 667, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"glossary_casesensitive";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(135, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 668, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"glossary_fullmatch";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(136, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 669, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"keepold";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"imscp";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(137, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 670, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"keepold_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:5:"imscp";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(138, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 671, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"dndmedia";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"label";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(139, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 672, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"dndresizewidth";s:8:"oldvalue";N;s:5:"value";s:3:"400";s:6:"plugin";s:5:"label";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(140, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 673, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"dndresizeheight";s:8:"oldvalue";N;s:5:"value";s:3:"400";s:6:"plugin";s:5:"label";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(141, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 674, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"mediafile";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(142, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 675, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"mediafile_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(143, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 676, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"mediawidth";s:8:"oldvalue";N;s:5:"value";s:3:"640";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(144, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 677, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"mediaheight";s:8:"oldvalue";N;s:5:"value";s:3:"480";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(145, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 678, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"mediaclose";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(146, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 679, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"progressbar";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(147, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 680, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"progressbar_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(148, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 681, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"ongoing";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(149, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 682, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"ongoing_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(150, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 683, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"displayleftmenu";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(151, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 684, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"displayleftmenu_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(152, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 685, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"displayleftif";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(153, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 686, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"displayleftif_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(154, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 687, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"slideshow";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(155, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 688, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"slideshow_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(156, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 689, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"slideshowwidth";s:8:"oldvalue";N;s:5:"value";s:3:"640";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(157, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 690, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"slideshowheight";s:8:"oldvalue";N;s:5:"value";s:3:"480";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(158, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 691, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"slideshowbgcolor";s:8:"oldvalue";N;s:5:"value";s:7:"#FFFFFF";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(159, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 692, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"maxanswers";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(160, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 693, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"maxanswers_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(161, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 694, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"defaultfeedback";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(162, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 695, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"defaultfeedback_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(163, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 696, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"activitylink";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(164, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 697, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"activitylink_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(165, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 698, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"timelimit";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(166, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 699, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"timelimit_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(167, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 700, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"password";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(168, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 701, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"password_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(169, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 702, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"modattempts";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(170, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 703, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"modattempts_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(171, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 704, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"displayreview";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(172, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 705, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"displayreview_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(173, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 706, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"maximumnumberofattempts";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(174, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 707, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"maximumnumberofattempts_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(175, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 708, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"defaultnextpage";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(176, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 709, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"defaultnextpage_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(177, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 710, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"numberofpagestoshow";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(178, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 711, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"numberofpagestoshow_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(179, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 712, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"practice";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(180, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 713, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"practice_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(181, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 714, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"customscoring";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(182, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 715, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"customscoring_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(183, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 716, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"retakesallowed";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(184, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 717, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"retakesallowed_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(185, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 718, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"handlingofretakes";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(186, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 719, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"handlingofretakes_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(187, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 720, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"minimumnumberofquestions";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(188, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 721, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"minimumnumberofquestions_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"mod_lesson";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(189, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 722, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"displayoptions";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(190, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 723, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"printheading";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(191, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 724, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"printintro";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(192, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 725, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"display";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(193, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 726, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"popupwidth";s:8:"oldvalue";N;s:5:"value";s:3:"620";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(194, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 727, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"popupheight";s:8:"oldvalue";N;s:5:"value";s:3:"450";s:6:"plugin";s:4:"page";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(195, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 728, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"timelimit";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(196, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 729, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"timelimit_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(197, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 730, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"overduehandling";s:8:"oldvalue";N;s:5:"value";s:10:"autosubmit";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(198, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 731, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"overduehandling_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(199, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 732, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"graceperiod";s:8:"oldvalue";N;s:5:"value";s:5:"86400";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(200, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 733, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"graceperiod_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(201, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 734, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"graceperiodmin";s:8:"oldvalue";N;s:5:"value";s:2:"60";s:6:"plugin";s:4:"quiz";}', 1524840109, 'web', '0:0:0:0:0:0:0:1', NULL),
(202, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 735, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"attempts";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(203, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 736, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"attempts_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(204, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 737, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"grademethod";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(205, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 738, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"grademethod_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(206, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 739, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"maximumgrade";s:8:"oldvalue";N;s:5:"value";s:2:"10";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(207, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 740, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"questionsperpage";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(208, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 741, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"questionsperpage_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(209, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 742, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"navmethod";s:8:"oldvalue";N;s:5:"value";s:4:"free";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(210, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 743, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"navmethod_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(211, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 744, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"shuffleanswers";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(212, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 745, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"shuffleanswers_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(213, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 746, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"preferredbehaviour";s:8:"oldvalue";N;s:5:"value";s:16:"deferredfeedback";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(214, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 747, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"canredoquestions";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(215, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 748, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"canredoquestions_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(216, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 749, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"attemptonlast";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(217, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 750, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"attemptonlast_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(218, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 751, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"reviewattempt";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(219, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 752, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"reviewcorrectness";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(220, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 753, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"reviewmarks";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(221, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 754, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"reviewspecificfeedback";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(222, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 755, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"reviewgeneralfeedback";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(223, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 756, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"reviewrightanswer";s:8:"oldvalue";N;s:5:"value";s:5:"69904";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(224, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 757, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"reviewoverallfeedback";s:8:"oldvalue";N;s:5:"value";s:4:"4368";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(225, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 758, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"showuserpicture";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(226, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 759, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"showuserpicture_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(227, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 760, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"decimalpoints";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(228, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 761, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"decimalpoints_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(229, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 762, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"questiondecimalpoints";s:8:"oldvalue";N;s:5:"value";s:2:"-1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(230, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 763, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"questiondecimalpoints_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(231, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 764, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"showblocks";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(232, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 765, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"showblocks_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(233, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 766, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"password";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(234, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 767, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"password_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(235, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 768, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"subnet";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(236, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 769, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"subnet_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(237, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 770, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"delay1";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(238, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 771, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"delay1_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(239, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 772, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"delay2";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(240, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 773, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"delay2_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(241, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 774, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"browsersecurity";s:8:"oldvalue";N;s:5:"value";s:1:"-";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(242, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 775, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"browsersecurity_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(243, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 776, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"initialnumfeedbacks";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(244, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 777, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"autosaveperiod";s:8:"oldvalue";N;s:5:"value";s:2:"60";s:6:"plugin";s:4:"quiz";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(245, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 778, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"displaycoursestructure";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(246, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 779, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"displaycoursestructure_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(247, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 780, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:5:"popup";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(248, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 781, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"popup_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(249, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 782, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"displayactivityname";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(250, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 783, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"framewidth";s:8:"oldvalue";N;s:5:"value";s:3:"100";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(251, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 784, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"framewidth_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(252, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 785, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"frameheight";s:8:"oldvalue";N;s:5:"value";s:3:"500";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(253, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 786, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"frameheight_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(254, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 787, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"winoptgrp_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(255, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 788, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"scrollbars";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(256, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 789, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"directories";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(257, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 790, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"location";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(258, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 791, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"menubar";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(259, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 792, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"toolbar";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(260, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 793, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"status";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(261, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 794, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"skipview";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(262, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 795, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"skipview_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(263, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 796, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"hidebrowse";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(264, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 797, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"hidebrowse_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(265, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 798, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"hidetoc";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(266, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 799, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"hidetoc_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(267, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 800, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:3:"nav";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(268, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 801, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"nav_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(269, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 802, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"navpositionleft";s:8:"oldvalue";N;s:5:"value";s:4:"-100";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(270, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 803, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"navpositionleft_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(271, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 804, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"navpositiontop";s:8:"oldvalue";N;s:5:"value";s:4:"-100";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(272, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 805, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"navpositiontop_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(273, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 806, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"collapsetocwinsize";s:8:"oldvalue";N;s:5:"value";s:3:"767";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(274, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 807, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"collapsetocwinsize_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(275, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 808, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"displayattemptstatus";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(276, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 809, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"displayattemptstatus_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(277, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 810, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"grademethod";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840110, 'web', '0:0:0:0:0:0:0:1', NULL),
(278, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 811, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"maxgrade";s:8:"oldvalue";N;s:5:"value";s:3:"100";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(279, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 812, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"maxattempt";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(280, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 813, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"whatgrade";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(281, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 814, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"forcecompleted";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(282, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 815, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"forcenewattempt";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(283, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 816, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"autocommit";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(284, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 817, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"masteryoverride";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(285, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 818, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"lastattemptlock";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(286, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 819, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"auto";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(287, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 820, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"updatefreq";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(288, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 821, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"scorm12standard";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(289, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 822, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"allowtypeexternal";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(290, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 823, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"allowtypelocalsync";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(291, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 824, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"allowtypeexternalaicc";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(292, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 825, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"allowaicchacp";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(293, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 826, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"aicchacptimeout";s:8:"oldvalue";N;s:5:"value";s:2:"30";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(294, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 827, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"aicchacpkeepsessiondata";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(295, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 828, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"aiccuserid";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(296, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 829, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"forcejavascript";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(297, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 830, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"allowapidebug";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(298, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 831, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"apidebugmask";s:8:"oldvalue";N;s:5:"value";s:2:".*";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(299, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 832, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"protectpackagedownloads";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:5:"scorm";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(300, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 833, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"framesize";s:8:"oldvalue";N;s:5:"value";s:3:"130";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(301, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 834, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"secretphrase";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(302, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 835, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"rolesinparams";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(303, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 836, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"displayoptions";s:8:"oldvalue";N;s:5:"value";s:7:"0,1,5,6";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(304, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 837, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"printintro";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(305, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 838, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"display";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(306, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 839, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"popupwidth";s:8:"oldvalue";N;s:5:"value";s:3:"620";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(307, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 840, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"popupheight";s:8:"oldvalue";N;s:5:"value";s:3:"450";s:6:"plugin";s:3:"url";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(308, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 841, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:5:"grade";s:8:"oldvalue";N;s:5:"value";s:2:"80";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(309, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 842, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"gradinggrade";s:8:"oldvalue";N;s:5:"value";s:2:"20";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(310, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 843, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"gradedecimals";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(311, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 844, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"maxbytes";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(312, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 845, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"strategy";s:8:"oldvalue";N;s:5:"value";s:12:"accumulative";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(313, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 846, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"examplesmode";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"workshop";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(314, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 847, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"numofreviews";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:25:"workshopallocation_random";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(315, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 848, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"grade0";s:8:"oldvalue";N;s:5:"value";s:2:"No";s:6:"plugin";s:22:"workshopform_numerrors";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(316, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 849, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"grade1";s:8:"oldvalue";N;s:5:"value";s:3:"Yes";s:6:"plugin";s:22:"workshopform_numerrors";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(317, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 850, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"comparison";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:17:"workshopeval_best";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(318, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 851, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"coursebinenable";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:15:"tool_recyclebin";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(319, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 852, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"coursebinexpiry";s:8:"oldvalue";N;s:5:"value";s:6:"604800";s:6:"plugin";s:15:"tool_recyclebin";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(320, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 853, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"categorybinenable";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:15:"tool_recyclebin";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(321, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 854, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"categorybinexpiry";s:8:"oldvalue";N;s:5:"value";s:6:"604800";s:6:"plugin";s:15:"tool_recyclebin";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(322, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 855, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"autohide";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:15:"tool_recyclebin";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(323, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 856, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"runningmethod";s:8:"oldvalue";N;s:5:"value";s:11:"commandline";s:6:"plugin";s:16:"antivirus_clamav";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(324, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 857, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"pathtoclam";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:16:"antivirus_clamav";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(325, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 858, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"pathtounixsocket";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:16:"antivirus_clamav";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(326, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 859, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"clamfailureonupload";s:8:"oldvalue";N;s:5:"value";s:9:"donothing";s:6:"plugin";s:16:"antivirus_clamav";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(327, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 860, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_map_firstname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(328, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 861, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updatelocal_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(329, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 862, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updateremote_firstname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(330, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 863, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(331, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 864, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_lastname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(332, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 865, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(333, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 866, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_lastname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(334, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 867, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(335, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 868, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_map_email";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(336, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 869, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updatelocal_email";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(337, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 870, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updateremote_email";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(338, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 871, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(339, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 872, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_city";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(340, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 873, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_city";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(341, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 874, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_city";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(342, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 875, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(343, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 876, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_country";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(344, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 877, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_country";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(345, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 878, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_country";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(346, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 879, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(347, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 880, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_lang";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(348, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 881, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_lang";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(349, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 882, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_lang";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(350, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 883, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(351, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 884, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_description";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(352, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 885, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_description";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840111, 'web', '0:0:0:0:0:0:0:1', NULL),
(353, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 886, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_description";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(354, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 887, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(355, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 888, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"field_map_url";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(356, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 889, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_updatelocal_url";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(357, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 890, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updateremote_url";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(358, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 891, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(359, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 892, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_idnumber";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(360, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 893, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(361, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 894, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_idnumber";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(362, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 895, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(363, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 896, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_institution";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(364, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 897, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_institution";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(365, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 898, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_institution";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(366, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 899, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(367, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 900, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_department";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(368, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 901, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_department";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(369, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 902, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_department";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(370, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 903, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(371, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 904, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone1";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(372, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 905, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(373, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 906, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone1";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(374, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 907, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(375, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 908, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone2";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(376, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 909, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(377, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 910, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone2";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(378, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 911, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(379, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 912, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_address";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(380, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 913, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_address";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(381, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 914, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_address";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(382, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 915, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(383, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 916, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_map_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(384, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 917, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updatelocal_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(385, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 918, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:36:"field_updateremote_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(386, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 919, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(387, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 920, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_map_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(388, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 921, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"field_updatelocal_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(389, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 922, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updateremote_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(390, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 923, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(391, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 924, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_middlename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(392, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 925, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(393, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 926, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_middlename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(394, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 927, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(395, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 928, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_map_alternatename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(396, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 929, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"field_updatelocal_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(397, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 930, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:32:"field_updateremote_alternatename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(398, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 931, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:8:"auth_cas";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(399, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 932, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"recaptcha";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(400, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 933, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(401, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 934, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(402, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 935, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(403, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 936, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(404, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 937, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(405, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 938, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(406, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 939, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(407, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 940, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(408, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 941, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(409, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 942, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(410, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 943, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(411, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 944, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(412, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 945, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(413, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 946, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(414, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 947, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(415, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 948, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(416, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 949, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(417, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 950, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:10:"auth_email";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(418, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 951, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"host";s:8:"oldvalue";N;s:5:"value";s:9:"127.0.0.1";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(419, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 952, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"type";s:8:"oldvalue";N;s:5:"value";s:6:"mysqli";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(420, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 953, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"sybasequoting";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(421, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 954, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"name";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(422, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 955, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"user";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(423, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 956, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"pass";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(424, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 957, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:5:"table";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(425, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 958, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"fielduser";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(426, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 959, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"fieldpass";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840112, 'web', '0:0:0:0:0:0:0:1', NULL),
(427, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 960, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"passtype";s:8:"oldvalue";N;s:5:"value";s:9:"plaintext";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(428, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 961, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"extencoding";s:8:"oldvalue";N;s:5:"value";s:5:"utf-8";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(429, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 962, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"setupsql";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(430, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 963, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"debugauthdb";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(431, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 964, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"changepasswordurl";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(432, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 965, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"removeuser";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(433, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 966, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"updateusers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(434, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 967, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_map_firstname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(435, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 968, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updatelocal_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(436, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 969, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updateremote_firstname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(437, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 970, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(438, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 971, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_lastname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(439, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 972, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(440, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 973, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_lastname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(441, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 974, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(442, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 975, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_map_email";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(443, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 976, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updatelocal_email";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(444, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 977, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updateremote_email";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(445, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 978, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(446, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 979, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_city";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(447, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 980, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_city";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(448, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 981, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_city";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(449, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 982, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(450, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 983, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_country";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(451, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 984, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_country";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(452, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 985, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_country";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(453, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 986, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(454, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 987, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_lang";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(455, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 988, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_lang";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(456, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 989, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_lang";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(457, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 990, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(458, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 991, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_description";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(459, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 992, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_description";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(460, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 993, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_description";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(461, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 994, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(462, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 995, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"field_map_url";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(463, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 996, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_updatelocal_url";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(464, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 997, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updateremote_url";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(465, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 998, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(466, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 999, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_idnumber";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(467, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1000, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(468, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1001, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_idnumber";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(469, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1002, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(470, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1003, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_institution";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(471, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1004, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_institution";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(472, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1005, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_institution";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(473, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1006, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(474, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1007, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_department";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(475, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1008, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_department";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(476, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1009, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_department";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(477, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1010, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(478, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1011, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone1";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(479, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1012, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(480, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1013, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone1";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(481, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1014, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(482, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1015, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone2";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(483, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1016, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(484, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1017, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone2";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(485, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1018, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(486, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1019, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_address";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(487, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1020, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_address";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(488, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1021, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_address";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(489, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1022, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(490, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1023, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_map_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(491, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1024, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updatelocal_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(492, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1025, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:36:"field_updateremote_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(493, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1026, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(494, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1027, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_map_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(495, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1028, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"field_updatelocal_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(496, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1029, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updateremote_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(497, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1030, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(498, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1031, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_middlename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(499, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1032, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840113, 'web', '0:0:0:0:0:0:0:1', NULL),
(500, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1033, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_middlename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(501, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1034, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(502, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1035, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_map_alternatename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(503, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1036, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"field_updatelocal_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(504, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1037, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:32:"field_updateremote_alternatename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(505, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1038, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:7:"auth_db";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(506, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1039, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_map_firstname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(507, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1040, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updatelocal_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(508, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1041, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updateremote_firstname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(509, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1042, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(510, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1043, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_lastname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(511, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1044, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(512, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1045, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_lastname";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(513, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1046, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(514, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1047, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_map_email";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(515, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1048, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updatelocal_email";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(516, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1049, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updateremote_email";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(517, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1050, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(518, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1051, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_city";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(519, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1052, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_city";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(520, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1053, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_city";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(521, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1054, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(522, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1055, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_country";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(523, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1056, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_country";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(524, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1057, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_country";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(525, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1058, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(526, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1059, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_lang";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(527, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1060, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_lang";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(528, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1061, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updateremote_lang";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(529, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1062, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(530, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1063, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_description";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(531, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1064, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_description";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(532, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1065, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_description";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(533, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1066, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(534, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1067, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"field_map_url";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(535, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1068, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_updatelocal_url";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(536, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1069, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updateremote_url";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(537, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1070, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(538, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1071, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_idnumber";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(539, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1072, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(540, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1073, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updateremote_idnumber";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(541, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1074, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(542, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1075, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_institution";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(543, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1076, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_institution";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(544, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1077, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:30:"field_updateremote_institution";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(545, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1078, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(546, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1079, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_department";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(547, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1080, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_department";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(548, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1081, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_department";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(549, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1082, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(550, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1083, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone1";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(551, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1084, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(552, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1085, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone1";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(553, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1086, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(554, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1087, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone2";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(555, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1088, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(556, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1089, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updateremote_phone2";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(557, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1090, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(558, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1091, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_address";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(559, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1092, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_address";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(560, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1093, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updateremote_address";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(561, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1094, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(562, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1095, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_map_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(563, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1096, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updatelocal_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(564, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1097, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:36:"field_updateremote_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(565, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1098, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(566, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1099, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_map_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(567, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1100, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"field_updatelocal_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840114, 'web', '0:0:0:0:0:0:0:1', NULL),
(568, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1101, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updateremote_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(569, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1102, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(570, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1103, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_middlename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(571, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1104, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(572, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1105, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updateremote_middlename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(573, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1106, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(574, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1107, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_map_alternatename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(575, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1108, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"field_updatelocal_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(576, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1109, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:32:"field_updateremote_alternatename";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(577, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1110, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_ldap";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(578, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1111, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"expiration";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(579, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1112, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"expirationtime";s:8:"oldvalue";N;s:5:"value";s:2:"30";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(580, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1113, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"expiration_warning";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(581, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1114, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(582, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1115, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(583, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1116, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(584, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1117, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(585, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1118, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(586, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1119, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(587, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1120, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(588, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1121, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(589, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1122, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(590, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1123, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(591, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1124, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(592, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1125, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(593, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1126, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(594, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1127, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(595, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1128, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(596, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1129, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(597, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1130, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(598, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1131, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_manual";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(599, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1132, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"rpc_negotiation_timeout";s:8:"oldvalue";N;s:5:"value";s:2:"30";s:6:"plugin";s:9:"auth_mnet";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(600, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1133, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(601, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1134, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(602, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1135, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(603, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1136, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(604, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1137, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(605, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1138, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(606, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1139, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(607, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1140, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(608, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1141, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(609, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1142, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(610, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1143, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(611, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1144, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(612, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1145, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(613, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1146, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(614, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1147, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(615, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1148, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(616, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1149, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(617, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1150, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:9:"auth_none";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(618, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1151, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(619, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1152, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(620, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1153, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(621, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1154, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(622, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1155, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(623, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1156, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(624, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1157, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(625, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1158, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(626, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1159, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(627, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1160, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(628, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1161, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(629, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1162, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(630, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1163, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(631, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1164, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(632, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1165, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(633, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1166, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(634, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1167, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(635, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1168, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:11:"auth_oauth2";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(636, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1169, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"user_attribute";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(637, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1170, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"convert_data";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(638, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1171, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"alt_login";s:8:"oldvalue";N;s:5:"value";s:3:"off";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(639, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1172, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"organization_selection";s:8:"oldvalue";N;s:5:"value";s:259:"urn:mace:organization1:providerID, Example Organization 1\n        https://another.idp-id.com/shibboleth, Other Example Organization, /Shibboleth.sso/DS/SWITCHaai\n        urn:mace:organization2:providerID, Example Organization 2, /Shibboleth.sso/WAYF/SWITCHaai";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840115, 'web', '0:0:0:0:0:0:0:1', NULL),
(640, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1173, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"logout_handler";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(641, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1174, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"logout_return_url";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(642, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1175, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"login_name";s:8:"oldvalue";N;s:5:"value";s:16:"Shibboleth Login";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(643, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1176, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"auth_instructions";s:8:"oldvalue";N;s:5:"value";s:211:"Use the <a href="http://localhost/SchoolSystem/auth/shibboleth/index.php">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(644, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1177, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"changepasswordurl";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(645, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1178, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_map_firstname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(646, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1179, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_updatelocal_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(647, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1180, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_lock_firstname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(648, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1181, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_lastname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(649, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1182, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(650, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1183, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_lastname";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(651, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1184, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_map_email";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(652, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1185, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_updatelocal_email";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(653, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1186, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_lock_email";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(654, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1187, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_city";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(655, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1188, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_city";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(656, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1189, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_city";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(657, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1190, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_country";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(658, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1191, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_country";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(659, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1192, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_country";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(660, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1193, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_map_lang";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(661, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1194, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_updatelocal_lang";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(662, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1195, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"field_lock_lang";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(663, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1196, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_description";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(664, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1197, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_description";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(665, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1198, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_description";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(666, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1199, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"field_map_url";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(667, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1200, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_updatelocal_url";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(668, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1201, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"field_lock_url";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(669, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1202, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_map_idnumber";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(670, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1203, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_updatelocal_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(671, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1204, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"field_lock_idnumber";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(672, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1205, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_map_institution";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(673, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1206, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:29:"field_updatelocal_institution";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(674, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1207, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"field_lock_institution";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(675, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1208, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_department";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(676, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1209, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_department";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(677, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1210, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_department";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(678, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1211, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone1";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(679, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1212, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(680, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1213, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone1";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(681, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1214, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"field_map_phone2";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(682, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1215, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_updatelocal_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(683, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1216, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_lock_phone2";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(684, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1217, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"field_map_address";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(685, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1218, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"field_updatelocal_address";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(686, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1219, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"field_lock_address";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(687, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1220, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_map_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(688, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1221, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:35:"field_updatelocal_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(689, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1222, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_lock_firstnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(690, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1223, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"field_map_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(691, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1224, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:34:"field_updatelocal_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(692, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1225, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"field_lock_lastnamephonetic";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(693, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1226, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"field_map_middlename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(694, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1227, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"field_updatelocal_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(695, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1228, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"field_lock_middlename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(696, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1229, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"field_map_alternatename";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(697, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1230, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:31:"field_updatelocal_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"oncreate";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(698, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1231, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"field_lock_alternatename";s:8:"oldvalue";N;s:5:"value";s:8:"unlocked";s:6:"plugin";s:15:"auth_shibboleth";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(699, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1232, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"config_showbest";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(700, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1233, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"config_showbest_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(701, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1234, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"config_showworst";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(702, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1235, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"config_showworst_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(703, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1236, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"config_usegroups";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(704, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1237, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"config_usegroups_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(705, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1238, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"config_nameformat";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(706, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1239, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"config_nameformat_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(707, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1240, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"config_gradeformat";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(708, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1241, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:25:"config_gradeformat_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(709, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1242, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"config_decimalpoints";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(710, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1243, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"config_decimalpoints_locked";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:22:"block_activity_results";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(711, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1244, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"defaulttab";s:8:"oldvalue";N;s:5:"value";s:8:"timeline";s:6:"plugin";s:16:"block_myoverview";}', 1524840116, 'web', '0:0:0:0:0:0:0:1', NULL),
(712, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1245, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:27:"block_course_list_adminview";s:8:"oldvalue";N;s:5:"value";s:3:"all";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(713, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1246, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:36:"block_course_list_hideallcourseslink";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(714, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1247, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"block_html_allowcssclasses";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(715, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1248, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"block_online_users_timetosee";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(716, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1249, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:28:"block_rss_client_num_entries";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(717, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1250, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"block_rss_client_timeout";s:8:"oldvalue";N;s:5:"value";s:2:"30";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(718, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1251, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"numsections1";s:8:"oldvalue";N;s:5:"value";s:2:"22";s:6:"plugin";s:19:"block_section_links";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(719, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1252, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"incby1";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";s:19:"block_section_links";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(720, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1253, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"numsections2";s:8:"oldvalue";N;s:5:"value";s:2:"40";s:6:"plugin";s:19:"block_section_links";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(721, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1254, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"incby2";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:19:"block_section_links";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(722, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1255, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"apikey";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"block_tag_youtube";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(723, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1256, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"activitytype";s:8:"oldvalue";N;s:5:"value";s:5:"forum";s:6:"plugin";s:21:"format_singleactivity";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(724, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1257, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"issuerid";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:25:"fileconverter_googledrive";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(725, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1258, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"pathtounoconv";s:8:"oldvalue";N;s:5:"value";s:16:"/usr/bin/unoconv";s:6:"plugin";N;}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(726, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1259, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"roleid";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:12:"enrol_cohort";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(727, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1260, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"unenrolaction";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_cohort";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(728, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1261, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"nosyncroleids";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"enrol_meta";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(729, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1262, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"syncall";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_meta";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(730, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1263, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"unenrolaction";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:10:"enrol_meta";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(731, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1264, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"coursesort";s:8:"oldvalue";N;s:5:"value";s:9:"sortorder";s:6:"plugin";s:10:"enrol_meta";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(732, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1265, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbtype";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(733, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1266, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbhost";s:8:"oldvalue";N;s:5:"value";s:9:"localhost";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(734, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1267, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbuser";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(735, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1268, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbpass";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(736, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1269, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(737, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1270, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"dbencoding";s:8:"oldvalue";N;s:5:"value";s:5:"utf-8";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(738, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1271, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"dbsetupsql";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(739, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1272, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"dbsybasequoting";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(740, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1273, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"debugdb";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(741, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1274, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"localcoursefield";s:8:"oldvalue";N;s:5:"value";s:8:"idnumber";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(742, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1275, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"localuserfield";s:8:"oldvalue";N;s:5:"value";s:8:"idnumber";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(743, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1276, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"localrolefield";s:8:"oldvalue";N;s:5:"value";s:9:"shortname";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(744, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1277, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"localcategoryfield";s:8:"oldvalue";N;s:5:"value";s:2:"id";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(745, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1278, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"remoteenroltable";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(746, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1279, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"remotecoursefield";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(747, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1280, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"remoteuserfield";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(748, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1281, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"remoterolefield";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(749, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1282, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"remoteotheruserfield";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(750, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1283, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"defaultrole";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(751, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1284, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"ignorehiddencourses";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(752, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1285, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"unenrolaction";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(753, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1286, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"newcoursetable";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(754, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1287, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"newcoursefullname";s:8:"oldvalue";N;s:5:"value";s:8:"fullname";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(755, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1288, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"newcourseshortname";s:8:"oldvalue";N;s:5:"value";s:9:"shortname";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(756, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1289, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"newcourseidnumber";s:8:"oldvalue";N;s:5:"value";s:8:"idnumber";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(757, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1290, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"newcoursecategory";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(758, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1291, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"defaultcategory";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(759, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1292, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"templatecourse";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_database";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(760, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1293, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"location";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(761, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1294, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"encoding";s:8:"oldvalue";N;s:5:"value";s:5:"UTF-8";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(762, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1295, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"mailstudents";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(763, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1296, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"mailteachers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(764, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1297, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"mailadmins";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(765, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1298, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"unenrolaction";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(766, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1299, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"expiredaction";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:14:"enrol_flatfile";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(767, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1300, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"requirepassword";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(768, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1301, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"usepasswordpolicy";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(769, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1302, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"showhint";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(770, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1303, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"defaultenrol";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(771, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1304, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"status";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(772, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1305, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"status_adv";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:11:"enrol_guest";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(773, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1306, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"imsfilelocation";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(774, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1307, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"logtolocation";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(775, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1308, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"mailadmins";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(776, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1309, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"createnewusers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(777, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1310, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"imsupdateusers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840117, 'web', '0:0:0:0:0:0:0:1', NULL),
(778, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1311, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"imsdeleteusers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(779, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1312, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"fixcaseusernames";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(780, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1313, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"fixcasepersonalnames";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(781, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1314, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"imssourcedidfallback";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(782, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1315, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap01";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(783, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1316, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap02";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(784, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1317, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap03";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(785, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1318, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap04";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(786, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1319, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap05";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(787, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1320, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap06";s:8:"oldvalue";N;s:5:"value";s:1:"4";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(788, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1321, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap07";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(789, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1322, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imsrolemap08";s:8:"oldvalue";N;s:5:"value";s:1:"4";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(790, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1323, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"truncatecoursecodes";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(791, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1324, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"createnewcourses";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(792, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1325, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"updatecourses";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(793, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1326, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"createnewcategories";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(794, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1327, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"nestedcategories";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(795, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1328, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"categoryidnumber";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(796, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1329, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"categoryseparator";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(797, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1330, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"imsunenrol";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(798, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1331, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"imscoursemapshortname";s:8:"oldvalue";N;s:5:"value";s:10:"coursecode";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(799, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1332, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"imscoursemapfullname";s:8:"oldvalue";N;s:5:"value";s:5:"short";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(800, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1333, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"imscoursemapsummary";s:8:"oldvalue";N;s:5:"value";s:6:"ignore";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(801, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1334, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"imsrestricttarget";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(802, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1335, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"imscapitafix";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:19:"enrol_imsenterprise";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(803, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1336, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"expiredaction";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(804, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1337, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"expirynotifyhour";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(805, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1338, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"defaultenrol";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(806, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1339, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"status";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(807, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1340, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"roleid";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(808, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1341, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"enrolstart";s:8:"oldvalue";N;s:5:"value";s:1:"4";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(809, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1342, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"enrolperiod";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(810, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1343, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"expirynotify";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(811, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1344, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"expirythreshold";s:8:"oldvalue";N;s:5:"value";s:5:"86400";s:6:"plugin";s:12:"enrol_manual";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(812, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1345, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"roleid";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:10:"enrol_mnet";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(813, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1346, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"roleid_adv";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_mnet";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(814, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1347, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"paypalbusiness";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(815, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1348, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"mailstudents";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(816, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1349, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"mailteachers";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(817, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1350, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"mailadmins";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(818, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1351, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"expiredaction";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(819, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1352, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"status";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(820, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1353, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"cost";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(821, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1354, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"currency";s:8:"oldvalue";N;s:5:"value";s:3:"USD";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(822, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1355, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"roleid";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(823, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1356, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"enrolperiod";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:12:"enrol_paypal";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(824, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1357, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"emaildisplay";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(825, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1358, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"city";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(826, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1359, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"country";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(827, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1360, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"timezone";s:8:"oldvalue";N;s:5:"value";s:2:"99";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(828, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1361, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:4:"lang";s:8:"oldvalue";N;s:5:"value";s:2:"en";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(829, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1362, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"institution";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:9:"enrol_lti";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(830, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1363, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"requirepassword";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(831, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1364, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"usepasswordpolicy";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(832, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1365, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"showhint";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(833, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1366, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"expiredaction";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(834, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1367, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"expirynotifyhour";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(835, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1368, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"defaultenrol";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(836, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1369, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"status";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(837, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1370, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"newenrols";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(838, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1371, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"groupkey";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(839, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1372, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"roleid";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(840, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1373, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"enrolperiod";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(841, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1374, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"expirynotify";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(842, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1375, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"expirythreshold";s:8:"oldvalue";N;s:5:"value";s:5:"86400";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(843, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1376, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"longtimenosee";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(844, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1377, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"maxenrolled";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(845, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1378, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"sendcoursewelcomemessage";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:10:"enrol_self";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(846, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1379, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"formats";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:16:"filter_urltolink";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(847, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1380, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"embedimages";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:16:"filter_urltolink";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(848, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1381, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"formats";s:8:"oldvalue";N;s:5:"value";s:5:"1,4,0";s:6:"plugin";s:15:"filter_emoticon";}', 1524840118, 'web', '0:0:0:0:0:0:0:1', NULL),
(849, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1382, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"httpsurl";s:8:"oldvalue";N;s:5:"value";s:63:"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js";s:6:"plugin";s:20:"filter_mathjaxloader";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(850, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1383, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"texfiltercompatibility";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:20:"filter_mathjaxloader";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(851, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1384, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"mathjaxconfig";s:8:"oldvalue";N;s:5:"value";s:162:"\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n";s:6:"plugin";s:20:"filter_mathjaxloader";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(852, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1385, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"additionaldelimiters";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:20:"filter_mathjaxloader";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(853, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1386, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:26:"filter_multilang_force_old";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(854, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1387, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"latexpreamble";s:8:"oldvalue";N;s:5:"value";s:115:"\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(855, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1388, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"latexbackground";s:8:"oldvalue";N;s:5:"value";s:7:"#FFFFFF";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(856, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1389, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"density";s:8:"oldvalue";N;s:5:"value";s:3:"120";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(857, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1390, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"pathlatex";s:8:"oldvalue";N;s:5:"value";s:14:"/usr/bin/latex";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(858, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1391, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"pathdvips";s:8:"oldvalue";N;s:5:"value";s:14:"/usr/bin/dvips";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(859, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1392, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"pathconvert";s:8:"oldvalue";N;s:5:"value";s:16:"/usr/bin/convert";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(860, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1393, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"pathdvisvgm";s:8:"oldvalue";N;s:5:"value";s:16:"/usr/bin/dvisvgm";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(861, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1394, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"pathmimetex";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(862, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1395, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"convertformat";s:8:"oldvalue";N;s:5:"value";s:3:"gif";s:6:"plugin";s:10:"filter_tex";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(863, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1396, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"filter_censor_badwords";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(864, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1397, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"dbdriver";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(865, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1398, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbhost";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(866, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1399, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbuser";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(867, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1400, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbpass";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(868, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1401, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbname";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(869, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1402, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"dbtable";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(870, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1403, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"dbpersist";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(871, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1404, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"dbsocket";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(872, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1405, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:6:"dbport";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(873, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1406, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"dbschema";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(874, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1407, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"dbcollation";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(875, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1408, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"dbhandlesoptions";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(876, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1409, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"buffersize";s:8:"oldvalue";N;s:5:"value";s:2:"50";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(877, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1410, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"logguests";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(878, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1411, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"includelevels";s:8:"oldvalue";N;s:5:"value";s:5:"1,2,0";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(879, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1412, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"includeactions";s:8:"oldvalue";N;s:5:"value";s:7:"c,r,u,d";s:6:"plugin";s:17:"logstore_database";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(880, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1413, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"loglegacy";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:15:"logstore_legacy";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(881, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1414, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"logguests";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(882, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1415, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"loglifetime";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(883, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1416, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"logguests";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:17:"logstore_standard";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(884, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1417, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"loglifetime";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:17:"logstore_standard";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(885, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1418, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"buffersize";s:8:"oldvalue";N;s:5:"value";s:2:"50";s:6:"plugin";s:17:"logstore_standard";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(886, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1419, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"videoextensions";s:8:"oldvalue";N;s:5:"value";s:20:"html_video,.f4v,.flv";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(887, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1420, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"audioextensions";s:8:"oldvalue";N;s:5:"value";s:10:"html_audio";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(888, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1421, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"useflash";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(889, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1422, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"youtube";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(890, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1423, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"videocssclass";s:8:"oldvalue";N;s:5:"value";s:8:"video-js";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(891, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1424, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"audiocssclass";s:8:"oldvalue";N;s:5:"value";s:8:"video-js";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(892, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1425, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"limitsize";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:13:"media_videojs";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(893, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1426, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"jabberhost";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(894, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1427, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"jabberserver";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(895, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1428, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"jabberusername";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(896, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1429, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"jabberpassword";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(897, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1430, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"jabberport";s:8:"oldvalue";N;s:5:"value";s:4:"5222";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(898, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1431, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"airnotifierurl";s:8:"oldvalue";N;s:5:"value";s:27:"https://messages.moodle.net";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(899, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1432, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"airnotifierport";s:8:"oldvalue";N;s:5:"value";s:3:"443";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(900, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1433, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:24:"airnotifiermobileappname";s:8:"oldvalue";N;s:5:"value";s:23:"com.moodle.moodlemobile";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(901, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1434, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:18:"airnotifierappname";s:8:"oldvalue";N;s:5:"value";s:21:"commoodlemoodlemobile";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(902, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1435, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"airnotifieraccesskey";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(903, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1436, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"answerhowmany";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:17:"qtype_multichoice";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(904, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1437, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"shuffleanswers";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:17:"qtype_multichoice";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(905, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1438, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"answernumbering";s:8:"oldvalue";N;s:5:"value";s:3:"abc";s:6:"plugin";s:17:"qtype_multichoice";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(906, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1439, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:7:"toolbar";s:8:"oldvalue";N;s:5:"value";s:334:"collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html";s:6:"plugin";s:11:"editor_atto";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(907, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1440, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"autosavefrequency";s:8:"oldvalue";N;s:5:"value";s:2:"60";s:6:"plugin";s:11:"editor_atto";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(908, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1441, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"showgroups";s:8:"oldvalue";N;s:5:"value";s:1:"5";s:6:"plugin";s:13:"atto_collapse";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(909, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1442, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"librarygroup1";s:8:"oldvalue";N;s:5:"value";s:244:"\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n";s:6:"plugin";s:13:"atto_equation";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(910, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1443, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"librarygroup2";s:8:"oldvalue";N;s:5:"value";s:155:"\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n";s:6:"plugin";s:13:"atto_equation";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(911, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1444, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"librarygroup3";s:8:"oldvalue";N;s:5:"value";s:210:"\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n";s:6:"plugin";s:13:"atto_equation";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(912, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1445, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"librarygroup4";s:8:"oldvalue";N;s:5:"value";s:239:"\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n";s:6:"plugin";s:13:"atto_equation";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(913, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1446, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"allowborders";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"atto_table";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(914, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1447, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"allowbackgroundcolour";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"atto_table";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(915, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1448, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:10:"allowwidth";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";s:10:"atto_table";}', 1524840119, 'web', '0:0:0:0:0:0:0:1', NULL),
(916, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1449, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"customtoolbar";s:8:"oldvalue";N;s:5:"value";s:378:"wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen";s:6:"plugin";s:14:"editor_tinymce";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(917, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1450, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"fontselectlist";s:8:"oldvalue";N;s:5:"value";s:338:"Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings";s:6:"plugin";s:14:"editor_tinymce";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(918, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1451, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"customconfig";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:14:"editor_tinymce";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(919, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1452, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"requireemoticon";s:8:"oldvalue";N;s:5:"value";s:1:"1";s:6:"plugin";s:22:"tinymce_moodleemoticon";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(920, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1453, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:11:"spellengine";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";s:20:"tinymce_spellchecker";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(921, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1454, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"spelllanguagelist";s:8:"oldvalue";N;s:5:"value";s:118:"+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv";s:6:"plugin";s:20:"tinymce_spellchecker";}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(922, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1455, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"sitepolicyhandler";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(923, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1456, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"profileroles";s:8:"oldvalue";N;s:5:"value";s:5:"5,4,3";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(924, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1457, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:13:"coursecontact";s:8:"oldvalue";N;s:5:"value";s:1:"3";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(925, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1458, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:9:"frontpage";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(926, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1459, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:17:"frontpageloggedin";s:8:"oldvalue";N;s:5:"value";s:1:"6";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(927, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1460, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:16:"maxcategorydepth";s:8:"oldvalue";N;s:5:"value";s:1:"2";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(928, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1461, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:20:"frontpagecourselimit";s:8:"oldvalue";N;s:5:"value";s:3:"200";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(929, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1462, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:15:"commentsperpage";s:8:"oldvalue";N;s:5:"value";s:2:"15";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(930, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1463, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"defaultfrontpageroleid";s:8:"oldvalue";N;s:5:"value";s:1:"8";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(931, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1464, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"messageinbound_enabled";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(932, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1465, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"messageinbound_mailbox";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(933, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1466, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:21:"messageinbound_domain";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(934, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1467, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:19:"messageinbound_host";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(935, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1468, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"messageinbound_hostssl";s:8:"oldvalue";N;s:5:"value";s:3:"ssl";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(936, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1469, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"messageinbound_hostuser";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(937, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1470, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:23:"messageinbound_hostpass";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(938, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1471, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:22:"enablemobilewebservice";s:8:"oldvalue";N;s:5:"value";s:1:"0";s:6:"plugin";N;}', 1524840120, 'web', '0:0:0:0:0:0:0:1', NULL),
(939, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1472, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:8:"timezone";s:8:"oldvalue";N;s:5:"value";s:17:"America/Guatemala";s:6:"plugin";N;}', 1524840176, 'web', '0:0:0:0:0:0:0:1', NULL),
(940, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1473, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:12:"registerauth";s:8:"oldvalue";N;s:5:"value";s:0:"";s:6:"plugin";N;}', 1524840176, 'web', '0:0:0:0:0:0:0:1', NULL),
(941, '\\core\\event\\config_log_created', 'core', 'created', 'config_log', 'config_log', 1474, 'c', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:4:{s:4:"name";s:14:"noreplyaddress";s:8:"oldvalue";N;s:5:"value";s:26:"codificandoideas@gmail.com";s:6:"plugin";N;}', 1524840243, 'web', '0:0:0:0:0:0:0:1', NULL),
(942, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524840244, 'web', '0:0:0:0:0:0:0:1', NULL),
(943, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1524852312, 'web', '0:0:0:0:0:0:0:1', NULL),
(944, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1524852327, 'web', '0:0:0:0:0:0:0:1', NULL),
(945, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852327, 'web', '0:0:0:0:0:0:0:1', NULL),
(946, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852332, 'web', '0:0:0:0:0:0:0:1', NULL),
(947, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852647, 'web', '0:0:0:0:0:0:0:1', NULL),
(948, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852714, 'web', '0:0:0:0:0:0:0:1', NULL),
(949, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852718, 'web', '0:0:0:0:0:0:0:1', NULL),
(950, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852718, 'web', '0:0:0:0:0:0:0:1', NULL),
(951, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852718, 'web', '0:0:0:0:0:0:0:1', NULL),
(952, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852738, 'web', '0:0:0:0:0:0:0:1', NULL),
(953, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852821, 'web', '0:0:0:0:0:0:0:1', NULL),
(954, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524852876, 'web', '0:0:0:0:0:0:0:1', NULL),
(955, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853163, 'web', '0:0:0:0:0:0:0:1', NULL),
(956, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1524853201, 'web', '0:0:0:0:0:0:0:1', NULL),
(957, '\\tool_usertours\\event\\tour_started', 'tool_usertours', 'started', 'tour', 'tool_usertours_tours', 1, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:1:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";}', 1524853202, 'web', '0:0:0:0:0:0:0:1', NULL),
(958, '\\tool_usertours\\event\\step_shown', 'tool_usertours', 'shown', 'step', 'tool_usertours_steps', 1, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";s:6:"tourid";i:1;s:9:"stepindex";i:0;}', 1524853202, 'web', '0:0:0:0:0:0:0:1', NULL),
(959, '\\tool_usertours\\event\\step_shown', 'tool_usertours', 'shown', 'step', 'tool_usertours_steps', 2, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";s:6:"tourid";i:1;s:9:"stepindex";i:1;}', 1524853206, 'web', '0:0:0:0:0:0:0:1', NULL),
(960, '\\tool_usertours\\event\\step_shown', 'tool_usertours', 'shown', 'step', 'tool_usertours_steps', 3, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";s:6:"tourid";i:1;s:9:"stepindex";i:2;}', 1524853207, 'web', '0:0:0:0:0:0:0:1', NULL),
(961, '\\tool_usertours\\event\\step_shown', 'tool_usertours', 'shown', 'step', 'tool_usertours_steps', 6, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";s:6:"tourid";i:1;s:9:"stepindex";i:5;}', 1524853210, 'web', '0:0:0:0:0:0:0:1', NULL),
(962, '\\tool_usertours\\event\\tour_ended', 'tool_usertours', 'ended', 'tour', 'tool_usertours_tours', 1, 'c', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:41:"http://localhost/SchoolSystem/?redirect=0";s:6:"stepid";i:6;s:9:"stepindex";i:5;}', 1524853214, 'web', '0:0:0:0:0:0:0:1', NULL),
(963, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853216, 'web', '0:0:0:0:0:0:0:1', NULL),
(964, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1524853218, 'web', '0:0:0:0:0:0:0:1', NULL),
(965, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853228, 'web', '0:0:0:0:0:0:0:1', NULL),
(966, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853420, 'web', '0:0:0:0:0:0:0:1', NULL),
(967, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853423, 'web', '0:0:0:0:0:0:0:1', NULL),
(968, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853431, 'web', '0:0:0:0:0:0:0:1', NULL),
(969, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853435, 'web', '0:0:0:0:0:0:0:1', NULL),
(970, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853436, 'web', '0:0:0:0:0:0:0:1', NULL),
(971, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853443, 'web', '0:0:0:0:0:0:0:1', NULL),
(972, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853578, 'web', '0:0:0:0:0:0:0:1', NULL),
(973, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853578, 'web', '0:0:0:0:0:0:0:1', NULL),
(974, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853595, 'web', '0:0:0:0:0:0:0:1', NULL),
(975, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853601, 'web', '0:0:0:0:0:0:0:1', NULL),
(976, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853603, 'web', '0:0:0:0:0:0:0:1', NULL),
(977, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853607, 'web', '0:0:0:0:0:0:0:1', NULL),
(978, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853607, 'web', '0:0:0:0:0:0:0:1', NULL),
(979, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853615, 'web', '0:0:0:0:0:0:0:1', NULL),
(980, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853615, 'web', '0:0:0:0:0:0:0:1', NULL),
(981, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853617, 'web', '0:0:0:0:0:0:0:1', NULL),
(982, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853620, 'web', '0:0:0:0:0:0:0:1', NULL),
(983, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853627, 'web', '0:0:0:0:0:0:0:1', NULL),
(984, '\\core\\event\\dashboard_reset', 'core', 'reset', 'dashboard', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:2:{s:7:"private";i:0;s:8:"pagetype";s:12:"user-profile";}', 1524853633, 'web', '0:0:0:0:0:0:0:1', NULL),
(985, '\\core\\event\\user_profile_viewed', 'core', 'viewed', 'user_profile', 'user', 2, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1524853633, 'web', '0:0:0:0:0:0:0:1', NULL),
(986, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1525096177, 'web', '0:0:0:0:0:0:0:1', NULL),
(987, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096178, 'web', '0:0:0:0:0:0:0:1', NULL),
(988, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096211, 'web', '0:0:0:0:0:0:0:1', NULL),
(989, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096214, 'web', '0:0:0:0:0:0:0:1', NULL),
(990, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1525096215, 'web', '0:0:0:0:0:0:0:1', NULL),
(991, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096730, 'web', '0:0:0:0:0:0:0:1', NULL),
(992, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096733, 'web', '0:0:0:0:0:0:0:1', NULL),
(993, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096739, 'web', '0:0:0:0:0:0:0:1', NULL),
(994, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1525096782, 'web', '0:0:0:0:0:0:0:1', NULL),
(995, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"mk1ojdqqnttgskpqcd4o579bp2";}', 1525096805, 'web', '0:0:0:0:0:0:0:1', NULL),
(996, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1525096805, 'web', '0:0:0:0:0:0:0:1', NULL),
(997, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 1, 'r', 0, 1, 10, 0, 1, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"guest";}', 1525096831, 'web', '0:0:0:0:0:0:0:1', NULL),
(998, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 1, 1, NULL, 0, 'N;', 1525096831, 'web', '0:0:0:0:0:0:0:1', NULL),
(999, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 1, 'r', 0, 1, 10, 0, 1, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"guest";}', 1525096837, 'web', '0:0:0:0:0:0:0:1', NULL),
(1000, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 1, 1, NULL, 0, 'N;', 1525096837, 'web', '0:0:0:0:0:0:0:1', NULL),
(1001, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1525096868, 'web', '0:0:0:0:0:0:0:1', NULL),
(1002, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525096868, 'web', '0:0:0:0:0:0:0:1', NULL),
(1003, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525097358, 'web', '0:0:0:0:0:0:0:1', NULL),
(1004, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525097423, 'web', '0:0:0:0:0:0:0:1', NULL),
(1005, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1525097439, 'web', '0:0:0:0:0:0:0:1', NULL),
(1006, '\\core\\event\\user_loggedout', 'core', 'loggedout', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:9:"sessionid";s:26:"ddnlk9sklvdvv5t90co4pp1fi4";}', 1525097576, 'web', '0:0:0:0:0:0:0:1', NULL),
(1007, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1525097576, 'web', '0:0:0:0:0:0:0:1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='For a particular module/action, specifies a moodle table/fie' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'forum', 'pin discussion', 'forum_discussions', 'name', 'mod_forum'),
(105, 'forum', 'unpin discussion', 'forum_discussions', 'name', 'mod_forum'),
(106, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(116, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(117, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(118, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(120, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(121, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(122, 'label', 'add', 'label', 'name', 'mod_label'),
(123, 'label', 'update', 'label', 'name', 'mod_label'),
(124, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(125, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(126, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(127, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(128, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(129, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(130, 'page', 'view', 'page', 'name', 'mod_page'),
(131, 'page', 'view all', 'page', 'name', 'mod_page'),
(132, 'page', 'update', 'page', 'name', 'mod_page'),
(133, 'page', 'add', 'page', 'name', 'mod_page'),
(134, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(147, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(148, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(149, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(151, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(152, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(153, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(155, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(156, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(157, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(162, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(163, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(164, 'url', 'view', 'url', 'name', 'mod_url'),
(165, 'url', 'view all', 'url', 'name', 'mod_url'),
(166, 'url', 'update', 'url', 'name', 'mod_url'),
(167, 'url', 'add', 'url', 'name', 'mod_url'),
(168, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(171, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(172, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(183, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(184, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(185, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(186, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(187, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(188, 'book', 'print', 'book', 'name', 'booktool_print'),
(189, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Logged database queries.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table contains Basic LTI activities instances' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keeps track of individual submissions for LTI activities.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_proxies`
--

CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `capabilityoffered` longtext NOT NULL,
  `serviceoffered` longtext NOT NULL,
  `toolproxy` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI tool proxy registrations' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_settings`
--

CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='LTI tool setting values' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext,
  `parameter` longtext,
  `icon` longtext,
  `secureicon` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Basic LTI pre-configured activities' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Basic LTI types configuration' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `eventtype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all unread messages' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Inbound Message data item secret keys.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_handlers`
--

CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Inbound Message Handler definitions.' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

INSERT INTO `mdl_messageinbound_handlers` (`id`, `component`, `classname`, `defaultexpiration`, `validateaddress`, `enabled`) VALUES
(1, 'core', '\\core\\message\\inbound\\private_files_handler', 0, 1, 0),
(2, 'mod_forum', '\\mod_forum\\message\\inbound\\reply_handler', 604800, 1, 0),
(3, 'tool_messageinbound', '\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler', 604800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL,
  `messageid` longtext NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of message IDs for existing replies' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store information about the devices registered in Airnotifie' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains lists of relationships between users' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_popup`
--

CREATE TABLE `mdl_message_popup` (
  `id` bigint(10) NOT NULL,
  `messageid` bigint(10) NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Keep state of notifications for the popup message processor' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of message output plugins' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'airnotifier', 0),
(2, 'email', 1),
(3, 'jabber', 1),
(4, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table stores the message providers (modules and core sy' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'competencyplancomment', 'moodle', NULL),
(12, 'competencyusercompcomment', 'moodle', NULL),
(13, 'insights', 'moodle', 'moodle/analytics:listinsights'),
(14, 'assign_notification', 'mod_assign', NULL),
(15, 'assignment_updates', 'mod_assignment', NULL),
(16, 'submission', 'mod_feedback', NULL),
(17, 'message', 'mod_feedback', NULL),
(18, 'posts', 'mod_forum', NULL),
(19, 'digests', 'mod_forum', NULL),
(20, 'graded_essay', 'mod_lesson', NULL),
(21, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(22, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(23, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(24, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(25, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(26, 'expiry_notification', 'enrol_manual', NULL),
(27, 'paypal_enrolment', 'enrol_paypal', NULL),
(28, 'expiry_notification', 'enrol_self', NULL),
(29, 'invalidrecipienthandler', 'tool_messageinbound', NULL),
(30, 'messageprocessingerror', 'tool_messageinbound', NULL),
(31, 'messageprocessingsuccess', 'tool_messageinbound', NULL),
(32, 'notification', 'tool_monitor', 'tool/monitor:subscribe');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `eventtype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores all messages that have been read' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Lists all the messages and processors that need to be proces' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Caches the information fetched via XML-RPC about courses on ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Caches the information about enrolments of our local users i' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about applications on remote hosts' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about the local and remote hosts for RPC' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
(1, 0, 'http://localhost/SchoolSystem', '::1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information about the services for a given host' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store session data from users migrating to other sites' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table describes functions that might be called remotely' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Group functions or methods under a service' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Functions or methods that we may publish or subscribe to' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:18:"User Agent string.";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:11:"false|array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:75:"Assoc array of courses following the structure of mnetservice_enrol_courses";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:43:"user details {@see mnet_fields_to_import()}";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"of our local course";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:12:"string|array";s:11:"description";s:58:"comma separated list of role shortnames (or array of them)";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A service is a group of functions' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Group functions or methods under a service' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Store session data from users migrating to other sites' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Users by host permitted (or not) to login from a remote prov' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='modules available in the site' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 1),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 0, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Extra user pages for the My Moodle system' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0),
(5, 2, '__default', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_endpoint`
--

CREATE TABLE `mdl_oauth2_endpoint` (
  `id` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` longtext NOT NULL,
  `issuerid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Describes the named endpoint for an oauth2 service.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_issuer`
--

CREATE TABLE `mdl_oauth2_issuer` (
  `id` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` longtext NOT NULL,
  `baseurl` longtext NOT NULL,
  `clientid` longtext NOT NULL,
  `clientsecret` longtext NOT NULL,
  `loginscopes` longtext NOT NULL,
  `loginscopesoffline` longtext NOT NULL,
  `loginparams` longtext NOT NULL,
  `loginparamsoffline` longtext NOT NULL,
  `alloweddomains` longtext NOT NULL,
  `scopessupported` longtext,
  `enabled` tinyint(2) NOT NULL DEFAULT '1',
  `showonloginpage` tinyint(2) NOT NULL DEFAULT '1',
  `basicauth` tinyint(2) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL,
  `requireconfirmation` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Details for an oauth 2 connect identity issuer.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_system_account`
--

CREATE TABLE `mdl_oauth2_system_account` (
  `id` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `refreshtoken` longtext NOT NULL,
  `grantedscopes` longtext NOT NULL,
  `email` longtext,
  `username` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stored details used to get an access token as a system user ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_user_field_mapping`
--

CREATE TABLE `mdl_oauth2_user_field_mapping` (
  `id` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `externalfield` varchar(64) NOT NULL DEFAULT '',
  `internalfield` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Mapping of oauth user fields to moodle fields.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Each record is one page and its config data' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='base table (not including config data) for instances of port' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='config for portfolio plugin instances' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='user data for portfolio instances.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='log of portfolio transfers (used to later check for duplicat' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='maps mahara tokens to transfer ids' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='stores temporary data for portfolio exports. the id of this ' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Generic post table to hold data blog entries etc in differen' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the results of all the profiling runs' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines drag and drop (text or images onto a background imag' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Images to drag. Actual file names are not stored here we use' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Drop boxes' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker`
--

CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines drag and drop (text or images onto a background imag' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Labels for markers to drag.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) DEFAULT NULL,
  `coords` longtext NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='drop regions' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Extra options for essay questions.' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Defines the question-type specific options for matching ques' ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The subquestions that make up a matching question' ROW_FORMAT=COMPRESSED;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mdl_analytics_indicator_calc`
--
ALTER TABLE `mdl_analytics_indicator_calc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analindicalc_staendcon_ix` (`starttime`,`endtime`,`contextid`),
  ADD KEY `mdl_analindicalc_con_ix` (`contextid`);

--
-- Indexes for table `mdl_analytics_models`
--
ALTER TABLE `mdl_analytics_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analmode_enatra_ix` (`enabled`,`trained`);

--
-- Indexes for table `mdl_analytics_models_log`
--
ALTER TABLE `mdl_analytics_models_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analmodelog_mod_ix` (`modelid`);

--
-- Indexes for table `mdl_analytics_predictions`
--
ALTER TABLE `mdl_analytics_predictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analpred_modcon_ix` (`modelid`,`contextid`),
  ADD KEY `mdl_analpred_mod_ix` (`modelid`),
  ADD KEY `mdl_analpred_con_ix` (`contextid`);

--
-- Indexes for table `mdl_analytics_prediction_actions`
--
ALTER TABLE `mdl_analytics_prediction_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analpredacti_preuseact_ix` (`predictionid`,`userid`,`actionname`),
  ADD KEY `mdl_analpredacti_pre_ix` (`predictionid`),
  ADD KEY `mdl_analpredacti_use_ix` (`userid`);

--
-- Indexes for table `mdl_analytics_predict_samples`
--
ALTER TABLE `mdl_analytics_predict_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analpredsamp_modanatimr_ix` (`modelid`,`analysableid`,`timesplitting`,`rangeindex`),
  ADD KEY `mdl_analpredsamp_mod_ix` (`modelid`);

--
-- Indexes for table `mdl_analytics_train_samples`
--
ALTER TABLE `mdl_analytics_train_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analtraisamp_modanatim_ix` (`modelid`,`analysableid`,`timesplitting`),
  ADD KEY `mdl_analtraisamp_mod_ix` (`modelid`),
  ADD KEY `mdl_analtraisamp_fil_ix` (`fileid`);

--
-- Indexes for table `mdl_analytics_used_analysables`
--
ALTER TABLE `mdl_analytics_used_analysables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analusedanal_modact_ix` (`modelid`,`action`),
  ADD KEY `mdl_analusedanal_mod_ix` (`modelid`);

--
-- Indexes for table `mdl_analytics_used_files`
--
ALTER TABLE `mdl_analytics_used_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_analusedfile_modactfil_ix` (`modelid`,`action`,`fileid`),
  ADD KEY `mdl_analusedfile_mod_ix` (`modelid`),
  ADD KEY `mdl_analusedfile_fil_ix` (`fileid`);

--
-- Indexes for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou_ix` (`course`),
  ADD KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`);

--
-- Indexes for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assicomm_ass_ix` (`assignment`),
  ADD KEY `mdl_assicomm_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditanno_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditcmnt_gra_ix` (`gradeid`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_queue`
--
ALTER TABLE `mdl_assignfeedback_editpdf_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditquic_use_ix` (`userid`);

--
-- Indexes for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass2_ix` (`assignment`),
  ADD KEY `mdl_assifile_gra_ix` (`grade`);

--
-- Indexes for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou2_ix` (`course`);

--
-- Indexes for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assisubm_use2_ix` (`userid`),
  ADD KEY `mdl_assisubm_mai_ix` (`mailed`),
  ADD KEY `mdl_assisubm_tim_ix` (`timemarked`),
  ADD KEY `mdl_assisubm_ass2_ix` (`assignment`);

--
-- Indexes for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  ADD KEY `mdl_assiupgr_old2_ix` (`oldinstance`);

--
-- Indexes for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass_ix` (`assignment`),
  ADD KEY `mdl_assifile_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assionli_ass_ix` (`assignment`),
  ADD KEY `mdl_assionli_sub_ix` (`submission`);

--
-- Indexes for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  ADD KEY `mdl_assigrad_use_ix` (`userid`),
  ADD KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assigrad_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_overrides`
--
ALTER TABLE `mdl_assign_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiover_ass_ix` (`assignid`),
  ADD KEY `mdl_assiover_gro_ix` (`groupid`),
  ADD KEY `mdl_assiover_use_ix` (`userid`);

--
-- Indexes for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  ADD KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  ADD KEY `mdl_assiplugconf_nam_ix` (`name`),
  ADD KEY `mdl_assiplugconf_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  ADD KEY `mdl_assisubm_use_ix` (`userid`),
  ADD KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  ADD KEY `mdl_assisubm_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  ADD KEY `mdl_assiuserflag_use_ix` (`userid`),
  ADD KEY `mdl_assiuserflag_ass_ix` (`assignment`);

--
-- Indexes for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  ADD KEY `mdl_assiusermapp_use_ix` (`userid`);

--
-- Indexes for table `mdl_auth_oauth2_linked_login`
--
ALTER TABLE `mdl_auth_oauth2_linked_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_authoautlinklogi_useis_uix` (`userid`,`issuerid`,`username`),
  ADD KEY `mdl_authoautlinklogi_issuse_ix` (`issuerid`,`username`),
  ADD KEY `mdl_authoautlinklogi_use_ix` (`usermodified`),
  ADD KEY `mdl_authoautlinklogi_use2_ix` (`userid`),
  ADD KEY `mdl_authoautlinklogi_iss_ix` (`issuerid`);

--
-- Indexes for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  ADD KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  ADD KEY `mdl_backcont_use_ix` (`userid`);

--
-- Indexes for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`);

--
-- Indexes for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  ADD KEY `mdl_backlogs_bac_ix` (`backupid`);

--
-- Indexes for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badg_typ_ix` (`type`),
  ADD KEY `mdl_badg_cou_ix` (`courseid`),
  ADD KEY `mdl_badg_use_ix` (`usermodified`),
  ADD KEY `mdl_badg_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgback_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  ADD KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  ADD KEY `mdl_badgcrit_bad_ix` (`badgeid`);

--
-- Indexes for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritmet_cri_ix` (`critid`),
  ADD KEY `mdl_badgcritmet_use_ix` (`userid`),
  ADD KEY `mdl_badgcritmet_iss_ix` (`issuedid`);

--
-- Indexes for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritpara_cri_ix` (`critid`);

--
-- Indexes for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgexte_bac_ix` (`backpackid`);

--
-- Indexes for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  ADD KEY `mdl_badgissu_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgissu_use_ix` (`userid`);

--
-- Indexes for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  ADD KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  ADD KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`);

--
-- Indexes for table `mdl_block`
--
ALTER TABLE `mdl_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_bloc_nam_uix` (`name`);

--
-- Indexes for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  ADD KEY `mdl_blocinst_tim_ix` (`timemodified`),
  ADD KEY `mdl_blocinst_par_ix` (`parentcontextid`);

--
-- Indexes for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  ADD KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  ADD KEY `mdl_blocposi_con_ix` (`contextid`);

--
-- Indexes for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`);

--
-- Indexes for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogasso_con_ix` (`contextid`),
  ADD KEY `mdl_blogasso_blo_ix` (`blogid`);

--
-- Indexes for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogexte_use_ix` (`userid`);

--
-- Indexes for table `mdl_book`
--
ALTER TABLE `mdl_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`);

--
-- Indexes for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachflag_fla_ix` (`flagtype`),
  ADD KEY `mdl_cachflag_nam_ix` (`name`);

--
-- Indexes for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_capa_nam_uix` (`name`);

--
-- Indexes for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chat_cou_ix` (`course`);

--
-- Indexes for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmess_use_ix` (`userid`),
  ADD KEY `mdl_chatmess_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmess_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmesscurr_use_ix` (`userid`),
  ADD KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmesscurr_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatuser_use_ix` (`userid`),
  ADD KEY `mdl_chatuser_las_ix` (`lastping`),
  ADD KEY `mdl_chatuser_gro_ix` (`groupid`),
  ADD KEY `mdl_chatuser_cha_ix` (`chatid`);

--
-- Indexes for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choi_cou_ix` (`course`);

--
-- Indexes for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiansw_use_ix` (`userid`),
  ADD KEY `mdl_choiansw_cho_ix` (`choiceid`),
  ADD KEY `mdl_choiansw_opt_ix` (`optionid`);

--
-- Indexes for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiopti_cho_ix` (`choiceid`);

--
-- Indexes for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_coho_con_ix` (`contextid`);

--
-- Indexes for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  ADD KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  ADD KEY `mdl_cohomemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_competency`
--
ALTER TABLE `mdl_competency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  ADD KEY `mdl_comp_rul_ix` (`ruleoutcome`);

--
-- Indexes for table `mdl_competency_coursecomp`
--
ALTER TABLE `mdl_competency_coursecomp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  ADD KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  ADD KEY `mdl_compcour_cou2_ix` (`courseid`),
  ADD KEY `mdl_compcour_com_ix` (`competencyid`);

--
-- Indexes for table `mdl_competency_coursecompsetting`
--
ALTER TABLE `mdl_competency_coursecompsetting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`);

--
-- Indexes for table `mdl_competency_evidence`
--
ALTER TABLE `mdl_competency_evidence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_compevid_use_ix` (`usercompetencyid`);

--
-- Indexes for table `mdl_competency_framework`
--
ALTER TABLE `mdl_competency_framework`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`);

--
-- Indexes for table `mdl_competency_modulecomp`
--
ALTER TABLE `mdl_competency_modulecomp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  ADD KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  ADD KEY `mdl_compmodu_cmi_ix` (`cmid`),
  ADD KEY `mdl_compmodu_com_ix` (`competencyid`);

--
-- Indexes for table `mdl_competency_plan`
--
ALTER TABLE `mdl_competency_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  ADD KEY `mdl_compplan_tem_ix` (`templateid`),
  ADD KEY `mdl_compplan_stadue_ix` (`status`,`duedate`);

--
-- Indexes for table `mdl_competency_plancomp`
--
ALTER TABLE `mdl_competency_plancomp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`);

--
-- Indexes for table `mdl_competency_relatedcomp`
--
ALTER TABLE `mdl_competency_relatedcomp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_competency_template`
--
ALTER TABLE `mdl_competency_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_competency_templatecohort`
--
ALTER TABLE `mdl_competency_templatecohort`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  ADD KEY `mdl_comptemp_tem2_ix` (`templateid`);

--
-- Indexes for table `mdl_competency_templatecomp`
--
ALTER TABLE `mdl_competency_templatecomp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_comptemp_tem_ix` (`templateid`),
  ADD KEY `mdl_comptemp_com_ix` (`competencyid`);

--
-- Indexes for table `mdl_competency_usercomp`
--
ALTER TABLE `mdl_competency_usercomp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`);

--
-- Indexes for table `mdl_competency_usercompcourse`
--
ALTER TABLE `mdl_competency_usercompcourse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`);

--
-- Indexes for table `mdl_competency_usercompplan`
--
ALTER TABLE `mdl_competency_usercompplan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`);

--
-- Indexes for table `mdl_competency_userevidence`
--
ALTER TABLE `mdl_competency_userevidence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_compuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_competency_userevidencecomp`
--
ALTER TABLE `mdl_competency_userevidencecomp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  ADD KEY `mdl_compuser_use2_ix` (`userevidenceid`);

--
-- Indexes for table `mdl_config`
--
ALTER TABLE `mdl_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_conf_nam_uix` (`name`);

--
-- Indexes for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_conflog_tim_ix` (`timemodified`),
  ADD KEY `mdl_conflog_use_ix` (`userid`);

--
-- Indexes for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`);

--
-- Indexes for table `mdl_context`
--
ALTER TABLE `mdl_context`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  ADD KEY `mdl_cont_ins_ix` (`instanceid`),
  ADD KEY `mdl_cont_pat_ix` (`path`);

--
-- Indexes for table `mdl_context_temp`
--
ALTER TABLE `mdl_context_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course`
--
ALTER TABLE `mdl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cour_cat_ix` (`category`),
  ADD KEY `mdl_cour_idn_ix` (`idnumber`),
  ADD KEY `mdl_cour_sho_ix` (`shortname`),
  ADD KEY `mdl_cour_sor_ix` (`sortorder`);

--
-- Indexes for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  ADD KEY `mdl_courcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  ADD KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  ADD KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`);

--
-- Indexes for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcompcrit_cou_ix` (`course`);

--
-- Indexes for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`);

--
-- Indexes for table `mdl_course_completion_defaults`
--
ALTER TABLE `mdl_course_completion_defaults`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompdefa_coumod_uix` (`course`,`module`),
  ADD KEY `mdl_courcompdefa_mod_ix` (`module`),
  ADD KEY `mdl_courcompdefa_cou_ix` (`course`);

--
-- Indexes for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  ADD KEY `mdl_courformopti_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courmodu_vis_ix` (`visible`),
  ADD KEY `mdl_courmodu_cou_ix` (`course`),
  ADD KEY `mdl_courmodu_mod_ix` (`module`),
  ADD KEY `mdl_courmodu_ins_ix` (`instance`),
  ADD KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  ADD KEY `mdl_courmodu_gro_ix` (`groupingid`);

--
-- Indexes for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  ADD KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`);

--
-- Indexes for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courrequ_sho_ix` (`shortname`);

--
-- Indexes for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`);

--
-- Indexes for table `mdl_data`
--
ALTER TABLE `mdl_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_data_cou_ix` (`course`);

--
-- Indexes for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datacont_rec_ix` (`recordid`),
  ADD KEY `mdl_datacont_fie_ix` (`fieldid`);

--
-- Indexes for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  ADD KEY `mdl_datafiel_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datareco_dat_ix` (`dataid`);

--
-- Indexes for table `mdl_editor_atto_autosave`
--
ALTER TABLE `mdl_editor_atto_autosave`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`);

--
-- Indexes for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enro_enr_ix` (`enrol`),
  ADD KEY `mdl_enro_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroflat_cou_ix` (`courseid`),
  ADD KEY `mdl_enroflat_use_ix` (`userid`),
  ADD KEY `mdl_enroflat_rol_ix` (`roleid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_consumer`
--
ALTER TABLE `mdl_enrol_lti_lti2_consumer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_enroltilti2cons_con_uix` (`consumerkey256`);

--
-- Indexes for table `mdl_enrol_lti_lti2_context`
--
ALTER TABLE `mdl_enrol_lti_lti2_context`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltilti2cont_con_ix` (`consumerid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_nonce`
--
ALTER TABLE `mdl_enrol_lti_lti2_nonce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltilti2nonc_con_ix` (`consumerid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_resource_link`
--
ALTER TABLE `mdl_enrol_lti_lti2_resource_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltilti2resolink_con_ix` (`contextid`),
  ADD KEY `mdl_enroltilti2resolink_pri_ix` (`primaryresourcelinkid`),
  ADD KEY `mdl_enroltilti2resolink_co2_ix` (`consumerid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_share_key`
--
ALTER TABLE `mdl_enrol_lti_lti2_share_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_enroltilti2sharkey_sha_uix` (`sharekey`),
  ADD UNIQUE KEY `mdl_enroltilti2sharkey_res_uix` (`resourcelinkid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_tool_proxy`
--
ALTER TABLE `mdl_enrol_lti_lti2_tool_proxy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_enroltilti2toolprox_to_uix` (`toolproxykey`),
  ADD KEY `mdl_enroltilti2toolprox_con_ix` (`consumerid`);

--
-- Indexes for table `mdl_enrol_lti_lti2_user_result`
--
ALTER TABLE `mdl_enrol_lti_lti2_user_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltilti2userresu_res_ix` (`resourcelinkid`);

--
-- Indexes for table `mdl_enrol_lti_tools`
--
ALTER TABLE `mdl_enrol_lti_tools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  ADD KEY `mdl_enroltitool_con_ix` (`contextid`);

--
-- Indexes for table `mdl_enrol_lti_tool_consumer_map`
--
ALTER TABLE `mdl_enrol_lti_tool_consumer_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltitoolconsmap_too_ix` (`toolid`),
  ADD KEY `mdl_enroltitoolconsmap_con_ix` (`consumerid`);

--
-- Indexes for table `mdl_enrol_lti_users`
--
ALTER TABLE `mdl_enrol_lti_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroltiuser_use_ix` (`userid`),
  ADD KEY `mdl_enroltiuser_too_ix` (`toolid`);

--
-- Indexes for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_event`
--
ALTER TABLE `mdl_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_even_cou_ix` (`courseid`),
  ADD KEY `mdl_even_use_ix` (`userid`),
  ADD KEY `mdl_even_tim_ix` (`timestart`),
  ADD KEY `mdl_even_tim2_ix` (`timeduration`),
  ADD KEY `mdl_even_typtim_ix` (`type`,`timesort`),
  ADD KEY `mdl_even_grocoucatvisuse_ix` (`groupid`,`courseid`,`categoryid`,`visible`,`userid`),
  ADD KEY `mdl_even_cat_ix` (`categoryid`);

--
-- Indexes for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`);

--
-- Indexes for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueu_use_ix` (`userid`);

--
-- Indexes for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  ADD KEY `mdl_evenqueuhand_han_ix` (`handlerid`);

--
-- Indexes for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_extefunc_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_exteserv_nam_uix` (`name`);

--
-- Indexes for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`);

--
-- Indexes for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_exteservuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_extetoke_use_ix` (`userid`),
  ADD KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_extetoke_con_ix` (`contextid`),
  ADD KEY `mdl_extetoke_cre_ix` (`creatorid`);

--
-- Indexes for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feed_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use2_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee2_ix` (`feedback`);

--
-- Indexes for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feeditem_fee_ix` (`feedback`),
  ADD KEY `mdl_feeditem_tem_ix` (`template`);

--
-- Indexes for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  ADD KEY `mdl_feedsitemap_fee_ix` (`feedbackid`);

--
-- Indexes for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedtemp_cou_ix` (`course`);

--
-- Indexes for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  ADD KEY `mdl_feedvalu_cou_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite_ix` (`item`);

--
-- Indexes for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  ADD KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite2_ix` (`item`);

--
-- Indexes for table `mdl_files`
--
ALTER TABLE `mdl_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  ADD KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  ADD KEY `mdl_file_con_ix` (`contenthash`),
  ADD KEY `mdl_file_con2_ix` (`contextid`),
  ADD KEY `mdl_file_use_ix` (`userid`),
  ADD KEY `mdl_file_ref_ix` (`referencefileid`);

--
-- Indexes for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  ADD KEY `mdl_filerefe_rep_ix` (`repositoryid`);

--
-- Indexes for table `mdl_file_conversion`
--
ALTER TABLE `mdl_file_conversion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_fileconv_sou_ix` (`sourcefileid`),
  ADD KEY `mdl_fileconv_des_ix` (`destfileid`);

--
-- Indexes for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  ADD KEY `mdl_filtacti_con_ix` (`contextid`);

--
-- Indexes for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  ADD KEY `mdl_filtconf_con_ix` (`contextid`);

--
-- Indexes for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_fold_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foru_cou_ix` (`course`);

--
-- Indexes for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  ADD KEY `mdl_forudige_use_ix` (`userid`),
  ADD KEY `mdl_forudige_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forudisc_use_ix` (`userid`),
  ADD KEY `mdl_forudisc_cou_ix` (`course`),
  ADD KEY `mdl_forudisc_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_discussion_subs`
--
ALTER TABLE `mdl_forum_discussion_subs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  ADD KEY `mdl_forudiscsubs_for_ix` (`forum`),
  ADD KEY `mdl_forudiscsubs_use_ix` (`userid`),
  ADD KEY `mdl_forudiscsubs_dis_ix` (`discussion`);

--
-- Indexes for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forupost_use_ix` (`userid`),
  ADD KEY `mdl_forupost_cre_ix` (`created`),
  ADD KEY `mdl_forupost_mai_ix` (`mailed`),
  ADD KEY `mdl_forupost_dis_ix` (`discussion`),
  ADD KEY `mdl_forupost_par_ix` (`parent`);

--
-- Indexes for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruqueu_use_ix` (`userid`),
  ADD KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  ADD KEY `mdl_foruqueu_pos_ix` (`postid`);

--
-- Indexes for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  ADD KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  ADD KEY `mdl_foruread_posuse_ix` (`postid`,`userid`);

--
-- Indexes for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forusubs_usefor_uix` (`userid`,`forum`),
  ADD KEY `mdl_forusubs_use_ix` (`userid`),
  ADD KEY `mdl_forusubs_for_ix` (`forum`);

--
-- Indexes for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`);

--
-- Indexes for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glos_cou_ix` (`course`);

--
-- Indexes for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosalia_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gloscate_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentr_use_ix` (`userid`),
  ADD KEY `mdl_glosentr_con_ix` (`concept`),
  ADD KEY `mdl_glosentr_glo_ix` (`glossaryid`);

--
-- Indexes for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  ADD KEY `mdl_glosentrcate_ent_ix` (`entryid`);

--
-- Indexes for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcate_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcate_par_ix` (`parent`);

--
-- Indexes for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcatehist_act_ix` (`action`),
  ADD KEY `mdl_gradcatehist_tim_ix` (`timemodified`),
  ADD KEY `mdl_gradcatehist_old_ix` (`oldid`),
  ADD KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcatehist_par_ix` (`parent`),
  ADD KEY `mdl_gradcatehist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  ADD KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_gradgrad_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgrad_use_ix` (`userid`),
  ADD KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgrad_use2_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradgradhist_act_ix` (`action`),
  ADD KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  ADD KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  ADD KEY `mdl_gradgradhist_old_ix` (`oldid`),
  ADD KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgradhist_use_ix` (`userid`),
  ADD KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  ADD KEY `mdl_gradgradhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimponewi_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  ADD KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  ADD KEY `mdl_gradimpovalu_imp_ix` (`importer`);

--
-- Indexes for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  ADD KEY `mdl_graditem_gra_ix` (`gradetype`),
  ADD KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  ADD KEY `mdl_graditem_cou_ix` (`courseid`),
  ADD KEY `mdl_graditem_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditem_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditem_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditemhist_act_ix` (`action`),
  ADD KEY `mdl_graditemhist_tim_ix` (`timemodified`),
  ADD KEY `mdl_graditemhist_old_ix` (`oldid`),
  ADD KEY `mdl_graditemhist_cou_ix` (`courseid`),
  ADD KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  ADD KEY `mdl_graditemhist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`);

--
-- Indexes for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  ADD KEY `mdl_gradoutc_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutc_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  ADD KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutccour_out_ix` (`outcomeid`);

--
-- Indexes for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradoutchist_act_ix` (`action`),
  ADD KEY `mdl_gradoutchist_tim_ix` (`timemodified`),
  ADD KEY `mdl_gradoutchist_old_ix` (`oldid`),
  ADD KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutchist_log_ix` (`loggeduser`);

--
-- Indexes for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  ADD KEY `mdl_gradsett_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcomm_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradguidfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrcrit_def_ix` (`definitionid`);

--
-- Indexes for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  ADD KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradrubrfill_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrleve_cri_ix` (`criterionid`);

--
-- Indexes for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  ADD KEY `mdl_gradarea_con_ix` (`contextid`);

--
-- Indexes for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  ADD KEY `mdl_graddefi_are_ix` (`areaid`),
  ADD KEY `mdl_graddefi_use_ix` (`usermodified`),
  ADD KEY `mdl_graddefi_use2_ix` (`usercreated`);

--
-- Indexes for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradinst_def_ix` (`definitionid`),
  ADD KEY `mdl_gradinst_rat_ix` (`raterid`);

--
-- Indexes for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn2_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou2_ix` (`courseid`);

--
-- Indexes for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grougrou_gro_ix` (`groupingid`),
  ADD KEY `mdl_grougrou_gro2_ix` (`groupid`);

--
-- Indexes for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou_ix` (`courseid`);

--
-- Indexes for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_groumemb_gro_ix` (`groupid`),
  ADD KEY `mdl_groumemb_use_ix` (`userid`);

--
-- Indexes for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_imsc_cou_ix` (`course`);

--
-- Indexes for table `mdl_label`
--
ALTER TABLE `mdl_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_labe_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_less_cou_ix` (`course`);

--
-- Indexes for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessansw_les_ix` (`lessonid`),
  ADD KEY `mdl_lessansw_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessatte_use_ix` (`userid`),
  ADD KEY `mdl_lessatte_les_ix` (`lessonid`),
  ADD KEY `mdl_lessatte_pag_ix` (`pageid`),
  ADD KEY `mdl_lessatte_ans_ix` (`answerid`);

--
-- Indexes for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessbran_use_ix` (`userid`),
  ADD KEY `mdl_lessbran_les_ix` (`lessonid`),
  ADD KEY `mdl_lessbran_pag_ix` (`pageid`);

--
-- Indexes for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessgrad_use_ix` (`userid`),
  ADD KEY `mdl_lessgrad_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_overrides`
--
ALTER TABLE `mdl_lesson_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessover_les_ix` (`lessonid`),
  ADD KEY `mdl_lessover_gro_ix` (`groupid`),
  ADD KEY `mdl_lessover_use_ix` (`userid`);

--
-- Indexes for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesspage_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesstime_use_ix` (`userid`),
  ADD KEY `mdl_lesstime_les_ix` (`lessonid`);

--
-- Indexes for table `mdl_license`
--
ALTER TABLE `mdl_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  ADD KEY `mdl_lockdb_exp_ix` (`expires`),
  ADD KEY `mdl_lockdb_own_ix` (`owner`);

--
-- Indexes for table `mdl_log`
--
ALTER TABLE `mdl_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  ADD KEY `mdl_log_tim_ix` (`time`),
  ADD KEY `mdl_log_act_ix` (`action`),
  ADD KEY `mdl_log_usecou_ix` (`userid`,`course`),
  ADD KEY `mdl_log_cmi_ix` (`cmid`);

--
-- Indexes for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  ADD KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  ADD KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  ADD KEY `mdl_logsstanlog_con_ix` (`contextid`);

--
-- Indexes for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`);

--
-- Indexes for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lti_cou_ix` (`course`);

--
-- Indexes for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltisubm_lti_ix` (`ltiid`);

--
-- Indexes for table `mdl_lti_tool_proxies`
--
ALTER TABLE `mdl_lti_tool_proxies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`);

--
-- Indexes for table `mdl_lti_tool_settings`
--
ALTER TABLE `mdl_lti_tool_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  ADD KEY `mdl_ltitoolsett_cou_ix` (`course`),
  ADD KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`);

--
-- Indexes for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitype_cou_ix` (`course`),
  ADD KEY `mdl_ltitype_too_ix` (`tooldomain`);

--
-- Indexes for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitypeconf_typ_ix` (`typeid`);

--
-- Indexes for table `mdl_message`
--
ALTER TABLE `mdl_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  ADD KEY `mdl_mess_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  ADD KEY `mdl_mess_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`);

--
-- Indexes for table `mdl_messageinbound_datakeys`
--
ALTER TABLE `mdl_messageinbound_datakeys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  ADD KEY `mdl_messdata_han_ix` (`handler`);

--
-- Indexes for table `mdl_messageinbound_handlers`
--
ALTER TABLE `mdl_messageinbound_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messhand_cla_uix` (`classname`);

--
-- Indexes for table `mdl_messageinbound_messagelist`
--
ALTER TABLE `mdl_messageinbound_messagelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messmess_use_ix` (`userid`);

--
-- Indexes for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`);

--
-- Indexes for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`);

--
-- Indexes for table `mdl_message_popup`
--
ALTER TABLE `mdl_message_popup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messpopu_mesisr_uix` (`messageid`,`isread`),
  ADD KEY `mdl_messpopu_isr_ix` (`isread`);

--
-- Indexes for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`);

--
-- Indexes for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  ADD KEY `mdl_messread_nottim_ix` (`notification`,`timeread`),
  ADD KEY `mdl_messread_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  ADD KEY `mdl_messread_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`);

--
-- Indexes for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messwork_unr_ix` (`unreadmessageid`);

--
-- Indexes for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`);

--
-- Indexes for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetenroenro_use_ix` (`userid`),
  ADD KEY `mdl_mnetenroenro_hos_ix` (`hostid`);

--
-- Indexes for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnethost_app_ix` (`applicationid`);

--
-- Indexes for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`);

--
-- Indexes for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`);

--
-- Indexes for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indexes for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`);

--
-- Indexes for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`);

--
-- Indexes for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_modu_nam_ix` (`name`);

--
-- Indexes for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mypage_usepri_ix` (`userid`,`private`);

--
-- Indexes for table `mdl_oauth2_endpoint`
--
ALTER TABLE `mdl_oauth2_endpoint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_oautendp_iss_ix` (`issuerid`);

--
-- Indexes for table `mdl_oauth2_issuer`
--
ALTER TABLE `mdl_oauth2_issuer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_oauth2_system_account`
--
ALTER TABLE `mdl_oauth2_system_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautsystacco_iss_uix` (`issuerid`);

--
-- Indexes for table `mdl_oauth2_user_field_mapping`
--
ALTER TABLE `mdl_oauth2_user_field_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_oautuserfielmapp_issin_uix` (`issuerid`,`internalfield`),
  ADD KEY `mdl_oautuserfielmapp_iss_ix` (`issuerid`);

--
-- Indexes for table `mdl_page`
--
ALTER TABLE `mdl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_page_cou_ix` (`course`);

--
-- Indexes for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstconf_nam_ix` (`name`),
  ADD KEY `mdl_portinstconf_ins_ix` (`instance`);

--
-- Indexes for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstuser_ins_ix` (`instance`),
  ADD KEY `mdl_portinstuser_use_ix` (`userid`);

--
-- Indexes for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portlog_use_ix` (`userid`),
  ADD KEY `mdl_portlog_por_ix` (`portfolio`);

--
-- Indexes for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portmahaqueu_tok_ix` (`token`),
  ADD KEY `mdl_portmahaqueu_tra_ix` (`transferid`);

--
-- Indexes for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_porttemp_use_ix` (`userid`),
  ADD KEY `mdl_porttemp_ins_ix` (`instance`);

--
-- Indexes for table `mdl_post`
--
ALTER TABLE `mdl_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  ADD KEY `mdl_post_las_ix` (`lastmodified`),
  ADD KEY `mdl_post_mod_ix` (`module`),
  ADD KEY `mdl_post_sub_ix` (`subject`),
  ADD KEY `mdl_post_use_ix` (`usermodified`);

--
-- Indexes for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  ADD KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  ADD KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`);

--
-- Indexes for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddim_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddimdrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddma_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrag_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypddmadrop_que_ix` (`questionid`);

--
-- Indexes for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`);

--
-- Indexes for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypmatcsubq_que_ix` (`questionid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mdl_analytics_indicator_calc`
--
ALTER TABLE `mdl_analytics_indicator_calc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_models`
--
ALTER TABLE `mdl_analytics_models`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_analytics_models_log`
--
ALTER TABLE `mdl_analytics_models_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_predictions`
--
ALTER TABLE `mdl_analytics_predictions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_prediction_actions`
--
ALTER TABLE `mdl_analytics_prediction_actions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_predict_samples`
--
ALTER TABLE `mdl_analytics_predict_samples`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_train_samples`
--
ALTER TABLE `mdl_analytics_train_samples`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_used_analysables`
--
ALTER TABLE `mdl_analytics_used_analysables`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_analytics_used_files`
--
ALTER TABLE `mdl_analytics_used_files`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign`
--
ALTER TABLE `mdl_assign`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_queue`
--
ALTER TABLE `mdl_assignfeedback_editpdf_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignment_upgrade`
--
ALTER TABLE `mdl_assignment_upgrade`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_overrides`
--
ALTER TABLE `mdl_assign_overrides`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_auth_oauth2_linked_login`
--
ALTER TABLE `mdl_auth_oauth2_linked_login`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge`
--
ALTER TABLE `mdl_badge`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block`
--
ALTER TABLE `mdl_block`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_recent_activity`
--
ALTER TABLE `mdl_block_recent_activity`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book`
--
ALTER TABLE `mdl_book`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;
--
-- AUTO_INCREMENT for table `mdl_chat`
--
ALTER TABLE `mdl_chat`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice`
--
ALTER TABLE `mdl_choice`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_comments`
--
ALTER TABLE `mdl_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency`
--
ALTER TABLE `mdl_competency`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_coursecomp`
--
ALTER TABLE `mdl_competency_coursecomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_coursecompsetting`
--
ALTER TABLE `mdl_competency_coursecompsetting`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_evidence`
--
ALTER TABLE `mdl_competency_evidence`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_framework`
--
ALTER TABLE `mdl_competency_framework`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_modulecomp`
--
ALTER TABLE `mdl_competency_modulecomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_plan`
--
ALTER TABLE `mdl_competency_plan`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_plancomp`
--
ALTER TABLE `mdl_competency_plancomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_relatedcomp`
--
ALTER TABLE `mdl_competency_relatedcomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_template`
--
ALTER TABLE `mdl_competency_template`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_templatecohort`
--
ALTER TABLE `mdl_competency_templatecohort`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_templatecomp`
--
ALTER TABLE `mdl_competency_templatecomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_usercomp`
--
ALTER TABLE `mdl_competency_usercomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_usercompcourse`
--
ALTER TABLE `mdl_competency_usercompcourse`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_usercompplan`
--
ALTER TABLE `mdl_competency_usercompplan`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_userevidence`
--
ALTER TABLE `mdl_competency_userevidence`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_competency_userevidencecomp`
--
ALTER TABLE `mdl_competency_userevidencecomp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_config`
--
ALTER TABLE `mdl_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=464;
--
-- AUTO_INCREMENT for table `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1475;
--
-- AUTO_INCREMENT for table `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1732;
--
-- AUTO_INCREMENT for table `mdl_context`
--
ALTER TABLE `mdl_context`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `mdl_course`
--
ALTER TABLE `mdl_course`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_completion_defaults`
--
ALTER TABLE `mdl_course_completion_defaults`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data`
--
ALTER TABLE `mdl_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_editor_atto_autosave`
--
ALTER TABLE `mdl_editor_atto_autosave`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_consumer`
--
ALTER TABLE `mdl_enrol_lti_lti2_consumer`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_context`
--
ALTER TABLE `mdl_enrol_lti_lti2_context`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_nonce`
--
ALTER TABLE `mdl_enrol_lti_lti2_nonce`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_resource_link`
--
ALTER TABLE `mdl_enrol_lti_lti2_resource_link`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_share_key`
--
ALTER TABLE `mdl_enrol_lti_lti2_share_key`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_tool_proxy`
--
ALTER TABLE `mdl_enrol_lti_lti2_tool_proxy`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_lti2_user_result`
--
ALTER TABLE `mdl_enrol_lti_lti2_user_result`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_tools`
--
ALTER TABLE `mdl_enrol_lti_tools`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_tool_consumer_map`
--
ALTER TABLE `mdl_enrol_lti_tool_consumer_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_lti_users`
--
ALTER TABLE `mdl_enrol_lti_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event`
--
ALTER TABLE `mdl_event`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;
--
-- AUTO_INCREMENT for table `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;
--
-- AUTO_INCREMENT for table `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_files`
--
ALTER TABLE `mdl_files`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_file_conversion`
--
ALTER TABLE `mdl_file_conversion`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_folder`
--
ALTER TABLE `mdl_folder`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum`
--
ALTER TABLE `mdl_forum`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_discussion_subs`
--
ALTER TABLE `mdl_forum_discussion_subs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups`
--
ALTER TABLE `mdl_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_label`
--
ALTER TABLE `mdl_label`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_overrides`
--
ALTER TABLE `mdl_lesson_overrides`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_license`
--
ALTER TABLE `mdl_license`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `mdl_lock_db`
--
ALTER TABLE `mdl_lock_db`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_log`
--
ALTER TABLE `mdl_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_logstore_standard_log`
--
ALTER TABLE `mdl_logstore_standard_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;
--
-- AUTO_INCREMENT for table `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti`
--
ALTER TABLE `mdl_lti`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_tool_proxies`
--
ALTER TABLE `mdl_lti_tool_proxies`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_tool_settings`
--
ALTER TABLE `mdl_lti_tool_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message`
--
ALTER TABLE `mdl_message`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_datakeys`
--
ALTER TABLE `mdl_messageinbound_datakeys`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_handlers`
--
ALTER TABLE `mdl_messageinbound_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mdl_messageinbound_messagelist`
--
ALTER TABLE `mdl_messageinbound_messagelist`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_airnotifier_devices`
--
ALTER TABLE `mdl_message_airnotifier_devices`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_popup`
--
ALTER TABLE `mdl_message_popup`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_modules`
--
ALTER TABLE `mdl_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mdl_oauth2_endpoint`
--
ALTER TABLE `mdl_oauth2_endpoint`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_oauth2_issuer`
--
ALTER TABLE `mdl_oauth2_issuer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_oauth2_system_account`
--
ALTER TABLE `mdl_oauth2_system_account`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_oauth2_user_field_mapping`
--
ALTER TABLE `mdl_oauth2_user_field_mapping`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_page`
--
ALTER TABLE `mdl_page`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_post`
--
ALTER TABLE `mdl_post`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext`
--
ALTER TABLE `mdl_qtype_ddimageortext`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drags`
--
ALTER TABLE `mdl_qtype_ddimageortext_drags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddimageortext_drops`
--
ALTER TABLE `mdl_qtype_ddimageortext_drops`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker`
--
ALTER TABLE `mdl_qtype_ddmarker`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drags`
--
ALTER TABLE `mdl_qtype_ddmarker_drags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_ddmarker_drops`
--
ALTER TABLE `mdl_qtype_ddmarker_drops`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
