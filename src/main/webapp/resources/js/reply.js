console.log("Reply Module Loaded..........");

$(function() {
    var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
    var csrfTokenValue = $("meta[name='_csrf']").attr("content");

    $(document).ajaxSend(function(e, xhr,options){
        if(csrfHeaderName&& csrfTokenValue){
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        }
    });
});

var replyService = (function() {

    function add(reply, callback, error) {
        console.log("add reply...............");

        $.ajax({
            type : 'post',
            url : '/myFirstProject/replies/new',
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) { callback(result); }
            },
            error : function(xhr, status, er) {
                if (error) { error(er); }
            }
        });
    }

    function getList(param, callback, error) {
        var bno = param.bno;
        var page = param.page || 1; 
        
        $.getJSON("/myFirstProject/replies/pages/" + bno + "/" + page, function(data) {
                if (callback) {
                    callback(data);
                }
            }).fail(function(xhr, status, err) {
                if (error) { error(); }
            });
    }

    function remove(rno, callback, error) {
        console.log("remove reply............... " + rno);

        $.ajax({
            type : 'delete', 
            url : '/myFirstProject/replies/' + rno,
            success : function(deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }
    
    function update(reply, callback, error) {
    $.ajax({
        type : 'put',
        url : '/myFirstProject/replies/' + reply.rno,
        data : JSON.stringify(reply),
        contentType : "application/json; charset=utf-8",
        success : function(result, status, xhr) {
            if (callback) { callback(result); }
        },
        error : function(xhr, status, er) {
            if (error) { error(er); }
        }
    });
}

    function updateLike(data, callback, error) {
    $.ajax({
        type: 'post',
        url: '/myFirstProject/replies/like', 
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}
    return {
        add : add,
        getList : getList,
        remove : remove,
        update : update,
        updateLike: updateLike
    };

})();
