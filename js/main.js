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
