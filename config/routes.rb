Rails.application.routes.draw do
  resources :puppies, only: %i[index]

  get 'puppies/the_puts_classic'
  get 'puppies/benchmark'
  get 'puppies/ruby_prof'
  get 'puppies/rack_mini_profiler'

  root 'puppies#index'
end
