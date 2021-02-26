<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200109203359 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE university (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(35) DEFAULT NULL, city VARCHAR(25) DEFAULT NULL, country VARCHAR(25) DEFAULT NULL, created_at DATETIME DEFAULT NULL, updated_at DATETIME DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE notes ADD university_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE notes ADD CONSTRAINT FK_11BA68C309D1878 FOREIGN KEY (university_id) REFERENCES university (id)');
        $this->addSql('CREATE INDEX IDX_11BA68C309D1878 ON notes (university_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE notes DROP FOREIGN KEY FK_11BA68C309D1878');
        $this->addSql('DROP TABLE university');
        $this->addSql('DROP INDEX IDX_11BA68C309D1878 ON notes');
        $this->addSql('ALTER TABLE notes DROP university_id');
    }
}
