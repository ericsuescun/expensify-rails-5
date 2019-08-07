$(document).ready(function () {
    $("ul.dropdown-menu li").click(function(e) {
        e.preventDefault();
        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        var monthsLong = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        // alert("Clicked. id = " + this.id.substring(0,10));
        var month = new Date(this.id.substring(0,10)).getMonth();
        var year = new Date(this.id.substring(0,10)).getFullYear();
        // console.log(month);
        // $('#dateFilter').remove();
        // $('h4.dropdown pull-right').prepend(
        //     // <button id="dateFilter" type="button" class="dropdown-toggle btn btn-link" data-toggle="dropdown"><%= Date.today.strftime('%B')%> <%= Date.today.year%> <span class="caret"></span></button>
        //     '<button id=\"dateFilter\" type=\"button\" class=\"dropdown-toggle btn btn-link\" data-toggle=\"dropdown\">' + months[month-1] + ' ' + year + '<span class=\"caret\"></span></button>'
        // );
        $('#dateFilter').html(monthsLong[month] + ' ' + year);
        $('tbody#expenses-table-body tr').remove();
        // console.log($(this).find('a').attr('href'));
        // $('tbody#expenses-table-body').append('<%= j render "../../views/expenses/expenses", expense: @expense %>');
        $('tbody#expenses-table-body').append('<tr>' +
                    '<td>' + 10 + '</td>' +
                    '<td>' + 10 + '</td>'  +
                    '<td>' + 10 + '</td>'  +
                    '<td>' + 10 + '</td>'  +
                    '</tr>'
        );
        $.getJSON( "http://localhost:3000/expenses.json", function( expenses ) {
          $.each(expenses, function(i, expense) {
            var dex = new Date(expense.exdate).getMonth();
            var day = new Date(expense.exdate).getDay();
            if(month == dex) {
                console.log(dex);
                console.log(expense.exdate);
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
                                            '<span class=\"concept\">' + expense.concept + '</span>' +
                                          '</div>' +
                                      '</td>'  +
                                      '<td class=\"category text-right\">' + 
                                        '<div class=\"amount\">' + 
                                            expense.category + 
                                        '</div>' +
                                        '<div class="actions">' + 
                                            '<a data-remote=\"true\" href=\"/expenses/' + expense.id + '/edit\">Editar</a>' +
                                            '<a data-confirm=\"Confirmas el borrado?\" data-remote=\"true\" rel=\"nofollow\" data-method=\"delete\" href=\"/expenses/' + expense.id + '\">Delete</a>' +
                                        '</div>' +
                                      '</td>'  +
                                      '<td class=\"text-right\" style=\"width: 170px;\">' + expense.amount + '</td>'  +
                                  '</tr>'
                );
            }
          });
        });
    });

    $('#eric').click(function() {
        $(this).remove();
    });
});

