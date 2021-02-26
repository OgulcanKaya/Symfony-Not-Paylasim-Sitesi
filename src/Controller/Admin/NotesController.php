<?php

namespace App\Controller\Admin;

use App\Entity\Admin\Notes;
use App\Form\Admin\NotesType;
use App\Repository\Admin\NotesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/notes")
 */
class NotesController extends AbstractController
{
    /**
     * @Route("/", name="admin_notes_index", methods={"GET"})
     */
    public function index(NotesRepository $notesRepository): Response
    {
        $notes=$notesRepository->getAllNotes();

        return $this->render('admin/notes/index.html.twig', [
            'notes' => $notes,
        ]);
    }

    /**
     * @Route("/new", name="admin_notes_new", methods={"GET","POST"})
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

            $entityManager->persist($note);
            $entityManager->flush();

            return $this->redirectToRoute('admin_notes_index');
        }

        return $this->render('admin/notes/new.html.twig', [

            'note' => $note,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_notes_show", methods={"GET"})
     */
    public function show(Notes $note): Response
    {
        return $this->render('admin/notes/show.html.twig', [
            'note' => $note,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="admin_notes_edit", methods={"GET","POST"})
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

            return $this->redirectToRoute('admin_notes_index');
        }

        return $this->render('admin/notes/edit.html.twig', [

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
     * @Route("/{id}", name="admin_notes_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Notes $note): Response
    {
        if ($this->isCsrfTokenValid('delete'.$note->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($note);
            $entityManager->flush();
        }

        return $this->redirectToRoute('admin_notes_index');
    }
}
