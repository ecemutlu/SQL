use mydb;

insert into Customer values(1,"Ece","Mutlu",05377447273,"dfdfd@tffg.com","2001-09-05");
insert into Customer values(2,"Gizem","Mutlu",05378447073,"dfgd@ffg.com","2001-08-15");
insert into Customer values(3,"Erol","Mutlu",05377447273,"dfdfd@tffg.com","1970-09-05");
insert into Customer values(4,"Zeliha","Mutlu",05390447273,"erdfd@tfg.com","1975-09-05");
insert into Customer values(5,"Sude","Şentürk",05177546273,"ydfd@tofg.com","2001-02-02");
select * from customer;

insert into restaurant values(11,"Burger Street","Fast Food","Bornova","05443221588","12.00","24.00","40dk",4);
insert into restaurant values(12,"Kırçiçeği","Kebab","Bostanlı","05443201188","10.00","03.00","50dk",4);
insert into restaurant values(13,"Tas Çorba","Çorba","Bornova","0532227588","12.00","02.00","60dk",3);
insert into restaurant values(14,"Dönerci Orhan","Döner","Alsancak","05442223508","11.00","01.00","30dk",3);
insert into restaurant values(15,"Team Hummus","Fast Food","Bornova","05443221988","12.00","22.00","35dk",4);
select * from restaurant;

insert into review values(21,"",12,1,2);
insert into review values(22,"",13,2,3);
insert into review values(23,"good",14,3,5);
insert into review values(24,"",11,4,4);
insert into review values(25,"bad",12,5,1);

insert into food values(31,"Adana Kebab","Meat with chilli pepper",75.00,"",12);
insert into food values(32,"Chicken Wrap","Wrap with chicken and hummus",50.50,"",15);
insert into food values(33,"Lentil Soup","Lentil soup with lemon",35.00,"",13);
insert into food values(34,"İskender","Döner with tomato sauce and yogurt",79.00,"",14);
insert into food values(35,"Cheeseburger","Hamburger with cheese",80.00,"",11);

insert into orderr values(41,"",13,"2022-10-13 20:01:01",2);
insert into orderr values(42,"",14,"2022-11-13 20:01:11",1);
insert into orderr values(43,"",11,"2022-11-13 20:21:51",3);
insert into orderr values(44,"",12,"2022-09-13 20:01:01",4);
insert into orderr values(45,"",13,"2022-11-14 20:11:01",2);

insert into address values(51,"İzmir","Ankara Street","Mansuroğlu","Bayraklı","150","12");
insert into address values(52,"İzmir","Ankara Street","Atatürk","Bayraklı","250","13");
insert into address values(53,"İzmir","Ağaçlı Street","Mansuroğlu","Bornova","150","21");
insert into address values(54,"İzmir","Turgutreis Street","İnönü","Alsancak","110","5");
insert into address values(55,"İzmir","Ankara Street","Mansuroğlu","Bayraklı","10","16");

insert into payment values(61,"credit card",4623453737,"2028-11-01",355,"Ece Mutlu");
insert into payment values(62,"credit card",4636373737,"2029-01-01",222,"Ece Mutlu");
insert into payment values(63,"credit card",4643373737,"2021-01-01",181,"Ece Mutlu");
insert into payment values(64,"credit card",6763637222,"2023-02-01",177,"Ece Mutlu");
insert into payment values(65,"credit card",4649073737,"2024-12-01",230,"Ece Mutlu");

insert into Customer_has_Address values(1,51,"ev");
insert into Customer_has_Address values(1,52,"eceev");
insert into Customer_has_Address values(1,53,"iş");
insert into Customer_has_Address values(1,54,"okul");
insert into Customer_has_Address values(1,55,"emreev");

insert into Order_has_Customer values(41,1);
insert into Order_has_Customer values(42,2);
insert into Order_has_Customer values(43,3);
insert into Order_has_Customer values(44,4);
insert into Order_has_Customer values(45,5);

insert into Payment_has_Customer values(61,1,"ececard");
insert into Payment_has_Customer values(62,1,"babamcard");
insert into Payment_has_Customer values(63,1,"emrecard");
insert into Payment_has_Customer values(64,1,"annemcard");
insert into Payment_has_Customer values(65,1,"gizemcard");






