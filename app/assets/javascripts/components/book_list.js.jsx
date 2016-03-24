var BookList = React.createClass({

  getInitialState(){
    return {
      books: []
    }
  },

  componentDidMount(){
    var component = this;
    component.fetchBooks();
  },

  fetchBooks(){
    var component = this;
    fetch("/api/books.json")
    .then(function(r){
      return r.json();
    })
    .then (function(json) {
      component.setState({
        books: json.books
      })
    })
  },

  clickIt(event){
    event.preventDefault();
    this.fetchBooks()
    console.log("I'm refreshing the books")
  },

  render: function(){
    var refreshButtonStyle = {
      paddingLeft: 20 + 'px'
    };

    return <div>
      <div style={refreshButtonStyle}>
        <button onClick={this.clickIt} className="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
          <i className="material-icons">refresh</i>
        </button>
      </div>
      <div className="item-list">
        <div className="mdl-grid">

          {this.state.books.map(function(book){

            var mdlCellStyle = {
              minWidth: 100 + '%'
            };

            var demoCardSquareStyle = {
              maxWidth: 100 + '%',
              justifyContent: 'center'
            };

            var mdlCardTileStyle = {
              background: "url('" + book.photo_url + "')",
              backgroundPosition: 'top',
              backgroundSize: '100%',
              backgroundRepeat: 'no-repeat',
              minWidth: 100 + '%'
            };

            var mdlCardStyle = {
              textDecoration: 'none',
              color: '#212121'
            };

            var smallStyle = {
              paddingLeft: '10px'
            };

            return <div key={book.id}>
              <div className="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet" style={mdlCellStyle}>
                <div className="demo-card-square mdl-card mdl-shadow--2dp" style={demoCardSquareStyle}>
                  <div className="mdl-card__title mdl-card--expand" style={mdlCardTileStyle}>
                    <div className="go-to-button">
                      <a href={book.book_url} className="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
                        <i className="material-icons">call_made</i>
                      </a>
                    </div>
                  </div>
                  <div className="mdl-card__supporting-text">
                    <a href="{book.book_url}" style={mdlCardStyle}>{book.title}</a>
                  </div>
                  <div className="mdl-card__actions mdl-card--border">
                    <small style={smallStyle}>
                      {'$' + book.price.toFixed(2)}
                    </small>
                    <a href={book.book_url} className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">{book.author.full_name}</a>
                  </div>
                </div>
              </div>
            </div>
          })}

        </div>
      </div>
    </div>
  }


});
