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

        $em = $this->getDoctrine()->getManager();
        $cats = $em->getRepository('BlogBlogBundle:Cat')->findAll();
        $posts = $em->getRepository('BlogBlogBundle:Post')->findBy(array(), array('published' => 'DESC'), 10);
        return $this->render('BlogBlogBundle:Default:index.html.twig', array('posts' => $posts, 'cat' => $cats));
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/post/{id}", name="blog_post")
     */
    public function postAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $cats = $em->getRepository('BlogBlogBundle:Cat')->findAll();
        $post = $em->getRepository('BlogBlogBundle:Post')->findOneBy(array('id' => $id));
        return $this->render('BlogBlogBundle:Default:post.html.twig', array('post' => $post, 'cat' => $cats));
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @Route("/about", name="blog_about")
     */
    public function aboutAction()
    {
        $em = $this->getDoctrine()->getManager();
        $cats = $em->getRepository('BlogBlogBundle:Cat')->findAll();
        return $this->render('BlogBlogBundle:Default:about.html.twig', array('cat' => $cats));
    }
}
