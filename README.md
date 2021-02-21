# README

Supporting api for a console based scraper.

```
jQuery.ajax({
  data: {
    'action': 'get_direcotio_dcca',
    'tipo': 1,
    'provinvia': 1,
    'criterio': 53328201
  },
  url: '/wp-admin/admin-ajax.php',
  type: 'POST',
  success: function(response) {
    console.log(response);
    jQuery.ajax({
      data: response,
      contentType: "text/html; charset=UTF-8",
      url: 'http://localhost:3000/entry/read',
      type: 'POST',
      success: function(r) {
        console.log(r);
      }
    })
  }
})
```

```
let entries = 0
let max = 5
let wait = 4000

const interval = setInterval(function() {
  jQuery.ajax({
    url: 'http://localhost:3000/entry/random',
    type: 'GET',
    success: function(random) {
      
      jQuery.ajax({
        data: {
          'action': 'get_direcotio_dcca',
          'tipo': 1,
          'provinvia': 1,
          'criterio': random.phone
        },
        url: '/wp-admin/admin-ajax.php',
        type: 'POST',
        success: function(response) {

          jQuery.ajax({
            data: response,
            contentType: "text/html; charset=UTF-8",
            url: 'http://localhost:3000/entry/read',
            type: 'POST',
            success: function(r) {
              console.log(r);
            }
          })

        }
      })

    }
  })

  if (entries == 3) {
    console.log("stopping");
    clearInterval(interval);
  }

  entries = entries + 1

}, wait);
```
