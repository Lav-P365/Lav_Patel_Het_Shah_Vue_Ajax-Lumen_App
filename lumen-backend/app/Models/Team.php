<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['team_name', 'owner_id', 'home_city', 'founded_year', 'team_logo'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * Define the relationship between Team and Owner.
     */
    public function owner()
    {
        return $this->belongsTo(Owner::class, 'owner_id');
    }
}
