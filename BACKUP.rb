## BACKUP ##

irb(main):005:0> puts CategoryRecord.all.map &:attributes
  CategoryRecord Load (0.5ms)  SELECT "category_records".* FROM "category_records"
{"id"=>7, "recipient_id"=>24, "category"=>"Education", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>8, "recipient_id"=>24, "category"=>"Spirituality", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>9, "recipient_id"=>25, "category"=>"Education", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>10, "recipient_id"=>26, "category"=>"Education", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>11, "recipient_id"=>26, "category"=>"Spirituality", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>12, "recipient_id"=>27, "category"=>"Technology", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>13, "recipient_id"=>29, "category"=>"Social Justice", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>14, "recipient_id"=>30, "category"=>"Education", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>15, "recipient_id"=>31, "category"=>"Environment", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>16, "recipient_id"=>32, "category"=>"Spirituality", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>17, "recipient_id"=>33, "category"=>"Community", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>18, "recipient_id"=>34, "category"=>"Education", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>19, "recipient_id"=>35, "category"=>"Peace", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>20, "recipient_id"=>37, "category"=>"Community", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>21, "recipient_id"=>38, "category"=>"Politics", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>22, "recipient_id"=>39, "category"=>"Community", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>23, "recipient_id"=>39, "category"=>"Spirituality", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>24, "recipient_id"=>41, "category"=>"Community", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>25, "recipient_id"=>41, "category"=>"Spirituality", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}

irb(main):007:0> puts Donation.all.map &:attributes
  Donation Load (0.5ms)  SELECT "donations".* FROM "donations"
{"id"=>45, "amount"=>#<BigDecimal:1052e67f0,'0.2E3',9(27)>, "recipient_id"=>24, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>46, "amount"=>#<BigDecimal:1052e54e0,'0.5E2',9(27)>, "recipient_id"=>24, "date"=>Sun, 01 Jan 2012, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>47, "amount"=>#<BigDecimal:1052e42c0,'0.25E2',9(27)>, "recipient_id"=>24, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>48, "amount"=>#<BigDecimal:1052df838,'0.5E2',9(27)>, "recipient_id"=>24, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>49, "amount"=>#<BigDecimal:1052deb40,'0.5E2',9(27)>, "recipient_id"=>25, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>50, "amount"=>#<BigDecimal:1052ddf60,'0.2E2',9(27)>, "recipient_id"=>25, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>51, "amount"=>#<BigDecimal:1052dd448,'0.15E2',9(27)>, "recipient_id"=>25, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>52, "amount"=>#<BigDecimal:1052dc8b8,'0.2E3',9(27)>, "recipient_id"=>26, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>53, "amount"=>#<BigDecimal:1052d7a98,'0.1E2',9(27)>, "recipient_id"=>26, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>54, "amount"=>#<BigDecimal:1052d6e90,'0.25E2',9(27)>, "recipient_id"=>27, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>55, "amount"=>#<BigDecimal:1052d5c48,'0.1E2',9(27)>, "recipient_id"=>27, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>56, "amount"=>#<BigDecimal:1052d4de8,'0.1E2',9(27)>, "recipient_id"=>27, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>57, "amount"=>#<BigDecimal:1052d40a0,'0.25E2',9(27)>, "recipient_id"=>28, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>58, "amount"=>#<BigDecimal:1052cf5a0,'0.5E2',9(27)>, "recipient_id"=>29, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>59, "amount"=>#<BigDecimal:1052ce998,'0.1E2',9(27)>, "recipient_id"=>29, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>60, "amount"=>#<BigDecimal:1052cd778,'0.5E1',9(27)>, "recipient_id"=>29, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>61, "amount"=>#<BigDecimal:1052cc878,'0.25E2',9(27)>, "recipient_id"=>30, "date"=>Wed, 01 Jan 2014, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>62, "amount"=>#<BigDecimal:1052c7918,'0.2012E2',18(36)>, "recipient_id"=>30, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>64, "amount"=>#<BigDecimal:1052c6630,'0.5E2',9(27)>, "recipient_id"=>31, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>65, "amount"=>#<BigDecimal:1052c4c40,'0.15E2',9(27)>, "recipient_id"=>31, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>66, "amount"=>#<BigDecimal:1052bf3f8,'0.5E1',9(27)>, "recipient_id"=>31, "date"=>Fri, 01 Jan 2010, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>68, "amount"=>#<BigDecimal:1052bde68,'0.2E2',9(27)>, "recipient_id"=>33, "date"=>Sun, 01 Jan 2012, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>69, "amount"=>#<BigDecimal:1052bcbf8,'0.2E2',9(27)>, "recipient_id"=>33, "date"=>Sat, 01 Jan 2011, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>70, "amount"=>#<BigDecimal:1052bd238,'0.25E2',9(27)>, "recipient_id"=>34, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>71, "amount"=>#<BigDecimal:1052b7130,'0.25E2',9(27)>, "recipient_id"=>35, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>72, "amount"=>#<BigDecimal:1052b5e48,'0.3E2',9(27)>, "recipient_id"=>36, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>73, "amount"=>#<BigDecimal:1052b52b8,'0.1E3',9(27)>, "recipient_id"=>37, "date"=>Wed, 01 Jan 2014, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>74, "amount"=>#<BigDecimal:1052b4840,'0.4E2',9(27)>, "recipient_id"=>37, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>75, "amount"=>#<BigDecimal:1052afc00,'0.5241E2',18(36)>, "recipient_id"=>40, "date"=>Tue, 01 Jan 2013, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>76, "amount"=>#<BigDecimal:1052aeee0,'0.4E2',9(27)>, "recipient_id"=>41, "date"=>Wed, 01 Jan 2014, "method"=>nil, "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00}
{"id"=>77, "amount"=>#<BigDecimal:1052ae080,'0.25E2',9(27)>, "recipient_id"=>25, "date"=>Mon, 02 Jun 2014, "method"=>"credit_card", "created_at"=>Tue, 03 Jun 2014 01:03:41 UTC +00:00, "updated_at"=>Tue, 03 Jun 2014 01:03:41 UTC +00:00}

irb(main):008:0> puts Recipient.all.map &:attributes
  Recipient Load (0.4ms)  SELECT "recipients".* FROM "recipients"
{"id"=>24, "name"=>"Farm and Wilderness", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Changes lives, changed my life."}
{"id"=>25, "name"=>"Westtown", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Changes lives, changed my life."}
{"id"=>26, "name"=>"Powell House", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Changes lives, changed my life."}
{"id"=>27, "name"=>"Wikipedia", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Awesome idea, use it all the time."}
{"id"=>28, "name"=>"NYYM", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>nil}
{"id"=>29, "name"=>"NYYM Sharing Fund", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"A great cause."}
{"id"=>30, "name"=>"Middlebury", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"I appreciate the institution."}
{"id"=>31, "name"=>"350.org", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Saving the world."}
{"id"=>32, "name"=>"Middlebury Friends Meeting", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"A very supportive community."}
{"id"=>33, "name"=>"Custodians at Middlebury", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"They take care of where I live"}
{"id"=>34, "name"=>"Connecticut Friends School", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Alumni participation"}
{"id"=>35, "name"=>"Center on Conscience & War", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Supports peace in the U.S."}
{"id"=>36, "name"=>"Harbor to the Bay", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Myles is riding in their AIDS benefit ride"}
{"id"=>37, "name"=>"Beacon Hill Friends House", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Where I live"}
{"id"=>38, "name"=>"MoveOn.org", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Changes politics"}
{"id"=>39, "name"=>"Quaker Voluntary Service", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Leading the Quaker Movement"}
{"id"=>40, "name"=>"GiveDirectly", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>nil}
{"id"=>41, "name"=>"Life Together", "created_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "updated_at"=>Sun, 25 May 2014 17:39:50 UTC +00:00, "reasons_for_support"=>"Hannah's Community"}
