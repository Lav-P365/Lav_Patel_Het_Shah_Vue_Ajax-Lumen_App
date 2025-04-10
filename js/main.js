new Vue({
  el: '#app',
  data: {
    teams: [],
    owner: null,
    loadingList: true,
    loadingOwner: false,
    errorList: null,
    errorOwner: null,
  },
  created() {
    this.fetchTeams();
  },
  methods: {
    fetchTeams() {
      axios.get('http://localhost:8000/api/teams')
        .then(response => {
          this.teams = response.data;
        })
        .catch(error => {
          this.errorList = "Failed to load teams.";
        })
        .finally(() => {
          this.loadingList = false;
        });
    },
    fetchOwner(ownerId) {
      this.loadingOwner = true;
      this.errorOwner = null;
      this.owner = null;

      axios.get(`http://localhost:8000/api/owner/${ownerId}`)
        .then(response => {
          this.owner = response.data;
      // Fetch team details based on the team ID
      fetch(`http://localhost/lumen-backend/public/teams/${id}`)
        .then(res => res.json())
        .then(data => {
          if (data.length > 0) {
            const team = data[0];
            this.founded = team.founded_year || "Not available";
            this.image = team.team_image || "placeholder.jpg";

            // Fetch the owner details
            fetch(`http://localhost/lumen-backend/public/owners/${team.owner_id}`)
              .then(res => res.json())
              .then(ownerData => {
                if (ownerData.length > 0) {
                  const owner = ownerData[0];
                  this.owner = owner.owner_name || "Not available";
                  this.ownerBio = owner.bio || "Not available";
                } else {
                  this.error = "Owner details not found.";
                }
              })
              .catch(error => {
                this.error = "Failed to load owner details.";
              });
          } else {
            this.error = "No details found.";
          }
          this.loadingDetails = false;
          document.querySelector("#teamInfoCon").scrollIntoView({ behavior: "smooth", block: "end" });
        })
        .catch(error => {
          this.errorOwner = "Failed to load owner information.";
        })
        .finally(() => {
          this.loadingOwner = false;
        });
    }
  }
});
