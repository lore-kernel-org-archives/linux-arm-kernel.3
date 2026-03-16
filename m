Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D43F53D80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrkEb2n12YyrcySqlJ1Endt4MHN6ko+q0The82lLn1s=; b=enLEI/NBHfl8H3vuhGs5sHjLKD
	X58Pxsbm2nZfyMPX4SG8essA3fRgSs8hucP0K/dYTUqHMCs36m5rY/4tuoPRkXmAfQhw5X8lNLJ7C
	YxIPSUKkq6mjiW7JcnpoUHl0JU0jLGREFHdpRQ00Kh2o18LFQzcm9p68jNBQVpaoJmRhuL5470iMu
	4V9PLDfLNjSwhjx+fV1ET8Sq26dliJhaw5iwcrJpdsNS0O9O4BKWmojxGZN3pYCXfWSGZTu/FGiXq
	euEj8TGhg5dwpTPx8xqM+BzjaEwytutXR7LOYOGO1fINM1W6BfQwfLlJc/hwFpsOi1xOqgJc9ADZY
	s+525akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000004Zo6-0cma;
	Mon, 16 Mar 2026 17:35:38 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bql-00000004Zlw-4Bqe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:33 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485350666bfso39197675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682529; x=1774287329; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrkEb2n12YyrcySqlJ1Endt4MHN6ko+q0The82lLn1s=;
        b=vaAs1cWM4U6NOeHagcnafPHE6bkj4tV4+7E6uJNEzf4qyMl9IRM4LC6DWHnmO520qj
         OpSvHiQAYGumdIZgLG3mkOIx2R2ZxqU6uTtvKS2ugBONFAvRo5PC0d7rmKIOB8i2KBsO
         riyCl6lqe8PlzFE0iVqLKZlDqpdkLz2hmdHH9xzItaNiIKbyzb5hBdfDcD/RmkWtB2Cj
         sPDP8yvPyh2waWgHz8jduIyqhn1+0amWOUVtmIljL5qPeuUBH6FjF0gibb6/86rvtUXa
         Ca6uKW5k2UJK8lmxzpuNgh1qetFHBTtwgBepOLZ+raH/Ek7K/jD9yM28Da3mAJmTpOM6
         qr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682529; x=1774287329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrkEb2n12YyrcySqlJ1Endt4MHN6ko+q0The82lLn1s=;
        b=ruUfzQjAumBeKNC/6ndUOqjdSwyV2L/fNZwxYm80IftMpYibyVCODpvww8+WGivuEV
         G3Gx/xhzM0LYqaFXqq2STOBE+5LibYyz1Th4CD8tuUxV7dyJmeo/0F6z9iRpnmmY0ZS9
         vX7OkoIU2GIHodOhlLNMAaD8UGggES2ZgBMWmUdTffn4f0/qOMd9ZWMWOTWt74OoEQHk
         81SNtivdw74sy1fNe1Pmp17jc6CNjLyDmlsu8DEU76IYcfsDr4bqJKpYN6+gxQXmZt5Y
         6/OfiebIFTImKak0PUnhej18Q4AuHgC2cOSaPNzEAVMIXc4EjQlgQ/ssjjWEuZd/lBBe
         HIVA==
X-Forwarded-Encrypted: i=1; AJvYcCU2CheaRKaYGUK+LHrtW0ADAq7LZn4p8CcoPrVjk/wNKkVLmtlopAwZ+v4Vh72jbnvTc8e80r+zk5AZOlKLcXGW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jnP9xcVlCJ2n4sgoKyX/1tBndgFIVm1xsJScuxO5OeGaqER+
	ijmO15f7jU09bRRF/BByPQ+CgYWyBBc3/YuQfako1/IZUf0PoPLu6fvjekSyTF2a5hRUt+PXZqV
	yKA==
X-Received: from wmno9.prod.google.com ([2002:a05:600c:1649:b0:485:38ca:51c9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:354b:b0:480:2521:4d92
 with SMTP id 5b1f17b1804b1-485567071a0mr226576455e9.24.1773682528999; Mon, 16
 Mar 2026 10:35:28 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:22 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-1-456875a2c6db@google.com>
Subject: [PATCH 01/10] KVM: arm64: Add scoped resource management (guard) for hyp_spinlock
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_103532_043009_1C42AB2E 
X-CRM114-Status: GOOD (  10.91  )
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

The Linux kernel recently introduced scoped resource management macros
in <linux/cleanup.h>, enabling RAII-like patterns such as guard() and
scoped_guard(). These macros significantly reduce the risk of resource
leaks, deadlocks, and messy unwinding paths.

The arm64 KVM EL2 hypervisor heavily relies on its own locking
primitive, hyp_spinlock_t. Managing these locks carefully across
complex failure paths is critical, as missing an unlock at EL2
typically results in a lethal system-wide panic.

Add support for the guard(hyp_spinlock) and scoped_guard(hyp_spinlock)
macros by including <linux/cleanup.h> and using the DEFINE_LOCK_GUARD_1
infrastructure in the spinlock header. This paves the way for converting
error-prone manual locking into automatic scoped management.

Change-Id: Iba6d43c081b5fdf2496dc599fd6a781294493cb9
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..2681f8d2fde5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -16,6 +16,7 @@
 #include <asm/alternative.h>
 #include <asm/lse.h>
 #include <asm/rwonce.h>
+#include <linux/cleanup.h>
 
 typedef union hyp_spinlock {
 	u32	__val;
@@ -98,6 +99,10 @@ static inline void hyp_spin_unlock(hyp_spinlock_t *lock)
 	: "memory");
 }
 
+DEFINE_LOCK_GUARD_1(hyp_spinlock, hyp_spinlock_t,
+		    hyp_spin_lock(_T->lock),
+		    hyp_spin_unlock(_T->lock))
+
 static inline bool hyp_spin_is_locked(hyp_spinlock_t *lock)
 {
 	hyp_spinlock_t lockval = READ_ONCE(*lock);

-- 
2.53.0.851.ga537e3e6e9-goog


