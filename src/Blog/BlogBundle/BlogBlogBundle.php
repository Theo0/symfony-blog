<?php

namespace Blog\BlogBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class BlogBlogBundle extends Bundle
{
    public function getParent()
    {
        return 'FOSUserBundle';
    }
}
