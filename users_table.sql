-- Tabel untuk menyimpan data user
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `email` varchar(100) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `sekolah` varchar(100) NOT NULL,
  `kelas` enum('VII','VIII','IX') NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabel untuk menyimpan data pendaftaran user
CREATE TABLE `user_pendaftaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pendaftar_id` varchar(20) NOT NULL,
  `kategori_lomba_id` int NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `tanggal_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_approval` timestamp NULL DEFAULT NULL,
  `catatan_admin` text,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`kategori_lomba_id`) REFERENCES `kategori_lomba`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

