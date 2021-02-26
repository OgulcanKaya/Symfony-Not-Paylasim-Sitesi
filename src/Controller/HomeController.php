<?php

namespace App\Controller;

use App\Entity\Admin\Messages;
use App\Entity\Admin\Notes;
use App\Entity\Admin\Setting;
use App\Form\Admin\MessagesType;
use App\Repository\Admin\CommentRepository;
use App\Repository\Admin\ImageRepository;
use App\Repository\Admin\SettingRepository;
use App\Repository\Admin\NotesRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Bridge\Google\Smtp\GmailTransport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(SettingRepository $settingRepository, NotesRepository $notesRepository, CommentRepository $commentRepository,UserRepository $userRepository)
    {

        $comment = $commentRepository->getAllComments();
        $setting= $settingRepository->findAll();
        $slider=$notesRepository->findBy([],['title'=>'ASC'],5);
        $notes=$notesRepository->findBy([],['title'=>'DESC'],3);

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'setting'=>$setting,
            'slider'=>$slider,
            'notes'=>$notes,
            'comment' => $comment,

        ]);
    }
    /**
     * @Route("/notes/{id}", name="home_notes_show", methods={"GET"})
     */
    public function show(Notes $note,$id,CommentRepository $commentRepository): Response
    {

        $comments=$commentRepository->findBy(['noteid'=>$id,'status'=>'True']);
        return $this->render('home/noteshow.html.twig', [
            'note' => $note,

            'comments' => $comments,
        ]);
    }

    /**
     * @Route("/showgallery/{id}", name="home_galerry_show", methods={"GET"})
     */
    public function showgallery(Notes $note,$id,ImageRepository $imageRepository): Response
    {
        $images=$imageRepository->findBy(['notes'=>$id]);
        return $this->render('home/galleryshow.html.twig', [
            'images' => $images,
            'note' => $note,
        ]);
    }

    /**
     * @Route("/notespage", name="home_all_notes")
     */
    public function allnote(SettingRepository $settingRepository,NotesRepository $notesRepository): Response
    {
        $setting= $settingRepository->findAll();
        $notes=$notesRepository->findAll();

        return $this->render('home/allnotepage.html.twig', [
            'notes' => $notes,
            'setting'=>$setting,
        ]);
    }



    /**
     * @Route("/aboutus", name="home_aboutus")
     */
    public function aboutus(SettingRepository $settingRepository): Response
    {
        $setting= $settingRepository->findAll();
        return $this->render('home/aboutus.html.twig', [

            'setting'=>$setting,
        ]);
    }
    /**
     * @Route("/contact", name="home_contact", methods={"GET","POST"})
     */
    public function contact(SettingRepository $settingRepository,Request $request): Response
    {
        $message = new Messages();
        $form = $this->createForm(MessagesType::class, $message);
        $form->handleRequest($request);
        $submittedToken =$request->request->get('token');

        if ($form->isSubmitted()) {
            if($this->isCsrfTokenValid('form-messages',$submittedToken)){

                $entityManager = $this->getDoctrine()->getManager();
                $message->setStatus('New');
                $message->setP($_SERVER['REMOTE_ADDR']);
                 $entityManager->persist($message);
                $entityManager->flush();
                $this->addFlash('success', 'Your Message Has Been Sent Successfuly!');
                $setting= $settingRepository->findAll();


                //**********************Send Email**********************//
                $email = (new Email())
                    ->from($setting[0]->getSmtpemail())
                    ->to($form['email']->getData())
                    //->cc('cc@example.com')
                    //->bcc('bcc@example.com')
                    //->replyTo('fabien@example.com')
                    //->priority(Email::PRIORITY_HIGH)
                    ->subject('All Notes Here!')
                   // ->text('Sending emails is fun again!')
                    ->html("Dear " . $form['name']->getData()."<br>
                    <p> We will evaluate your request and contact you as soon as possible</p>
                    <br>
                    Thank you <br>
                    ---------------------------------------------------------------
                    <br>".$setting[0]->getTitle()."<br>
                    Address: ".$setting[0]->getAddress()."<br>
                    Contact: ".$setting[0]->getContact()."<br>"
                    );

                $transport =new GmailTransport($setting[0]->getSmtpemail(),$setting[0]->getSmtppassword());
                $mailer=new Mailer($transport);
                $mailer->send($email);

                //******************************SEND EMAİL**************************************//

                return $this->redirectToRoute('home_contact');
            }
        }

        $setting= $settingRepository->findAll();
        return $this->render('home/contact.html.twig', [

            'setting'=>$setting,
            'form' => $form->createView(),
        ]);
    }

}
