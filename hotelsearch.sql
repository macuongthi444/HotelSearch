CREATE DATABASE hotel
USE hotel

-- Bảng Người dùng (User)
CREATE TABLE users (
  user_id INT PRIMARY KEY IDENTITY(1,1),
  username NVARCHAR(50) NOT NULL,
  password NVARCHAR(50) NOT NULL,
  email NVARCHAR(100) NOT NULL,
  role NVARCHAR(20) NOT NULL,
  hotel_id INT,
  FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);
ALTER TABLE dbo.users
DROP COLUMN hotel_id
--- Add du lieu vao bang account
INSERT INTO dbo.users
(username,password,isUser, isAdmin)
VALUES(   N'huyen', N'123', 1, 1)
UPDATE dbo.users
SET isAdmin = 0 WHERE user_id  = 3
-- Bảng Khách sạn (Hotel)
CREATE TABLE hotels (
  hotel_id INT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(100) NOT NULL,
  address NVARCHAR(255) NOT NULL,
  phone NVARCHAR(20) NOT NULL,
  description TEXT,
  rating DECIMAL(2,1),
  price_range NVARCHAR(50)
  ALTER TABLE hotels
ALTER COLUMN description NVARCHAR(MAX);
ALTER TABLE hotels
ALTER COLUMN price_range DECIMAL(18, 2);
ALTER TABLE hotels
ADD image_url NVARCHAR(255);
);
/* thông tin của khách sạn*/
SET IDENTITY_INSERT hotels ON 
INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (1, N'JW Marriott Hotel Hanoi', N'8 Do Duc Duc, Hà Nội, Việt Nam', '024 3833 5588', N'Có kiến trúc hiện đại và mặt tiền ấn tượng, JW Marriott Hotel Hanoi cung cấp các phòng nghỉ sang trọng ở phía Tây Hà Nội. Khách sạn 5 sao này nằm sát ngay một chiếc hồ của địa phương cạnh Trung tâm Hội nghị Quốc gia. Khách sạn có hồ bơi trong nhà lấp lánh, các địa điểm hội họp và 2 phòng khiêu vũ, 5 nhà hàng trong khuôn viên và trung tâm spa đầy đủ dịch vụ.', 5 , 5000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max500/434795329.jpg?k=9a4aeaea3de7e15dba28b5edef1089b7c03f9cfac34eb4b44773a97567e68911&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url)  
VALUES (2, N'The Flower Boutique Hotel & Travel',N'055 Nguyễn Trường Tộ, Quận Ba Đình, Hà Nội, Việt Nam', N'098 824 25 03', N'The Flower Boutique Hotel & Travel cung cấp chỗ nghỉ 4 sao tại thành phố Hà Nội, cách Đền Quán Thánh 1,1 km và Ô Quan Chưởng 1,1 km. Khách sạn 4 sao này có bàn đặt tour, phòng giữ hành lý, lễ tân 24 giờ, dịch vụ đưa đón sân bay, dịch vụ tiền sảnh và WiFi miễn phí.', 4 , 3000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/416411049.jpg?k=5887e23d25dd1da5b90fccefc9b9d7acf8512c3ce109b09c0373e59096cc856f&o=&hp=1' )
UPDATE dbo.hotels SET image_url ='https://cf.bstatic.com/xdata/images/hotel/max1024x768/416041038.jpg?k=5b30cb6cf5bcc3640c46afed65a8afc7f438757ea73149e92df49fc64aaf2459&o=&hp=1' WHERE hotel_id = 2
INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (3, N'Golden Sun Hotel',N'33 Hàng Quạt, Quận Hoàn Kiếm, Hà Nội, Việt Nam', N'098 9633 758 ', N'Tọa lạc tại thành phố Hà Nội, cách Nhà Thờ Lớn 600 m, Golden Sun Hotel cung cấp chỗ nghỉ với sảnh khách chung, chỗ đỗ xe riêng, sân hiên và nhà hàng. Khách sạn 3 sao này có khu bếp chung và dịch vụ phòng. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ trông trẻ và dịch vụ thu đổi ngoại tệ cho khách.', 3 , 2000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1024x768/350814583.jpg?k=daac606a7fd3bf75c9d8b8b878f748631e190a383d02e39335cc9d637b0678e4&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (4, N'La Vela Saigon Hotel',N'280 Nam Ky Khoi Nghia, Ward 8, District 3, Quận 3, TP. Hồ Chí Minh, Việt Nam', N'098 1234 758 ', N'Nằm ở Thành phố Hồ Chí Minh, cách Chợ Tân Định 700 m, La Vela Saigon Hotel cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và sảnh khách chung. Chỗ nghỉ này có dịch vụ phòng, nhà hàng, sòng bạc và sân hiên. Nơi đây cung cấp dịch vụ lễ tân 24 giờ, máy ATM và dịch vụ thu đổi ngoại tệ cho khách.', 4 , 2500000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/233107919.jpg?k=c7d3dd99f2c483974f5dad8d548c981a3dae19917f3c7b6d77939749b420f9d6&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (5, N'Cabana Hotel Saigon',N'03 Trương Định, Quận 1, TP. Hồ Chí Minh, Việt Nam', N'098 5467 132 ', N'Cabana Hotel Saigon cung cấp phòng nghỉ gắn máy điều hòa với TV màn hình phẳng tại Quận 1 thuộc Thành phố Hồ Chí Minh. Khách sạn 3 sao này có WiFi miễn phí, dịch vụ phòng và lễ tân 24 giờ. Chỗ nghỉ nằm cách trung tâm thành phố 100 m và Chợ ẩm thực đường phố Bến Thành 200 m.', 3 , 1500000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/448766861.jpg?k=c5bad96155df823ce6f9662bd4920c43cd70cf354c95af273b7f9e391ed64469&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (6, N'Riggs Washington DC',N'900 F Street Northwest, Northwest, Washington, DC 20004, Mỹ', N'+1 202-638-1800', N'Riggs Washington DC tọa lạc tại ngôi nhà cũ của Ngân hàng Quốc gia Riggs và cung cấp chỗ ở hiện đại cách Gallery Place - Ga Tàu điện ngầm Khu Phố Tàu 5 phút. Các phòng tại Riggs Washington DC có tầm nhìn ra quang cảnh thành phố của Khu phố Penn. Các phòng của Riggs Washington DC có TV Thông minh và truy cập Wi-Fi miễn phí trong toàn bộ khuôn viên.', 4 , 4500000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/268037287.jpg?k=1d5902578af44b479430c6b7186efeb5314c48af5a9bd11f3c4480258d39b0a4&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (7, N'Turtle Bay Resort',N'57-091 Kamehameha Highway, Kahuku, HI 96731, Mỹ', N'+1 866-475-2569', N'Trải dài trên 1.300 mẫu Anh nguyên sơ trên Bờ biển phía Bắc của Oahu, Vịnh Rùa là sân chơi của những người thích phiêu lưu với 12 dặm đường mòn đi xe đạp và đi bộ đường dài cùng 5 dặm bờ biển hẻo lánh. Khu nghỉ mát chỉ cách các địa danh lịch sử và các điểm tham quan nổi tiếng vài phút, bao gồm thị trấn Haleiwa, Trung tâm Văn hóa Polynesian và các điểm lướt sóng nổi tiếng – Banzai/Pipeline và Vịnh Waimea.', 4 , 5000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/384682714.jpg?k=41e2806eda9adaa9c180a111bae5e2538a1475281a2b3002bd497c62c013b506&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (8, N'La Demeure Montaigne',N'18 Rue Clément Marot, 08. Champs-Elysees - Madeleine, 75008 Paris, Pháp', N'+33 1 53 57 49 50', N'Tọa lạc tại thành phố Paris, La Demeure Montaigne có nhà hàng, trung tâm thể dục, quán bar và sảnh khách chung. Trong số các tiện nghi của chỗ nghỉ này có dịch vụ tiền sảnh, bàn đặt tour và WiFi miễn phí trong toàn bộ khuôn viên. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ, dịch vụ phòng và dịch vụ thu đổi ngoại tệ cho khách.', 5 , 15000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/321383413.jpg?k=fadd9b5213dedbd1a76fe319e1657a45f32c81e5a15394b261f8909befcea3bd&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (9, N'Bulgari Hotel Paris',N'30 Avenue Georges V, 08. Champs-Elysees - Madeleine, 75008 Paris, Pháp', N'+33 1 81 72 10 00', N'tọa lạc tại một vị trí sang trọng trên Đại lộ George V, Bulgari Hotel Paris là viên ngọc quý mới nhất trên Tam Giác Vàng của Thành phố Ánh sáng. Khách sạn, quầy bar và sảnh khách sôi động, Il Ristorante - Niko Romito thanh lịch và Spa sang trọng của nó đại diện cho một sân chơi độc đáo cho cảm xúc, một món quà dành cho người dân Paris và Quốc tế. Bulgari Hotel Paris có nhà hàng, hồ bơi ngoài trời, trung tâm thể dục và quầy bar ở Paris. Nơi nghỉ này có các phòng gia đình và sân hiên. Chỗ nghỉ có lễ tân 24 giờ, dịch vụ phòng và phòng giữ hành lý cho khách.', 5 , 25000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/444123322.jpg?k=5c1e311687a2e65a7a447339b013d10fc56c72cc464b14864589686782f64cb4&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (10, N'Oriental Residence Bangkok',N'110 Wireless Road, Lumpini Patumwan , Pathumwan, 10330 Bangkok, Thái Lan ', N'+66 2 125 9000', N'Oriental Residence Bangkok kết hợp giữa thiết kế phương Đông và các tiện nghi hiện đại đồng thời cung cấp Wi-Fi miễn phí và xe đưa đón miễn phí đến ga tàu BTS Skytrain Chidlom. Chỗ nghỉ gồm hồ bơi trong nhà và sảnh khách với những bức tường lắp kính.', 5 , 7000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/462066621.jpg?k=3b352e628f3bd7828f5e78fec3307034468b918d08fbcd50257d9f9730f27c18&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url) 
VALUES (11, N'Wyndham Bangkok Queen Convention Centre',N' 388 Soi Rim Khlong Phai Singto, Rama 4 Road , Khlong Toei, 10110 Bangkok, Thái Lan ', N'+66 2 258 3888', N'Tọa lạc tại thành phố Bangkok, cách Trung tâm Hội nghị Quốc gia Queen Sirikit 400 m, Wyndham Bangkok Queen Convention Center cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và khu vườn. Trong số các tiện nghi tại chỗ nghỉ này có bếp chung, dịch vụ phòng và Wi-Fi miễn phí trong toàn bộ khuôn viên. Khách sạn có sân hiên và tầm nhìn ra quang cảnh thành phố, đồng thời du khách có thể thưởng thức bữa ăn tại nhà hàng hoặc đồ uống tại quầy bar bán đồ ăn nhanh.', 4 , 3000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/340743368.jpg?k=b6b0c1491bed1316c4f4fc0f2b14523a983a693118f964e19f6de625ecd6ff89&o=&hp=1' )

INSERT INTO hotels (hotel_id, name, address, phone, description, rating, price_range, image_url, country_id) 
VALUES (12, N'Test',N' 388 Soi Rim Khlong Phai Singto, Rama 4 Road , Khlong Toei, 10110 Bangkok, Thái Lan ', N'+66 2 258 3888', N'Tọa lạc tại thành phố Bangkok, cách Trung tâm Hội nghị Quốc gia Queen Sirikit 400 m, Wyndham Bangkok Queen Convention Center cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và khu vườn. Trong số các tiện nghi tại chỗ nghỉ này có bếp chung, dịch vụ phòng và Wi-Fi miễn phí trong toàn bộ khuôn viên. Khách sạn có sân hiên và tầm nhìn ra quang cảnh thành phố, đồng thời du khách có thể thưởng thức bữa ăn tại nhà hàng hoặc đồ uống tại quầy bar bán đồ ăn nhanh.', 4 , 3000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/340743368.jpg?k=b6b0c1491bed1316c4f4fc0f2b14523a983a693118f964e19f6de625ecd6ff89&o=&hp=1',3 )  

INSERT INTO hotels (name, address, phone, description, rating, price_range, image_url, country_id) 
VALUES (N'fw',N' ừ4 Road , Khlong Toei, 10110 Bangkok, Thái Lan ', N'+66 2 258 3888', N'Tọa lạc tại thành phố Bangkok, cách Trung tâm Hội nghị Quốc gia Queen Sirikit 400 m, Wyndham Bangkok Queen Convention Center cung cấp chỗ nghỉ với hồ bơi ngoài trời, chỗ đỗ xe riêng miễn phí, trung tâm thể dục và khu vườn. Trong số các tiện nghi tại chỗ nghỉ này có bếp chung,qừhí trong toàn bộ khuôn viên. Khách sạn có sân hiên và tầm nhìn ra quang cảnh thành phố, đồng thời du khách có thể thưởng thức bữa ăn tại nhà hàng hoặc đồ uống tại quầy bar bán đồ ăn nhanh.', 4 , 3000000.00, N'https://cf.bstatic.com/xdata/images/hotel/max1280x900/340743368.jpg?k=b6b0c1491bed1316c4f4fc0f2b14523a983a693118f964e19f6de625ecd6ff89&o=&hp=1',3 )  
-- Bảng Phòng (Room)
CREATE TABLE rooms (
  room_id INT PRIMARY KEY IDENTITY(1,1),
  hotel_id INT,
  room_number NVARCHAR(20) NOT NULL,
  type NVARCHAR(50),
  price DECIMAL(10,2),
  description TEXT,
  availability BIT, -- Kiểu BIT để biểu diễn trạng thái sẵn có (1: có sẵn, 0: không có sẵn)
  FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

-- Bảng Wishlist
CREATE TABLE wishlist (
  wishlist_id INT PRIMARY KEY IDENTITY(1,1),
  user_id INT,
  room_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
-- Bảng Đất nước (Country)
CREATE TABLE countries (
country_id INT PRIMARY KEY IDENTITY(1,1),
name NVARCHAR(100) NOT NULL,
ALTER TABLE dbo.countries
ADD cimage NVARCHAR(max)

);
--- Thêm ảnh cho đất nước
UPDATE dbo.countries SET cimage = N'https://media.baoquangninh.vn/upload/image/202110/medium/1906383_d569a750beb7f63f410ff07642096def.jpg'
WHERE cid = 4
--- Đổi name -> cname
sp_rename 'countries.name', 'cname', 'COLUMN';
sp_rename 'countries.country_id', 'cid', 'COLUMN';

-- Thêm dữ liệu mẫu vào bảng Đất nước
INSERT INTO countries (name)
VALUES (N'Việt Nam'), (N'Mỹ'), (N'Pháp'), (N'Thái Lan');

-- Bổ sung cột country_id vào bảng Khách sạn (Hotels)
ALTER TABLE hotels
ADD country_id INT,
FOREIGN KEY (country_id) REFERENCES countries(country_id);

-- Cập nhật dữ liệu cho bảng Khách sạn (Hotels) với country_id tương ứng
UPDATE hotels
SET country_id = 4 -- Ví dụ: JW Marriott Hotel Hanoi thuộc Việt Nam
WHERE hotel_id = 12;
-- Bảng Tỉnh thành (Province)
CREATE TABLE provinces (
province_id INT PRIMARY KEY IDENTITY(1,1),
name NVARCHAR(100) NOT NULL,
country_id INT,
FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Thêm dữ liệu vào bảng Tỉnh thành
INSERT INTO provinces (name, country_id)
VALUES (N'Hà Nội', 1), (N'Thành phố Hồ Chí Minh', 1);

-- Bổ sung cột province_id vào bảng Khách sạn (Hotels)
ALTER TABLE hotels
ADD province_id INT,
FOREIGN KEY (province_id) REFERENCES provinces(province_id);

-- Cập nhật dữ liệu cho bảng Khách sạn (Hotels) với province_id tương ứng
UPDATE hotels
SET province_id = 1 -- Ví dụ: JW Marriott Hotel Hanoi thuộc Hà Nội
WHERE hotel_id = 1;

-- Truy vấn khách sạn theo tỉnh thành (Ví dụ: Hà Nội)
SELECT h.name, p.name AS province
FROM hotels h
JOIN provinces p ON h.province_id = p.province_id
WHERE p.name = N'Hà Nội';
-- Truy vấn khách sạn theo quốc gia (Ví dụ: Việt Nam)
SELECT h.name, c.name AS country
FROM hotels h
JOIN countries c ON h.country_id = c.country_id
WHERE c.name = N'Việt Nam';
-- Bảng Đánh giá (Review)
CREATE TABLE reviews (
review_id INT PRIMARY KEY IDENTITY(1,1),
hotel_id INT,
user_id INT,
rating DECIMAL(2,1),
comment TEXT,
FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Bảng Đặt phòng (Booking)
CREATE TABLE bookings (
booking_id INT PRIMARY KEY IDENTITY(1,1),
user_id INT,
room_id INT,
start_date DATE,
end_date DATE,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

Thêm một số dữ liệu mẫu cho các bảng:

-- Thêm người dùng (Users)
INSERT INTO users (username, password, email, role)
VALUES ('john', 'password', 'john@example.com', 'user');

-- Thêm phòng (Rooms)
INSERT INTO rooms (hotel_id, room_number, type, price, description, availability)
VALUES (1, '101', 'Standard', 1000000.00, 'Phòng tiện nghi với đầy đủ tiện nghi cơ bản.', 1);

-- Thêm đánh giá (Reviews)
INSERT INTO reviews (hotel_id, user_id, rating, comment)
VALUES (1, 1, 4.5, 'Khách sạn rất tuyệt vời với dịch vụ chuyên nghiệp.');

-- Thêm đặt phòng (Bookings)
INSERT INTO bookings (user_id, room_id, start_date, end_date)
VALUES (1, 1, '2023-07-10', '2023-07-15');