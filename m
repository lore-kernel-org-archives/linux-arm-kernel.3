Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B3AC8300F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TP7OERsBD0AIL6q0/hWWV2FPerGoaJHuU25B69zEssI=; b=xQIFb6ZzSMJ7I2BgtF7JtcQ99P
	kW1DXvQO4EdJD/K45PBXwhPTRiAcoUhvdL6LgRSJQ70UvmyBwlTqSZo4JdOt+hrK6Daen3buw4MlZ
	qa7vusSpRrNSFAc58BBlS24hldjL69RwJ9687LHe2YO2RRdQWmhB4aO5qGZNk7J4CPCDqXi6jmhts
	QI6W0KhGiwBm9QoSoAoJJRi9FnOr8+H/XSA2yhDH5QSGwP1fCGUjrm6lJeGP7n9GQzu61VJIIQHFL
	Z5ZFjAGMhuj9vyQqQDYKfcekqfPf1PRFYys7R68t0iWZABE9Lzuo7fetJeiG1mOvCPHnpGPD/63sH
	pUGd/wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh7-0000000BO9L-2kPF;
	Thu, 26 Jun 2025 11:23:05 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjYh-0000000BFUl-0tUP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:10:20 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6097b1faec9so647628a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750932617; x=1751537417; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TP7OERsBD0AIL6q0/hWWV2FPerGoaJHuU25B69zEssI=;
        b=a1kVlNtUTLVLhegxL0K3qF1+1gyFwMUegPCEh6paC9scj19lbdOS8+fSDC2QyLDcEn
         Yax53b/VTmLq8bTH+PwSDXy9xdbo9BR+7Xf7HPYOxirB+NP55/HfZagP7ucv3mJSKAWd
         R2lZfMbM69HR7gvJgTTicneRUIo4fnVqabhPOGPQyVXDCbOlENjhoogzdBamkMehVdx5
         ez9wJyvGLpOpUmlKn52kdAifaMy2fKjaDKqIAuTEFIkaauIRQTmGWHdnPfq3dauJ95kD
         aC9pfzl8er8JbncX5cxPT3NveIOz/FTMKom0tPAfMSziLWeb/UGBeWBRq/HZO8O3ZmN5
         YMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932617; x=1751537417;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP7OERsBD0AIL6q0/hWWV2FPerGoaJHuU25B69zEssI=;
        b=T7hZoBrur16Le7M6WvjiQDW9PoDzXtGXFVNHfNJfXJlgDvfx5PHXq3GryAapdi4Weg
         4sUsjE68FEz+GRQqtd9nJ2SBFmDN0WmLfncQ0lkBmTdwBkGNQZNLHdomvQ594WBJEfHq
         iiPfbrzGZ4n9x+NZtpscKQUIekVdkdf6IMEDBR6qIGenOFUSLi4KlDVax95kAEgfRFya
         6OXsKwsxoPJyOxolxnl7ws2Tt6+7G3oG/WLgdPf8722nC3jMZ0fzO0intt5iXvaLqytr
         bN7o6VWXe7n3KBietBi0ZGctoKeLeJdU9RkLIljcUV+5ZPaueVj0VX7fiRI+2DF3eJY1
         fSvw==
X-Forwarded-Encrypted: i=1; AJvYcCVidx/G1f2NDrnaPe/DSHWo25G6YH+aV2uNk5U4YiYuGRbEk7XNf6e8r/JI1IEc1Ed2sl5Dpbg0ahd8md0ITeLb@lists.infradead.org
X-Gm-Message-State: AOJu0YyEsSRr/NuywjQhnMYmQpt5516OW0FTPchjHESMy6atgOtRw629
	gX6rSzrAC02yJGXLbYYTBxSUtWLAu6w2JgBN7KLWkGTkXu9+c2mTXbDF/UobRdvOQ2t9Pjc39wy
	Saom3SRBiGg==
X-Google-Smtp-Source: AGHT+IEep39DiT0nAnVXFppD+aWUwOIVpbsw7STELNO8ls+qxpoksuLe5NaSudBMyzv7SiB61C4OREGYZWCw
X-Received: from edvo20.prod.google.com ([2002:a05:6402:394:b0:606:e3fd:b317])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4309:b0:608:48b0:5e88
 with SMTP id 4fb4d7f45d1cf-60c4dd42daamr6239997a12.18.1750932617018; Thu, 26
 Jun 2025 03:10:17 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:10:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626101014.1519345-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Don't free hyp pages with pKVM on GICv2
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_031019_271000_C2E41CAC 
X-CRM114-Status: GOOD (  17.21  )
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

Marc reported that enabling protected mode on a device with GICv2
doesn't fail gracefully as one would expect, and leads to a host
kernel crash.

As it turns out, the first half of pKVM init happens before the vgic
probe, and so by the time we find out we have a GICv2 we're already
committed to keeping the pKVM vectors installed at EL2 -- pKVM rejects
stub HVCs for obvious security reasons. However, the error path on KVM
init leads to teardown_hyp_mode() which unconditionally frees hypervisor
allocations (including the EL2 stacks and per-cpu pages) under the
assumption that a previous cpu_hyp_uninit() execution has reset the
vectors back to the stubs, which is false with pKVM.

Interestingly, host stage-2 protection is not enabled yet at this point,
so this use-after-free may go unnoticed for a while. The issue becomes
more obvious after the finalize_pkvm() call.

Fix this by keeping track of the CPUs on which pKVM is initialized in
the kvm_hyp_initialized per-cpu variable, and use it from
teardown_hyp_mode() to skip freeing pages that are in fact used.

Fixes: a770ee80e662 ("KVM: arm64: pkvm: Disable GICv2 support")
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---

This patch depends on Mostafa's recent fix for teardown_hyp_mode():

  https://lore.kernel.org/kvmarm/20250625123058.875179-1-smostafa@google.com/
---
 arch/arm64/kvm/arm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6bdf79bc5d95..b223d21c063c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2129,7 +2129,7 @@ static void cpu_hyp_init(void *discard)
 
 static void cpu_hyp_uninit(void *discard)
 {
-	if (__this_cpu_read(kvm_hyp_initialized)) {
+	if (!is_protected_kvm_enabled() && __this_cpu_read(kvm_hyp_initialized)) {
 		cpu_hyp_reset();
 		__this_cpu_write(kvm_hyp_initialized, 0);
 	}
@@ -2345,6 +2345,9 @@ static void __init teardown_hyp_mode(void)
 
 	free_hyp_pgds();
 	for_each_possible_cpu(cpu) {
+		if (per_cpu(kvm_hyp_initialized, cpu))
+			continue;
+
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
 
 		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
-- 
2.50.0.727.gbf7dc18ff4-goog


