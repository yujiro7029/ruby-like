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
    $("#answer_content").on('change', function(e){
      e.preventDefault();   
      inputText = $("#answer_content").val();
      appendHtml(inputText)
  })
})  



// もともとhtmlに生成して置いて、中身の部分となりゆる箇所に