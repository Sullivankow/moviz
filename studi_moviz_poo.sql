-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 02 jan. 2025 à 22:47
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `studi_moviz_poo`
--

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

CREATE TABLE `director` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `director`
--

INSERT INTO `director` (`id`, `first_name`, `last_name`) VALUES
(1, 'Christopher', 'Nolan');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Science-Fiction'),
(2, 'Action'),
(3, 'Thriller');

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `synopsis` text NOT NULL,
  `release_date` date NOT NULL,
  `duration` time NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `title`, `synopsis`, `release_date`, `duration`, `image_name`) VALUES
(1, 'Interstellar', 'En 2067, la Terre est devenue de moins en moins accueillante pour l\'humanité plongée dans une grave crise alimentaire. L\'humanité est tellement résignée sur son destin que les écoles enseignent que les missions Apollo n\'eurent pas lieu et n\'étaient que des impostures destinées à ruiner l\'URSS. Cooper, ancien pilote de la NASA devenu agriculteur, vit dans une ferme avec sa famille. Sa fille Murphy, âgée de dix ans, croit leur maison hantée par un fantôme voulant communiquer avec elle en faisant tomber des livres de la bibliothèque de sa chambre. Après une forte tempête, venue interrompre le match de baseball auquel il assistait en famille, Cooper remarque que la poussière entrée par la fenêtre dans la chambre de sa fille forme des lignes au dessin étrange, Cooper estime que ce phénomène de communication est causé par la gravité, et remarque que les données reçues sont en binaire, et non pas en morse comme le croyait Murphy. Le « fantôme » pourrait être une intelligence inconnue leur adressant un message codé au moyen d\'ondes gravitationnelles qui altèrent la poussière sur le sol. Ils comprennent que ce message leur indique les coordonnées géographiques d\'un lieu où ils décident de se rendre.', '2010-07-21', '02:28:00', 'interstellar-65525dac66cac461033198.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `movie_director`
--

CREATE TABLE `movie_director` (
  `movie_id` int(11) UNSIGNED NOT NULL,
  `director_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie_director`
--

INSERT INTO `movie_director` (`movie_id`, `director_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `movie_id` int(11) UNSIGNED NOT NULL,
  `genre_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movie_genre`
--

INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `review` text NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `movie_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `rate`, `review`, `approved`, `user_id`, `movie_id`) VALUES
(1, 4, 'Très bon film j\'ai adoré', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `first_name`, `last_name`, `role`) VALUES
(1, 'test@mail.com', '$2y$10$M.BQ8rdASes1XI9A5pdMAOugvwwjLWJpw2t1IqjYyYrW4f3c/ZB6C', 'alex', 'mercer', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movie_director`
--
ALTER TABLE `movie_director`
  ADD KEY `director_id` (`director_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Index pour la table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movie_director`
--
ALTER TABLE `movie_director`
  ADD CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
