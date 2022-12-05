# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_author!

  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
  end
end
