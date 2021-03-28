class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :user_name, :date

  def date
    object.created_at.strftime('%F')
  end

  def user_name
    object.user['name']
  end
end
