-- include.lua    Rev 6     7/20/2018

require 'units'
require 'error'
require 'globals'
require 'filter'
require 'categories'
require 'normalize'
require 'shaft'
require 'quality'
require 'functions'
require 'spline'
require 'test'
require 'infer'
require 'extract'
require 'luatoxml'
require 'peak_list'

require 'rulebase_functions'
require 'rec_rulebase_functions'
require 'rulebase'
require 'rec_rulebase'
require 'rulebasefaultrecnames'

load_fault_rules( get_fault_rules() )
load_rec_rules( get_rec_rules() ) 
