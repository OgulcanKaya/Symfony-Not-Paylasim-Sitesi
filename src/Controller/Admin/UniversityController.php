<?php

namespace App\Controller\Admin;

use App\Entity\Admin\University;
use App\Form\Admin\UniversityType;
use App\Repository\Admin\UniversityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/university")
 */
class UniversityController extends AbstractController
{
    /**
     * @Route("/", name="admin_university_index", methods={"GET"})
     */
    public function index(UniversityRepository $universityRepository): Response
    {
        return $this->render('admin/university/index.html.twig', [
            'universities' => $universityRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="admin_university_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $university = new University();
        $form = $this->createForm(UniversityType::class, $university);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($university);
            $entityManager->flush();

            return $this->redirectToRoute('admin_university_index');
        }

        return $this->render('admin/university/new.html.twig', [
            'university' => $university,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_university_show", methods={"GET"})
     */
    public function show(University $university): Response
    {
        return $this->render('admin/university/show.html.twig', [
            'university' => $university,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="admin_university_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, University $university): Response
    {
        $form = $this->createForm(UniversityType::class, $university);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_university_index');
        }

        return $this->render('admin/university/edit.html.twig', [
            'university' => $university,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_university_delete", methods={"DELETE"})
     */
    public function delete(Request $request, University $university): Response
    {
        if ($this->isCsrfTokenValid('delete'.$university->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($university);
            $entityManager->flush();
        }

        return $this->redirectToRoute('admin_university_index');
    }
}
