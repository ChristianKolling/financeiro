<?php
namespace Admin\Controller;

use Zend\View\Model\ViewModel;
use Core\Controller\ActionController;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\DbSelect as PaginatorDBSelectAdapter;

/**
 * Controlador que gerencia a página inicial
 * 
 * @category Admin
 * @package Controller
 * @author  Manoel Filho
 */
class IndexController extends ActionController
{
    
    public function indexAction()
    {  
    	return new ViewModel();
    }
   
}