-- include.lua    Rev 7     11/2/2018

require 'units'
require 'categories'
require 'error'
require 'globals'
require 'filter'
require 'normalize'
require 'shaft'
require 'functions'
require 'quality'
require 'spline'
require 'test'
require 'infer'
require 'extract'
--require 'luatoxml'
require 'peak_list'

require 'rulebase_functions'
require 'rec_rulebase_functions'
require 'rulebase'
require 'rec_rulebase'
--require 'testing_rulebase2'

load_fault_rules( get_fault_rules() )
load_rec_rules( get_rec_rules() ) 
