const app = Vue.createApp({
    created() {
        // Ideal to get your remote data during the created phase
        fetch('http://localhost/lumen-backend/public/teams')
            .then(res => res.json())
            .then(data => {
              this.booksData = data
              this.loadingBooks = false
            })
            .catch(error => console.error(error));
    },
    data() {
        return {
            teams: [],
            name: "",
            published_date: "",
            bio: "",
            image: "",
            error: "",
            loading: false,
            loadingTTeams: true,
        }
    },

    methods: {
      getTeams(id) {
        console.log(id)
        this.loading = true;
        this.error = false;
        const teamInfoCon = document.querySelector("#teamInfoCon");

        fetch(`http://localhost:8888/bookstore-api/public/books/${id}`)
            .then(res => res.json())
            .then(data => {
              if (data.length > 0) {
              console.log(data[0]);  
              const bookData = data[0];
              this.loading = false; 
              const bookInfoCon = document.querySelector("#bookInfoCon");          
              // This is using the ternary operator (condition ? value_if_true : value_if_false), which is a shorthand for an if-else statement.
              this.name = bookData.name ? bookData.name : 'Not available';
              this.published_date = bookData.published_date ? bookData.published_date : 'Not available';
              this.bio = bookData.bio ? bookData.bio : 'Not available';
              this.image = bookData.book_image ? bookData.book_image : 'Not available';
              } else {
                this.loading = false;
                this.error = 'No book found with the given query';
              }
          }).then(() => {
            bookInfoCon.scrollIntoView({ behavior: 'smooth', block: 'end' });
        })
          .catch(error => console.error(error));
      }
    }
}).mount('#app');