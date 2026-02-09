Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610EAE94625
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEJ7Ulo3PlPr4llr+MiZewNknZeKPyCSc/YCs5BCTfM=; b=RCOM9tZRfw2fFq1XKKwI7HDu4G
	HkJuQhy5DL/camxM+FCAQ+vjcSqE4RP1eWZqf1PE5DgVbUvKUrDyr+ak4iJ/fk8lCw+mqFm7UPvX9
	Mxyl8zL3yrfKAFfAAfKyvLNLtyhKq/S2As6gZ4+JZd7JQ1JSPdpAOPs/6gIWtaovv0KxwxupmpFRz
	ijNA8WeuJmbZhrDeTrOb9oeVL4zavVc1seQfAnNs97ZIIJXbmEOv8UkojQy+OMBHSJULxtK85C5VN
	JMijcv67WMhmVJOufVoS7G37Kp2yIRChuIWkdQlNKuuPJZ4tRXuj6m87rxbbm0aoqE9UhzUidbetH
	0t6tIiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwL-0000000G7ZA-1vt7;
	Mon, 09 Feb 2026 22:41:09 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwA-0000000G7NQ-3L5z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:00 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7cfd8a3db9cso29901480a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676855; x=1771281655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eEJ7Ulo3PlPr4llr+MiZewNknZeKPyCSc/YCs5BCTfM=;
        b=JWA3spcxczcAbDbF/qPM33eI0Mu8tobKNj2WypZ721Az1qlgRxiviY9vcZV1c1WfFz
         oEtuWlU/r1OqGgkOG+GLFM4KYGZjGuLFM7/0YHNuzkJFYEWNsd+so0kLlxLtodOpewrl
         XeHrwWo0dxwFArATclfbpfy/8TyYw70kfXP0UbkgLLKzNOZLIJTaUV9kX/A2ejbdNRTe
         cG3ZruG2bWe30fgmIE0D4TYHstaJPCR1uaLLBNWCkX3wYeuz8proD9R/5938syURRmkT
         JnU50LHZQWWmD9gTVn4U5vQ7vfLqOhwNf7IRhAm8QIkC7Y6NDQY9IkkJA5SwZ2FtcUG4
         uI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676855; x=1771281655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEJ7Ulo3PlPr4llr+MiZewNknZeKPyCSc/YCs5BCTfM=;
        b=oFLsB9lATRO28j0xVsDEFlFnM5fFRv3kD1rTdebeOnKBO+SgftDa0qEhCrXwsNQg5F
         M8HHaZ0KPVfFZUONrSo2B+1FPglOF/+izYcSLfEeV8PNVLYdj/v6ZWI7cogde24enjqL
         NKRE3Cexawbqhp0I339pv288StToiiCeueyxAMPG+TjB1oeiQ/ps9x2i0vnM8NzsevPa
         YijLNay2p0u/a3+Wi0FG63f0pGfsQEeFLPuLX94/XCZmCym74JRtf+Anh4ejmJ3/NSS8
         hkcbuDDRXFRrE38iC8sW3oIRV9iHROgkuDfv369aEmq8Xi8A4fTYC/lpXe7wB80Z1UBU
         vWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTbhQ6i3sSwXnOwsQ2a0f2sy3wkdBl4tuFQ21hcQrgcpQehFkP+yab8KyYLAsW9b6rmmV6JJ0EH25a8lCTRu6a@lists.infradead.org
X-Gm-Message-State: AOJu0YxNaVYoitiTKnhVwMUHRYVrgfu0ufIjsSAEH72a1fWTJGh5QUM5
	yEkFe6O0bNEbccR1U3IYhQnQG5XHZe1xSr/4Qq2KCxihTKXwYH0jccpCiJyo47J7l3DqGbnbTot
	9su6BiRMsK1xOP7gswhnVCU8YWA==
X-Received: from jagp12-n1.prod.google.com ([2002:a05:6638:8c:10b0:5ca:3da1:a5c7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1985:b0:662:ffc5:cec9 with SMTP id 006d021491bc7-672fe5b72d4mr49716eaf.40.1770676855676;
 Mon, 09 Feb 2026 14:40:55 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:06 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-12-coltonlewis@google.com>
Subject: [PATCH v6 11/19] KVM: arm64: Context swap Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144058_940415_F3E1FB5E 
X-CRM114-Status: GOOD (  20.35  )
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

Save and restore newly untrapped registers that can be directly
accessed by the guest when the PMU is partitioned.

* PMEVCNTRn_EL0
* PMCCNTR_EL0
* PMSELR_EL0
* PMCR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1

If we know we are not partitioned (that is, using the emulated vPMU),
then return immediately. A later patch will make this lazy so the
context swaps don't happen unless the guest has accessed the PMU.

PMEVTYPER is handled in a following patch since we must apply the KVM
event filter before writing values to hardware.

PMOVS guest counters are cleared to avoid the possibility of
generating spurious interrupts when PMINTEN is written. This is fine
because the virtual register for PMOVS is always the canonical value.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/arm.c        |   2 +
 arch/arm64/kvm/pmu-direct.c | 123 ++++++++++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h       |   4 ++
 3 files changed, 129 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 620a465248d1b..adbe79264c032 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -635,6 +635,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
+	kvm_pmu_load(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
@@ -676,6 +677,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
 	kvm_vcpu_pmu_restore_host(vcpu);
+	kvm_pmu_put(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index f2e6b1eea8bd6..b07b521543478 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -9,6 +9,7 @@
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
 
 /**
  * has_host_pmu_partition_support() - Determine if partitioning is possible
@@ -163,3 +164,125 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 
 	return *host_data_ptr(nr_event_counters);
 }
+
+/**
+ * kvm_pmu_load() - Load untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	unsigned long guest_counters;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest isn't using
+	 * the PMU anyway, so no need to bother with the swap.
+	 */
+	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
+		return;
+
+	preempt_disable();
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
+
+		write_sysreg(i, pmselr_el0);
+		write_sysreg(val, pmxevcntr_el0);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+	write_sysreg(val, pmselr_el0);
+
+	/* Save only the stateful writable bits. */
+	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	mask = ARMV8_PMU_PMCR_MASK &
+		~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
+	write_sysreg(val & mask, pmcr_el0);
+
+	/*
+	 * When handling these:
+	 * 1. Apply only the bits for guest counters (indicated by mask)
+	 * 2. Use the different registers for set and clear
+	 */
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	/* Clear the hardware overflow flags so there is no chance of
+	 * creating spurious interrupts. The hardware here is never
+	 * the canonical version anyway.
+	 */
+	write_sysreg(mask, pmovsclr_el0);
+
+	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	write_sysreg(val & mask, pmcntenset_el0);
+	write_sysreg(~val & mask, pmcntenclr_el0);
+
+	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+	write_sysreg(val & mask, pmintenset_el1);
+	write_sysreg(~val & mask, pmintenclr_el1);
+
+	preempt_enable();
+}
+
+/**
+ * kvm_pmu_put() - Put untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	unsigned long guest_counters;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest is not
+	 * accessing the PMU anyway, so no need to bother with the
+	 * swap.
+	 */
+	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
+		return;
+
+	preempt_disable();
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		write_sysreg(i, pmselr_el0);
+		val = read_sysreg(pmxevcntr_el0);
+
+		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
+	}
+
+	val = read_sysreg(pmselr_el0);
+	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
+
+	val = read_sysreg(pmcr_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
+
+	/* Mask these to only save the guest relevant bits. */
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	val = read_sysreg(pmcntenset_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
+
+	val = read_sysreg(pmintenset_el1);
+	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
+
+	preempt_enable();
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 8fab533fa3ebc..93ccda941aa46 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -100,6 +100,8 @@ void kvm_pmu_host_counters_disable(void);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
@@ -173,6 +175,8 @@ static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
-- 
2.53.0.rc2.204.g2597b5adb4-goog


