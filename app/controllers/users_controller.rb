class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: '@vad',
        avatar_url: 'https://avatars.mds.yandex.net/i?id=9809b1d686c03e265c48040b426fa5344c9717c3-5905521-images-thumbs&n=13'
      ),
      User.new(
        id: 2,
        name: 'Misha',
        username: '@miha'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    # @user = User.new(
    #   name: 'Lena',
    #   username: '@klen',
    # #avatar_url: 'https://sun9-67.userapi.com/s/v1/ig2/pu_l1W9Eh82WYH8HLeKsEtOmZIREW4JqYCKXFTPBDEaM1h-lIwiKEOk_tw8mytzseREWTaCLSxULqSZwnv_td_Xh.jpg?quality=96&as=32x44,48x66,72x99,108x148,160x219,240x329,360x493,480x658,540x740,640x877,720x987,864x1184&from=bu&u=FzdEfDo4sVFAhQf7dnFfrv9QLlWIaQlaxGvzgWTo784&cs=864x0'
    # )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('13.04.2026'))
    ]
    @question_new = Question.new
  end
end
