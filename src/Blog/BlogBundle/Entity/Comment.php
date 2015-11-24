<?php

namespace Blog\BlogBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Post
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="Blog\BlogBundle\Entity\CommentRepository")
 */
class Comment {
  /**
   * @var integer
   *
   * @ORM\Column(name="id", type="integer")
   * @ORM\Id
   * @ORM\GeneratedValue(strategy="AUTO")
   */
  private $id;

  /**
   * @var string
   *
   * @ORM\Column(name="content", type="text")
   *
   * @Assert\NotBlank(message="Veuillez entrer un texte.")
   */
  private $content;

  /**
   * @var \DateTime
   *
   * @ORM\Column(name="published", type="datetime")
   */
  private $published;

  /**
   * @var User
   *
   * @ORM\ManyToOne(targetEntity="User")
   */
  private $author;

  /**
   * @var Post
   *
   * @ORM\ManyToOne(targetEntity="Post")
   */
  private $post;





    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set content
     *
     * @param string $content
     *
     * @return Comment
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set published
     *
     * @param \DateTime $published
     *
     * @return Comment
     */
    public function setPublished($published)
    {
        $this->published = $published;

        return $this;
    }

    /**
     * Get published
     *
     * @return \DateTime
     */
    public function getPublished()
    {
        return $this->published;
    }

    /**
     * Set author
     *
     * @param \Blog\BlogBundle\Entity\User $author
     *
     * @return Comment
     */
    public function setAuthor(\Blog\BlogBundle\Entity\User $author = null)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author
     *
     * @return \Blog\BlogBundle\Entity\User
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set post
     *
     * @param \Blog\BlogBundle\Entity\Post $post
     *
     * @return Comment
     */
    public function setPost(\Blog\BlogBundle\Entity\Post $post = null)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \Blog\BlogBundle\Entity\Post
     */
    public function getPost()
    {
        return $this->post;
    }
}
