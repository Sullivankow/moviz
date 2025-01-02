<?php


//Il est préférable de ne pas utiliser la propriété public
class Bateau extends Vehicule
{

    protected int $nombre_cabines;



    /**
     * Get the value of nombre_cabines
     */
    public function getNombreCabines(): int
    {
        return $this->nombre_cabines;
    }

    /**
     * Set the value of nombre_cabines
     */
    public function setNombreCabines(int $nombre_cabines): self
    {
        $this->nombre_cabines = $nombre_cabines;

        return $this;
    }
}
