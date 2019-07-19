class User < ApplicationRecord
  def approval_at_string
    approval_at && approval_at.to_s(:long)
  end

  def created_at_string
    created_at.to_s(:long)
  end

  def admin_string
    admin? ? "Yes" : "No"
  end

  def admin_button_class
    admin? ? "success" : "secondary"
  end

  def approved?
    approval_at.present?
  end

  def approve
    self.approval_at = Time.now
    save!
  end

  def remove_approval
    self.approval_at = nil
    save!
  end

  def toggle_admin
    self.admin = !admin
    save!
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
