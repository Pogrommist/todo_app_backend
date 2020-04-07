class TaskSerializer < ActiveModel::Serializer
  attributes :name, :completed, :id, :comments, :performer

  def comments
    object.comments
  end

  def performer
    User.find_by(id: object.user_id).email
  end
  
end
