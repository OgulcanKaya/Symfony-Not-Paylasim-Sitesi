<?php

namespace App\Repository\Admin;

use App\Entity\Admin\Notes;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Notes|null find($id, $lockMode = null, $lockVersion = null)
 * @method Notes|null findOneBy(array $criteria, array $orderBy = null)
 * @method Notes[]    findAll()
 * @method Notes[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NotesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Notes::class);
    }

    // /**
    //  * @return Notes[] Returns an array of Notes objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('n.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Notes
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */


    //******* LEFT JOIN WITH SQL***********************
    public function getAllNotes():array
    {
        $conn=$this->getEntityManager()->getConnection();
        $sql='
        SELECT N.*, c.title as catname,u.name,u.surname,ı.name as uniname FROM notes n
        JOIN category c ON c.id = n.category_id
        JOIN user u ON u.id = n.userid
        JOIN  university ı ON ı.id =n.university_id
       ORDER BY n.id ASC
        ';
        $stmt=$conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();

    }
}
