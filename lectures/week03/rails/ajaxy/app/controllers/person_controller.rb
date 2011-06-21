class PersonController < ApplicationController

  def foo
    person = {}
    person[:name] = "foo"
    person[:message] = "this is foo from the controller!"
    render :json => person
  end

  def bar
    person = {}
    person[:name] = "bar"
    person[:message] = "this is bar from the controller!"

    respond_to do |format|
      format.json { render :json => person }
    end

  end

  def baz
    person = {}
    person[:name] = "baz"
    person[:message] = "this is baz from the controller!"

    respond_to do |format|
      format.json { render :json => person }
    end

  end

end
