$ ->

  log = (msg)-> console.log msg

  class Login

  class IconUser

    @icon: $('#icon-user')
    @shap: $('#icon-user-shape')

    @reset: ->
      @icon.fadeTo(50, 0)

    @show: (img)->
      @icon.css('background-image', "url('#{img}')")
      # $('#icon-user').show().css('opacity', 1)
      @icon.show().fadeTo(100, 1)
      # @log $('#icon-user').attr('src', 'img/shallker.jpg').parent().removeClass('circle').addClass('circle')
      

  class Input

    @value: null
    @isFocus: false

    @onFocus: =>
      @log 'onFocus'
      @isFocus = true

    @onBlur: =>
      @log 'onBlur'
      @isFocus = false

    @log: (msg)->
      console.log @, msg

    @isEmail: (email)->
      re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      re.test email


  class InputUsername extends Input

    @input: $('.input-username')

    @init: ->
      # @input.focus @onFocus
      # @input.blur @onBlur
      # @input.change @onChange
      @input.keyup @onKeyup

    @onChange: (ev)=>
      @log 'onChange'

    @onKeyup: (ev)=>
      # @log 'onKeyup'
      return if @input.val() is @value
      @value = @input.val()
      @getUser @value if @isEmail @value

    @getUser: (username)->
      return IconUser.reset() if username isnt 'imshallker@gmail.com'
      # IconUser.show '/img/shallker.jpg'
      IconUser.show 'http://tp2.sinaimg.cn/1946601341/180/40013145637/1'

      # $.ajax
      #   url: 'http://198.168.1.119:119'
      #   type: 'GET'
      #   success: -> console.log 'success'


  class InputPassword extends Input

    @finished = false
    @watching = null
    @value = null

    @input: $('.input-password')

    @init: ->
      # console.log 'hi'
      # super
      # @input.focus @onFocus
      # @input.blur @onBlur
      @input.change @onChange
      @input.keyup @onKeyup
      @input.focus @onFocus
      @input.blur @onBlur

    @trySubmit: ->
      return if not @finished
      log 'submit'

    @onChange: (ev)=>
      log 'onChange'

    @onKeyup: (ev)=>
      log 'onKeyup'
      return if @input.val() is @value
      @value = @input.val()
      @validate @value

    @onFocus: (ev)=>
      log 'onFocus'
      @watching = window.setInterval => @trySubmit(),
      100

    @onBlur: (ev)=>
      log 'onBlur'
      window.clearInterval @watching

    @validate: (password)->
      if password.length > 3 then @finished = true
      else @finished = false


  class LoginButton


  # console.log 'init'
  # new InputUsername $('.input-username')
  # new InputPassword $('.input-password')
  InputUsername.init()
  InputPassword.init()
