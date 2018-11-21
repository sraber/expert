-- include.lua    Rev 8     11/9/2018

vds_core_name ='Standard Lib'
vds_core_id = '23C66D33-CC90-43A3-827A-EE0F983DE649'
vds_core_version ='1.0.2'

-- Warning level 
-- 0 - Nada, niente, rien, nothing, no warnings
-- 1 - All warnings except for: forcing orders, attribute tags, or missing data
-- 2 - All warnings except for: missing data
-- 3 - All warnings
g_warning_level = 3

-- turns off all unnessecary printing to increase processing speed.
g_debugprinting= true

-- Turns off normalization so data is processed at dataset speeds (manual or ea values)
-- Note: normalize0 can be passed into initialize_data to turn off normalization as well.
--       initialize_data( normalize0 )
g_normalize=true

-- This will be set to a table of resulting faults detected by
-- the fault rule base.
-- It is initialized in do_fault_analysis
g_faults = nil

-- This will be set to a table of resulting recommendations detected by
-- the recommendation rule base.
-- It is initialized in do_rec_analysis
g_recs = nil

g_infer_solution = nil
g_infer_output = nil
g_infer_rules_passed = nil
g_infer_rules_failed = nil
g_infer_rules_warn = nil
g_rule_map = nil
g_rule_map_order = 0

g_comp_speed_ratio = nil

-- This value will be set by the infer function and refered to
-- by assert1(), assert2(), assert3(), fault_exists(), and other
-- functions having to do with searching or testing the fault or
-- recommendation tables.
g_faults_or_recs = nil

g_shaft_store = nil

g_rule_guid = nil
g_rule_name = nil
g_shaft   = nil
g_shaft_number = nil
g_fault   = nil
g_fault_name = nil
g_prime   = nil
g_ort     = nil
g_conf    = nil
g_priority= nil

-- This value is set each time a rule is processed.
g_unit_id = nil

g_super_shaft_number = nil

-- This number defines loosely the number of distinct regions
-- in the spectrum we'd like to preserve.  It is used to
-- determine the span of the moving average that is applied to the
-- signal to prepare for peak extraction.
-- NOTE: The size of the window for the moving average is hardcoded to 32.
-- g_character_sections = 25

-- This is the unit that the internal system keeps the data in.
-- During initialization input data units will be transformed to this
-- unit.  Peak extraction and spline fitting is done in this unit.
g_internal_unit = Unit.U_CM_SEC

-- Peaks with amplitude smaller than this value will be removed from the 
-- peak list.  The number should be specified in the internal unit (g_internal_unit)
-- specified above.
g_peak_threshold = 0.000316-- .0001 cm/s = 40VdB, .000316 cm/s = 50 VdB , 001 cm/s = 60 VdB

-- High pass filter stop band threshold.
-- This value is used to detect where the pass band starts and is used to avoid
-- picking out peaks that are in the stop band.
g_stop_band_threshold = 1E-7

-- Specifies the range (+-) in percent of a peak target position in orders.
-- It means the code will call a peak found within the range the target order.  This
-- target position may be converted to bins and the range in bins will vary based on
-- bin width and shaft speed.  The range is used to search for a peak
-- when looking for a match to a forcing order.
g_peak_margin = 5.0 

-- Specifies the multiplier that produces a search range (+-) in bins.  We often
-- need to convert from Orders to Bin and that is based on a value for shaft speed
-- that my be slightly off.  We need to allow for some tollerance in the conversion
-- and this parameter allows us to control that.
g_bin_margin = 2.5

-- Specify the search range in percent (+-) for line frequency when peak matching.
g_linef_margin = 1.0

-- Specifies the amount to multiply standard deviation before adding to mean.
-- This is a way to control what is called a signifigant peak, the higher the value
-- the higher the threshold for a peak to be considered.
g_std_multiply =0

-- Specifies the amount to multiply mean.
-- This is another way to control what is called a signifigant peak, the higher the value
-- the higher the threshold for a peak to be considered.
g_mean_multiply = 2

-- REVIEW: Need to research why this is here.  Is this a working array for
--         the peak_list code?
g_peak_list ={} -- The composite peak list

-- REVIEW: Still needed?
g_peak_list_xml=""  

g_peak_group_threshold = 24  -- threshold for flagging harmonic and sideband severity

---
-- Rulebase Functions Globals
--
g_fault_tones= {} -- The place the tones that caused rules to fire are stored

g_fault_tones_xml="" 

g_fault_tone_threshold = 10 -- any tone over with dif  greater than this is added to fault severity and the fault tone list no matter the amplitude

g_significance_threshold = 70 -- amplitiude theshold for low dif (>3)peaks
