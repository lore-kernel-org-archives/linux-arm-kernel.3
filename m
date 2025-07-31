Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17856C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3LhBmNVj47n+/Xo2CBpWpkvNL4bzPFglARthS3E980E=; b=XQSNwLDb5rbGWNCd9m11um+bai
	ro08LaknBsd5aXFgcWxFCekayYVntTJnI0XFn/IxL5rmGc2c6mMPS3T4zyOscGqoOdUDaTWBj6Nhq
	GRfY+tClo8AMAwWvfTgfXgbNfAqyluXfMzRsCAI4+xxeWiRvc/C5eULZltvnNGDKIovidyamcExJT
	PUfoHmcZqxc3pYSoO8wRSbbIv1+TadHPEXhq0W7biMA79R+bzGdHBzGLaZUCH144plCNFokHbyxiT
	Fo8XaD3i/aM8hq0frxcrOoMFKUcZcIViuzUyRM0pdeCwYDCzKa8gkYtQBjHmS2piaYrJLrmWpdtDh
	KHO3gdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhary-00000004TWy-26V4;
	Thu, 31 Jul 2025 21:31:22 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhah7-00000004S9G-006z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 21:20:10 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-75ab147e0a3so1494915b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 14:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753996808; x=1754601608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LhBmNVj47n+/Xo2CBpWpkvNL4bzPFglARthS3E980E=;
        b=lHeizHbe8zzdl136MdsaTB8xdYNXvUJuWNZhDZNjPN5/QcbInSzYvqU0vfC9SOlxpY
         eluLd5y2TBgZU69S5rctIG5EGpn8bhDhvm/Mn6a5AXp84nOBPhmvinl9S6x0agYui3LE
         bf5QekhxkYKSVBVvCRV36WV8CZvUFCyMQolVktd60ivO0rTKqe7u/FP8ol4Cq4KtO/TS
         t+gEzFBF+mFAIF3q4LYX3pzgs3sUUSUUNawVBx2qmOk4VoQpmQBd6zIQD5RdCjOFSvPl
         iLXHC/qnZgh2rtEY2+zXmeojWu+QXdik2ERjUwHi8MsKyScSeh738S01EOwJ56Pgcg8B
         O0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753996808; x=1754601608;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LhBmNVj47n+/Xo2CBpWpkvNL4bzPFglARthS3E980E=;
        b=Tkl42xXx0+l/2E75pTMSCi5iC79fHUyjFZ5U+KkPVcDEuLFKKiMUW86hWP1u23B1Ay
         kJ+UMiN9zDhn8QLQtbA6Ey/vp4drCZvG7gkCitpDlABwDyZInnrTL8d1XGNwrzabDMuT
         kz9ggoFofPYXvOAcrmMiZeeDteuSBoy67ZUh9EyED05vO4epKR+Lh32qXiUdSzLp/4QA
         AYIkej4o9n4z7tpRDXxXW91tz4qiLswbb7tCYd1Ip+4xtp2LQjMheWQ4GllF2u7JgJaQ
         PvsxrR+Pigm17y0W0nAspbfStc1++qUsHO7xJQK8IyvC+YGueDeq8dJKaV37RiPhc/xr
         zAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKSt2AJ4ngqQvW7oIbr83otl/LaSkZnoNWyRMn4ae4aCcemseYT+IDo5ZyfWT2E9iHjf5/VA+JQBkf7sLkv7Xe@lists.infradead.org
X-Gm-Message-State: AOJu0YwE9OdwqvtL5Ys10gDk8rpysXMuJMBfvNFiM7y/97fQVvHUjwEV
	APMkOXywrlq8naRWF+SlFrOaKHHa91vBC/xfX4vK7Ioa3/CmF3F2HnDr8x/Q0gCzomhKvIN+XD2
	HWhkF90DKhn5HjA==
X-Google-Smtp-Source: AGHT+IHVlDuY+fYNSvzWaCl78j3JqbZZEEmbQtyEYvAT3m66mv+lhaRSlgO6MH1HydCWLvX+Ha9fBEBU/p76uA==
X-Received: from pfhx36.prod.google.com ([2002:a05:6a00:18a4:b0:75f:8367:a75a])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f93:b0:215:d611:5d9b with SMTP id adf61e73a8af0-23de80e503cmr119146637.12.1753996807524;
 Thu, 31 Jul 2025 14:20:07 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:20:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731212004.1437336-1-jiaqiyan@google.com>
Subject: [PATCH v1 0/4] A couple of improvements for VMM to inject external
 abort to guest
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rananta@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_142009_040161_C35D2650 
X-CRM114-Status: GOOD (  14.41  )
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

There are several situations where VMM is involved when handling
synchronous external instruction or data aborts, and often VMM
needs to inject external aborts to guest. In addition to manipulating
individual registers with KVM_SET_ONE_REG API, an easier way is to
use the KVM_SET_VCPU_EVENTS API.

This patchset adds two new features to the KVM_SET_VCPU_EVENTS API.
1. Extend KVM_SET_VCPU_EVENTS to support external instruction abort.
2. Allow userspace to emulate ESR_ELx.ISS by supplying ESR_ELx.
   In this way, we can also allow userspace to emulate ESR_ELx.ISS2
   in future.

The UAPI change for #1 is straightforward. However, I would appreciate
some feedback on the ABI change for #2:

  struct kvm_vcpu_events {
    struct {
        __u8 serror_pending;
        __u8 serror_has_esr;
        __u8 ext_dabt_pending;
        __u8 ext_iabt_pending;
        __u8 ext_abt_has_esr;
        __u8 pad[3];
        __u64 serror_esr;
        __u64 ext_abt_esr;  // <= +8 bytes
      } exception;
    __u32 reserved[10];     // <= -8 bytes
  };

The offset to kvm_vcpu_events.reserved changes, and the size of
exception changes. I think we can't say userspace will never access
reserved, or they will never use sizeof(exception). Theoretically this
is an ABI break and I want to call it out and ask if a new ABI is needed
for feature #2. For example, is it worthy to introduce exception_v2
or kvm_vcpu_events_v2.

Based on commit 7b8346bd9fce6 ("KVM: arm64: Don't attempt vLPI mappings
when vPE allocation is disabled")

Jiaqi Yan (3):
  KVM: arm64: Allow userspace to supply ESR when injecting SEA
  KVM: selftests: Test injecting external abort with ISS
  Documentation: kvm: update UAPI for injecting SEA

Raghavendra Rao Ananta (1):
  KVM: arm64: Allow userspace to inject external instruction abort

 Documentation/virt/kvm/api.rst                |  48 +++--
 arch/arm64/include/asm/kvm_emulate.h          |   9 +-
 arch/arm64/include/uapi/asm/kvm.h             |   7 +-
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/emulate-nested.c               |   6 +-
 arch/arm64/kvm/guest.c                        |  42 ++--
 arch/arm64/kvm/inject_fault.c                 |  16 +-
 include/uapi/linux/kvm.h                      |   1 +
 tools/arch/arm64/include/uapi/asm/kvm.h       |   7 +-
 .../selftests/kvm/arm64/external_aborts.c     | 191 +++++++++++++++---
 .../testing/selftests/kvm/arm64/inject_iabt.c |  98 +++++++++
 11 files changed, 352 insertions(+), 74 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c

-- 
2.50.1.565.gc32cd1483b-goog


