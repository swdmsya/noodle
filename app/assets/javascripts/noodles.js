new Vue({
  el: '#new',
  data:{
    preview: '',
    title: '',
    ragen: ''
  },
  methods: {
    handlecahnge: function(event){
      var file = event.target.files[0]
      if (file && file.type.match(/^image\/(png|jpeg)$/)){
        this.preview = window.URL.createObjectURL(file)
      }
    }
  }
})
