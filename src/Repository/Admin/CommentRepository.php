<?php

namespace App\Repository\Admin;

use App\Entity\Admin\Comment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Comment|null find($id, $lockMode = null, $lockVersion = null)
 * @method Comment|null findOneBy(array $criteria, array $orderBy = null)
 * @method Comment[]    findAll()
 * @method Comment[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Comment::class);
    }

    // /**
    //  * @return Comment[] Returns an array of Comment objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Comment
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
    //******* LEFT JOIN WITH SQL***********************
    public function getAllComments():array
    {
        $conn=$this->getEntityManager()->getConnection();
        $sql='
        SELECT C.*, u.name,u.surname,u.image,n.title FROM comment c 
        JOIN user u ON u.id = c.userid
        JOIN notes n ON n.id= c.noteid
        ORDER BY c.id DESC
        ';
        $stmt=$conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();

    }
    //******* LEFT JOIN WITH Doctrine***********************
    public function getAllCommentsUser($userid): array
    {
        $qd=$this->createQueryBuilder('c')
            ->select('c.id,c.subject,c.comment,c.rate,c.created_at,c.noteid,c.status,n.title')
            ->leftJoin('App\Entity\Admin\Notes','n','WITH','n.id=c.noteid')
            ->where('c.userid = :userid')
            ->setParameter('userid', $userid)
            ->orderBy('c.id','DESC');
        $query=$qd->getQuery();
        return $query->execute();


    }


}
