var app = new Vue({
  el: '#new',
  data:{
    preview: '',
    title: '',
    ragen: '',
    shops: '',
    keyword: '',
    message: ''
  },
  watch: {
    keyword: function(newKeyword, oldKeyword){
      // lodash.debounceを利用してAPI呼び出しの負荷軽減
      this.message = '入力が終わるのを待ってます･･･';
      this.debouncedGetAnswer();
    }
},
created: function() {
    // lodash.debounce によって、1秒間操作が無くなった時点でAPI呼び出し実施
    // キー入力の度にAPIを呼び出すような負荷をかけないため
    this.debouncedGetAnswer = _.debounce(this.getAnswer, 1000);
  },
  methods: {
    handlecahnge: function(event){
      var file = event.target.files[0]
      if (file && file.type.match(/^image\/(png|jpeg)$/)){
        this.preview = window.URL.createObjectURL(file)
      }
    },
    getAnswer: function(){
      // キーワードが空の場合はメッセージと検索結果を空にして処理終了
      if( this.keyword === ''){
        this.shops = null;
        this.message = '';
        return;
      }
      
       this.message = 'loading...';
        var vm = this;
        axios.get(`https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=55ca579200a747ff64c569ceca6b9922&name=${this.keyword}&freeword=ラーメン`)
        .then(function(response){
          console.log(response);
          vm.shops = response.data;
         })
        .catch(function(error){
          vm.message = 'Error!' + error;
        })
        .finally(function(){
          vm.message = '';
        })
      }
    }
})