<?php

namespace Blog\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class BlogController extends Controller
{
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/", name="blog_index")
     */
    public function indexAction()
    {
        return $this->render('BlogBlogBundle:Default:index.html.twig');
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/post/{id}", name="blog_post")
     */
    public function postAction($id)
    {
        return $this->render('BlogBlogBundle:Default:index.html.twig', array('name' => $id));
    }
}
