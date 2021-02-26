<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20191214045759 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, parentid INT DEFAULT NULL, title VARCHAR(150) DEFAULT NULL, keywords VARCHAR(255) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, image VARCHAR(100) DEFAULT NULL, detail LONGTEXT DEFAULT NULL, status VARCHAR(10) DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE image (id INT AUTO_INCREMENT NOT NULL, notes_id INT DEFAULT NULL, title VARCHAR(150) DEFAULT NULL, image VARCHAR(50) DEFAULT NULL, INDEX IDX_C53D045FFC56F556 (notes_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messages (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) DEFAULT NULL, email VARCHAR(75) DEFAULT NULL, subject VARCHAR(255) DEFAULT NULL, messages VARCHAR(255) NOT NULL, status VARCHAR(10) DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE notes (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, title VARCHAR(150) DEFAULT NULL, keywords VARCHAR(255) DEFAULT NULL, description VARCHAR(255) DEFAULT NULL, image VARCHAR(100) DEFAULT NULL, status VARCHAR(10) DEFAULT NULL, season_at DATETIME DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, detail LONGTEXT DEFAULT NULL, userid INT DEFAULT NULL, INDEX IDX_11BA68C12469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE setting (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(100) NOT NULL, keywords VARCHAR(200) DEFAULT NULL, description VARCHAR(200) DEFAULT NULL, address VARCHAR(255) DEFAULT NULL, email VARCHAR(50) DEFAULT NULL, smtpserver VARCHAR(100) DEFAULT NULL, smtpemail VARCHAR(100) DEFAULT NULL, smtppassword VARCHAR(50) DEFAULT NULL, smtpport VARCHAR(100) DEFAULT NULL, facebook VARCHAR(100) DEFAULT NULL, instagram VARCHAR(100) DEFAULT NULL, twitter VARCHAR(100) DEFAULT NULL, aboutus LONGTEXT DEFAULT NULL, contact LONGTEXT DEFAULT NULL, reference LONGTEXT DEFAULT NULL, status VARCHAR(10) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, name VARCHAR(20) DEFAULT NULL, surname VARCHAR(20) DEFAULT NULL, image VARCHAR(75) DEFAULT NULL, status VARCHAR(10) DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT FK_C53D045FFC56F556 FOREIGN KEY (notes_id) REFERENCES notes (id)');
        $this->addSql('ALTER TABLE notes ADD CONSTRAINT FK_11BA68C12469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE notes DROP FOREIGN KEY FK_11BA68C12469DE2');
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY FK_C53D045FFC56F556');
        $this->addSql('DROP TABLE category');
        $this->addSql('DROP TABLE image');
        $this->addSql('DROP TABLE messages');
        $this->addSql('DROP TABLE notes');
        $this->addSql('DROP TABLE setting');
        $this->addSql('DROP TABLE user');
    }
}
