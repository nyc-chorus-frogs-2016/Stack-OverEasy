$(document).ready(function(){
// QUESTION upvote/downvote AJAX begins:
  $('.question-up-vote > a').on('click',function(event){
    event.preventDefault();

    var vote_info = {value: 1}
    var options = {
      url: $(event.target).parent().attr('href'),
      method: 'post',
      data: vote_info,
      dataType: 'json'
    }

    $.ajax(options).done(function(response){
      // debugger
      $('#question-' + response.votable_id + "> .question-vote-count ").text(response.votable_vote_count )
      console.log(response)
    }).fail(function(response){
      console.log('sad path')
    })
  });


  $('.question-down-vote > a').on('click',function(event){
    event.preventDefault();

    var vote_info = {value: -1}
    var options = {
      url: $(event.target).parent().attr('href'),
      method: 'post',
      data: vote_info,
      dataType: 'json'
    }

    $.ajax(options).done(function(response){
      // debugger
      $('#question-' + response.votable_id + ' > .question-vote-count').text(response.votable_vote_count )
      console.log(response)
    }).fail(function(response){
      console.log('sad path')
    })
  });
// ANSWER upvote/downvote AJAX begins:
  $('.answer-data').on('click', '.answer-up-vote > a',function(event){
    event.preventDefault();

    var vote_info = {value: 1}
    var options = {
      url: $(event.target).parent().attr('href'),
      method: 'post',
      data: vote_info,
      dataType: 'json'
    }

    $.ajax(options).done(function(response){
      $('#answer-' + response.votable_id + " > .answer-vote-count").text(response.votable_vote_count )
      console.log(response)
    }).fail(function(response){
      console.log('sad path')
    })
  });


  $('.answer-data').on('click', '.answer-down-vote > a',function(event){
    event.preventDefault();

    var vote_info = {value: -1}
    var options = {
      url: $(event.target).parent().attr('href'),
      method: 'post',
      data: vote_info,
      dataType: 'json'
    }

    $.ajax(options).done(function(response){
      $('#answer-' + response.votable_id + "> .answer-vote-count").text(response.votable_vote_count )
      console.log(response)
    }).fail(function(response){
      console.log('sad path')
    })
  });
  // $('.COMMENT').on('click',function(event){
  //   event.preventDefault();
  //   var options = {
  //     url: $(event.target).attr('action')
  //   }
  //   $.ajax(options).done(function(response){
  //     console.log(response)
  //   }).fail(function(response){
  //     console.log(response)
  //   })
  // });

  //   $('.BESTANSWER').on('click',function(event){
  //   event.preventDefault();
  //   var options = {
  //     url: $(event.target).attr('action')
  //   }
  //   $.ajax(options).done(function(response){
  //     console.log(response)
  //   }).fail(function(response){
  //     console.log(response)
  //   })
  // });

})
