-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 14, 2023 lúc 02:18 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `asmnodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `id` int(11) NOT NULL,
  `tenLoai` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `thuTu` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`id`, `tenLoai`, `thuTu`, `anHien`) VALUES
(1, 'Chó', 1, 1),
(2, 'Mèo', 2, 1),
(3, 'Chim', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sp`
--

CREATE TABLE `sp` (
  `id` int(11) NOT NULL,
  `tenSp` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `moTa` varchar(1500) CHARACTER SET utf8mb4 NOT NULL,
  `urlHinh` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `capNhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idLoai` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL,
  `solanxem` int(11) NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `gia` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sp`
--

INSERT INTO `sp` (`id`, `tenSp`, `moTa`, `urlHinh`, `capNhat`, `idLoai`, `anHien`, `solanxem`, `hot`, `gia`) VALUES
(1, 'Thức ăn cho chó PURINA PRO PLAN Small & Mini Sensitive Skin Coat', 'Thức ăn cho chó PURINA PRO PLAN Small & Mini Sensitive Skin Coat (Dry Dog Food) vị cá hồi. Sản phẩm sử dụng cho các giống chó có làn da nhạy cảm, hay bị dị ứng da. Giúp phục hồi lông tối ưu. Phù hợp với các giống chó nhỏ và mini có trọng lượng dưới 10kg và trưởng thành từ 12 tháng tuổi trở lên.', 'images/591bbfdb4140934b5c69cbbd23e308f3.jpg', '2023-03-14 13:12:38', 1, 1, 12, 1, 680000),
(2, 'Thức ăn cho chó trưởng thành PURINA PRO PLAN Large Adult', 'Thức ăn cho chó trưởng thành PURINA PRO PLAN Large Adult (Dry Dog Food) với công thức hoàn chỉnh phù hợp với các giống chó trưởng thành từ 12 tháng tuổi trở lên. Sản phẩm áp dụng cho các giống chó có trọng lượng khi trưởng thành trên 25kg.', 'images/anh1.jpg', '2023-03-14 13:12:41', 1, 1, 32, 1, 420000),
(3, 'Pate cho chó nước sốt vị thịt bò PEDIGREE Pouch Beef', 'Pate cho chó nước sốt vị thịt bò PEDIGREE Pouch Beef với hương vị kích thích dành cho cún biếng ăn, có thể trộn với cơm, hạt khô để tạo mùi cho thức ăn. Ngoài ra trong trường hợp không có thức ăn sẵn cho vật nuôi, có thể dùng để cho cún ăn trực tiếp.', 'images/pate-cho-cho-nuoc-sot-vi-thit-bo-pedigree-pouch-beef.jpg', '2023-03-14 13:12:13', 1, 1, 12, 1, 25000),
(4, 'Pate cho chó vị thịt gà và rau củ JERHIGH Chicken Vegetable Gravy', 'Pate cho chó vị thịt gà và rau củ JERHIGH Chicken Vegetable Gravy dành cho tất cả các giống chó.', 'images/pate-cho-cho-vi-thit-ga.jpg', '2023-03-14 13:12:46', 1, 1, 15, 1, 35000),
(5, 'Xương cho chó vị thịt bò VEGEBRAND Orgo Nutrients Beef', 'Xương cho chó vị thịt bò VEGEBRAND Orgo Nutrients Beef dành cho các giống chó có kích thước trung bình có chứa vị thịt bò.', 'images/xuong-cho-cho-vi-thit-bo-le-vegebrand-orgo-nutrients-beef-768x768.jpg', '2023-03-14 13:14:50', 1, 1, 2, 1, 25000),
(6, 'Bánh thưởng cho chó vị thịt bò JERHIGH Beef Stick', 'Bánh thưởng cho chó JERHIGH Beef vị thịt bò, phù hợp với tất cả các giống chó.\r\n', 'images/banh-thuong-cho-cho-vi-thit-bo-jerhigh-beef-stick-768x768.jpg', '2023-03-14 13:16:28', 1, 1, 8, 1, 55000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullName` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `userName` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullName`, `userName`, `password`, `role`) VALUES
(1, 'mtai', 'admin', '123', 1),
(2, 'taichat', 'teo', '123', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sp`
--
ALTER TABLE `sp`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sp`
--
ALTER TABLE `sp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
