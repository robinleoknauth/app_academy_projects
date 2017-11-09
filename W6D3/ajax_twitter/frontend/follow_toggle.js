const APIUtil = require('./API_util.js');

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.toggle = this.toggle.bind(this);
    this.handleClick();
  }

  render() {
    if (!this.followState) {
      this.$el.text('Follow!');
      this.$el.prop("disabled", false);
    } else if (this.followState === true) {
      this.$el.text('Unfollow!');
      this.$el.prop("disabled", false);
    } else if (this.followState === 'following') {
      this.$el.text('following...');
      this.$el.prop("disabled", true);
    } else if (this.followState === 'unfollowing') {
      this.$el.text('unfollowing...');
      this.$el.prop("disabled", true);
    }
  }

  handleClick() {
    this.$el.on("click", event => {
      event.preventDefault();
      if (!this.followState) {
        this.toggle();
        APIUtil.followUser(this.userId).then(this.toggle);
      } else {
        this.toggle();
        APIUtil.unfollowUser(this.userId).then(this.toggle);
      }
    });
  }

  toggle() {
    if (!this.followState) {
      this.followState = 'following';
    } else if (this.followState === true) {
      this.followState = 'unfollowing';
    } else if (this.followState === 'following') {
      this.followState = true;
    } else if (this.followState === 'unfollowing') {
      this.followState = false;
    }
    console.log(this.followState);
    this.render();
  }
}

module.exports = FollowToggle;
