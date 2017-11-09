const APIUtil = {
  followUser: id => {
    return $.ajax( {
      type: 'post',
      url: `/users/${id}/follow`,
      dataType: 'json',
    });
  },

  unfollowUser: id => {
    return $.ajax( {
      type: 'delete',
      url: `/users/${id}/follow`,
      dataType: 'json',
    });
  },

  searchUsers: (queryVal, successCB) => {
    return $.ajax( {
      type: 'get',
      url: '/users/search',
      data: {
        query: `${queryVal}`
      },
      dataType: 'json',
      success: (data) => {
        successCB(data);
      }
    });
  }
};

module.exports = APIUtil;
