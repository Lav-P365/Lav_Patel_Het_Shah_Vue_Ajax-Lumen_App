<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;

class TeamController extends Controller
{
    // Get all IPL teams
    public function getAll()
    {
        $teams = Team::join('owners', 'teams.owner_id', '=', 'owners.id')
            ->select('teams.id', 'team_name', 'home_city', 'founded_date', 'team_image', 'owners.owner_name')
            ->orderBy('team_name', 'asc')
            ->get();

        return response()->json($teams);
    }

    // Get one IPL team by ID
    public function getOne($id)
    {
        $team = Team::join('owners', 'teams.owner_id', '=', 'owners.id')
            ->select(
                'teams.id',
                'team_name',
                'home_city',
                'founded_date',
                'team_image',
                'owners.owner_name',
                'owners.owner_bio'
            )
            ->where('teams.id', $id)
            ->first(); // returns a single object instead of an array

        if (!$team) {
            return response()->json(['error' => 'Team not found'], 404);
        }

        return response()->json($team);
    }

    // Add a new team
    public function save(Request $request)
    {
        $this->validate($request, [
            'team_name' => 'required|string',
            'owner_id' => 'required|integer',
            'home_city' => 'required|string',
            'founded_date' => 'required|integer',
            'team_image' => 'required|string'
        ]);

        $team = Team::create($request->all());
        return response()->json($team, 201);
    }

    // Update an existing team
    public function update(Request $request, $id)
    {
        $team = Team::find($id);

        if (!$team) {
            return response()->json(['error' => 'Team not found'], 404);
        }

        $this->validate($request, [
            'team_name' => 'required|string',
            'owner_id' => 'required|integer',
            'home_city' => 'required|string',
            'founded_date' => 'required|integer',
            'team_image' => 'required|string'
        ]);

        $team->update($request->all());
        return response()->json($team);
    }

    // Delete a team
    public function delete($id)
    {
        $team = Team::find($id);

        if (!$team) {
            return response()->json(['error' => 'Team not found'], 404);
        }

        $team->delete();
        return response()->json(null, 204);
    }
}
