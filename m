Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E21DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq9rWg0WQtk35a/syIdVrxIN1jVZ3Xs4zsk5PWEtjOs=; b=2fihprNEvM2+IkdWI8lmBj1+yp
	kVkOViqR4p1ukYe77HfHjO+uNcEFIBqr5aIO117s8fnK0qL2racc079Lf1H89xAoCFwHHhYWaCer5
	+EotdzGtxT5GgHLuH0KP36MnFzmQqPTV7ThJAlftR7dCPkZAEcDLkaQl3em1K2huPdNBQAG51n68T
	MEqFkyNdUq4bxQNqX2qIMRlkJvOtfTIyBhFzz+/dbKVKmJdHndl4rmmI1itlaW7L3gSsJopO5aafD
	/p46OlN23giOruyLEnNyu0+B5j6giHbCsFKXI9PXyiHzeGEfWu9Mr47vKuGl1AhikWZnDm+nJMsSa
	dVpqQAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCxu-000000094Iw-2Z6I;
	Mon, 02 Jun 2025 21:45:06 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCvg-000000093jF-2P2X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 21:42:49 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7462aff55bfso3855697b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748900567; x=1749505367; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dq9rWg0WQtk35a/syIdVrxIN1jVZ3Xs4zsk5PWEtjOs=;
        b=VKuaVMVafzF+dCEXzvE60iRo5eSV22s1xeHMBzpO2b/QvTvf+BGYRO15YXY2WtqXto
         hjg6/bqezRhnwU7XfJ+mIYCZJHJOYP0pcL6tvQ5v6NwU2zLrNvSKLxw9dQgzskgp14NT
         eA4spV0+8LT4/P/0mHJ7GUW6HjBA/WCPyaw1dWi2kCNjhdge42DEev53tnGwh89t1Pw+
         71nRlN7L1IGpizBHDiOTnQ5O+V3HnFq3LpJj8hKBG91Ph5NN9g968LsTXSBXERaiFatN
         Tz4l7anzb7s/pyraW20zcNoWDR/2lH0IYswiD8w6Fbs34wu3SoE9+DVyG18Iq2D9AE39
         r9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900567; x=1749505367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq9rWg0WQtk35a/syIdVrxIN1jVZ3Xs4zsk5PWEtjOs=;
        b=xJeS5JuFq4136Z+fcjCnf7F6+3S6C33uT3fyZbiASnIhJTjWf7szsygmx72r4RHwwc
         w7hRbLOeanEwFdULpvz7b5aAOt1Q1HFWp92GYY96kDBycEeD3un65tynGeWt71rQGqve
         2SNH/8pKf25oQ6DrSV4hrEhdbltxsHuDIi95/7kq5F4dpOjCX7t8DYwAmZehHKsyvEBy
         WHjOU+24KxDnI92rVpsZBPqb1VkWIORzsBtPiTSnlpGfMpksmrT1dTtrmpVdqjW5FtaV
         QQTzpMOsJyT9X0PUv5AeM19FjiiAIP+eMftrQoItcu92ekVb1I6jSgF19Zoo+xu8lncm
         oudA==
X-Forwarded-Encrypted: i=1; AJvYcCXqLatZPgv5nvXFbpvTganl996iYnENz4PvathAxz0eC1JB9+f8NPmVniSOuKF5Roi9CW+0F5pOfAPekSvQd0eN@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfEdazlmPm79+Yt7r2KpYvoy+xgSTBc3WQ5FW93/e2ufXzdqS
	vgER66cJ/NQeiCnG8XqXNKW8DwlSoMG3JK5OL09XVadZj0jjXmvNxY1oIjYuYwzO5m1VoNYwlzN
	SOMvEXA==
X-Google-Smtp-Source: AGHT+IGP+igBSt2KbXYpY47Cum6/12d7ZKaJ7lAPbHVwRqO4FufM1cqAilI67WNoocjAfjBEbiMhF3OvXWQ=
X-Received: from pfbhd7.prod.google.com ([2002:a05:6a00:6587:b0:746:2e5d:3e6a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:238b:b0:736:a540:c9ad
 with SMTP id d2e1a72fcca58-747bda1a68amr19816923b3a.20.1748900567066; Mon, 02
 Jun 2025 14:42:47 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:42:45 -0700
In-Reply-To: <20250602192702.2125115-5-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com> <20250602192702.2125115-5-coltonlewis@google.com>
Message-ID: <aD4a1T7ZmBLNunxi@google.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Cleanup PMU includes
From: Sean Christopherson <seanjc@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_144248_619085_61B55340 
X-CRM114-Status: GOOD (  15.63  )
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

On Mon, Jun 02, 2025, Colton Lewis wrote:
> * Delete kvm/arm_pmu.h. These functions are mostly internal to KVM and
>   should go in asm/kvm_host.h.

Ha!  I'm a hair too late, as usual.  I _just_ resurrected a patch[*] to move and
rename all of the <kvm/arm_xxx.h> headers to <asm/kvm_xxx.h>.  If only I had
posted on Friday when they were ready :-)

It's a relatively small series (mostly arm64 code movement), but it does touch
all architectures due to giving the same treatment to kvm/iodev.h (and purging
include/kvm entirely).

Any preference/thoughts on how to proceed?  My stuff obviously isn't urgent since
I sat on the patches for almost two years.  On the other hand, the almost pure
code movement would be a nice precursor to this patch, e.g. move and rename to
asm/kvm_pmu.h before extracting chunks of code into asm/kvm_host.h.

[*] https://lore.kernel.org/all/20230916003118.2540661-15-seanjc@google.com


Diff stats for context:
---
Anish Ghulati (1):
  KVM: arm64: Move arm_{psci,hypercalls}.h to an internal KVM path

Sean Christopherson (7):
  KVM: arm64: Include KVM headers to get forward declarations
  KVM: arm64: Move ARM specific headers in include/kvm to arch directory
  KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
  KVM: MIPS: Stop adding virt/kvm to the arch include path
  KVM: PPC: Stop adding virt/kvm to the arch include path
  KVM: s390: Stop adding virt/kvm to the arch include path
  KVM: Standardize include paths across all architectures

 MAINTAINERS                                                | 1 -
 .../arm64/include/asm/kvm_arch_timer.h                     | 2 ++
 arch/arm64/include/asm/kvm_host.h                          | 7 +++----
 include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 2 ++
 .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 2 +-
 arch/arm64/kvm/Makefile                                    | 2 --
 arch/arm64/kvm/arch_timer.c                                | 5 ++---
 arch/arm64/kvm/arm.c                                       | 6 +++---
 {include => arch/arm64}/kvm/arm_hypercalls.h               | 0
 {include => arch/arm64}/kvm/arm_psci.h                     | 0
 arch/arm64/kvm/guest.c                                     | 2 +-
 arch/arm64/kvm/handle_exit.c                               | 2 +-
 arch/arm64/kvm/hyp/Makefile                                | 6 +++---
 arch/arm64/kvm/hyp/include/hyp/switch.h                    | 4 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c                           | 4 ++--
 arch/arm64/kvm/hyp/vhe/switch.c                            | 4 ++--
 arch/arm64/kvm/hypercalls.c                                | 4 ++--
 arch/arm64/kvm/pmu-emul.c                                  | 4 ++--
 arch/arm64/kvm/psci.c                                      | 4 ++--
 arch/arm64/kvm/pvtime.c                                    | 2 +-
 arch/arm64/kvm/reset.c                                     | 3 +--
 arch/arm64/kvm/trace_arm.h                                 | 2 +-
 arch/arm64/kvm/trng.c                                      | 2 +-
 arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio.c                            | 6 +++---
 arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c                       | 3 +--
 arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
 arch/loongarch/include/asm/kvm_eiointc.h                   | 2 +-
 arch/loongarch/include/asm/kvm_ipi.h                       | 2 +-
 arch/loongarch/include/asm/kvm_pch_pic.h                   | 2 +-
 arch/mips/include/asm/kvm_host.h                           | 3 +--
 arch/mips/kvm/Makefile                                     | 2 --
 arch/powerpc/kvm/Makefile                                  | 2 --
 arch/powerpc/kvm/mpic.c                                    | 2 +-
 arch/riscv/kvm/Makefile                                    | 2 --
 arch/riscv/kvm/aia_aplic.c                                 | 2 +-
 arch/riscv/kvm/aia_imsic.c                                 | 2 +-
 arch/s390/kvm/Makefile                                     | 2 --
 arch/x86/kvm/Makefile                                      | 1 -
 arch/x86/kvm/i8254.h                                       | 2 +-
 arch/x86/kvm/ioapic.h                                      | 2 +-
 arch/x86/kvm/irq.h                                         | 2 +-
 arch/x86/kvm/lapic.h                                       | 2 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h}                 | 0
 virt/kvm/Makefile.kvm                                      | 2 ++
 virt/kvm/coalesced_mmio.c                                  | 3 +--
 virt/kvm/eventfd.c                                         | 2 +-
 virt/kvm/kvm_main.c                                        | 3 +--
 54 files changed, 64 insertions(+), 77 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (98%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (99%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (99%)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)


base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
--

