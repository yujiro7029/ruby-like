$(function() {
      function appendHtml(input){
      var html =  `<div class="highlight" id="size-fix">
                    <pre class="highlight plaintext">
                      <code>
                        ${input}
                        </code>
                    </pre>
                  </div>
                  `
                  $("#form-text").append(html)
                }
    $(".from-boxs__box__from").on('change', function(e){
      e.preventDefault();   
      inputText = $("from-boxs__box__from").val();
      appendHtml(inputText)
  })
})  