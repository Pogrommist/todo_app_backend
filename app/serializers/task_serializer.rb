class TaskSerializer < ActiveModel::Serializer
  attributes :name, :completed, :id, :comments

  def comments
    object.comments
  end
  
end
