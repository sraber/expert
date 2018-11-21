-- Created Date: 10/24/2018 1:06:14 PM
function load_rec_rules(g_rec_rules)
g_datanormalizationerrorguid='4d535592-5633-4a3d-92e5-c9ac0453294f'
-- **************************************
-- BEARING-FLUID-FILM
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-11',nmfault='BEARING FIT PROBLEM',guid='4f161dc7-7dee-4640-b9a7-ec4672220917',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-14',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='1495b277-8de5-40cc-90ba-8843d83fcecf',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-17',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='5a65545d-818f-4756-9df1-9363afa985d5',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-20',nmfault='JOURNAL BEARING OIL WHIRL',guid='5e6a4836-7434-43ff-8040-e520d12d5c3a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-23',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='2eed1d84-e0fb-4364-a2ef-dad055c5119e',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-26',nmfault='SPEED CHANGE',guid='9d2a93ba-59b7-401b-b9d8-09773ab9f19f',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-29',nmfault='SPEED DEVIATION',guid='f94c9e25-62b4-465d-9a95-4972c626a066',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-32',nmfault='SPEED OUT OF RANGE',guid='fe8d14fd-3ed5-4e51-a787-0b4bf5753454',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-RADIAL-THRUST
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-38',nmfault='BEARING FIT PROBLEM',guid='b7359e6d-630d-4911-94c2-61dad93d4c4e',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-41',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='fff0cfef-61dd-4917-b023-a0478dd97013',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-44',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='300aca6d-9d92-442f-9457-945213e4e419',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-47',nmfault='JOURNAL BEARING OIL WHIRL',guid='dd68d3d3-0d56-43ee-8dc9-0da4ebdd611a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-50',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='db8f1fc2-806d-48f8-b7d2-a01f7536cb26',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-53',nmfault='SPEED CHANGE',guid='8ebd938e-6c30-4bd1-b6f9-2a8ceea0045c',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-56',nmfault='SPEED DEVIATION',guid='3c24e2cb-6fd7-41ef-85b2-ab79b5390a65',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-59',nmfault='SPEED OUT OF RANGE',guid='5f3c7c8b-3ac7-42a9-8d6e-5942f77f8fa7',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-THRUST
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-65',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='7e358750-0732-418f-a4a9-7e43965170bd',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-68',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='a75472bb-3b5d-49e1-8ee0-84ff5b968cab',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-71',nmfault='JOURNAL BEARING OIL WHIRL',guid='7ffc7e53-bb1b-40ff-8519-8c8a02d9b968',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-74',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='bc765917-bace-4b58-b3f9-25fca1f14118',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-77',nmfault='SPEED CHANGE',guid='429306cc-3e3f-4f5b-9d0d-9a7e753ec7c6',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-80',nmfault='SPEED DEVIATION',guid='d90d962c-974c-4de5-a2fa-9f136b7a9c4b',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-83',nmfault='SPEED OUT OF RANGE',guid='6901214d-d1e3-4311-a4f3-32269fdb1715',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-86',nmfault='THRUST BEARING PROBLEM',guid='573c21dc-5a30-44e0-b53b-7b2ca35ea029',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT
---- BEARING WEAR
table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-92',nmfault='BEARING WEAR',guid='b95e0138-8bc2-412e-b20b-80d01c8a4770',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-95',nmfault='BEARING WEAR OR FLOW NOISE',guid='149dddda-4ac6-46ff-a586-74309d57aa99',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-98',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='90b74dd2-1d70-4468-a113-85a140d62aca',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-101',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='5ddd3e6f-4329-4b73-b9d6-f220bce81b07',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-104',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='4c7f2861-8a67-4ffe-bba6-5cc6fec1a338',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-107',nmfault='SPEED CHANGE',guid='3ce85a37-e3f4-42b2-aeca-602b4691e36b',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-110',nmfault='SPEED DEVIATION',guid='74db7e85-bb2e-42d9-bfd6-0e3921ea0c0b',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-113',nmfault='SPEED OUT OF RANGE',guid='486ccb7a-0577-46c9-9fde-edb8b822a345',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX
---- BEARING WEAR
table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-119',nmfault='BEARING WEAR',guid='39fe17b2-9d45-4689-8986-241c73115887',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-122',nmfault='BEARING WEAR OR FLOW NOISE',guid='3df6ee09-59fc-4f48-ace0-3d629b528a2c',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-125',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='769b55a6-4394-4fc6-b6c5-05e27c7527a3',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-128',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='13d49e56-943e-4437-a1a5-002a9bcf50dd',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-131',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='fc500df0-1e41-4854-a4fa-32055ceab58d',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-134',nmfault='SPEED CHANGE',guid='2c4d5a21-64a6-4892-bc14-7239a2930f76',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-137',nmfault='SPEED DEVIATION',guid='f8fa1049-7d22-43bb-908f-62f857984f74',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-140',nmfault='SPEED OUT OF RANGE',guid='d76dc4db-34a1-4069-a54c-f20713dd6c07',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX-THRUST
---- BEARING WEAR
table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-146',nmfault='BEARING WEAR',guid='8c598591-2940-4e3e-a5a8-1d0d69550ae9',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-149',nmfault='BEARING WEAR OR FLOW NOISE',guid='5337b4cd-f6ac-48c6-8bf9-0b59ec51fe1b',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-152',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='b3da90f5-d670-474c-9d3b-b5cf4483fb36',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-155',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='670b057c-4db1-4df1-944a-bb754f540401',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-158',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='19d47dca-cbfd-4b93-a537-f9d4017fd762',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-161',nmfault='SPEED CHANGE',guid='c9c085cf-b7e1-4f87-b662-06d4f41b56c7',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-164',nmfault='SPEED DEVIATION',guid='089eec33-dfd4-4501-a582-73e9b35ac0a6',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-167',nmfault='SPEED OUT OF RANGE',guid='144a9eaf-3bad-412a-9da0-6128c666bebb',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-THRUST
---- BEARING WEAR
table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-173',nmfault='BEARING WEAR',guid='8687cc72-a6bf-4f91-9266-e44a120dfb50',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-176',nmfault='BEARING WEAR OR FLOW NOISE',guid='36af5026-d766-4d24-827f-1fe603487c41',parfault=nil,fault='d4c1477a-ffdb-4b8f-8407-a1e47f01d504',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-179',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c0f9f4e2-ff3a-4fb0-8585-e10ddac9fcd0',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_normalization() end
  ,nmrule='RecRuleLine-182',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='22b5a0de-4046-42ac-964c-918fb1b05dc2',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-185',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='47d9fa6a-0547-4ec4-8d1b-4d93ca41cd61',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-188',nmfault='SPEED CHANGE',guid='0460845b-34d3-4672-99a1-64e0fee4a1fb',parfault=nil,fault='ccc41a02-93ce-4b1b-91aa-3e5905486bea',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-191',nmfault='SPEED DEVIATION',guid='d94fcf4b-4af1-434b-88f8-6a02804e5b49',parfault=nil,fault='60f4af86-79bc-4c5e-ae6f-4a94753c3987',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-194',nmfault='SPEED OUT OF RANGE',guid='4ecd847f-de74-49da-a0ab-c84d953cf346',parfault=nil,fault='c9b87db6-cfa2-479c-ba2a-4e8f1e38aa91',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CL-GR
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-200',nmfault='IMBALANCE',guid='444cdbef-59fd-424d-a2c1-9b9ca34a1449',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-203',nmfault='LOOSENESS',guid='843bebaf-82a6-4e1e-be30-27f59a067fb2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CPLGFLEX-CL-BRG-BRG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-209',nmfault='ANGULAR MISALIGNMENT',guid='e8278824-b07e-4065-b1a6-d69adf4faffe',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-212',nmfault='IMBALANCE',guid='7199f4e7-1c9d-43b7-8963-943528ed16b9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-215',nmfault='PARALLEL MISALIGNMENT',guid='6a5b5d89-d160-4c1e-8460-aaa6acd0198b',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-BRG-CPRSRVNS-CPRSRSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-221',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3d8b7744-0172-4a2f-8f92-1b74d6b30b6c',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-224',nmfault='IMBALANCE',guid='ed1a81ce-5bb9-4bb8-bc83-2dd3ee7c6083',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-227',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='da187920-67b1-459d-b070-bebe685e74e2',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-230',nmfault='LOOSENESS',guid='103a00a6-ce21-4203-bf25-8710f5c61d0c',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-236',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='55641e73-a958-427e-ad3f-9eee7c5791b3',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-239',nmfault='IMBALANCE',guid='78133759-9e19-4744-96b6-baee54af259c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-242',nmfault='IMPELLER WEAR',guid='488f1b74-939d-46cd-a0a6-03f33394cb79',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR-CPRSRSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-248',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8f639c2-1c8b-4af3-80b4-d177252cabd2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-251',nmfault='IMBALANCE',guid='67d86db1-a682-4008-b4b1-2a51246706a0',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-254',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='2aa3823c-d56d-4557-a4de-9b0296674dee',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-260',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='63392c64-bd7d-42a6-bbc1-80f89b5c377a',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-263',nmfault='LOOSENESS',guid='80c1d077-2108-4e48-bd2d-a0981a830fc5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-266',nmfault='PISTON PROBLEM OR INTERNAL WEAR',guid='8bc446e1-ae47-4ebf-9cc2-eec9094014c0',parfault=nil,fault='c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-GR-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-BRG-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-272',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='11b43300-713b-4630-8ea3-a2cc827e1ec9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-275',nmfault='IMBALANCE',guid='89cb4de0-3df7-4f7b-8a5a-5888fd841add',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-278',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='c9b6cdcd-c095-4fd6-a1e0-a6af1c7b278d',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-281',nmfault='LOOSENESS',guid='2b4316bf-1330-45a7-ab8c-d66c6990957e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-GR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-287',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1ee5d843-0960-44f4-a573-c7864c1bac22',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-290',nmfault='IMBALANCE',guid='1268b13c-1045-4240-bf10-b8d19b5913c1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-293',nmfault='IMPELLER WEAR',guid='affadf89-44e6-4935-b535-87adbb814e09',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-296',nmfault='LOOSENESS',guid='eeb2b505-87bf-4d64-97ab-65cfb3258a01',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-302',nmfault='ANGULAR MISALIGNMENT',guid='7e346d1f-a6f1-4073-93ac-21569969d488',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-305',nmfault='COUPLING WEAR',guid='49f2b0c2-14d8-4660-a3aa-52a13bbefe7c',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-308',nmfault='IMBALANCE',guid='f0fdcb0b-3b6d-4b10-9196-a92eb5bfed9a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-311',nmfault='PARALLEL MISALIGNMENT',guid='f7cb3992-c161-4f72-b4f5-b6543bf05ea5',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-317',nmfault='ANGULAR MISALIGNMENT',guid='35d37b51-2b81-4605-9d60-fe4db973f00c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-320',nmfault='COUPLING WEAR',guid='8bb98bd2-1b3e-4741-b0ce-89f76ce6a394',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-323',nmfault='IMBALANCE',guid='cce3536f-f11c-48d2-bfae-9150c027a897',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-326',nmfault='PARALLEL MISALIGNMENT',guid='cb4d926d-8f4e-4483-9322-54771f52a99e',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGMAG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-332',nmfault='ANGULAR MISALIGNMENT',guid='ca2c11a4-242f-49d1-8793-b3d417ad5708',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-335',nmfault='PARALLEL MISALIGNMENT',guid='372beb25-b639-443c-a14f-8e8e5ac62402',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-341',nmfault='ANGULAR MISALIGNMENT',guid='4bf65b6b-0dc8-4303-8edd-fcf14170cd1c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-344',nmfault='COUPLING ROLLING CONTACT BEARING WEAR',guid='1cddfa92-cd03-4ffd-bcfa-cfc87a3295be',parfault=nil,fault='58b56ba2-97ed-4304-b3b2-41f8c61fa6c5',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-347',nmfault='COUPLING WEAR',guid='d32674ed-be4c-4c49-bf96-a443a13b8e0a',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-350',nmfault='IMBALANCE',guid='d96d74a4-a10a-4fe6-942e-f576c6f78901',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-353',nmfault='PARALLEL MISALIGNMENT',guid='741e4ff5-ebe0-4474-b179-aeabbd817e3d',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-359',nmfault='ANGULAR MISALIGNMENT',guid='0299305e-31d1-46a1-9858-c188ad2cabbc',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-362',nmfault='COUPLING WEAR',guid='25da81dd-b81e-4a5f-9a16-65cee3d6ca2b',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-365',nmfault='IMBALANCE',guid='e279e877-5049-48e6-9c03-ec4d9d81a27f',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-368',nmfault='PARALLEL MISALIGNMENT',guid='9443959e-2a3a-4a3b-903f-f318051b3132',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-374',nmfault='ANGULAR MISALIGNMENT',guid='c76445e6-b371-4ef7-bd5a-53d34ad388af',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-377',nmfault='COUPLING WEAR',guid='f83dc2f7-def7-40b6-b92b-7742be9bf4e3',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-380',nmfault='IMBALANCE',guid='0e441296-4fef-4b7f-9673-773078f930bc',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-383',nmfault='PARALLEL MISALIGNMENT',guid='fdf23620-e3b6-405a-8366-283267804ff9',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- ENGINE-BRG-MOTPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-389',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fa336801-204d-48f4-9943-c6734567ddbd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-392',nmfault='IMBALANCE',guid='a7623820-352d-44f2-965f-b02b7bdde917',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-395',nmfault='LOOSENESS',guid='8092685c-b95a-4e55-89cc-3516d983dbb7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-398',nmfault='PISTON/VALVE PROBLEM',guid='cdb7650c-a881-4f80-9132-220d0ab3997a',parfault=nil,fault='f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANHTSLGR-FANVNS
---- FAN BLADING PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-404',nmfault='FAN BLADING PROBLEM',guid='9b9d0db4-46dd-426b-9be5-61b5c803dbbe',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-407',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f7ed4713-998e-4edd-abf1-248ddaff41a4',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-410',nmfault='IMBALANCE',guid='b2862ee4-7fb1-45e9-b798-007de40b282a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-413',nmfault='LOOSENESS',guid='1a884555-8e23-45fc-9307-9d1b92b82c70',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS
---- FAN BLADING PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-419',nmfault='FAN BLADING PROBLEM',guid='2ec1102e-931f-45d4-9111-6f63da303e90',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-422',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9e6037ff-4add-4833-8d34-466795011aa2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-425',nmfault='IMBALANCE',guid='89948c2a-80ec-4849-baef-d2d0eaae7f99',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS-FANSTTRVNS
---- COMPONENT WEAR OR FIT
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-431',nmfault='COMPONENT WEAR OR FIT',guid='dcf75de3-e77a-4da4-ab3d-c9436bccf31a',parfault=nil,fault='032124cf-ca67-496d-9904-06cf823372db',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-434',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3c88d8ea-06f9-402c-bfc5-10886f2544b6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-437',nmfault='IMBALANCE',guid='10153f9f-6ce3-47c2-b947-4c5f7f4a8ac5',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-440',nmfault='LOOSENESS',guid='57417c1b-d890-43bf-a9cb-01ee4f7936a3',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FLYWHEEL-BRG-FLYWHL-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-446',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='203380ee-0b17-4db1-b5c6-b50dd3b2e00f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-449',nmfault='IMBALANCE',guid='1f6cead0-549f-4b6e-8844-f435c548ab37',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-452',nmfault='LOOSENESS',guid='fe0fefc2-cd09-4142-8820-3172c2002a2e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR BRG-P-GR-P-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-458',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='4da2628c-7474-487f-a799-9ff4de97e844',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-461',nmfault='GEAR MESH PROBLEM',guid='3bd0084c-f703-461f-8cf7-ed1a58989bc3',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-464',nmfault='IMBALANCE',guid='14625bbc-a6cd-40b9-8fbd-cc7a88af4912',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-467',nmfault='LOOSENESS',guid='f047ba8f-d2a5-412d-9b41-10587ee032cf',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-473',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8c0a403c-e8c2-450a-bcae-56cb93ae4fe6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-476',nmfault='GEAR MESH PROBLEM',guid='f666db7a-fd63-45ef-8849-d1dff154a7db',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-479',nmfault='IMBALANCE',guid='25f2d11a-3f2b-4303-93bb-f35be6faf867',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-482',nmfault='LOOSENESS',guid='e42d91d6-30d7-4a7d-862e-bc3f984ad485',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-488',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='66ca56e3-f36e-4cca-9b9f-0f7b4db16d94',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-491',nmfault='GEAR MESH PROBLEM',guid='24e66026-9b6b-44bb-b74e-2c530447fd48',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-494',nmfault='IMBALANCE',guid='eb52540d-1085-416f-989c-382ddc04206b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-497',nmfault='LOOSENESS',guid='5c920ce7-8282-41c2-b183-361956e25619',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-503',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='2eac90ac-8dd7-4dd9-ac38-4aff1fc041c7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-506',nmfault='GEAR MESH PROBLEM',guid='94ee3edd-635f-4558-a846-0286bfc0738e',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-509',nmfault='IMBALANCE',guid='9a5bdb97-3540-4c42-a53b-fa711067e6d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-512',nmfault='LOOSENESS',guid='ae5f0824-d93a-46c8-a824-b1686a6dfc9a',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-518',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3e8dafe4-a1ad-49e7-afe2-cca14f815f5b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-521',nmfault='GEAR MESH PROBLEM',guid='1fdd313b-ce1b-49b1-94e7-5a24a0730245',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-524',nmfault='IMBALANCE',guid='be8986d6-853a-4e6a-9998-fb24e153d4a6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-527',nmfault='LOOSENESS',guid='488c8529-1044-4241-a2dc-2c346be204cd',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-GR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-533',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='befa4959-d896-425d-aff2-912fbe82cda1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-536',nmfault='GEAR MESH PROBLEM',guid='6ffefc73-e8e0-4507-a53f-8884fb67ff58',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-539',nmfault='IMBALANCE',guid='f5e1e678-b50a-4605-a244-db9d6a9a1b56',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-542',nmfault='LOOSENESS',guid='960fe7cb-2a7f-448d-b96a-b8c9ef31aaf6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-548',nmfault='GEAR MESH PROBLEM',guid='0e37d678-0b8d-4db8-9c78-0d0033db1460',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='2dea347f-8ab2-4e34-8b68-413d31d38a8a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR-BRG-GR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-554',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fbff74fa-f066-4ffd-ac67-dc27430cae81',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-557',nmfault='GEAR MESH PROBLEM',guid='2347e2f4-a7ae-44ad-88d1-1cbd5291ea93',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-560',nmfault='IMBALANCE',guid='4d80ba93-efe1-4c7c-bdba-17ad54c0aeb9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-563',nmfault='LOOSENESS',guid='5105a731-4bd5-4e95-8d4d-a32d6ab36fac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-569',nmfault='FAN PROBLEM',guid='ffab68b1-386d-46e0-95d9-04f70d813ff1',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-572',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='cf561af7-1344-4afa-a45b-95144227a240',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-575',nmfault='IMBALANCE',guid='88238328-1d57-4a5c-b292-29c84c943357',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-578',nmfault='LOOSENESS',guid='fd6cf05c-adc2-4f70-a998-ca88445341a4',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-GENSYN-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-584',nmfault='FAN PROBLEM',guid='a177d37e-449d-4b37-9d1e-23d89942a461',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-587',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9306ca22-09f3-4cee-ad6d-bbe0bc12f7f2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-590',nmfault='IMBALANCE',guid='1fd0cc12-c01b-4089-bc8b-0a897d72d362',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-593',nmfault='LOOSENESS',guid='72e692ff-ef00-4d5d-a162-56c31765b8b2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-596',nmfault='MOTOR COMMUTATOR PROBLEM OR BRUSH WEAR',guid='d608c385-5c39-4d23-b2de-26702e2b6759',parfault=nil,fault='3c1814d5-4159-40fb-a152-bcf9edb1d036',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-GENIND-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-602',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='33e48c11-6a72-41e7-a6e1-135fe7b55db7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-605',nmfault='IMBALANCE',guid='a224ddc3-dc27-4eee-b27d-60d1cdfd23b1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-608',nmfault='LOOSENESS',guid='f4068fc2-abb3-41b1-927f-0f6f61778940',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GOVENOR-BRG-GOV
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-614',nmfault='IMBALANCE',guid='eb33c7ad-b06e-4dcd-af56-6f4dcfee39d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-617',nmfault='LOOSENESS',guid='e1018e8b-a32e-4dff-a6fc-18a1d4017504',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-623',nmfault='FAN PROBLEM',guid='18b8f7b5-6c5c-44df-87ad-4d16422ee14f',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-626',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3aecd665-43d7-4709-a53b-bcd589cfcdf6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-629',nmfault='IMBALANCE',guid='94cef2a8-743b-4847-9cc0-ef3c4e405093',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-632',nmfault='LOOSENESS',guid='7be02057-7591-49bf-8d3e-1f8c51151ea1',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-635',nmfault='REPLACE BEARINGS',guid='ec90ab24-410c-4b81-a13d-bbf41cdff590',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacebearings() end
  ,nmrule='RecRuleLine-638',nmfault='REPLACE BEARINGS',guid='322f98c5-bb53-4fb2-9155-3b1bf6e1cb0d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-641',nmfault='REPLACE MOTOR',guid='0f7b96be-a916-4789-9b02-11737c3be809',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacemotor() end
  ,nmrule='RecRuleLine-644',nmfault='REPLACE MOTOR',guid='0ac810de-627f-4a59-b965-6d0ede66bd2a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-647',nmfault='ROTOR RUB',guid='c938aa2e-b1a3-40cb-a1ce-8ccd9f7db4b0',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-653',nmfault='FAN PROBLEM',guid='d9ef1d7f-ba7e-4461-9d44-188e7bc37892',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-656',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='27e972b3-f5fb-4393-b57c-f0c1005e4e69',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-659',nmfault='IMBALANCE',guid='8859756c-4717-426a-a11c-72492a18dae9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-662',nmfault='LOOSENESS',guid='a175bbe7-e236-427d-b9b4-883e528aa6dc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-665',nmfault='ROTOR RUB',guid='cb7856b4-02a8-41c4-a581-e2cc12e2938d',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTIND-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-671',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8d316fa2-4f2d-4c6e-861d-173f487515a0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-674',nmfault='IMBALANCE',guid='f3dc4f6e-9b45-473d-bfef-ed040a78c16a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-677',nmfault='LOOSENESS',guid='f841410e-0fb5-47d9-94b5-9c49a61daf2d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-680',nmfault='REPLACE BEARINGS',guid='21043935-1bc5-4afa-9bce-be1285053b2d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacebearings() end
  ,nmrule='RecRuleLine-683',nmfault='REPLACE BEARINGS',guid='55df2f2b-3669-4d3c-9035-56e381ad37ad',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-686',nmfault='REPLACE MOTOR',guid='8e00873f-df80-434b-b207-8c8314eed370',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacemotor() end
  ,nmrule='RecRuleLine-689',nmfault='REPLACE MOTOR',guid='0bf0d70a-a522-4120-8fdf-94e016d5bb1a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-692',nmfault='ROTOR RUB',guid='51ff2dc4-609b-4b4b-a5d9-9e787818a380',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-698',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='badea390-88d4-47f3-894c-1932dcaa2f86',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-701',nmfault='IMBALANCE',guid='60c2f1c2-a93a-4264-9302-caf46cfbe84c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-704',nmfault='LOOSENESS',guid='2f9ff772-924d-4901-b065-78f15ee93d81',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-710',nmfault='BENT OR BOWED SHAFT',guid='dcc8034d-8b68-4c29-abe6-c526c3ebcb6b',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-713',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='309d6348-ab56-4263-97a1-6aa282dde990',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-716',nmfault='FAN PROBLEM',guid='50953da7-eb97-47a2-84d9-07f882c9abfd',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-719',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5e5f4115-1630-4125-9c0a-f2886c37ebb7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-722',nmfault='IMBALANCE',guid='2a657674-c7ee-4035-bbd2-00fe0ee84eb6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-725',nmfault='LOOSENESS',guid='8486d318-c5bc-4c55-847a-dac681e263a9',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG-FANVNS
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-731',nmfault='FAN PROBLEM',guid='dfdd5569-9088-4978-a090-1e29961543de',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-734',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='6955032c-3ad6-4357-80cd-58ebdd8a4929',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-737',nmfault='IMBALANCE',guid='cbcbf760-4e31-4b41-b0a8-affd29e19ab6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-740',nmfault='LOOSENESS',guid='530074f7-305a-4d7e-a26f-34dc95cdfcdb',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-743',nmfault='ROTOR RUB',guid='d2473b17-9630-4254-adc3-b64ea281ba6a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-FANVNS-BRG
---- FAN PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-749',nmfault='FAN PROBLEM',guid='9e3957b5-4582-4ca7-9215-478fedec1a30',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-752',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fcb91322-572e-4d3e-b488-2126ba756bfb',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-755',nmfault='IMBALANCE',guid='2806fd00-64ca-40e6-8fd6-64c385c90d4c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-758',nmfault='ROTOR RUB',guid='28835fc2-d1d6-4acb-a8cc-101a9bb4183a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PULLEY-BRG-PUL
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-764',nmfault='IMBALANCE',guid='0846d62b-3d8a-4768-aeb7-1c0b51099d2a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-767',nmfault='LOOSENESS',guid='beed1f7e-d678-4570-b8e7-20136b681800',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGFLEX-CPLGFLEX-BRG-PMPOIL-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-773',nmfault='ANGULAR MISALIGNMENT',guid='2c86d9d7-f716-4979-bc1c-0119ed76e9ed',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-776',nmfault='LOOSENESS',guid='263000fd-9cce-4ba2-bcd2-fbb8ec9a72ef',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-779',nmfault='PARALLEL MISALIGNMENT',guid='78831f68-2dd1-4ca7-a76f-6a01761b9a99',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-GR-PMPPSTNS-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-785',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b5945e19-6edf-4048-8d01-e18601b6eaaf',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-788',nmfault='IMBALANCE',guid='f68ee5bc-cee8-4e59-9f7c-17b3f95cf501',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-791',nmfault='LOOSENESS',guid='82e404be-299a-4c60-9d7d-95af86223cbc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-794',nmfault='PISTON/VALVE PROBLEM',guid='f7f80eeb-249a-4b31-9e67-7eb1f9ba89bd',parfault=nil,fault='f3e83a4c-7d76-4e9e-bf46-b75bf13e90f7',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-800',nmfault='IMBALANCE',guid='d3d52141-7388-40f7-b19c-44552cf44e3c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-803',nmfault='IMPELLER WEAR',guid='6bc01d47-4926-44a6-8550-8a4e899d6a89',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-806',nmfault='LOOSENESS',guid='ac420a7a-7a10-4a60-a47f-a78abaa3cfa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-809',nmfault='ROTOR RUB',guid='490cf670-a380-4ef3-b02c-34ceecca5719',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-815',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9d2af9fb-002a-4cfc-bd46-e1ee86425a5e',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-818',nmfault='IMBALANCE',guid='ad45c239-7732-4626-a127-e3d01193e716',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-821',nmfault='IMPELLER WEAR',guid='9daa4219-69e4-4e50-9de1-60d3a304794b',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-824',nmfault='LOOSENESS',guid='d85a4fe6-4b5a-4af5-bc44-0408e9979eea',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-827',nmfault='REPLACE BEARINGS',guid='3a410ba5-a4e0-4025-b30a-adc5b9bec799',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacebearings() end
  ,nmrule='RecRuleLine-830',nmfault='REPLACE BEARINGS',guid='ea2e5757-2e8f-4ca4-8069-45796e64d67c',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() assert1() return true end
  ,nmrule='RecRuleLine-833',nmfault='REPLACE PUMP',guid='99b95da5-459a-4ba9-93ce-e7f473221909',parfault=nil,fault='f3f32f11-90ec-45f6-9a47-ee05b4cd6dec',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_replacepump() end
  ,nmrule='RecRuleLine-836',nmfault='REPLACE PUMP',guid='450349f0-0748-488d-ad23-c65d9a75d247',parfault=nil,fault='f3f32f11-90ec-45f6-9a47-ee05b4cd6dec',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-839',nmfault='ROTOR RUB',guid='8aef1f48-9ab0-4fd7-b9b7-54d2e45e30e9',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPIMPLR-BRG-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-845',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b6798ab5-8ee5-4f4b-bedf-29b32611820b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-848',nmfault='IMBALANCE',guid='a44d1920-83b6-4027-b1d9-961c0318cbb3',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-851',nmfault='IMPELLER WEAR',guid='4ce46fe9-3da7-49c7-8a89-d85cd4d29e51',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-854',nmfault='LOOSENESS',guid='b820d17a-6fb2-40a0-a817-dc1af698e14d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-857',nmfault='ROTOR RUB',guid='9fcbd117-e9fe-4412-9c60-45cfc14dba8a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-863',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5958098b-cb66-4b65-bcd1-6a6e68794dd0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-866',nmfault='IMBALANCE',guid='59c96e58-f8aa-4829-8ab0-8ba10b7cb0ba',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-869',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='19ac858f-bd2a-45fd-95a8-10e2d552d180',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-872',nmfault='LOOSENESS',guid='6ba74dae-dd68-42c8-85bd-28e30fbbc022',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-875',nmfault='ROTOR RUB',guid='d65135fc-3d4b-42a4-b469-7a454a800228',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPOIL
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-881',nmfault='IMBALANCE',guid='852d1ed3-75a3-4665-ac95-da492da5e963',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-884',nmfault='LOOSENESS',guid='f46d84c6-f488-4b68-b37e-204c18d4ad07',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPPSTNS-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-890',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='382a38b2-986b-43f7-b2f3-d04115d0e343',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-893',nmfault='IMBALANCE',guid='ba64c51b-6d3a-46a3-9abf-a350f2817123',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-896',nmfault='LOOSENESS',guid='2e288434-4d0b-40de-a1ba-66e7016ad446',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-899',nmfault='PISTON PROBLEM OR INTERNAL WEAR',guid='b3d1d3f5-8fa2-42b5-908e-49061851f225',parfault=nil,fault='c9e465ab-155c-4ea2-b7ea-5dfc0f78fb7e',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPSCR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-905',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8562aa6-5e7a-4809-8e43-d07328799de1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-908',nmfault='IMBALANCE',guid='6ef32f2d-c5fc-42f5-98a2-3ffc8034f11a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-911',nmfault='LOOSENESS',guid='beab5d52-14b1-411c-8758-fa80029b5fa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPVNS-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-917',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='dec59f14-cac0-4668-b02d-e29265860567',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-920',nmfault='IMBALANCE',guid='6f651c4d-910d-48ce-b0eb-0472af2963de',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-923',nmfault='IMPELLER WEAR',guid='96ecdffd-40f2-4bfc-a835-7d654ac14ef1',parfault=nil,fault='95f4ac86-31f8-4de9-80a2-a0583156a599',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-926',nmfault='LOOSENESS',guid='4af232e5-6d33-4e17-acdb-1c5b90657fec',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-CPLGFLEX-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-932',nmfault='ANGULAR MISALIGNMENT',guid='45dfb368-bc5e-49ca-9469-91a6f907df97',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-935',nmfault='LOOSENESS',guid='71270616-07ef-4e86-83fe-be1a1f5a97ac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-938',nmfault='PARALLEL MISALIGNMENT',guid='d91f37ca-d5e7-440b-8e35-8f104e459b8c',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-GR-PMPOIL
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-944',nmfault='GEAR MESH PROBLEM',guid='c46d2d94-5569-43f9-a3fc-3d4dca4212e1',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PURIFIER-BRG-PURBWL
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-950',nmfault='IMBALANCE',guid='ee76c3ea-c635-4f1c-9001-6db4bc386d27',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-6-5-BRG-BRG-TURBNOZS-TURBVNS(6)-TURBSTTRBLS(5)-BRG
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-956',nmfault='IMBALANCE',guid='5db7f634-1835-4d8a-902f-192b4f986a36',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-959',nmfault='LOOSENESS',guid='321424d6-2d54-4b56-aab6-5397694bcd1d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-8-6-BRG-BRG-TURBNOZS-TURBVNS(8)-TURBSTTRBLS(6)-TURBNOZS-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-965',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='58905a81-0584-45b1-88e0-9dcefe1b37b8',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-968',nmfault='IMBALANCE',guid='268675b0-d0fd-4ff3-86eb-3249a6ee39c6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-971',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='47aa2140-822c-4deb-b19c-5c07f811593f',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-974',nmfault='LOOSENESS',guid='24980177-3b57-4ea0-a125-0410a011fbe7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-9-9-BRG-BRG-TURBNOZS-TURBSTTRBLS(9)-TURBVNS(9)-CPLGRGD-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-980',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='04c3838c-10bc-4b0e-a0b5-663cb7f7a89f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-983',nmfault='IMBALANCE',guid='0ad11ee6-e1c1-453c-aeb0-e3d4819b0d9b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-986',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='273f38bc-51b6-4294-baeb-d8746c690999',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-989',nmfault='LOOSENESS',guid='6bb6affb-35cb-44ae-af42-eb42824c43e6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-BRG-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-995',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1b7e602d-eead-41d6-98aa-68db35f618dd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-998',nmfault='IMBALANCE',guid='fa1594a9-f328-4dfc-8eb6-ff5aa47bc288',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1001',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='63a15986-df48-4e1d-90f0-3ffa177e28bf',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1004',nmfault='LOOSENESS',guid='2eecc228-3202-46e5-9bbd-9634c45c1f80',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1010',nmfault='IMBALANCE',guid='ac2813d1-f402-459f-8ebf-1be597cc84c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1013',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='1eff9421-ed64-4760-8107-75fc48580bd6',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1016',nmfault='LOOSENESS',guid='8612f33a-f5a8-4bce-bee1-4d05b2a270a5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBVNS-BRG
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1022',nmfault='IMBALANCE',guid='34363cfe-2d27-4f84-8659-5a06557451c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1025',nmfault='IMPELLER OR GUIDE VANE PROBLEM',guid='5b3cc0d6-2161-40cf-b4ee-a1fab5ee3381',parfault=nil,fault='1be9cafa-cce0-465b-88d9-31c6e4313277',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1028',nmfault='LOOSENESS',guid='8cca57cc-1ea1-4ec0-b3ef-7e32fcaf392d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

end
-- Recommedation Functions
function rec_balance()
 local  check,f = get_fault( '0deaccad-1be8-4a9d-8b9a-8bb6bd492d57') -- ENGINE_ROTOR_BALANCE_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_bb_noise()
 local  check,f = get_fault( '6cdff41a-29dd-41e3-818d-1396afc88d55') -- NOISE FLOOR FAULT (High Freq)
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '1e93b5a5-a480-4e5f-8bf9-95635a1407b7') -- NOISE FLOOR FAULT (Mid Freq)
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_bearing_ff()
 local  check,f = get_fault( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '56025dd9-2342-4a9f-9c5c-1067b8594ed8') -- BEARING_FF_FIT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '41bce26d-b044-47f2-aebe-a6c42a4a4ad0') -- BEARING_FF_THRUST_SHOE_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_bearing_re()
 local  check,f = get_fault( '4e904f5b-2c45-49d2-9aca-3b8daa0c397c') -- BEARING MISC TONES
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '7796df29-c2cb-4ac7-9a55-3ca98eb22f62') -- BEARING_RE_BALL_SPIN_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'a05f207e-712f-401f-8b50-1de7380669d5') -- BEARING_RE_COCKED_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '396aaab9-6e19-47bf-8a8c-75890a56aa66') -- BEARING_RE_INNER_RACE_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '52275357-989a-4fdb-b641-9e274b6998fe') -- BEARING_RE_OUTER_RACE_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_bowed_rotor()
 local  check,f = get_fault( '6fb0a8d3-f05d-4db5-94ad-609198f42062') -- BENT OR BOWED SHAFT FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_component_wear_or_fit()
 local  check,f = get_fault( '37d17c46-b0f7-4ce6-b853-312709edcd3a') -- COMPRESSOR_ROTATING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'a9bf4c2d-921d-4cd6-9749-f4c278546ab7') -- COMPRESSOR_STATIONARY_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'fa0eef50-bab6-4db5-aa36-5df5c2a47e7a') -- COUPLING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '7506ade5-a3d8-4c78-90fc-650dcae59d85') -- FAN_ROTATING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '7da464e6-0fd0-4a44-a5d2-1770964e52b4') -- FAN_STATIONARY_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'ee338d62-ee72-4683-95da-b2d6b02c7f5a') -- GENERATOR_FAN_BLADE_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '57c9ac60-0949-4bf3-a632-5f3a3cf7e2d6') -- GENERATOR_SLIP_RING_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'e712797c-8ccb-466a-986b-0d659cf2acbe') -- GOVERNOR_ROTATING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'ab1b7c89-69d9-46ac-95fd-a724048821be') -- MOTOR_FAN_BLADE_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '3f089323-1112-4d25-9f38-98fad1a9748b') -- PUMP_ROTATING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'cacf4d95-217c-4c8e-b3a3-e32a6d60e943') -- PUMP_STATIONARY_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '0a0ca7e0-6078-466e-a604-8254538babb0') -- TURBINE 1ST STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '3c0fb590-f772-4600-a6dc-d37248c6b461') -- TURBINE 1ST STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'bd403ab2-6609-45d1-8f26-2270fe5f8fce') -- TURBINE 2ND STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'a21e2f01-f78d-48b2-81cd-7d618049a6a9') -- TURBINE 2ND STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '0cf04cf3-20cb-4767-b639-d868a36163ea') -- TURBINE 3RD STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '5be240e4-b0c0-4b00-bcdf-6be3148a4279') -- TURBINE 3RD STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '02c79b57-f641-4b2f-ac7b-329f99b00dcd') -- TURBINE 4TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'f4a2d95c-7d9c-40e2-b75d-870f387b3cdd') -- TURBINE 4TH STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'e9223c7b-2917-40a6-9286-80964cf680a4') -- TURBINE 5TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '9581739c-118c-4ff1-9344-e2fdf17dae48') -- TURBINE 5TH STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '00cadd5d-4705-4cc5-8d91-67ac226e628a') -- TURBINE 6TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '5d283048-a1d6-4652-acb1-8990adc5952f') -- TURBINE 6TH STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '8abda45d-5785-456f-94a8-ab7d1a369afe') -- TURBINE 7TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '25d2c08a-0c79-46ef-826c-e70f0290a7b9') -- TURBINE 7TH STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'fafec8c4-9a26-42e1-b8a2-cd6150e8b413') -- TURBINE 8TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '948047e1-dc1e-4721-a26d-f613903f0bd9') -- TURBINE 8TH STAGE STATOR BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '7190f684-d1df-4d9c-83cf-fa75632b07f1') -- TURBINE 9TH STAGE BLADING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '0bc84bd2-6c02-40a1-8a95-b1f11fab25f8') -- TURBINE NOZZLE CLEARANCE
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '2d53cfbe-ff4e-4520-a54a-5600ae8d96fd') -- TURBINE_ROTATING_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'c2712a28-19a4-4bb4-a7c1-5b041c2e2475') -- TURBINE_STATIONARY_ELEMENT_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_coupling_angular_alignment()
 local  check,f = get_fault( '3f57cd7c-d728-4b7f-8019-f308059fb047') -- COUPLING_MISALIGN_ANGULAR_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_coupling_parallel_alignment()
 local  check,f = get_fault( '914ea641-4570-4d07-ad0c-d25ddeb17ec6') -- COUPLING_MISALIGN_PARALLEL_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_data_check()
 local  check,f = get_fault( 'ca0a76af-7c5a-4b25-9a9f-078027ad6810') -- DATA MISSING
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'a3cd43b6-4fdc-4764-8186-3508c37e5cdd') -- DATA MISSING - NO SPECTRAL DATA
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '26477670-693a-4e5b-a17d-27eb1747ddc0') -- DATA PROBLEM - HIGH NOISE LEVELS
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'ee3a6ea3-605e-4d09-9b07-80ddcfb480f1') -- DATA PROBLEM - LOW NOISE LEVELS
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_data_normalization()
 local  check,f = get_fault( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_gear_mesh()
 local  check,f = get_fault( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR MESH FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '15dd5685-db85-4229-aa66-5374ec9a4b4c') -- GEAR MESH PROBLEM
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR_MESH_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_looseness()
 local  check,f = get_fault( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '967b15a5-923c-4231-84c0-41ad7cb06c81') -- LOOSENESS FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_oil_whirl()
 local  check,f = get_fault( 'acc257ad-914e-48c7-8982-62678618d2cd') -- BEARING_FF_FLUID_WEDGE_STABILITY_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_piston_problem()
 local  check,f = get_fault( '8f433851-5044-4eeb-8d62-d252c754e6ae') -- ENGINE_PISTON_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( '278077ab-a350-42d7-837e-78bec041a455') -- PUMP_PISTON_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_rotor_bars()
 local  check,f = get_fault( 'a523ae6b-1815-4a01-a8d3-83449a251dd8') -- GENERATOR_ROTOR_BAR_FAULT
    if check then setseverity(f.severity) return true  end 
  check,f = get_fault( 'aea1a9c8-de2a-48c4-a5fb-e94701180056') -- MOTOR_ROTOR_BAR_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_rotor_rub()
 local  check,f = get_fault( '016820d4-63ba-4177-bc69-73e25737368c') -- ROTOR RUB
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_ski_slope()
 local  check,f = get_fault( '4c8a0012-c1ba-46e9-88b4-ea4236de1a92') -- NOISE FLOOR FAULT (LowFreq)  SKI SLOPE
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_softfoot()
 local  check,f = get_fault( 'f2ef6d94-a6c7-4ab5-a127-7903420a362c') -- MOTOR_SOFTFOOT_FAULT
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_speed_change()
 local  check,f = get_fault( '9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a') -- DATA NORMALIZATION - SPEED CHANGE 
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_speed_out_of_range()
 local  check,f = get_fault( 'dd71dc8c-7dfe-49a7-9c9c-59dc560c285c') -- DATA NORMALIZATION - SPEED OUT OF RANGE
    if check then setseverity(f.severity) return true  end 

  return false
end
function rec_total_speed_deviation()
 local  check,f = get_fault( '5ba9638c-72f2-4c20-ada0-299eeee6faa5') -- DATA NORMALIZATION - TOTAL SPEED DEVIATION
    if check then setseverity(f.severity) return true  end 

  return false
end
-- SPECIAL Recommedation Functions----------
function rec_master_replacebearings()
 local  check,f = get_rec_near ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
  check,f = get_rec_mine ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  check,f = get_rec_mine ( '1a4eb45a-9771-4a1e-8d94-36736c8db15f') -- BEARING NOISE
  check,f = get_rec_mine ( '079d3155-0e02-4d7a-bc6e-5f140063e911') -- BEARING OR ROTOR MISALIGNMENT
  check,f = get_rec_mine ( '8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286') -- BEARING SHELL LOOSENESS
  check,f = get_rec_mine ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  check,f = get_rec_mine ( 'd4c1477a-ffdb-4b8f-8407-a1e47f01d504') -- BEARING WEAR OR FLOW NOISE

  return false
end
function rec_master_replacemotor()
  local t={}
  local tcount=0
  local check,f ,maxsev 
  check,f = get_rec_mine ('cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
  if check then
    tcount=tcount+1 
    t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=f
   end
  check,f = get_rec_mine ('8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then 
     tcount=tcount+1 
     t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=f
   end
  check,f = get_rec_mine ('1a4eb45a-9771-4a1e-8d94-36736c8db15f') -- BEARING NOISE
  if check then
       tcount=tcount+1 
     t['1a4eb45a-9771-4a1e-8d94-36736c8db15f']=f
   end
  check,f = get_rec_mine ('079d3155-0e02-4d7a-bc6e-5f140063e911') -- BEARING OR ROTOR MISALIGNMENT
  if check then 
         tcount=tcount+1 
     t['079d3155-0e02-4d7a-bc6e-5f140063e911']=f
   end
  check,f = get_rec_mine ('8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286') -- BEARING SHELL LOOSENESS
  if check then 
         tcount=tcount+1 
     t['8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286']=f
   end
  check,f = get_rec_mine ('c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then 
         tcount=tcount+1 
     t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=f
   end
  check,f = get_rec_mine ('d4c1477a-ffdb-4b8f-8407-a1e47f01d504') -- BEARING WEAR OR FLOW NOISE
  if check then 
         tcount=tcount+1 
     t['d4c1477a-ffdb-4b8f-8407-a1e47f01d504']=f
   end
  check,f = get_rec_mine ('ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
  if check then
         tcount=tcount+1 
     t['ca47a73c-f659-460c-8b5a-2753dcba9f0f']=f
   end
  check,f = get_rec_mine ('d57df2c9-c3b2-4a86-8f91-95de0647e904') -- LINE PHASE VOLTAGE IMBALANCE
  if check then      tcount=tcount+1 
     t['d57df2c9-c3b2-4a86-8f91-95de0647e904']=f
   end
  check,f = get_rec_mine ('4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
  if check then      tcount=tcount+1 
     t['4c5d657f-0c77-4afc-a400-490b9b1dc900']=f
   end
  if tcount >= 0 then
      assert2(3) --Severity
      assert3(1) --Confidence
      maxsev=combine_recommendations(t,-1)
      return true
    end
    assert3(-1)
  return false
end
