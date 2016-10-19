class ::Service::AddQueue
  attr_accessor :video_id
  attr_accessor :video_info
  attr_accessor :room

  def initialize(**args)
    prepare(args)
  end

  def prepare(**args)
    @room = args[:room] if args.key?(:room)
    @video_id = args[:video_id] if args.key?(:video_id)
  end

  def execute
    video = ::Video.find_or_create_by({
      provider: ::Video::PROVIDER_YOUTUBE,
      provider_video_id: @video_id
    })
    @video_info = ::Service::Video::GetVideoInfo.new({video_id: @video_id}).execute
    video.update_attributes({
      title: @video_info[:title],
      duration: @video_info[:duration],
      image_url: @video_info[:image_url]
    })

    @room.add_queue(video)
  end
end