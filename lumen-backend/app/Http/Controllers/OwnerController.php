<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Owner;

class OwnerController extends Controller
{
    /**
     * Get all IPL team owners
     */
    public function getOwners() :JsonResponse|mixed {
        $owners = Owner::all();
        return response()->json($data);    
    }
}