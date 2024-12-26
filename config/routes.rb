DraftBox::Engine.routes.draw do
  get '/', to: 'emails#index', as: :emails
  get '/:id', to: 'emails#show', as: :email
  delete '/', to: 'emails#destroy_all', as: :destroy_all
  delete '/:id', to: 'emails#destroy', as: :destroy
  get '/:email_id/attachments/:id', to: 'attachments#show', as: :attachment
end
