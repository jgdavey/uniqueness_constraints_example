$(function() {
  $(".list form").on("ajax:success", function(e, data) {
    var $form = $(this), $li;
    // Build a new li element, insert it at the end
    $li = $("<li/>", { "data-id": data.id, text: data.name });
    $form.closest(".list").find("ul").append($li);

    // Clear the form
    $form.find(":input").val('');
  });

  var updateIds = function(url, ids) {
    return $.ajax({
      type: "POST",
      url: url,
      data: JSON.stringify({ "list_item_ids": ids }),
      dataType: 'json',
      contentType : 'application/json'
    });
  };

  $(".list ul").sortable({
    containment: "parent",
    axis: "y",
    items: "> li",
    update: function() {
      var $list = $(this);
      var ids = $list.find("li").map(function(li) {
        return $(this).data("id");
      }).get();
      return updateIds($list.data("sort-url"), ids);
    }
  });
});
