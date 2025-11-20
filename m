Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA27CF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFZgrflRGdfVZnryfo5K8sUNm2py5aSRd9bVtScjX3U=; b=QnybUYpE3sluZdfP4bHz7hAhX1
	VV5t+xypxLl6DYOTsDTds/e/7YDT+LLLoE/4HMd1t6oVMMq/3LUqeOGsldh4Gsqnk3f8G2EQ1gTl4
	hTr/427+++Y8TBS4fvz/4x37QnQk5vG9fDwAEXMa29sih0gYvwRbjzmaKNbdWYnmnhS79R5kGzGjn
	KuOwAs4yqUWfw9F5jdCMzFHicRhg5oS6wPfhgvddBE0dPHkyC08ZXsZIgdLoeptid6MOcJp1n7JKq
	eN41AmefVEsg/Jxvx4pmcVfbylYUN9sR3LDlgOf0f52z1msR3oB7etIsIS1bHfW6PN+JgHVtjRRog
	A7KzcBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8SZ-000000078vS-3AF4;
	Thu, 20 Nov 2025 17:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075kX-3JNZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vFZgrflRGdfVZnryfo5K8sUNm2py5aSRd9bVtScjX3U=; b=pq9VkQYM7pY55WtaXN2WACyWB9
	P9bNLp4ZF7zNZIHzjsaX2tSx50M192UwXXKdbEN5C6GZhbHYnZK9YjdzOVSHINR/CZdm73NvEzDUz
	LvfKg1KfWPnk4B6WkxCa4BzNQl57fRN3fj3nxLojxQN+iDbmK8BvTAky5KDDvZPyngasM1pspVQgM
	GvVRiN4JDsQAS49COL9ApuvLWl38D0VjoieP6o2S+k8KPrLRvVUnqx20P7PRSAe0dBY1BeixBxd9f
	EtNH34baHtx8QdiZpm7mAybiBeu7XNTelCmz3oYsLbXCaHA3+SMO4RSBRBkFD4/vVtIiF2xHgcck5
	D9/eoiCA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YP-0000000F6ez-1QWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3A07443A8;
	Thu, 20 Nov 2025 17:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A41C16AAE;
	Thu, 20 Nov 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659560;
	bh=uN25PyZmLxLd1uaBG1a1EPGhXudkFWWjIuu0rwezTYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OBazEZjn61SeD8odkKM9bE6g3SBJAIoVLSQFoba7HBoVC11CtFkk7pWx5P6pj7PCS
	 6OXgJG8Zo+pFKkcIDJWgsfqI+G7h0T+27k/GuccXhVRvaJU2yf7ECbf2NlvtwBbgck
	 zsLfHE6yr7dkaPAFCNictqVjr6jF7kl0Jw3MrOrkvX7DlAraffXiwKXQPTUp1xe0R/
	 cSFwUKbhPEwgSyeBYxTbT79c6dY3nw90hcUArsE90jYnjp7IL4Dtki7BBnX87mMAZE
	 9KUZWARMd+rgczGqrBIkLIwGZiKA6fAcqdJk8cepbiTsYVZlphjBnSQmAKZmQBT/Pd
	 TJsi6lc5tIvnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pu-00000006y6g-2xlc;
	Thu, 20 Nov 2025 17:25:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 20/49] KVM: arm64: Eagerly save VMCR on exit
Date: Thu, 20 Nov 2025 17:25:10 +0000
Message-ID: <20251120172540.2267180-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_163043_288417_6D1A5D1C 
X-CRM114-Status: GOOD (  16.94  )
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

We currently save/restore the VMCR register in a pretty lazy way
(on load/put, consistently with what we do with the APRs).

However, we are going to need the group-enable bits that are backed
by VMCR on each entry (so that we can avoid injecting interrupts for
disabled groups).

Move the synchronisation from put to sync, which results in some minor
churn in the nVHE hypercalls to simplify things.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h     |  2 +-
 arch/arm64/include/asm/kvm_hyp.h     |  2 +-
 arch/arm64/kvm/arm.c                 |  3 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  7 ++++---
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 15 +++------------
 arch/arm64/kvm/vgic/vgic-v2.c        |  2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c |  2 +-
 arch/arm64/kvm/vgic/vgic-v3.c        |  2 +-
 8 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 9da54d4ee49ee..f8adbd535b4ae 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,7 +79,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
-	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_vmcr_aprs,
+	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index e6be1f5d0967f..dbf16a9f67728 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -82,7 +82,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if);
-void __vgic_v3_save_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
+void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
 int __vgic_v3_perform_cpuif_access(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a74..733195ef183e1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -659,8 +659,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	if (is_protected_kvm_enabled()) {
-		kvm_call_hyp(__vgic_v3_save_vmcr_aprs,
-			     &vcpu->arch.vgic_cpu.vgic_v3);
+		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
 		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
 	}
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 29430c031095a..a7c689152f686 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -157,6 +157,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
 	host_cpu_if->vgic_hcr		= hyp_cpu_if->vgic_hcr;
+	host_cpu_if->vgic_vmcr		= hyp_cpu_if->vgic_vmcr;
 	for (i = 0; i < hyp_cpu_if->used_lrs; ++i)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
@@ -464,11 +465,11 @@ static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 	__vgic_v3_init_lrs();
 }
 
-static void handle___vgic_v3_save_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
+static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
 
-	__vgic_v3_save_vmcr_aprs(kern_hyp_va(cpu_if));
+	__vgic_v3_save_aprs(kern_hyp_va(cpu_if));
 }
 
 static void handle___vgic_v3_restore_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
@@ -616,7 +617,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
 	HANDLE_FUNC(__kvm_flush_cpu_context),
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
-	HANDLE_FUNC(__vgic_v3_save_vmcr_aprs),
+	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__pkvm_reserve_vm),
 	HANDLE_FUNC(__pkvm_unreserve_vm),
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 2509b52bbd629..cafbb41b4c334 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -235,6 +235,8 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 		}
 	}
 
+	cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
+
 	if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
 		u64 val = read_gicreg(ICH_HCR_EL2);
 		cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
@@ -332,10 +334,6 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
 {
 	u64 val;
 
-	if (!cpu_if->vgic_sre) {
-		cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
-	}
-
 	/* Only restore SRE if the host implements the GICv2 interface */
 	if (static_branch_unlikely(&vgic_v3_has_v2_compat)) {
 		val = read_gicreg(ICC_SRE_EL2);
@@ -357,7 +355,7 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
 		write_gicreg(0, ICH_HCR_EL2);
 }
 
-static void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if)
+void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if)
 {
 	u64 val;
 	u32 nr_pre_bits;
@@ -518,13 +516,6 @@ static void __vgic_v3_write_vmcr(u32 vmcr)
 	write_gicreg(vmcr, ICH_VMCR_EL2);
 }
 
-void __vgic_v3_save_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if)
-{
-	__vgic_v3_save_aprs(cpu_if);
-	if (cpu_if->vgic_sre)
-		cpu_if->vgic_vmcr = __vgic_v3_read_vmcr();
-}
-
 void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if)
 {
 	__vgic_v3_compat_mode_enable();
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 5a2165a8d22c0..07e93acafd04d 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -451,6 +451,7 @@ void vgic_v2_save_state(struct kvm_vcpu *vcpu)
 	if (!base)
 		return;
 
+	cpu_if->vgic_vmcr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_VMCR);
 
 	if (used_lrs)
 		save_lrs(vcpu, base);
@@ -495,6 +496,5 @@ void vgic_v2_put(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v2_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v2;
 
-	cpu_if->vgic_vmcr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_VMCR);
 	cpu_if->vgic_apr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_APR);
 }
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 1fc9e0780abe6..1531e4907c652 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -340,7 +340,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	u64 val;
 	int i;
 
-	__vgic_v3_save_vmcr_aprs(s_cpu_if);
+	__vgic_v3_save_aprs(s_cpu_if);
 	__vgic_v3_deactivate_traps(s_cpu_if);
 	__vgic_v3_save_state(s_cpu_if);
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index bcce7f35a6d67..5b276e303aab2 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -815,7 +815,7 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
 	}
 
 	if (likely(!is_protected_kvm_enabled()))
-		kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);
+		kvm_call_hyp(__vgic_v3_save_aprs, cpu_if);
 	WARN_ON(vgic_v4_put(vcpu));
 
 	if (has_vhe())
-- 
2.47.3


