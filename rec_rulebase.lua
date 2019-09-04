-- Created Date: 8/5/2019 8:27:55 AM
function load_rec_rules(g_rec_rules)
g_datanormalizationerrorguid='4d535592-5633-4a3d-92e5-c9ac0453294f'
-- **************************************
-- BEARING-FLUID-FILM
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-11',nmfault='BEARING FIT PROBLEM',guid='4f161dc7-7dee-4640-b9a7-ec4672220917',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-14',nmfault='BEARING JOURNAL OIL WHIRL',guid='5e6a4836-7434-43ff-8040-e520d12d5c3a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-RADIAL-THRUST
---- BEARING FIT PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-20',nmfault='BEARING FIT PROBLEM',guid='b7359e6d-630d-4911-94c2-61dad93d4c4e',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-23',nmfault='BEARING JOURNAL OIL WHIRL',guid='dd68d3d3-0d56-43ee-8dc9-0da4ebdd611a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-26',nmfault='BEARING THRUST PROBLEM',guid='50a9c72e-b6ca-4801-b415-47f7c1a7549b',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-THRUST
---- BEARING JOURNAL OIL WHIRL
table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-32',nmfault='BEARING JOURNAL OIL WHIRL',guid='7ffc7e53-bb1b-40ff-8519-8c8a02d9b968',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-35',nmfault='BEARING THRUST PROBLEM',guid='573c21dc-5a30-44e0-b53b-7b2ca35ea029',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-38',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='bc765917-bace-4b58-b3f9-25fca1f14118',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-44',nmfault='BEARING MISALIGNMENT',guid='3ddc087a-304a-4e7d-86d3-df3f4e1792b6',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-47',nmfault='BEARING NOISE',guid='0520af4f-2dbb-481e-adfa-20fa80ddf874',parfault=nil,fault='1a4eb45a-9771-4a1e-8d94-36736c8db15f',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-50',nmfault='BEARING WEAR',guid='b95e0138-8bc2-412e-b20b-80d01c8a4770',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-53',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='4c7f2861-8a67-4ffe-bba6-5cc6fec1a338',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-59',nmfault='BEARING MISALIGNMENT',guid='9c18aa0d-8b25-42ed-a189-147b53483ec9',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-62',nmfault='BEARING NOISE',guid='12f9f0ca-16a0-474d-a482-11d05cfa1521',parfault=nil,fault='1a4eb45a-9771-4a1e-8d94-36736c8db15f',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-65',nmfault='BEARING WEAR',guid='39fe17b2-9d45-4689-8986-241c73115887',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-68',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='fc500df0-1e41-4854-a4fa-32055ceab58d',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-74',nmfault='BEARING MISALIGNMENT',guid='a6f6d562-208a-4949-b185-8393cae14f0c',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-77',nmfault='BEARING NOISE',guid='e47fcc9c-eb99-4057-8ea0-276c10db61ee',parfault=nil,fault='1a4eb45a-9771-4a1e-8d94-36736c8db15f',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-80',nmfault='BEARING WEAR',guid='8c598591-2940-4e3e-a5a8-1d0d69550ae9',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-83',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='19d47dca-cbfd-4b93-a537-f9d4017fd762',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-89',nmfault='BEARING MISALIGNMENT',guid='be171378-d565-44ef-8d22-8b152b0c8b83',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bb_noise() end
  ,nmrule='RecRuleLine-92',nmfault='BEARING NOISE',guid='d052da84-ac4f-486b-bd24-57e6154915da',parfault=nil,fault='1a4eb45a-9771-4a1e-8d94-36736c8db15f',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-95',nmfault='BEARING WEAR',guid='8687cc72-a6bf-4f91-9266-e44a120dfb50',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_ski_slope() end
  ,nmrule='RecRuleLine-98',nmfault='SPECTRUM OVERLOAD (SKI SLOPE)',guid='47d9fa6a-0547-4ec4-8d1b-4d93ca41cd61',parfault=nil,fault='66d6f4fe-c34e-4c14-9545-970a100757a8',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CL-GR
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-104',nmfault='IMBALANCE',guid='444cdbef-59fd-424d-a2c1-9b9ca34a1449',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-107',nmfault='LOOSENESS',guid='843bebaf-82a6-4e1e-be30-27f59a067fb2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-110',nmfault='MASTER ISSUE BEARINGS',guid='df744903-2224-40c7-8303-58f60be50939',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-113',nmfault='MASTER ISSUE COMPONENT',guid='f0158fb8-d6bf-450c-891e-eb70f2959a60',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-116',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='682ce1b7-efb3-47fa-b281-0c3b4e205921',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-119',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8019b59e-e936-4ea5-99b3-9353602c359b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-122',nmfault='REPAIR/REPLACE',guid='a3856753-5da1-47da-bdf2-816d184b4167',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-125',nmfault='REPAIR/REPLACE UNIT',guid='77e0fe0a-34f4-4d0f-a2dc-ec7caf723caa',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-128',nmfault='REPLACE BEARINGS',guid='909ee01f-0bec-4a6b-ba31-a938d668cd07',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CPLGFLEX-CL-BRG-BRG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-134',nmfault='ANGULAR MISALIGNMENT',guid='e8278824-b07e-4065-b1a6-d69adf4faffe',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-137',nmfault='IMBALANCE',guid='7199f4e7-1c9d-43b7-8963-943528ed16b9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-140',nmfault='MASTER ISSUE BEARINGS',guid='45181cc4-cf0b-4ab9-9c28-2bc34f1cb010',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-143',nmfault='MASTER ISSUE COMPONENT',guid='8456f600-40b1-4a9c-8fb6-f46d39d4294e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-146',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7e4a90ba-3b9e-42c7-bbd6-c1ca2b4a33fe',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-149',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='51003b3e-b6f7-4ad7-b8a6-8a9ee66e45ab',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-152',nmfault='PARALLEL MISALIGNMENT',guid='6a5b5d89-d160-4c1e-8460-aaa6acd0198b',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-155',nmfault='REPAIR/REPLACE',guid='c11281a0-9867-4d67-8073-0050edb6db63',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-158',nmfault='REPAIR/REPLACE UNIT',guid='83a82fd6-2e51-4e0b-9fd3-f5ae96dc4b20',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-161',nmfault='REPLACE BEARINGS',guid='8df470b6-ec6c-4059-87ce-ebe38e73d4ab',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-BRG-CPRSRVNS-CPRSRSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-167',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3d8b7744-0172-4a2f-8f92-1b74d6b30b6c',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-170',nmfault='IMBALANCE',guid='ed1a81ce-5bb9-4bb8-bc83-2dd3ee7c6083',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-173',nmfault='LOOSENESS',guid='103a00a6-ce21-4203-bf25-8710f5c61d0c',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-176',nmfault='MASTER ISSUE BEARINGS',guid='6267c6be-8ebf-463b-9481-575c6abaa54f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-179',nmfault='MASTER ISSUE COMPONENT',guid='c5c11ce5-dd10-4e48-81fd-810a455c56c1',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-182',nmfault='MASTER ISSUE RETEST',guid='3cf4658a-e211-40c6-95b3-31e17f7db8d5',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-185',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='258a43e7-805e-46d8-bb24-1bfcbaf13791',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-188',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b82d2c64-a00b-48f0-b65a-8a7f9d4e205f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-191',nmfault='REPAIR/REPLACE',guid='ffd90bcb-4feb-4c31-9bf9-5a7f88430454',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-194',nmfault='REPAIR/REPLACE UNIT',guid='e1bf6749-13c7-4564-a2ef-8fb21411120d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-197',nmfault='REPLACE BEARINGS',guid='9b976a96-606f-4fa4-962f-3eb9bbf0b681',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-200',nmfault='RETEST UNIT PER VTAG',guid='0fa0b8c9-7a59-4d6a-8bf7-d59d50dc5f7e',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRGR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-206',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='d4e27882-874a-478a-9f72-8305a16afac9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-209',nmfault='GEAR MESH PROBLEM',guid='5839fb53-c409-4102-84d1-7ec849b31343',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-212',nmfault='LOOSENESS',guid='36ee3c09-e478-4551-86e2-dd33df76db09',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-215',nmfault='MASTER ISSUE BEARINGS',guid='7463ca3c-f91f-46c4-95f3-f4c96571253b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-218',nmfault='MASTER ISSUE COMPONENT',guid='5aa42d33-7368-44e5-a97a-7243c0707107',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-221',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='7929ee67-8eb0-4483-8107-fe26e01ba848',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-224',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='56d9bac3-8059-41c5-8384-017466bb036f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-227',nmfault='REPAIR/REPLACE',guid='9ca8464f-e001-4114-ad11-0202e77ff478',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-230',nmfault='REPAIR/REPLACE UNIT',guid='b6712810-0f72-4cd9-9900-212faab94761',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-233',nmfault='REPLACE BEARINGS',guid='e175605f-10ad-4fac-9950-880ee0d7e9a3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-236',nmfault='RETEST UNIT PER VTAG',guid='5316dd2f-e625-4f84-9cd1-a24b9c86ca62',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-242',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='55641e73-a958-427e-ad3f-9eee7c5791b3',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-245',nmfault='IMBALANCE',guid='78133759-9e19-4744-96b6-baee54af259c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-248',nmfault='LOOSENESS',guid='012cc6ee-cceb-4ee2-9508-645017fd7357',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-251',nmfault='MASTER ISSUE BEARINGS',guid='a3eba381-4ed3-4265-bcbd-a9174625aca3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-254',nmfault='MASTER ISSUE COMPONENT',guid='c86c45c6-2a0b-4a85-ada8-d88f6579c343',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-257',nmfault='MASTER ISSUE RETEST',guid='ca58715d-c1cc-40af-a532-2b5371b39e9a',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-260',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ab99b3f4-a551-4ce6-9ef0-5a126228ac86',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-263',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='401114c4-e3c9-4582-b0ac-ea0252b4f4a6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-266',nmfault='REPAIR/REPLACE',guid='1833f1a6-d2fb-4afa-b579-912235391d8d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-269',nmfault='REPAIR/REPLACE UNIT',guid='000cba47-65b3-47a8-b8bf-a7d3aab644b7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-272',nmfault='REPLACE BEARINGS',guid='1208f5de-c94b-4819-8cb4-4f38a0e4aae8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-275',nmfault='RETEST UNIT PER VTAG',guid='74d8fdc1-f8bb-4b67-9a33-5452b4f26230',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR-CPRSRSTTRVNS
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-281',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='f4df272b-8215-40cf-ac37-a0c50cf5a958',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-284',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8f639c2-1c8b-4af3-80b4-d177252cabd2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-287',nmfault='IMBALANCE',guid='67d86db1-a682-4008-b4b1-2a51246706a0',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-290',nmfault='LOOSENESS',guid='8d1dcffc-85c6-4b85-a24b-b9ebfb166b11',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-293',nmfault='MASTER ISSUE BEARINGS',guid='25ecc3b9-bbe4-4322-a753-5cea2a9e63b7',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-296',nmfault='MASTER ISSUE COMPONENT',guid='89a5ca1a-239e-410e-a36e-78275f0abe19',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-299',nmfault='MASTER ISSUE RETEST',guid='08310ccb-c10b-46ff-9a4e-c6d3567e7242',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-302',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fc0afce6-fd54-4727-81ac-42d5133efd91',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-305',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cb2ac0da-a578-44e8-97a6-599c46c7fae3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-308',nmfault='REPAIR/REPLACE',guid='8962984e-8512-4d28-92eb-911c81cce438',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-311',nmfault='REPAIR/REPLACE UNIT',guid='77190f23-2ed8-4fcc-8669-aacc623b29db',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-314',nmfault='REPLACE BEARINGS',guid='4dc7d147-d31b-44e8-993a-9d88870058e2',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-317',nmfault='RETEST UNIT PER VTAG',guid='86898d28-0d54-4fa8-b8b4-485a28c301d3',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRPSTN-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-323',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='63392c64-bd7d-42a6-bbc1-80f89b5c377a',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-326',nmfault='LOOSENESS',guid='80c1d077-2108-4e48-bd2d-a0981a830fc5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-329',nmfault='MASTER ISSUE BEARINGS',guid='4aa6bd2f-f729-4ac5-a477-bd64c510a3cc',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-332',nmfault='MASTER ISSUE COMPONENT',guid='0ac608f2-3f55-4eac-8db6-c65a25a980ee',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-335',nmfault='MASTER ISSUE RETEST',guid='57814abc-10b3-4c9b-9061-977248f3a472',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-338',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ae55db5c-8ebf-4998-bd91-718bdfdf5ddf',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-341',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a64ed077-bdad-45bd-a32d-e2131da9d034',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-344',nmfault='REPAIR/REPLACE',guid='110e866c-235d-4d0a-9634-cb290ebb1e91',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-347',nmfault='REPAIR/REPLACE UNIT',guid='e93f3974-f47c-4df3-993b-e4d7a40c7db6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-350',nmfault='REPLACE BEARINGS',guid='edfdb6d1-818a-4e29-b92a-954d554bc2f7',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-353',nmfault='RETEST UNIT PER VTAG',guid='39efc728-b384-4b19-ad41-9934af2da140',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-GR-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-BRG-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-359',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='11b43300-713b-4630-8ea3-a2cc827e1ec9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-362',nmfault='GEAR MESH PROBLEM',guid='e86c4107-a4ab-4571-bafc-0d360d64d3ab',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-365',nmfault='IMBALANCE',guid='89cb4de0-3df7-4f7b-8a5a-5888fd841add',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-368',nmfault='LOOSENESS',guid='2b4316bf-1330-45a7-ab8c-d66c6990957e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-371',nmfault='MASTER ISSUE BEARINGS',guid='9716cf7e-f221-427a-adf4-a9720ff8a44c',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-374',nmfault='MASTER ISSUE COMPONENT',guid='40506e20-67cb-48d1-9a2f-727fcecd707a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-377',nmfault='MASTER ISSUE RETEST',guid='2cf3544c-675e-423f-b7fe-790f4691478a',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-380',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='acba8b90-ad27-4cf4-bf24-aa88d705a8ea',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-383',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d8365a3c-d6da-4e8b-b8a0-ffd9a4d0394d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-386',nmfault='REPAIR/REPLACE',guid='ed10dfe0-2125-4d10-b4ff-12557f843590',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-389',nmfault='REPAIR/REPLACE UNIT',guid='ae0fe3e8-0402-41dd-a95c-67f02d19139d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-392',nmfault='REPLACE BEARINGS',guid='634ed020-9dd7-4f98-b41e-ed2e7d42e402',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-395',nmfault='RETEST UNIT PER VTAG',guid='a73a02dc-bd1a-42c3-ad87-40a4dc925aba',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-GR-BRG-CPRSRIMPLR
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-401',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1ee5d843-0960-44f4-a573-c7864c1bac22',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-404',nmfault='IMBALANCE',guid='1268b13c-1045-4240-bf10-b8d19b5913c1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-407',nmfault='LOOSENESS',guid='eeb2b505-87bf-4d64-97ab-65cfb3258a01',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-410',nmfault='MASTER ISSUE BEARINGS',guid='eb30fb65-eeba-485c-80d8-ae6e8d2be0f8',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-413',nmfault='MASTER ISSUE COMPONENT',guid='88bc3ce5-6cf2-470f-9306-c6f51ad24361',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-416',nmfault='MASTER ISSUE RETEST',guid='b29d6bde-6a58-4e26-88c7-af745737b061',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-419',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='520f2067-9f1b-49b6-93a0-2f029cedeec6',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-422',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='47e0acb0-f42c-4dca-83c5-be752925ecd6',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-425',nmfault='REPAIR/REPLACE',guid='19e1bd5e-6e02-45d0-89e4-0aba24740bd5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-428',nmfault='REPAIR/REPLACE UNIT',guid='5c76844c-fbf9-46c1-95e0-14ece61b346a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-431',nmfault='REPLACE BEARINGS',guid='b3271e4b-5ecc-4e3d-9f1f-7f2a166a358f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-434',nmfault='RETEST UNIT PER VTAG',guid='4e7088f2-ecb8-4bb0-89c0-066fa63cf9ce',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-440',nmfault='ANGULAR MISALIGNMENT',guid='7e346d1f-a6f1-4073-93ac-21569969d488',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_4_check() end
  ,nmrule='RecRuleLine-443',nmfault='CHECK ALIGNMENT',guid='02ec604b-c7b2-495a-9f0c-8ba790bba245',parfault=nil,fault='dd20442f-7566-420d-bcc0-f0149a79795c',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-446',nmfault='COUPLING WEAR',guid='c7fb7a52-4fc4-493b-9890-aee88499a6e4',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-449',nmfault='IMBALANCE',guid='f0fdcb0b-3b6d-4b10-9196-a92eb5bfed9a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-452',nmfault='INSPECT FOR ALIGNMENT',guid='8f874328-fc05-4fa0-9e65-5a2bbcbd643a',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-455',nmfault='LOOSENESS',guid='55c4faeb-0f85-4db3-b487-e6ab91aee51e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-458',nmfault='MASTER ISSUE BEARINGS',guid='c7ec8c1d-33e6-46a6-87cb-89ad5730fee6',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-461',nmfault='MASTER ISSUE RETEST',guid='3149b2c3-a5d4-4080-b02c-48ace8d58f3d',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-464',nmfault='PARALLEL MISALIGNMENT',guid='f7cb3992-c161-4f72-b4f5-b6543bf05ea5',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-470',nmfault='ANGULAR MISALIGNMENT',guid='35d37b51-2b81-4605-9d60-fe4db973f00c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-473',nmfault='COUPLING WEAR',guid='d19250ce-85fa-41e3-83a2-ae84ef01de17',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-476',nmfault='COUPLING WEAR',guid='8bb98bd2-1b3e-4741-b0ce-89f76ce6a394',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-479',nmfault='IMBALANCE',guid='cce3536f-f11c-48d2-bfae-9150c027a897',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-482',nmfault='INSPECT FOR ALIGNMENT',guid='62004b0a-b2dc-410e-b0ad-d4314a068686',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-485',nmfault='MASTER ISSUE BEARINGS',guid='0d25a98e-acd0-4bbb-8c76-115fe47a13df',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-488',nmfault='MASTER ISSUE RETEST',guid='77c1f75d-9b5b-4c65-b1a4-d599b74d4d6c',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-491',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='39446ae9-e13d-4acc-8dc8-fab40e0ff7ca',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-494',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='420eee87-f68f-4508-8971-b9f59e1d5dc9',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-497',nmfault='PARALLEL MISALIGNMENT',guid='cb4d926d-8f4e-4483-9322-54771f52a99e',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-500',nmfault='REPAIR/REPLACE',guid='e19d48ae-b06e-455c-b4e4-94b72f923afa',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-503',nmfault='REPAIR/REPLACE UNIT',guid='5172257d-cd5f-47d9-9a10-3a8f8a43d52c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-506',nmfault='REPLACE BEARINGS',guid='fcda9b47-efea-4f73-ab05-a1522ed71f1a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGMAG-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-512',nmfault='ANGULAR MISALIGNMENT',guid='ca2c11a4-242f-49d1-8793-b3d417ad5708',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-515',nmfault='INSPECT FOR ALIGNMENT',guid='36b92c49-977d-463e-b640-8285a6f00bb0',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-518',nmfault='PARALLEL MISALIGNMENT',guid='372beb25-b639-443c-a14f-8e8e5ac62402',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-524',nmfault='ANGULAR MISALIGNMENT',guid='4bf65b6b-0dc8-4303-8edd-fcf14170cd1c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-527',nmfault='COUPLING WEAR',guid='693978ae-65f7-4747-a9d1-7b9cd6544dc5',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-530',nmfault='COUPLING WEAR',guid='d32674ed-be4c-4c49-bf96-a443a13b8e0a',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-533',nmfault='IMBALANCE',guid='d96d74a4-a10a-4fe6-942e-f576c6f78901',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-536',nmfault='INSPECT FOR ALIGNMENT',guid='9dfd3b36-766e-4567-8c4d-5c033d79d5e6',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-539',nmfault='MASTER ISSUE BEARINGS',guid='2bb73a7a-74cc-4e8b-b37f-6ff975f62c12',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-542',nmfault='MASTER ISSUE RETEST',guid='f0195d1c-6b13-4e9f-9ca7-2fef4c09c886',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-545',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c91d7d3a-8519-4a6a-88c0-f11586a92f16',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-548',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d0886654-1ecb-44c7-a973-03c8d318abf4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-551',nmfault='PARALLEL MISALIGNMENT',guid='741e4ff5-ebe0-4474-b179-aeabbd817e3d',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-554',nmfault='REPAIR/REPLACE',guid='3d9fce81-2e21-4d6b-91bd-df6a4031bf7c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-557',nmfault='REPAIR/REPLACE UNIT',guid='a0539c2c-3674-4e34-9234-9d114e9bade6',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-560',nmfault='REPLACE BEARINGS',guid='84f50c6a-5351-4ed2-8774-da343417e9f6',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-566',nmfault='ANGULAR MISALIGNMENT',guid='0299305e-31d1-46a1-9858-c188ad2cabbc',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-569',nmfault='COUPLING WEAR',guid='871646b9-2d43-46f2-a395-3abea63b3b65',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-572',nmfault='COUPLING WEAR',guid='25da81dd-b81e-4a5f-9a16-65cee3d6ca2b',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-575',nmfault='IMBALANCE',guid='e279e877-5049-48e6-9c03-ec4d9d81a27f',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-578',nmfault='INSPECT FOR ALIGNMENT',guid='688c4ce7-48d5-4719-9514-6049cbfdbb81',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-581',nmfault='MASTER ISSUE RETEST',guid='470f68aa-181c-4ba5-a736-f2e5df2989ed',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-584',nmfault='PARALLEL MISALIGNMENT',guid='9443959e-2a3a-4a3b-903f-f318051b3132',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-CPLGFLEX-BRG
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-590',nmfault='ANGULAR MISALIGNMENT',guid='c76445e6-b371-4ef7-bd5a-53d34ad388af',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-593',nmfault='COUPLING WEAR',guid='f83dc2f7-def7-40b6-b92b-7742be9bf4e3',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-596',nmfault='IMBALANCE',guid='0e441296-4fef-4b7f-9673-773078f930bc',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-599',nmfault='PARALLEL MISALIGNMENT',guid='fdf23620-e3b6-405a-8366-283267804ff9',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- ENGINE-BRG-MOTPSTN-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-605',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='95cb1fda-06c1-47dc-b47f-21f1ed1d8366',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-608',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fa336801-204d-48f4-9943-c6734567ddbd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-611',nmfault='IMBALANCE',guid='a7623820-352d-44f2-965f-b02b7bdde917',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-614',nmfault='LOOSENESS',guid='8092685c-b95a-4e55-89cc-3516d983dbb7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-617',nmfault='MASTER ISSUE BEARINGS',guid='0153f3a5-f8c1-4ec9-bea5-3ee99b39a2a0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-620',nmfault='MASTER ISSUE COMPONENT',guid='c7cc1b8b-0b4d-4d61-9e48-fdfc8f6c382d',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-623',nmfault='MASTER ISSUE RETEST',guid='29b8efc3-52df-49cd-9dff-d88f01c7eeb6',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-626',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1cc0b987-cc5d-4492-a8d4-95226730c4c3',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-629',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8fc77a39-74b1-464f-addd-ca0cb0486ad3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-632',nmfault='REPAIR/REPLACE',guid='a1b977c1-2ac4-4b9b-861a-4b5a77d88b8e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-635',nmfault='REPAIR/REPLACE UNIT',guid='2459509d-ea8b-4613-aee8-c229c191b836',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-638',nmfault='REPLACE BEARINGS',guid='91fc331b-d861-41cf-9b44-107eb661d65f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-641',nmfault='RETEST UNIT PER VTAG',guid='b77568ee-60e4-44b5-8b9e-8897c47b96e0',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANHTSLGR-FANVNS
---- FAN BLADING PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-647',nmfault='FAN BLADING PROBLEM',guid='9b9d0db4-46dd-426b-9be5-61b5c803dbbe',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-650',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f7ed4713-998e-4edd-abf1-248ddaff41a4',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-653',nmfault='IMBALANCE',guid='b2862ee4-7fb1-45e9-b798-007de40b282a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-656',nmfault='LOOSENESS',guid='1a884555-8e23-45fc-9307-9d1b92b82c70',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-659',nmfault='MASTER ISSUE BEARINGS',guid='6cc7869a-ab63-48ba-b309-be7638de69f8',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-662',nmfault='MASTER ISSUE COMPONENT',guid='50cfa0cc-1654-49f8-9dfd-dafbdfaf1f83',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-665',nmfault='MASTER ISSUE RETEST',guid='e241c550-9174-4de1-a220-3ae93b4a60b5',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-668',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='75d2e0f2-7972-48a0-b78c-492e2088ba86',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-671',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c729cc54-2d7a-4aa6-8bb5-cc742f01f58b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-674',nmfault='REPAIR/REPLACE',guid='7c5c3f3c-8d48-4b90-a6f9-c4d79e7c34ad',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-677',nmfault='REPAIR/REPLACE UNIT',guid='681e8ba7-b9d5-412c-952c-45ebe29be593',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-680',nmfault='REPLACE BEARINGS',guid='07928060-3d28-442f-88f2-f02d03b96adc',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-683',nmfault='RETEST UNIT PER VTAG',guid='2c1ab90a-2448-4b2a-a47f-75fd288ef0aa',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-689',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='95da0d86-4d55-457f-aee7-42c0ebc8f641',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-692',nmfault='FAN BLADING PROBLEM',guid='2ec1102e-931f-45d4-9111-6f63da303e90',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-695',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9e6037ff-4add-4833-8d34-466795011aa2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-698',nmfault='IMBALANCE',guid='89948c2a-80ec-4849-baef-d2d0eaae7f99',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-701',nmfault='LOOSENESS',guid='d01e3880-75f0-4c5e-9f1d-c30748ab1156',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-704',nmfault='MASTER ISSUE BEARINGS',guid='4fce863b-9adc-40d4-bd74-5ef81a668be6',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-707',nmfault='MASTER ISSUE COMPONENT',guid='d2141f2c-a1cd-4920-a09f-654784864220',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-710',nmfault='MASTER ISSUE RETEST',guid='5636da1c-26f5-40c9-8b94-b7ac59ce54fa',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-713',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='aa41022f-5450-4e56-b50a-3984b8624b2b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-716',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6d023cfd-92b2-48f6-9115-8ed5a3ca2e9e',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-719',nmfault='REPAIR/REPLACE',guid='944c8388-d9d3-4ba9-affb-182f30fe5686',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-722',nmfault='REPAIR/REPLACE UNIT',guid='c09134d8-3dab-42c0-b619-e6d29a1950a0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-725',nmfault='REPLACE BEARINGS',guid='c0969a29-25a8-48be-81b7-9668d2598be3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-728',nmfault='RETEST UNIT PER VTAG',guid='93aa9632-85e5-4d55-b987-9d16ff6427a3',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS-FANSTTRVNS
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-734',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3c88d8ea-06f9-402c-bfc5-10886f2544b6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-737',nmfault='IMBALANCE',guid='10153f9f-6ce3-47c2-b947-4c5f7f4a8ac5',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-740',nmfault='LOOSENESS',guid='57417c1b-d890-43bf-a9cb-01ee4f7936a3',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-743',nmfault='MASTER ISSUE BEARINGS',guid='7fdc3144-6b18-448c-9ee9-86dc2a8d0ab9',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-746',nmfault='MASTER ISSUE COMPONENT',guid='2386e11e-77db-495d-ad77-fdece43c492c',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-749',nmfault='MASTER ISSUE RETEST',guid='dfb437cd-3b54-483c-a407-0bb76131babf',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-752',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1c6544e1-8537-4ee7-80e9-f0ce775a76d9',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-755',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e01b12e6-3ba2-457f-b816-bf030bd35a5d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-758',nmfault='REPAIR/REPLACE',guid='2342d761-51c7-4922-a05e-d1b84830088e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-761',nmfault='REPAIR/REPLACE UNIT',guid='ad45d78e-6954-48ce-9f5e-d1373dfd982b',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-764',nmfault='REPLACE BEARINGS',guid='def7de77-f6fe-4144-bdab-6558d8dbfdcd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-767',nmfault='RETEST UNIT PER VTAG',guid='a98f6f45-6b11-4c03-8e47-30485492e6cf',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FLYWHEEL-BRG-FLYWHL-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-773',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='203380ee-0b17-4db1-b5c6-b50dd3b2e00f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-776',nmfault='IMBALANCE',guid='1f6cead0-549f-4b6e-8844-f435c548ab37',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-779',nmfault='LOOSENESS',guid='fe0fefc2-cd09-4142-8820-3172c2002a2e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-782',nmfault='MASTER ISSUE RETEST',guid='d753aabd-4eff-4459-8afc-e082c40d1f6b',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-785',nmfault='RETEST UNIT PER VTAG',guid='1f74db01-62bb-4135-9557-3cc607c13d93',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR BRG-P-GR-P-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-791',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='a0ee978d-2269-4d08-a704-d027f09744a1',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-794',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='4da2628c-7474-487f-a799-9ff4de97e844',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-797',nmfault='GEAR MESH PROBLEM',guid='3bd0084c-f703-461f-8cf7-ed1a58989bc3',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-800',nmfault='IMBALANCE',guid='14625bbc-a6cd-40b9-8fbd-cc7a88af4912',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-803',nmfault='LOOSENESS',guid='f047ba8f-d2a5-412d-9b41-10587ee032cf',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-806',nmfault='MASTER ISSUE BEARINGS',guid='0ecf24e4-bb6a-4daa-9abf-17b0b3014789',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-809',nmfault='MASTER ISSUE COMPONENT',guid='7f30128f-6b50-44e9-8753-255c086790c6',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-812',nmfault='MASTER ISSUE RETEST',guid='25e69ac6-001e-4203-b6f6-afab1652ea54',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-815',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8ce4b2c4-260c-4a43-8323-6c3e73d89d5b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-818',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d2c643ee-8cf0-40fd-a3f1-cba79aee6783',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-821',nmfault='REPAIR/REPLACE',guid='c3c14396-0c5a-4d41-a713-10577244dca5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-824',nmfault='REPAIR/REPLACE UNIT',guid='fc17fd75-b843-4ceb-8fbe-82fe07beb68d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-827',nmfault='REPLACE BEARINGS',guid='48dbcced-8911-473f-823b-cf09fa184daf',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-830',nmfault='RETEST UNIT PER VTAG',guid='4743868d-6e58-4f55-b363-af2a1307075a',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-836',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c72d7342-5e66-4fc7-b236-a3ae23244606',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-839',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8c0a403c-e8c2-450a-bcae-56cb93ae4fe6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-842',nmfault='GEAR MESH PROBLEM',guid='f666db7a-fd63-45ef-8849-d1dff154a7db',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-845',nmfault='IMBALANCE',guid='25f2d11a-3f2b-4303-93bb-f35be6faf867',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-848',nmfault='LOOSENESS',guid='e42d91d6-30d7-4a7d-862e-bc3f984ad485',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-851',nmfault='MASTER ISSUE BEARINGS',guid='d82e11ee-0014-49fe-9b62-fc6b03640119',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-854',nmfault='MASTER ISSUE COMPONENT',guid='67751a00-dc90-40c0-a7f2-4715a8d4a2d9',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-857',nmfault='MASTER ISSUE RETEST',guid='e86a838c-9e1d-41b9-8899-f1190df931da',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-860',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1d130c30-520b-4eb8-b07f-f24be2d3b597',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-863',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='432b8a77-f739-4b92-a32f-8c55fdcfed4c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-866',nmfault='REPAIR/REPLACE',guid='99d9fc5e-9d3a-453e-99cf-295368bb00ea',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-869',nmfault='REPAIR/REPLACE UNIT',guid='0665e720-faf0-44c3-8765-0f1a77687a55',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-872',nmfault='REPLACE BEARINGS',guid='9c6e0836-6320-4ca5-96b5-f3f3d0b85f1d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-875',nmfault='RETEST UNIT PER VTAG',guid='4a7c0cb3-f047-41cb-a73d-d592c1e390dd',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-881',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='f3e54614-7935-4c4f-bb27-94cd6934d1cd',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-884',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='66ca56e3-f36e-4cca-9b9f-0f7b4db16d94',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-887',nmfault='GEAR MESH PROBLEM',guid='24e66026-9b6b-44bb-b74e-2c530447fd48',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-890',nmfault='IMBALANCE',guid='eb52540d-1085-416f-989c-382ddc04206b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-893',nmfault='LOOSENESS',guid='5c920ce7-8282-41c2-b183-361956e25619',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-896',nmfault='MASTER ISSUE BEARINGS',guid='821a4ed9-5f75-48c7-8387-67e396965d45',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-899',nmfault='MASTER ISSUE COMPONENT',guid='8c570f0c-d1a1-4f3b-9756-89b3b15318a4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_gear_6_problem() end
  ,nmrule='RecRuleLine-902',nmfault='MASTER ISSUE GEAR',guid='10728dcb-a276-4ca0-a400-e9728a11aaec',parfault=nil,fault='f1413466-c387-4b75-a2a8-d92ea353cf18',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,autoprime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-905',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6904659b-ad47-4b57-a81a-f97fb5327f37',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-908',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='20ae67d7-c852-42f8-bad7-7320b287c2f3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-911',nmfault='REPAIR/REPLACE',guid='e68ab910-e81e-437f-a7ec-cd32395ca4d6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-914',nmfault='REPAIR/REPLACE UNIT',guid='a9c538f0-92da-4f8c-a35d-56f6b9f0c719',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-917',nmfault='REPLACE BEARINGS',guid='a158d55a-10e8-4f91-b940-229d58ae1d57',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-923',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='51869404-de0d-4653-b87e-971ccd62fe6c',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-926',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='2eac90ac-8dd7-4dd9-ac38-4aff1fc041c7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-929',nmfault='GEAR MESH PROBLEM',guid='94ee3edd-635f-4558-a846-0286bfc0738e',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-932',nmfault='IMBALANCE',guid='9a5bdb97-3540-4c42-a53b-fa711067e6d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-935',nmfault='LOOSENESS',guid='ae5f0824-d93a-46c8-a824-b1686a6dfc9a',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-938',nmfault='MASTER ISSUE BEARINGS',guid='1e991af3-8772-4b63-9659-19d15307bf85',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-941',nmfault='MASTER ISSUE COMPONENT',guid='40716fb8-5571-4863-8108-175ace8a4529',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-944',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fd5371f3-ac0e-43a8-8cdd-d0ade8568af8',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-947',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='accddfe7-1205-4937-a89a-7ff94bd8ae67',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-950',nmfault='REPAIR/REPLACE',guid='2656f52d-8c8b-4e6d-9800-a32f4c77023f',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-953',nmfault='REPAIR/REPLACE UNIT',guid='b163a25f-cc8c-4f0d-a0b6-5ead2adef7ef',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-956',nmfault='REPLACE BEARINGS',guid='9d5fb87f-0466-45b6-8031-278f92697da0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-962',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='747f362c-1006-4967-921a-7c4e5368da5e',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-965',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3e8dafe4-a1ad-49e7-afe2-cca14f815f5b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-968',nmfault='GEAR MESH PROBLEM',guid='1fdd313b-ce1b-49b1-94e7-5a24a0730245',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-971',nmfault='IMBALANCE',guid='be8986d6-853a-4e6a-9998-fb24e153d4a6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-974',nmfault='LOOSENESS',guid='488c8529-1044-4241-a2dc-2c346be204cd',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-977',nmfault='MASTER ISSUE BEARINGS',guid='1a7a0388-132c-44d7-b190-06beab29a1b3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-980',nmfault='MASTER ISSUE COMPONENT',guid='40df0937-0ea3-4f9b-bb44-2242b9f7cb1c',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-983',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='072144cd-76bf-4f66-abb6-d165ec4bc0d1',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-986',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4af0b150-8c81-4b50-b7dd-c20c3d874cd5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-989',nmfault='REPAIR/REPLACE',guid='fb865b44-7972-42bf-9aa5-e68c1b8a982c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-992',nmfault='REPAIR/REPLACE UNIT',guid='af11d9bf-ac8b-4934-b11b-43568c17405e',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-995',nmfault='REPLACE BEARINGS',guid='2cb66e59-1efd-4a66-816e-b07cbd835838',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-GR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1001',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='f0166847-33b9-4206-8fa7-fbee3babbb0c',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1004',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='befa4959-d896-425d-aff2-912fbe82cda1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1007',nmfault='GEAR MESH PROBLEM',guid='6ffefc73-e8e0-4507-a53f-8884fb67ff58',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1010',nmfault='IMBALANCE',guid='f5e1e678-b50a-4605-a244-db9d6a9a1b56',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1013',nmfault='LOOSENESS',guid='960fe7cb-2a7f-448d-b96a-b8c9ef31aaf6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1016',nmfault='MASTER ISSUE BEARINGS',guid='3fcfafb7-9c73-41a6-a36a-579b034a51cf',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1019',nmfault='MASTER ISSUE COMPONENT',guid='1ab867b6-230f-493a-95c5-8c6f429268d4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1022',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5aa1504e-1e4e-4ba6-9935-c298d46534ee',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1025',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a364d436-f350-4c96-9db7-ed91c9b5dd72',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1028',nmfault='REPAIR/REPLACE',guid='a5fbe468-d1ea-4b74-beb3-b0cf17ebdb87',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1031',nmfault='REPAIR/REPLACE UNIT',guid='24deb73d-5265-487a-9f71-629cf5aa2bdc',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1034',nmfault='REPLACE BEARINGS',guid='564825fa-41b5-403c-a4b3-704efcbc9ed3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1040',nmfault='GEAR MESH PROBLEM',guid='0e37d678-0b8d-4db8-9c78-0d0033db1460',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='2dea347f-8ab2-4e34-8b68-413d31d38a8a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR-BRG-GR
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1046',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='c9b31a80-dca2-4d0d-997a-5191a969dbff',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1049',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fbff74fa-f066-4ffd-ac67-dc27430cae81',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1052',nmfault='GEAR MESH PROBLEM',guid='2347e2f4-a7ae-44ad-88d1-1cbd5291ea93',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1055',nmfault='IMBALANCE',guid='4d80ba93-efe1-4c7c-bdba-17ad54c0aeb9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1058',nmfault='LOOSENESS',guid='5105a731-4bd5-4e95-8d4d-a32d6ab36fac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1061',nmfault='MASTER ISSUE BEARINGS',guid='52d51a6c-156e-4a19-b6bd-e0edb73464b5',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1064',nmfault='MASTER ISSUE COMPONENT',guid='75fe483b-00a2-4938-bfce-aece396bd464',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1067',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='cb92d733-f830-4bd5-8b17-57235c400bf7',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1070',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='bc519a94-ef25-4197-822b-bd349acf0fe2',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1073',nmfault='REPAIR/REPLACE',guid='51293d1b-d15f-4f83-8887-5efe308d17af',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1076',nmfault='REPAIR/REPLACE UNIT',guid='f911f364-c0b4-4e63-94c1-8fee2ddb8e11',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1079',nmfault='REPLACE BEARINGS',guid='773b0ab0-2840-4755-b8ae-bcafde9bd9b4',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1085',nmfault='BENT OR BOWED SHAFT',guid='08ee83aa-c7a3-445a-8a70-7f35c9080067',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1088',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='a6fb646c-c736-4652-a55a-3cb22409b8dc',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1091',nmfault='ELECTRICAL PROBLEM',guid='46a15ed4-9da3-4254-8028-e194531893a4',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1094',nmfault='FAN PROBLEM',guid='ffab68b1-386d-46e0-95d9-04f70d813ff1',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1097',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='cf561af7-1344-4afa-a45b-95144227a240',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1100',nmfault='IMBALANCE',guid='88238328-1d57-4a5c-b292-29c84c943357',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1103',nmfault='LOOSENESS',guid='fd6cf05c-adc2-4f70-a998-ca88445341a4',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1106',nmfault='MASTER ISSUE BEARINGS',guid='68b1bd04-d77b-4ef8-9fcc-3cd2a46e8d4f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1109',nmfault='MASTER ISSUE COMPONENT',guid='b2442481-0077-44f7-b5df-84fe09fbb97a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1112',nmfault='MASTER ISSUE ELECTRICAL',guid='fa8ea690-56ce-46c8-9377-844c7e56dc1a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1115',nmfault='MASTER ISSUE RETEST',guid='d44a26a5-78d4-42af-913f-d990ba9c1b46',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1118',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b8a1d211-05aa-422e-b4e4-e8071718663a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1121',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='124b197e-dc1a-4a86-aa05-49efa0843217',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1124',nmfault='REPAIR/REPLACE',guid='a80b8867-93d3-4172-936e-ea0cfe3d019e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1127',nmfault='REPAIR/REPLACE UNIT',guid='66376e03-32ee-4b41-ac94-10a648546d10',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1130',nmfault='REPLACE BEARINGS',guid='72265714-78b8-4c4f-9ea6-4ac6f06b82eb',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1133',nmfault='RETEST UNIT PER VTAG',guid='c48d1fd1-eb89-4161-9b27-5f18d9584471',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1136',nmfault='ROTOR BAR PROBLEM',guid='62c5d552-7fb4-4225-ba80-d977655ff48b',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1139',nmfault='ROTOR RUB',guid='577ad496-e3fe-4251-9634-4641cd97f351',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-GENSYN-FANVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1145',nmfault='BENT OR BOWED SHAFT',guid='59bc3ce2-017b-4906-ba8b-f158300fd4b8',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1148',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6902202f-a8c3-4a85-b19d-0cc91e02e700',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1151',nmfault='ELECTRICAL PROBLEM',guid='5f8fa6f8-42fc-4176-878d-ecf597b4fef7',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1154',nmfault='FAN PROBLEM',guid='a177d37e-449d-4b37-9d1e-23d89942a461',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1157',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9306ca22-09f3-4cee-ad6d-bbe0bc12f7f2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1160',nmfault='IMBALANCE',guid='1fd0cc12-c01b-4089-bc8b-0a897d72d362',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1163',nmfault='LOOSENESS',guid='72e692ff-ef00-4d5d-a162-56c31765b8b2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1166',nmfault='MASTER ISSUE BEARINGS',guid='332142b2-9267-4ca9-83f7-fc0af61dbdaf',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1169',nmfault='MASTER ISSUE COMPONENT',guid='669fc652-e622-4c87-a2e8-2c7ecd20e375',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1172',nmfault='MASTER ISSUE ELECTRICAL',guid='9a4143a1-18e5-4fb2-a65e-c73d896a34c0',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1175',nmfault='MASTER ISSUE RETEST',guid='50ae5e1e-4cb9-4145-9308-9917380035e7',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1178',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='af512cd5-4794-479a-a588-b5184912c923',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_monitor_unit() end
  ,nmrule='RecRuleLine-1181',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1aa29a47-6231-4fce-addb-d8e342fbee1e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,autoprime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1184',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='90e42b43-2e96-44be-a671-bb0cfec55618',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1187',nmfault='REPAIR/REPLACE',guid='fa868769-e360-4143-a670-562111b64eb4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1190',nmfault='REPAIR/REPLACE UNIT',guid='9ce71510-5208-4ebc-8841-73294c52d8db',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1193',nmfault='REPLACE BEARINGS',guid='0150cc52-7b59-4c72-ad48-d956020c9872',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1196',nmfault='RETEST UNIT PER VTAG',guid='77d25555-1492-4db0-8dd7-d042b8e01807',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1199',nmfault='ROTOR BAR PROBLEM',guid='3b510ac4-9cdb-4f45-b7f4-f25a59240473',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1202',nmfault='ROTOR RUB',guid='0b0e8bbd-7284-4694-a3b4-1d3598bec339',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-GENIND-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1208',nmfault='BENT OR BOWED SHAFT',guid='e8c3127c-b4bd-4760-b193-3a32deee0947',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1211',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='8c02358b-87f3-47d3-b963-5d50ab0571f1',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1214',nmfault='ELECTRICAL PROBLEM',guid='e3b364d1-d66e-4533-873f-e8e25ef0de2a',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1217',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='33e48c11-6a72-41e7-a6e1-135fe7b55db7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1220',nmfault='IMBALANCE',guid='a224ddc3-dc27-4eee-b27d-60d1cdfd23b1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1223',nmfault='LOOSENESS',guid='f4068fc2-abb3-41b1-927f-0f6f61778940',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1226',nmfault='MASTER ISSUE BEARINGS',guid='d125a49b-6e2f-46f9-b7d7-0f240714b785',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1229',nmfault='MASTER ISSUE COMPONENT',guid='5cfe67c9-7c4f-49f1-b6e1-7d298e086a0d',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1232',nmfault='MASTER ISSUE ELECTRICAL',guid='c04cfc11-ee8c-4d99-8aa0-4f15543cf540',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1235',nmfault='MASTER ISSUE RETEST',guid='d04eeb92-e39e-4652-aae5-97d54838ed29',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1238',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='42b428aa-0d85-4102-8bd1-d0f5236610e0',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1241',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c2bafe43-5863-427d-80b3-33ff3bc76db7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1244',nmfault='REPAIR/REPLACE',guid='0a1b174b-f7ca-4059-9799-877bac1c5eea',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1247',nmfault='REPAIR/REPLACE UNIT',guid='8cdd7c64-21ce-4353-8fd3-8eeeacba6044',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1250',nmfault='REPLACE BEARINGS',guid='e1804eaa-b2d6-4362-b0d4-d79620d198f9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1253',nmfault='RETEST UNIT PER VTAG',guid='b2880263-ad0a-45cc-809a-975f7c571eae',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1256',nmfault='ROTOR BAR PROBLEM',guid='2e8e8d41-ad6c-498e-9b14-b5bfeb9a6bdc',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GOVENOR-BRG-GOV
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1262',nmfault='IMBALANCE',guid='eb33c7ad-b06e-4dcd-af56-6f4dcfee39d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1265',nmfault='LOOSENESS',guid='e1018e8b-a32e-4dff-a6fc-18a1d4017504',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1271',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='13fe3138-73ef-4718-865e-1415567dc967',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1274',nmfault='ELECTRICAL PROBLEM',guid='0154952d-e064-48aa-9af9-d4277a4aeebe',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1277',nmfault='FAN PROBLEM',guid='18b8f7b5-6c5c-44df-87ad-4d16422ee14f',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1280',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3aecd665-43d7-4709-a53b-bcd589cfcdf6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1283',nmfault='IMBALANCE',guid='94cef2a8-743b-4847-9cc0-ef3c4e405093',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1286',nmfault='LOOSENESS',guid='be648058-0da2-4073-895a-3910c8c605f6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1289',nmfault='MASTER ISSUE BEARINGS',guid='c50edc13-f8f2-40a6-9b95-6300d856a034',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1292',nmfault='MASTER ISSUE COMPONENT',guid='2ad20163-8b45-49cd-a487-b0e92e669914',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1295',nmfault='MASTER ISSUE ELECTRICAL',guid='02f0bc12-ea3c-4ca5-b2db-cc8c1392faa7',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1298',nmfault='MASTER ISSUE RETEST',guid='75905251-befc-4c1f-981e-2845adf4dd77',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1301',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b6c830b3-29bb-4782-b08b-65532b3b133a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1304',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e0135712-019e-4c2d-8e81-c7a95d3ebf1f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1307',nmfault='REPAIR/REPLACE',guid='27d52e1c-8da3-4b9e-8a16-d9eea191c3be',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1310',nmfault='REPAIR/REPLACE UNIT',guid='34cab4a8-b0ed-4e48-b688-9ab93a22df8d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1313',nmfault='REPLACE BEARINGS',guid='2cfebe90-1e2d-4ac1-8f42-beff138efeee',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1316',nmfault='RETEST UNIT PER VTAG',guid='05939dca-dd8c-4afc-bf78-8dfdf6152067',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1319',nmfault='ROTOR BAR PROBLEM',guid='bd3b893f-0230-400d-b31b-df05d768e5a3',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1322',nmfault='ROTOR RUB',guid='c938aa2e-b1a3-40cb-a1ce-8ccd9f7db4b0',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-FANVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1328',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6cf91ca0-9ae8-4ed8-b706-7167d159ef24',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1331',nmfault='ELECTRICAL PROBLEM',guid='80168c20-1c77-4653-b066-4d573b196848',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1334',nmfault='FAN PROBLEM',guid='d9ef1d7f-ba7e-4461-9d44-188e7bc37892',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1337',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='27e972b3-f5fb-4393-b57c-f0c1005e4e69',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1340',nmfault='IMBALANCE',guid='8859756c-4717-426a-a11c-72492a18dae9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1343',nmfault='LOOSENESS',guid='a175bbe7-e236-427d-b9b4-883e528aa6dc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1346',nmfault='MASTER ISSUE BEARINGS',guid='678ef381-d9d5-440f-86fa-ff1248135e4d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1349',nmfault='MASTER ISSUE COMPONENT',guid='aecd36c8-afd9-476a-b152-fb0b306146a2',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1352',nmfault='MASTER ISSUE ELECTRICAL',guid='6a878290-b081-4b2d-845e-73f96632f267',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1355',nmfault='MASTER ISSUE RETEST',guid='ce0a8470-7022-4197-861f-244e3afec4c3',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1358',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4deb1428-2d97-4563-8f7a-945e0e8bdd53',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1361',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='957c77a8-6187-4ddb-83d9-a3562ae6cfe0',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1364',nmfault='REPAIR/REPLACE',guid='e6cfff9d-d39a-452c-81bf-1f9fb739dcf5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1367',nmfault='REPAIR/REPLACE UNIT',guid='df29e87b-f621-4a5f-a3a5-d1ec684a3c49',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1370',nmfault='REPLACE BEARINGS',guid='2fc255cb-3fe6-4faf-abf1-b4d79e628bc8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1373',nmfault='RETEST UNIT PER VTAG',guid='e2980544-45b9-4f53-aeab-a45e4065afff',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1376',nmfault='ROTOR BAR PROBLEM',guid='1036116a-7631-420e-9c1c-6c7be268e1de',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1379',nmfault='ROTOR RUB',guid='cb7856b4-02a8-41c4-a581-e2cc12e2938d',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTIND-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1385',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='58b9aec0-f431-4ba2-a6df-41a95ecb69cb',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1388',nmfault='ELECTRICAL PROBLEM',guid='530754a7-7b93-49c4-9263-913da4cffb4f',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1391',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8d316fa2-4f2d-4c6e-861d-173f487515a0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1394',nmfault='IMBALANCE',guid='f3dc4f6e-9b45-473d-bfef-ed040a78c16a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1397',nmfault='LOOSENESS',guid='f841410e-0fb5-47d9-94b5-9c49a61daf2d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1400',nmfault='MASTER ISSUE BEARINGS',guid='d5192283-54cc-4e7b-9d6f-d14972fc1b45',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1403',nmfault='MASTER ISSUE COMPONENT',guid='2d25356f-094c-4578-a108-cf4f6a4678b2',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1406',nmfault='MASTER ISSUE ELECTRICAL',guid='a94c6d83-8dea-4962-9838-8f56ce8f9b8f',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1409',nmfault='MASTER ISSUE RETEST',guid='d0f0210d-3b28-4a27-909d-e7f8d285d4aa',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1412',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0c3ee23d-b799-4db6-806f-9133775a9381',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1415',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='78c9ff18-3c5e-437b-9ef1-496a408ae3b8',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1418',nmfault='REPAIR/REPLACE',guid='92ded557-aaac-4b83-b429-45680adf59c5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1421',nmfault='REPAIR/REPLACE UNIT',guid='3adbd866-fc30-44c3-99b0-cc1ef7b75aa4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1424',nmfault='REPLACE BEARINGS',guid='08fd98a9-05ba-4468-895d-b4486045fb04',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1427',nmfault='RETEST UNIT PER VTAG',guid='d13ed28d-bff1-473c-b473-be016756363f',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1430',nmfault='ROTOR BAR PROBLEM',guid='562b86e7-a483-48d4-92ba-fd49d934aad0',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1433',nmfault='ROTOR RUB',guid='51ff2dc4-609b-4b4b-a5d9-9e787818a380',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTPSTN-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1439',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6ceb3b6e-757b-4fb0-a5db-5a30db49d179',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1442',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='badea390-88d4-47f3-894c-1932dcaa2f86',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1445',nmfault='IMBALANCE',guid='60c2f1c2-a93a-4264-9302-caf46cfbe84c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1448',nmfault='LOOSENESS',guid='2f9ff772-924d-4901-b065-78f15ee93d81',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1451',nmfault='MASTER ISSUE BEARINGS',guid='4849c807-4989-45ef-a52b-bd1ad1b2ce4b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1454',nmfault='MASTER ISSUE COMPONENT',guid='b946d8a8-06e0-4ed5-a552-1e813804d305',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1457',nmfault='MASTER ISSUE RETEST',guid='f2bbe4ff-f8f6-41e1-8ace-ace8c244896a',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1460',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='095d582a-54d8-4574-a241-71074868aaa4',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1463',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fddd029f-b5ae-4963-b364-46ab9189474c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1466',nmfault='REPAIR/REPLACE',guid='18c17899-d5fd-4675-a9ba-e08f13d80b8b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1469',nmfault='REPAIR/REPLACE UNIT',guid='18904b97-d993-42d6-bec2-962af8c25255',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1472',nmfault='REPLACE BEARINGS',guid='fb0b330d-8ff6-41b1-927c-9006ce59b8dd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1475',nmfault='RETEST UNIT PER VTAG',guid='551c93cb-23a1-407b-9f5e-a32c3c18991e',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1481',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='309d6348-ab56-4263-97a1-6aa282dde990',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1484',nmfault='ELECTRICAL PROBLEM',guid='9453af31-fb2e-4b66-846c-ec2f36e17c60',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1487',nmfault='FAN PROBLEM',guid='50953da7-eb97-47a2-84d9-07f882c9abfd',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1490',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5e5f4115-1630-4125-9c0a-f2886c37ebb7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1493',nmfault='IMBALANCE',guid='2a657674-c7ee-4035-bbd2-00fe0ee84eb6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1496',nmfault='LOOSENESS',guid='8486d318-c5bc-4c55-847a-dac681e263a9',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1499',nmfault='MASTER ISSUE BEARINGS',guid='99893390-c156-40b8-846d-4733c8560928',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1502',nmfault='MASTER ISSUE COMPONENT',guid='889a14b6-d609-43ea-8bee-2149deca7bac',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1505',nmfault='MASTER ISSUE ELECTRICAL',guid='e2a0d8df-09d2-4d84-857e-00505add4e0b',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1508',nmfault='MASTER ISSUE RETEST',guid='95bdac9d-8d53-4c48-a9d9-17e437f242d4',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1511',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e643d412-6022-4468-bbcc-44c80910871b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1514',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='262d14d1-a856-4ca8-9a3a-fca7fafe44f0',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1517',nmfault='REPAIR/REPLACE',guid='b3652177-f24c-4d00-a090-13a399b48e82',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1520',nmfault='REPAIR/REPLACE UNIT',guid='08489b83-46ef-469b-a73f-79adb91f594f',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1523',nmfault='REPLACE BEARINGS',guid='d120d19a-3fe4-432c-8dfd-5430b460b983',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1526',nmfault='RETEST UNIT PER VTAG',guid='b78d3896-2e94-4549-a368-bdbd99e78a15',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1529',nmfault='ROTOR BAR PROBLEM',guid='bd191f1c-1030-4bc4-88a3-0dd1f263e8a4',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1532',nmfault='ROTOR RUB',guid='31c22deb-930f-4a73-a4fc-d193b4355925',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG-FANVNS
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1538',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='5afb824b-74c2-4b2a-b88f-e7134ee9273f',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1541',nmfault='ELECTRICAL PROBLEM',guid='619f706a-0000-4183-9a04-dfae29e8b8c7',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1544',nmfault='FAN PROBLEM',guid='dfdd5569-9088-4978-a090-1e29961543de',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1547',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='6955032c-3ad6-4357-80cd-58ebdd8a4929',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1550',nmfault='IMBALANCE',guid='cbcbf760-4e31-4b41-b0a8-affd29e19ab6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1553',nmfault='LOOSENESS',guid='530074f7-305a-4d7e-a26f-34dc95cdfcdb',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1556',nmfault='MASTER ISSUE BEARINGS',guid='86b821b1-c652-41e2-8b27-4fc477ac4e26',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1559',nmfault='MASTER ISSUE COMPONENT',guid='83822019-c84e-4588-b25c-01c8df96d2e4',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1562',nmfault='MASTER ISSUE ELECTRICAL',guid='e0af6354-741f-4d84-b398-c6b2f2b8ec2a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1565',nmfault='MASTER ISSUE RETEST',guid='2e029dd2-73e0-40d7-b34d-c644e0e602ad',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1568',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='710eb800-b66f-4b13-a3f6-ceccf912e879',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1571',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1fd205a1-ae03-4557-91b0-6c30eb16dba3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1574',nmfault='REPAIR/REPLACE',guid='37caa90a-d784-42db-8c24-9506fe49fc3a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1577',nmfault='REPAIR/REPLACE UNIT',guid='33bba000-b662-4d97-87e3-c4d0bc8a6cde',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1580',nmfault='REPLACE BEARINGS',guid='0221312a-122a-4308-bf5a-e207aea14296',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1583',nmfault='RETEST UNIT PER VTAG',guid='3dc76e2d-6632-4a41-81e1-34df4da2318e',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1586',nmfault='ROTOR BAR PROBLEM',guid='d883932c-07c6-4dfd-b25c-8b84e7f3eb7d',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1589',nmfault='ROTOR RUB',guid='d2473b17-9630-4254-adc3-b64ea281ba6a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-FANVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1595',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='6de75b22-bd36-4cab-827a-4113922fc6d4',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-1598',nmfault='ELECTRICAL PROBLEM',guid='70564fae-858b-4be1-87bf-cc60dfb0c8b9',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1601',nmfault='FAN PROBLEM',guid='9e3957b5-4582-4ca7-9215-478fedec1a30',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1604',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fcb91322-572e-4d3e-b488-2126ba756bfb',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1607',nmfault='IMBALANCE',guid='2806fd00-64ca-40e6-8fd6-64c385c90d4c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1610',nmfault='LOOSENESS',guid='b9a5d731-e3b7-441d-a3e6-1b694099d701',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1613',nmfault='MASTER ISSUE BEARINGS',guid='a2c0c2f5-4ff7-4c25-96a7-397d5f0a240a',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1616',nmfault='MASTER ISSUE COMPONENT',guid='09efd4a2-a1d7-4709-9577-f19c7ebb741e',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-1619',nmfault='MASTER ISSUE ELECTRICAL',guid='ada13013-6ab8-41a3-96ab-2de7bb9f9e6e',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=2,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1622',nmfault='MASTER ISSUE RETEST',guid='e89983b2-2727-4718-a939-3e3dfc447cce',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1625',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='40903455-9a50-467e-870e-4ca23aef679e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1628',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b9761390-8b79-40b7-811d-3dbf9afacaf3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1631',nmfault='REPAIR/REPLACE',guid='e7045fbb-e774-44d6-8760-0e70091845ad',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1634',nmfault='REPAIR/REPLACE UNIT',guid='a721d38b-604c-4e63-bd02-22f6ee31bcc7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1637',nmfault='REPLACE BEARINGS',guid='a7208bad-f596-4c3c-9cfd-7822ac919397',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1640',nmfault='RETEST UNIT PER VTAG',guid='497bca0a-7854-403b-8448-aa6917b1abaf',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-1643',nmfault='ROTOR BAR PROBLEM',guid='041b5655-e57e-423b-9193-5aec83d561cd',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1646',nmfault='ROTOR RUB',guid='28835fc2-d1d6-4acb-a8cc-101a9bb4183a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PULLEY-BRG-PUL
---- BELT IRREGULARITY
table.insert( g_rec_rules, {rule=function() return rec_belt_problem() end
  ,nmrule='RecRuleLine-1652',nmfault='BELT IRREGULARITY',guid='3c41af1d-89ec-4751-b7ce-29273a30f43a',parfault=nil,fault='653a79a5-2527-4403-8be9-d1661d465191',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1655',nmfault='IMBALANCE',guid='0846d62b-3d8a-4768-aeb7-1c0b51099d2a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1658',nmfault='LOOSENESS',guid='beed1f7e-d678-4570-b8e7-20136b681800',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1661',nmfault='RETEST UNIT PER VTAG',guid='b293d015-9a5d-4f20-9f09-fb9d1e7e3b8d',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_sheave_problem() end
  ,nmrule='RecRuleLine-1664',nmfault='SHEAVE PROBLEM',guid='5d529b20-d08e-4d49-98ec-d0112ee70144',parfault=nil,fault='f985b847-a3a5-4898-a68c-a81b9fcd98c9',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- Pulleys
---- BELT IRREGULARITY
table.insert( g_rec_rules, {rule=function() return rec_belt_problem() end
  ,nmrule='RecRuleLine-1670',nmfault='BELT IRREGULARITY',guid='ce8f209c-95f2-4903-b720-159bfe6a10e1',parfault=nil,fault='653a79a5-2527-4403-8be9-d1661d465191',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_belt_slippage() end
  ,nmrule='RecRuleLine-1673',nmfault='INSPECT DRIVE BELT FOR WEAR AND TENSION',guid='3fbe5690-e7e4-4bd5-91c4-595377208198',parfault=nil,fault='2828160e-f7ae-4a00-b682-5bb97585f230',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1676',nmfault='RETEST UNIT PER VTAG',guid='73dedeca-772c-4703-a48b-e9d7cdb938b0',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_sheave_problem() end
  ,nmrule='RecRuleLine-1679',nmfault='SHEAVE PROBLEM',guid='238aa2c0-f809-465b-9289-8aad801732cb',parfault=nil,fault='f985b847-a3a5-4898-a68c-a81b9fcd98c9',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGFLEX-CPLGFLEX-BRG-PMPOIL-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-1685',nmfault='ANGULAR MISALIGNMENT',guid='2c86d9d7-f716-4979-bc1c-0119ed76e9ed',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1688',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='918fcbc8-5c33-46c2-bd67-a3bf2fa11709',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1691',nmfault='LOOSENESS',guid='263000fd-9cce-4ba2-bcd2-fbb8ec9a72ef',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1694',nmfault='MASTER ISSUE BEARINGS',guid='69e604d0-7667-47f2-be5b-d8ba897ae48e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1697',nmfault='MASTER ISSUE COMPONENT',guid='b656d880-c72b-4676-8115-c6e1a7d78ff0',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1700',nmfault='MASTER ISSUE RETEST',guid='8999f18d-029f-4fe9-8183-bf451cca3b50',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1703',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5bc3d5ac-e389-437f-9c08-0100b1c2388a',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1706',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='17821d0a-db8f-42db-98df-4b11a1807262',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-1709',nmfault='PARALLEL MISALIGNMENT',guid='78831f68-2dd1-4ca7-a76f-6a01761b9a99',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1712',nmfault='REPAIR/REPLACE',guid='b22cbc67-0169-412c-8986-0c5dfc303876',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1715',nmfault='REPAIR/REPLACE UNIT',guid='63681dfc-e51f-4619-b66d-d504f4d04bca',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1718',nmfault='REPLACE BEARINGS',guid='150b99f4-21ab-40e3-abcd-cc6d7fb60e24',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1721',nmfault='RETEST UNIT PER VTAG',guid='0bc8eb9d-5932-448f-a526-a56db0e03dc9',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGRGD-PMPOIL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1727',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='523357e5-4a5a-49a6-8dbe-32002c1e1263',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1730',nmfault='LOOSENESS',guid='9e5ee10d-a87f-42af-8469-c07a29b3863d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1733',nmfault='MASTER ISSUE BEARINGS',guid='83b069a9-25ce-402d-a9f9-63e402ac771b',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1736',nmfault='MASTER ISSUE COMPONENT',guid='d4be2dd3-8c14-422e-a37d-285fb6be2047',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1739',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='024de481-22c4-4675-88a1-7d80dc27b996',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1742',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='44a1052c-56d1-4311-a8e3-1b4bb158ed4a',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1745',nmfault='REPAIR/REPLACE',guid='01059651-c94d-4e98-a3db-56945c1cc209',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1748',nmfault='REPAIR/REPLACE UNIT',guid='e5f63622-43ce-469c-bb22-df399e85d1f3',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1751',nmfault='REPLACE BEARINGS',guid='34f8e385-43ff-4674-b4ad-0ee438e1af92',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1754',nmfault='RETEST UNIT PER VTAG',guid='cf959697-13b9-468c-8160-f0508876446e',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-GR-PMPPSTNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1760',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='3f82ab7c-5568-4487-ac78-154ffc9fbd7d',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1763',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b5945e19-6edf-4048-8d01-e18601b6eaaf',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1766',nmfault='IMBALANCE',guid='f68ee5bc-cee8-4e59-9f7c-17b3f95cf501',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1769',nmfault='LOOSENESS',guid='82e404be-299a-4c60-9d7d-95af86223cbc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1772',nmfault='MASTER ISSUE BEARINGS',guid='eede85c5-5ad4-4f5d-be24-a9eccd499d01',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1775',nmfault='MASTER ISSUE COMPONENT',guid='08b6cbb5-36d0-4cce-9ac1-f3c719469623',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1778',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ba2ad505-e5c6-4f30-8b22-fc4d9cf46999',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1781',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='572e6fc5-1a87-461b-9c18-55b55eacafe4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1784',nmfault='REPAIR/REPLACE',guid='840558f5-1c05-48be-a535-ab55a365afa0',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1787',nmfault='REPAIR/REPLACE UNIT',guid='a7d6c8aa-7483-4754-a0b6-03653d2f73a4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1790',nmfault='REPLACE BEARINGS',guid='b9261b7e-f6d2-4563-84fe-0129c8b35935',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1793',nmfault='RETEST UNIT PER VTAG',guid='cd7ee51a-50fc-4e3f-9377-392df9781116',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR
---- IMBALANCE
table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1799',nmfault='IMBALANCE',guid='d3d52141-7388-40f7-b19c-44552cf44e3c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1802',nmfault='LOOSENESS',guid='ac420a7a-7a10-4a60-a47f-a78abaa3cfa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1805',nmfault='MASTER ISSUE BEARINGS',guid='ccf05f93-f778-476d-a920-c7003b120c6d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1808',nmfault='MASTER ISSUE COMPONENT',guid='fe33b587-a046-4aed-89b9-451d46c085c8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1811',nmfault='MASTER ISSUE RETEST',guid='042f1aab-0467-4ae7-947d-bff8d26b89b0',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1814',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fa4ac47b-2974-4a73-9486-05ca8193cb7e',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1817',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0c86c049-fa1c-4f3b-9730-1813a6a89c1e',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1820',nmfault='REPAIR/REPLACE',guid='bc3da283-ce98-4f61-90ed-6ed544777253',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1823',nmfault='REPAIR/REPLACE UNIT',guid='80377097-583a-4908-a26d-236a2f2b5da7',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1826',nmfault='REPLACE BEARINGS',guid='20ae74d4-1c0b-4f72-b70a-f5331e6e2b59',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1829',nmfault='RETEST UNIT PER VTAG',guid='c18bded3-2db1-47ee-81a4-9fc4225837fd',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1832',nmfault='ROTOR RUB',guid='490cf670-a380-4ef3-b02c-34ceecca5719',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-BRG
---- FOUNDATION TRANSVERSE FLEXIBILITY
table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1838',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9d2af9fb-002a-4cfc-bd46-e1ee86425a5e',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1841',nmfault='IMBALANCE',guid='ad45c239-7732-4626-a127-e3d01193e716',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1844',nmfault='LOOSENESS',guid='d85a4fe6-4b5a-4af5-bc44-0408e9979eea',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1847',nmfault='MASTER ISSUE BEARINGS',guid='74ebe161-aa2f-4f68-9673-e13b01963ae3',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1850',nmfault='MASTER ISSUE COMPONENT',guid='a62c90f6-d3bb-4d04-9daf-ee6a21dc261f',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-1853',nmfault='MASTER ISSUE RETEST',guid='c877d98d-a20f-4294-9d68-c7f9e873372d',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1856',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='b50d660f-67d1-41f9-8527-0cd83d7ee2ab',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1859',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='06defc3f-e77a-4d71-99a4-b13092deb333',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1862',nmfault='REPAIR/REPLACE',guid='48feae34-7d83-4354-b9ab-fc49be90c970',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1865',nmfault='REPAIR/REPLACE UNIT',guid='16fabfe2-8047-4ffc-b6ee-27bb008a6b8f',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1868',nmfault='REPLACE BEARINGS',guid='9fe8ed00-fe7b-4f65-a55b-c76e3993e100',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1871',nmfault='RETEST UNIT PER VTAG',guid='6c8f3bd2-3baf-4269-99b1-35e7365e4256',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1874',nmfault='ROTOR RUB',guid='8aef1f48-9ab0-4fd7-b9b7-54d2e45e30e9',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPIMPLR-BRG-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1880',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='78222db0-2954-4204-aee6-f698d34e9b92',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1883',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b6798ab5-8ee5-4f4b-bedf-29b32611820b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1886',nmfault='IMBALANCE',guid='a44d1920-83b6-4027-b1d9-961c0318cbb3',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1889',nmfault='LOOSENESS',guid='b820d17a-6fb2-40a0-a817-dc1af698e14d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1892',nmfault='MASTER ISSUE BEARINGS',guid='aa9b2738-1abc-4604-ab34-c6b8958a299f',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1895',nmfault='MASTER ISSUE COMPONENT',guid='e9f7bf2f-42f7-4d75-93c6-4181afbbe2e6',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1898',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='260ccb5c-1b15-416b-9429-6fc047214ae1',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1901',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='2c59b357-57f9-4685-9754-ecf77ffe7cdb',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1904',nmfault='REPAIR/REPLACE',guid='9934a790-08cf-4e34-9d7b-7147641b6ee9',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1907',nmfault='REPAIR/REPLACE UNIT',guid='ab1b74eb-8bdc-4c68-aa46-e4fbbc8661e0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1910',nmfault='REPLACE BEARINGS',guid='63cf769d-66d9-4a70-8598-6cb8babc1562',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1913',nmfault='RETEST UNIT PER VTAG',guid='95a0f16d-cc5a-4630-b748-f5d8b24a4254',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1916',nmfault='ROTOR RUB',guid='9fcbd117-e9fe-4412-9c60-45cfc14dba8a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1922',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='9878bf10-dc21-4386-a395-dbe6d38fe6ab',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1925',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5958098b-cb66-4b65-bcd1-6a6e68794dd0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1928',nmfault='IMBALANCE',guid='59c96e58-f8aa-4829-8ab0-8ba10b7cb0ba',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1931',nmfault='LOOSENESS',guid='6ba74dae-dd68-42c8-85bd-28e30fbbc022',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1934',nmfault='MASTER ISSUE BEARINGS',guid='91eeb40b-e368-4c65-8ac4-eda60f4b6210',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1937',nmfault='MASTER ISSUE COMPONENT',guid='2a4dc047-9e40-4c34-8906-ec4ce92cf428',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1940',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='62e1ae4c-1f89-4686-a9ec-f1c55672ec15',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1943',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='0739a477-c788-4084-aa17-b258bd5c3817',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1946',nmfault='REPAIR/REPLACE',guid='eb09c64b-653c-4797-98bb-33627a397a4e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1949',nmfault='REPAIR/REPLACE UNIT',guid='6ddb1aec-f52a-4180-86bf-b7c08387b1f5',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1952',nmfault='REPLACE BEARINGS',guid='7e80714c-9774-49db-8f7e-e995908dc149',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1955',nmfault='RETEST UNIT PER VTAG',guid='bc3503ee-1a2d-4d6d-a5e9-a05ebe43d0c3',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1958',nmfault='ROTOR RUB',guid='d65135fc-3d4b-42a4-b469-7a454a800228',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPOIL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-1964',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='d1bd88dd-d86a-46e5-9a06-81fc00dac115',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1967',nmfault='IMBALANCE',guid='852d1ed3-75a3-4665-ac95-da492da5e963',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1970',nmfault='LOOSENESS',guid='f46d84c6-f488-4b68-b37e-204c18d4ad07',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-1973',nmfault='MASTER ISSUE BEARINGS',guid='28f83c21-bf86-4607-b848-84035dc654d0',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-1976',nmfault='MASTER ISSUE COMPONENT',guid='ec120da6-1bd4-4a52-86ab-8bb59d75cfe8',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-1979',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='441ff9f1-9e0e-42da-a666-4e0104bda490',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-1982',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3aae831a-3b04-4bc8-8ed0-070df659bbc5',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-1985',nmfault='REPAIR/REPLACE',guid='7a840726-9c30-46a1-bbc9-af65105be6c5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-1988',nmfault='REPAIR/REPLACE UNIT',guid='fbe696e6-17dd-43e0-88d7-a087bbf71629',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-1991',nmfault='REPLACE BEARINGS',guid='4ebc9a1d-3331-4816-bdda-46877fdd0614',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-1994',nmfault='RETEST UNIT PER VTAG',guid='1a90de09-2cb4-4046-86e4-fa2e2163ba51',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPPSTNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2000',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='d53d9114-1ad4-4cb4-9253-01b0ffeb2111',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2003',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='382a38b2-986b-43f7-b2f3-d04115d0e343',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2006',nmfault='IMBALANCE',guid='ba64c51b-6d3a-46a3-9abf-a350f2817123',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2009',nmfault='LOOSENESS',guid='2e288434-4d0b-40de-a1ba-66e7016ad446',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2012',nmfault='MASTER ISSUE BEARINGS',guid='b0fa0a9c-a82b-41b6-9a9c-d8c9d45f3762',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2015',nmfault='MASTER ISSUE COMPONENT',guid='d98066a7-82fd-4e4d-b37e-57a27f2e8521',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2018',nmfault='MASTER ISSUE RETEST',guid='37d85b1e-f4bd-476b-bb11-5b17a9b47aa5',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2021',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6343fcf4-512e-4a15-8d5e-abbbd23ada37',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2024',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='e02bcb09-c6da-40cc-8911-7dd6a17f4f7f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2027',nmfault='REPAIR/REPLACE',guid='d06e6a1c-01d7-40a9-9eb7-0d56b568092c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2030',nmfault='REPAIR/REPLACE UNIT',guid='1e05f436-41a2-45d9-b328-4d6c50d98ba4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2033',nmfault='REPLACE BEARINGS',guid='51e9ed0f-373f-4fda-92de-56c3d9f39ba0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2036',nmfault='RETEST UNIT PER VTAG',guid='1bd9aee3-00d9-486f-b5f0-bf1aecbe6e02',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPSCR-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2042',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='8e548516-0c79-4ce2-aaba-7fc548304329',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2045',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8562aa6-5e7a-4809-8e43-d07328799de1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2048',nmfault='IMBALANCE',guid='6ef32f2d-c5fc-42f5-98a2-3ffc8034f11a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2051',nmfault='LOOSENESS',guid='beab5d52-14b1-411c-8758-fa80029b5fa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2054',nmfault='MASTER ISSUE BEARINGS',guid='c41918cd-ebf9-41e3-9aea-0d9f8083ee82',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2057',nmfault='MASTER ISSUE COMPONENT',guid='674c4d2b-e85c-400f-9ace-1414832c6740',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2060',nmfault='MASTER ISSUE RETEST',guid='50785f1d-88a8-412d-92dd-e83ea8adb23d',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2063',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='597f525c-e91b-4250-bb2e-a59f1401df45',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2066',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='749e28be-2840-411e-bce9-111974b8ec8d',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2069',nmfault='REPAIR/REPLACE',guid='9aa8b00e-2c19-4574-b02a-ce43cf00acc4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2072',nmfault='REPAIR/REPLACE UNIT',guid='b765ac8b-1285-4725-b6c2-ba6c755cc5e1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2075',nmfault='REPLACE BEARINGS',guid='07705059-3b0e-4a5e-b305-1c5a6b076a8b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2078',nmfault='RETEST UNIT PER VTAG',guid='bce94e98-b477-4d4b-88ff-bbb1dd5fb057',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2084',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='b9cb8669-01b3-4bd7-a1dc-3c901f62ae77',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2087',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='dec59f14-cac0-4668-b02d-e29265860567',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2090',nmfault='IMBALANCE',guid='6f651c4d-910d-48ce-b0eb-0472af2963de',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2093',nmfault='LOOSENESS',guid='4af232e5-6d33-4e17-acdb-1c5b90657fec',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2096',nmfault='MASTER ISSUE BEARINGS',guid='a88b691d-b689-407a-93c5-c901f66ce13e',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2099',nmfault='MASTER ISSUE COMPONENT',guid='873c96d0-d482-41d5-95a7-a7e56d68561a',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2102',nmfault='MASTER ISSUE RETEST',guid='e527e200-0f57-4290-9fae-215dab98347b',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2105',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1d8ed347-9724-4ef1-9226-ca5e6b5c2d9c',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2108',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ece5da55-0cf4-4348-a8d5-7f34c823de7c',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2111',nmfault='REPAIR/REPLACE',guid='8d5171af-822a-42f5-a047-dfc6ad53c9a0',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2114',nmfault='REPAIR/REPLACE UNIT',guid='99f59f94-7130-4228-9941-19783b7f6357',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2117',nmfault='REPLACE BEARINGS',guid='0e0b7fc9-582d-48ea-9535-a379386ca9c0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2120',nmfault='RETEST UNIT PER VTAG',guid='709ea554-b9b7-4cff-99eb-b6d1f8b280b4',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-CPLGFLEX-PMPOIL
---- ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-2126',nmfault='ANGULAR MISALIGNMENT',guid='45dfb368-bc5e-49ca-9469-91a6f907df97',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2129',nmfault='LOOSENESS',guid='71270616-07ef-4e86-83fe-be1a1f5a97ac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2132',nmfault='MASTER ISSUE BEARINGS',guid='a8525e52-6366-4641-b641-a07eb9114f60',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2135',nmfault='MASTER ISSUE COMPONENT',guid='ee8794db-8e53-428f-a97c-ae2f454a1d00',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2138',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='8f71016f-8db9-4850-90f2-5b810dddc1fc',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2141',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='4a4ae093-d383-428b-ab2c-6ff8a219743b',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-2144',nmfault='PARALLEL MISALIGNMENT',guid='d91f37ca-d5e7-440b-8e35-8f104e459b8c',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2147',nmfault='REPAIR/REPLACE',guid='8e07c182-5bc7-4d1e-b544-8690914ed510',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2150',nmfault='REPAIR/REPLACE UNIT',guid='2b01c4b5-8af8-4116-b8bd-633a15d9b19d',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2153',nmfault='REPLACE BEARINGS',guid='dc72f958-5454-4511-83f8-74d7e3fcdd79',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2156',nmfault='RETEST UNIT PER VTAG',guid='3ed5a0e6-d1bd-4249-9289-4724c741661e',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-GR-PMPOIL
---- GEAR MESH PROBLEM
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-2162',nmfault='GEAR MESH PROBLEM',guid='c46d2d94-5569-43f9-a3fc-3d4dca4212e1',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2165',nmfault='MASTER ISSUE BEARINGS',guid='2b2a9741-49f0-4cc7-9236-fcd4c81d97ea',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2168',nmfault='MASTER ISSUE COMPONENT',guid='dbeba7b9-0931-4bff-b14c-2cda8e32bf9b',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2171',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='007b4141-8bbe-4177-8178-34ce0f6c2a68',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2174',nmfault='REPAIR/REPLACE',guid='7b323700-dcc0-4706-a61f-0b247c819b6b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2177',nmfault='REPAIR/REPLACE UNIT',guid='fc3cbd03-8242-466b-b483-74ecf7eec766',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2180',nmfault='REPLACE BEARINGS',guid='48a641dd-fe91-4082-b43b-a81b319f5a9d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2183',nmfault='RETEST UNIT PER VTAG',guid='082dc64f-bcbf-4ddb-8b5e-ef14c8cee317',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PURIFIER-BRG-PURBWL
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2189',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='a22370af-573c-47be-adc3-fbc8f1dfa289',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2192',nmfault='IMBALANCE',guid='ee76c3ea-c635-4f1c-9001-6db4bc386d27',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2195',nmfault='LOOSENESS',guid='4a28f8c1-650e-426b-9b1b-97fe3ad585e8',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2198',nmfault='MASTER ISSUE BEARINGS',guid='1865f2e5-211d-4a35-b441-bad81143c798',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2201',nmfault='MASTER ISSUE COMPONENT',guid='0802aebc-162b-4c4e-b2b2-2ff0201c9cf5',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2204',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5bc37653-a80f-4cb4-a0bd-9c4041fdba25',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2207',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6aff58d2-f893-4ef2-be40-ab34e2168a35',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2210',nmfault='REPAIR/REPLACE',guid='6c9d5aeb-43da-499a-ab86-57d3d086adc7',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2213',nmfault='REPAIR/REPLACE UNIT',guid='35d1c165-306b-4524-a8fe-76f8811aefd4',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2216',nmfault='REPLACE BEARINGS',guid='97ce74f5-9df4-4c17-a484-0b255a26a442',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2219',nmfault='RETEST UNIT PER VTAG',guid='857c885b-d83c-45a5-bff7-04e09b126de3',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-6-5-BRG-BRG-TURBNOZS-TURBVNS(6)-TURBSTTRBLS(5)-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-2225',nmfault='BENT OR BOWED SHAFT',guid='b93dba4b-49bf-43ec-b53e-0f0af188aa38',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2228',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='2a4a67ab-a5dc-40dd-9145-49392b178588',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2231',nmfault='IMBALANCE',guid='5db7f634-1835-4d8a-902f-192b4f986a36',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2234',nmfault='LOOSENESS',guid='321424d6-2d54-4b56-aab6-5397694bcd1d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2237',nmfault='MASTER ISSUE BEARINGS',guid='18b4df52-312f-4a5f-842f-872f65ecf716',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2240',nmfault='MASTER ISSUE COMPONENT',guid='e4b7e01f-fc24-482c-9adc-4c381665da05',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2243',nmfault='MASTER ISSUE RETEST',guid='002d188e-7bde-4cec-98cb-9f6d65e6e9b9',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2246',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='45e414b2-5b49-4bf6-ba9f-b4c558361c64',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2249',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='ad243189-14e7-4187-b4bc-5a27248a5db4',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2252',nmfault='REPAIR/REPLACE',guid='693d6e22-a75d-4939-9b5d-2c6732581ea1',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2255',nmfault='REPAIR/REPLACE UNIT',guid='4ac1b503-8353-4344-8c55-620377d75f9a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2258',nmfault='REPLACE BEARINGS',guid='15013971-9b8d-4585-912d-8d913de8d1b9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2261',nmfault='RETEST UNIT PER VTAG',guid='a0e33fcb-7c59-463e-9931-44e912229912',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-8-6-BRG-BRG-TURBNOZS-TURBVNS(8)-TURBSTTRBLS(6)-TURBNOZS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-2267',nmfault='BENT OR BOWED SHAFT',guid='bc5e9a20-c88a-4705-993c-44e4fb650df6',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2270',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='047c0b80-b3bb-45a1-a84d-dcbdbe43ce18',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2273',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='58905a81-0584-45b1-88e0-9dcefe1b37b8',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2276',nmfault='IMBALANCE',guid='268675b0-d0fd-4ff3-86eb-3249a6ee39c6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2279',nmfault='LOOSENESS',guid='24980177-3b57-4ea0-a125-0410a011fbe7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2282',nmfault='MASTER ISSUE BEARINGS',guid='ecaf2018-b815-4776-be4f-12b0fe91fc13',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2285',nmfault='MASTER ISSUE COMPONENT',guid='e9c058fe-11e5-417e-878f-7bec8a5c38bd',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2288',nmfault='MASTER ISSUE RETEST',guid='6338704c-85f3-4dad-9673-f0b5e34fb6c9',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2291',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c72d6594-7749-4181-b6ce-791f4a7f1600',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2294',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='6dbf1414-62e1-44d5-b2cb-2cfbb6443d5f',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2297',nmfault='REPAIR/REPLACE',guid='13f833c2-fd36-4430-a1af-aa409c527e74',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2300',nmfault='REPAIR/REPLACE UNIT',guid='36aa10dd-553b-4952-9131-4ade88bbd5b0',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2303',nmfault='REPLACE BEARINGS',guid='b35f26a3-3701-4dba-942f-3b46598a7851',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2306',nmfault='RETEST UNIT PER VTAG',guid='bc1280ba-20c1-41b4-aacb-524049d1a021',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-9-9-BRG-BRG-TURBNOZS-TURBSTTRBLS(9)-TURBVNS(9)-CPLGRGD-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-2312',nmfault='BENT OR BOWED SHAFT',guid='069cb3ef-35ae-4b86-b1f1-8ea2dc81fe25',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2315',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='8fe12654-140c-4642-a913-78af7457584b',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2318',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='04c3838c-10bc-4b0e-a0b5-663cb7f7a89f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2321',nmfault='IMBALANCE',guid='0ad11ee6-e1c1-453c-aeb0-e3d4819b0d9b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2324',nmfault='LOOSENESS',guid='6bb6affb-35cb-44ae-af42-eb42824c43e6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2327',nmfault='MASTER ISSUE BEARINGS',guid='c316deb6-e5ea-4de9-81bd-a7844a1f0d8d',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2330',nmfault='MASTER ISSUE COMPONENT',guid='e713ee63-c34a-4ef6-867c-71d1a1e7ca9f',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2333',nmfault='MASTER ISSUE RETEST',guid='55f15b4a-766e-47e1-9b1a-ec637c53df8a',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2336',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1b648b9f-cb1c-46f3-952a-c0caa8ba386c',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2339',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='5b0e7d2c-5be4-4f3e-ac5a-5298f804eeb3',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2342',nmfault='REPAIR/REPLACE',guid='52548669-b8eb-4c91-bded-495aa1551e6b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2345',nmfault='REPAIR/REPLACE UNIT',guid='98da3ea7-3973-48a8-9422-c15937622635',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2348',nmfault='REPLACE BEARINGS',guid='75aed2fc-b90b-4360-a051-cebf43844789',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2351',nmfault='RETEST UNIT PER VTAG',guid='46607bdb-db9d-451d-be6d-cdabb515b3ae',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-BRG-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-2357',nmfault='BENT OR BOWED SHAFT',guid='3430f352-3306-4717-90d5-8cc85c4723ad',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2360',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='bc24cf44-2380-4f00-9316-49dc8d168889',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-2363',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1b7e602d-eead-41d6-98aa-68db35f618dd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='h',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2366',nmfault='IMBALANCE',guid='fa1594a9-f328-4dfc-8eb6-ff5aa47bc288',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2369',nmfault='LOOSENESS',guid='2eecc228-3202-46e5-9bbd-9634c45c1f80',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2372',nmfault='MASTER ISSUE BEARINGS',guid='917fe24d-736c-4262-8d4d-ff162391f423',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2375',nmfault='MASTER ISSUE COMPONENT',guid='023d2cfc-6646-4788-97ea-a3e516425d41',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2378',nmfault='MASTER ISSUE RETEST',guid='abc4b2e0-c292-4a97-96dc-292be84ea492',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2381',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='05813ad6-ec74-4b5b-9086-42b78bf171ee',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2384',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='a630e5a0-ea2e-46c4-af25-6dd5ee257389',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2387',nmfault='REPAIR/REPLACE',guid='a6e9b36f-6166-46f5-b6b5-c58c1bf45c64',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2390',nmfault='REPAIR/REPLACE UNIT',guid='e1b7667c-b449-4038-8d8d-75e271a1d69c',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2393',nmfault='REPLACE BEARINGS',guid='3861b693-0200-4bb6-808e-4d730281d49b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2396',nmfault='RETEST UNIT PER VTAG',guid='331f13fb-3a2a-4c9f-8747-e71930c0af0a',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2402',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='2a17187b-2755-404b-837d-8e11f5583145',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2405',nmfault='IMBALANCE',guid='ac2813d1-f402-459f-8ebf-1be597cc84c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2408',nmfault='LOOSENESS',guid='8612f33a-f5a8-4bce-bee1-4d05b2a270a5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2411',nmfault='MASTER ISSUE BEARINGS',guid='7829ccbd-6db4-46e7-a0b6-f7fdbd8185ac',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2414',nmfault='MASTER ISSUE COMPONENT',guid='0eb174c6-80d3-4156-9e3d-df08e24c9dab',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2417',nmfault='MASTER ISSUE RETEST',guid='70265d52-2615-4de5-9313-f65ff9d9f987',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2420',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='c7b923a3-df32-40f0-a76b-a9a80bc0015f',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2423',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='3282900e-5e93-44d2-84c9-61a797ae5858',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2426',nmfault='REPAIR/REPLACE',guid='738988eb-199a-4f5c-bc08-dbee739d9ebe',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2429',nmfault='REPAIR/REPLACE UNIT',guid='f8c6a82c-fe14-49a0-9828-7a99e088fa9a',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2432',nmfault='REPLACE BEARINGS',guid='3320cd6f-3d74-45cd-a79e-b6908cd1cfe5',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2435',nmfault='RETEST UNIT PER VTAG',guid='a68e7f81-1299-42cd-81d4-39ffc67438e9',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBVNS-BRG
---- DATA COLLECTION OR PROCESSING ERROR
table.insert( g_rec_rules, {rule=function() return rec_data_check() end
  ,nmrule='RecRuleLine-2441',nmfault='DATA COLLECTION OR PROCESSING ERROR',guid='5a2b8108-dd3f-485e-b80d-d155085c967f',parfault=nil,fault='0fdf12a2-b0e7-4b29-a47b-a193a4dc9637',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-2444',nmfault='IMBALANCE',guid='34363cfe-2d27-4f84-8659-5a06557451c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-2447',nmfault='LOOSENESS',guid='8cca57cc-1ea1-4ec0-b3ef-7e32fcaf392d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_issue() end
  ,nmrule='RecRuleLine-2450',nmfault='MASTER ISSUE BEARINGS',guid='e4c11438-f61e-44be-b4dc-55fa34a41733',parfault=nil,fault='07c375f4-1c8c-4939-a32e-140e500ae6dc',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=3,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_issue() end
  ,nmrule='RecRuleLine-2453',nmfault='MASTER ISSUE COMPONENT',guid='e831aad9-24d9-4217-ade0-3a11feac1506',parfault=nil,fault='5cda18ea-32dd-4fca-92d2-b393ab13967b',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=4,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-2456',nmfault='MASTER ISSUE RETEST',guid='0cf75ca3-b924-47c6-83ab-948808b4f0fa',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_monitor() end
  ,nmrule='RecRuleLine-2459',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='fed56138-2b27-4e77-b3aa-10e2d7738b0d',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_monitor() end
  ,nmrule='RecRuleLine-2462',nmfault='MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='d9441aeb-3f6f-4bf7-bdb0-11c7df2cd5e7',parfault=nil,fault='f975f18d-5952-4832-8a2a-ffabed8a1656',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_5_replace() end
  ,nmrule='RecRuleLine-2465',nmfault='REPAIR/REPLACE',guid='5a5e4624-a5ef-47b8-b7dd-e9f854e94bea',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_replace_unit() end
  ,nmrule='RecRuleLine-2468',nmfault='REPAIR/REPLACE UNIT',guid='236bdc21-ac7e-4f24-9cfe-f179fd69b8c1',parfault=nil,fault='dc6435c7-e102-4e55-b2c0-3ae1ef8d225e',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=6,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_5_replace() end
  ,nmrule='RecRuleLine-2471',nmfault='REPLACE BEARINGS',guid='c45919da-0d93-4895-91e3-8abb376965a8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=5,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_problem() end
  ,nmrule='RecRuleLine-2474',nmfault='RETEST UNIT PER VTAG',guid='9c12dd4c-a62b-48c4-b291-c8a8ed956a5a',parfault=nil,fault='01087ec9-2685-45bb-8eb4-eb14fae435ff',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=7,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

end
-- Recommedation Functions
function rec_2xlinefreq()
 local  check,f = get_fault( '91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9') -- MOTOR STATOR PROBLEM OR ABNORMAL ELECTRICAL LOAD
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c6ede3e2-c284-495e-b95f-bfe01618da11') -- STATOR ECCENTRICITY, SHORTED LAMINATIONS OR LOOSE IRON, 2xLF
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_balance()
 local  check,f = get_fault( '0deaccad-1be8-4a9d-8b9a-8bb6bd492d57') -- DYNAMIC BALANCE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bb_noise()
 local  check,f = get_fault( '1e93b5a5-a480-4e5f-8bf9-95635a1407b7') -- WARNING - NOISE FLOOR FAULT  (Mid Freq)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '6cdff41a-29dd-41e3-818d-1396afc88d55') -- WARNING - NOISE FLOOR FAULT (High Freq)
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_ff()
 local  check,f = get_fault( '56025dd9-2342-4a9f-9c5c-1067b8594ed8') -- BEARING FF FIT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '41bce26d-b044-47f2-aebe-a6c42a4a4ad0') -- BEARING FF THRUST SHOE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_re()
 local  check,f = get_fault( '4e904f5b-2c45-49d2-9aca-3b8daa0c397c') -- BEARING MISC TONES
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7796df29-c2cb-4ac7-9a55-3ca98eb22f62') -- BEARING RE BALL SPIN FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '396aaab9-6e19-47bf-8a8c-75890a56aa66') -- BEARING RE INNER RACE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '52275357-989a-4fdb-b641-9e274b6998fe') -- BEARING RE OUTER RACE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bearing_re_cocked()
 local  check,f = get_fault( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a05f207e-712f-401f-8b50-1de7380669d5') -- BEARING RE COCKED FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_belt_problem()
 local  check,f = get_fault( '2828160e-f7ae-4a00-b682-5bb97585f230') -- INSPECT DRIVE BELT FOR WEAR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ca87d5bf-57d4-468c-84f9-d3a9b665f1b6') -- PULLEY BELT FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_belt_slippage()
 local  check,f = get_fault( '2828160e-f7ae-4a00-b682-5bb97585f230') -- INSPECT DRIVE BELT FOR WEAR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '65c1db37-6bcf-4f24-9c9b-ffa1d6d0851e') -- PULLEY BELT SLIPPAGE FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_bowed_rotor()
 local  check,f = get_fault( 'be5266a6-c247-4fe9-9d50-45a9dadfdfe6') -- BENT OR BOWED SHAFT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '6fb0a8d3-f05d-4db5-94ad-609198f42062') -- BENT OR BOWED SHAFT FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_component_wear_or_fit()
 local  check,f = get_fault( '37d17c46-b0f7-4ce6-b853-312709edcd3a') -- COMPRESSOR ROTATING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a9bf4c2d-921d-4cd6-9749-f4c278546ab7') -- COMPRESSOR STATIONARY ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'fa0eef50-bab6-4db5-aa36-5df5c2a47e7a') -- COUPLING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '147bbccd-befc-46ad-b32b-c5fa946c8d21') -- COUPLING WEAR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COUPLING WEAR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7506ade5-a3d8-4c78-90fc-650dcae59d85') -- FAN ROTATING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7da464e6-0fd0-4a44-a5d2-1770964e52b4') -- FAN STATIONARY ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ee338d62-ee72-4683-95da-b2d6b02c7f5a') -- GENERATOR FAN BLADE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'e712797c-8ccb-466a-986b-0d659cf2acbe') -- GOVERNOR ROTATING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ab1b7c89-69d9-46ac-95fd-a724048821be') -- MOTOR FAN BLADE FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '3f089323-1112-4d25-9f38-98fad1a9748b') -- PUMP ROTATING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'cacf4d95-217c-4c8e-b3a3-e32a6d60e943') -- PUMP STATIONARY ELEMENT FAULT
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
  check,f = get_fault( '2d53cfbe-ff4e-4520-a54a-5600ae8d96fd') -- TURBINE ROTATING ELEMENT FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c2712a28-19a4-4bb4-a7c1-5b041c2e2475') -- TURBINE STATIONARY ELEMENT FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_coupling_angular_alignment()
 local  check,f = get_fault( '2dd50782-f1fe-4be1-bca4-85318f0d9dac') -- ANGULAR MISALIGNMENT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '3f57cd7c-d728-4b7f-8019-f308059fb047') -- COUPLING MISALIGN ANGULAR FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_coupling_parallel_alignment()
 local  check,f = get_fault( '914ea641-4570-4d07-ad0c-d25ddeb17ec6') -- COUPLING MISALIGN PARALLEL FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'cf3d8007-dadd-4141-91f5-4acf1532a70b') -- PARALLEL MISALIGNMENT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_data_check()
 local  check,f = get_fault( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ca0a76af-7c5a-4b25-9a9f-078027ad6810') -- DATA MISSING - No 1X
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a3cd43b6-4fdc-4764-8186-3508c37e5cdd') -- DATA MISSING - NO SPECTRAL DATA
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '8b4fe728-ae8f-4a7d-95cf-97eef2224650') -- WARNING - 2x LINE FREQUENCY NOT SUPPRESSED DURING NORMALIZATION
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'b064a670-ef2e-4226-93fb-6d2dee66c570') -- WARNING - DATA PROBLEM - FEWER SPECTRAL DATA RANGES THAN AVERAGE RANGES
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '26477670-693a-4e5b-a17d-27eb1747ddc0') -- WARNING - DATA PROBLEM - HIGH NOISE LEVELS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ee3a6ea3-605e-4d09-9b07-80ddcfb480f1') -- WARNING - DATA PROBLEM - LOW NOISE LEVELS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7a6e5c29-d253-4961-bf50-7040e30c0b0f') -- WARNING - DATA PROBLEM - MISSING WAVEFORMS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '5ab56015-9bc5-4411-b608-a3da1fe82c14') -- WARNING - DATA PROBLEM - NO AVERAGES FOR COMPARISON
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '0a41634d-34ff-4385-8d14-e8f96754ec84') -- WARNING - DATA PROBLEM - NO DEMOD DATA
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4ba28d08-5839-4821-8e9e-b2cebd11a571') -- WARNING - DATA PROBLEM - NO PEAKS IN SPECTRA
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f067f248-ecb4-4b60-ae93-bb0a0917bb5e') -- WARNING - SOME DATA NORMALIZED USING HIGHER RANGE SPEED
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_gear_mesh()
 local  check,f = get_fault( 'f8084e75-5313-4ca0-aa9b-187a3b409348') -- GEAR ALIGNMENT 1 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4df2dcc9-1f7b-4c7a-ba02-35228961ba45') -- GEAR ALIGNMENT 2 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '84d131e5-4f24-4876-9c71-1e0f7c6f2ba9') -- GEAR ALIGNMENT 3 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4bf28a40-5004-4600-9b1b-b941a3c32ca2') -- GEAR BACKLASH FAULT 1
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'e476c1a5-efb5-4c4c-8c35-18ac13ca7033') -- GEAR BACKLASH FAULT 2
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '03675ffa-8978-49cb-9c67-ab1ec3d0da95') -- GEAR BACKLASH FAULT 3
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f9b2fd9d-f9c1-4e6e-abf9-1751d29d2f0b') -- GEAR ECCENTRICITY FAULT 1
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c1a7e03a-a612-4976-a94f-61a64b961873') -- GEAR ECCENTRICITY FAULT 2
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '6df42686-cfc5-451b-add9-1354d7b0eb09') -- GEAR ECCENTRICITY FAULT 3
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'c9999445-9f6e-4b03-93ac-dd5abd9398f3') -- GEAR GHOST TONE
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR MESH 1 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f4d379f4-9e78-4696-8cec-5034ce319c5f') -- GEAR MESH 2 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'b85a6853-765b-4acc-aaf6-70824be4767b') -- GEAR MESH 3 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '15dd5685-db85-4229-aa66-5374ec9a4b4c') -- GEAR MESH PROBLEM
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '2be8e67e-42df-470c-b508-25ac5589473d') -- GEAR TOOTH 1 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '5017c914-c02c-4adb-aead-5624cca4b791') -- GEAR TOOTH 2 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'ffaa4a3d-ed7a-4a2a-b254-d038a3c59893') -- GEAR TOOTH 3 FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '7b2609ff-2064-4e22-955c-ef210bb00a10') -- GEAR WEAR FAULT 1
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'd03542ed-a20c-467a-9804-b3df64a7c07c') -- GEAR WEAR FAULT 2
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '0926b523-5413-435d-9b89-aefbfeecef30') -- GEAR WEAR FAULT 3
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_looseness()
 local  check,f = get_fault( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COUPLING WEAR
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '967b15a5-923c-4231-84c0-41ad7cb06c81') -- LOOSENESS FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_oil_whirl()
 local  check,f = get_fault( 'acc257ad-914e-48c7-8982-62678618d2cd') -- BEARING FF FLUID WEDGE STABILITY FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_piston_problem()
 local  check,f = get_fault( '278077ab-a350-42d7-837e-78bec041a455') -- PUMP PISTON FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_rotor_bars()
 local  check,f = get_fault( 'a523ae6b-1815-4a01-a8d3-83449a251dd8') -- GENERATOR ROTOR BAR FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '57c9ac60-0949-4bf3-a632-5f3a3cf7e2d6') -- GENERATOR SLIP RING FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'aea1a9c8-de2a-48c4-a5fb-e94701180056') -- MOTOR ROTOR BAR FAULT
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4119ce9c-7860-4da6-9007-1826d3209396') -- ROTOR BAR PROBLEM
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_rotor_rub()
 local  check,f = get_fault( '2ee46dd5-7600-4050-9891-159e6ee4c2e2') -- ROTOR RUB
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '016820d4-63ba-4177-bc69-73e25737368c') -- ROTOR RUB
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_sheave_problem()
 local  check,f = get_fault( 'e6f70614-30a3-4a98-9302-a9197073c710') -- PULLEY SHEAVE ALIGNMENT FAULT (DRIVEN)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '8f853baa-f4c9-440a-8d95-0c8e7baca469') -- PULLEY SHEAVE ALIGNMENT FAULT (DRIVER)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '898169fd-b3a7-4145-9b92-fc40320ae2ee') -- PULLEY SHEAVE ESSENTRICITY FAULT (DRIVEN)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '9068581e-e314-42e1-a9d6-6e143f0df5eb') -- PULLEY SHEAVE ESSENTRICITY FAULT (DRIVER)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'a040d9ac-ad0d-4976-83a5-64db65941ba7') -- SHEAVE PROBLEM
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f985b847-a3a5-4898-a68c-a81b9fcd98c9') -- SHEAVE PROBLEM
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_ski_slope()
 local  check,f = get_fault( '66d6f4fe-c34e-4c14-9545-970a100757a8') -- SPECTRUM OVERLOAD (SKI SLOPE)
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( '4c8a0012-c1ba-46e9-88b4-ea4236de1a92') -- WARNING - NOISE FLOOR FAULT   (LowFreq)  SKI SLOPE
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_softfoot()
 local  check,f = get_fault( '77ba2ad3-e48d-42cb-8184-6749c7b7edff') -- FOUNDATION TRANSVERSE FLEXIBILITY
    if check then return setseverity(f.severity)  end 
  check,f = get_fault( 'f2ef6d94-a6c7-4ab5-a127-7903420a362c') -- SOFTFOOT FAULT
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_speed_change()
 local  check,f = get_fault( '9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a') -- WARNING - SPEED CHANGE BETWEEN PICKUPS 
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_speed_out_of_range()
 local  check,f = get_fault( 'dd71dc8c-7dfe-49a7-9c9c-59dc560c285c') -- WARNING - SPEED OUT OF RANGE
    if check then return setseverity(f.severity)  end 

  return false
end
function rec_total_speed_deviation()
 local  check,f = get_fault( '5ba9638c-72f2-4c20-ada0-299eeee6faa5') -- WARNING - SPEED CHANGE >1% DURING PICKUP ACQUISITION Between Ranges
    if check then return setseverity(f.severity)  end 

  return false
end
-- SPECIAL Recommedation Functions----------
function rec_master_alignment_3_issue()
 local t={}
 local tcount=0
 local  check,recs = get_rec_on_line ( '2dd50782-f1fe-4be1-bca4-85318f0d9dac') -- ANGULAR MISALIGNMENT
  if check then tcount=tcount+1  t['2dd50782-f1fe-4be1-bca4-85318f0d9dac']=recs   end 
  check,recs = get_rec_on_line ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COUPLING WEAR
  if check then tcount=tcount+1  t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec_on_line ( 'cf3d8007-dadd-4141-91f5-4acf1532a70b') -- PARALLEL MISALIGNMENT
  if check then tcount=tcount+1  t['cf3d8007-dadd-4141-91f5-4acf1532a70b']=recs   end 
  check,recs = get_rec_on_line ( 'f985b847-a3a5-4898-a68c-a81b9fcd98c9') -- SHEAVE PROBLEM
  if check then tcount=tcount+1  t['f985b847-a3a5-4898-a68c-a81b9fcd98c9']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_alignment_4_check()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( 'a6887082-05c4-455a-b499-4bf9864dbd91') -- INSPECT FOR ALIGNMENT
  if check then tcount=tcount+1  t['a6887082-05c4-455a-b499-4bf9864dbd91']=recs   end 

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
function rec_master_bearing_3_issue()
 local t={}
 local tcount=0
 local   check,recs = get_rec_mine ( '8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286') -- 
  if check then tcount=tcount+1  t['8ebda1fd-bf4e-4813-ae2d-a02ef2c0d286']=recs   end 
  check,recs = get_rec_mine ( 'd4c1477a-ffdb-4b8f-8407-a1e47f01d504') -- 
  if check then tcount=tcount+1  t['d4c1477a-ffdb-4b8f-8407-a1e47f01d504']=recs   end 
  check,recs = get_rec_mine ( '079d3155-0e02-4d7a-bc6e-5f140063e911') -- 
  if check then tcount=tcount+1  t['079d3155-0e02-4d7a-bc6e-5f140063e911']=recs   end 
  check,recs = get_rec_mine ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- BEARING FIT PROBLEM
  if check then tcount=tcount+1  t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=recs   end 
  check,recs = get_rec_mine ( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
  if check then tcount=tcount+1  t['87b85d6b-0f55-41cd-a9c6-44b2e82dd359']=recs   end 
  check,recs = get_rec_mine ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then tcount=tcount+1  t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=recs   end 
  check,recs = get_rec_mine ( '1a4eb45a-9771-4a1e-8d94-36736c8db15f') -- BEARING NOISE
  if check then tcount=tcount+1  t['1a4eb45a-9771-4a1e-8d94-36736c8db15f']=recs   end 
  check,recs = get_rec_mine ( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
  if check then tcount=tcount+1  t['6cb8d78c-6831-4916-b327-c359d72597d2']=recs   end 
  check,recs = get_rec_mine ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then tcount=tcount+1  t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=recs   end 

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
   -- **** Function Call
  rec_master_comp_6_monitor_unit()
 
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
  check,recs = get_rec ( 'be5266a6-c247-4fe9-9d50-45a9dadfdfe6') -- BENT OR BOWED SHAFT
  if check then tcount=tcount+1  t['be5266a6-c247-4fe9-9d50-45a9dadfdfe6']=recs   end 
  check,recs = get_rec ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COUPLING WEAR
  if check then tcount=tcount+1  t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec ( '67a4f244-e1c2-42d0-9f39-c96c8b95a0c5') -- FAN BLADING PROBLEM
  if check then tcount=tcount+1  t['67a4f244-e1c2-42d0-9f39-c96c8b95a0c5']=recs   end 
  check,recs = get_rec ( 'fe20b5e9-a8a3-41f6-8b78-947cb017afc0') -- FAN PROBLEM
  if check then tcount=tcount+1  t['fe20b5e9-a8a3-41f6-8b78-947cb017afc0']=recs   end 
  check,recs = get_rec ( '77ba2ad3-e48d-42cb-8184-6749c7b7edff') -- FOUNDATION TRANSVERSE FLEXIBILITY
  if check then tcount=tcount+1  t['77ba2ad3-e48d-42cb-8184-6749c7b7edff']=recs   end 
  check,recs = get_rec ( 'ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
  if check then tcount=tcount+1  t['ca47a73c-f659-460c-8b5a-2753dcba9f0f']=recs   end 
  check,recs = get_rec ( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- LOOSENESS
  if check then tcount=tcount+1  t['4c5d657f-0c77-4afc-a400-490b9b1dc900']=recs   end 
  check,recs = get_rec ( '2ee46dd5-7600-4050-9891-159e6ee4c2e2') -- ROTOR RUB
  if check then tcount=tcount+1  t['2ee46dd5-7600-4050-9891-159e6ee4c2e2']=recs   end 
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
   rec_master_comp_6_monitor_unit()
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
function rec_master_comp_6_monitor_unit()
 local t={}
 local tcount=0
 local   check,recs = get_rec_all ( 'f975f18d-5952-4832-8a2a-ffabed8a1656') -- MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION
  if check then tcount=tcount+1  t['f975f18d-5952-4832-8a2a-ffabed8a1656']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
   -- if maxsev > 2 and tcount > 1  then
     -- maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      --assert2(maxsev) --Severity
     -- assert3(1) --Confidence
if true then  return true end
    --end
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
 local   check,recs = get_rec ( 'bc3ff20f-4477-433a-a2f1-f0f6acfbf71e') -- 
  if check then tcount=tcount+1  t['bc3ff20f-4477-433a-a2f1-f0f6acfbf71e']=recs   end 
  check,recs = get_rec ( 'f281a670-fc4a-473d-8be8-fe11b33b4a7f') -- 
  if check then tcount=tcount+1  t['f281a670-fc4a-473d-8be8-fe11b33b4a7f']=recs   end 
  check,recs = get_rec ( '46856e29-4243-41aa-9d84-e9aa47b6bda1') -- 
  if check then tcount=tcount+1  t['46856e29-4243-41aa-9d84-e9aa47b6bda1']=recs   end 
  check,recs = get_rec ( 'e7d3e492-b63d-4f08-8f37-e9f09f94de23') -- 
  if check then tcount=tcount+1  t['e7d3e492-b63d-4f08-8f37-e9f09f94de23']=recs   end 
  check,recs = get_rec ( '44129fbe-1335-4cb7-879c-d9a64a3ce57e') -- 
  if check then tcount=tcount+1  t['44129fbe-1335-4cb7-879c-d9a64a3ce57e']=recs   end 
  check,recs = get_rec ( '955ee097-f1c1-4071-8216-c15920e30dd0') -- 
  if check then tcount=tcount+1  t['955ee097-f1c1-4071-8216-c15920e30dd0']=recs   end 
  check,recs = get_rec ( 'd2f11a71-b86d-45c3-8cc3-0f35003f6df2') -- 
  if check then tcount=tcount+1  t['d2f11a71-b86d-45c3-8cc3-0f35003f6df2']=recs   end 
  check,recs = get_rec ( '1ba38459-5c1b-4b17-b197-0caad40f2b14') -- 
  if check then tcount=tcount+1  t['1ba38459-5c1b-4b17-b197-0caad40f2b14']=recs   end 
  check,recs = get_rec ( '91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9') -- MOTOR STATOR PROBLEM OR ABNORMAL ELECTRICAL LOAD
  if check then tcount=tcount+1  t['91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9']=recs   end 
  check,recs = get_rec ( '4119ce9c-7860-4da6-9007-1826d3209396') -- ROTOR BAR PROBLEM
  if check then tcount=tcount+1  t['4119ce9c-7860-4da6-9007-1826d3209396']=recs   end 

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
function rec_master_gear_6_problem()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '15dd5685-db85-4229-aa66-5374ec9a4b4c') -- GEAR MESH PROBLEM
  if check then tcount=tcount+1  t['15dd5685-db85-4229-aa66-5374ec9a4b4c']=recs   end 
  check,recs = get_rec ( '6f4464c9-73c7-4191-b796-02f9fa52cf3c') -- GEAR PROBLEM
  if check then tcount=tcount+1  t['6f4464c9-73c7-4191-b796-02f9fa52cf3c']=recs   end 
  check,recs = get_rec ( 'f1413466-c387-4b75-a2a8-d92ea353cf18') -- MASTER ISSUE GEAR
  if check then tcount=tcount+1  t['f1413466-c387-4b75-a2a8-d92ea353cf18']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(-1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_5_issue()
 local t={}
 local tcount=0
 local   check,recs = get_rec_all ( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
  if check then tcount=tcount+1  t['0fdf12a2-b0e7-4b29-a47b-a193a4dc9637']=recs   end 
  check,recs = get_rec_all ( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
  if check then tcount=tcount+1  t['4d535592-5633-4a3d-92e5-c9ac0453294f']=recs   end 
  check,recs = get_rec_all ( '66d6f4fe-c34e-4c14-9545-970a100757a8') -- SPECTRUM OVERLOAD (SKI SLOPE)
  if check then tcount=tcount+1  t['66d6f4fe-c34e-4c14-9545-970a100757a8']=recs   end 
  check,recs = get_rec_all ( 'ebd040d2-d51c-429b-ab96-17382fd1429a') -- TEST CONDITION ERROR
  if check then tcount=tcount+1  t['ebd040d2-d51c-429b-ab96-17382fd1429a']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(-1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_6_cleanup()
 local t={}
 local tcount=0
 local   check,recs = get_rec_all ( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
  if check then tcount=tcount+1  t['0fdf12a2-b0e7-4b29-a47b-a193a4dc9637']=recs   end 
  check,recs = get_rec_all ( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
  if check then tcount=tcount+1  t['4d535592-5633-4a3d-92e5-c9ac0453294f']=recs   end 
  check,recs = get_rec_all ( '5f6e636c-69b1-478b-be2a-5c6be38ab98f') -- ELECTRICAL PROBLEM
  if check then tcount=tcount+1  t['5f6e636c-69b1-478b-be2a-5c6be38ab98f']=recs   end 
  check,recs = get_rec_all ( '07c375f4-1c8c-4939-a32e-140e500ae6dc') -- MASTER ISSUE BEARINGS
  if check then tcount=tcount+1  t['07c375f4-1c8c-4939-a32e-140e500ae6dc']=recs   end 
  check,recs = get_rec_all ( '5cda18ea-32dd-4fca-92d2-b393ab13967b') -- MASTER ISSUE COMPONENT
  if check then tcount=tcount+1  t['5cda18ea-32dd-4fca-92d2-b393ab13967b']=recs   end 
  check,recs = get_rec_all ( '3cf72064-f881-49ad-812b-0ce10c24b0f3') -- MASTER ISSUE ELECTRICAL
  if check then tcount=tcount+1  t['3cf72064-f881-49ad-812b-0ce10c24b0f3']=recs   end 
  check,recs = get_rec_all ( '3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6') -- MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION
  if check then tcount=tcount+1  t['3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6']=recs   end 
  check,recs = get_rec_all ( 'f975f18d-5952-4832-8a2a-ffabed8a1656') -- MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION
  if check then tcount=tcount+1  t['f975f18d-5952-4832-8a2a-ffabed8a1656']=recs   end 
  check,recs = get_rec_all ( '4c4b2e36-017d-4a45-8a6c-8e83e011de19') -- REPAIR/REPLACE
  if check then tcount=tcount+1  t['4c4b2e36-017d-4a45-8a6c-8e83e011de19']=recs   end 
  check,recs = get_rec_all ( 'dc6435c7-e102-4e55-b2c0-3ae1ef8d225e') -- REPAIR/REPLACE UNIT
  if check then tcount=tcount+1  t['dc6435c7-e102-4e55-b2c0-3ae1ef8d225e']=recs   end 
  check,recs = get_rec_all ( '38ce4bb1-1b2d-47b4-86f9-574f2580c90a') -- REPLACE BEARINGS
  if check then tcount=tcount+1  t['38ce4bb1-1b2d-47b4-86f9-574f2580c90a']=recs   end 
  check,recs = get_rec_all ( '66d6f4fe-c34e-4c14-9545-970a100757a8') -- SPECTRUM OVERLOAD (SKI SLOPE)
  if check then tcount=tcount+1  t['66d6f4fe-c34e-4c14-9545-970a100757a8']=recs   end 

    if tcount >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence
      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_7_problem()
 local t={}
 local tcount=0
 local   check,recs = get_rec ( '9453199c-2b7c-485d-bde5-a01cc53a562f') -- MASTER ISSUE RETEST
  if check then tcount=tcount+1  t['9453199c-2b7c-485d-bde5-a01cc53a562f']=recs   end 

    local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev > 2 then

     rec_master_retest_unit_6_cleanup()

      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3(1) --Confidence

      return true
    end
 assert3(-1) --TURN OFF Confidence
 return false
end
function remove_dup_recommendations()
 local t={}
 local tcount=0
 local   check,recs = get_rec_all ( '3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6') -- MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION
  if check then tcount=tcount+1  t['3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6']=recs   end 
  check,recs = get_rec_all ( 'f975f18d-5952-4832-8a2a-ffabed8a1656') -- MONITOR BEARINGS PER TYCOM INSTRUCTION FOR INCREASED VIBRATION
  if check then tcount=tcount+1  t['f975f18d-5952-4832-8a2a-ffabed8a1656']=recs   end 

remove_dup_recs(t,-1)
 assert3(-1) --TURN OFF Confidence
 return false
end
