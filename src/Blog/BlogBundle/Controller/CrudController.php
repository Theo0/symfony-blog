<?php

namespace Blog\BlogBundle\Controller;

use Blog\BlogBundle\Entity\Cat;
use Blog\BlogBundle\Entity\Post;
use Blog\BlogBundle\Form\CatType;
use Blog\BlogBundle\Form\PostType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class CrudController extends Controller
{

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/admin/add", name="blog_admin_add")
     */
    public function newAction()
    {
        $em = $this->getDoctrine()->getManager();
        $request = $this->get('request');
        $post = new Post();
        $form = $this->createForm(new PostType(), $post);

        if ($request->getMethod() == 'POST') {
            $form->handleRequest($request);

            // $form->request->get('titre') == $post->getTitre()

            if($form->isValid()) {
                $post->setPublished(new \DateTime());
                $post->setSlug(str_replace(' ', '-', strtolower($post->getTitre())));
                $post->setAuthor($this->getUser());
                $em->persist($post);
                $em->flush();
                return $this->redirect($this->generateUrl('blog_index'));
            }
        }
        return $this->render('BlogBlogBundle:Admin:new.html.twig', array('form' => $form->createView()));


    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Exception
     * @Route("/admin/edit/{id}", name="blog_admin_edit")
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $request = $this->get('request');
        $post = $em->getRepository('BlogBlogBundle:Post')->find($id);

        if (!$post)
            throw new \Exception();

        $form = $this->createForm(new PostType(), $post);

        if ($request->getMethod() == 'POST') {
            $form->handleRequest($request);

            // $form->request->get('titre') == $post->getTitre()

            if($form->isValid()) {
                $post->setSlug(str_replace(' ', '-', strtolower($post->getTitre())));
                $em->flush();
                return $this->redirect($this->generateUrl('blog_index'));
            }
        }
        return $this->render('BlogBlogBundle:Admin:edit.html.twig', array('form' => $form->createView(), 'id' => $id));

    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Exception
     * @Route("/admin/del/{id}", name="blog_admin_del")
     */
    public function deleteAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $post = $em->getRepository('BlogBlogBundle:Post')->find($id);

        if (!$post)
            throw new \Exception();

        $em->remove($post);
        $em->flush();

        return $this->redirect($this->generateUrl('blog_index'));
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Exception
     * @Route("/admin/newCat/", name="blog_admin_new_cat")
     */
    public function newCatAction()
    {
        $em = $this->getDoctrine()->getManager();
        $request = $this->get('request');
        $cat = new Cat();
        $form = $this->createForm(new CatType(), $cat);

        if ($request->getMethod() == 'POST') {
            $form->handleRequest($request);

            if($form->isValid()) {
                $em->persist($cat);
                $em->flush();
                return $this->redirect($this->generateUrl('blog_index'));
            }
        }
        return $this->render('BlogBlogBundle:Admin:newCat.html.twig', array('form' => $form->createView()));
    }
}
