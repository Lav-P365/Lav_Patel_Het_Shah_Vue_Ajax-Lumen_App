<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Owner;

class OwnerController extends Controller
{

    public function getOwners()
    {
        $owners = Owner::all();
        return response()->json($owners);
    }
}
