class Room < ApplicationRecord
  belongs_to :organization
  has_many :queues, foreign_key: :room_id, class_name: 'RoomQueue'
  has_many :videos, through: :queues
  has_many :comments, through: :queues

  def playing_queue
    queues.find_by({state: RoomQueue::STATE_PLAYING})
  end

  def next_queue
    queues.where({ state: RoomQueue::STATE_QUEUED }).order(:created_at).first
  end

  def add_queue(user_id, video)
    queues << RoomQueue.create({
      user_id: 1,
      video_id: video.id,
      state: RoomQueue::STATE_QUEUED,
    })
  end

  def latest_queue
    queues.where("state = #{::RoomQueue::STATE_FINISHED}").order('id DESC').limit(1).first
  end

  def current_queues
    if latest_queue
      queues.where("id >= #{latest_queue.id}")
    else
      queues.where("state IN (?)", [::RoomQueue::STATE_QUEUED, ::RoomQueue::STATE_PLAYING])
    end
  end
end
