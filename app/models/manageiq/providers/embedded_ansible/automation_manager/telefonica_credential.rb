class ManageIQ::Providers::EmbeddedAnsible::AutomationManager::TelefonicaCredential < ManageIQ::Providers::EmbeddedAnsible::AutomationManager::CloudCredential
  include ManageIQ::Providers::AnsibleTower::Shared::AutomationManager::TelefonicaCredential

  def self.display_name(number = 1)
    n_('Credential (Telefonica)', 'Credentials (Telefonica)', number)
  end
end
