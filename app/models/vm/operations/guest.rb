module Vm::Operations::Guest
  extend ActiveSupport::Concern

  included do
    api_relay_method :shutdown_guest
    api_relay_method :reboot_guest
    api_relay_method :lock_guest
    api_relay_method :unlock_guest
    api_relay_method :reset
  end

  def validate_standby_guest
    validate_unsupported("Standby Guest Operation")
  end

  def raw_shutdown_guest
    unless has_active_ems?
      raise _("VM has no Provider, unable to shutdown guest OS")
    end
    run_command_via_parent(:vm_shutdown_guest)
  end

  def shutdown_guest
    check_policy_prevent(:request_vm_shutdown_guest, :raw_shutdown_guest)
  end

  def raw_standby_guest
    unless has_active_ems?
      raise _("VM has no Provider, unable to standby guest OS")
    end
    run_command_via_parent(:vm_standby_guest)
  end

  def standby_guest
    check_policy_prevent(:request_vm_standby_guest, :raw_standby_guest)
  end

  def raw_reboot_guest
    unless has_active_ems?
      raise _("VM has no Provider, unable to reboot guest OS")
    end
    run_command_via_parent(:vm_reboot_guest)
  end

  def reboot_guest
    check_policy_prevent(:request_vm_reboot_guest, :raw_reboot_guest)
  end

  def raw_lock_guest
    unless has_active_ems?
      raise _("VM has no Provider, unable to lock guest OS")
    end
    run_command_via_parent(:vm_lock_guest)
  end

  def lock_guest
    check_policy_prevent(:request_vm_lock_guest, :raw_lock_guest)
    false
  end

  def raw_unlock_guest
    unless has_active_ems?
      raise _("VM has no Provider, unable to unlock guest OS")
    end
    run_command_via_parent(:vm_unlock_guest)
  end

  def unlock_guest
    check_policy_prevent(:request_vm_unlock_guest, :raw_unlock_guest)
  end


  def raw_reset
    unless has_active_ems?
      raise _("VM has no Provider, unable to reset VM")
    end
    run_command_via_parent(:vm_reset)
  end

  def reset
    check_policy_prevent(:request_vm_reset, :raw_reset)
  end
end
