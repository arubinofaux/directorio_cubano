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
let baseNumber = 50000000
const maxNumber = 50000009

while (true) {
  if (baseNumber == maxNumber) {
    console.log("stopping");
    break
  }

  console.log(baseNumber);

  baseNumber = baseNumber + 1
}
```