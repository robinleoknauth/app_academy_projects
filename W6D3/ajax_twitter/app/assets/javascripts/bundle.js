/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UserSearch = __webpack_require__(3);

$( () => {
  $('button.follow-toggle').each((idx, el) => {
    new FollowToggle(el);
  });

  new UserSearch($('nav.users-search'));
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map