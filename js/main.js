const app = Vue.createApp({
  created() {
    // Fetch all IPL teams
    fetch('http://localhost/lumen-backend/public/teams')
      .then(res => res.json())
      .then(data => {
        this.teamsData = data;
        this.loadingTeams = false;
      })
      .catch(error => {
        this.error = "Unable to fetch teams.";
        this.loadingTeams = false;
      });
  },
  data() {
    return {
      teamsData: [],
      owner: "",
      founded: "",
      stadium: "",
      image: "",
      error: "",
      loadingTeams: true,
      loadingDetails: false,
    };
  },
  methods: {
    getTeamDetails(id) {
      this.loadingDetails = true;
      this.error = "";

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
          this.error = "Failed to load team details.";
          this.loadingDetails = false;
        });
    }
  }
}).mount('#app');
