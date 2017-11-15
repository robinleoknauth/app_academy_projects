export const fetchTodos = () => (
  $.ajax({
  method: 'GET',
  url: '/api/todos'
  })
);

export const createTodos = (todo) => (
  $.ajax({
  method: 'POST',
  url: '/api/todos',
  data: { todo }
  })
);


// let a = { 'title': "ehee", 'body': "dsfughsdifugh"};
