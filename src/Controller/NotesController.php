<?php

namespace App\Controller;

use App\Entity\Admin\Notes;
use App\Form\NotesType;
use App\Repository\Admin\NotesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/user/notes")
 */
class NotesController extends AbstractController
{
    /**
     * @Route("/", name="user_notes_index", methods={"GET"})
     */
    public function index(NotesRepository $notesRepository): Response
    {
        $user=$this->getUser();
        return $this->render('notes/index.html.twig', [
            'notes' => $notesRepository->findBy(['userid'=>$user->getId()]),
        ]);
    }

    /**
     * @Route("/new", name="user_notes_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $note = new Notes();
        $form = $this->createForm(NotesType::class, $note);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();

            /*************** Image Upload ***********************/
            $file = $form['image']->getData();

            if ($file) {
                $fileName = $this->generateUniqueFileName().'.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('images_directory'),
                        $fileName
                    );
                } catch (FileException $e) {
                    //
                }
                    $note->setImage($fileName);
            }
            /*************** Image Upload Finish ***********************/

            /*************** File Upload ***********************/
            $file = $form['pdf']->getData();

            if ($file) {
                $fileName = $this->generateUniqueFileName().'.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('pdf_directory'),
                        $fileName
                    );
                } catch (FileException $e) {
                    //
                }
                $note->setPdf($fileName);
            }
            /*************** File Upload Finish ***********************/

            $user=$this->getUser();
            $note->setUserid($user->getId());
            $note->setStatus("New");


            $entityManager->persist($note);
            $entityManager->flush();

            return $this->redirectToRoute('user_notes_index');
        }

        return $this->render('notes/new.html.twig', [
            'note' => $note,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="user_notes_show", methods={"GET"})
     */
    public function show(Notes $note): Response
    {
        return $this->render('notes/show.html.twig', [
            'note' => $note,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="user_notes_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Notes $note): Response
    {
        $form = $this->createForm(NotesType::class, $note);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {


            /*************** Image Upload ***********************/
            $file = $form['image']->getData();

            if ($file) {
                $fileName = $this->generateUniqueFileName().'.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('images_directory'),
                        $fileName
                    );
                } catch (FileException $e) {
                    //
                }


                $note->setImage($fileName);
            }
            /*************** Image Upload Finish ***********************/

            /*************** File Upload ***********************/
            $file = $form['pdf']->getData();

            if ($file) {
                $fileName = $this->generateUniqueFileName().'.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('pdf_directory'),
                        $fileName
                    );
                } catch (FileException $e) {
                    //
                }
                $note->setPdf($fileName);
            }
            /*************** File Upload Finish ***********************/



            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('user_notes_index');
        }

        return $this->render('notes/edit.html.twig', [
            'note' => $note,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @return string
     */
    private function generateUniqueFileName()
    {
        return  md5(uniqid());

    }



    /**
     * @Route("/{id}", name="user_notes_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Notes $note): Response
    {
        if ($this->isCsrfTokenValid('delete'.$note->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($note);
            $entityManager->flush();
        }

        return $this->redirectToRoute('user_notes_index');
    }
}
