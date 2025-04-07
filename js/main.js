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

      fetch(`http://localhost/lumen-backend/public/teams/${id}`)
        .then(res => res.json())
        .then(data => {
          if (data.length > 0) {
            const team = data[0];
            this.owner = team.owner || "Not available";
            this.founded = team.founded || "Not available";
            this.stadium = team.stadium || "Not available";
            this.image = team.image || "placeholder.jpg";
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
