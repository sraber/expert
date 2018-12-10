-- Created Date: 11/28/2018 3:37:34 PM
function load_rec_rules(g_rec_rules)
g_datanormalizationerrorguid='4d535592-5633-4a3d-92e5-c9ac0453294f'
-- **************************************
-- BEARING-FLUID-FILM
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-11',nmfault='BEARING FIT PROBLEM',guid='4f161dc7-7dee-4640-b9a7-ec4672220917',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-14',nmfault='BEARING JOURNAL OIL WHIRL',guid='5e6a4836-7434-43ff-8040-e520d12d5c3a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-17',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='1495b277-8de5-40cc-90ba-8843d83fcecf',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-20',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='5a65545d-818f-4756-9df1-9363afa985d5',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-23',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='2eed1d84-e0fb-4364-a2ef-dad055c5119e',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-RADIAL-THRUST
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-29',nmfault='BEARING FIT PROBLEM',guid='b7359e6d-630d-4911-94c2-61dad93d4c4e',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-32',nmfault='BEARING JOURNAL OIL WHIRL',guid='dd68d3d3-0d56-43ee-8dc9-0da4ebdd611a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-35',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='fff0cfef-61dd-4917-b023-a0478dd97013',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-38',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='300aca6d-9d92-442f-9457-945213e4e419',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-41',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='db8f1fc2-806d-48f8-b7d2-a01f7536cb26',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-THRUST
---- BEARING JOURNAL OIL WHIRL
table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-47',nmfault='BEARING JOURNAL OIL WHIRL',guid='7ffc7e53-bb1b-40ff-8519-8c8a02d9b968',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-50',nmfault='BEARING THRUST PROBLEM',guid='573c21dc-5a30-44e0-b53b-7b2ca35ea029',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-53',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='7e358750-0732-418f-a4a9-7e43965170bd',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-56',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='a75472bb-3b5d-49e1-8ee0-84ff5b968cab',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-59',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='bc765917-bace-4b58-b3f9-25fca1f14118',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-65',nmfault='BEARING MISALIGNMENT',guid='3ddc087a-304a-4e7d-86d3-df3f4e1792b6',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-68',nmfault='BEARING WEAR',guid='b95e0138-8bc2-412e-b20b-80d01c8a4770',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-71',nmfault='BEARING WEAR OR FLOW NOISE',guid='149dddda-4ac6-46ff-a586-74309d57aa99',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-74',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='90b74dd2-1d70-4468-a113-85a140d62aca',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-77',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='5ddd3e6f-4329-4b73-b9d6-f220bce81b07',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-80',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='4c7f2861-8a67-4ffe-bba6-5cc6fec1a338',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-86',nmfault='BEARING MISALIGNMENT',guid='9c18aa0d-8b25-42ed-a189-147b53483ec9',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-89',nmfault='BEARING WEAR',guid='39fe17b2-9d45-4689-8986-241c73115887',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-92',nmfault='BEARING WEAR OR FLOW NOISE',guid='3df6ee09-59fc-4f48-ace0-3d629b528a2c',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-95',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='769b55a6-4394-4fc6-b6c5-05e27c7527a3',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-98',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='13d49e56-943e-4437-a1a5-002a9bcf50dd',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-101',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='fc500df0-1e41-4854-a4fa-32055ceab58d',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-107',nmfault='BEARING MISALIGNMENT',guid='a6f6d562-208a-4949-b185-8393cae14f0c',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-110',nmfault='BEARING WEAR',guid='8c598591-2940-4e3e-a5a8-1d0d69550ae9',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-113',nmfault='BEARING WEAR OR FLOW NOISE',guid='5337b4cd-f6ac-48c6-8bf9-0b59ec51fe1b',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-116',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='b3da90f5-d670-474c-9d3b-b5cf4483fb36',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-119',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='670b057c-4db1-4df1-944a-bb754f540401',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-122',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='19d47dca-cbfd-4b93-a537-f9d4017fd762',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-128',nmfault='BEARING MISALIGNMENT',guid='be171378-d565-44ef-8d22-8b152b0c8b83',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-131',nmfault='BEARING WEAR',guid='8687cc72-a6bf-4f91-9266-e44a120dfb50',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-134',nmfault='BEARING WEAR OR FLOW NOISE',guid='36af5026-d766-4d24-827f-1fe603487c41',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-137',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c0f9f4e2-ff3a-4fb0-8585-e10ddac9fcd0',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-140',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='22b5a0de-4046-42ac-964c-918fb1b05dc2',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-143',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='47d9fa6a-0547-4ec4-8d1b-4d93ca41cd61',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CL-GR
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-149',nmfault='IMBALANCE',guid='444cdbef-59fd-424d-a2c1-9b9ca34a1449',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-152',nmfault='LOOSENESS',guid='843bebaf-82a6-4e1e-be30-27f59a067fb2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-155',nmfault='MASTER ISSUE BEARINGS',guid='71e81d15-4a66-44f5-b98a-4e74c5e9fdf1',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-158',nmfault='MASTER ISSUE BEARINGS',guid='df744903-2224-40c7-8303-58f60be50939',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-161',nmfault='MASTER ISSUE COMPONENT',guid='3b810776-dfb2-4620-a01b-3fe1bc1d758c',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-164',nmfault='MASTER ISSUE COMPONENT',guid='f0158fb8-d6bf-450c-891e-eb70f2959a60',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-167',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2d9ce504-d1b4-4576-8c6e-0ad0b1824195',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-170',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8019b59e-e936-4ea5-99b3-9353602c359b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-173',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='149b1157-e060-4867-a5ef-82b79c8ce4e5',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-176',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='682ce1b7-efb3-47fa-b281-0c3b4e205921',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-179',nmfault='REPAIR/REPLACE',guid='86ce34cc-7227-43a5-b6b9-bbd4f31f3370',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-182',nmfault='REPAIR/REPLACE',guid='a3856753-5da1-47da-bdf2-816d184b4167',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-185',nmfault='REPAIR/REPLACE UNIT',guid='c89b7b7f-262e-4db9-8a67-12a94096be9f',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-188',nmfault='REPAIR/REPLACE UNIT',guid='77e0fe0a-34f4-4d0f-a2dc-ec7caf723caa',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-191',nmfault='REPLACE BEARINGS',guid='ce1a56e7-df52-48de-bdea-3c44abded109',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-194',nmfault='REPLACE BEARINGS',guid='909ee01f-0bec-4a6b-ba31-a938d668cd07',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CPLGFLEX-CL-BRG-BRG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-200',nmfault='ANGULAR MISALIGNMENT',guid='e8278824-b07e-4065-b1a6-d69adf4faffe',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-203',nmfault='IMBALANCE',guid='7199f4e7-1c9d-43b7-8963-943528ed16b9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-206',nmfault='MASTER ISSUE BEARINGS',guid='889055d8-8aa9-47c3-bb8b-d93f925c176e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-209',nmfault='MASTER ISSUE BEARINGS',guid='45181cc4-cf0b-4ab9-9c28-2bc34f1cb010',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-212',nmfault='MASTER ISSUE COMPONENT',guid='7740f042-9f04-49a1-bc80-4756eef11a91',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-215',nmfault='MASTER ISSUE COMPONENT',guid='8456f600-40b1-4a9c-8fb6-f46d39d4294e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-218',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='67df1d39-cf9b-4c5b-967f-a6df72f9365b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-221',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='51003b3e-b6f7-4ad7-b8a6-8a9ee66e45ab',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-224',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d8808366-2e76-4217-9000-4ca5339559ca',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-227',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7e4a90ba-3b9e-42c7-bbd6-c1ca2b4a33fe',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-230',nmfault='PARALLEL MISALIGNMENT',guid='6a5b5d89-d160-4c1e-8460-aaa6acd0198b',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-233',nmfault='REPAIR/REPLACE',guid='3f2875af-1c6f-4e85-adbc-3db7c32e9aaa',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-236',nmfault='REPAIR/REPLACE',guid='c11281a0-9867-4d67-8073-0050edb6db63',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-239',nmfault='REPAIR/REPLACE UNIT',guid='57d620ca-7e86-4f42-b820-b205e8eb5022',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-242',nmfault='REPAIR/REPLACE UNIT',guid='83a82fd6-2e51-4e0b-9fd3-f5ae96dc4b20',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-245',nmfault='REPLACE BEARINGS',guid='fc518bbe-93ba-436a-bd15-f67f285b13c0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-248',nmfault='REPLACE BEARINGS',guid='8df470b6-ec6c-4059-87ce-ebe38e73d4ab',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-BRG-CPRSRVNS-CPRSRSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-254',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3d8b7744-0172-4a2f-8f92-1b74d6b30b6c',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-257',nmfault='IMBALANCE',guid='ed1a81ce-5bb9-4bb8-bc83-2dd3ee7c6083',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-260',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='da187920-67b1-459d-b070-bebe685e74e2',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-263',nmfault='LOOSENESS',guid='103a00a6-ce21-4203-bf25-8710f5c61d0c',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-266',nmfault='MASTER ISSUE BEARINGS',guid='daaae82b-11a6-430d-947d-133e7b2a1285',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-269',nmfault='MASTER ISSUE BEARINGS',guid='6267c6be-8ebf-463b-9481-575c6abaa54f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-272',nmfault='MASTER ISSUE COMPONENT',guid='f9f804ec-865f-44c0-9f6c-6a4e18cc5112',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-275',nmfault='MASTER ISSUE COMPONENT',guid='c5c11ce5-dd10-4e48-81fd-810a455c56c1',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-278',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6df373fd-83b5-467b-a85b-ad393a7974a7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-281',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b82d2c64-a00b-48f0-b65a-8a7f9d4e205f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-284',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b3b8bdad-60b5-486d-9e39-4a1f74282c0e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-287',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='258a43e7-805e-46d8-bb24-1bfcbaf13791',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-290',nmfault='REPAIR/REPLACE',guid='aaba9923-82ac-497e-8e26-5cd046105f32',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-293',nmfault='REPAIR/REPLACE',guid='ffd90bcb-4feb-4c31-9bf9-5a7f88430454',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-296',nmfault='REPAIR/REPLACE UNIT',guid='6cac25e0-24e3-4644-a939-251861220e17',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-299',nmfault='REPAIR/REPLACE UNIT',guid='e1bf6749-13c7-4564-a2ef-8fb21411120d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-302',nmfault='REPLACE BEARINGS',guid='159730e8-d331-4cb3-8aca-027cef0a5d21',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-305',nmfault='REPLACE BEARINGS',guid='9b976a96-606f-4fa4-962f-3eb9bbf0b681',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-311',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='55641e73-a958-427e-ad3f-9eee7c5791b3',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-314',nmfault='IMBALANCE',guid='78133759-9e19-4744-96b6-baee54af259c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-317',nmfault='IMPELLER WEAR',guid='488f1b74-939d-46cd-a0a6-03f33394cb79',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-320',nmfault='LOOSENESS',guid='012cc6ee-cceb-4ee2-9508-645017fd7357',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-323',nmfault='MASTER ISSUE BEARINGS',guid='eed9eb8e-cc1e-488b-95f5-d225625fd164',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-326',nmfault='MASTER ISSUE BEARINGS',guid='a3eba381-4ed3-4265-bcbd-a9174625aca3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-329',nmfault='MASTER ISSUE COMPONENT',guid='494d0f31-4092-4e85-9dee-f022a48e14df',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-332',nmfault='MASTER ISSUE COMPONENT',guid='c86c45c6-2a0b-4a85-ada8-d88f6579c343',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-335',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a0c7ba27-d4f5-421f-892f-9afad0a15e5c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-338',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='401114c4-e3c9-4582-b0ac-ea0252b4f4a6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-341',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8cd2972f-026b-410a-a8a3-99ebe5a92b50',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-344',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ab99b3f4-a551-4ce6-9ef0-5a126228ac86',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-347',nmfault='REPAIR/REPLACE',guid='c3164f2a-a9b0-43c8-a0b9-c854773673b7',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-350',nmfault='REPAIR/REPLACE',guid='1833f1a6-d2fb-4afa-b579-912235391d8d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-353',nmfault='REPAIR/REPLACE UNIT',guid='8cdc0200-0088-4681-a5f6-a6d33e012348',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-356',nmfault='REPAIR/REPLACE UNIT',guid='000cba47-65b3-47a8-b8bf-a7d3aab644b7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-359',nmfault='REPLACE BEARINGS',guid='08ef24c9-7d19-4136-8003-655aef583257',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-362',nmfault='REPLACE BEARINGS',guid='1208f5de-c94b-4819-8cb4-4f38a0e4aae8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR-CPRSRSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-368',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8f639c2-1c8b-4af3-80b4-d177252cabd2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-371',nmfault='IMBALANCE',guid='67d86db1-a682-4008-b4b1-2a51246706a0',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-374',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='2aa3823c-d56d-4557-a4de-9b0296674dee',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-377',nmfault='LOOSENESS',guid='8d1dcffc-85c6-4b85-a24b-b9ebfb166b11',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-380',nmfault='MASTER ISSUE BEARINGS',guid='f8e71157-b531-4778-8565-23d47bdccd5c',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-383',nmfault='MASTER ISSUE BEARINGS',guid='25ecc3b9-bbe4-4322-a753-5cea2a9e63b7',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-386',nmfault='MASTER ISSUE COMPONENT',guid='111c3137-2431-4c21-99a1-01dd29122309',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-389',nmfault='MASTER ISSUE COMPONENT',guid='89a5ca1a-239e-410e-a36e-78275f0abe19',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-392',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cd6c6dee-77a8-4637-8876-a1359ef01b0f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-395',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cb2ac0da-a578-44e8-97a6-599c46c7fae3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-398',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='68e36c43-ac69-4eb5-a4cb-e5f7734716b1',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-401',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fc0afce6-fd54-4727-81ac-42d5133efd91',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-404',nmfault='REPAIR/REPLACE',guid='ddac7b30-f3d8-4a8f-91cf-ab4d67504845',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-407',nmfault='REPAIR/REPLACE',guid='8962984e-8512-4d28-92eb-911c81cce438',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-410',nmfault='REPAIR/REPLACE UNIT',guid='fb21cf8d-63dc-46f4-a426-9cac1c21c808',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-413',nmfault='REPAIR/REPLACE UNIT',guid='77190f23-2ed8-4fcc-8669-aacc623b29db',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-416',nmfault='REPLACE BEARINGS',guid='576143a9-da89-4d65-b30f-a73d7331fb0d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-419',nmfault='REPLACE BEARINGS',guid='4dc7d147-d31b-44e8-993a-9d88870058e2',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-425',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='63392c64-bd7d-42a6-bbc1-80f89b5c377a',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-428',nmfault='LOOSENESS',guid='80c1d077-2108-4e48-bd2d-a0981a830fc5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-431',nmfault='MASTER ISSUE BEARINGS',guid='38d35e61-e30f-43bb-ba1c-89f4978a99f7',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-434',nmfault='MASTER ISSUE BEARINGS',guid='4aa6bd2f-f729-4ac5-a477-bd64c510a3cc',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-437',nmfault='MASTER ISSUE COMPONENT',guid='a84374f8-027c-463d-a45e-204842157b29',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-440',nmfault='MASTER ISSUE COMPONENT',guid='0ac608f2-3f55-4eac-8db6-c65a25a980ee',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-443',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d7afc3eb-df4d-4e79-bb59-561a0c3864d8',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-446',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a64ed077-bdad-45bd-a32d-e2131da9d034',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-449',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='933a73f1-9533-4559-a00b-f9de1eb31efe',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-452',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ae55db5c-8ebf-4998-bd91-718bdfdf5ddf',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-455',nmfault='PISTON PROBLEM OR INTERNAL WEAR',guid='8bc446e1-ae47-4ebf-9cc2-eec9094014c0',parfault=nil,fault='c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-458',nmfault='REPAIR/REPLACE',guid='56dbbba1-f6a7-4299-8574-da656275e2cc',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-461',nmfault='REPAIR/REPLACE',guid='110e866c-235d-4d0a-9634-cb290ebb1e91',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-464',nmfault='REPAIR/REPLACE UNIT',guid='b8bacb2b-e6fd-4622-b609-a52cc28e3809',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-467',nmfault='REPAIR/REPLACE UNIT',guid='e93f3974-f47c-4df3-993b-e4d7a40c7db6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-470',nmfault='REPLACE BEARINGS',guid='caa3e0d2-c92e-4a16-a4ff-09514de02195',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-473',nmfault='REPLACE BEARINGS',guid='edfdb6d1-818a-4e29-b92a-954d554bc2f7',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-GR-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-BRG-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-479',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='11b43300-713b-4630-8ea3-a2cc827e1ec9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-482',nmfault='IMBALANCE',guid='89cb4de0-3df7-4f7b-8a5a-5888fd841add',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-485',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='c9b6cdcd-c095-4fd6-a1e0-a6af1c7b278d',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-488',nmfault='LOOSENESS',guid='2b4316bf-1330-45a7-ab8c-d66c6990957e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-491',nmfault='MASTER ISSUE BEARINGS',guid='4685a07f-0e26-466a-9062-b8cbf367dea6',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-494',nmfault='MASTER ISSUE BEARINGS',guid='9716cf7e-f221-427a-adf4-a9720ff8a44c',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-497',nmfault='MASTER ISSUE COMPONENT',guid='1e4afeac-9387-4df1-a7a3-4f9c7d755dc8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-500',nmfault='MASTER ISSUE COMPONENT',guid='40506e20-67cb-48d1-9a2f-727fcecd707a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-503',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='bd8dc464-adf4-4437-b600-3ab9c49b4eff',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-506',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d8365a3c-d6da-4e8b-b8a0-ffd9a4d0394d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-509',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2b8bd291-2b05-44e7-8885-6e7205bf5a80',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-512',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='acba8b90-ad27-4cf4-bf24-aa88d705a8ea',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-515',nmfault='REPAIR/REPLACE',guid='bf97e4a6-8a51-4396-b018-2b35e01cee7d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-518',nmfault='REPAIR/REPLACE',guid='ed10dfe0-2125-4d10-b4ff-12557f843590',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-521',nmfault='REPAIR/REPLACE UNIT',guid='3c793426-187d-48d6-800d-8791e3974f7d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-524',nmfault='REPAIR/REPLACE UNIT',guid='ae0fe3e8-0402-41dd-a95c-67f02d19139d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-527',nmfault='REPLACE BEARINGS',guid='110fe770-7816-4ebf-b44d-8fa22b7f9bb7',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-530',nmfault='REPLACE BEARINGS',guid='634ed020-9dd7-4f98-b41e-ed2e7d42e402',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-GR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-536',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1ee5d843-0960-44f4-a573-c7864c1bac22',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-539',nmfault='IMBALANCE',guid='1268b13c-1045-4240-bf10-b8d19b5913c1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-542',nmfault='IMPELLER WEAR',guid='affadf89-44e6-4935-b535-87adbb814e09',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-545',nmfault='LOOSENESS',guid='eeb2b505-87bf-4d64-97ab-65cfb3258a01',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-548',nmfault='MASTER ISSUE BEARINGS',guid='a2bb921d-725b-4ab0-aad9-710e4bc36b7b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-551',nmfault='MASTER ISSUE BEARINGS',guid='eb30fb65-eeba-485c-80d8-ae6e8d2be0f8',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-554',nmfault='MASTER ISSUE COMPONENT',guid='465afc3c-2c0f-4710-aa01-375248ed1e56',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-557',nmfault='MASTER ISSUE COMPONENT',guid='88bc3ce5-6cf2-470f-9306-c6f51ad24361',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-560',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c3ff0d3f-d9b6-4e4e-a4c3-36af0f3a39a3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-563',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='47e0acb0-f42c-4dca-83c5-be752925ecd6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-566',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fe957596-e2d5-4569-9b47-0302f506fcf9',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-569',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='520f2067-9f1b-49b6-93a0-2f029cedeec6',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-572',nmfault='REPAIR/REPLACE',guid='272f907e-6ef9-4615-8994-a7e6ede8e4c2',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-575',nmfault='REPAIR/REPLACE',guid='19e1bd5e-6e02-45d0-89e4-0aba24740bd5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-578',nmfault='REPAIR/REPLACE UNIT',guid='e570f1e2-8956-4205-9e8d-0a399f9725af',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-581',nmfault='REPAIR/REPLACE UNIT',guid='5c76844c-fbf9-46c1-95e0-14ece61b346a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-584',nmfault='REPLACE BEARINGS',guid='9822f110-c57e-410c-b525-0fe16f1905fe',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-587',nmfault='REPLACE BEARINGS',guid='b3271e4b-5ecc-4e3d-9f1f-7f2a166a358f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-593',nmfault='ANGULAR MISALIGNMENT',guid='7e346d1f-a6f1-4073-93ac-21569969d488',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-596',nmfault='COUPLING WEAR',guid='49f2b0c2-14d8-4660-a3aa-52a13bbefe7c',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-599',nmfault='IMBALANCE',guid='f0fdcb0b-3b6d-4b10-9196-a92eb5bfed9a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-602',nmfault='LOOSENESS',guid='55c4faeb-0f85-4db3-b487-e6ab91aee51e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-605',nmfault='MASTER ISSUE BEARINGS',guid='0c0acae3-6261-4117-a693-3f4453faf9ae',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-608',nmfault='MASTER ISSUE BEARINGS',guid='81d0eccc-3687-4d94-b109-cffdf1da2700',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-611',nmfault='MASTER ISSUE COMPONENT',guid='229b889a-d2d5-4a7d-97b7-a30d3df7ea39',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-614',nmfault='MASTER ISSUE COMPONENT',guid='a956bff8-6d2b-4b89-a9ac-4d70d9e666b1',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-617',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='00fd34bb-e108-46d7-8a44-1980c4a196d7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-620',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4e26db4f-2e29-4289-9210-ccf570e00731',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-623',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4ea8b591-6433-4adc-8c29-27579f3dcd11',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-626',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='f2535550-0d8f-44a7-ab47-7775b1b256db',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-629',nmfault='PARALLEL MISALIGNMENT',guid='f7cb3992-c161-4f72-b4f5-b6543bf05ea5',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-632',nmfault='REPAIR/REPLACE',guid='4ad6bf45-f39e-4059-bea3-4aa5e168a105',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-635',nmfault='REPAIR/REPLACE',guid='b2077ede-6649-43fc-9493-5d2ec06eb9cd',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-638',nmfault='REPAIR/REPLACE UNIT',guid='9fddc5dd-7580-4552-860b-5a1b6f218bd1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-641',nmfault='REPAIR/REPLACE UNIT',guid='741c4c66-bf79-4ae6-a1d8-ae2d8a0aee4d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-644',nmfault='REPLACE BEARINGS',guid='19cc4d51-51c6-4fca-8546-0a2b46cf08e1',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-647',nmfault='REPLACE BEARINGS',guid='9e558472-f846-4796-8aa1-7859fcb3324a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-653',nmfault='ANGULAR MISALIGNMENT',guid='35d37b51-2b81-4605-9d60-fe4db973f00c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-656',nmfault='COUPLING WEAR',guid='8bb98bd2-1b3e-4741-b0ce-89f76ce6a394',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-659',nmfault='IMBALANCE',guid='cce3536f-f11c-48d2-bfae-9150c027a897',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-662',nmfault='MASTER ISSUE BEARINGS',guid='68615f5a-b685-4c06-a429-b46da48af457',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-665',nmfault='MASTER ISSUE BEARINGS',guid='0d25a98e-acd0-4bbb-8c76-115fe47a13df',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-668',nmfault='MASTER ISSUE COMPONENT',guid='039f2d89-98d3-48c4-9e89-381724b6d320',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-671',nmfault='MASTER ISSUE COMPONENT',guid='d603ad28-58dc-4087-a531-bbd1ba290aa7',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-674',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='461d6798-b888-4d83-955a-f88258d7a523',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-677',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='420eee87-f68f-4508-8971-b9f59e1d5dc9',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-680',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5376baaa-7e23-4292-aa07-751a0ea91aa2',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-683',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='39446ae9-e13d-4acc-8dc8-fab40e0ff7ca',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-686',nmfault='PARALLEL MISALIGNMENT',guid='cb4d926d-8f4e-4483-9322-54771f52a99e',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-689',nmfault='REPAIR/REPLACE',guid='1b613b80-9b2a-4342-b283-e766f3b70948',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-692',nmfault='REPAIR/REPLACE',guid='e19d48ae-b06e-455c-b4e4-94b72f923afa',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-695',nmfault='REPAIR/REPLACE UNIT',guid='66e804b6-a881-45a8-831a-bf4d9de53470',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-698',nmfault='REPAIR/REPLACE UNIT',guid='5172257d-cd5f-47d9-9a10-3a8f8a43d52c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-701',nmfault='REPLACE BEARINGS',guid='fe05fce3-0eed-48aa-88e0-0ba5e8bcef1e',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-704',nmfault='REPLACE BEARINGS',guid='fcda9b47-efea-4f73-ab05-a1522ed71f1a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGMAG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-710',nmfault='ANGULAR MISALIGNMENT',guid='ca2c11a4-242f-49d1-8793-b3d417ad5708',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-713',nmfault='PARALLEL MISALIGNMENT',guid='372beb25-b639-443c-a14f-8e8e5ac62402',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-719',nmfault='ANGULAR MISALIGNMENT',guid='4bf65b6b-0dc8-4303-8edd-fcf14170cd1c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-722',nmfault='COUPLING ROLLING CONTACT BEARING WEAR',guid='1cddfa92-cd03-4ffd-bcfa-cfc87a3295be',parfault=nil,fault='58b56ba2-97ed-4304-b3b2-41f8c61fa6c5',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-725',nmfault='COUPLING WEAR',guid='d32674ed-be4c-4c49-bf96-a443a13b8e0a',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-728',nmfault='IMBALANCE',guid='d96d74a4-a10a-4fe6-942e-f576c6f78901',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-731',nmfault='MASTER ISSUE BEARINGS',guid='8080788d-4507-49bb-88af-251fb9b6913e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-734',nmfault='MASTER ISSUE BEARINGS',guid='2bb73a7a-74cc-4e8b-b37f-6ff975f62c12',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-737',nmfault='MASTER ISSUE COMPONENT',guid='d4740fe2-a160-40a1-a046-276ae63cdcde',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-740',nmfault='MASTER ISSUE COMPONENT',guid='f6fb6543-f301-4825-ace2-a5b69fef9332',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-743',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='dc9a8dbf-049a-4d66-8bc6-70d3cf534fc6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-746',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d0886654-1ecb-44c7-a973-03c8d318abf4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-749',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='24a3fa3d-9a3e-4497-b7cd-3d1b5c89f96b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-752',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c91d7d3a-8519-4a6a-88c0-f11586a92f16',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-755',nmfault='PARALLEL MISALIGNMENT',guid='741e4ff5-ebe0-4474-b179-aeabbd817e3d',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-758',nmfault='REPAIR/REPLACE',guid='d8221a31-6c2e-417e-8668-02dadb02d3d8',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-761',nmfault='REPAIR/REPLACE',guid='3d9fce81-2e21-4d6b-91bd-df6a4031bf7c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-764',nmfault='REPAIR/REPLACE UNIT',guid='239213fb-819f-4b93-8fbf-85901006a72c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-767',nmfault='REPAIR/REPLACE UNIT',guid='a0539c2c-3674-4e34-9234-9d114e9bade6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-770',nmfault='REPLACE BEARINGS',guid='be624dfe-42da-4a71-b784-3a2538b49e75',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-773',nmfault='REPLACE BEARINGS',guid='84f50c6a-5351-4ed2-8774-da343417e9f6',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-779',nmfault='ANGULAR MISALIGNMENT',guid='0299305e-31d1-46a1-9858-c188ad2cabbc',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-782',nmfault='COUPLING WEAR',guid='25da81dd-b81e-4a5f-9a16-65cee3d6ca2b',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-785',nmfault='IMBALANCE',guid='e279e877-5049-48e6-9c03-ec4d9d81a27f',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-788',nmfault='PARALLEL MISALIGNMENT',guid='9443959e-2a3a-4a3b-903f-f318051b3132',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-794',nmfault='ANGULAR MISALIGNMENT',guid='c76445e6-b371-4ef7-bd5a-53d34ad388af',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-797',nmfault='COUPLING WEAR',guid='f83dc2f7-def7-40b6-b92b-7742be9bf4e3',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-800',nmfault='IMBALANCE',guid='0e441296-4fef-4b7f-9673-773078f930bc',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-803',nmfault='PARALLEL MISALIGNMENT',guid='fdf23620-e3b6-405a-8366-283267804ff9',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- ENGINE-BRG-MOTPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-809',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fa336801-204d-48f4-9943-c6734567ddbd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-812',nmfault='IMBALANCE',guid='a7623820-352d-44f2-965f-b02b7bdde917',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-815',nmfault='LOOSENESS',guid='8092685c-b95a-4e55-89cc-3516d983dbb7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-818',nmfault='PISTON/VALVE PROBLEM',guid='cdb7650c-a881-4f80-9132-220d0ab3997a',parfault=nil,fault='f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANHTSLGR-FANVNS
---- FAN BLADING PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-824',nmfault='FAN BLADING PROBLEM',guid='9b9d0db4-46dd-426b-9be5-61b5c803dbbe',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-827',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f7ed4713-998e-4edd-abf1-248ddaff41a4',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-830',nmfault='IMBALANCE',guid='b2862ee4-7fb1-45e9-b798-007de40b282a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-833',nmfault='LOOSENESS',guid='1a884555-8e23-45fc-9307-9d1b92b82c70',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-836',nmfault='MASTER ISSUE BEARINGS',guid='6cbc323e-9bc0-4018-a3b6-4572bf80ebc4',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-839',nmfault='MASTER ISSUE BEARINGS',guid='6cc7869a-ab63-48ba-b309-be7638de69f8',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-842',nmfault='MASTER ISSUE COMPONENT',guid='54001244-6fdd-41aa-8842-032519f886cf',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-845',nmfault='MASTER ISSUE COMPONENT',guid='50cfa0cc-1654-49f8-9dfd-dafbdfaf1f83',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-848',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6f3c6c07-6095-4858-b6d2-fc1de8839971',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-851',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c729cc54-2d7a-4aa6-8bb5-cc742f01f58b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-854',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8c7303f8-86c8-46dc-9ae3-339580a4cae4',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-857',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='75d2e0f2-7972-48a0-b78c-492e2088ba86',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-860',nmfault='REPAIR/REPLACE',guid='2b844b1d-d988-420e-aad6-29282ba75c56',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-863',nmfault='REPAIR/REPLACE',guid='7c5c3f3c-8d48-4b90-a6f9-c4d79e7c34ad',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-866',nmfault='REPAIR/REPLACE UNIT',guid='c5cbaf23-1443-46e9-be71-cb0af1d86d53',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-869',nmfault='REPAIR/REPLACE UNIT',guid='681e8ba7-b9d5-412c-952c-45ebe29be593',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-872',nmfault='REPLACE BEARINGS',guid='42b287a2-b2e1-416b-aa1d-b14c379dbf40',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-875',nmfault='REPLACE BEARINGS',guid='07928060-3d28-442f-88f2-f02d03b96adc',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-881',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='95da0d86-4d55-457f-aee7-42c0ebc8f641',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-884',nmfault='FAN BLADING PROBLEM',guid='2ec1102e-931f-45d4-9111-6f63da303e90',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-887',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9e6037ff-4add-4833-8d34-466795011aa2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-890',nmfault='IMBALANCE',guid='89948c2a-80ec-4849-baef-d2d0eaae7f99',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-893',nmfault='LOOSENESS',guid='d01e3880-75f0-4c5e-9f1d-c30748ab1156',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-896',nmfault='MASTER ISSUE BEARINGS',guid='7d379330-7999-4bda-8faf-6ba34345ecb4',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-899',nmfault='MASTER ISSUE BEARINGS',guid='4fce863b-9adc-40d4-bd74-5ef81a668be6',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-902',nmfault='MASTER ISSUE COMPONENT',guid='1cf040aa-01ec-4f34-be76-38ccbe75a8e8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-905',nmfault='MASTER ISSUE COMPONENT',guid='d2141f2c-a1cd-4920-a09f-654784864220',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-908',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='82970c6e-8bf0-41d6-b3a3-9c748c8f6071',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-911',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6d023cfd-92b2-48f6-9115-8ed5a3ca2e9e',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-914',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8e177d4b-75b2-403e-be2e-266fadff2e4b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-917',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='aa41022f-5450-4e56-b50a-3984b8624b2b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-920',nmfault='REPAIR/REPLACE',guid='4faee655-5fbf-4bc5-94d9-71064dfc58b3',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-923',nmfault='REPAIR/REPLACE',guid='944c8388-d9d3-4ba9-affb-182f30fe5686',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-926',nmfault='REPAIR/REPLACE UNIT',guid='913f088c-6ad1-41ed-9ea3-53de4da733c5',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-929',nmfault='REPAIR/REPLACE UNIT',guid='c09134d8-3dab-42c0-b619-e6d29a1950a0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-932',nmfault='REPLACE BEARINGS',guid='49d38a87-c047-41b8-bf5e-89039e372979',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-935',nmfault='REPLACE BEARINGS',guid='c0969a29-25a8-48be-81b7-9668d2598be3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS-FANSTTRVNS
---- COMPONENT WEAR OR FIT
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-941',nmfault='COMPONENT WEAR OR FIT',guid='dcf75de3-e77a-4da4-ab3d-c9436bccf31a',parfault=nil,fault='032124cf-ca67-496d-9904-06cf823372db',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-944',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3c88d8ea-06f9-402c-bfc5-10886f2544b6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-947',nmfault='IMBALANCE',guid='10153f9f-6ce3-47c2-b947-4c5f7f4a8ac5',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-950',nmfault='LOOSENESS',guid='57417c1b-d890-43bf-a9cb-01ee4f7936a3',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-953',nmfault='MASTER ISSUE BEARINGS',guid='af300d28-f0cd-4c24-8092-90ec687e44a3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-956',nmfault='MASTER ISSUE BEARINGS',guid='7fdc3144-6b18-448c-9ee9-86dc2a8d0ab9',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-959',nmfault='MASTER ISSUE COMPONENT',guid='4a042b81-6787-4d24-981c-8fa54d469eb7',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-962',nmfault='MASTER ISSUE COMPONENT',guid='2386e11e-77db-495d-ad77-fdece43c492c',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-965',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c321bb06-83c4-4618-9319-fd36574da7f7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-968',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e01b12e6-3ba2-457f-b816-bf030bd35a5d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-971',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='9b6ab3da-054d-4957-bbba-d149f9afc571',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-974',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1c6544e1-8537-4ee7-80e9-f0ce775a76d9',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-977',nmfault='REPAIR/REPLACE',guid='ba424b63-d163-4f95-be29-1f0d6e1daa09',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-980',nmfault='REPAIR/REPLACE',guid='2342d761-51c7-4922-a05e-d1b84830088e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-983',nmfault='REPAIR/REPLACE UNIT',guid='bf1d8a57-e3b9-480a-8e4a-6195edb89e85',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-986',nmfault='REPAIR/REPLACE UNIT',guid='ad45d78e-6954-48ce-9f5e-d1373dfd982b',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-989',nmfault='REPLACE BEARINGS',guid='94167baa-a41d-4468-a667-a11fcd6160b3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-992',nmfault='REPLACE BEARINGS',guid='def7de77-f6fe-4144-bdab-6558d8dbfdcd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FLYWHEEL-BRG-FLYWHL-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-998',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='203380ee-0b17-4db1-b5c6-b50dd3b2e00f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1001',nmfault='IMBALANCE',guid='1f6cead0-549f-4b6e-8844-f435c548ab37',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1004',nmfault='LOOSENESS',guid='fe0fefc2-cd09-4142-8820-3172c2002a2e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR BRG-P-GR-P-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1010',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='a0ee978d-2269-4d08-a704-d027f09744a1',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1013',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='4da2628c-7474-487f-a799-9ff4de97e844',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1016',nmfault='GEAR MESH PROBLEM',guid='3bd0084c-f703-461f-8cf7-ed1a58989bc3',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1019',nmfault='IMBALANCE',guid='14625bbc-a6cd-40b9-8fbd-cc7a88af4912',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1022',nmfault='LOOSENESS',guid='f047ba8f-d2a5-412d-9b41-10587ee032cf',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1025',nmfault='MASTER ISSUE BEARINGS',guid='41d0fce2-f88f-4108-b0d4-fbce7b712a8f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1028',nmfault='MASTER ISSUE BEARINGS',guid='0ecf24e4-bb6a-4daa-9abf-17b0b3014789',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1031',nmfault='MASTER ISSUE COMPONENT',guid='88e50745-d0dd-4391-956e-ca175a32922d',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1034',nmfault='MASTER ISSUE COMPONENT',guid='7f30128f-6b50-44e9-8753-255c086790c6',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1037',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a06a74d3-62bb-4022-8797-451b74a27d77',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1040',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d2c643ee-8cf0-40fd-a3f1-cba79aee6783',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1043',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='acc5f5c1-4ae1-4dc7-ba34-ad266e96b133',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1046',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8ce4b2c4-260c-4a43-8323-6c3e73d89d5b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1049',nmfault='REPAIR/REPLACE',guid='cac399e6-bcc8-4c9a-9098-2e9eb215096e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1052',nmfault='REPAIR/REPLACE',guid='c3c14396-0c5a-4d41-a713-10577244dca5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1055',nmfault='REPAIR/REPLACE UNIT',guid='174a1985-f465-4167-9157-771e4fd44705',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1058',nmfault='REPAIR/REPLACE UNIT',guid='fc17fd75-b843-4ceb-8fbe-82fe07beb68d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1061',nmfault='REPLACE BEARINGS',guid='d3a58fee-1430-4522-934d-9ecfa2e237d8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1064',nmfault='REPLACE BEARINGS',guid='48dbcced-8911-473f-823b-cf09fa184daf',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1070',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c72d7342-5e66-4fc7-b236-a3ae23244606',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1073',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8c0a403c-e8c2-450a-bcae-56cb93ae4fe6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1076',nmfault='GEAR MESH PROBLEM',guid='f666db7a-fd63-45ef-8849-d1dff154a7db',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1079',nmfault='IMBALANCE',guid='25f2d11a-3f2b-4303-93bb-f35be6faf867',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1082',nmfault='LOOSENESS',guid='e42d91d6-30d7-4a7d-862e-bc3f984ad485',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1085',nmfault='MASTER ISSUE BEARINGS',guid='335fb814-4830-4c62-8eee-2792325e831c',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1088',nmfault='MASTER ISSUE BEARINGS',guid='d82e11ee-0014-49fe-9b62-fc6b03640119',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1091',nmfault='MASTER ISSUE COMPONENT',guid='2e8abb02-24e7-435d-991c-d16cb554b3ef',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1094',nmfault='MASTER ISSUE COMPONENT',guid='67751a00-dc90-40c0-a7f2-4715a8d4a2d9',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1097',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='189d5a65-da59-4a29-966f-010456656aba',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1100',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='432b8a77-f739-4b92-a32f-8c55fdcfed4c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1103',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3dd93071-fea9-42e2-83fd-11c0d8f97077',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1106',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1d130c30-520b-4eb8-b07f-f24be2d3b597',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1109',nmfault='REPAIR/REPLACE',guid='d62fc8a7-0264-46a4-b297-417a65472b88',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1112',nmfault='REPAIR/REPLACE',guid='99d9fc5e-9d3a-453e-99cf-295368bb00ea',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1115',nmfault='REPAIR/REPLACE UNIT',guid='b44d0bdd-0b28-4f8d-a317-73447c39405e',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1118',nmfault='REPAIR/REPLACE UNIT',guid='0665e720-faf0-44c3-8765-0f1a77687a55',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1121',nmfault='REPLACE BEARINGS',guid='e18097a4-35e2-4ba8-aac4-ec142db3d87a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1124',nmfault='REPLACE BEARINGS',guid='9c6e0836-6320-4ca5-96b5-f3f3d0b85f1d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1130',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='f3e54614-7935-4c4f-bb27-94cd6934d1cd',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1133',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='66ca56e3-f36e-4cca-9b9f-0f7b4db16d94',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1136',nmfault='GEAR MESH PROBLEM',guid='24e66026-9b6b-44bb-b74e-2c530447fd48',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1139',nmfault='IMBALANCE',guid='eb52540d-1085-416f-989c-382ddc04206b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1142',nmfault='LOOSENESS',guid='5c920ce7-8282-41c2-b183-361956e25619',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1145',nmfault='MASTER ISSUE BEARINGS',guid='5283e4c5-8ca5-472e-ab1a-7a627dec8dc1',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1148',nmfault='MASTER ISSUE BEARINGS',guid='821a4ed9-5f75-48c7-8387-67e396965d45',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1151',nmfault='MASTER ISSUE COMPONENT',guid='efca2a0e-ea22-49ff-b232-18ada2a1f73e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1154',nmfault='MASTER ISSUE COMPONENT',guid='8c570f0c-d1a1-4f3b-9756-89b3b15318a4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1157',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0d6f96a6-7816-4a40-9f22-4c38252abbcf',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1160',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='20ae67d7-c852-42f8-bad7-7320b287c2f3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1163',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='90ec1ab5-1036-4d7a-ab2e-14366ef7cb2b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1166',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6904659b-ad47-4b57-a81a-f97fb5327f37',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1169',nmfault='REPAIR/REPLACE',guid='fbc16c90-a977-4560-840f-2355c002cece',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1172',nmfault='REPAIR/REPLACE',guid='e68ab910-e81e-437f-a7ec-cd32395ca4d6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1175',nmfault='REPAIR/REPLACE UNIT',guid='e5cd6ebc-7a91-4e25-a89d-1c923bcfd3ca',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1178',nmfault='REPAIR/REPLACE UNIT',guid='a9c538f0-92da-4f8c-a35d-56f6b9f0c719',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1181',nmfault='REPLACE BEARINGS',guid='d093c39f-5add-4245-8c57-65f86abdf71b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1184',nmfault='REPLACE BEARINGS',guid='a158d55a-10e8-4f91-b940-229d58ae1d57',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1190',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='51869404-de0d-4653-b87e-971ccd62fe6c',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1193',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='2eac90ac-8dd7-4dd9-ac38-4aff1fc041c7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1196',nmfault='GEAR MESH PROBLEM',guid='94ee3edd-635f-4558-a846-0286bfc0738e',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1199',nmfault='IMBALANCE',guid='9a5bdb97-3540-4c42-a53b-fa711067e6d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1202',nmfault='LOOSENESS',guid='ae5f0824-d93a-46c8-a824-b1686a6dfc9a',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1205',nmfault='MASTER ISSUE BEARINGS',guid='66dd730d-d126-4fff-ae22-5f1e8fd2b85d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1208',nmfault='MASTER ISSUE BEARINGS',guid='1e991af3-8772-4b63-9659-19d15307bf85',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1211',nmfault='MASTER ISSUE COMPONENT',guid='0192884c-8172-4eb3-8885-4d0c2a11acfa',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1214',nmfault='MASTER ISSUE COMPONENT',guid='40716fb8-5571-4863-8108-175ace8a4529',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1217',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e4ee0e7e-096b-486a-94db-1397ef647bd5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1220',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='accddfe7-1205-4937-a89a-7ff94bd8ae67',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1223',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='03593113-7744-48ca-bcb6-c9fd3851d93e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1226',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fd5371f3-ac0e-43a8-8cdd-d0ade8568af8',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1229',nmfault='REPAIR/REPLACE',guid='845d1083-8a0f-4a7a-98e9-14bcf762e9e5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1232',nmfault='REPAIR/REPLACE',guid='2656f52d-8c8b-4e6d-9800-a32f4c77023f',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1235',nmfault='REPAIR/REPLACE UNIT',guid='374b36f2-4c6a-44e6-891a-dca46878d92a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1238',nmfault='REPAIR/REPLACE UNIT',guid='b163a25f-cc8c-4f0d-a0b6-5ead2adef7ef',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1241',nmfault='REPLACE BEARINGS',guid='2a0b8731-523d-4155-a1ac-f13470067d04',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1244',nmfault='REPLACE BEARINGS',guid='9d5fb87f-0466-45b6-8031-278f92697da0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1250',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='747f362c-1006-4967-921a-7c4e5368da5e',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1253',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3e8dafe4-a1ad-49e7-afe2-cca14f815f5b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1256',nmfault='GEAR MESH PROBLEM',guid='1fdd313b-ce1b-49b1-94e7-5a24a0730245',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1259',nmfault='IMBALANCE',guid='be8986d6-853a-4e6a-9998-fb24e153d4a6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1262',nmfault='LOOSENESS',guid='488c8529-1044-4241-a2dc-2c346be204cd',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1265',nmfault='MASTER ISSUE BEARINGS',guid='7f5d6179-38e6-4dd9-a78e-f1f0a612de82',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1268',nmfault='MASTER ISSUE BEARINGS',guid='1a7a0388-132c-44d7-b190-06beab29a1b3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1271',nmfault='MASTER ISSUE COMPONENT',guid='ae226d88-b34d-4bde-8d93-dcc1f8ccd5d9',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1274',nmfault='MASTER ISSUE COMPONENT',guid='40df0937-0ea3-4f9b-bb44-2242b9f7cb1c',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1277',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='75804b18-eb6a-4f6b-9ad1-8e988ea16052',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1280',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4af0b150-8c81-4b50-b7dd-c20c3d874cd5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1283',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='66d15dc2-5b0f-4e7b-8f5c-6df65c371d7a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1286',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='072144cd-76bf-4f66-abb6-d165ec4bc0d1',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1289',nmfault='REPAIR/REPLACE',guid='cef246c4-12a7-4f08-b15c-24192cf2ab26',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1292',nmfault='REPAIR/REPLACE',guid='fb865b44-7972-42bf-9aa5-e68c1b8a982c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1295',nmfault='REPAIR/REPLACE UNIT',guid='23745c50-7d1e-4aaa-95d0-2b50db356823',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1298',nmfault='REPAIR/REPLACE UNIT',guid='af11d9bf-ac8b-4934-b11b-43568c17405e',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1301',nmfault='REPLACE BEARINGS',guid='1a2a32d1-1e15-4e6e-9df9-dcf6dbbfbc59',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1304',nmfault='REPLACE BEARINGS',guid='2cb66e59-1efd-4a66-816e-b07cbd835838',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1310',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='f0166847-33b9-4206-8fa7-fbee3babbb0c',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1313',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='befa4959-d896-425d-aff2-912fbe82cda1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1316',nmfault='GEAR MESH PROBLEM',guid='6ffefc73-e8e0-4507-a53f-8884fb67ff58',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1319',nmfault='IMBALANCE',guid='f5e1e678-b50a-4605-a244-db9d6a9a1b56',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1322',nmfault='LOOSENESS',guid='960fe7cb-2a7f-448d-b96a-b8c9ef31aaf6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1325',nmfault='MASTER ISSUE BEARINGS',guid='12be559a-8b9a-4521-8f37-fe7325d289e3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1328',nmfault='MASTER ISSUE BEARINGS',guid='3fcfafb7-9c73-41a6-a36a-579b034a51cf',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1331',nmfault='MASTER ISSUE COMPONENT',guid='c3399539-92fa-4520-b379-901d4a4e5561',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1334',nmfault='MASTER ISSUE COMPONENT',guid='1ab867b6-230f-493a-95c5-8c6f429268d4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1337',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='107b66bd-c6eb-4879-9948-9b8d48d3b4e5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1340',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a364d436-f350-4c96-9db7-ed91c9b5dd72',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1343',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='07fc0d1a-afe3-4ba8-984f-a029bfc11d7e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1346',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5aa1504e-1e4e-4ba6-9935-c298d46534ee',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1349',nmfault='REPAIR/REPLACE',guid='a118a290-2ccb-4501-bf4a-86cab58ebff6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1352',nmfault='REPAIR/REPLACE',guid='a5fbe468-d1ea-4b74-beb3-b0cf17ebdb87',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1355',nmfault='REPAIR/REPLACE UNIT',guid='00737189-fe76-46ae-b801-913a7112aacf',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1358',nmfault='REPAIR/REPLACE UNIT',guid='24deb73d-5265-487a-9f71-629cf5aa2bdc',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1361',nmfault='REPLACE BEARINGS',guid='25298008-6444-496a-928d-ad4134dc918e',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1364',nmfault='REPLACE BEARINGS',guid='564825fa-41b5-403c-a4b3-704efcbc9ed3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1370',nmfault='GEAR MESH PROBLEM',guid='0e37d678-0b8d-4db8-9c78-0d0033db1460',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='2dea347f-8ab2-4e34-8b68-413d31d38a8a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR-BRG-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1376',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c9b31a80-dca2-4d0d-997a-5191a969dbff',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1379',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fbff74fa-f066-4ffd-ac67-dc27430cae81',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1382',nmfault='GEAR MESH PROBLEM',guid='2347e2f4-a7ae-44ad-88d1-1cbd5291ea93',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1385',nmfault='IMBALANCE',guid='4d80ba93-efe1-4c7c-bdba-17ad54c0aeb9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1388',nmfault='LOOSENESS',guid='5105a731-4bd5-4e95-8d4d-a32d6ab36fac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1391',nmfault='MASTER ISSUE BEARINGS',guid='781add17-78db-4a12-9f35-45a79640bde0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1394',nmfault='MASTER ISSUE BEARINGS',guid='52d51a6c-156e-4a19-b6bd-e0edb73464b5',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1397',nmfault='MASTER ISSUE COMPONENT',guid='9148f9dd-12b2-47b0-a3d4-79c9a0ef2235',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1400',nmfault='MASTER ISSUE COMPONENT',guid='75fe483b-00a2-4938-bfce-aece396bd464',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1403',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='931b2230-48b2-4de3-887f-8a91213e0d9c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1406',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='bc519a94-ef25-4197-822b-bd349acf0fe2',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1409',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1190861b-e27b-440d-9516-e627a9ff3fb0',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1412',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cb92d733-f830-4bd5-8b17-57235c400bf7',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1415',nmfault='REPAIR/REPLACE',guid='3687c520-06fa-4628-ac06-35a1aeccc3a9',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1418',nmfault='REPAIR/REPLACE',guid='51293d1b-d15f-4f83-8887-5efe308d17af',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1421',nmfault='REPAIR/REPLACE UNIT',guid='ab754259-7564-4f2a-ad46-e76f0ee17d73',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1424',nmfault='REPAIR/REPLACE UNIT',guid='f911f364-c0b4-4e63-94c1-8fee2ddb8e11',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1427',nmfault='REPLACE BEARINGS',guid='f6b90336-65ae-4e3b-a41c-9fb0168416ea',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1430',nmfault='REPLACE BEARINGS',guid='773b0ab0-2840-4755-b8ae-bcafde9bd9b4',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1436',nmfault='FAN PROBLEM',guid='ffab68b1-386d-46e0-95d9-04f70d813ff1',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1439',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='cf561af7-1344-4afa-a45b-95144227a240',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1442',nmfault='IMBALANCE',guid='88238328-1d57-4a5c-b292-29c84c943357',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1445',nmfault='LOOSENESS',guid='fd6cf05c-adc2-4f70-a998-ca88445341a4',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-GENSYN-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1451',nmfault='FAN PROBLEM',guid='a177d37e-449d-4b37-9d1e-23d89942a461',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1454',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9306ca22-09f3-4cee-ad6d-bbe0bc12f7f2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1457',nmfault='IMBALANCE',guid='1fd0cc12-c01b-4089-bc8b-0a897d72d362',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1460',nmfault='LOOSENESS',guid='72e692ff-ef00-4d5d-a162-56c31765b8b2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1463',nmfault='MOTOR COMMUTATOR PROBLEM OR BRUSH WEAR',guid='d608c385-5c39-4d23-b2de-26702e2b6759',parfault=nil,fault='3c1814d5-4159-40fb-a152-bcf9edb1d036',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-GENIND-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1469',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='33e48c11-6a72-41e7-a6e1-135fe7b55db7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1472',nmfault='IMBALANCE',guid='a224ddc3-dc27-4eee-b27d-60d1cdfd23b1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1475',nmfault='LOOSENESS',guid='f4068fc2-abb3-41b1-927f-0f6f61778940',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GOVENOR-BRG-GOV
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1481',nmfault='IMBALANCE',guid='eb33c7ad-b06e-4dcd-af56-6f4dcfee39d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1484',nmfault='LOOSENESS',guid='e1018e8b-a32e-4dff-a6fc-18a1d4017504',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1490',nmfault='2X LINE FREQUENCY',guid='e70df412-edae-4b46-af3b-36bcfaf5efb5',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1493',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='13fe3138-73ef-4718-865e-1415567dc967',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1496',nmfault='ELECTRICAL PROBLEM',guid='66ea75a7-174b-4030-ab75-32f0cd64508f',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1499',nmfault='ELECTRICAL PROBLEM',guid='0154952d-e064-48aa-9af9-d4277a4aeebe',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1502',nmfault='FAN PROBLEM',guid='18b8f7b5-6c5c-44df-87ad-4d16422ee14f',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1505',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3aecd665-43d7-4709-a53b-bcd589cfcdf6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1508',nmfault='IMBALANCE',guid='94cef2a8-743b-4847-9cc0-ef3c4e405093',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1511',nmfault='LOOSENESS',guid='be648058-0da2-4073-895a-3910c8c605f6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1514',nmfault='MASTER ISSUE BEARINGS',guid='5096d748-c668-42dc-87c1-600d7e213967',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1517',nmfault='MASTER ISSUE BEARINGS',guid='c50edc13-f8f2-40a6-9b95-6300d856a034',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1520',nmfault='MASTER ISSUE COMPONENT',guid='a7850e70-6bc7-42d0-84bd-138fbdd40c44',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1523',nmfault='MASTER ISSUE COMPONENT',guid='2ad20163-8b45-49cd-a487-b0e92e669914',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1526',nmfault='MASTER ISSUE ELECTRICAL',guid='62d9f39e-f5b2-46ce-a156-d3717622e38a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1529',nmfault='MASTER ISSUE ELECTRICAL',guid='02f0bc12-ea3c-4ca5-b2db-cc8c1392faa7',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1532',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='27d96009-58cc-4681-a9ea-0caf2b7446da',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1535',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e0135712-019e-4c2d-8e81-c7a95d3ebf1f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1538',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b53e03a3-f01d-4db7-90df-2104f011ed5d',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1541',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a801fb70-95e4-46b9-b391-af2d31bf8b12',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1544',nmfault='REPAIR/REPLACE',guid='0f69e4e2-e5cf-458b-90b7-672b4d109b0b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1547',nmfault='REPAIR/REPLACE',guid='27d52e1c-8da3-4b9e-8a16-d9eea191c3be',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1550',nmfault='REPAIR/REPLACE UNIT',guid='4a621df7-11c0-4e0b-a8ad-18face5705a6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1553',nmfault='REPAIR/REPLACE UNIT',guid='34cab4a8-b0ed-4e48-b688-9ab93a22df8d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1556',nmfault='REPLACE BEARINGS',guid='81aa8c67-e019-4144-8c74-73eef9b52df6',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1559',nmfault='REPLACE BEARINGS',guid='2cfebe90-1e2d-4ac1-8f42-beff138efeee',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1562',nmfault='ROTOR RUB',guid='c938aa2e-b1a3-40cb-a1ce-8ccd9f7db4b0',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-FANVNS-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1568',nmfault='2X LINE FREQUENCY',guid='aa5c0005-5328-42c9-bcd9-12af8d74eb0d',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1571',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6cf91ca0-9ae8-4ed8-b706-7167d159ef24',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1574',nmfault='ELECTRICAL PROBLEM',guid='233aad72-b924-4e2b-99e7-50c410e36f00',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1577',nmfault='ELECTRICAL PROBLEM',guid='80168c20-1c77-4653-b066-4d573b196848',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1580',nmfault='FAN PROBLEM',guid='d9ef1d7f-ba7e-4461-9d44-188e7bc37892',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1583',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='27e972b3-f5fb-4393-b57c-f0c1005e4e69',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1586',nmfault='IMBALANCE',guid='8859756c-4717-426a-a11c-72492a18dae9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1589',nmfault='LOOSENESS',guid='a175bbe7-e236-427d-b9b4-883e528aa6dc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1592',nmfault='MASTER ISSUE BEARINGS',guid='c5b48672-a112-4aa7-9fa2-9460dbc71133',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1595',nmfault='MASTER ISSUE BEARINGS',guid='678ef381-d9d5-440f-86fa-ff1248135e4d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1598',nmfault='MASTER ISSUE COMPONENT',guid='aceaa8fd-235e-4a01-aea9-e7cc9e29e042',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1601',nmfault='MASTER ISSUE COMPONENT',guid='aecd36c8-afd9-476a-b152-fb0b306146a2',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1604',nmfault='MASTER ISSUE ELECTRICAL',guid='8368e022-a047-429a-a7c1-bf4d14c929f4',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1607',nmfault='MASTER ISSUE ELECTRICAL',guid='6a878290-b081-4b2d-845e-73f96632f267',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1610',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2d6990ae-4afc-4476-acf8-22aea6aa1399',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1613',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='957c77a8-6187-4ddb-83d9-a3562ae6cfe0',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1616',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8b2f33ff-f430-4185-ad6e-c576a613f2ca',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1619',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4deb1428-2d97-4563-8f7a-945e0e8bdd53',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1622',nmfault='REPAIR/REPLACE',guid='f39f9830-0dc4-4878-8c38-61034574921b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1625',nmfault='REPAIR/REPLACE',guid='e6cfff9d-d39a-452c-81bf-1f9fb739dcf5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1628',nmfault='REPAIR/REPLACE UNIT',guid='beec483e-3ccd-471d-bf43-020ac7b35d94',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1631',nmfault='REPAIR/REPLACE UNIT',guid='df29e87b-f621-4a5f-a3a5-d1ec684a3c49',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1634',nmfault='REPLACE BEARINGS',guid='8b2effd3-2b3d-4720-a213-15fdb5d1c2fe',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1637',nmfault='REPLACE BEARINGS',guid='2fc255cb-3fe6-4faf-abf1-b4d79e628bc8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1640',nmfault='ROTOR RUB',guid='cb7856b4-02a8-41c4-a581-e2cc12e2938d',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTIND-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1646',nmfault='2X LINE FREQUENCY',guid='32975000-1b6c-4f54-a238-5578ff163632',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1649',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='58b9aec0-f431-4ba2-a6df-41a95ecb69cb',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1652',nmfault='ELECTRICAL PROBLEM',guid='1d14465f-477d-4a50-8914-aa3e1255f393',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1655',nmfault='ELECTRICAL PROBLEM',guid='530754a7-7b93-49c4-9263-913da4cffb4f',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1658',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8d316fa2-4f2d-4c6e-861d-173f487515a0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1661',nmfault='IMBALANCE',guid='f3dc4f6e-9b45-473d-bfef-ed040a78c16a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1664',nmfault='LOOSENESS',guid='f841410e-0fb5-47d9-94b5-9c49a61daf2d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1667',nmfault='MASTER ISSUE BEARINGS',guid='326a2a6b-8057-4a80-888f-26c747f94c0e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1670',nmfault='MASTER ISSUE BEARINGS',guid='d5192283-54cc-4e7b-9d6f-d14972fc1b45',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1673',nmfault='MASTER ISSUE COMPONENT',guid='17957b3e-cd11-4d27-8f48-5fa4853eee8e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1676',nmfault='MASTER ISSUE COMPONENT',guid='2d25356f-094c-4578-a108-cf4f6a4678b2',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1679',nmfault='MASTER ISSUE ELECTRICAL',guid='065b95f6-01c3-492e-950b-c1a539b039a1',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1682',nmfault='MASTER ISSUE ELECTRICAL',guid='a94c6d83-8dea-4962-9838-8f56ce8f9b8f',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1685',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3ca1608e-592d-46e4-8df3-98b248cba16c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1688',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='78c9ff18-3c5e-437b-9ef1-496a408ae3b8',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1691',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ef08c2c2-635c-4d42-b58a-beca5056ca9b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1694',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0c3ee23d-b799-4db6-806f-9133775a9381',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1697',nmfault='REPAIR/REPLACE',guid='69cedee5-5a6b-45ea-b1be-6fc8a5e784fb',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1700',nmfault='REPAIR/REPLACE',guid='92ded557-aaac-4b83-b429-45680adf59c5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1703',nmfault='REPAIR/REPLACE UNIT',guid='a940e817-b605-49e6-9bd8-8e9a3c2e0d25',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1706',nmfault='REPAIR/REPLACE UNIT',guid='3adbd866-fc30-44c3-99b0-cc1ef7b75aa4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1709',nmfault='REPLACE BEARINGS',guid='602b5f22-0f50-46b2-ab55-382a45bb9a8f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1712',nmfault='REPLACE BEARINGS',guid='08fd98a9-05ba-4468-895d-b4486045fb04',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1715',nmfault='ROTOR RUB',guid='51ff2dc4-609b-4b4b-a5d9-9e787818a380',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTPSTN-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1721',nmfault='2X LINE FREQUENCY',guid='eef037b1-8bcd-498f-9814-cb901ab571c4',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1724',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6ceb3b6e-757b-4fb0-a5db-5a30db49d179',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1727',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='badea390-88d4-47f3-894c-1932dcaa2f86',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1730',nmfault='IMBALANCE',guid='60c2f1c2-a93a-4264-9302-caf46cfbe84c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1733',nmfault='LOOSENESS',guid='2f9ff772-924d-4901-b065-78f15ee93d81',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1736',nmfault='MASTER ISSUE BEARINGS',guid='7dbe8170-fcb5-44b1-a14c-c13fd3b83842',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1739',nmfault='MASTER ISSUE BEARINGS',guid='4849c807-4989-45ef-a52b-bd1ad1b2ce4b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1742',nmfault='MASTER ISSUE COMPONENT',guid='bcb446c7-8ac0-4675-b202-6bb31fbc3f91',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1745',nmfault='MASTER ISSUE COMPONENT',guid='b946d8a8-06e0-4ed5-a552-1e813804d305',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1748',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d05a05c3-48dd-426c-a494-bfcf2993d1c6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1751',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fddd029f-b5ae-4963-b364-46ab9189474c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1754',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0ec289b0-d8d3-4d9a-877f-87d9ab3571e3',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1757',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='095d582a-54d8-4574-a241-71074868aaa4',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1760',nmfault='REPAIR/REPLACE',guid='dc873824-f1ec-4716-88cc-59e6d64a11ca',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1763',nmfault='REPAIR/REPLACE',guid='18c17899-d5fd-4675-a9ba-e08f13d80b8b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1766',nmfault='REPAIR/REPLACE UNIT',guid='e19b32b1-7b56-438f-b185-6d2933d43860',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1769',nmfault='REPAIR/REPLACE UNIT',guid='18904b97-d993-42d6-bec2-962af8c25255',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1772',nmfault='REPLACE BEARINGS',guid='ce5fb19d-dd60-42b5-81db-52fb8050166b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1775',nmfault='REPLACE BEARINGS',guid='fb0b330d-8ff6-41b1-927c-9006ce59b8dd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1781',nmfault='2X LINE FREQUENCY',guid='4f3315e5-91ed-4dec-ab87-be4d958e4714',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1784',nmfault='BENT OR BOWED SHAFT',guid='7d65a62f-f31b-4ef2-816b-c9f6e525d358',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1787',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='309d6348-ab56-4263-97a1-6aa282dde990',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1790',nmfault='ELECTRICAL PROBLEM',guid='ff9ac84e-c17d-46c9-83b1-f56f5a0a42b4',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1793',nmfault='ELECTRICAL PROBLEM',guid='9453af31-fb2e-4b66-846c-ec2f36e17c60',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1796',nmfault='FAN PROBLEM',guid='50953da7-eb97-47a2-84d9-07f882c9abfd',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1799',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5e5f4115-1630-4125-9c0a-f2886c37ebb7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1802',nmfault='IMBALANCE',guid='2a657674-c7ee-4035-bbd2-00fe0ee84eb6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1805',nmfault='LOOSENESS',guid='8486d318-c5bc-4c55-847a-dac681e263a9',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1808',nmfault='MASTER ISSUE BEARINGS',guid='e84dbd2a-1303-43e8-aed3-9ce355eb00a4',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1811',nmfault='MASTER ISSUE BEARINGS',guid='99893390-c156-40b8-846d-4733c8560928',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1814',nmfault='MASTER ISSUE COMPONENT',guid='5d3ef820-1bc4-496f-ae1c-739145c9dd8a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1817',nmfault='MASTER ISSUE COMPONENT',guid='889a14b6-d609-43ea-8bee-2149deca7bac',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1820',nmfault='MASTER ISSUE ELECTRICAL',guid='99800171-1bcd-4086-81d7-0af12de698d5',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1823',nmfault='MASTER ISSUE ELECTRICAL',guid='e2a0d8df-09d2-4d84-857e-00505add4e0b',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1826',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0338d314-ef13-4012-9cee-f380a1de2074',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1829',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='262d14d1-a856-4ca8-9a3a-fca7fafe44f0',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1832',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0c84a35d-9c18-43cd-8a93-9fc2f8f8957e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1835',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e643d412-6022-4468-bbcc-44c80910871b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1838',nmfault='REPAIR/REPLACE',guid='51c51755-e12a-4d3f-9431-ca9a548f1102',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1841',nmfault='REPAIR/REPLACE',guid='b3652177-f24c-4d00-a090-13a399b48e82',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1844',nmfault='REPAIR/REPLACE UNIT',guid='b4290190-469b-45f9-b3f1-08625b57f2e1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1847',nmfault='REPAIR/REPLACE UNIT',guid='08489b83-46ef-469b-a73f-79adb91f594f',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1850',nmfault='REPLACE BEARINGS',guid='adc03503-b625-4ad0-a125-a60201d46418',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1853',nmfault='REPLACE BEARINGS',guid='d120d19a-3fe4-432c-8dfd-5430b460b983',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1856',nmfault='ROTOR RUB',guid='31c22deb-930f-4a73-a4fc-d193b4355925',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG-FANVNS
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1862',nmfault='2X LINE FREQUENCY',guid='071cd5c7-cf0a-40e8-a26f-f48aa39c99c6',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1865',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='5afb824b-74c2-4b2a-b88f-e7134ee9273f',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1868',nmfault='ELECTRICAL PROBLEM',guid='3b9b0960-a426-4c4f-b920-6573d3e84182',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1871',nmfault='ELECTRICAL PROBLEM',guid='619f706a-0000-4183-9a04-dfae29e8b8c7',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1874',nmfault='FAN PROBLEM',guid='dfdd5569-9088-4978-a090-1e29961543de',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1877',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='6955032c-3ad6-4357-80cd-58ebdd8a4929',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1880',nmfault='IMBALANCE',guid='cbcbf760-4e31-4b41-b0a8-affd29e19ab6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1883',nmfault='LOOSENESS',guid='530074f7-305a-4d7e-a26f-34dc95cdfcdb',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1886',nmfault='MASTER ISSUE BEARINGS',guid='bf55cc9e-5c6b-4431-af51-f4fdbdf59355',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1889',nmfault='MASTER ISSUE BEARINGS',guid='86b821b1-c652-41e2-8b27-4fc477ac4e26',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1892',nmfault='MASTER ISSUE COMPONENT',guid='8bf35721-83e7-4953-bc52-9bfaaf5ad333',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1895',nmfault='MASTER ISSUE COMPONENT',guid='83822019-c84e-4588-b25c-01c8df96d2e4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1898',nmfault='MASTER ISSUE ELECTRICAL',guid='6ff014c8-7fbf-425e-9f5c-6ec74ec2792c',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1901',nmfault='MASTER ISSUE ELECTRICAL',guid='e0af6354-741f-4d84-b398-c6b2f2b8ec2a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1904',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d88bacf3-1b9a-4b3c-bb55-288fcc0e485f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1907',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1fd205a1-ae03-4557-91b0-6c30eb16dba3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1910',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='f0721bf7-3f9b-4c2a-8fc0-577d1b42b3a0',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1913',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='710eb800-b66f-4b13-a3f6-ceccf912e879',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1916',nmfault='REPAIR/REPLACE',guid='4a6d301c-2385-4314-bf99-2d0262b975c7',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1919',nmfault='REPAIR/REPLACE',guid='37caa90a-d784-42db-8c24-9506fe49fc3a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1922',nmfault='REPAIR/REPLACE UNIT',guid='b3f2e6a9-8a6e-4e13-8b48-335a0d2b4553',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1925',nmfault='REPAIR/REPLACE UNIT',guid='33bba000-b662-4d97-87e3-c4d0bc8a6cde',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1928',nmfault='REPLACE BEARINGS',guid='01308340-08b3-4fe2-b22f-7ddf52b7fdb2',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1931',nmfault='REPLACE BEARINGS',guid='0221312a-122a-4308-bf5a-e207aea14296',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1934',nmfault='ROTOR RUB',guid='d2473b17-9630-4254-adc3-b64ea281ba6a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-FANVNS-BRG
---- 2X LINE FREQUENCY
table.insert( g_rec_rules, {rule=function() return rec_2xlinefreq() end
  ,nmrule='RecRuleLine-1940',nmfault='2X LINE FREQUENCY',guid='34a6ff0a-e569-43c2-85e9-8bcfd30a70ec',parfault=nil,fault='035ec59f-95b4-4dda-9493-c074b8fc45a5',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1943',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6de75b22-bd36-4cab-827a-4113922fc6d4',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1946',nmfault='ELECTRICAL PROBLEM',guid='082270f9-c6a2-4c3b-a90b-871f7e9ac03a',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1949',nmfault='ELECTRICAL PROBLEM',guid='70564fae-858b-4be1-87bf-cc60dfb0c8b9',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1952',nmfault='FAN PROBLEM',guid='9e3957b5-4582-4ca7-9215-478fedec1a30',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1955',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fcb91322-572e-4d3e-b488-2126ba756bfb',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1958',nmfault='IMBALANCE',guid='2806fd00-64ca-40e6-8fd6-64c385c90d4c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1961',nmfault='LOOSENESS',guid='b9a5d731-e3b7-441d-a3e6-1b694099d701',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1964',nmfault='MASTER ISSUE BEARINGS',guid='34f3a785-2f96-47df-8cf0-2780f2330fcf',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1967',nmfault='MASTER ISSUE BEARINGS',guid='a2c0c2f5-4ff7-4c25-96a7-397d5f0a240a',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1970',nmfault='MASTER ISSUE COMPONENT',guid='0c293a8f-0f92-420e-a8db-57180d3c97be',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1973',nmfault='MASTER ISSUE COMPONENT',guid='09efd4a2-a1d7-4709-9577-f19c7ebb741e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1976',nmfault='MASTER ISSUE ELECTRICAL',guid='e82b7875-a733-4f82-a3c8-956dcdca14e0',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1979',nmfault='MASTER ISSUE ELECTRICAL',guid='ada13013-6ab8-41a3-96ab-2de7bb9f9e6e',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1982',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3542f75f-6d55-46ea-852b-07c927c8277a',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1985',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b9761390-8b79-40b7-811d-3dbf9afacaf3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1988',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5d4e0729-0df8-423a-9efd-628a4fcc66fb',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1991',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='40903455-9a50-467e-870e-4ca23aef679e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-1994',nmfault='REPAIR/REPLACE',guid='22f463fe-3410-4e7c-b3ee-d1e6490e74f5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1997',nmfault='REPAIR/REPLACE',guid='e7045fbb-e774-44d6-8760-0e70091845ad',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2000',nmfault='REPAIR/REPLACE UNIT',guid='b95ed638-3dc3-4650-b65b-5837bc2e8a64',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2003',nmfault='REPAIR/REPLACE UNIT',guid='a721d38b-604c-4e63-bd02-22f6ee31bcc7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2006',nmfault='REPLACE BEARINGS',guid='657ae8ca-f9a1-4bd9-bb7a-722c3ad34726',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2009',nmfault='REPLACE BEARINGS',guid='a7208bad-f596-4c3c-9cfd-7822ac919397',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-2012',nmfault='ROTOR RUB',guid='28835fc2-d1d6-4acb-a8cc-101a9bb4183a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PULLEY-BRG-PUL
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2018',nmfault='IMBALANCE',guid='0846d62b-3d8a-4768-aeb7-1c0b51099d2a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2021',nmfault='LOOSENESS',guid='beed1f7e-d678-4570-b8e7-20136b681800',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGFLEX-CPLGFLEX-BRG-PMPOIL-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-2027',nmfault='ANGULAR MISALIGNMENT',guid='2c86d9d7-f716-4979-bc1c-0119ed76e9ed',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2030',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='918fcbc8-5c33-46c2-bd67-a3bf2fa11709',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2033',nmfault='LOOSENESS',guid='263000fd-9cce-4ba2-bcd2-fbb8ec9a72ef',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2036',nmfault='MASTER ISSUE BEARINGS',guid='ac4ab797-a010-45db-ae2b-1017dab2109a',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2039',nmfault='MASTER ISSUE BEARINGS',guid='69e604d0-7667-47f2-be5b-d8ba897ae48e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2042',nmfault='MASTER ISSUE COMPONENT',guid='8c1af890-46bf-4605-801e-a86d1d738d61',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2045',nmfault='MASTER ISSUE COMPONENT',guid='b656d880-c72b-4676-8115-c6e1a7d78ff0',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2048',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='094c780b-31c8-4e2c-9fa1-e0bc11e45f17',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2051',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='17821d0a-db8f-42db-98df-4b11a1807262',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2054',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3ea38283-2f0b-41aa-847e-ae974ee25709',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2057',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5bc3d5ac-e389-437f-9c08-0100b1c2388a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-2060',nmfault='PARALLEL MISALIGNMENT',guid='78831f68-2dd1-4ca7-a76f-6a01761b9a99',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2063',nmfault='REPAIR/REPLACE',guid='c7a7d5f6-3aa3-4ed3-9f56-1de0f27e7cf5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2066',nmfault='REPAIR/REPLACE',guid='b22cbc67-0169-412c-8986-0c5dfc303876',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2069',nmfault='REPAIR/REPLACE UNIT',guid='1f5ccc33-a394-436c-a01a-4e3ddf47fc4b',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2072',nmfault='REPAIR/REPLACE UNIT',guid='63681dfc-e51f-4619-b66d-d504f4d04bca',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2075',nmfault='REPLACE BEARINGS',guid='73425267-878d-453c-9a25-388cc49702cc',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2078',nmfault='REPLACE BEARINGS',guid='150b99f4-21ab-40e3-abcd-cc6d7fb60e24',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGRGD-PMPOIL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2084',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='523357e5-4a5a-49a6-8dbe-32002c1e1263',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2087',nmfault='LOOSENESS',guid='9e5ee10d-a87f-42af-8469-c07a29b3863d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2090',nmfault='MASTER ISSUE BEARINGS',guid='66b65c74-f263-4af3-9ad1-bd1bcdbb4ce0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2093',nmfault='MASTER ISSUE BEARINGS',guid='83b069a9-25ce-402d-a9f9-63e402ac771b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2096',nmfault='MASTER ISSUE COMPONENT',guid='316f639a-d9d3-4908-84aa-d9bc57df4177',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2099',nmfault='MASTER ISSUE COMPONENT',guid='d4be2dd3-8c14-422e-a37d-285fb6be2047',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2102',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a88d3b9f-76c7-439e-8cb5-ce6f4bc94a26',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2105',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='44a1052c-56d1-4311-a8e3-1b4bb158ed4a',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2108',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7729ce95-ee13-4c8c-8c1d-ad016be29405',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2111',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='024de481-22c4-4675-88a1-7d80dc27b996',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2114',nmfault='REPAIR/REPLACE',guid='30fa9efa-ceb1-4870-8532-096760befffa',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2117',nmfault='REPAIR/REPLACE',guid='01059651-c94d-4e98-a3db-56945c1cc209',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2120',nmfault='REPAIR/REPLACE UNIT',guid='9ebc6e5a-7c3c-40ae-be2d-7d5d0a48b266',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2123',nmfault='REPAIR/REPLACE UNIT',guid='e5f63622-43ce-469c-bb22-df399e85d1f3',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2126',nmfault='REPLACE BEARINGS',guid='59598551-0dac-4f05-847a-69926719c665',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2129',nmfault='REPLACE BEARINGS',guid='34f8e385-43ff-4674-b4ad-0ee438e1af92',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-GR-PMPPSTNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2135',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='3f82ab7c-5568-4487-ac78-154ffc9fbd7d',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2138',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b5945e19-6edf-4048-8d01-e18601b6eaaf',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2141',nmfault='IMBALANCE',guid='f68ee5bc-cee8-4e59-9f7c-17b3f95cf501',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2144',nmfault='LOOSENESS',guid='82e404be-299a-4c60-9d7d-95af86223cbc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2147',nmfault='MASTER ISSUE BEARINGS',guid='67cad2bb-e97b-48e6-abff-59a89b89ae71',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2150',nmfault='MASTER ISSUE BEARINGS',guid='eede85c5-5ad4-4f5d-be24-a9eccd499d01',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2153',nmfault='MASTER ISSUE COMPONENT',guid='7ddbcbad-da02-4e5c-96f4-e284a16017e1',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2156',nmfault='MASTER ISSUE COMPONENT',guid='08b6cbb5-36d0-4cce-9ac1-f3c719469623',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2159',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='9a734ad6-a96c-44dd-9e09-e1bf1671702b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2162',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='572e6fc5-1a87-461b-9c18-55b55eacafe4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2165',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='f6686385-c69d-45fb-931e-159e4d1d27be',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2168',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ba2ad505-e5c6-4f30-8b22-fc4d9cf46999',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-2171',nmfault='PISTON/VALVE PROBLEM',guid='f7f80eeb-249a-4b31-9e67-7eb1f9ba89bd',parfault=nil,fault='f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2174',nmfault='REPAIR/REPLACE',guid='f0f0dcf3-0386-4d09-b415-13065bcb0432',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2177',nmfault='REPAIR/REPLACE',guid='840558f5-1c05-48be-a535-ab55a365afa0',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2180',nmfault='REPAIR/REPLACE UNIT',guid='2b731131-f039-4790-8233-3a691923f8c9',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2183',nmfault='REPAIR/REPLACE UNIT',guid='a7d6c8aa-7483-4754-a0b6-03653d2f73a4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2186',nmfault='REPLACE BEARINGS',guid='97165205-a504-4c8d-834c-274193477d4c',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2189',nmfault='REPLACE BEARINGS',guid='b9261b7e-f6d2-4563-84fe-0129c8b35935',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2195',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='aea6e7fe-a869-48d9-9710-ada5ed4acc97',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2198',nmfault='IMBALANCE',guid='d3d52141-7388-40f7-b19c-44552cf44e3c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2201',nmfault='IMPELLER WEAR',guid='6bc01d47-4926-44a6-8550-8a4e899d6a89',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2204',nmfault='LOOSENESS',guid='ac420a7a-7a10-4a60-a47f-a78abaa3cfa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2207',nmfault='MASTER ISSUE BEARINGS',guid='c032419d-840c-4307-a30b-5b70e143fc13',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2210',nmfault='MASTER ISSUE BEARINGS',guid='ccf05f93-f778-476d-a920-c7003b120c6d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2213',nmfault='MASTER ISSUE COMPONENT',guid='0c2db9f5-2d6e-412e-99fd-2c52af0fd530',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2216',nmfault='MASTER ISSUE COMPONENT',guid='fe33b587-a046-4aed-89b9-451d46c085c8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2219',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3f2b02fa-e036-4af1-b2de-e614cb8a34ca',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2222',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0c86c049-fa1c-4f3b-9730-1813a6a89c1e',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2225',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ee99fbef-2234-4b63-be1d-0f2e5ea3f50e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2228',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fa4ac47b-2974-4a73-9486-05ca8193cb7e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2231',nmfault='REPAIR/REPLACE',guid='551e9b47-1f31-4464-bd1a-e7e9cc264b19',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2234',nmfault='REPAIR/REPLACE',guid='bc3da283-ce98-4f61-90ed-6ed544777253',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2237',nmfault='REPAIR/REPLACE UNIT',guid='76308d35-4a3b-4a19-992e-52c2c29f4811',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2240',nmfault='REPAIR/REPLACE UNIT',guid='80377097-583a-4908-a26d-236a2f2b5da7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2243',nmfault='REPLACE BEARINGS',guid='26d11be0-2a4e-42e7-b81f-800088c7a96a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2246',nmfault='REPLACE BEARINGS',guid='20ae74d4-1c0b-4f72-b70a-f5331e6e2b59',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-2249',nmfault='ROTOR RUB',guid='490cf670-a380-4ef3-b02c-34ceecca5719',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-2255',nmfault='BENT OR BOWED SHAFT',guid='06c0e94a-2524-4876-bd6f-ab2171b79c82',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2258',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9d2af9fb-002a-4cfc-bd46-e1ee86425a5e',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2261',nmfault='IMBALANCE',guid='ad45c239-7732-4626-a127-e3d01193e716',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2264',nmfault='IMPELLER WEAR',guid='9daa4219-69e4-4e50-9de1-60d3a304794b',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2267',nmfault='LOOSENESS',guid='d85a4fe6-4b5a-4af5-bc44-0408e9979eea',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2270',nmfault='MASTER ISSUE BEARINGS',guid='824d1227-c1f9-4216-84a8-df817f366afe',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2273',nmfault='MASTER ISSUE BEARINGS',guid='74ebe161-aa2f-4f68-9673-e13b01963ae3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2276',nmfault='MASTER ISSUE COMPONENT',guid='15e50f76-1249-427f-8c0f-d1c1e5579fa8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2279',nmfault='MASTER ISSUE COMPONENT',guid='a62c90f6-d3bb-4d04-9daf-ee6a21dc261f',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2282',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6b825bb7-4627-4f45-8ad4-a11bc5818b68',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2285',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='06defc3f-e77a-4d71-99a4-b13092deb333',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2288',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c8f6dd58-802c-4b3d-a808-6e42a8110fdb',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2291',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b50d660f-67d1-41f9-8527-0cd83d7ee2ab',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2294',nmfault='REPAIR/REPLACE',guid='8a11c149-d5da-4153-ba95-64e3085c4c4a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2297',nmfault='REPAIR/REPLACE',guid='48feae34-7d83-4354-b9ab-fc49be90c970',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2300',nmfault='REPAIR/REPLACE UNIT',guid='3ac6a43c-edf0-4527-84fd-a3795361d017',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2303',nmfault='REPAIR/REPLACE UNIT',guid='16fabfe2-8047-4ffc-b6ee-27bb008a6b8f',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2306',nmfault='REPLACE BEARINGS',guid='3a410ba5-a4e0-4025-b30a-adc5b9bec799',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2309',nmfault='REPLACE BEARINGS',guid='9fe8ed00-fe7b-4f65-a55b-c76e3993e100',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-2312',nmfault='ROTOR RUB',guid='8aef1f48-9ab0-4fd7-b9b7-54d2e45e30e9',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPIMPLR-BRG-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2318',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='78222db0-2954-4204-aee6-f698d34e9b92',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2321',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b6798ab5-8ee5-4f4b-bedf-29b32611820b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2324',nmfault='IMBALANCE',guid='a44d1920-83b6-4027-b1d9-961c0318cbb3',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2327',nmfault='IMPELLER WEAR',guid='4ce46fe9-3da7-49c7-8a89-d85cd4d29e51',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2330',nmfault='LOOSENESS',guid='b820d17a-6fb2-40a0-a817-dc1af698e14d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2333',nmfault='MASTER ISSUE BEARINGS',guid='89f554c8-f05e-44da-9990-2d696d232f97',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2336',nmfault='MASTER ISSUE BEARINGS',guid='aa9b2738-1abc-4604-ab34-c6b8958a299f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2339',nmfault='MASTER ISSUE COMPONENT',guid='8a4d944b-0fef-46f5-8f1e-c69b6da5b6d2',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2342',nmfault='MASTER ISSUE COMPONENT',guid='e9f7bf2f-42f7-4d75-93c6-4181afbbe2e6',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2345',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c5dcd472-9540-4200-a524-8f92380f4583',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2348',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2c59b357-57f9-4685-9754-ecf77ffe7cdb',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2351',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='473c394c-204f-421e-8888-6a485c8b92f0',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2354',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='260ccb5c-1b15-416b-9429-6fc047214ae1',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2357',nmfault='REPAIR/REPLACE',guid='e030d873-060d-4df4-a56b-173b70235e45',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2360',nmfault='REPAIR/REPLACE',guid='9934a790-08cf-4e34-9d7b-7147641b6ee9',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2363',nmfault='REPAIR/REPLACE UNIT',guid='34cc2ace-d6ef-476e-b3ec-da6c4627b429',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2366',nmfault='REPAIR/REPLACE UNIT',guid='ab1b74eb-8bdc-4c68-aa46-e4fbbc8661e0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2369',nmfault='REPLACE BEARINGS',guid='f396e372-a0c0-4d9d-8ed6-b5dff2f1fa9a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2372',nmfault='REPLACE BEARINGS',guid='63cf769d-66d9-4a70-8598-6cb8babc1562',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-2375',nmfault='ROTOR RUB',guid='9fcbd117-e9fe-4412-9c60-45cfc14dba8a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2381',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='9878bf10-dc21-4386-a395-dbe6d38fe6ab',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2384',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5958098b-cb66-4b65-bcd1-6a6e68794dd0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2387',nmfault='IMBALANCE',guid='59c96e58-f8aa-4829-8ab0-8ba10b7cb0ba',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2390',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='19ac858f-bd2a-45fd-95a8-10e2d552d180',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2393',nmfault='LOOSENESS',guid='6ba74dae-dd68-42c8-85bd-28e30fbbc022',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2396',nmfault='MASTER ISSUE BEARINGS',guid='4ba09cfc-e1e1-43df-8d85-e1d2c5294157',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2399',nmfault='MASTER ISSUE BEARINGS',guid='91eeb40b-e368-4c65-8ac4-eda60f4b6210',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2402',nmfault='MASTER ISSUE COMPONENT',guid='a03d8f00-dfb3-4540-97cc-7580d77bfb1e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2405',nmfault='MASTER ISSUE COMPONENT',guid='2a4dc047-9e40-4c34-8906-ec4ce92cf428',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2408',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5d20cb80-ab42-4087-acf5-fc6bd0572177',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2411',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0739a477-c788-4084-aa17-b258bd5c3817',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2414',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='84233691-1ef1-47ff-b4d9-53d98050cd7e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2417',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='62e1ae4c-1f89-4686-a9ec-f1c55672ec15',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2420',nmfault='REPAIR/REPLACE',guid='8865dbbf-7f1d-49d6-8c84-3bbf4ea27a43',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2423',nmfault='REPAIR/REPLACE',guid='eb09c64b-653c-4797-98bb-33627a397a4e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2426',nmfault='REPAIR/REPLACE UNIT',guid='b8686155-d002-44cd-a516-4f02da030e44',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2429',nmfault='REPAIR/REPLACE UNIT',guid='6ddb1aec-f52a-4180-86bf-b7c08387b1f5',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2432',nmfault='REPLACE BEARINGS',guid='6f7285b3-12e9-4aa0-863f-ea3d8b9d6ddf',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2435',nmfault='REPLACE BEARINGS',guid='7e80714c-9774-49db-8f7e-e995908dc149',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-2438',nmfault='ROTOR RUB',guid='d65135fc-3d4b-42a4-b469-7a454a800228',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPOIL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2444',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='d1bd88dd-d86a-46e5-9a06-81fc00dac115',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2447',nmfault='IMBALANCE',guid='852d1ed3-75a3-4665-ac95-da492da5e963',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2450',nmfault='LOOSENESS',guid='f46d84c6-f488-4b68-b37e-204c18d4ad07',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2453',nmfault='MASTER ISSUE BEARINGS',guid='b9229e59-6379-4723-92e8-b0f5e57bc0b0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2456',nmfault='MASTER ISSUE BEARINGS',guid='28f83c21-bf86-4607-b848-84035dc654d0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2459',nmfault='MASTER ISSUE COMPONENT',guid='abbf1ab8-3b96-4bc1-8d72-d66d55fcecda',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2462',nmfault='MASTER ISSUE COMPONENT',guid='ec120da6-1bd4-4a52-86ab-8bb59d75cfe8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2465',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8a4fde13-b375-45ba-b222-2cb845607209',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2468',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3aae831a-3b04-4bc8-8ed0-070df659bbc5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2471',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='509cc16a-08d3-471e-9755-cd037343e755',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2474',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='441ff9f1-9e0e-42da-a666-4e0104bda490',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2477',nmfault='REPAIR/REPLACE',guid='4104bc03-e163-4d00-b57f-637ebcde2e7b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2480',nmfault='REPAIR/REPLACE',guid='7a840726-9c30-46a1-bbc9-af65105be6c5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2483',nmfault='REPAIR/REPLACE UNIT',guid='5ab6cb40-5a83-46fc-8837-e8d4f903e9a5',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2486',nmfault='REPAIR/REPLACE UNIT',guid='fbe696e6-17dd-43e0-88d7-a087bbf71629',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2489',nmfault='REPLACE BEARINGS',guid='6adee730-9522-4541-8fca-39d60a619d12',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2492',nmfault='REPLACE BEARINGS',guid='4ebc9a1d-3331-4816-bdda-46877fdd0614',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPPSTNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2498',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='d53d9114-1ad4-4cb4-9253-01b0ffeb2111',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2501',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='382a38b2-986b-43f7-b2f3-d04115d0e343',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2504',nmfault='IMBALANCE',guid='ba64c51b-6d3a-46a3-9abf-a350f2817123',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2507',nmfault='LOOSENESS',guid='2e288434-4d0b-40de-a1ba-66e7016ad446',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2510',nmfault='MASTER ISSUE BEARINGS',guid='2e3d83a9-3edd-43ca-a59b-e83aaa0d2a13',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2513',nmfault='MASTER ISSUE BEARINGS',guid='b0fa0a9c-a82b-41b6-9a9c-d8c9d45f3762',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2516',nmfault='MASTER ISSUE COMPONENT',guid='fd36d273-287e-4c1a-b54d-b95546944b3e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2519',nmfault='MASTER ISSUE COMPONENT',guid='d98066a7-82fd-4e4d-b37e-57a27f2e8521',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2522',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a304f3d5-7122-4db7-bdfa-e49da9dd441f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2525',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e02bcb09-c6da-40cc-8911-7dd6a17f4f7f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2528',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2171319c-aacc-493f-9d18-175b97c6e78a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2531',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6343fcf4-512e-4a15-8d5e-abbbd23ada37',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-2534',nmfault='PISTON PROBLEM OR INTERNAL WEAR',guid='b3d1d3f5-8fa2-42b5-908e-49061851f225',parfault=nil,fault='c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2537',nmfault='REPAIR/REPLACE',guid='d1070326-7c6e-4ea5-8cee-8c5497f9e37d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2540',nmfault='REPAIR/REPLACE',guid='d06e6a1c-01d7-40a9-9eb7-0d56b568092c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2543',nmfault='REPAIR/REPLACE UNIT',guid='bc693a61-06b2-49b8-a0ef-19f13d255a8c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2546',nmfault='REPAIR/REPLACE UNIT',guid='1e05f436-41a2-45d9-b328-4d6c50d98ba4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2549',nmfault='REPLACE BEARINGS',guid='426a96af-eafa-4057-aedc-2b55117eb411',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2552',nmfault='REPLACE BEARINGS',guid='51e9ed0f-373f-4fda-92de-56c3d9f39ba0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPSCR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2558',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='8e548516-0c79-4ce2-aaba-7fc548304329',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2561',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8562aa6-5e7a-4809-8e43-d07328799de1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2564',nmfault='IMBALANCE',guid='6ef32f2d-c5fc-42f5-98a2-3ffc8034f11a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2567',nmfault='LOOSENESS',guid='beab5d52-14b1-411c-8758-fa80029b5fa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2570',nmfault='MASTER ISSUE BEARINGS',guid='aa7fe876-235a-4ce9-8521-3bd4ed5a2854',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2573',nmfault='MASTER ISSUE BEARINGS',guid='c41918cd-ebf9-41e3-9aea-0d9f8083ee82',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2576',nmfault='MASTER ISSUE COMPONENT',guid='7c085cad-e836-4618-9fd2-6c54edb9b8a0',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2579',nmfault='MASTER ISSUE COMPONENT',guid='674c4d2b-e85c-400f-9ace-1414832c6740',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2582',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cf380f2d-d98c-4c5a-8c81-a2e87563505a',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2585',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='749e28be-2840-411e-bce9-111974b8ec8d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2588',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='505571b8-51e8-4047-a092-28d3ca780225',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2591',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='597f525c-e91b-4250-bb2e-a59f1401df45',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2594',nmfault='REPAIR/REPLACE',guid='9755e78d-55f0-4d3a-8582-319ef04f09c6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2597',nmfault='REPAIR/REPLACE',guid='9aa8b00e-2c19-4574-b02a-ce43cf00acc4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2600',nmfault='REPAIR/REPLACE UNIT',guid='8fbcbc99-d485-4855-8621-9b3f9986d45a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2603',nmfault='REPAIR/REPLACE UNIT',guid='b765ac8b-1285-4725-b6c2-ba6c755cc5e1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2606',nmfault='REPLACE BEARINGS',guid='b0a9b40d-bc17-44a8-a7a5-11ef860a7377',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2609',nmfault='REPLACE BEARINGS',guid='07705059-3b0e-4a5e-b305-1c5a6b076a8b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2615',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='b9cb8669-01b3-4bd7-a1dc-3c901f62ae77',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2618',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='dec59f14-cac0-4668-b02d-e29265860567',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2621',nmfault='IMBALANCE',guid='6f651c4d-910d-48ce-b0eb-0472af2963de',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2624',nmfault='IMPELLER WEAR',guid='96ecdffd-40f2-4bfc-a835-7d654ac14ef1',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2627',nmfault='LOOSENESS',guid='4af232e5-6d33-4e17-acdb-1c5b90657fec',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2630',nmfault='MASTER ISSUE BEARINGS',guid='c9e023a5-3ab2-4667-a0d3-ef466c395e7e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2633',nmfault='MASTER ISSUE BEARINGS',guid='a88b691d-b689-407a-93c5-c901f66ce13e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2636',nmfault='MASTER ISSUE COMPONENT',guid='b8e8c030-8608-4651-854e-48c45f136824',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2639',nmfault='MASTER ISSUE COMPONENT',guid='873c96d0-d482-41d5-95a7-a7e56d68561a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2642',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b11a7293-670f-4085-bfcd-b6daefdc7dba',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2645',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ece5da55-0cf4-4348-a8d5-7f34c823de7c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2648',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='624f7d02-cec3-49cb-a1ad-69e2787aaff3',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2651',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1d8ed347-9724-4ef1-9226-ca5e6b5c2d9c',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2654',nmfault='REPAIR/REPLACE',guid='967ebb30-36ee-4ac0-b825-b4e543af22e4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2657',nmfault='REPAIR/REPLACE',guid='8d5171af-822a-42f5-a047-dfc6ad53c9a0',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2660',nmfault='REPAIR/REPLACE UNIT',guid='58fa8a92-3c1d-49b4-bb81-3e65758a90dc',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2663',nmfault='REPAIR/REPLACE UNIT',guid='99f59f94-7130-4228-9941-19783b7f6357',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2666',nmfault='REPLACE BEARINGS',guid='3443539a-2270-4080-81a0-c8be4f53c043',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2669',nmfault='REPLACE BEARINGS',guid='0e0b7fc9-582d-48ea-9535-a379386ca9c0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-CPLGFLEX-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-2675',nmfault='ANGULAR MISALIGNMENT',guid='45dfb368-bc5e-49ca-9469-91a6f907df97',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2678',nmfault='LOOSENESS',guid='71270616-07ef-4e86-83fe-be1a1f5a97ac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2681',nmfault='MASTER ISSUE BEARINGS',guid='3a6d855f-62da-4bc9-b053-3f9b01c61ced',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2684',nmfault='MASTER ISSUE BEARINGS',guid='a8525e52-6366-4641-b641-a07eb9114f60',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2687',nmfault='MASTER ISSUE COMPONENT',guid='d57c56b7-3056-4eaa-a3e4-150f093609b7',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2690',nmfault='MASTER ISSUE COMPONENT',guid='ee8794db-8e53-428f-a97c-ae2f454a1d00',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2693',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7e195089-cf0a-44bd-a422-c27d95f682d0',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2696',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4a4ae093-d383-428b-ab2c-6ff8a219743b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2699',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3ff91942-57ca-4edd-b18e-c8196c632082',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2702',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8f71016f-8db9-4850-90f2-5b810dddc1fc',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-2705',nmfault='PARALLEL MISALIGNMENT',guid='d91f37ca-d5e7-440b-8e35-8f104e459b8c',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2708',nmfault='REPAIR/REPLACE',guid='791144e2-2d74-407e-9c66-92e19f0d969e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2711',nmfault='REPAIR/REPLACE',guid='8e07c182-5bc7-4d1e-b544-8690914ed510',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2714',nmfault='REPAIR/REPLACE UNIT',guid='fd24cc0a-a16d-4fc5-b9d0-b4bd7ee5136e',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2717',nmfault='REPAIR/REPLACE UNIT',guid='2b01c4b5-8af8-4116-b8bd-633a15d9b19d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2720',nmfault='REPLACE BEARINGS',guid='b86e3605-4c98-4cb0-a628-3fb5a2e32afb',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2723',nmfault='REPLACE BEARINGS',guid='dc72f958-5454-4511-83f8-74d7e3fcdd79',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-GR-PMPOIL
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2729',nmfault='GEAR MESH PROBLEM',guid='c46d2d94-5569-43f9-a3fc-3d4dca4212e1',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2732',nmfault='MASTER ISSUE BEARINGS',guid='8a5c56bb-b1fd-4600-bf69-3aa471325888',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2735',nmfault='MASTER ISSUE BEARINGS',guid='2b2a9741-49f0-4cc7-9236-fcd4c81d97ea',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2738',nmfault='MASTER ISSUE COMPONENT',guid='652a706c-a4d3-4311-98e7-3167a27be00a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2741',nmfault='MASTER ISSUE COMPONENT',guid='dbeba7b9-0931-4bff-b14c-2cda8e32bf9b',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2744',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d4a53dba-6e7a-43cf-ad10-a68ede84e8a5',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2747',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='007b4141-8bbe-4177-8178-34ce0f6c2a68',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2750',nmfault='REPAIR/REPLACE',guid='6d10d024-80ca-4636-a380-803713e01ec6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2753',nmfault='REPAIR/REPLACE',guid='7b323700-dcc0-4706-a61f-0b247c819b6b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2756',nmfault='REPAIR/REPLACE UNIT',guid='b24c07bf-b997-4082-b813-f1fa4c0db82b',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2759',nmfault='REPAIR/REPLACE UNIT',guid='fc3cbd03-8242-466b-b483-74ecf7eec766',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2762',nmfault='REPLACE BEARINGS',guid='e399779d-1820-4247-b5cd-e57d6cc9a576',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2765',nmfault='REPLACE BEARINGS',guid='48a641dd-fe91-4082-b43b-a81b319f5a9d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PURIFIER-BRG-PURBWL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2771',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='a22370af-573c-47be-adc3-fbc8f1dfa289',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2774',nmfault='IMBALANCE',guid='ee76c3ea-c635-4f1c-9001-6db4bc386d27',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2777',nmfault='LOOSENESS',guid='4a28f8c1-650e-426b-9b1b-97fe3ad585e8',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2780',nmfault='MASTER ISSUE BEARINGS',guid='3e7cea52-6d46-44c4-a662-d5f2d789bde4',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2783',nmfault='MASTER ISSUE BEARINGS',guid='1865f2e5-211d-4a35-b441-bad81143c798',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2786',nmfault='MASTER ISSUE COMPONENT',guid='85c6b625-5d79-4414-83fd-1c26b8b794f8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2789',nmfault='MASTER ISSUE COMPONENT',guid='0802aebc-162b-4c4e-b2b2-2ff0201c9cf5',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2792',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d6ae42f6-5097-4753-9135-6e715d405994',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2795',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6aff58d2-f893-4ef2-be40-ab34e2168a35',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2798',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='42d470a6-3d77-4912-92e5-e8ade7b93957',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2801',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5bc37653-a80f-4cb4-a0bd-9c4041fdba25',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2804',nmfault='REPAIR/REPLACE',guid='47b10125-ba0a-4cb7-a9c8-7e6ed0d8de7f',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2807',nmfault='REPAIR/REPLACE',guid='6c9d5aeb-43da-499a-ab86-57d3d086adc7',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2810',nmfault='REPAIR/REPLACE UNIT',guid='46831ecf-f920-43cc-a50a-0c7a0ae6df73',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2813',nmfault='REPAIR/REPLACE UNIT',guid='35d1c165-306b-4524-a8fe-76f8811aefd4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2816',nmfault='REPLACE BEARINGS',guid='d614ceee-2740-4dd3-adeb-e808c3c99364',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2819',nmfault='REPLACE BEARINGS',guid='97ce74f5-9df4-4c17-a484-0b255a26a442',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-6-5-BRG-BRG-TURBNOZS-TURBVNS(6)-TURBSTTRBLS(5)-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2825',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='2a4a67ab-a5dc-40dd-9145-49392b178588',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2828',nmfault='IMBALANCE',guid='5db7f634-1835-4d8a-902f-192b4f986a36',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2831',nmfault='LOOSENESS',guid='321424d6-2d54-4b56-aab6-5397694bcd1d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2834',nmfault='MASTER ISSUE BEARINGS',guid='8ac6b79e-0a0f-4732-af71-a7074936a3c9',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2837',nmfault='MASTER ISSUE BEARINGS',guid='18b4df52-312f-4a5f-842f-872f65ecf716',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2840',nmfault='MASTER ISSUE COMPONENT',guid='942e2301-ad1e-44ae-8ab7-9c40af6c799a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2843',nmfault='MASTER ISSUE COMPONENT',guid='e4b7e01f-fc24-482c-9adc-4c381665da05',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2846',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='f3dc8b10-1815-4634-b6db-f7c5cecd218c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2849',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ad243189-14e7-4187-b4bc-5a27248a5db4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2852',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a54691a1-0a5e-49f7-951a-93307da27b89',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2855',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='45e414b2-5b49-4bf6-ba9f-b4c558361c64',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2858',nmfault='REPAIR/REPLACE',guid='c7e09a4b-5ed1-49e3-a05a-02c2a176a8ab',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2861',nmfault='REPAIR/REPLACE',guid='693d6e22-a75d-4939-9b5d-2c6732581ea1',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2864',nmfault='REPAIR/REPLACE UNIT',guid='5d217f25-a2df-4287-b06f-99a79019a7a3',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2867',nmfault='REPAIR/REPLACE UNIT',guid='4ac1b503-8353-4344-8c55-620377d75f9a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2870',nmfault='REPLACE BEARINGS',guid='6bf44ba5-cde5-47d4-b2e1-f6eb8b316a26',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2873',nmfault='REPLACE BEARINGS',guid='15013971-9b8d-4585-912d-8d913de8d1b9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-8-6-BRG-BRG-TURBNOZS-TURBVNS(8)-TURBSTTRBLS(6)-TURBNOZS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2879',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='047c0b80-b3bb-45a1-a84d-dcbdbe43ce18',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2882',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='58905a81-0584-45b1-88e0-9dcefe1b37b8',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2885',nmfault='IMBALANCE',guid='268675b0-d0fd-4ff3-86eb-3249a6ee39c6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2888',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='47aa2140-822c-4deb-b19c-5c07f811593f',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2891',nmfault='LOOSENESS',guid='24980177-3b57-4ea0-a125-0410a011fbe7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2894',nmfault='MASTER ISSUE BEARINGS',guid='a9a2b43b-2330-4634-8543-7c6104739038',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2897',nmfault='MASTER ISSUE BEARINGS',guid='ecaf2018-b815-4776-be4f-12b0fe91fc13',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2900',nmfault='MASTER ISSUE COMPONENT',guid='bdc1029a-f45e-4769-bc54-6c96596840e7',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2903',nmfault='MASTER ISSUE COMPONENT',guid='e9c058fe-11e5-417e-878f-7bec8a5c38bd',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2906',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='06c2e8c5-6243-4c70-9278-680b0bc09fd3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2909',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6dbf1414-62e1-44d5-b2cb-2cfbb6443d5f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2912',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='67cad4dd-072f-4934-9ea3-8db82d3c9363',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2915',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c72d6594-7749-4181-b6ce-791f4a7f1600',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2918',nmfault='REPAIR/REPLACE',guid='df9f0c24-a260-4b03-8f4d-e2a955e209d1',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2921',nmfault='REPAIR/REPLACE',guid='13f833c2-fd36-4430-a1af-aa409c527e74',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2924',nmfault='REPAIR/REPLACE UNIT',guid='9403dffb-d9fd-4cc0-b50f-e1d52ad14360',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2927',nmfault='REPAIR/REPLACE UNIT',guid='36aa10dd-553b-4952-9131-4ade88bbd5b0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2930',nmfault='REPLACE BEARINGS',guid='fd98c3e6-ecfa-44c1-879f-7a9f2663157c',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2933',nmfault='REPLACE BEARINGS',guid='b35f26a3-3701-4dba-942f-3b46598a7851',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-9-9-BRG-BRG-TURBNOZS-TURBSTTRBLS(9)-TURBVNS(9)-CPLGRGD-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2939',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='8fe12654-140c-4642-a913-78af7457584b',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2942',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='04c3838c-10bc-4b0e-a0b5-663cb7f7a89f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2945',nmfault='IMBALANCE',guid='0ad11ee6-e1c1-453c-aeb0-e3d4819b0d9b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2948',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='273f38bc-51b6-4294-baeb-d8746c690999',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2951',nmfault='LOOSENESS',guid='6bb6affb-35cb-44ae-af42-eb42824c43e6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2954',nmfault='MASTER ISSUE BEARINGS',guid='7b4f0f27-865e-4d57-b664-3e4b795f18a7',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2957',nmfault='MASTER ISSUE BEARINGS',guid='c316deb6-e5ea-4de9-81bd-a7844a1f0d8d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2960',nmfault='MASTER ISSUE COMPONENT',guid='4c727ecd-42fc-4610-9a8c-ad6e4361b70a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2963',nmfault='MASTER ISSUE COMPONENT',guid='e713ee63-c34a-4ef6-867c-71d1a1e7ca9f',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2966',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7c079cd4-3cf2-4b67-815b-03a1c393633a',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2969',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5b0e7d2c-5be4-4f3e-ac5a-5298f804eeb3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2972',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ae8d237e-f075-4ed2-bcdb-6794438c18fb',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2975',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1b648b9f-cb1c-46f3-952a-c0caa8ba386c',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2978',nmfault='REPAIR/REPLACE',guid='896a5cc8-1918-4f11-815e-6409bbc005ef',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2981',nmfault='REPAIR/REPLACE',guid='52548669-b8eb-4c91-bded-495aa1551e6b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2984',nmfault='REPAIR/REPLACE UNIT',guid='b2de8462-f585-4f95-add3-adfac126a3e6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2987',nmfault='REPAIR/REPLACE UNIT',guid='98da3ea7-3973-48a8-9422-c15937622635',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-2990',nmfault='REPLACE BEARINGS',guid='c4e69c73-0452-4475-b3ff-6f9622cb7b91',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2993',nmfault='REPLACE BEARINGS',guid='75aed2fc-b90b-4360-a051-cebf43844789',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-BRG-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2999',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='bc24cf44-2380-4f00-9316-49dc8d168889',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-3002',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1b7e602d-eead-41d6-98aa-68db35f618dd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-3005',nmfault='IMBALANCE',guid='fa1594a9-f328-4dfc-8eb6-ff5aa47bc288',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-3008',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='63a15986-df48-4e1d-90f0-3ffa177e28bf',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-3011',nmfault='LOOSENESS',guid='2eecc228-3202-46e5-9bbd-9634c45c1f80',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3014',nmfault='MASTER ISSUE BEARINGS',guid='37e46784-e3c6-4d31-a26f-6c7356cd77db',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-3017',nmfault='MASTER ISSUE BEARINGS',guid='917fe24d-736c-4262-8d4d-ff162391f423',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3020',nmfault='MASTER ISSUE COMPONENT',guid='83437f80-08f3-47f8-8bb4-4452584a46e4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-3023',nmfault='MASTER ISSUE COMPONENT',guid='023d2cfc-6646-4788-97ea-a3e516425d41',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3026',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0ebc73ae-87fd-419a-9e2e-ced48bf9a9f9',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-3029',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a630e5a0-ea2e-46c4-af25-6dd5ee257389',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3032',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ea1fee0d-7883-4652-b1c0-3903a8fce8fd',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-3035',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='05813ad6-ec74-4b5b-9086-42b78bf171ee',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3038',nmfault='REPAIR/REPLACE',guid='fef22289-6f11-4407-8b2f-b70794bf8661',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-3041',nmfault='REPAIR/REPLACE',guid='a6e9b36f-6166-46f5-b6b5-c58c1bf45c64',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3044',nmfault='REPAIR/REPLACE UNIT',guid='444785ba-cc5b-41fa-b6c6-3da689e057a6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-3047',nmfault='REPAIR/REPLACE UNIT',guid='e1b7667c-b449-4038-8d8d-75e271a1d69c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3050',nmfault='REPLACE BEARINGS',guid='a18179e4-8616-45b9-9756-06d77781a8e9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-3053',nmfault='REPLACE BEARINGS',guid='3861b693-0200-4bb6-808e-4d730281d49b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-3059',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='2a17187b-2755-404b-837d-8e11f5583145',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-3062',nmfault='IMBALANCE',guid='ac2813d1-f402-459f-8ebf-1be597cc84c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-3065',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='1eff9421-ed64-4760-8107-75fc48580bd6',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-3068',nmfault='LOOSENESS',guid='8612f33a-f5a8-4bce-bee1-4d05b2a270a5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3071',nmfault='MASTER ISSUE BEARINGS',guid='b47fcbef-8a6c-4706-8065-fb1e2a5e133d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-3074',nmfault='MASTER ISSUE BEARINGS',guid='7829ccbd-6db4-46e7-a0b6-f7fdbd8185ac',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3077',nmfault='MASTER ISSUE COMPONENT',guid='83c1b6eb-d3ca-4d91-9bee-bf714c159487',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-3080',nmfault='MASTER ISSUE COMPONENT',guid='0eb174c6-80d3-4156-9e3d-df08e24c9dab',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3083',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='f9b55497-3515-48b3-872c-fcb98040235b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-3086',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3282900e-5e93-44d2-84c9-61a797ae5858',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3089',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='977903a1-af00-4eb7-9605-e9ea837bb6fb',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-3092',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c7b923a3-df32-40f0-a76b-a9a80bc0015f',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3095',nmfault='REPAIR/REPLACE',guid='f5c15a20-4a2b-4291-b4ad-ed74f33aa79e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-3098',nmfault='REPAIR/REPLACE',guid='738988eb-199a-4f5c-bc08-dbee739d9ebe',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3101',nmfault='REPAIR/REPLACE UNIT',guid='8589a6be-2863-44d1-b48a-140825ffe2f1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-3104',nmfault='REPAIR/REPLACE UNIT',guid='f8c6a82c-fe14-49a0-9828-7a99e088fa9a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3107',nmfault='REPLACE BEARINGS',guid='cb014c99-33d4-4f38-8718-fe37c6ea92b6',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-3110',nmfault='REPLACE BEARINGS',guid='3320cd6f-3d74-45cd-a79e-b6908cd1cfe5',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-3116',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='5a2b8108-dd3f-485e-b80d-d155085c967f',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-3119',nmfault='IMBALANCE',guid='34363cfe-2d27-4f84-8659-5a06557451c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-3122',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='5b3cc0d6-2161-40cf-b4ee-a1fab5ee3381',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-3125',nmfault='LOOSENESS',guid='8cca57cc-1ea1-4ec0-b3ef-7e32fcaf392d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3128',nmfault='MASTER ISSUE BEARINGS',guid='45fbb957-0327-4ab1-9b33-8bd3df00d507',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-3131',nmfault='MASTER ISSUE BEARINGS',guid='e4c11438-f61e-44be-b4dc-55fa34a41733',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3134',nmfault='MASTER ISSUE COMPONENT',guid='6f5cb2e1-faca-462c-b5c9-fabd1b0fafe0',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-3137',nmfault='MASTER ISSUE COMPONENT',guid='e831aad9-24d9-4217-ade0-3a11feac1506',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3140',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='da4fef28-8009-4bf5-9d54-68a82dd8584e',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-3143',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d9441aeb-3f6f-4bf7-bdb0-11c7df2cd5e7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3146',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fcc88b5f-c991-4b38-b967-903ae621978b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-3149',nmfault='MONITOR MACHINE PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fed56138-2b27-4e77-b3aa-10e2d7738b0d',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3152',nmfault='REPAIR/REPLACE',guid='0a13a1fa-826c-4cc2-8651-e9e25bd96fb3',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-3155',nmfault='REPAIR/REPLACE',guid='5a5e4624-a5ef-47b8-b7dd-e9f854e94bea',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3158',nmfault='REPAIR/REPLACE UNIT',guid='cd2e145d-91aa-4c21-b3d5-7d78d5988894',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-3161',nmfault='REPAIR/REPLACE UNIT',guid='236bdc21-ac7e-4f24-9cfe-f179fd69b8c1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-3164',nmfault='REPLACE BEARINGS',guid='b04009d1-4301-41b0-a21f-d240333c3673',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-3167',nmfault='REPLACE BEARINGS',guid='c45919da-0d93-4895-91e3-8abb376965a8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

end
-- Recommedation Functions
function rec_2xlinefreq()
 local  check,f = get_fault( '035ec59f-95b4-4dda-9493-c074b8fc45a5') -- 2x LINE FREQUENCY
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_balance()
 local  check,f = get_fault( '0deaccad-1be8-4a9d-8b9a-8bb6bd492d57') -- ENGINE_ROTOR_BALANCE_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bb_noise()
 local  check,f = get_fault( '6cdff41a-29dd-41e3-818d-1396afc88d55') -- NOISE FLOOR FAULT (High Freq)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '1e93b5a5-a480-4e5f-8bf9-95635a1407b7') -- NOISE FLOOR FAULT (Mid Freq)
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_ff()
 local  check,f = get_fault( '56025dd9-2342-4a9f-9c5c-1067b8594ed8') -- BEARING_FF_FIT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '41bce26d-b044-47f2-aebe-a6c42a4a4ad0') -- BEARING_FF_THRUST_SHOE_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_re()
 local  check,f = get_fault( '4e904f5b-2c45-49d2-9aca-3b8daa0c397c') -- BEARING MISC TONES
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7796df29-c2cb-4ac7-9a55-3ca98eb22f62') -- BEARING_RE_BALL_SPIN_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '396aaab9-6e19-47bf-8a8c-75890a56aa66') -- BEARING_RE_INNER_RACE_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '52275357-989a-4fdb-b641-9e274b6998fe') -- BEARING_RE_OUTER_RACE_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_re_cocked()
 local  check,f = get_fault( 'a05f207e-712f-401f-8b50-1de7380669d5') -- BEARING RE COCKED FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bowed_rotor()
 local  check,f = get_fault( '6fb0a8d3-f05d-4db5-94ad-609198f42062') -- BENT OR BOWED SHAFT FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_component_wear_or_fit()
 local  check,f = get_fault( '37d17c46-b0f7-4ce6-b853-312709edcd3a') -- COMPRESSOR_ROTATING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a9bf4c2d-921d-4cd6-9749-f4c278546ab7') -- COMPRESSOR_STATIONARY_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'fa0eef50-bab6-4db5-aa36-5df5c2a47e7a') -- COUPLING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7506ade5-a3d8-4c78-90fc-650dcae59d85') -- FAN_ROTATING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7da464e6-0fd0-4a44-a5d2-1770964e52b4') -- FAN_STATIONARY_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ee338d62-ee72-4683-95da-b2d6b02c7f5a') -- GENERATOR_FAN_BLADE_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '57c9ac60-0949-4bf3-a632-5f3a3cf7e2d6') -- GENERATOR_SLIP_RING_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'e712797c-8ccb-466a-986b-0d659cf2acbe') -- GOVERNOR_ROTATING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ab1b7c89-69d9-46ac-95fd-a724048821be') -- MOTOR_FAN_BLADE_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '3f089323-1112-4d25-9f38-98fad1a9748b') -- PUMP_ROTATING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'cacf4d95-217c-4c8e-b3a3-e32a6d60e943') -- PUMP_STATIONARY_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '0a0ca7e0-6078-466e-a604-8254538babb0') -- TURBINE 1ST STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '3c0fb590-f772-4600-a6dc-d37248c6b461') -- TURBINE 1ST STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'bd403ab2-6609-45d1-8f26-2270fe5f8fce') -- TURBINE 2ND STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a21e2f01-f78d-48b2-81cd-7d618049a6a9') -- TURBINE 2ND STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '0cf04cf3-20cb-4767-b639-d868a36163ea') -- TURBINE 3RD STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '5be240e4-b0c0-4b00-bcdf-6be3148a4279') -- TURBINE 3RD STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '02c79b57-f641-4b2f-ac7b-329f99b00dcd') -- TURBINE 4TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f4a2d95c-7d9c-40e2-b75d-870f387b3cdd') -- TURBINE 4TH STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'e9223c7b-2917-40a6-9286-80964cf680a4') -- TURBINE 5TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '9581739c-118c-4ff1-9344-e2fdf17dae48') -- TURBINE 5TH STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '00cadd5d-4705-4cc5-8d91-67ac226e628a') -- TURBINE 6TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '5d283048-a1d6-4652-acb1-8990adc5952f') -- TURBINE 6TH STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '8abda45d-5785-456f-94a8-ab7d1a369afe') -- TURBINE 7TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '25d2c08a-0c79-46ef-826c-e70f0290a7b9') -- TURBINE 7TH STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'fafec8c4-9a26-42e1-b8a2-cd6150e8b413') -- TURBINE 8TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '948047e1-dc1e-4721-a26d-f613903f0bd9') -- TURBINE 8TH STAGE STATOR BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7190f684-d1df-4d9c-83cf-fa75632b07f1') -- TURBINE 9TH STAGE BLADING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '0bc84bd2-6c02-40a1-8a95-b1f11fab25f8') -- TURBINE NOZZLE CLEARANCE
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '2d53cfbe-ff4e-4520-a54a-5600ae8d96fd') -- TURBINE_ROTATING_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c2712a28-19a4-4bb4-a7c1-5b041c2e2475') -- TURBINE_STATIONARY_ELEMENT_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_coupling_angular_alignment()
 local  check,f = get_fault( '3f57cd7c-d728-4b7f-8019-f308059fb047') -- COUPLING_MISALIGN_ANGULAR_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_coupling_parallel_alignment()
 local  check,f = get_fault( '914ea641-4570-4d07-ad0c-d25ddeb17ec6') -- COUPLING_MISALIGN_PARALLEL_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_data_check()
 local  check,f = get_fault( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ca0a76af-7c5a-4b25-9a9f-078027ad6810') -- DATA MISSING
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a3cd43b6-4fdc-4764-8186-3508c37e5cdd') -- DATA MISSING - NO SPECTRAL DATA
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '26477670-693a-4e5b-a17d-27eb1747ddc0') -- DATA PROBLEM - HIGH NOISE LEVELS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ee3a6ea3-605e-4d09-9b07-80ddcfb480f1') -- DATA PROBLEM - LOW NOISE LEVELS
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_gear_mesh()
 local  check,f = get_fault( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR MESH FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR_MESH_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_looseness()
 local  check,f = get_fault( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '967b15a5-923c-4231-84c0-41ad7cb06c81') -- LOOSENESS FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_oil_whirl()
 local  check,f = get_fault( 'acc257ad-914e-48c7-8982-62678618d2cd') -- BEARING_FF_FLUID_WEDGE_STABILITY_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_piston_problem()
 local  check,f = get_fault( '8f433851-5044-4eeb-8d62-d252c754e6ae') -- ENGINE_PISTON_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '278077ab-a350-42d7-837e-78bec041a455') -- PUMP_PISTON_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_rotor_bars()
 local  check,f = get_fault( 'a523ae6b-1815-4a01-a8d3-83449a251dd8') -- GENERATOR_ROTOR_BAR_FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'aea1a9c8-de2a-48c4-a5fb-e94701180056') -- MOTOR_ROTOR_BAR_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_rotor_rub()
 local  check,f = get_fault( '016820d4-63ba-4177-bc69-73e25737368c') -- ROTOR RUB
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_ski_slope()
 local  check,f = get_fault( '4c8a0012-c1ba-46e9-88b4-ea4236de1a92') -- NOISE FLOOR FAULT (LowFreq)  SKI SLOPE
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_softfoot()
 local  check,f = get_fault( 'f2ef6d94-a6c7-4ab5-a127-7903420a362c') -- MOTOR_SOFTFOOT_FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_speed_change()
 local  check,f = get_fault( '9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a') -- DATA NORMALIZATION - SPEED CHANGE 
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_speed_out_of_range()
 local  check,f = get_fault( 'dd71dc8c-7dfe-49a7-9c9c-59dc560c285c') -- DATA NORMALIZATION - SPEED OUT OF RANGE
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_total_speed_deviation()
 local  check,f = get_fault( '5ba9638c-72f2-4c20-ada0-299eeee6faa5') -- DATA NORMALIZATION - TOTAL SPEED DEVIATION
    if check then return setseverity(f.severity)  end 

  return false
end
-- SPECIAL Recommedation Functions----------
function rec_master_bearing_3_issue()
 local t={}
 local tcount=0
 local  check,recs = get_rec_mine ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
  if check then tcount=tcount+1  t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=recs   end 
  check,recs = get_rec_mine ( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
  if check then tcount=tcount+1  t['87b85d6b-0f55-41cd-a9c6-44b2e82dd359']=recs   end 
  check,recs = get_rec_mine ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then tcount=tcount+1  t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=recs   end 
  check,recs = get_rec_mine ( '1a4eb45a-9771-4a1e-8d94-36736c8db15f') -- BEARING NOISE
  if check then tcount=tcount+1  t['1a4eb45a-9771-4a1e-8d94-36736c8db15f']=recs   end 
  check,recs = get_rec_mine ( '079d3155-0e02-4d7a-bc6e-5f140063e911') -- BEARING OR ROTOR MISALIGNMENT
  if check then tcount=tcount+1  t['079d3155-0e02-4d7a-bc6e-5f140063e911']=recs   end 
  check,recs = get_rec_mine ( '8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286') -- BEARING SHELL LOOSENESS
  if check then tcount=tcount+1  t['8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286']=recs   end 
  check,recs = get_rec_mine ( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
  if check then tcount=tcount+1  t['6cb8d78c-6831-4916-b327-c359d72597d2']=recs   end 
  check,recs = get_rec_mine ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then tcount=tcount+1  t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=recs   end 
  check,recs = get_rec_mine ( 'd4c1477a-ffdb-4b8f-8407-a1e47f01d504') -- BEARING WEAR OR FLOW NOISE
  if check then tcount=tcount+1  t['d4c1477a-ffdb-4b8f-8407-a1e47f01d504']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(-1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_bearing_5_monitor()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '07c375f4-1c8c-4939-a32e-140e500ae6dc') -- MASTER ISSUE BEARINGS
  if check then tcount=tcount+1  t['07c375f4-1c8c-4939-a32e-140e500ae6dc']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev == 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_bearing_5_replace()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '07c375f4-1c8c-4939-a32e-140e500ae6dc') -- MASTER ISSUE BEARINGS
  if check then tcount=tcount+1  t['07c375f4-1c8c-4939-a32e-140e500ae6dc']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev > 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_4_issue()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '5918ca91-0da0-4dc8-bf37-8f29816aa3b6') -- AIR FLOW DISTURBANCE
  if check then tcount=tcount+1  t['5918ca91-0da0-4dc8-bf37-8f29816aa3b6']=recs   end 
  check,recs = get_rec ( '2dd50782-f1fe-4be1-bca4-85318f0d9dac') -- ANGULAR MISALIGNMENT
  if check then tcount=tcount+1  t['2dd50782-f1fe-4be1-bca4-85318f0d9dac']=recs   end 
  check,recs = get_rec ( 'be5266a6-c247-4fe9-9d50-45a9dadfdfe6') -- BENT OR BOWED SHAFT
  if check then tcount=tcount+1  t['be5266a6-c247-4fe9-9d50-45a9dadfdfe6']=recs   end 
  check,recs = get_rec ( '032124cf-ca67-496d-9904-06cf823372db') -- COMPONENT WEAR OR FIT
  if check then tcount=tcount+1  t['032124cf-ca67-496d-9904-06cf823372db']=recs   end 
  check,recs = get_rec ( '58b56ba2-97ed-4304-b3b2-41f8c61fa6c5') -- COUPLING ROLLING CONTACT BEARING WEAR
  if check then tcount=tcount+1  t['58b56ba2-97ed-4304-b3b2-41f8c61fa6c5']=recs   end 
  check,recs = get_rec ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COUPLING WEAR
  if check then tcount=tcount+1  t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec ( '67a4f244-e1c2-42d0-9f39-c96c8b95a0c5') -- FAN BLADING PROBLEM
  if check then tcount=tcount+1  t['67a4f244-e1c2-42d0-9f39-c96c8b95a0c5']=recs   end 
  check,recs = get_rec ( 'fe20b5e9-a8a3-41f6-8b78-947cb017afc0') -- FAN PROBLEM
  if check then tcount=tcount+1  t['fe20b5e9-a8a3-41f6-8b78-947cb017afc0']=recs   end 
  check,recs = get_rec ( '77ba2ad3-e48d-42cb-8184-6749c7b7edff') -- FOUNDATION TRANSVERSE FLEXIBILITY
  if check then tcount=tcount+1  t['77ba2ad3-e48d-42cb-8184-6749c7b7edff']=recs   end 
  check,recs = get_rec ( '15dd5685-db85-4229-aa66-5374ec9a4b4c') -- GEAR MESH PROBLEM
  if check then tcount=tcount+1  t['15dd5685-db85-4229-aa66-5374ec9a4b4c']=recs   end 
  check,recs = get_rec ( 'ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
  if check then tcount=tcount+1  t['ca47a73c-f659-460c-8b5a-2753dcba9f0f']=recs   end 
  check,recs = get_rec ( '1be9cafa-cce0-465b-88d9-31c6e4313277') -- IMPELLER OR GUIDE VANE PROBLEM
  if check then tcount=tcount+1  t['1be9cafa-cce0-465b-88d9-31c6e4313277']=recs   end 
  check,recs = get_rec ( '95f4ac86-31f8-4de9-80a2-a0583156a599') -- IMPELLER WEAR
  if check then tcount=tcount+1  t['95f4ac86-31f8-4de9-80a2-a0583156a599']=recs   end 
  check,recs = get_rec ( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
  if check then tcount=tcount+1  t['4c5d657f-0c77-4afc-a400-490b9b1dc900']=recs   end 
  check,recs = get_rec ( '07c375f4-1c8c-4939-a32e-140e500ae6dc') -- MASTER ISSUE BEARINGS
  if check then tcount=tcount+1  t['07c375f4-1c8c-4939-a32e-140e500ae6dc']=recs   end 
  check,recs = get_rec ( '3c1814d5-4159-40fb-a152-bcf9edb1d036') -- MOTOR COMMUTATOR PROBLEM OR BRUSH WEAR
  if check then tcount=tcount+1  t['3c1814d5-4159-40fb-a152-bcf9edb1d036']=recs   end 
  check,recs = get_rec ( 'cf3d8007-dadd-4141-91f5-4acf1532a70b') -- PARALLEL MISALIGNMENT
  if check then tcount=tcount+1  t['cf3d8007-dadd-4141-91f5-4acf1532a70b']=recs   end 
  check,recs = get_rec ( 'c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e') -- PISTON PROBLEM OR INTERNAL WEAR
  if check then tcount=tcount+1  t['c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e']=recs   end 
  check,recs = get_rec ( 'f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7') -- PISTON/VALVE PROBLEM
  if check then tcount=tcount+1  t['f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7']=recs   end 
  check,recs = get_rec ( 'c6baeeb5-da48-4c52-9c38-2dc231640a0d') -- ROTOR IMBALANCE
  if check then tcount=tcount+1  t['c6baeeb5-da48-4c52-9c38-2dc231640a0d']=recs   end 
  check,recs = get_rec ( '2bcb79a6-dc2d-4d42-8dbe-d51c22e739dd') -- ROTOR LOOSENESS
  if check then tcount=tcount+1  t['2bcb79a6-dc2d-4d42-8dbe-d51c22e739dd']=recs   end 
  check,recs = get_rec ( '2ee46dd5-7600-4050-9891-159e6ee4c2e2') -- ROTOR RUB
  if check then tcount=tcount+1  t['2ee46dd5-7600-4050-9891-159e6ee4c2e2']=recs   end 
  check,recs = get_rec ( '1859b6aa-10a7-4370-8c5f-b3125744b7dd') -- ROTOR THREAD WEAR
  if check then tcount=tcount+1  t['1859b6aa-10a7-4370-8c5f-b3125744b7dd']=recs   end 
  check,recs = get_rec ( '3359e924-d17c-41ea-875b-b9f4dde17753') -- ROTOR THRUST PROBLEM
  if check then tcount=tcount+1  t['3359e924-d17c-41ea-875b-b9f4dde17753']=recs   end 
  check,recs = get_rec ( '4712f775-3db7-4aaa-8ffb-91022531f145') -- ROTOR WEAR
  if check then tcount=tcount+1  t['4712f775-3db7-4aaa-8ffb-91022531f145']=recs   end 
  check,recs = get_rec ( '08620f78-b767-45e5-9d29-5f78ab6452f6') -- RUBBING AND/OR IMPACTING
  if check then tcount=tcount+1  t['08620f78-b767-45e5-9d29-5f78ab6452f6']=recs   end 

    if tcount >= 2 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(-1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_5_monitor()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '5cda18ea-32dd-4fca-92d2-b393ab13967b') -- MASTER ISSUE COMPONENT
  if check then tcount=tcount+1  t['5cda18ea-32dd-4fca-92d2-b393ab13967b']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev == 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_5_replace()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '5cda18ea-32dd-4fca-92d2-b393ab13967b') -- MASTER ISSUE COMPONENT
  if check then tcount=tcount+1  t['5cda18ea-32dd-4fca-92d2-b393ab13967b']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev > 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_6_replace_unit()
 local t={}
 local tcount=0
 local   check,recs = get_rec_all ( '4c4b2e36-017d-4a45-8a6c-8e83e011de19') -- REPAIR/REPLACE
  if check then tcount=tcount+1  t['4c4b2e36-017d-4a45-8a6c-8e83e011de19']=recs   end 
  check,recs = get_rec_all ( '38ce4bb1-1b2d-47b4-86f9-574f2580c90a') -- REPLACE BEARINGS
  if check then tcount=tcount+1  t['38ce4bb1-1b2d-47b4-86f9-574f2580c90a']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev > 2 and tcount > 1  then
     -- maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      --assert2(maxsev) --Severity
     -- assert3(1) --Confidence
     -- return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_electrical_2_issue()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '035ec59f-95b4-4dda-9493-c074b8fc45a5') -- 2x LINE FREQUENCY
  if check then tcount=tcount+1  t['035ec59f-95b4-4dda-9493-c074b8fc45a5']=recs   end 
  check,recs = get_rec ( '46856e29-4243-41aa-9d84-e9aa47b6bda1') -- ARMATURE LOOSENESS
  if check then tcount=tcount+1  t['46856e29-4243-41aa-9d84-e9aa47b6bda1']=recs   end 
  check,recs = get_rec ( '955ee097-f1c1-4071-8216-c15920e30dd0') -- Change in Phase
  if check then tcount=tcount+1  t['955ee097-f1c1-4071-8216-c15920e30dd0']=recs   end 
  check,recs = get_rec ( 'f281a670-fc4a-473d-8be8-fe11b33b4a7f') -- EXCITER BEARING WEAR OR CLEARANCE PROBLEM
  if check then tcount=tcount+1  t['f281a670-fc4a-473d-8be8-fe11b33b4a7f']=recs   end 
  check,recs = get_rec ( 'e7d3e492-b63d-4f08-8f37-e9f09f94de23') -- EXCITER COMMUTATOR OR STATOR PROBLEM
  if check then tcount=tcount+1  t['e7d3e492-b63d-4f08-8f37-e9f09f94de23']=recs   end 
  check,recs = get_rec ( 'bc3ff20f-4477-433a-a2f1-f0f6acfbf71e') -- EXCITER IMBALANCE
  if check then tcount=tcount+1  t['bc3ff20f-4477-433a-a2f1-f0f6acfbf71e']=recs   end 
  check,recs = get_rec ( '1ba38459-5c1b-4b17-b197-0caad40f2b14') -- GENERATOR COMMUTATOR OR STATOR PROBLEM
  if check then tcount=tcount+1  t['1ba38459-5c1b-4b17-b197-0caad40f2b14']=recs   end 
  check,recs = get_rec ( '91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9') -- MOTOR STATOR PROBLEM OR ABNORMAL ELECTRICAL LOAD
  if check then tcount=tcount+1  t['91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9']=recs   end 
  check,recs = get_rec ( 'd2f11a71-b86d-45c3-8cc3-0f35003f6df2') -- MOTOR WINDING FAULT OR ELECTRICAL PHASE IMBALANCE
  if check then tcount=tcount+1  t['d2f11a71-b86d-45c3-8cc3-0f35003f6df2']=recs   end 
  check,recs = get_rec ( '4119ce9c-7860-4da6-9007-1826d3209396') -- ROTOR BAR PROBLEM
  if check then tcount=tcount+1  t['4119ce9c-7860-4da6-9007-1826d3209396']=recs   end 
  check,recs = get_rec ( '44129fbe-1335-4cb7-879c-d9a64a3ce57e') -- ROTOR CRACK
  if check then tcount=tcount+1  t['44129fbe-1335-4cb7-879c-d9a64a3ce57e']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(-1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_electrical_3_problem()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '3cf72064-f881-49ad-812b-0ce10c24b0f3') -- MASTER ISSUE ELECTRICAL
  if check then tcount=tcount+1  t['3cf72064-f881-49ad-812b-0ce10c24b0f3']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev == 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
