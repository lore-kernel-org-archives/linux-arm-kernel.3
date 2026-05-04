Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D1BCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GreUyu/PwGDkwAAEFHxYx5rSO95cp1lrcmL4UWkbrcg=; b=s+ShIcD/RVRZRMrcEdd2PE5fq7
	sEJ7TbGP1M47wlNr+EgD9T+pPo3Pxlv4Z38Ze6+v5cWtxaF1iSC8s2ghcWYpo958899dVRiedFmQM
	8LUGI9ZCmcp7b2sf/JAbuo5GHV+0osHRwoD8oI06ZJtyqfAnbBLnBIpHL1kT8oq0jLWwg+XvehXOm
	TmqBSv85P082wYN10NRNSN4t71rXpAxdPi1RnUqYCt6f1DPV/pIMNNowBg0YmQ7bssKeNzD6XZEzm
	QHiVYBCjAx/NxXIwKrhAp+4Q/+eo84imTItECej8ZZ9qn9sxDSCY24qkiFkBGgZE1EFWGWmQQsy0l
	zJLMcgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zm-0000000EVFm-1xqZ;
	Mon, 04 May 2026 22:42:34 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1zj-0000000EVF8-38kh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:42:33 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso3230895b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934550; x=1778539350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GreUyu/PwGDkwAAEFHxYx5rSO95cp1lrcmL4UWkbrcg=;
        b=OURTqNDlkZGfDOsWQ0Hz+C97aE/BxwWQCZ8GtQmyF73HRw0idFrkYDSai2VKEezdpm
         +opGyGjaovmwZ9IYeb28jMAmmMVDXg2+6gfOBmlWunQdjiDBAH7b0DYDIsPFfiKYZOpv
         HswLT9wy23WDnnWy+iVxQYVrhbNrR+v8iKNNC/5+L++YPjcMZ3XUX62G8hMpI0XtzcP6
         gNPhBQZ91eeDezICEZIHQiAK5UPQ221wk/IeBKE7qiu7gfy2gWTWvXuoEri5QSiBpM6w
         AnFtJHG+uYwvG7Mq9z1AE4AiZk20V+RUoXkW1ZtirfYDmQeZ5546uufJ19e0RIQ+o/YY
         RlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934550; x=1778539350;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GreUyu/PwGDkwAAEFHxYx5rSO95cp1lrcmL4UWkbrcg=;
        b=D3TYTDBs+Xs87EyR3BUDAnhTOISZ0BzO2Hz13e4J0uS4cRF+4LZGM8BrnGgxb1YkjE
         HJmNKrHs+BoL1mlX3PGSSlLkdss0yJguQwK3DjMIawZ6ehJG8rh2CaLykATFsrcH22lK
         IYbAL9ieDGBEjYLdi/mQNWMapK2ot/SeGgqsLSMacCVfGMislscj7qelIOdklujaWx7I
         dN1ybpV2nV7yGqmfZjKTo/bCKyPqq/cCeBa44xtIMs50FHt64/8f9wNFJyMHFGsYhy5I
         3up3rv1XhYnw1fvlbnIWmwCmhFBORL1/cKkmM31GFcpovz4GrXsuiI5WFLjHFojGakKs
         V8tg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZpzusilEvjX5/DI0Z0jbsP7fncXW+QDyoNHvPVkpyoMiFR1HCnor+vnGDZxUaE1BuCI/fp7QwzFphKUmVgK4u@lists.infradead.org
X-Gm-Message-State: AOJu0YxXVfOGZgLTiFdJrpXs0xzBOzH/dNIoXwSKnsCjfbrI2cFytKGh
	IPb07BKljkNSB/NcoP1GdVeCsTM07XXdXo3pd3dtVPPx+gavRO8ohOeUG6YqsM9kwFZLrQ9cbHo
	eLf7tXijbjbRm+6XFezFvjA==
X-Received: from pfbhm13.prod.google.com ([2002:a05:6a00:670d:b0:82f:7bc:70a9])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4c96:b0:82c:ded1:261f with SMTP id d2e1a72fcca58-8352d22c289mr10958941b3a.27.1777934549232;
 Mon, 04 May 2026 15:42:29 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-1-jthoughton@google.com>
Subject: [PATCH 0/5] KVM: Fix race conditions in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_154231_813638_61DE4D24 
X-CRM114-Status: GOOD (  18.52  )
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

Hi Paolo,

syzbot running on Google production kernels ran into a double-free on
KVM/arm64 in kvm_mmu_free_memory_cache(). It turns out that loongarch
and mips also have a similar problem.

kvm_arch_flush_shadow_all() can be called on the same memslot
concurrently, leading to double-freeing in arm64 and mips. loongarch
is also affected: it can at least underflow some counters; I'm not sure
what else can break.

To get into this scenario, we need to have a process (P1) share an open
VM with another process (P2). If P1 closes its VM to leave P2 holding
the last reference, then there is a race between P1 exiting (exit_mm)
and P2 dropping its last reference to the VM.

exit_mm() and kvm_vm_release() both call kvm_mmu_notifier_release() on
the same KVM, and the only locks held are the KVM srcu lock and the MMU
notifier srcu lock.

Please see the arm64 patch for another description of the same race with
more context on the ensuing double-free in KVM/arm64.

The first three patches fix each broken architecture; each of those
patches have stable CCed with what I think are the appropriate Fixes.

After patching the locking for the broken architectures, it seems better
simply to have KVM take the MMU lock exclusively before calling
kvm_arch_flush_shadow_all() so that architectures don't need to worry
about it. Feel free to drop that patch, the fourth one, if you disagree
with it.

The fifth patch provides a repro (with a crude kernel patch to reliably
demonstrate the double-free). Please do not merge this.

The arm64 patch has been tested with the repro. The loongarch and mips
patches have been compile-tested only.

kvm_arch_guest_memory_reclaimed() is only implemented by one
architecture: x86. Its implementation does not need the KVM MMU lock to
be held.

This series is based on 7.1-rc2.

James Houghton (5):
  KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
  KVM: loongarch: Grab MMU lock in kvm_arch_flush_shadow_all()
  KVM: mips: Grab MMU lock in kvm_arch_flush_shadow_all()
  KVM: Hold MMU lock exclusively when calling
    kvm_arch_flush_shadow_all()
  DO NOT MERGE: KVM: selftests: Reproducer for arm64 double-free

 arch/arm64/include/asm/kvm_host.h             |   1 +
 arch/arm64/include/asm/kvm_mmu.h              |   1 +
 arch/arm64/kvm/mmu.c                          |  39 +++++-
 arch/arm64/kvm/nested.c                       |   4 +-
 arch/loongarch/kvm/mmu.c                      |   2 +
 arch/mips/kvm/mips.c                          |   2 +
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   4 +-
 arch/riscv/kvm/vm.c                           |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/transfer_fd_test.c  | 129 ++++++++++++++++++
 virt/kvm/kvm_main.c                           |   3 +
 13 files changed, 184 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/transfer_fd_test.c

base-commit: 6d35786de28116ecf78797a62b84e6bf3c45aa5a
-- 
2.54.0.545.g6539524ca2-goog


