Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 05:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NrHVO1JlSwACRF1JM0S/mT4335rXAQlO0tShDIgF4kg=; b=cwndwUBdC6vBcT3v4jJuoG7xJb
	JSUv+DSi+jzKT86oEBiRkeMCDJuHUNVwB7sifsPY9uX97zAm7fVAxWGK0Mc3D8QWpueNkOJnaezfo
	+Al+AzIzwX5S4AHowaVMObQR8+sLvfqSFwMZe5r5zo8we33PpGu1TdqDvHzJHeJGRoB0E9ZDEogjC
	CReOsxfTqFpOC9jjZn8rW3CcK2AVOAYRkTrdFPUjzfeI5DxERKTKgUfdC2oI3mH+FGtmer4A7DgC8
	Rd5C6+i43oFSwgFrUplBF1AVXiSKq5vVZjwaMV21BftS9PegEFRsyukTMawclusuayo/JV6bujGIC
	/9bUtX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgPL-0000000Cbvq-0Nhx;
	Wed, 04 Jun 2025 05:11:23 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgN8-0000000CbJ4-1643
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:09:07 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742951722b3so4866458b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 22:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013745; x=1749618545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NrHVO1JlSwACRF1JM0S/mT4335rXAQlO0tShDIgF4kg=;
        b=iNpay8HV7P1R5LEGPHKXKP0J0XaD6zJnFcz6afiPC4lVA6PcdJAfPV6TrJVrkfFdXd
         prSvybJSj1btnNQp452m3gGDZUmZSk0tz0vpmWJZWVI/JEvkh8/IZwgEomD4KDOYBCDy
         M7dquU61jly1joUhwcyiB5zB02Ac9v3xIlBKLdJYOtsSmjtZPYaRkxcJsUK5Kxwfx9K4
         RK9udKLgZZFug6sVc66cYz3cn6YfYDqStbtOH5A+CBpoUmGj64IbX+Tg2uIJK2N94rIQ
         /a2ylUJF2HiRlwf3VhWJvlrTLAbZdBRM1ipI9//9ngGyPc1MXAs/+tUBKn/7NXJ43mb5
         /5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013745; x=1749618545;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrHVO1JlSwACRF1JM0S/mT4335rXAQlO0tShDIgF4kg=;
        b=ripZ3uoDsrfbfSm+xZ+LDWuPFrw6GLLNQXzoTUuIB3eMUmF0WWMNA3IIGllNxgbRof
         L64bzNK3Jrdpb6gWh8x1CVcO22jFzCfljfQlydHmdQx95sQ7RekVjIcmIMHDgsxplT5X
         PE3ljogCWKBbVXi5J+lF5qpbTmqy5TSGqx/wzixlG9r4HYg7ydLn/xsDzA/vSfpkG3JA
         ZUV9csP1gwqvgQhqewQQRwB02XOR4O66zV/8U03V1H61VdLE3mz5GVdPxQVHy7sgAP1y
         3hpX9LcpKNxawcTaWpl5IerX69EzH5bJxTo7l9h/2LH0JHnN53nw8/e93U/5Bq4TB7ox
         NvxA==
X-Forwarded-Encrypted: i=1; AJvYcCUpUAvzPt83u8ecnQpGtoROimyV4s2WPfZ0vlubeYYzjuNTPgSZy81A9EYJx1IJMflS4d/B9PDx2num0NxATKio@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi9WSdwA0JCKxrwEubMqePRCW18L0YyQWV+unEixyyWWAxz3f7
	lvIxjLes6ElmY75ImAqoV6HHw47+LHJ/u3JifRcBhtLbn57lsRE1fTPnJ8wy5yWkoZP9061qpeL
	7kWUMZffjlchA3w==
X-Google-Smtp-Source: AGHT+IEABKtEFFU5liXpEXSptkYGDpsy283hDhs01hedhxVkwnKMuF3CclWqZbgRuZmc+jHI4P4dRe8JCJ2ZzQ==
X-Received: from pgbcq2.prod.google.com ([2002:a05:6a02:4082:b0:b2d:249f:ea07])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1586:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-21d22a6ca78mr2158789637.9.1749013744670;
 Tue, 03 Jun 2025 22:09:04 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:08:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-1-jiaqiyan@google.com>
Subject: [PATCH v2 0/6] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_220906_352890_E1692D10 
X-CRM114-Status: GOOD (  21.77  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Problem
=======

When host APEI is unable to claim synchronous external abort (SEA)
during stage-2 guest abort, today KVM directly injects an async SError
into the VCPU then resumes it. The injected SError usually results in
unpleasant guest kernel panic.

One of the major situation of guest SEA is when VCPU consumes recoverable
uncorrected memory error (UER), which is not uncommon at all in modern
datacenter servers with large amounts of physical memory. Although SError
and guest panic is sufficient to stop the propagation of corrupted memory
there is room to recover from an UER in a more graceful manner.

Proposed Solution
=================

Alternatively KVM can replay the SEA to the faulting VCPU, via existing
KVM_SET_VCPU_EVENTS API. If the memory poison consumption or the fault
that cause SEA is not from guest kernel, the blast radius can be limited
to the consuming or faulting guest userspace process, so the VM can keep
running.

In addition, instead of doing under the hood without involving userspace,
there are benefits to redirect the SEA to VMM:

- VM customers care about the disruptions caused by memory errors, and
  VMM usually has the responsibility to start the process of notifying
  the customers of memory error events in their VMs. For example some
  cloud provider emits a critical log in their observability UI [1], and
  provides playbook for customers on how to mitigate disruptions to
  their workloads.

- VMM can protect future memory error consumption by unmapping the poisoned
  pages from stage-2 page table with KVM userfault, or by splitting the
  memslot that contains the poisoned guest pages [2].

- VMM can keep track of SEA events in the VM. When VMM thinks the status
  on the host or the VM is bad enough, e.g. number of distinct SEAs
  exceeds a threshold, it can restart the VM on another healthy host.

- Behavior parity with x86 architecture. When machine check exception
  (MCE) is caused by VCPU, kernel or KVM signals userspace SIGBUS to
  let VMM either recover from the MCE, or terminate itself with VM.
  The prior RFC proposes to implement SIGBUS on arm64 as well, but
  Marc preferred VCPU exit over signal [3]. However, implementation
  aside, returning SEA to VMM is on par with returning MCE to VMM.

Once SEA is redirected to VMM, among other actions, VMM is encouraged
to inject external aborts into the faulting VCPU, which is already
supported by KVM on arm64. We notice injecting instruction abort is not
fully supported by KVM_SET_VCPU_EVENTS. Complement it in the patchset.

New UAPIs
=========

This patchset introduces following userspace-visiable changes to empower
VMM to control what happens next for SEA on guest memory:

- KVM_CAP_ARM_SEA_TO_USER. While taking SEA, if userspace has enabled
  this new capability at VM creation, and the SEA is not caused by
  memory allocated for stage-2 translation table, instead of injecting
  SError, return KVM_EXIT_ARM_SEA to userspace.

- KVM_EXIT_ARM_SEA. This is the VM exit reason VMM gets. The details
  about the SEA is provided in arm_sea as much as possible, including
  sanitized ESR value at EL2, if guest virtual and physical addresses
  (GPA and GVA) are available and the values if available.

- KVM_CAP_ARM_INJECT_EXT_IABT. VMM today can inject external data abort
  to VCPU via KVM_SET_VCPU_EVENTS API. However, in case of instruction
  abort, VMM cannot inject it via KVM_SET_VCPU_EVENTS.
  KVM_CAP_ARM_INJECT_EXT_IABT is just a natural extend to
  KVM_CAP_ARM_INJECT_EXT_DABT that tells VMM KVM_SET_VCPU_EVENTS now
  supports external instruction abort.


* From v1 [4]:
  - Rebased on commit 4d62121ce9b5 ("KVM: arm64: vgic-debug: Avoid
    dereferencing NULL ITE pointer").
  - Sanitize ESR_EL2 before reporting it to userspace.
  - Do not do KVM_EXIT_ARM_SEA when SEA is caused by memory allocated to
    stage-2 translation table.

[1] https://cloud.google.com/solutions/sap/docs/manage-host-errors
[2] https://lore.kernel.org/kvm/20250109204929.1106563-1-jthoughton@google.com
[3] https://lore.kernel.org/kvm/86pljbqqh0.wl-maz@kernel.org
[4] https://lore.kernel.org/kvm/20250505161412.1926643-1-jiaqiyan@google.com

Jiaqi Yan (5):
  KVM: arm64: VM exit to userspace to handle SEA
  KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
  KVM: selftests: Test for KVM_EXIT_ARM_SEA and KVM_CAP_ARM_SEA_TO_USER
  KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
  Documentation: kvm: new uAPI for handling SEA

Raghavendra Rao Ananta (1):
  KVM: arm64: Allow userspace to inject external instruction aborts

 Documentation/virt/kvm/api.rst                | 128 ++++++-
 arch/arm64/include/asm/kvm_emulate.h          |  67 ++++
 arch/arm64/include/asm/kvm_host.h             |   8 +
 arch/arm64/include/asm/kvm_ras.h              |   2 +-
 arch/arm64/include/uapi/asm/kvm.h             |   3 +-
 arch/arm64/kvm/arm.c                          |   6 +
 arch/arm64/kvm/guest.c                        |  13 +-
 arch/arm64/kvm/inject_fault.c                 |   3 +
 arch/arm64/kvm/mmu.c                          |  59 ++-
 include/uapi/linux/kvm.h                      |  12 +
 tools/arch/arm64/include/asm/esr.h            |   2 +
 tools/arch/arm64/include/uapi/asm/kvm.h       |   3 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   2 +
 .../testing/selftests/kvm/arm64/inject_iabt.c |  98 +++++
 .../testing/selftests/kvm/arm64/sea_to_user.c | 340 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 16 files changed, 718 insertions(+), 29 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c
 create mode 100644 tools/testing/selftests/kvm/arm64/sea_to_user.c

-- 
2.49.0.1266.g31b7d2e469-goog


