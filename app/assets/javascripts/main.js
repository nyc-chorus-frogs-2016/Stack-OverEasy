$(document).ready(function(){
  $('.question-up-vote > a').on('click',function(event){
    event.preventDefault();
    var options = {
      url: $(event.target).parent().attr('href'),
      data: {:vote=>},
      dataType: 'json',
      method: 'post'
    }
    debugger
    $.ajax(options).done(function(response){
      debugger;
      // $('#post-' + response.post_id + " .vote-tally > p ").text(response.post_up_vote_count )
      console.log(response)
    }).fail(function(response){
      console.log('sad path')
    })
  });

  $('.question-down-vote > a').on('click',function(event){
    event.preventDefault();
    var options = {
      url: $(event.target).attr('action'),
      data: $(event.target).serialize(),
      dataType: 'json',
      method: 'post'
    }
    $.ajax(options).done(function(response){
      console.log(response);
    }).fail(function(response){
      console.log(response);
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
