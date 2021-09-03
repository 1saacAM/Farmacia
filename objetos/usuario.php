<?php 
class Usuario {
    private $id;
    private $name;
    private $password;
    private $type;

    public __construc(int $id,String $name, String $password,int $type) {
        $this->id =  $id;
        $this->name = $name;
        $this->password =  $password;
        $this->type =  $type;
    }

    public __construc() {

    }

    public setId(int $id) {
        $this->id =  $id;
    }

    public getId() {
        return $id;
    }

    public setName(String $name) {
        $this->name = $name;
    }

    public getName() {
        return $name;
    }

    public setPassword(String $password) {
        $this->password = $password;
    }

    public getPassword() {
        return $password;
    }

    public setType(int $type) {
        $this->type = $type;
    } 

    public getType() {
        return $type;
    }

    public getUser() {
        $user = new SplFixedArray(4); 
        $user[0] = getId();
        $user[1] = getName();
    }

}
?>