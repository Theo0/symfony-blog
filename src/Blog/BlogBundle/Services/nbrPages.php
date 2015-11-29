<?php
/**
 * @author Brice VICO
 * @date 28/11/2015
 * @version 1.0.0
 */

namespace Blog\BlogBundle\Services;


class nbrPages
{
    public function count($total, $affichage)
    {
        return ceil($total / $affichage);
    }
}