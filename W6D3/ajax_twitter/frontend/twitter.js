const FollowToggle = require('./follow_toggle.js');
const UserSearch = require('./users_search.js');

$( () => {
  $('button.follow-toggle').each((idx, el) => {
    new FollowToggle(el);
  });

  new UserSearch($('nav.users-search'));
});
