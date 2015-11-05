<?php

namespace Blog\BlogBundle\Controller;

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
        return $this->render('BlogBlogBundle:Default:index.html.twig');
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/admin/edit/{id}", name="blog_admin_edit")
     */
    public function editAction()
    {
        return $this->render('BlogBlogBundle:Default:index.html.twig');
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/admin/del/{id}", name="blog_admin_del")
     */
    public function deleteAction()
    {
        return $this->render('BlogBlogBundle:Default:index.html.twig');
    }
}
