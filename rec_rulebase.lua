-- Created Date: 1/23/2020 9:04:09 AM
function load_rec_rules(g_rec_rules)
g_datanormalizationerrorguid='4d535592-5633-4a3d-92e5-c9ac0453294f'
-- **************************************
-- BEARING-FLUID-FILM
---- BEARING JOURNAL OIL WHIRL
table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-11',nmfault='BEARING JOURNAL OIL WHIRL',guid='5e6a4836-7434-43ff-8040-e520d12d5c3a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-14',nmfault='CHECK BEARING FIT',guid='4f161dc7-7dee-4640-b9a7-ec4672220917',parfault=nil,fault='cd5a3720-46b4-4b34-b2e0-9af45a03d7a7',shaft='60e8f68c-cb8c-4fcb-b63d-adcd113edfef',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-RADIAL-THRUST
---- BEARING JOURNAL OIL WHIRL
table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-20',nmfault='BEARING JOURNAL OIL WHIRL',guid='dd68d3d3-0d56-43ee-8dc9-0da4ebdd611a',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-23',nmfault='BEARING THRUST PROBLEM',guid='50a9c72e-b6ca-4801-b415-47f7c1a7549b',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='ecb83db3-5035-469c-a409-fe820c4fa13c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-FLUID-FILM-THRUST
---- BEARING JOURNAL OIL WHIRL
table.insert( g_rec_rules, {rule=function() return rec_oil_whirl() end
  ,nmrule='RecRuleLine-29',nmfault='BEARING JOURNAL OIL WHIRL',guid='7ffc7e53-bb1b-40ff-8519-8c8a02d9b968',parfault=nil,fault='87b85d6b-0f55-41cd-a9c6-44b2e82dd359',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_ff() end
  ,nmrule='RecRuleLine-32',nmfault='BEARING THRUST PROBLEM',guid='82fa71f0-c415-4ea5-8779-ccd74c225173',parfault=nil,fault='6cb8d78c-6831-4916-b327-c359d72597d2',shaft='71a66a31-78ee-4d36-8061-cbd9b917f1f1',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-38',nmfault='BEARING MISALIGNMENT',guid='3ddc087a-304a-4e7d-86d3-df3f4e1792b6',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-41',nmfault='BEARING WEAR',guid='b95e0138-8bc2-412e-b20b-80d01c8a4770',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='c17e7b7b-1ad9-4781-88c8-a45a5eef6389',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-47',nmfault='BEARING MISALIGNMENT',guid='9c18aa0d-8b25-42ed-a189-147b53483ec9',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-50',nmfault='BEARING WEAR',guid='39fe17b2-9d45-4689-8986-241c73115887',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='e9fedc28-da43-4f4a-92ec-703e3dae993b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-DUPLEX-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-56',nmfault='BEARING MISALIGNMENT',guid='a6f6d562-208a-4949-b185-8393cae14f0c',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-59',nmfault='BEARING WEAR',guid='8c598591-2940-4e3e-a5a8-1d0d69550ae9',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='8721aef1-84ce-4a10-a1fe-ce80bc0ad33a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- BEARING-ROLLING-ELEMENT-THRUST
---- BEARING MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_bearing_re_cocked() end
  ,nmrule='RecRuleLine-65',nmfault='BEARING MISALIGNMENT',guid='be171378-d565-44ef-8d22-8b152b0c8b83',parfault=nil,fault='8c0073c1-4231-4942-a579-ebf5caeb78ad',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_bearing_re() end
  ,nmrule='RecRuleLine-68',nmfault='BEARING WEAR',guid='8687cc72-a6bf-4f91-9266-e44a120dfb50',parfault=nil,fault='c68d8c5c-f67b-4d9a-9f53-389202fa67aa',shaft='3bff32d8-f3ce-4a7d-8f0d-b11391b618f5',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CL-GR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-74',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='843bebaf-82a6-4e1e-be30-27f59a067fb2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-77',nmfault='IMBALANCE',guid='444cdbef-59fd-424d-a2c1-9b9ca34a1449',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_clutch_inspect() end
  ,nmrule='RecRuleLine-80',nmfault='INSPECT CLUTCH',guid='2fce47f8-ad3e-4bb4-b531-62318a4d7ae2',parfault=nil,fault='afc6a08e-2b33-44ed-90ee-96beacc9e0d9',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-83',nmfault='INSPECT GEARS',guid='2e089803-1a7d-4fad-a17d-83600d7147e6',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-86',nmfault='REPAIR',guid='f0158fb8-d6bf-450c-891e-eb70f2959a60',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-89',nmfault='REPLACE BEARINGS',guid='909ee01f-0bec-4a6b-ba31-a938d668cd07',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='da2481f2-25d8-4aac-800e-6040d2c3e9aa',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- CLUTCH-BRG-CPLGFLEX-CL-BRG-BRG-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-95',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='e8278824-b07e-4065-b1a6-d69adf4faffe',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-98',nmfault='IMBALANCE',guid='7199f4e7-1c9d-43b7-8963-943528ed16b9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-101',nmfault='PARALLEL MISALIGNMENT',guid='6a5b5d89-d160-4c1e-8460-aaa6acd0198b',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-104',nmfault='REPAIR',guid='8456f600-40b1-4a9c-8fb6-f46d39d4294e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-107',nmfault='REPLACE BEARINGS',guid='8df470b6-ec6c-4059-87ce-ebe38e73d4ab',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ac215836-5c0d-4b1f-bdf1-c776e5bf391d',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-BRG-CPRSRVNS-CPRSRSTTRVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-113',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='103a00a6-ce21-4203-bf25-8710f5c61d0c',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-116',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3d8b7744-0172-4a2f-8f92-1b74d6b30b6c',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-119',nmfault='IMBALANCE',guid='ed1a81ce-5bb9-4bb8-bc83-2dd3ee7c6083',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-122',nmfault='REPAIR',guid='c5c11ce5-dd10-4e48-81fd-810a455c56c1',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-125',nmfault='REPLACE BEARINGS',guid='9b976a96-606f-4fa4-962f-3eb9bbf0b681',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='838217b2-f38b-4bc7-9efd-d650279b0154',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRGR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-131',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='36ee3c09-e478-4551-86e2-dd33df76db09',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-134',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='d4e27882-874a-478a-9f72-8305a16afac9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-137',nmfault='INSPECT GEARS',guid='5839fb53-c409-4102-84d1-7ec849b31343',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-140',nmfault='REPAIR',guid='5aa42d33-7368-44e5-a97a-7243c0707107',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-143',nmfault='REPLACE BEARINGS',guid='e175605f-10ad-4fac-9950-880ee0d7e9a3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b87bfb84-efbc-4c61-b34f-eb216e43317f',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-149',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='012cc6ee-cceb-4ee2-9508-645017fd7357',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-152',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='55641e73-a958-427e-ad3f-9eee7c5791b3',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-155',nmfault='IMBALANCE',guid='78133759-9e19-4744-96b6-baee54af259c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-158',nmfault='REPAIR',guid='c86c45c6-2a0b-4a85-ada8-d88f6579c343',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-161',nmfault='REPLACE BEARINGS',guid='1208f5de-c94b-4819-8cb4-4f38a0e4aae8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='ab831b30-069b-474e-ad5e-3abfb510a74b',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRIMPLR-CPRSRSTTRVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-167',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='8d1dcffc-85c6-4b85-a24b-b9ebfb166b11',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-170',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8f639c2-1c8b-4af3-80b4-d177252cabd2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-173',nmfault='IMBALANCE',guid='67d86db1-a682-4008-b4b1-2a51246706a0',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-176',nmfault='REPAIR',guid='89a5ca1a-239e-410e-a36e-78275f0abe19',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-179',nmfault='REPLACE BEARINGS',guid='4dc7d147-d31b-44e8-993a-9d88870058e2',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='79742f62-700b-4802-815a-6606dd92295e',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-CPRSRPSTN-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-185',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='80c1d077-2108-4e48-bd2d-a0981a830fc5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-188',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='63392c64-bd7d-42a6-bbc1-80f89b5c377a',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-191',nmfault='IMBALANCE',guid='c874292a-51c3-4d44-a0e7-ddb04343cfc5',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-194',nmfault='PISTON PROBLEM',guid='033df113-3c03-4be0-b41d-8d34c4eeda2c',parfault=nil,fault='6230f2a8-bb14-43f2-beb2-3b7fe2a617ff',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-197',nmfault='REPAIR',guid='0ac608f2-3f55-4eac-8db6-c65a25a980ee',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-200',nmfault='REPLACE BEARINGS',guid='edfdb6d1-818a-4e29-b92a-954d554bc2f7',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9993d658-2e80-48f4-81ca-ef0efabaf31e',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-BRG-GR-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-CPRSRVNS-CPRSRSTTRVNS-BRG-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-206',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='2b4316bf-1330-45a7-ab8c-d66c6990957e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-209',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='11b43300-713b-4630-8ea3-a2cc827e1ec9',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-212',nmfault='IMBALANCE',guid='89cb4de0-3df7-4f7b-8a5a-5888fd841add',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-215',nmfault='INSPECT GEARS',guid='e86c4107-a4ab-4571-bafc-0d360d64d3ab',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-218',nmfault='REPAIR',guid='40506e20-67cb-48d1-9a2f-727fcecd707a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-221',nmfault='REPLACE BEARINGS',guid='634ed020-9dd7-4f98-b41e-ed2e7d42e402',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1cd4af01-9649-42fb-b798-64bfa288ef9e',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COMPRESSOR-GR-BRG-CPRSRIMPLR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-227',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='eeb2b505-87bf-4d64-97ab-65cfb3258a01',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-230',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1ee5d843-0960-44f4-a573-c7864c1bac22',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-233',nmfault='IMBALANCE',guid='1268b13c-1045-4240-bf10-b8d19b5913c1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-236',nmfault='REPAIR',guid='88bc3ce5-6cf2-470f-9306-c6f51ad24361',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-239',nmfault='REPLACE BEARINGS',guid='b3271e4b-5ecc-4e3d-9f1f-7f2a166a358f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e9c837b6-2876-4976-ba02-045466649ca9',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-245',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='55c4faeb-0f85-4db3-b487-e6ab91aee51e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-248',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='7e346d1f-a6f1-4073-93ac-21569969d488',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-251',nmfault='COMPONENT WEAR',guid='c7fb7a52-4fc4-493b-9890-aee88499a6e4',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-254',nmfault='IMBALANCE',guid='f0fdcb0b-3b6d-4b10-9196-a92eb5bfed9a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-257',nmfault='INSPECT FOR ALIGNMENT',guid='7654d1d8-2210-41b1-8356-79cf84a8243e',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-260',nmfault='PARALLEL MISALIGNMENT',guid='f7cb3992-c161-4f72-b4f5-b6543bf05ea5',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c1f170ee-1943-49a5-9446-375f48f39036',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGFLEX-CPLGFLEX-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-266',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='35d37b51-2b81-4605-9d60-fe4db973f00c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-269',nmfault='COMPONENT WEAR',guid='d19250ce-85fa-41e3-83a2-ae84ef01de17',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-272',nmfault='IMBALANCE',guid='cce3536f-f11c-48d2-bfae-9150c027a897',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-275',nmfault='INSPECT FOR ALIGNMENT',guid='62004b0a-b2dc-410e-b0ad-d4314a068686',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-278',nmfault='PARALLEL MISALIGNMENT',guid='cb4d926d-8f4e-4483-9322-54771f52a99e',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-281',nmfault='REPLACE BEARINGS',guid='fcda9b47-efea-4f73-ab05-a1522ed71f1a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c5d17dad-74ee-485f-9f71-5889e5940cf2',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGMAG-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-287',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='ca2c11a4-242f-49d1-8793-b3d417ad5708',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-290',nmfault='INSPECT FOR ALIGNMENT',guid='36b92c49-977d-463e-b640-8285a6f00bb0',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_inspect() end
  ,nmrule='RecRuleLine-293',nmfault='INSPECT MAG COUPLING',guid='1d93a595-b41f-4f60-8342-a986836aa282',parfault=nil,fault='70732bc0-7cfa-486a-ae7c-b4628ad568a3',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-296',nmfault='PARALLEL MISALIGNMENT',guid='372beb25-b639-443c-a14f-8e8e5ac62402',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='3df4b046-0ea1-480d-83fe-ef14937f21ef',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-302',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='4bf65b6b-0dc8-4303-8edd-fcf14170cd1c',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-305',nmfault='COMPONENT WEAR',guid='693978ae-65f7-4747-a9d1-7b9cd6544dc5',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-308',nmfault='IMBALANCE',guid='d96d74a4-a10a-4fe6-942e-f576c6f78901',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-311',nmfault='INSPECT FOR ALIGNMENT',guid='9dfd3b36-766e-4567-8c4d-5c033d79d5e6',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-314',nmfault='PARALLEL MISALIGNMENT',guid='741e4ff5-ebe0-4474-b179-aeabbd817e3d',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f83d16bf-2b93-4335-8c9d-2ad81f0e2195',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-BRG-CPLGRGD-CPLGFLEX-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-320',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='0299305e-31d1-46a1-9858-c188ad2cabbc',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-323',nmfault='COMPONENT WEAR',guid='871646b9-2d43-46f2-a395-3abea63b3b65',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-326',nmfault='IMBALANCE',guid='e279e877-5049-48e6-9c03-ec4d9d81a27f',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-329',nmfault='INSPECT FOR ALIGNMENT',guid='688c4ce7-48d5-4719-9514-6049cbfdbb81',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-332',nmfault='PARALLEL MISALIGNMENT',guid='9443959e-2a3a-4a3b-903f-f318051b3132',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='1d41afad-2f6f-4cbb-9cf6-64c8ab458f92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- COUPLING-CPLGFLEX-BRG
---- CHECK COUPLING FOR ANGULAR MISALIGNMENT
table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-338',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='c76445e6-b371-4ef7-bd5a-53d34ad388af',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-341',nmfault='COMPONENT WEAR',guid='f83dc2f7-def7-40b6-b92b-7742be9bf4e3',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-344',nmfault='IMBALANCE',guid='0e441296-4fef-4b7f-9673-773078f930bc',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-347',nmfault='INSPECT FOR ALIGNMENT',guid='c16360c7-3b92-438c-939a-232521341e6d',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-350',nmfault='PARALLEL MISALIGNMENT',guid='fdf23620-e3b6-405a-8366-283267804ff9',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='91c4acfd-982f-4ab0-989d-fb9998e0ab63',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- ENGINE-BRG-MOTPSTN-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-356',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='8092685c-b95a-4e55-89cc-3516d983dbb7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-359',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fa336801-204d-48f4-9943-c6734567ddbd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-362',nmfault='IMBALANCE',guid='a7623820-352d-44f2-965f-b02b7bdde917',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-365',nmfault='PISTON PROBLEM',guid='2f0c2a34-b24b-4755-aa97-8e500ba8b901',parfault=nil,fault='6230f2a8-bb14-43f2-beb2-3b7fe2a617ff',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-368',nmfault='REPAIR',guid='c7cc1b8b-0b4d-4d61-9e48-fdfc8f6c382d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-371',nmfault='REPLACE BEARINGS',guid='91fc331b-d861-41cf-9b44-107eb661d65f',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='6c4839de-2ea1-4f76-a1c5-9b014a3e5204',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANHTSLGR-FANVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-377',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='1a884555-8e23-45fc-9307-9d1b92b82c70',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-380',nmfault='FAN BLADING PROBLEM',guid='9b9d0db4-46dd-426b-9be5-61b5c803dbbe',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-383',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f7ed4713-998e-4edd-abf1-248ddaff41a4',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-386',nmfault='IMBALANCE',guid='b2862ee4-7fb1-45e9-b798-007de40b282a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-389',nmfault='REPAIR',guid='50cfa0cc-1654-49f8-9dfd-dafbdfaf1f83',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-392',nmfault='REPLACE BEARINGS',guid='07928060-3d28-442f-88f2-f02d03b96adc',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-395',nmfault='ROTOR RUB',guid='4124c315-c058-4e73-bd74-8fc9a9d249c1',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='799195b0-e703-4f80-834d-ac4297b29595',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-401',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='d01e3880-75f0-4c5e-9f1d-c30748ab1156',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-404',nmfault='FAN BLADING PROBLEM',guid='2ec1102e-931f-45d4-9111-6f63da303e90',parfault=nil,fault='67a4f244-e1c2-42d0-9f39-c96c8b95a0c5',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-407',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9e6037ff-4add-4833-8d34-466795011aa2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-410',nmfault='IMBALANCE',guid='89948c2a-80ec-4849-baef-d2d0eaae7f99',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-413',nmfault='REPAIR',guid='d2141f2c-a1cd-4920-a09f-654784864220',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-416',nmfault='REPLACE BEARINGS',guid='c0969a29-25a8-48be-81b7-9668d2598be3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-419',nmfault='ROTOR RUB',guid='d169fed7-05a3-45cf-b4b9-de3a72c7a945',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='7a129ef6-b295-4dff-b313-96b204fc6114',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FAN-BRG-FANVNS-FANSTTRVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-425',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='57417c1b-d890-43bf-a9cb-01ee4f7936a3',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-428',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3c88d8ea-06f9-402c-bfc5-10886f2544b6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-431',nmfault='IMBALANCE',guid='10153f9f-6ce3-47c2-b947-4c5f7f4a8ac5',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-434',nmfault='REPAIR',guid='2386e11e-77db-495d-ad77-fdece43c492c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-437',nmfault='REPLACE BEARINGS',guid='def7de77-f6fe-4144-bdab-6558d8dbfdcd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-440',nmfault='ROTOR RUB',guid='a93184d5-2b77-4ccb-878f-9a9656f02b40',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='f26b06c0-49bf-4c34-a505-ed633789e458',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- FLYWHEEL-BRG-FLYWHL-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-446',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='fe0fefc2-cd09-4142-8820-3172c2002a2e',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-449',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='203380ee-0b17-4db1-b5c6-b50dd3b2e00f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-452',nmfault='IMBALANCE',guid='1f6cead0-549f-4b6e-8844-f435c548ab37',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='ef4bc383-4324-4bff-86bb-0231c4d0446f',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR BRG-P-GR-P-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-458',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='f047ba8f-d2a5-412d-9b41-10587ee032cf',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-461',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='4da2628c-7474-487f-a799-9ff4de97e844',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-464',nmfault='IMBALANCE',guid='14625bbc-a6cd-40b9-8fbd-cc7a88af4912',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-467',nmfault='INSPECT GEARS',guid='3bd0084c-f703-461f-8cf7-ed1a58989bc3',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-470',nmfault='REPAIR',guid='7f30128f-6b50-44e9-8753-255c086790c6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-473',nmfault='REPLACE BEARINGS',guid='48dbcced-8911-473f-823b-cf09fa184daf',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='8903e485-f831-4285-8b4e-0a2bb0768b51',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-479',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='e42d91d6-30d7-4a7d-862e-bc3f984ad485',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-482',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8c0a403c-e8c2-450a-bcae-56cb93ae4fe6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-485',nmfault='IMBALANCE',guid='25f2d11a-3f2b-4303-93bb-f35be6faf867',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-488',nmfault='INSPECT GEARS',guid='f666db7a-fd63-45ef-8849-d1dff154a7db',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-491',nmfault='REPAIR',guid='67751a00-dc90-40c0-a7f2-4715a8d4a2d9',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-494',nmfault='REPLACE BEARINGS',guid='9c6e0836-6320-4ca5-96b5-f3f3d0b85f1d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b0d0b747-02b7-4601-b7cb-0816e9b00be1',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-500',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='5c920ce7-8282-41c2-b183-361956e25619',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-503',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='66ca56e3-f36e-4cca-9b9f-0f7b4db16d94',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-506',nmfault='IMBALANCE',guid='eb52540d-1085-416f-989c-382ddc04206b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-509',nmfault='INSPECT GEARS',guid='24e66026-9b6b-44bb-b74e-2c530447fd48',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-512',nmfault='REPAIR',guid='8c570f0c-d1a1-4f3b-9756-89b3b15318a4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-515',nmfault='REPLACE BEARINGS',guid='a158d55a-10e8-4f91-b940-229d58ae1d57',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4421b896-4ae7-476d-8926-2ee899d1276b',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-521',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='ae5f0824-d93a-46c8-a824-b1686a6dfc9a',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-524',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='2eac90ac-8dd7-4dd9-ac38-4aff1fc041c7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-527',nmfault='IMBALANCE',guid='9a5bdb97-3540-4c42-a53b-fa711067e6d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-530',nmfault='INSPECT GEARS',guid='94ee3edd-635f-4558-a846-0286bfc0738e',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-533',nmfault='REPAIR',guid='40716fb8-5571-4863-8108-175ace8a4529',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-536',nmfault='REPLACE BEARINGS',guid='9d5fb87f-0466-45b6-8031-278f92697da0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='25594b3c-8f61-44fd-8100-a25d4292b8c6',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-542',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='488c8529-1044-4241-a2dc-2c346be204cd',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-545',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3e8dafe4-a1ad-49e7-afe2-cca14f815f5b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-548',nmfault='IMBALANCE',guid='be8986d6-853a-4e6a-9998-fb24e153d4a6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-551',nmfault='INSPECT GEARS',guid='1fdd313b-ce1b-49b1-94e7-5a24a0730245',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-554',nmfault='REPAIR',guid='40df0937-0ea3-4f9b-bb44-2242b9f7cb1c',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-557',nmfault='REPLACE BEARINGS',guid='2cb66e59-1efd-4a66-816e-b07cbd835838',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='a1d6967c-debc-4bdf-8c18-ca7a92878f59',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-BRG-GR-GR-GR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-563',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='960fe7cb-2a7f-448d-b96a-b8c9ef31aaf6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-566',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='befa4959-d896-425d-aff2-912fbe82cda1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-569',nmfault='IMBALANCE',guid='f5e1e678-b50a-4605-a244-db9d6a9a1b56',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-572',nmfault='INSPECT GEARS',guid='6ffefc73-e8e0-4507-a53f-8884fb67ff58',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-575',nmfault='REPAIR',guid='1ab867b6-230f-493a-95c5-8c6f429268d4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-578',nmfault='REPLACE BEARINGS',guid='564825fa-41b5-403c-a4b3-704efcbc9ed3',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='437ab635-5468-4651-a310-e1511d886c5e',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR
---- INSPECT GEARS
table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-584',nmfault='INSPECT GEARS',guid='0e37d678-0b8d-4db8-9c78-0d0033db1460',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='2dea347f-8ab2-4e34-8b68-413d31d38a8a',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GEAR-GR-BRG-GR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-590',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='5105a731-4bd5-4e95-8d4d-a32d6ab36fac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-593',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fbff74fa-f066-4ffd-ac67-dc27430cae81',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-596',nmfault='IMBALANCE',guid='4d80ba93-efe1-4c7c-bdba-17ad54c0aeb9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-599',nmfault='INSPECT GEARS',guid='2347e2f4-a7ae-44ad-88d1-1cbd5291ea93',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-602',nmfault='REPAIR',guid='75fe483b-00a2-4938-bfce-aece396bd464',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-605',nmfault='REPLACE BEARINGS',guid='773b0ab0-2840-4755-b8ae-bcafde9bd9b4',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='9ef8612f-e830-4069-98ac-02ca4f2709d0',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-611',nmfault='BENT OR BOWED SHAFT',guid='08ee83aa-c7a3-445a-8a70-7f35c9080067',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-614',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='fd6cf05c-adc2-4f70-a998-ca88445341a4',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-617',nmfault='ELECTRICAL PROBLEM',guid='46a15ed4-9da3-4254-8028-e194531893a4',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-620',nmfault='FAN PROBLEM',guid='ffab68b1-386d-46e0-95d9-04f70d813ff1',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-623',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='cf561af7-1344-4afa-a45b-95144227a240',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-626',nmfault='IMBALANCE',guid='88238328-1d57-4a5c-b292-29c84c943357',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-629',nmfault='MASTER ISSUE ELECTRICAL',guid='fa8ea690-56ce-46c8-9377-844c7e56dc1a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-632',nmfault='REPAIR',guid='b2442481-0077-44f7-b5df-84fe09fbb97a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-635',nmfault='REPLACE BEARINGS',guid='72265714-78b8-4c4f-9ea6-4ac6f06b82eb',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-638',nmfault='ROTOR BAR PROBLEM',guid='62c5d552-7fb4-4225-ba80-d977655ff48b',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-641',nmfault='ROTOR RUB',guid='577ad496-e3fe-4251-9634-4641cd97f351',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='e323be28-a0e6-40d9-9ada-fbb110520747',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-FANVNS-GENIND-FANVNS-GENSYN-FANVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-647',nmfault='BENT OR BOWED SHAFT',guid='59bc3ce2-017b-4906-ba8b-f158300fd4b8',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-650',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='72e692ff-ef00-4d5d-a162-56c31765b8b2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-653',nmfault='ELECTRICAL PROBLEM',guid='5f8fa6f8-42fc-4176-878d-ecf597b4fef7',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-656',nmfault='FAN PROBLEM',guid='a177d37e-449d-4b37-9d1e-23d89942a461',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-659',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9306ca22-09f3-4cee-ad6d-bbe0bc12f7f2',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-662',nmfault='IMBALANCE',guid='1fd0cc12-c01b-4089-bc8b-0a897d72d362',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-665',nmfault='MASTER ISSUE ELECTRICAL',guid='9a4143a1-18e5-4fb2-a65e-c73d896a34c0',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-668',nmfault='REPAIR',guid='669fc652-e622-4c87-a2e8-2c7ecd20e375',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-671',nmfault='REPLACE BEARINGS',guid='0150cc52-7b59-4c72-ad48-d956020c9872',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-674',nmfault='ROTOR BAR PROBLEM',guid='3b510ac4-9cdb-4f45-b7f4-f25a59240473',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-677',nmfault='ROTOR RUB',guid='0b0e8bbd-7284-4694-a3b4-1d3598bec339',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='aafe9f05-7358-43e8-a2c3-ad756807aedd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GENERATOR-BRG-GENIND-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-683',nmfault='BENT OR BOWED SHAFT',guid='e8c3127c-b4bd-4760-b193-3a32deee0947',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-686',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='f4068fc2-abb3-41b1-927f-0f6f61778940',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-689',nmfault='ELECTRICAL PROBLEM',guid='e3b364d1-d66e-4533-873f-e8e25ef0de2a',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-692',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='33e48c11-6a72-41e7-a6e1-135fe7b55db7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-695',nmfault='IMBALANCE',guid='a224ddc3-dc27-4eee-b27d-60d1cdfd23b1',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-698',nmfault='MASTER ISSUE ELECTRICAL',guid='c04cfc11-ee8c-4d99-8aa0-4f15543cf540',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-701',nmfault='REPAIR',guid='5cfe67c9-7c4f-49f1-b6e1-7d298e086a0d',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-704',nmfault='REPLACE BEARINGS',guid='e1804eaa-b2d6-4362-b0d4-d79620d198f9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-707',nmfault='ROTOR BAR PROBLEM',guid='2e8e8d41-ad6c-498e-9b14-b5bfeb9a6bdc',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-710',nmfault='ROTOR RUB',guid='13bf7cf9-1b11-47b1-91c2-38df99836c1a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='78bf193e-902a-485d-ba58-91a3e27c4492',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- GOVENOR-BRG-GOV
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-716',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='e1018e8b-a32e-4dff-a6fc-18a1d4017504',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-719',nmfault='IMBALANCE',guid='eb33c7ad-b06e-4dcd-af56-6f4dcfee39d9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='0d306c77-f3c1-416c-b922-3fb912152844',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- Machine
---- DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)
table.insert( g_rec_rules, {rule=function() return rec_speed_change() end
  ,nmrule='RecRuleLine-725',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='3c8ce17a-5bcd-4712-bb9c-c2bf98fa2ae4',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='11111111-0000-0000-0000-000000000000',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_total_speed_deviation() end
  ,nmrule='RecRuleLine-728',nmfault='DATA NORMALIZATION ERROR (MANUAL NORMALIZATION REQUIRED)',guid='edaaae30-61f7-4ef5-be5d-83ba9afa272a',parfault=nil,fault='4d535592-5633-4a3d-92e5-c9ac0453294f',shaft='11111111-0000-0000-0000-000000000000',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-731',nmfault='ELECTRICAL PROBLEM',guid='971633cd-f862-432b-8952-b05f2966950f',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='11111111-0000-0000-0000-000000000000',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_6_monitor_unit() end
  ,nmrule='RecRuleLine-734',nmfault='MONITOR  PER TYCOM INSTRUCTION FOR INCREASED VIBRATION',guid='1c4f45a2-70c6-4481-b7ae-f47cb8022e8b',parfault=nil,fault='3a0d73ce-8c2a-45f4-afe1-d9cd5f2e6ff6',shaft='11111111-0000-0000-0000-000000000000',prime=false,autoprime=true,pri=6,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_problem() end
  ,nmrule='RecRuleLine-737',nmfault='RETEST - DATA ISSUE',guid='5a76b458-a266-44a8-b14f-92df3e0ac3c4',parfault=nil,fault='ad262f1b-5cf6-4b16-887f-ec9d554320f5',shaft='11111111-0000-0000-0000-000000000000',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_data_missing() end
  ,nmrule='RecRuleLine-740',nmfault='RETEST - MISSING DATA',guid='c03c1e73-40ce-496e-9306-edf98b9306d9',parfault=nil,fault='478c2ec7-b99a-436b-aec3-2edebfe4c440',shaft='11111111-0000-0000-0000-000000000000',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_speed_out_of_range() end
  ,nmrule='RecRuleLine-743',nmfault='RETEST - SPEED OUT OF RANGE',guid='e31eb751-cb72-449f-a97c-112c832d8a97',parfault=nil,fault='57c76254-9ac6-4e5c-bc82-cb8e5ff05440',shaft='11111111-0000-0000-0000-000000000000',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_at_properspeed() end
  ,nmrule='RecRuleLine-746',nmfault='RETEST AT PROPER SPEED PER THE VTAG',guid='3bc0dfaf-0b30-48d9-8fa9-cfdc6d20f9b2',parfault=nil,fault='862ecb68-badf-4175-8784-e05d82d17d21',shaft='11111111-0000-0000-0000-000000000000',prime=false,autoprime=true,pri=5,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_5_issue() end
  ,nmrule='RecRuleLine-749',nmfault='RETEST UNIT PER VTAG',guid='b2acdf49-2696-4e4d-9f1e-7aa0b2e9c71c',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='11111111-0000-0000-0000-000000000000',prime=false,autoprime=true,pri=5,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_retest_unit_7_cleanup() end
  ,nmrule='RecRuleLine-752',nmfault='RETEST UNIT PER VTAG',guid='5fb5b973-1d60-4179-ac1b-8795619ed5f0',parfault=nil,fault='9453199c-2b7c-485d-bde5-a01cc53a562f',shaft='11111111-0000-0000-0000-000000000000',prime=false,autoprime=true,pri=7,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-758',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='be648058-0da2-4073-895a-3910c8c605f6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-761',nmfault='ELECTRICAL PROBLEM',guid='0154952d-e064-48aa-9af9-d4277a4aeebe',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-764',nmfault='FAN PROBLEM',guid='18b8f7b5-6c5c-44df-87ad-4d16422ee14f',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-767',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='3aecd665-43d7-4709-a53b-bcd589cfcdf6',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-770',nmfault='IMBALANCE',guid='94cef2a8-743b-4847-9cc0-ef3c4e405093',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-773',nmfault='MASTER ISSUE ELECTRICAL',guid='c28dc5e4-92b0-46e9-9b8e-0401b3767bfe',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-776',nmfault='REPAIR',guid='161e7912-0d92-442f-b357-1b2b811b86ef',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-779',nmfault='REPLACE BEARINGS',guid='2cfebe90-1e2d-4ac1-8f42-beff138efeee',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-782',nmfault='ROTOR BAR PROBLEM',guid='bd3b893f-0230-400d-b31b-df05d768e5a3',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-785',nmfault='ROTOR RUB',guid='c938aa2e-b1a3-40cb-a1ce-8ccd9f7db4b0',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='51634994-a415-4ac2-ba34-855b9c5f4a23',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-FANVNS-MOTIND-FANVNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-791',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='a175bbe7-e236-427d-b9b4-883e528aa6dc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-794',nmfault='ELECTRICAL PROBLEM',guid='80168c20-1c77-4653-b066-4d573b196848',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-797',nmfault='FAN PROBLEM',guid='d9ef1d7f-ba7e-4461-9d44-188e7bc37892',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-800',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='27e972b3-f5fb-4393-b57c-f0c1005e4e69',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-803',nmfault='IMBALANCE',guid='8859756c-4717-426a-a11c-72492a18dae9',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-806',nmfault='MASTER ISSUE ELECTRICAL',guid='6a878290-b081-4b2d-845e-73f96632f267',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-809',nmfault='REPAIR',guid='b8127c97-befd-49cd-8b45-e762d5fbeb20',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-812',nmfault='REPLACE BEARINGS',guid='2fc255cb-3fe6-4faf-abf1-b4d79e628bc8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-815',nmfault='ROTOR BAR PROBLEM',guid='1036116a-7631-420e-9c1c-6c7be268e1de',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-818',nmfault='ROTOR RUB',guid='cb7856b4-02a8-41c4-a581-e2cc12e2938d',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='05323dae-2593-4129-8321-7d2fad6abfcf',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTIND-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-824',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='f841410e-0fb5-47d9-94b5-9c49a61daf2d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-827',nmfault='ELECTRICAL PROBLEM',guid='ff4651b1-815c-4f41-9df6-cddd90cab26e',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-830',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='8d316fa2-4f2d-4c6e-861d-173f487515a0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-833',nmfault='IMBALANCE',guid='f3dc4f6e-9b45-473d-bfef-ed040a78c16a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-836',nmfault='MASTER ISSUE ELECTRICAL',guid='4e256445-cefa-443f-8d70-41427a029ad4',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-839',nmfault='REPAIR',guid='447bf141-cf6f-4c1a-b982-509640b3f548',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-842',nmfault='REPLACE BEARINGS',guid='e8f9c0e2-494b-450f-8b3c-d8cf1c3fdb75',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-845',nmfault='ROTOR BAR PROBLEM',guid='562b86e7-a483-48d4-92ba-fd49d934aad0',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-848',nmfault='ROTOR RUB',guid='51ff2dc4-609b-4b4b-a5d9-9e787818a380',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='7a0678c8-fb12-4954-8f23-b11d45f1b053',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-BRG-MOTPSTN-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-854',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='2f9ff772-924d-4901-b065-78f15ee93d81',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-857',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='badea390-88d4-47f3-894c-1932dcaa2f86',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-860',nmfault='IMBALANCE',guid='60c2f1c2-a93a-4264-9302-caf46cfbe84c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-863',nmfault='PISTON PROBLEM',guid='26abb05d-c379-428d-9202-07c2eecf42d4',parfault=nil,fault='6230f2a8-bb14-43f2-beb2-3b7fe2a617ff',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-866',nmfault='REPAIR',guid='b946d8a8-06e0-4ed5-a552-1e813804d305',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-869',nmfault='REPLACE BEARINGS',guid='fb0b330d-8ff6-41b1-927c-9006ce59b8dd',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='33e5128a-3bda-4409-b71d-3b53328a864b',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-875',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='8486d318-c5bc-4c55-847a-dac681e263a9',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-878',nmfault='ELECTRICAL PROBLEM',guid='9453af31-fb2e-4b66-846c-ec2f36e17c60',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-881',nmfault='FAN PROBLEM',guid='50953da7-eb97-47a2-84d9-07f882c9abfd',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-884',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5e5f4115-1630-4125-9c0a-f2886c37ebb7',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-887',nmfault='IMBALANCE',guid='2a657674-c7ee-4035-bbd2-00fe0ee84eb6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-890',nmfault='MASTER ISSUE ELECTRICAL',guid='e2a0d8df-09d2-4d84-857e-00505add4e0b',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-893',nmfault='REPAIR',guid='3c5d40e1-66a7-4347-9d77-cb9a55396527',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-896',nmfault='REPLACE BEARINGS',guid='980b173f-33ab-45f5-a9da-14dc6fa22d5a',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-899',nmfault='ROTOR BAR PROBLEM',guid='bd191f1c-1030-4bc4-88a3-0dd1f263e8a4',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-902',nmfault='ROTOR RUB',guid='31c22deb-930f-4a73-a4fc-d193b4355925',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='12b46705-37b3-4b0f-951d-844517b2503a',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-BRG-FANVNS
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-908',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='530074f7-305a-4d7e-a26f-34dc95cdfcdb',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-911',nmfault='ELECTRICAL PROBLEM',guid='619f706a-0000-4183-9a04-dfae29e8b8c7',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-914',nmfault='FAN PROBLEM',guid='dfdd5569-9088-4978-a090-1e29961543de',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-917',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='6955032c-3ad6-4357-80cd-58ebdd8a4929',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-920',nmfault='IMBALANCE',guid='cbcbf760-4e31-4b41-b0a8-affd29e19ab6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-923',nmfault='MASTER ISSUE ELECTRICAL',guid='e0af6354-741f-4d84-b398-c6b2f2b8ec2a',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-926',nmfault='REPAIR',guid='83822019-c84e-4588-b25c-01c8df96d2e4',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-929',nmfault='REPLACE BEARINGS',guid='0221312a-122a-4308-bf5a-e207aea14296',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-932',nmfault='ROTOR BAR PROBLEM',guid='d883932c-07c6-4dfd-b25c-8b84e7f3eb7d',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-935',nmfault='ROTOR RUB',guid='d2473b17-9630-4254-adc3-b64ea281ba6a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- MOTOR-FANVNS-BRG-MOTIND-FANVNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-941',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='b9a5d731-e3b7-441d-a3e6-1b694099d701',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_3_problem() end
  ,nmrule='RecRuleLine-944',nmfault='ELECTRICAL PROBLEM',guid='70564fae-858b-4be1-87bf-cc60dfb0c8b9',parfault=nil,fault='5f6e636c-69b1-478b-be2a-5c6be38ab98f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-947',nmfault='FAN PROBLEM',guid='9e3957b5-4582-4ca7-9215-478fedec1a30',parfault=nil,fault='fe20b5e9-a8a3-41f6-8b78-947cb017afc0',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-950',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fcb91322-572e-4d3e-b488-2126ba756bfb',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-953',nmfault='IMBALANCE',guid='2806fd00-64ca-40e6-8fd6-64c385c90d4c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_electrical_2_issue() end
  ,nmrule='RecRuleLine-956',nmfault='MASTER ISSUE ELECTRICAL',guid='ada13013-6ab8-41a3-96ab-2de7bb9f9e6e',parfault=nil,fault='3cf72064-f881-49ad-812b-0ce10c24b0f3',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=2,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-959',nmfault='REPAIR',guid='09efd4a2-a1d7-4709-9577-f19c7ebb741e',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-962',nmfault='REPLACE BEARINGS',guid='a7208bad-f596-4c3c-9cfd-7822ac919397',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_bars() end
  ,nmrule='RecRuleLine-965',nmfault='ROTOR BAR PROBLEM',guid='041b5655-e57e-423b-9193-5aec83d561cd',parfault=nil,fault='4119ce9c-7860-4da6-9007-1826d3209396',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-968',nmfault='ROTOR RUB',guid='28835fc2-d1d6-4acb-a8cc-101a9bb4183a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='adcd4d1c-abb9-48e2-9c0a-3618a86de069',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PROP-BRG-PROP
---- PROPELLER BLADE EXCITED VIBRATION
table.insert( g_rec_rules, {rule=function() return rec_propeller_blades() end
  ,nmrule='RecRuleLine-974',nmfault='PROPELLER BLADE EXCITED VIBRATION',guid='94bdfad8-a4c4-469a-a525-5ad859da7bf7',parfault=nil,fault='388eeb58-a02b-4d52-b818-100d1e72bd99',shaft='69c33b02-fce7-4aa9-a55a-b9d055d58574',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PULLEY-BRG-PUL
---- BELT IRREGULARITY CHECK BELT FOR WEAR AND INCORRECT TENSION
table.insert( g_rec_rules, {rule=function() return rec_belt_problem() end
  ,nmrule='RecRuleLine-980',nmfault='BELT IRREGULARITY CHECK BELT FOR WEAR AND INCORRECT TENSION',guid='3c41af1d-89ec-4751-b7ce-29273a30f43a',parfault=nil,fault='653a79a5-2527-4403-8be9-d1661d465191',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-983',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='beed1f7e-d678-4570-b8e7-20136b681800',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-986',nmfault='IMBALANCE',guid='0846d62b-3d8a-4768-aeb7-1c0b51099d2a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_sheave_problem() end
  ,nmrule='RecRuleLine-989',nmfault='SHEAVE PROBLEM (CHECK PROPER ALIGNMENT AND RUN OUT)',guid='5d529b20-d08e-4d49-98ec-d0112ee70144',parfault=nil,fault='f985b847-a3a5-4898-a68c-a81b9fcd98c9',shaft='6304b595-1169-4878-b60f-aee9a89866df',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- Pulleys
---- BELT IRREGULARITY CHECK BELT FOR WEAR AND INCORRECT TENSION
table.insert( g_rec_rules, {rule=function() return rec_belt_problem() end
  ,nmrule='RecRuleLine-995',nmfault='BELT IRREGULARITY CHECK BELT FOR WEAR AND INCORRECT TENSION',guid='ce8f209c-95f2-4903-b720-159bfe6a10e1',parfault=nil,fault='653a79a5-2527-4403-8be9-d1661d465191',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_belt_slippage() end
  ,nmrule='RecRuleLine-998',nmfault='INSPECT DRIVE BELT FOR WEAR AND TENSION',guid='3fbe5690-e7e4-4bd5-91c4-595377208198',parfault=nil,fault='2828160e-f7ae-4a00-b682-5bb97585f230',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_alignment_3_issue() end
  ,nmrule='RecRuleLine-1001',nmfault='INSPECT FOR ALIGNMENT',guid='8e012925-d53d-44bd-a98d-b272c6e8cfc7',parfault=nil,fault='a6887082-05c4-455a-b499-4bf9864dbd91',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_sheave_problem() end
  ,nmrule='RecRuleLine-1004',nmfault='SHEAVE PROBLEM (CHECK PROPER ALIGNMENT AND RUN OUT)',guid='238aa2c0-f809-465b-9289-8aad801732cb',parfault=nil,fault='f985b847-a3a5-4898-a68c-a81b9fcd98c9',shaft='176ec26f-adeb-44b2-ab28-a3a87a94ecb4',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGFLEX-CPLGFLEX-BRG-PMPOIL-PMPOIL
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1010',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='263000fd-9cce-4ba2-bcd2-fbb8ec9a72ef',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-1013',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='2c86d9d7-f716-4979-bc1c-0119ed76e9ed',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1016',nmfault='COMPONENT WEAR',guid='a5ca2603-fc85-4a87-a767-e902b0344c9b',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-1019',nmfault='PARALLEL MISALIGNMENT',guid='78831f68-2dd1-4ca7-a76f-6a01761b9a99',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1022',nmfault='REPAIR',guid='b656d880-c72b-4676-8115-c6e1a7d78ff0',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1025',nmfault='REPLACE BEARINGS',guid='150b99f4-21ab-40e3-abcd-cc6d7fb60e24',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f9f833de-c99a-428d-bf45-260094a3dcbd',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-CPLGRGD-PMPOIL
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1031',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='9e5ee10d-a87f-42af-8469-c07a29b3863d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-1034',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='20efb629-b5ac-4d84-910d-02691194cd86',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1037',nmfault='COMPONENT WEAR',guid='be9fb9b8-bd58-4266-ae30-da6d508100d6',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-1040',nmfault='PARALLEL MISALIGNMENT',guid='bbf3ee7f-a4c3-420a-9405-afbee67c16e3',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1043',nmfault='REPAIR',guid='d4be2dd3-8c14-422e-a37d-285fb6be2047',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1046',nmfault='REPLACE BEARINGS',guid='34f8e385-43ff-4674-b4ad-0ee438e1af92',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dbebf317-8190-49ac-bc4c-f74b10a84a5e',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-GR-PMPPSTNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1052',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='82e404be-299a-4c60-9d7d-95af86223cbc',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1055',nmfault='COMPONENT WEAR',guid='e98493b9-3a00-408c-b103-9c39b5faa855',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1058',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b5945e19-6edf-4048-8d01-e18601b6eaaf',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1061',nmfault='IMBALANCE',guid='f68ee5bc-cee8-4e59-9f7c-17b3f95cf501',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-1064',nmfault='PISTON PROBLEM',guid='3ccd2932-a9be-4a7e-8298-2ca4771dcfcf',parfault=nil,fault='6230f2a8-bb14-43f2-beb2-3b7fe2a617ff',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1067',nmfault='REPAIR',guid='08b6cbb5-36d0-4cce-9ac1-f3c719469623',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1070',nmfault='REPLACE BEARINGS',guid='b9261b7e-f6d2-4563-84fe-0129c8b35935',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1d948b29-3a1c-4f54-adaa-bbea4ffa0041',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1076',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='ac420a7a-7a10-4a60-a47f-a78abaa3cfa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_pump_cavitation() end
  ,nmrule='RecRuleLine-1079',nmfault='CHECK FOR CAVITATION OR AIR INGESTION',guid='354ef8b5-54ba-408b-8495-673023cb0c20',parfault=nil,fault='7ffc2178-b99f-4e84-8b6a-e682e8f6a075',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1082',nmfault='COMPONENT WEAR',guid='f5f05034-2899-47d9-8e00-a5ce491bacf6',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1085',nmfault='IMBALANCE',guid='d3d52141-7388-40f7-b19c-44552cf44e3c',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1088',nmfault='REPAIR',guid='fe33b587-a046-4aed-89b9-451d46c085c8',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1091',nmfault='REPLACE BEARINGS',guid='c9a5aff7-7fcb-4852-ac1d-9b0040580a2e',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1094',nmfault='ROTOR RUB',guid='490cf670-a380-4ef3-b02c-34ceecca5719',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='07dfdbfe-88fc-4052-a69b-ead5476f2f3b',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1100',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='d85a4fe6-4b5a-4af5-bc44-0408e9979eea',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_pump_cavitation() end
  ,nmrule='RecRuleLine-1103',nmfault='CHECK FOR CAVITATION OR AIR INGESTION',guid='7121cced-5ce8-4fef-9ba6-2a1bb557cbd8',parfault=nil,fault='7ffc2178-b99f-4e84-8b6a-e682e8f6a075',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1106',nmfault='COMPONENT WEAR',guid='fea7f8d3-a40a-4023-8d92-625779928b69',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1109',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='9d2af9fb-002a-4cfc-bd46-e1ee86425a5e',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1112',nmfault='IMBALANCE',guid='ad45c239-7732-4626-a127-e3d01193e716',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1115',nmfault='REPAIR',guid='532896b6-1dda-4043-8760-d85505095e79',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1118',nmfault='REPLACE BEARINGS',guid='f56606de-6bcb-40e8-9f1e-e2e23466c4ee',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1121',nmfault='ROTOR RUB',guid='8aef1f48-9ab0-4fd7-b9b7-54d2e45e30e9',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='af4383d4-a3c6-4452-b1cd-f884dfa7cc27',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPIMPLR-BRG-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1127',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='b820d17a-6fb2-40a0-a817-dc1af698e14d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_pump_cavitation() end
  ,nmrule='RecRuleLine-1130',nmfault='CHECK FOR CAVITATION OR AIR INGESTION',guid='185359fc-fff9-45a8-b6ed-7d3d558e8922',parfault=nil,fault='7ffc2178-b99f-4e84-8b6a-e682e8f6a075',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1133',nmfault='COMPONENT WEAR',guid='ae1d828f-74b1-448c-b4d0-6b871f4bfa94',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1136',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='b6798ab5-8ee5-4f4b-bedf-29b32611820b',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1139',nmfault='IMBALANCE',guid='a44d1920-83b6-4027-b1d9-961c0318cbb3',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1142',nmfault='REPAIR',guid='e9f7bf2f-42f7-4d75-93c6-4181afbbe2e6',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1145',nmfault='REPLACE BEARINGS',guid='63cf769d-66d9-4a70-8598-6cb8babc1562',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1148',nmfault='ROTOR RUB',guid='9fcbd117-e9fe-4412-9c60-45cfc14dba8a',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='70946955-9a31-4ad6-983e-43d2d6c7b475',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-PMPSTTRVNS-PMPIMPLR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1154',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='6ba74dae-dd68-42c8-85bd-28e30fbbc022',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_pump_cavitation() end
  ,nmrule='RecRuleLine-1157',nmfault='CHECK FOR CAVITATION OR AIR INGESTION',guid='8c2f5077-7960-45e6-b4b2-dea939da6745',parfault=nil,fault='7ffc2178-b99f-4e84-8b6a-e682e8f6a075',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1160',nmfault='COMPONENT WEAR',guid='85ff16fd-6580-4570-ad1f-2a059bcf9fef',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1163',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='5958098b-cb66-4b65-bcd1-6a6e68794dd0',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1166',nmfault='IMBALANCE',guid='59c96e58-f8aa-4829-8ab0-8ba10b7cb0ba',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1169',nmfault='REPAIR',guid='2a4dc047-9e40-4c34-8906-ec4ce92cf428',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1172',nmfault='REPLACE BEARINGS',guid='7e80714c-9774-49db-8f7e-e995908dc149',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1175',nmfault='ROTOR RUB',guid='d65135fc-3d4b-42a4-b469-7a454a800228',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='646f5280-afaa-42ec-beeb-859db9ba00f3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPOIL
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1181',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='f46d84c6-f488-4b68-b37e-204c18d4ad07',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1184',nmfault='IMBALANCE',guid='852d1ed3-75a3-4665-ac95-da492da5e963',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_gear_mesh() end
  ,nmrule='RecRuleLine-1187',nmfault='INSPECT GEARS',guid='a2f897c3-6131-45fd-b9a2-c89942d14308',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1190',nmfault='REPAIR',guid='ec120da6-1bd4-4a52-86ab-8bb59d75cfe8',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1193',nmfault='REPLACE BEARINGS',guid='4ebc9a1d-3331-4816-bdda-46877fdd0614',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1196',nmfault='ROTOR RUB',guid='f3459f96-9533-4e73-a77f-507d043fcfff',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='958a8045-ab7d-4248-ab0c-596bbdc2210c',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPPSTNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1202',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='2e288434-4d0b-40de-a1ba-66e7016ad446',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1205',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='382a38b2-986b-43f7-b2f3-d04115d0e343',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1208',nmfault='IMBALANCE',guid='ba64c51b-6d3a-46a3-9abf-a350f2817123',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_piston_problem() end
  ,nmrule='RecRuleLine-1211',nmfault='PISTON PROBLEM',guid='e95a0b6f-81af-429a-940c-2f419984b3bd',parfault=nil,fault='6230f2a8-bb14-43f2-beb2-3b7fe2a617ff',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1214',nmfault='REPAIR',guid='d98066a7-82fd-4e4d-b37e-57a27f2e8521',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1217',nmfault='REPLACE BEARINGS',guid='51e9ed0f-373f-4fda-92de-56c3d9f39ba0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='87be646d-db99-49f9-ba14-4c4e8df45165',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPSCR-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1223',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='beab5d52-14b1-411c-8758-fa80029b5fa2',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1226',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='f8562aa6-5e7a-4809-8e43-d07328799de1',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1229',nmfault='IMBALANCE',guid='6ef32f2d-c5fc-42f5-98a2-3ffc8034f11a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='2d66a471-d959-4986-946d-942085434627',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1232',nmfault='REPAIR',guid='674c4d2b-e85c-400f-9ace-1414832c6740',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1235',nmfault='REPLACE BEARINGS',guid='07705059-3b0e-4a5e-b305-1c5a6b076a8b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='2d66a471-d959-4986-946d-942085434627',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-PMPVNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1241',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='4af232e5-6d33-4e17-acdb-1c5b90657fec',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1244',nmfault='COMPONENT WEAR',guid='590aaefd-586b-4c04-a7d9-48621605a097',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1247',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='dec59f14-cac0-4668-b02d-e29265860567',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1250',nmfault='IMBALANCE',guid='6f651c4d-910d-48ce-b0eb-0472af2963de',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1253',nmfault='REPAIR',guid='873c96d0-d482-41d5-95a7-a7e56d68561a',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1256',nmfault='REPLACE BEARINGS',guid='0e0b7fc9-582d-48ea-9535-a379386ca9c0',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='76f3c325-bbf6-4bcb-a311-51012423d403',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-BRG-SCREW as gear
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1262',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='3b5e774f-e393-4aa3-a3c7-4deeb00b8b81',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1265',nmfault='COMPONENT WEAR',guid='7a48d369-7a9b-4d83-aaea-2ceefca4464c',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1268',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='fdd502e2-3338-4439-b090-c2781f99e030',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1271',nmfault='IMBALANCE',guid='e67fc514-3822-41c8-b071-134e7e467d5a',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1274',nmfault='REPAIR',guid='536933f3-73ee-478f-bd24-a35d0289ca99',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1277',nmfault='REPLACE BEARINGS',guid='32a8d08d-84f8-4cd8-b130-9171080d4517',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='b2315330-341f-4d00-96b7-8c719fe15dd2',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-CPLGFLEX-PMPOIL
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1283',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='71270616-07ef-4e86-83fe-be1a1f5a97ac',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_angular_alignment() end
  ,nmrule='RecRuleLine-1286',nmfault='CHECK COUPLING FOR ANGULAR MISALIGNMENT',guid='45dfb368-bc5e-49ca-9469-91a6f907df97',parfault=nil,fault='2dd50782-f1fe-4be1-bca4-85318f0d9dac',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1289',nmfault='COMPONENT WEAR',guid='cf6cb592-0f14-4172-8ca4-27f88539b390',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_coupling_parallel_alignment() end
  ,nmrule='RecRuleLine-1292',nmfault='PARALLEL MISALIGNMENT',guid='d91f37ca-d5e7-440b-8e35-8f104e459b8c',parfault=nil,fault='cf3d8007-dadd-4141-91f5-4acf1532a70b',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1295',nmfault='REPAIR',guid='ee8794db-8e53-428f-a97c-ae2f454a1d00',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1298',nmfault='REPLACE BEARINGS',guid='dc72f958-5454-4511-83f8-74d7e3fcdd79',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='dc01a7d1-1656-4be9-8d57-1fca5cd9e764',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PUMP-GR-PMPOIL
---- INSPECT GEARS
table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1304',nmfault='INSPECT GEARS',guid='c46d2d94-5569-43f9-a3fc-3d4dca4212e1',parfault=nil,fault='15dd5685-db85-4229-aa66-5374ec9a4b4c',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1307',nmfault='REPAIR',guid='dbeba7b9-0931-4bff-b14c-2cda8e32bf9b',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1310',nmfault='REPLACE BEARINGS',guid='48a641dd-fe91-4082-b43b-a81b319f5a9d',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='397747e7-95f9-4343-908d-67f72f6e1d1d',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- PURIFIER-BRG-PURBWL
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1316',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='4a28f8c1-650e-426b-9b1b-97fe3ad585e8',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_clean_bowl() end
  ,nmrule='RecRuleLine-1319',nmfault='CLEAN BOWL',guid='8e035291-397e-4c51-8b78-a643d6989e31',parfault=nil,fault='b2146e7e-b9e1-4888-9af0-0f4c56d80361',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1322',nmfault='IMBALANCE',guid='ee76c3ea-c635-4f1c-9001-6db4bc386d27',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1325',nmfault='REPAIR',guid='0802aebc-162b-4c4e-b2b2-2ff0201c9cf5',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1328',nmfault='REPLACE BEARINGS',guid='97ce74f5-9df4-4c17-a484-0b255a26a442',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_rotor_rub() end
  ,nmrule='RecRuleLine-1331',nmfault='ROTOR RUB',guid='155aa16c-e8e1-4fe8-b4ae-5dcbd0f1c4e7',parfault=nil,fault='2ee46dd5-7600-4050-9891-159e6ee4c2e2',shaft='c012ab19-33b1-4af2-b75b-7be97d9769f7',prime=true,pri=1,ort='a',conf=0.6,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-6-5-BRG-BRG-TURBNOZS-TURBVNS(6)-TURBSTTRBLS(5)-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1337',nmfault='BENT OR BOWED SHAFT',guid='b93dba4b-49bf-43ec-b53e-0f0af188aa38',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1340',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='321424d6-2d54-4b56-aab6-5397694bcd1d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1343',nmfault='COMPONENT WEAR',guid='ba8a5c67-150f-4918-aed7-58eb73b36603',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1346',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='7b29fac2-22b9-415b-981a-6b62198ad9ac',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1349',nmfault='IMBALANCE',guid='5db7f634-1835-4d8a-902f-192b4f986a36',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1352',nmfault='REPAIR',guid='e4b7e01f-fc24-482c-9adc-4c381665da05',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1355',nmfault='REPLACE BEARINGS',guid='15013971-9b8d-4585-912d-8d913de8d1b9',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='f3da281e-1ec1-434a-ace7-a17365e23b4c',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-8-6-BRG-BRG-TURBNOZS-TURBVNS(8)-TURBSTTRBLS(6)-TURBNOZS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1361',nmfault='BENT OR BOWED SHAFT',guid='bc5e9a20-c88a-4705-993c-44e4fb650df6',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1364',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='24980177-3b57-4ea0-a125-0410a011fbe7',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1367',nmfault='COMPONENT WEAR',guid='7d95e44e-ff16-40cd-940d-f713d36f6ace',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1370',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='58905a81-0584-45b1-88e0-9dcefe1b37b8',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1373',nmfault='IMBALANCE',guid='268675b0-d0fd-4ff3-86eb-3249a6ee39c6',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1376',nmfault='REPAIR',guid='e9c058fe-11e5-417e-878f-7bec8a5c38bd',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1379',nmfault='REPLACE BEARINGS',guid='b35f26a3-3701-4dba-942f-3b46598a7851',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='98350a1b-e7d9-4bcf-8718-cda68c725f30',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-9-9-BRG-BRG-TURBNOZS-TURBSTTRBLS(9)-TURBVNS(9)-CPLGRGD-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1385',nmfault='BENT OR BOWED SHAFT',guid='069cb3ef-35ae-4b86-b1f1-8ea2dc81fe25',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1388',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='6bb6affb-35cb-44ae-af42-eb42824c43e6',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1391',nmfault='COMPONENT WEAR',guid='f5562b9f-a415-41c5-bc5a-1e9ffe72c665',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1394',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='04c3838c-10bc-4b0e-a0b5-663cb7f7a89f',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1397',nmfault='IMBALANCE',guid='0ad11ee6-e1c1-453c-aeb0-e3d4819b0d9b',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1400',nmfault='REPAIR',guid='e713ee63-c34a-4ef6-867c-71d1a1e7ca9f',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1403',nmfault='REPLACE BEARINGS',guid='75aed2fc-b90b-4360-a051-cebf43844789',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='4f605e73-26c5-487e-b7dc-f4a1b1e874e3',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-BRG-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- BENT OR BOWED SHAFT
table.insert( g_rec_rules, {rule=function() return rec_bowed_rotor() end
  ,nmrule='RecRuleLine-1409',nmfault='BENT OR BOWED SHAFT',guid='3430f352-3306-4717-90d5-8cc85c4723ad',parfault=nil,fault='be5266a6-c247-4fe9-9d50-45a9dadfdfe6',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1412',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='2eecc228-3202-46e5-9bbd-9634c45c1f80',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1415',nmfault='COMPONENT WEAR',guid='6e57258b-4d9a-4302-bc3c-02bc89cace91',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_softfoot() end
  ,nmrule='RecRuleLine-1418',nmfault='FOUNDATION TRANSVERSE FLEXIBILITY',guid='1b7e602d-eead-41d6-98aa-68db35f618dd',parfault=nil,fault='77ba2ad3-e48d-42cb-8184-6749c7b7edff',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='h',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1421',nmfault='IMBALANCE',guid='fa1594a9-f328-4dfc-8eb6-ff5aa47bc288',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1424',nmfault='REPAIR',guid='023d2cfc-6646-4788-97ea-a3e516425d41',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1427',nmfault='REPLACE BEARINGS',guid='3861b693-0200-4bb6-808e-4d730281d49b',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='1773be98-135d-47f4-9b0a-bb03638bd805',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBSTTRBLS-TURBVNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1433',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='8612f33a-f5a8-4bce-bee1-4d05b2a270a5',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1436',nmfault='COMPONENT WEAR',guid='9cc58ae0-d506-40a7-ab21-b5dd71594a72',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1439',nmfault='IMBALANCE',guid='ac2813d1-f402-459f-8ebf-1be597cc84c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1442',nmfault='REPAIR',guid='0eb174c6-80d3-4156-9e3d-df08e24c9dab',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1445',nmfault='REPLACE BEARINGS',guid='3320cd6f-3d74-45cd-a79e-b6908cd1cfe5',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='16597497-2013-49bf-99db-cbe71abc01db',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

-- **************************************
-- TURBINE-TURBNOZS-TURBVNS-BRG
---- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
table.insert( g_rec_rules, {rule=function() return rec_looseness() end
  ,nmrule='RecRuleLine-1451',nmfault='CHECK COMPONENT FOR PROPER FIT AND CLEARANCE',guid='8cca57cc-1ea1-4ec0-b3ef-7e32fcaf392d',parfault=nil,fault='4c5d657f-0c77-4afc-a400-490b9b1dc900',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_component_wear_or_fit() end
  ,nmrule='RecRuleLine-1454',nmfault='COMPONENT WEAR',guid='b978190d-6a86-4fc1-a12e-7200467dcb25',parfault=nil,fault='4d32e1a8-3293-4ac8-b3c5-d45e06c81800',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_balance() end
  ,nmrule='RecRuleLine-1457',nmfault='IMBALANCE',guid='34363cfe-2d27-4f84-8659-5a06557451c7',parfault=nil,fault='ca47a73c-f659-460c-8b5a-2753dcba9f0f',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=true,pri=1,ort='a',conf=0.01,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_comp_4_repair() end
  ,nmrule='RecRuleLine-1460',nmfault='REPAIR',guid='e831aad9-24d9-4217-ade0-3a11feac1506',parfault=nil,fault='4c4b2e36-017d-4a45-8a6c-8e83e011de19',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=4,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

table.insert( g_rec_rules, {rule=function() return rec_master_bearing_3_replace() end
  ,nmrule='RecRuleLine-1463',nmfault='REPLACE BEARINGS',guid='c45919da-0d93-4895-91e3-8abb376965a8',parfault=nil,fault='38ce4bb1-1b2d-47b4-86f9-574f2580c90a',shaft='fe0c6786-4637-469c-97f9-93130271de92',prime=false,autoprime=true,pri=3,ort='a',conf=0,aux=0,unit_id= rulebase_unit_id} )

end
-- SPECIAL Recommedation Functions----------
function bad_data()
 local t={}
 local  check,recs = get_fault_all ( 'e20f8da1-d8f7-4153-99fa-f1482b7d80b9') -- WARNING - DATA PROBLEM - DUPLICATE DATA
  if check then t['e20f8da1-d8f7-4153-99fa-f1482b7d80b9']=recs   end 
  check,recs = get_fault_all ( 'b064a670-ef2e-4226-93fb-6d2dee66c570') -- WARNING - DATA PROBLEM - FEWER SPECTRAL DATA RANGES THAN AVERAGE RANGES
  if check then t['b064a670-ef2e-4226-93fb-6d2dee66c570']=recs   end 
  check,recs = get_fault_all ( '9b1c43c8-3251-4603-a2b0-3b185d368c84') -- WARNING - DATA PROBLEM - PICKUPS POSSIBLY SWAPPED
  if check then t['9b1c43c8-3251-4603-a2b0-3b185d368c84']=recs   end 
  check,recs = get_fault_all ( 'dd71dc8c-7dfe-49a7-9c9c-59dc560c285c') -- WARNING - SPEED OUT OF RANGE
  if check then t['dd71dc8c-7dfe-49a7-9c9c-59dc560c285c']=recs   end 

  local maxsev,tsev,aitem,adjsev=combine_faults(t)
  if  aitem>=1  and adjsev > 10 then
    --local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(adjsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_2xlinefreq()
 local t={}
 local   check,recs = get_fault ( '91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9') -- MOTOR STATOR PROBLEM OR ABNORMAL ELECTRICAL LOAD
  if check then t['91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9']=recs   end 
  check,recs = get_fault ( 'c6ede3e2-c284-495e-b95f-bfe01618da11') -- STATOR ECCENTRICITY, SHORTED LAMINATIONS OR LOOSE IRON, 2xLF
  if check then t['c6ede3e2-c284-495e-b95f-bfe01618da11']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_balance()
 local t={}
 local   check,recs = get_fault ( '0deaccad-1be8-4a9d-8b9a-8bb6bd492d57') -- DYNAMIC BALANCE FAULT
  if check then t['0deaccad-1be8-4a9d-8b9a-8bb6bd492d57']=recs   end 
  check,recs = get_fault ( '7a8fcb93-d08f-4428-9209-501a2e056994') -- FIXED DISPLACEMENT BALANCE  SPECIFICATION EXCEEDED
  if check then t['7a8fcb93-d08f-4428-9209-501a2e056994']=recs   end 
  check,recs = get_fault ( 'ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
  if check then t['ca47a73c-f659-460c-8b5a-2753dcba9f0f']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_bearing_ff()
 local t={}
 local   check,recs = get_fault ( '56025dd9-2342-4a9f-9c5c-1067b8594ed8') -- BEARING JOURNAL FIT FAULT
  if check then t['56025dd9-2342-4a9f-9c5c-1067b8594ed8']=recs   end 
  check,recs = get_fault ( '41bce26d-b044-47f2-aebe-a6c42a4a4ad0') -- BEARING JOURNAL THRUST SHOE FAULT
  if check then t['41bce26d-b044-47f2-aebe-a6c42a4a4ad0']=recs   end 
  check,recs = get_fault ( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
  if check then t['6cb8d78c-6831-4916-b327-c359d72597d2']=recs   end 
  check,recs = get_fault ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- CHECK BEARING FIT
  if check then t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_bearing_re()
 local t={}
 local   check,recs = get_fault ( '7796df29-c2cb-4ac7-9a55-3ca98eb22f62') -- BEARING ROLLING BALL SPIN FAULT
  if check then t['7796df29-c2cb-4ac7-9a55-3ca98eb22f62']=recs   end 
  check,recs = get_fault ( '395857ce-befb-49d7-80d7-d7d65d3d3725') -- BEARING ROLLING BROKEN CAGE
  if check then t['395857ce-befb-49d7-80d7-d7d65d3d3725']=recs   end 
  check,recs = get_fault ( '396aaab9-6e19-47bf-8a8c-75890a56aa66') -- BEARING ROLLING INNER RACE FAULT
  if check then t['396aaab9-6e19-47bf-8a8c-75890a56aa66']=recs   end 
  check,recs = get_fault ( '52275357-989a-4fdb-b641-9e274b6998fe') -- BEARING ROLLING OUTER RACE FAULT
  if check then t['52275357-989a-4fdb-b641-9e274b6998fe']=recs   end 
  check,recs = get_fault ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=recs   end 
  check,recs = get_fault ( '4e904f5b-2c45-49d2-9aca-3b8daa0c397c') -- BEARING WEAR MISC TONES
  if check then t['4e904f5b-2c45-49d2-9aca-3b8daa0c397c']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_bearing_re_cocked()
 local t={}
 local   check,recs = get_fault ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=recs   end 
  check,recs = get_fault ( 'a05f207e-712f-401f-8b50-1de7380669d5') -- BEARING ROLLING COCKED FAULT
  if check then t['a05f207e-712f-401f-8b50-1de7380669d5']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_belt_problem()
 local t={}
 local   check,recs = get_fault ( '2828160e-f7ae-4a00-b682-5bb97585f230') -- INSPECT DRIVE BELT FOR WEAR AND TENSION
  if check then t['2828160e-f7ae-4a00-b682-5bb97585f230']=recs   end 
  check,recs = get_fault ( 'ca87d5bf-57d4-468c-84f9-d3a9b665f1b6') -- PULLEY BELT FAULT
  if check then t['ca87d5bf-57d4-468c-84f9-d3a9b665f1b6']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
         assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_belt_slippage()
 local t={}
 local   check,recs = get_fault ( '2828160e-f7ae-4a00-b682-5bb97585f230') -- INSPECT DRIVE BELT FOR WEAR AND TENSION
  if check then t['2828160e-f7ae-4a00-b682-5bb97585f230']=recs   end 
  check,recs = get_fault ( '65c1db37-6bcf-4f24-9c9b-ffa1d6d0851e') -- PULLEY BELT SLIPPAGE FAULT
  if check then t['65c1db37-6bcf-4f24-9c9b-ffa1d6d0851e']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_bowed_rotor()
 local t={}
 local   check,recs = get_fault ( 'be5266a6-c247-4fe9-9d50-45a9dadfdfe6') -- BENT OR BOWED SHAFT
  if check then t['be5266a6-c247-4fe9-9d50-45a9dadfdfe6']=recs   end 
  check,recs = get_fault ( '6fb0a8d3-f05d-4db5-94ad-609198f42062') -- BENT OR BOWED SHAFT FAULT
  if check then t['6fb0a8d3-f05d-4db5-94ad-609198f42062']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_clean_bowl()
 local t={}
 local   check,recs = get_fault ( '0deaccad-1be8-4a9d-8b9a-8bb6bd492d57') -- DYNAMIC BALANCE FAULT
  if check then t['0deaccad-1be8-4a9d-8b9a-8bb6bd492d57']=recs   end 
  check,recs = get_fault ( '967b15a5-923c-4231-84c0-41ad7cb06c81') -- LOOSENESS FAULT
  if check then t['967b15a5-923c-4231-84c0-41ad7cb06c81']=recs   end 
  check,recs = get_fault ( '016820d4-63ba-4177-bc69-73e25737368c') -- ROTOR RUB FAULT
  if check then t['016820d4-63ba-4177-bc69-73e25737368c']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_clutch_inspect()
 local t={}
 local   check,recs = get_fault ( 'f7b2fe7e-8e8a-4241-b713-355cf5cc0adb') -- CLUTCH SLIP FAULT
  if check then t['f7b2fe7e-8e8a-4241-b713-355cf5cc0adb']=recs   end 
  check,recs = get_fault ( 'afc6a08e-2b33-44ed-90ee-96beacc9e0d9') -- INSPECT CLUTCH
  if check then t['afc6a08e-2b33-44ed-90ee-96beacc9e0d9']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_component_wear_or_fit()
 local t={}
 local   check,recs = get_fault ( '37d17c46-b0f7-4ce6-b853-312709edcd3a') -- COMPRESSOR ROTATING ELEMENT FAULT
  if check then t['37d17c46-b0f7-4ce6-b853-312709edcd3a']=recs   end 
  check,recs = get_fault ( 'a9bf4c2d-921d-4cd6-9749-f4c278546ab7') -- COMPRESSOR STATIONARY ELEMENT FAULT
  if check then t['a9bf4c2d-921d-4cd6-9749-f4c278546ab7']=recs   end 
  check,recs = get_fault ( 'fa0eef50-bab6-4db5-aa36-5df5c2a47e7a') -- COUPLING ELEMENT FAULT
  if check then t['fa0eef50-bab6-4db5-aa36-5df5c2a47e7a']=recs   end 
  check,recs = get_fault ( '147bbccd-befc-46ad-b32b-c5fa946c8d21') -- COUPLING WEAR FAULT
  if check then t['147bbccd-befc-46ad-b32b-c5fa946c8d21']=recs   end 
  check,recs = get_fault ( '7506ade5-a3d8-4c78-90fc-650dcae59d85') -- FAN ROTATING ELEMENT FAULT
  if check then t['7506ade5-a3d8-4c78-90fc-650dcae59d85']=recs   end 
  check,recs = get_fault ( '7da464e6-0fd0-4a44-a5d2-1770964e52b4') -- FAN STATIONARY ELEMENT FAULT
  if check then t['7da464e6-0fd0-4a44-a5d2-1770964e52b4']=recs   end 
  check,recs = get_fault ( 'ee338d62-ee72-4683-95da-b2d6b02c7f5a') -- GENERATOR FAN BLADE FAULT
  if check then t['ee338d62-ee72-4683-95da-b2d6b02c7f5a']=recs   end 
  check,recs = get_fault ( 'e712797c-8ccb-466a-986b-0d659cf2acbe') -- GOVERNOR ROTATING ELEMENT FAULT
  if check then t['e712797c-8ccb-466a-986b-0d659cf2acbe']=recs   end 
  check,recs = get_fault ( 'ab1b7c89-69d9-46ac-95fd-a724048821be') -- MOTOR FAN BLADE FAULT
  if check then t['ab1b7c89-69d9-46ac-95fd-a724048821be']=recs   end 
  check,recs = get_fault ( '3f089323-1112-4d25-9f38-98fad1a9748b') -- PUMP ROTATING ELEMENT FAULT
  if check then t['3f089323-1112-4d25-9f38-98fad1a9748b']=recs   end 
  check,recs = get_fault ( 'cacf4d95-217c-4c8e-b3a3-e32a6d60e943') -- PUMP STATIONARY ELEMENT FAULT
  if check then t['cacf4d95-217c-4c8e-b3a3-e32a6d60e943']=recs   end 
  check,recs = get_fault ( '0a0ca7e0-6078-466e-a604-8254538babb0') -- TURBINE 1ST STAGE BLADING
  if check then t['0a0ca7e0-6078-466e-a604-8254538babb0']=recs   end 
  check,recs = get_fault ( '3c0fb590-f772-4600-a6dc-d37248c6b461') -- TURBINE 1ST STAGE STATOR BLADING
  if check then t['3c0fb590-f772-4600-a6dc-d37248c6b461']=recs   end 
  check,recs = get_fault ( 'bd403ab2-6609-45d1-8f26-2270fe5f8fce') -- TURBINE 2ND STAGE BLADING
  if check then t['bd403ab2-6609-45d1-8f26-2270fe5f8fce']=recs   end 
  check,recs = get_fault ( 'a21e2f01-f78d-48b2-81cd-7d618049a6a9') -- TURBINE 2ND STAGE STATOR BLADING
  if check then t['a21e2f01-f78d-48b2-81cd-7d618049a6a9']=recs   end 
  check,recs = get_fault ( '0cf04cf3-20cb-4767-b639-d868a36163ea') -- TURBINE 3RD STAGE BLADING
  if check then t['0cf04cf3-20cb-4767-b639-d868a36163ea']=recs   end 
  check,recs = get_fault ( '5be240e4-b0c0-4b00-bcdf-6be3148a4279') -- TURBINE 3RD STAGE STATOR BLADING
  if check then t['5be240e4-b0c0-4b00-bcdf-6be3148a4279']=recs   end 
  check,recs = get_fault ( '02c79b57-f641-4b2f-ac7b-329f99b00dcd') -- TURBINE 4TH STAGE BLADING
  if check then t['02c79b57-f641-4b2f-ac7b-329f99b00dcd']=recs   end 
  check,recs = get_fault ( 'f4a2d95c-7d9c-40e2-b75d-870f387b3cdd') -- TURBINE 4TH STAGE STATOR BLADING
  if check then t['f4a2d95c-7d9c-40e2-b75d-870f387b3cdd']=recs   end 
  check,recs = get_fault ( 'e9223c7b-2917-40a6-9286-80964cf680a4') -- TURBINE 5TH STAGE BLADING
  if check then t['e9223c7b-2917-40a6-9286-80964cf680a4']=recs   end 
  check,recs = get_fault ( '9581739c-118c-4ff1-9344-e2fdf17dae48') -- TURBINE 5TH STAGE STATOR BLADING
  if check then t['9581739c-118c-4ff1-9344-e2fdf17dae48']=recs   end 
  check,recs = get_fault ( '00cadd5d-4705-4cc5-8d91-67ac226e628a') -- TURBINE 6TH STAGE BLADING
  if check then t['00cadd5d-4705-4cc5-8d91-67ac226e628a']=recs   end 
  check,recs = get_fault ( '5d283048-a1d6-4652-acb1-8990adc5952f') -- TURBINE 6TH STAGE STATOR BLADING
  if check then t['5d283048-a1d6-4652-acb1-8990adc5952f']=recs   end 
  check,recs = get_fault ( '8abda45d-5785-456f-94a8-ab7d1a369afe') -- TURBINE 7TH STAGE BLADING
  if check then t['8abda45d-5785-456f-94a8-ab7d1a369afe']=recs   end 
  check,recs = get_fault ( '25d2c08a-0c79-46ef-826c-e70f0290a7b9') -- TURBINE 7TH STAGE STATOR BLADING
  if check then t['25d2c08a-0c79-46ef-826c-e70f0290a7b9']=recs   end 
  check,recs = get_fault ( 'fafec8c4-9a26-42e1-b8a2-cd6150e8b413') -- TURBINE 8TH STAGE BLADING
  if check then t['fafec8c4-9a26-42e1-b8a2-cd6150e8b413']=recs   end 
  check,recs = get_fault ( '948047e1-dc1e-4721-a26d-f613903f0bd9') -- TURBINE 8TH STAGE STATOR BLADING
  if check then t['948047e1-dc1e-4721-a26d-f613903f0bd9']=recs   end 
  check,recs = get_fault ( '7190f684-d1df-4d9c-83cf-fa75632b07f1') -- TURBINE 9TH STAGE BLADING
  if check then t['7190f684-d1df-4d9c-83cf-fa75632b07f1']=recs   end 
  check,recs = get_fault ( '0bc84bd2-6c02-40a1-8a95-b1f11fab25f8') -- TURBINE NOZZLE CLEARANCE
  if check then t['0bc84bd2-6c02-40a1-8a95-b1f11fab25f8']=recs   end 
  check,recs = get_fault ( '2d53cfbe-ff4e-4520-a54a-5600ae8d96fd') -- TURBINE ROTATING ELEMENT FAULT
  if check then t['2d53cfbe-ff4e-4520-a54a-5600ae8d96fd']=recs   end 
  check,recs = get_fault ( 'c2712a28-19a4-4bb4-a7c1-5b041c2e2475') -- TURBINE STATIONARY ELEMENT FAULT
  if check then t['c2712a28-19a4-4bb4-a7c1-5b041c2e2475']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_coupling_angular_alignment()
 local t={}
 local   check,recs = get_fault ( '2dd50782-f1fe-4be1-bca4-85318f0d9dac') -- CHECK COUPLING FOR ANGULAR MISALIGNMENT
  if check then t['2dd50782-f1fe-4be1-bca4-85318f0d9dac']=recs   end 
  check,recs = get_fault ( '3f57cd7c-d728-4b7f-8019-f308059fb047') -- COUPLING MISALIGN ANGULAR FAULT
  if check then t['3f57cd7c-d728-4b7f-8019-f308059fb047']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_coupling_inspect()
 local t={}
 local   check,recs = get_fault ( '922e5038-2226-4b16-acfb-173bf4e9361b') -- COUPLING SLIP FAULT
  if check then t['922e5038-2226-4b16-acfb-173bf4e9361b']=recs   end 
  check,recs = get_fault ( '70732bc0-7cfa-486a-ae7c-b4628ad568a3') -- INSPECT MAG COUPLING
  if check then t['70732bc0-7cfa-486a-ae7c-b4628ad568a3']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_coupling_parallel_alignment()
 local t={}
 local   check,recs = get_fault ( '914ea641-4570-4d07-ad0c-d25ddeb17ec6') -- COUPLING MISALIGN PARALLEL FAULT
  if check then t['914ea641-4570-4d07-ad0c-d25ddeb17ec6']=recs   end 
  check,recs = get_fault ( 'cf3d8007-dadd-4141-91f5-4acf1532a70b') -- PARALLEL MISALIGNMENT
  if check then t['cf3d8007-dadd-4141-91f5-4acf1532a70b']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_data_check()
 local t={}
 local   check,recs = get_fault ( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
  if check then t['0fdf12a2-b0e7-4b29-a47b-a193a4dc9637']=recs   end 
  check,recs = get_fault ( 'ca0a76af-7c5a-4b25-9a9f-078027ad6810') -- DATA MISSING - No 1X
  if check then t['ca0a76af-7c5a-4b25-9a9f-078027ad6810']=recs   end 
  check,recs = get_fault ( 'a3cd43b6-4fdc-4764-8186-3508c37e5cdd') -- DATA MISSING - NO SPECTRAL DATA
  if check then t['a3cd43b6-4fdc-4764-8186-3508c37e5cdd']=recs   end 
  check,recs = get_fault ( '8b4fe728-ae8f-4a7d-95cf-97eef2224650') -- WARNING - 2x LINE FREQUENCY NOT SUPPRESSED DURING NORMALIZATION
  if check then t['8b4fe728-ae8f-4a7d-95cf-97eef2224650']=recs   end 
  check,recs = get_fault ( 'b064a670-ef2e-4226-93fb-6d2dee66c570') -- WARNING - DATA PROBLEM - FEWER SPECTRAL DATA RANGES THAN AVERAGE RANGES
  if check then t['b064a670-ef2e-4226-93fb-6d2dee66c570']=recs   end 
  check,recs = get_fault ( '26477670-693a-4e5b-a17d-27eb1747ddc0') -- WARNING - DATA PROBLEM - HIGH NOISE LEVELS
  if check then t['26477670-693a-4e5b-a17d-27eb1747ddc0']=recs   end 
  check,recs = get_fault ( 'ee3a6ea3-605e-4d09-9b07-80ddcfb480f1') -- WARNING - DATA PROBLEM - LOW NOISE LEVELS
  if check then t['ee3a6ea3-605e-4d09-9b07-80ddcfb480f1']=recs   end 
  check,recs = get_fault ( '7a6e5c29-d253-4961-bf50-7040e30c0b0f') -- WARNING - DATA PROBLEM - MISSING WAVEFORMS
  if check then t['7a6e5c29-d253-4961-bf50-7040e30c0b0f']=recs   end 
  check,recs = get_fault ( '5ab56015-9bc5-4411-b608-a3da1fe82c14') -- WARNING - DATA PROBLEM - NO AVERAGES FOR COMPARISON
  if check then t['5ab56015-9bc5-4411-b608-a3da1fe82c14']=recs   end 
  check,recs = get_fault ( '0a41634d-34ff-4385-8d14-e8f96754ec84') -- WARNING - DATA PROBLEM - NO DEMOD DATA
  if check then t['0a41634d-34ff-4385-8d14-e8f96754ec84']=recs   end 
  check,recs = get_fault ( '4ba28d08-5839-4821-8e9e-b2cebd11a571') -- WARNING - DATA PROBLEM - NO PEAKS IN SPECTRA
  if check then t['4ba28d08-5839-4821-8e9e-b2cebd11a571']=recs   end 
  check,recs = get_fault ( 'f067f248-ecb4-4b60-ae93-bb0a0917bb5e') -- WARNING - SOME DATA NORMALIZED USING HIGHER RANGE SPEED
  if check then t['f067f248-ecb4-4b60-ae93-bb0a0917bb5e']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
    assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_data_missing()
 local t={}
 local   check,recs = get_fault_all ( 'a3cd43b6-4fdc-4764-8186-3508c37e5cdd') -- DATA MISSING - NO SPECTRAL DATA
  if check then t['a3cd43b6-4fdc-4764-8186-3508c37e5cdd']=recs   end 
  check,recs = get_fault_all ( 'b064a670-ef2e-4226-93fb-6d2dee66c570') -- WARNING - DATA PROBLEM - FEWER SPECTRAL DATA RANGES THAN AVERAGE RANGES
  if check then t['b064a670-ef2e-4226-93fb-6d2dee66c570']=recs   end 

local maxsev,tsev,aitem,avesev=combine_faults(t)    
if  aitem>=1  then
      local _,recsev=adjustedseverity(math.max(maxsev,avesev))
      assert2(recsev) --Severity
      assert3absolute(1) --Confidence
      return true
end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_data_problem()
 local t={}
 local   check,recs = get_fault_all ( 'e20f8da1-d8f7-4153-99fa-f1482b7d80b9') -- WARNING - DATA PROBLEM - DUPLICATE DATA
  if check then t['e20f8da1-d8f7-4153-99fa-f1482b7d80b9']=recs   end 
  check,recs = get_fault_all ( '9674b678-418a-4d3c-ac24-a548bbce7cff') -- WARNING - DATA PROBLEM - HIGH CREST FACTOR IN WAVEFORM
  if check then t['9674b678-418a-4d3c-ac24-a548bbce7cff']=recs   end 
  check,recs = get_fault_all ( '26477670-693a-4e5b-a17d-27eb1747ddc0') -- WARNING - DATA PROBLEM - HIGH NOISE LEVELS
  if check then t['26477670-693a-4e5b-a17d-27eb1747ddc0']=recs   end 
  check,recs = get_fault_all ( 'ee3a6ea3-605e-4d09-9b07-80ddcfb480f1') -- WARNING - DATA PROBLEM - LOW NOISE LEVELS
  if check then t['ee3a6ea3-605e-4d09-9b07-80ddcfb480f1']=recs   end 
  check,recs = get_fault_all ( '4ba28d08-5839-4821-8e9e-b2cebd11a571') -- WARNING - DATA PROBLEM - NO PEAKS IN SPECTRA
  if check then t['4ba28d08-5839-4821-8e9e-b2cebd11a571']=recs   end 
  check,recs = get_fault_all ( '4c8a0012-c1ba-46e9-88b4-ea4236de1a92') -- WARNING - NOISE FLOOR FAULT   (LowFreq)  SKI SLOPE
  if check then t['4c8a0012-c1ba-46e9-88b4-ea4236de1a92']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if aitem >= 3 or (aitem>=1 and maxsev>=30) then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
        assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_gear_mesh()
 local t={}
 local   check,recs = get_fault ( 'c9999445-9f6e-4b03-93ac-dd5abd9398f3') -- GEAR GHOST TONE FAULT
  if check then t['c9999445-9f6e-4b03-93ac-dd5abd9398f3']=recs   end 
  check,recs = get_fault ( 'b5b620c1-2b57-42b0-b157-367a89501e7e') -- GEAR MESH 1 FAULT
  if check then t['b5b620c1-2b57-42b0-b157-367a89501e7e']=recs   end 
  check,recs = get_fault ( 'f4d379f4-9e78-4696-8cec-5034ce319c5f') -- GEAR MESH 2 FAULT
  if check then t['f4d379f4-9e78-4696-8cec-5034ce319c5f']=recs   end 
  check,recs = get_fault ( 'b85a6853-765b-4acc-aaf6-70824be4767b') -- GEAR MESH 3 FAULT
  if check then t['b85a6853-765b-4acc-aaf6-70824be4767b']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if aitem >= 3 or (aitem>=1 and maxsev>=30) then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
        assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_looseness()
 local t={}
 local   check,recs = get_fault ( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
  if check then t['4c5d657f-0c77-4afc-a400-490b9b1dc900']=recs   end 
  check,recs = get_fault ( '967b15a5-923c-4231-84c0-41ad7cb06c81') -- LOOSENESS FAULT
  if check then t['967b15a5-923c-4231-84c0-41ad7cb06c81']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_alignment_3_issue()
 local t={}
 local   check,recs = get_rec_on_line ( '2dd50782-f1fe-4be1-bca4-85318f0d9dac') -- CHECK COUPLING FOR ANGULAR MISALIGNMENT
  if check then t['2dd50782-f1fe-4be1-bca4-85318f0d9dac']=recs   end 
  check,recs = get_rec_on_line ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COMPONENT WEAR
  if check then t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec_on_line ( 'cf3d8007-dadd-4141-91f5-4acf1532a70b') -- PARALLEL MISALIGNMENT
  if check then t['cf3d8007-dadd-4141-91f5-4acf1532a70b']=recs   end 
  check,recs = get_rec_on_line ( 'f985b847-a3a5-4898-a68c-a81b9fcd98c9') -- SHEAVE PROBLEM (CHECK PROPER ALIGNMENT AND RUN OUT)
  if check then t['f985b847-a3a5-4898-a68c-a81b9fcd98c9']=recs   end 


-- Turn on INSPEC FOR ALIGNMENT    
local maxsev,tsev,aitem,avesev=combine_recommendations(t)
if aitem >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
    end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_alignment_machine_5_issue()
 local t={}
 local   check,recs = get_rec_all ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COMPONENT WEAR
  if check then t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec_all ( 'a6887082-05c4-455a-b499-4bf9864dbd91') -- INSPECT FOR ALIGNMENT
  if check then t['a6887082-05c4-455a-b499-4bf9864dbd91']=recs   end 


-- Turn on INSPEC FOR ALIGNMENT   
local maxsev,tsev,aitem,avesev=combine_recommendations(t)
if aitem >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
    end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_bearing_3_replace()
 local t={}
 local   check,recs = get_rec_mine ( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
  if check then t['87b85d6b-0f55-41cd-a9c6-44b2e82dd359']=recs   end 
  check,recs = get_rec_near ( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
  if check then t['87b85d6b-0f55-41cd-a9c6-44b2e82dd359']=recs   end 
  check,recs = get_rec_mine ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=recs   end 
  check,recs = get_rec_near ( '8c0073c1-4231-4942-a579-ebf5caeb78ad') -- BEARING MISALIGNMENT
  if check then t['8c0073c1-4231-4942-a579-ebf5caeb78ad']=recs   end 
  check,recs = get_rec_mine ( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
  if check then t['6cb8d78c-6831-4916-b327-c359d72597d2']=recs   end 
  check,recs = get_rec_near ( '6cb8d78c-6831-4916-b327-c359d72597d2') -- BEARING THRUST PROBLEM
  if check then t['6cb8d78c-6831-4916-b327-c359d72597d2']=recs   end 
  check,recs = get_rec_mine ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=recs   end 
  check,recs = get_rec_near ( 'c68d8c5c-f67b-4d9a-9f53-389202fa67aa') -- BEARING WEAR
  if check then t['c68d8c5c-f67b-4d9a-9f53-389202fa67aa']=recs   end 
  check,recs = get_rec_mine ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- CHECK BEARING FIT
  if check then t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=recs   end 
  check,recs = get_rec_near ( 'cd5a3720-46b4-4b34-b2e0-9af45a03d7a7') -- CHECK BEARING FIT
  if check then t['cd5a3720-46b4-4b34-b2e0-9af45a03d7a7']=recs   end 


local maxsev,tsev,aitem,avesev=combine_recommendations(t)
if aitem >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
     if maxsev >= 2  then
         assert3absolute(1) --Confidence
     end
      return true
end

 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_4_repair()
 local t={}
 local   check,recs = get_rec ( '5918ca91-0da0-4dc8-bf37-8f29816aa3b6') -- AIR FLOW DISTURBANCE
  if check then t['5918ca91-0da0-4dc8-bf37-8f29816aa3b6']=recs   end 
  check,recs = get_rec ( 'be5266a6-c247-4fe9-9d50-45a9dadfdfe6') -- BENT OR BOWED SHAFT
  if check then t['be5266a6-c247-4fe9-9d50-45a9dadfdfe6']=recs   end 
  check,recs = get_rec ( '4c5d657f-0c77-4afc-a400-490b9b1dc900') -- CHECK COMPONENT FOR PROPER FIT AND CLEARANCE
  if check then t['4c5d657f-0c77-4afc-a400-490b9b1dc900']=recs   end 
  check,recs = get_rec ( '4d32e1a8-3293-4ac8-b3c5-d45e06c81800') -- COMPONENT WEAR
  if check then t['4d32e1a8-3293-4ac8-b3c5-d45e06c81800']=recs   end 
  check,recs = get_rec ( '5f6e636c-69b1-478b-be2a-5c6be38ab98f') -- ELECTRICAL PROBLEM
  if check then t['5f6e636c-69b1-478b-be2a-5c6be38ab98f']=recs   end 
  check,recs = get_rec ( '67a4f244-e1c2-42d0-9f39-c96c8b95a0c5') -- FAN BLADING PROBLEM
  if check then t['67a4f244-e1c2-42d0-9f39-c96c8b95a0c5']=recs   end 
  check,recs = get_rec ( 'fe20b5e9-a8a3-41f6-8b78-947cb017afc0') -- FAN PROBLEM
  if check then t['fe20b5e9-a8a3-41f6-8b78-947cb017afc0']=recs   end 
  check,recs = get_rec ( '77ba2ad3-e48d-42cb-8184-6749c7b7edff') -- FOUNDATION TRANSVERSE FLEXIBILITY
  if check then t['77ba2ad3-e48d-42cb-8184-6749c7b7edff']=recs   end 
  check,recs = get_rec ( 'ca47a73c-f659-460c-8b5a-2753dcba9f0f') -- IMBALANCE
  if check then t['ca47a73c-f659-460c-8b5a-2753dcba9f0f']=recs   end 
  check,recs = get_rec ( '6230f2a8-bb14-43f2-beb2-3b7fe2a617ff') -- PISTON PROBLEM
  if check then t['6230f2a8-bb14-43f2-beb2-3b7fe2a617ff']=recs   end 
  check,recs = get_rec ( '1a7bc958-86b1-4e9d-96bf-4d2682b98591') -- PUMP PROBLEM
  if check then t['1a7bc958-86b1-4e9d-96bf-4d2682b98591']=recs   end 
  check,recs = get_rec ( '38ce4bb1-1b2d-47b4-86f9-574f2580c90a') -- REPLACE BEARINGS
  if check then t['38ce4bb1-1b2d-47b4-86f9-574f2580c90a']=recs   end 
  check,recs = get_rec ( '2ee46dd5-7600-4050-9891-159e6ee4c2e2') -- ROTOR RUB
  if check then t['2ee46dd5-7600-4050-9891-159e6ee4c2e2']=recs   end 
  check,recs = get_rec ( '08620f78-b767-45e5-9d29-5f78ab6452f6') -- RUBBING AND/OR IMPACTING
  if check then t['08620f78-b767-45e5-9d29-5f78ab6452f6']=recs   end 
  check,recs = get_rec ( '24058a73-c6a7-49a4-934f-c450c515043a') -- TURBINE PROBLEM
  if check then t['24058a73-c6a7-49a4-934f-c450c515043a']=recs   end 


local maxsev,tsev,aitem,avesev=combine_recommendations(t)   

  --if ((maxsev=2  or maxsev =3) and  aitem >= 2)  or  (maxsev >3 and  aitem >= 1)  then
  if  (maxsev >=2 and  aitem >= 1)  then -- changed to include all monitor recommendations
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
   end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_comp_6_monitor_unit()
 local t={}
 local   check,recs = get_rec_all ( '4c4b2e36-017d-4a45-8a6c-8e83e011de19') -- REPAIR
  if check then t['4c4b2e36-017d-4a45-8a6c-8e83e011de19']=recs   end 
  check,recs = get_rec_all ( '38ce4bb1-1b2d-47b4-86f9-574f2580c90a') -- REPLACE BEARINGS
  if check then t['38ce4bb1-1b2d-47b4-86f9-574f2580c90a']=recs   end 

 local maxsev,tsev,aitem,avesev=combine_recommendations(t)
--Componet Issue fired so set Monitor
local maxsevall=recommendation_maxseverity()
  if maxsev ==2  and aitem >= 1  then
     maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
     
      assert2(2)--Severity
     if maxsevall<=2  then
      assert3absolute(1) --Confidence
      return true
     else
      assert3absolute(-1) --Confidence
      return false
     end
  end

 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_electrical_2_issue()
 local t={}
 local   check,recs = get_rec ( '91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9') -- MOTOR STATOR PROBLEM OR ABNORMAL ELECTRICAL LOAD
  if check then t['91bca0d5-7d16-45ca-9c1c-c5a49f5df3e9']=recs   end 
  check,recs = get_rec ( '4119ce9c-7860-4da6-9007-1826d3209396') -- ROTOR BAR PROBLEM
  if check then t['4119ce9c-7860-4da6-9007-1826d3209396']=recs   end 

local maxsev,tsev,aitem,avesev=combine_recommendations(t)
if aitem >= 1 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
    end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_electrical_3_problem()
 local t={}
 local   check,recs = get_rec ( '3cf72064-f881-49ad-812b-0ce10c24b0f3') -- MASTER ISSUE ELECTRICAL
  if check then t['3cf72064-f881-49ad-812b-0ce10c24b0f3']=recs   end 


local maxsev,tsev,aitem,avesev=combine_recommendations(t)
    if maxsev >= 2 then
      maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
    end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_5_at_properspeed()
 local t={}
 local   check,recs = get_rec_all ( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
  if check then t['4d535592-5633-4a3d-92e5-c9ac0453294f']=recs   end 
  check,recs = get_rec_all ( '57c76254-9ac6-4e5c-bc82-cb8e5ff05440') -- RETEST - SPEED OUT OF RANGE
  if check then t['57c76254-9ac6-4e5c-bc82-cb8e5ff05440']=recs   end 


local maxsev,tsev,aitem,avesev=combine_recommendations(t)   
 
if aitem >= 1 and maxsev >= 2 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
 end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_5_issue()
 local t={}
 local   check,recs = get_rec_all ( '7ffc2178-b99f-4e84-8b6a-e682e8f6a075') -- CHECK FOR CAVITATION OR AIR INGESTION
  if check then t['7ffc2178-b99f-4e84-8b6a-e682e8f6a075']=recs   end 
  check,recs = get_rec_all ( '0fdf12a2-b0e7-4b29-a47b-a193a4dc9637') -- DATA COLLECTION OR PROCESSING ERROR
  if check then t['0fdf12a2-b0e7-4b29-a47b-a193a4dc9637']=recs   end 
  check,recs = get_rec_all ( 'ad262f1b-5cf6-4b16-887f-ec9d554320f5') -- RETEST - DATA ISSUE
  if check then t['ad262f1b-5cf6-4b16-887f-ec9d554320f5']=recs   end 
  check,recs = get_rec_all ( '478c2ec7-b99a-436b-aec3-2edebfe4c440') -- RETEST - MISSING DATA
  if check then t['478c2ec7-b99a-436b-aec3-2edebfe4c440']=recs   end 
  check,recs = get_rec_all ( '66d6f4fe-c34e-4c14-9545-970a100757a8') -- SPECTRUM OVERLOAD (SKI SLOPE)
  if check then t['66d6f4fe-c34e-4c14-9545-970a100757a8']=recs   end 
  check,recs = get_rec_all ( 'ebd040d2-d51c-429b-ab96-17382fd1429a') -- TEST CONDITION ERROR
  if check then t['ebd040d2-d51c-429b-ab96-17382fd1429a']=recs   end 


local maxsev,tsev,aitem,avesev=combine_recommendations(t)   
 
if aitem>= 1 and maxsev >= 2 then
      local maxsev,tsev,aitem,avesev=combine_recommendations(t,-1)
      assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
 end

 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_master_retest_unit_7_cleanup()
 local t={}
 local   check,recs = get_rec_all ( '9453199c-2b7c-485d-bde5-a01cc53a562f') -- RETEST UNIT PER VTAG
  if check then t['9453199c-2b7c-485d-bde5-a01cc53a562f']=recs   end 


 local maxsev,tsev,aitem,avesev=combine_recommendations(t)    
if aitem>=1 and maxsev> 2 then

  --Set all recommendation confidence to -1
 -- Only leave RETEST UNIT PER VTAG
    recommendation_cleanup(-1)

     -- assert2(maxsev) --Severity
      assert3absolute(1) --Confidence
      return true
 else
--Keep Retest and other Recommendations
      assert3absolute(1) --Confidence
      return true
 end

 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_oil_whirl()
 local t={}
 local   check,recs = get_fault ( 'acc257ad-914e-48c7-8982-62678618d2cd') -- BEARING JOURNAL FLUID WEDGE STABILITY FAULT
  if check then t['acc257ad-914e-48c7-8982-62678618d2cd']=recs   end 
  check,recs = get_fault ( '87b85d6b-0f55-41cd-a9c6-44b2e82dd359') -- BEARING JOURNAL OIL WHIRL
  if check then t['87b85d6b-0f55-41cd-a9c6-44b2e82dd359']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
         assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_piston_problem()
 local t={}
 local   check,recs = get_fault ( '278077ab-a350-42d7-837e-78bec041a455') -- PISTON FAULT
  if check then t['278077ab-a350-42d7-837e-78bec041a455']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
   if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_propeller_blades()
 local t={}
 local   check,recs = get_fault ( '388eeb58-a02b-4d52-b818-100d1e72bd99') -- PROPELLER BLADE EXCITED VIBRATION
  if check then t['388eeb58-a02b-4d52-b818-100d1e72bd99']=recs   end 
  check,recs = get_fault ( 'ec649a2b-aa91-4247-9be5-890fb3d308db') -- PROPELLER BLADE RATE
  if check then t['ec649a2b-aa91-4247-9be5-890fb3d308db']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
        assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_pump_cavitation()
 local t={}
 local   check,recs = get_fault ( '7ffc2178-b99f-4e84-8b6a-e682e8f6a075') -- CHECK FOR CAVITATION OR AIR INGESTION
  if check then t['7ffc2178-b99f-4e84-8b6a-e682e8f6a075']=recs   end 
  check,recs = get_fault ( '808201ed-f61d-4c28-b4ca-cb4c9e12e762') -- PUMP CAVITATION FAULT 1
  if check then t['808201ed-f61d-4c28-b4ca-cb4c9e12e762']=recs   end 
  check,recs = get_fault ( 'fad1d95c-ef22-4f7e-b894-dc872227126a') -- PUMP CAVITATION FAULT 2
  if check then t['fad1d95c-ef22-4f7e-b894-dc872227126a']=recs   end 
  check,recs = get_fault ( '529ba93d-9b28-4030-8271-50a50a8e082c') -- PUMP CAVITATION FAULT 3
  if check then t['529ba93d-9b28-4030-8271-50a50a8e082c']=recs   end 
  check,recs = get_fault ( '8bb96b82-097f-4788-b482-94d0559ed73c') -- PUMP CAVITATION FAULT 4
  if check then t['8bb96b82-097f-4788-b482-94d0559ed73c']=recs   end 
  check,recs = get_fault ( 'ad213b18-050c-4cae-aa7e-a264643b6d78') -- PUMP CAVITATION FAULT 5
  if check then t['ad213b18-050c-4cae-aa7e-a264643b6d78']=recs   end 
  check,recs = get_fault ( 'ec476d08-7217-415c-8d24-5445d280920b') -- PUMP CAVITATION FAULT 6
  if check then t['ec476d08-7217-415c-8d24-5445d280920b']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_pump_problem()
 local t={}
 local   check,recs = get_fault ( '3f089323-1112-4d25-9f38-98fad1a9748b') -- PUMP ROTATING ELEMENT FAULT
  if check then t['3f089323-1112-4d25-9f38-98fad1a9748b']=recs   end 
  check,recs = get_fault ( 'cacf4d95-217c-4c8e-b3a3-e32a6d60e943') -- PUMP STATIONARY ELEMENT FAULT
  if check then t['cacf4d95-217c-4c8e-b3a3-e32a6d60e943']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
   if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_rotor_bars()
 local t={}
 local   check,recs = get_fault ( 'a523ae6b-1815-4a01-a8d3-83449a251dd8') -- GENERATOR ROTOR BAR FAULT
  if check then t['a523ae6b-1815-4a01-a8d3-83449a251dd8']=recs   end 
  check,recs = get_fault ( '57c9ac60-0949-4bf3-a632-5f3a3cf7e2d6') -- GENERATOR SLIP RING FAULT
  if check then t['57c9ac60-0949-4bf3-a632-5f3a3cf7e2d6']=recs   end 
  check,recs = get_fault ( 'aea1a9c8-de2a-48c4-a5fb-e94701180056') -- MOTOR ROTOR BAR FAULT
  if check then t['aea1a9c8-de2a-48c4-a5fb-e94701180056']=recs   end 
  check,recs = get_fault ( '4119ce9c-7860-4da6-9007-1826d3209396') -- ROTOR BAR PROBLEM
  if check then t['4119ce9c-7860-4da6-9007-1826d3209396']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_rotor_rub()
 local t={}
 local   check,recs = get_fault ( '2ee46dd5-7600-4050-9891-159e6ee4c2e2') -- ROTOR RUB
  if check then t['2ee46dd5-7600-4050-9891-159e6ee4c2e2']=recs   end 
  check,recs = get_fault ( '016820d4-63ba-4177-bc69-73e25737368c') -- ROTOR RUB FAULT
  if check then t['016820d4-63ba-4177-bc69-73e25737368c']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_sheave_problem()
 local t={}
 local   check,recs = get_fault ( 'e6f70614-30a3-4a98-9302-a9197073c710') -- PULLEY SHEAVE ALIGNMENT FAULT (DRIVEN)
  if check then t['e6f70614-30a3-4a98-9302-a9197073c710']=recs   end 
  check,recs = get_fault ( '8f853baa-f4c9-440a-8d95-0c8e7baca469') -- PULLEY SHEAVE ALIGNMENT FAULT (DRIVER)
  if check then t['8f853baa-f4c9-440a-8d95-0c8e7baca469']=recs   end 
  check,recs = get_fault ( '898169fd-b3a7-4145-9b92-fc40320ae2ee') -- PULLEY SHEAVE ECCENTRICITY FAULT (DRIVEN)
  if check then t['898169fd-b3a7-4145-9b92-fc40320ae2ee']=recs   end 
  check,recs = get_fault ( '9068581e-e314-42e1-a9d6-6e143f0df5eb') -- PULLEY SHEAVE ECCENTRICITY FAULT (DRIVER)
  if check then t['9068581e-e314-42e1-a9d6-6e143f0df5eb']=recs   end 
  check,recs = get_fault ( 'f985b847-a3a5-4898-a68c-a81b9fcd98c9') -- SHEAVE PROBLEM (CHECK PROPER ALIGNMENT AND RUN OUT)
  if check then t['f985b847-a3a5-4898-a68c-a81b9fcd98c9']=recs   end 
  check,recs = get_fault ( 'a040d9ac-ad0d-4976-83a5-64db65941ba7') -- SHEAVE PROBLEM FAULT
  if check then t['a040d9ac-ad0d-4976-83a5-64db65941ba7']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_ski_slope()
 local t={}
 local   check,recs = get_fault ( '66d6f4fe-c34e-4c14-9545-970a100757a8') -- SPECTRUM OVERLOAD (SKI SLOPE)
  if check then t['66d6f4fe-c34e-4c14-9545-970a100757a8']=recs   end 
  check,recs = get_fault ( '4c8a0012-c1ba-46e9-88b4-ea4236de1a92') -- WARNING - NOISE FLOOR FAULT   (LowFreq)  SKI SLOPE
  if check then t['4c8a0012-c1ba-46e9-88b4-ea4236de1a92']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_softfoot()
 local t={}
 local   check,recs = get_fault ( '77ba2ad3-e48d-42cb-8184-6749c7b7edff') -- FOUNDATION TRANSVERSE FLEXIBILITY
  if check then t['77ba2ad3-e48d-42cb-8184-6749c7b7edff']=recs   end 
  check,recs = get_fault ( 'f2ef6d94-a6c7-4ab5-a127-7903420a362c') -- SOFTFOOT FAULT CHECK FOUNDATION
  if check then t['f2ef6d94-a6c7-4ab5-a127-7903420a362c']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_speed_change()
 local t={}
 local   check,recs = get_fault ( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
  if check then t['4d535592-5633-4a3d-92e5-c9ac0453294f']=recs   end 
  check,recs = get_fault ( '9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a') -- WARNING - SPEED CHANGE BETWEEN PICKUPS 
  if check then t['9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
        assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_speed_out_of_range()
 local t={}
 local   check,recs = get_fault_all ( '39db3e8e-df44-4331-b61d-af3f9c3a81da') -- WARNING - MACHINE RUNNING AT WRONG SPEED
  if check then t['39db3e8e-df44-4331-b61d-af3f9c3a81da']=recs   end 
  check,recs = get_fault_all ( 'dd71dc8c-7dfe-49a7-9c9c-59dc560c285c') -- WARNING - SPEED OUT OF RANGE
  if check then t['dd71dc8c-7dfe-49a7-9c9c-59dc560c285c']=recs   end 

local maxsev,tsev,aitem,avesev=combine_faults(t)    
  if  aitem>=1  then
      local _,recsev=adjustedseverity(math.max(maxsev,avesev))
      assert2(recsev) --Severity
      assert3absolute(1) --Confidence
      return true
end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_total_speed_deviation()
 local t={}
 local   check,recs = get_fault ( '4d535592-5633-4a3d-92e5-c9ac0453294f') -- DATA NORMALIZATION ERROR (Manual Normalization Required)
  if check then t['4d535592-5633-4a3d-92e5-c9ac0453294f']=recs   end 
  check,recs = get_fault ( '5ba9638c-72f2-4c20-ada0-299eeee6faa5') -- WARNING - SPEED CHANGE >1% DURING PICKUP ACQUISITION Between Ranges
  if check then t['5ba9638c-72f2-4c20-ada0-299eeee6faa5']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
  if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
     assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
function rec_turbine_problem()
 local t={}
 local   check,recs = get_fault ( '0a0ca7e0-6078-466e-a604-8254538babb0') -- TURBINE 1ST STAGE BLADING
  if check then t['0a0ca7e0-6078-466e-a604-8254538babb0']=recs   end 
  check,recs = get_fault ( '3c0fb590-f772-4600-a6dc-d37248c6b461') -- TURBINE 1ST STAGE STATOR BLADING
  if check then t['3c0fb590-f772-4600-a6dc-d37248c6b461']=recs   end 
  check,recs = get_fault ( 'bd403ab2-6609-45d1-8f26-2270fe5f8fce') -- TURBINE 2ND STAGE BLADING
  if check then t['bd403ab2-6609-45d1-8f26-2270fe5f8fce']=recs   end 
  check,recs = get_fault ( 'a21e2f01-f78d-48b2-81cd-7d618049a6a9') -- TURBINE 2ND STAGE STATOR BLADING
  if check then t['a21e2f01-f78d-48b2-81cd-7d618049a6a9']=recs   end 
  check,recs = get_fault ( '0cf04cf3-20cb-4767-b639-d868a36163ea') -- TURBINE 3RD STAGE BLADING
  if check then t['0cf04cf3-20cb-4767-b639-d868a36163ea']=recs   end 
  check,recs = get_fault ( '5be240e4-b0c0-4b00-bcdf-6be3148a4279') -- TURBINE 3RD STAGE STATOR BLADING
  if check then t['5be240e4-b0c0-4b00-bcdf-6be3148a4279']=recs   end 
  check,recs = get_fault ( '02c79b57-f641-4b2f-ac7b-329f99b00dcd') -- TURBINE 4TH STAGE BLADING
  if check then t['02c79b57-f641-4b2f-ac7b-329f99b00dcd']=recs   end 
  check,recs = get_fault ( 'f4a2d95c-7d9c-40e2-b75d-870f387b3cdd') -- TURBINE 4TH STAGE STATOR BLADING
  if check then t['f4a2d95c-7d9c-40e2-b75d-870f387b3cdd']=recs   end 
  check,recs = get_fault ( 'e9223c7b-2917-40a6-9286-80964cf680a4') -- TURBINE 5TH STAGE BLADING
  if check then t['e9223c7b-2917-40a6-9286-80964cf680a4']=recs   end 
  check,recs = get_fault ( '9581739c-118c-4ff1-9344-e2fdf17dae48') -- TURBINE 5TH STAGE STATOR BLADING
  if check then t['9581739c-118c-4ff1-9344-e2fdf17dae48']=recs   end 
  check,recs = get_fault ( '00cadd5d-4705-4cc5-8d91-67ac226e628a') -- TURBINE 6TH STAGE BLADING
  if check then t['00cadd5d-4705-4cc5-8d91-67ac226e628a']=recs   end 
  check,recs = get_fault ( '5d283048-a1d6-4652-acb1-8990adc5952f') -- TURBINE 6TH STAGE STATOR BLADING
  if check then t['5d283048-a1d6-4652-acb1-8990adc5952f']=recs   end 
  check,recs = get_fault ( '8abda45d-5785-456f-94a8-ab7d1a369afe') -- TURBINE 7TH STAGE BLADING
  if check then t['8abda45d-5785-456f-94a8-ab7d1a369afe']=recs   end 
  check,recs = get_fault ( '25d2c08a-0c79-46ef-826c-e70f0290a7b9') -- TURBINE 7TH STAGE STATOR BLADING
  if check then t['25d2c08a-0c79-46ef-826c-e70f0290a7b9']=recs   end 
  check,recs = get_fault ( 'fafec8c4-9a26-42e1-b8a2-cd6150e8b413') -- TURBINE 8TH STAGE BLADING
  if check then t['fafec8c4-9a26-42e1-b8a2-cd6150e8b413']=recs   end 
  check,recs = get_fault ( '948047e1-dc1e-4721-a26d-f613903f0bd9') -- TURBINE 8TH STAGE STATOR BLADING
  if check then t['948047e1-dc1e-4721-a26d-f613903f0bd9']=recs   end 
  check,recs = get_fault ( '7190f684-d1df-4d9c-83cf-fa75632b07f1') -- TURBINE 9TH STAGE BLADING
  if check then t['7190f684-d1df-4d9c-83cf-fa75632b07f1']=recs   end 
  check,recs = get_fault ( '0bc84bd2-6c02-40a1-8a95-b1f11fab25f8') -- TURBINE NOZZLE CLEARANCE
  if check then t['0bc84bd2-6c02-40a1-8a95-b1f11fab25f8']=recs   end 

  local maxsev,tsev,aitem,avesev=combine_faults(t)
   if  aitem>=1  then
    local _,recsev=adjustedseverity(math.max(maxsev,avesev))
    assert2(recsev) --Severity
       assert3absolute(1) --Confidence
    return true
  end
 assert3absolute(-1) --TURN OFF Confidence
 return false
end
