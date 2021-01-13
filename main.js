let current_page = 1;
let limit = 5;
let count_data = 0;
const page_numbers = document.getElementById('pagination');

function load_data(page, limit, query){
    current_page = page;
    if(query && query.length > 0){
        data = {
            page: page,
            limit: limit,
            query: query
        }
    }
    else{
        data = {
            page: page,
            limit: limit
        }
    }

    $.ajax({
        url: "ajax_loaddata.php",
        method: "POST",
        data: data,
        datatype: "json",
        cache: false,
        async: false,
        success: function(data, n){
            $('#list').html("");
            $('#list').html(data);
        }
    });
}

$("#search-btn").click(function(){
    search_query = $('#search-bar').val();
    if(search_query > 0) load_data(1, limit, search_query);
});

$("#search-bar").keyup(function(){
    char_lim = 3;
    search_query = $('#search-bar').val();
    if (search_query.length < char_lim) 
    {
        load_data(current_page, limit);
        return;
    }
    load_data(1, limit, search_query);
});

$(document).ready(function (){
    load_data(current_page, limit);
});