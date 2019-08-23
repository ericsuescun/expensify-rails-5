function refresh() {
  $("ul.dropdown-menu li").click(function(e) {
      e.preventDefault();
      var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      var monthsLong = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      // alert("Clicked. id = " + this.id.substring(0,10));
      var month = new Date(this.id.substring(0,10)).getMonth();
      var year = new Date(this.id.substring(0,10)).getFullYear();
      $('#dateFilter').html(monthsLong[month] + ' ' + year);
      $('tbody#expenses-table-body tr').remove();
      $.getJSON( "http://localhost:3000/expenses.json", function( expenses ) {
        $.each(expenses, function(i, expense) {
          var dex = new Date(expense.exdate).getMonth();
          var day = new Date(expense.exdate).getDate();
          if(month == dex) {
              console.log(expense.exdate);
              console.log(dex);
              console.log(day);
              
              $('tbody#expenses-table-body').append(
                                '<tr id=\"' + expense.id + '\">' + 
                                    '<td class=\"date\">' + 
                                      '<div class=\"day\">' + day + 
                                      '</div>' +
                                      '<div class=\"month\">' + months[dex] +
                                      '</div>' +
                                    '</td>' +
                                    '<td>' +
                                        '<div>' +
                                          '<span class=\"type\">' + expense.extype + '</span>' +
                                        '</div>' +
                                        '<div>' +
                                          '<span class=\"concept\">' + expense.concept + ' el ' + expense.exdate + '</span>' +
                                        '</div>' +
                                    '</td>'  +
                                    '<td class=\"category text-right\">' + 
                                          expense.category + 
                                    '</td>'  +
                                    '<td class=\"text-right\" style=\"width: 170px;\">' + 
                                      '<div class=\"amount\">' + 
                                          expense.amount.toLocaleString("en-US", {style: "currency", currency: "USD", minimumFractionDigits: 0}) + 
                                      '</div>' +
                                      '<div class="actions">' + 
                                          '<a data-remote=\"true\" href=\"/expenses/' + expense.id + '/edit\"><span class="glyphicon glyphicon-edit"></span> Editar</a>' +
                                          '<a data-confirm=\"Confirmas el borrado?\" data-remote=\"true\" rel=\"nofollow\" data-method=\"delete\" href=\"/expenses/' + expense.id + '\"><span class="glyphicon glyphicon-trash"></span> Delete</a>' +
                                      '</div>' +
                                    '</td>'  +
                                '</tr>'
              );
          }
        });
      });
  });

  $('#eric').click(function() {
      $(this).remove();
  });
}

function refresh() {
  $("ul.dropdown-menu li").click(function(e) {
      e.preventDefault();
      var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      var monthsLong = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      // alert("Clicked. id = " + this.id.substring(0,10));
      var month = new Date(this.id.substring(0,10)).getMonth();
      var year = new Date(this.id.substring(0,10)).getFullYear();
      $('#dateFilter').html(monthsLong[month] + ' ' + year);
      $('tbody#expenses-table-body tr').remove();
      $.getJSON( "http://localhost:3000/expenses.json", function( expenses ) {
        $.each(expenses, function(i, expense) {
          var dex = new Date(expense.exdate).getMonth();
          var day = new Date(expense.exdate).getDate();
          if(month == dex) {
              console.log(expense.exdate);
              console.log(dex);
              console.log(day);
              
              $('tbody#expenses-table-body').append(
                                '<tr id=\"' + expense.id + '\">' + 
                                    '<td class=\"date\">' + 
                                      '<div class=\"day\">' + day + 
                                      '</div>' +
                                      '<div class=\"month\">' + months[dex] +
                                      '</div>' +
                                    '</td>' +
                                    '<td>' +
                                        '<div>' +
                                          '<span class=\"type\">' + expense.extype + '</span>' +
                                        '</div>' +
                                        '<div>' +
                                          '<span class=\"concept\">' + expense.concept + ' el ' + expense.exdate + '</span>' +
                                        '</div>' +
                                    '</td>'  +
                                    '<td class=\"category text-right\">' + 
                                          expense.category + 
                                    '</td>'  +
                                    '<td class=\"text-right\" style=\"width: 170px;\">' + 
                                      '<div class=\"amount\">' + 
                                          expense.amount.toLocaleString("en-US", {style: "currency", currency: "USD", minimumFractionDigits: 0}) + 
                                      '</div>' +
                                      '<div class="actions">' + 
                                          '<a data-remote=\"true\" href=\"/expenses/' + expense.id + '/edit\"><span class="glyphicon glyphicon-edit"></span> Editar</a>' +
                                          '<a data-confirm=\"Confirmas el borrado?\" data-remote=\"true\" rel=\"nofollow\" data-method=\"delete\" href=\"/expenses/' + expense.id + '\"><span class="glyphicon glyphicon-trash"></span> Delete</a>' +
                                      '</div>' +
                                    '</td>'  +
                                '</tr>'
              );
          }
        });
      });
  });

  $('#eric').click(function() {
      $(this).remove();
  });
}


// window.location.href = window.location.pathname + '?month=' + parseInt('<%= j params[:month] %>') + '&year=' + '<%= j params[:year] %>'
// var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

// $('#dateFilter').html(monthsLong['<%= j params[:month] %>'] + ' ' + '<%= j params[:year] %>');
// $('ul.dropdown-menu li').click(function(e) {
//       e.preventDefault();
//       alert("Clicked. id = " + this.id.substring(0,10));
//       console.log( "Clicked. id = " + this.id.substring(0,10) );
//       var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
//       var monthsLong = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
//       var month = new Date(this.id.substring(0,10)).getMonth();
//       var year = new Date(this.id.substring(0,10)).getFullYear();
//       $('#dateFilter').html(monthsLong[month] + ' ' + year);
// });








    // var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    // var monthsLong = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    // // alert("Clicked. id = " + this.id.substring(0,10));
    // var month = new Date(this.id.substring(0,10)).getMonth();
    // var year = new Date(this.id.substring(0,10)).getFullYear();
    // $('#dateFilter').html(monthsLong[month] + ' ' + year);
    // $('tbody#expenses-table-body tr').remove();
    // $.getJSON( "http://localhost:3000/expenses.json", function( expenses ) {
    //   $.each(expenses, function(i, expense) {
    //     var dex = new Date(expense.exdate).getMonth();
    //     var day = new Date(expense.exdate).getDate();
    //     if(month == dex) {
    //         console.log(expense.exdate);
    //         console.log(dex);
    //         console.log(day);
            
    //         $('tbody#expenses-table-body').append(
    //                           '<tr id=\"' + expense.id + '\">' + 
    //                               '<td class=\"date\">' + 
    //                                 '<div class=\"day\">' + day + 
    //                                 '</div>' +
    //                                 '<div class=\"month\">' + months[dex] +
    //                                 '</div>' +
    //                               '</td>' +
    //                               '<td>' +
    //                                   '<div>' +
    //                                     '<span class=\"type\">' + expense.extype + '</span>' +
    //                                   '</div>' +
    //                                   '<div>' +
    //                                     '<span class=\"concept\">' + expense.concept + ' el ' + expense.exdate + '</span>' +
    //                                   '</div>' +
    //                               '</td>'  +
    //                               '<td class=\"category text-right\">' + 
    //                                     expense.category + 
    //                               '</td>'  +
    //                               '<td class=\"text-right\" style=\"width: 170px;\">' + 
    //                                 '<div class=\"amount\">' + 
    //                                     expense.amount.toLocaleString("en-US", {style: "currency", currency: "USD", minimumFractionDigits: 0}) + 
    //                                 '</div>' +
    //                                 '<div class="actions">' + 
    //                                     '<a data-remote=\"true\" href=\"/expenses/' + expense.id + '/edit\"><span class="glyphicon glyphicon-edit"></span> Editar</a>' +
    //                                     '<a data-confirm=\"Confirmas el borrado?\" data-remote=\"true\" rel=\"nofollow\" data-method=\"delete\" href=\"/expenses/' + expense.id + '\"><span class="glyphicon glyphicon-trash"></span> Delete</a>' +
    //                                 '</div>' +
    //                               '</td>'  +
    //                           '</tr>'
    //         );
    //     }
    //   });
    // });



    