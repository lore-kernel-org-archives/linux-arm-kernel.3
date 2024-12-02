Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE278E69E85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2cxxiWXxxcztMEpVV39duChyrz4wBjlVuDmGwSaLLQ=; b=nyE4aqRuWvBU7Q2svXiD78S8sg
	pVNu8VYWD0qCl+zLgpJvi2CwiDK/SjBNrsKqG1P+XjH44xSbZ7X7KbEFgbL7in4fAbpvaXBAhit91
	Tb6+OIaHz/6eWDU6Y67kcgmby9OTHx+iYXSBz6lCDxA1oVhn3CC+1sVn5ZxOA5Knk9WlNG+iR0wXf
	svnynyVzHT8/JZXgKop3tOAVp8S2v/VwZoBipbgL6gIIWUrLWwz490rOEoVB1MYHrKy04g+wJUibO
	tBNeVWOxSnW/9dDnFsUpOe3Q9cC2croLEHfQCGHOVyg1EuKtuDwfdB0qAfcTuKRL3+dcmdm6Aiyuo
	CN92zfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBOd-00000007CGc-09Du;
	Mon, 02 Dec 2024 18:43:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7u-00000006zzZ-1nyy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o2cxxiWXxxcztMEpVV39duChyrz4wBjlVuDmGwSaLLQ=; b=fOLrWXxDK61EOMReBZMmvMR+TL
	uWVSN0PWZutEgSOAt6hAzUg7HWJjP5rvH27sC3mL0FqYIYjavz6UXBwr2xIxOoB46C+xqZN659COW
	x2aS5zqMUAzXijEXdnxKaWUcwZ8MHYWyehYaPPzXyXqDnJeoCdeY8M6ST3CoyTPWx6X4bVIap5iyZ
	MniDxKr8+atsbZpBCd+YB+rOOZPQMzVACCjGdEu7WSOe0KpR7SmoRtJ2TJf6+TN+B9hKpLdIrWmF9
	fXxo6INLmnNG8qslfa+bygAewDWrSoa/vVZmtBf3SqWLUeT3L27n1Jz3zk5Mp0zQaFvZK2WhAWrzJ
	AgUMYkHA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7p-00000002D6s-34E4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9CE05C5659;
	Mon,  2 Dec 2024 17:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBEDC4CED2;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160138;
	bh=CGFMUWAc7R/pzG+BdDvL9qb/+zRbaJapu9cFFQKoOsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8KHb45Wq9YzhPKnCSo+9tKf/rlMmZm1JIWGAp2+qbTDUdO1Yv/zGOJ7+8WvUQJby
	 BlLsX0RTj86yKbBWe7BTl12zE4NfD0qiPd4V5XCWfIKWkb5hpLOyKuB37w1uCzeQ+C
	 7RqDH3tc7cA6GQC55cI/8+UrL+yDcdMDkptcUFnO5StCGT0TNv3VpcShUalrU1dk3o
	 y6pnm+ELB0oAsvN2F8JfDsQ5FOQT0j8m03vIH+HQAOpVUtJBeLaDjU9E0MlgiQ1Dvm
	 DrmLkjBr8LIMMPdqzJouOcD7EJ1OsJK9LTc2Mwup61j2PMIxKIhm+A/RtsMrbrqHtl
	 JACZTjkZDfpVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7k-00HQcf-IA;
	Mon, 02 Dec 2024 17:22:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 04/11] KVM: arm64: nv: Use FEAT_ECV to trap access to EL0 timers
Date: Mon,  2 Dec 2024 17:21:27 +0000
Message-Id: <20241202172134.384923-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_149439_2C6DC6C5 
X-CRM114-Status: GOOD (  18.32  )
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

Although FEAT_NV2 makes most things fast, it also makes it impossible
to correctly emulate the timers, as the sysreg accesses are redirected
to memory.

FEAT_ECV addresses this by giving a hypervisor the ability to trap
the EL02 sysregs as well as the virtual timer.

Add the required trap setting to make use of the feature, allowing
us to elide the ugly resync in the middle of the run loop.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c          | 36 +++++++++++++++++++++++++---
 include/clocksource/arm_arch_timer.h |  2 ++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 231040090697e..c9a46d34b40cf 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -781,7 +781,7 @@ static void kvm_timer_vcpu_load_nested_switch(struct kvm_vcpu *vcpu,
 
 static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 {
-	bool tpt, tpc;
+	bool tvt, tpt, tvc, tpc, tvt02, tpt02;
 	u64 clr, set;
 
 	/*
@@ -796,7 +796,29 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 	 * within this function, reality kicks in and we start adding
 	 * traps based on emulation requirements.
 	 */
-	tpt = tpc = false;
+	tvt = tpt = tvc = tpc = false;
+	tvt02 = tpt02 = false;
+
+	/*
+	 * NV2 badly breaks the timer semantics by redirecting accesses to
+	 * the EL0 timer state to memory, so let's call ECV to the rescue if
+	 * available: we trap all CNT{P,V}_{CTL,CVAL,TVAL}_EL0 accesses.
+	 *
+	 * The treatment slightly varies depending whether we run a nVHE or
+	 * VHE guest: nVHE will use the _EL0 registers directly, while VHE
+	 * will use the _EL02 accessors. This translates in different trap
+	 * bits.
+	 *
+	 * None of the trapping is required when running in non-HYP context,
+	 * unless required by the L1 hypervisor settings once we advertise
+	 * ECV+NV in the guest, or that we need trapping for other reasons.
+	 */
+	if (cpus_have_final_cap(ARM64_HAS_ECV) && is_hyp_ctxt(vcpu)) {
+		if (vcpu_el2_e2h_is_set(vcpu))
+			tvt02 = tpt02 = true;
+		else
+			tvt = tpt = true;
+	}
 
 	/*
 	 * We have two possibility to deal with a physical offset:
@@ -836,6 +858,10 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 
 	assign_clear_set_bit(tpt, CNTHCTL_EL1PCEN << 10, set, clr);
 	assign_clear_set_bit(tpc, CNTHCTL_EL1PCTEN << 10, set, clr);
+	assign_clear_set_bit(tvt, CNTHCTL_EL1TVT, clr, set);
+	assign_clear_set_bit(tvc, CNTHCTL_EL1TVCT, clr, set);
+	assign_clear_set_bit(tvt02, CNTHCTL_EL1NVVCT, clr, set);
+	assign_clear_set_bit(tpt02, CNTHCTL_EL1NVPCT, clr, set);
 
 	/* This only happens on VHE, so use the CNTHCTL_EL2 accessor. */
 	sysreg_clear_set(cnthctl_el2, clr, set);
@@ -931,8 +957,12 @@ void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
 	 * accesses redirected to the VNCR page. Any guest action taken on
 	 * the timer is postponed until the next exit, leading to a very
 	 * poor quality of emulation.
+	 *
+	 * This is an unmitigated disaster, only papered over by FEAT_ECV,
+	 * which allows trapping of the timer registers even with NV2.
+	 * Still, this is still worse than FEAT_NV on its own. Meh.
 	 */
-	if (!is_hyp_ctxt(vcpu))
+	if (cpus_have_final_cap(ARM64_HAS_ECV) || !is_hyp_ctxt(vcpu))
 		return;
 
 	if (!vcpu_el2_e2h_is_set(vcpu)) {
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 877dcbb2601ae..c62811fb41309 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -24,6 +24,8 @@
 #define CNTHCTL_ECV			(1 << 12)
 #define CNTHCTL_EL1TVT			(1 << 13)
 #define CNTHCTL_EL1TVCT			(1 << 14)
+#define CNTHCTL_EL1NVPCT		(1 << 15)
+#define CNTHCTL_EL1NVVCT		(1 << 16)
 
 enum arch_timer_reg {
 	ARCH_TIMER_REG_CTRL,
-- 
2.39.2


