const APIUtil = require('./API_util.js');

class UserSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.children("input");
    this.$ul = this.$el.children("ul");
    this.handleInput();
    this.renderResults = this.renderResults.bind(this);
  }

  handleInput() {
    this.$el.on("input", event => {
      event.preventDefault();
      APIUtil.searchUsers(this.$input.val(), this.renderResults);
    });
  }

  renderResults(users) {
    this.$ul.children().remove();
    users.forEach(function(el) {
      let $userLi = $(`<li></li>`);
      $userLi.text(`${el.username}`);
      this.$ul.append($userLi);
    }.bind(this));
  }

}

module.exports = UserSearch;
