<?php
require "Vehicule.php";

class Voiture extends Vehicule

//Il est préférable de ne pas utiliser la propriété public

{

    protected int $nombre_roues;


    /**
     * Get the value of nombre_roues
     */
    public function getNombreRoues(): int
    {
        return $this->nombre_roues;
    }

    /**
     * Set the value of nombre_roues
     */
    public function setNombreRoues(int $nombre_roues): self
    {
        $this->nombre_roues = $nombre_roues;

        return $this;
    }
}
