<?php
class Mnb_Controller
{
    public $baseName = 'mnb';
    public function main(array $vars)
    {
        $MnbModel = new Mnb_Model;
        $retData = $MnbModel->mnb_currency($vars);
        $this->baseName = "mnb";
        $view = new View_Loader($this->baseName.'_main');
        foreach($retData as $name => $value)
            $view->assign($name, $value);

    }
}
?>