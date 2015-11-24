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
        $posts = $em->getRepository('BlogBlogBundle:Post')->findBy(array(), array('published' => 'DESC'), 10);
        return $this->render('BlogBlogBundle:Default:index.html.twig', array('posts' => $posts));
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
        $post = $em->getRepository('BlogBlogBundle:Post')->findOneBy(array('id' => $id));
        $comments = $em->getRepository('BlogBlogBundle:Comment')->findBy(array('post' => $post),array('published' => 'DESC'));
        return $this->render('BlogBlogBundle:Default:post.html.twig', array('post' => $post, 'comments' => $comments));
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


    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     * @Route("/cat/{id}", name="post_cat")
     */
    public function catAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $myCat = $em->getRepository('BlogBlogBundle:Cat')->find($id);
        $posts = $em->getRepository('BlogBlogBundle:Post')->findBy(array('cat' => $myCat), array('published' => 'DESC'));
        return $this->render('BlogBlogBundle:Default:index.html.twig', array('posts' => $posts));
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     * @Route("/listCat", name="cat_list")
     */
    public function catListAction()
    {
        $em = $this->getDoctrine()->getManager();
        $cats = $em->getRepository('BlogBlogBundle:Cat')->findAll();
        return $this->render('BlogBlogBundle:Default:cat.html.twig', array('cat' => $cats));
    }
}
