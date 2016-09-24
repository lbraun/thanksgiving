class User < ActiveRecord::Base
  def approval_at_string
    approval_at && approval_at.to_s(:long)
  end

  def created_at_string
    created_at.to_s(:long)
  end

  def approve
    self.approval_at = Time.now
    save!
  end

  def approved?
    approval_at.present?
  end

  def admin?
    self.admin
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end
end
