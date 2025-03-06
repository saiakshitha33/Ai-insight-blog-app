document.addEventListener("turbolinks:load", function() {
    const searchForm = document.querySelector('.search-bar form');
  
    searchForm.addEventListener('submit', function(e) {
      e.preventDefault();
      const url = this.action;
      const formData = new FormData(this);
  
      fetch(url, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'Content-Type': 'application/json'
        },
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        updateArticles(data);
      })
      .catch(error => console.error('Error fetching articles:', error));
    });
  
    function updateArticles(articles) {
      const container = document.getElementById('article-feed');
      container.innerHTML = ''; // Clear existing articles
      articles.forEach(article => {
        const div = document.createElement('div');
        div.className = 'article';
        div.innerHTML = `<h4>${article.title}</h4><p>${article.content}</p>`;
        container.appendChild(div);
      });
    }
  });
  