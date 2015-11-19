<?php

namespace Blog\BlogBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Cat
 *
 * @ORM\Table()
 * @ORM\Entity
 */
class Cat
{
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
     * @ORM\Column(name="nom", type="string", length=255)
     *
     * @Assert\NotBlank(message="Veuillez entrer une valeur pour le nom de la catégorie.")
     * @Assert\Length(
     *     min = 3,
     *     max = 150,
     *     minMessage = "Veuillez écrire un titre plus long",
     *     maxMessage = "Veuillez écrire un texte plus court"
     * )
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="descr", type="text")
     *
     * @Assert\NotBlank(message="Veuillez entrer une description de la catégorie.")
     */
    private $descr;


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
     * Set nom
     *
     * @param string $nom
     *
     * @return Cat
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set descr
     *
     * @param string $descr
     *
     * @return Cat
     */
    public function setDescr($descr)
    {
        $this->descr = $descr;

        return $this;
    }

    /**
     * Get descr
     *
     * @return string
     */
    public function getDescr()
    {
        return $this->descr;
    }
}

