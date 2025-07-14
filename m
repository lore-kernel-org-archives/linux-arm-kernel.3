Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFB6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruhxYZHp5lLB8yelcchT9klIB68L+DKTdiF6okoujCY=; b=sXsmwAa4cGgYlgkGCwqh/5Qjxf
	KcF1RsoK6cIDhs4t+p/5bJpaFjJBtyTtXGZhmb2bNpCLkrWSNIWMswLUdrfKeQzIpdkNIWQZJdefa
	r0QgqVGnvIOuoaO+8fmlglzP7d6urfIqS99+u7ne6EQLpfE98Mn0vZVkp0G6By598MUM0MehXE8Qb
	fYAUR0fgvOE2zKbaf0tynEc7jGc6kPsJwyNOoJeEomntVknmHO1aLxIQnQJSkrsZw2VfKMvyXr2Yn
	Br2tmnG1IRaEw+1uaoXoUqssqQXYMAVrNA/Z6yC0cm8cHzqORiYIYV+BStejCCGF0sCrRggbikIT9
	YmnhBWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSXx-00000003XIi-2afT;
	Mon, 14 Jul 2025 23:25:21 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS96-00000003STK-03hC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:41 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86d01ff56ebso829313239f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533979; x=1753138779; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruhxYZHp5lLB8yelcchT9klIB68L+DKTdiF6okoujCY=;
        b=UcGGTpaDSlHsBkfzSVVNSmQ+didnBfykvqyi0MRWCknRhbhzwgD87fhDnlBTvEzShg
         92D2IJRHWWf8qB31lXO5M+jb8alYTSDMYh/4WggNj5bNmT+OAIBcAett2lay4yeedvhj
         oga+unHbd4rbvmY9hv85m54fl1sS6ktts4w1E/nXGzHtUSMVNfqBRFk8YLX98h2hXwsm
         YQxYtKjCRrGYzS8FqPm0diax17cQVAjOxWiNLyvvQ2gfYzn4AY7azbbC/GVUZjxPlc94
         kssqHZPNteBDqRjuS+hB8xT9GgWesU7iS1+iTqbJIpVMwVPxKg4KdlWzXPmBbjVKPZrN
         dkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533979; x=1753138779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruhxYZHp5lLB8yelcchT9klIB68L+DKTdiF6okoujCY=;
        b=ena2lWm3uff/yooE85WxZzTpSN5YPyXpR6Gpeaycki4Ok0/keBc+jgOt2MuuGEikc8
         FIeSNtdBRkBz/GwAyL5Gt1N0XPrv9RSqh2tKCJ1ipLKs32ts+sjiPnXdWf+PGkg+bgtC
         RY+L+Ff0sOEH8noecMh5tMoBtMdiRQJV6IUJntpW+Zzq0x+POpMwaeBld3IEU1gW+F9c
         XKE5jKhgG0OFgoPO4989kQTUzndSoN45twJKaSd4J616dT2GtMt8L1TOrrhOT3yZtrDT
         ZXuo3qHmFuBTRGYn6E1mPEh9odC6tVtkoqywb8nRxwoUb7C0RNcWmslFrf3QqOCOnvI3
         BQFA==
X-Forwarded-Encrypted: i=1; AJvYcCXlQewPHbN4SNq/1E8DnmmcRkZxshlSpVk/WWHhqMHUOc+hnStg3wj/+TooSWWK98H4VUUX82JgZQg77XZtVMb0@lists.infradead.org
X-Gm-Message-State: AOJu0YzlQekuhxIl8ShRgiMixgnJ5rbg3DuOVDARtlNABB8JIZlpplyn
	bIhIDWmZpcq3tVInjMoeq5jHReOCPrHyYdHF+ZXr7BYN4waUWKVjhuinYitX0w3sd+XBETvYDsg
	MoZ8nNJaUFQUa48ILvKA/GheB2A==
X-Google-Smtp-Source: AGHT+IHR2ZhdLDHriP6gMQRHpCn5DY2/9jV0IQOfUZpsLR5icoK2dSXpYkQ3aztL0DPxSOPRUiuKqvoDOj4y5jOVPw==
X-Received: from iov28.prod.google.com ([2002:a05:6602:751c:b0:875:b927:6c0a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:27c1:b0:86d:1218:de96 with SMTP id ca18e2360f4ac-8797886bf8fmr1673502139f.12.1752533979057;
 Mon, 14 Jul 2025 15:59:39 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:03 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-10-coltonlewis@google.com>
Subject: [PATCH v4 09/23] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155940_075107_047B82DB 
X-CRM114-Status: GOOD (  22.30  )
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

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1
* PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMCCFILTR_EL0
* PMICNTR_EL0
* PMICFILTR_EL0
* PMCEIDn_EL0
* PMMIR_EL1

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMIFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/kvm_pmu.h  | 23 ++++++++++++++++++
 arch/arm64/kvm/pmu-direct.c       | 32 +++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 39 +++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f705eb4538c3..463dbf7f0821 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1347,6 +1347,7 @@ int __init populate_sysreg_config(const struct sys_reg_desc *sr,
 				  unsigned int idx);
 int __init populate_nv_trap_config(void);
 
+void kvm_calculate_pmu_traps(struct kvm_vcpu *vcpu);
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
 
 /* MMIO helpers */
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 6328e90952ba..73b7161e3f4e 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -94,6 +94,21 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+#if !defined(__KVM_NVHE_HYPERVISOR__)
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
+#else
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+#endif
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -133,6 +148,14 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 22e9b2f9e7b6..2eef77e8340d 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -40,6 +40,38 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 		pmu->hpmn_max <= *host_data_ptr(nr_event_counters);
 }
 
+/**
+ * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
+ * @vcpu: Pointer to kvm_vcpu struct
+ *
+ * Determine if given VCPU has a partitioned PMU by extracting that
+ * field and passing it to :c:func:`kvm_pmu_is_partitioned`
+ *
+ * Return: True if the VCPU PMU is partitioned, false otherwise
+ */
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu);
+}
+
+/**
+ * kvm_vcpu_pmu_use_fgt() - Determine if we can use FGT
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if we can use FGT for direct access to registers. We can
+ * if capabilities permit the number of guest counters requested.
+ *
+ * Return: True if we can use FGT, false otherwise
+ */
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
+
+	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
+		cpus_have_final_cap(ARM64_HAS_FGT) &&
+		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..b3f97980b11f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5212,6 +5212,43 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_TTLBOS;
 }
 
+
+/**
+ * kvm_calculate_pmu_traps() - Calculate fine grain traps for partitioned PMU
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate which registers still need to be trapped when the
+ * partitioned PMU is available, leaving others untrapped.
+ *
+ * Because this is only recalculated when the VCPU runs on a new
+ * thread, the trap bits should be set iff the partitioned PMU is
+ * supported whether or not it is currently enabled. If it is not
+ * enabled, this doesn't matter because every PMU access is trapped by
+ * MDCR_EL2.TPM anyway.
+ */
+void kvm_calculate_pmu_traps(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!kvm_pmu_partition_supported() ||
+	    !cpus_have_final_cap(ARM64_HAS_FGT))
+		return;
+
+	kvm->arch.fgt[HDFGRTR_GROUP] |=
+		HDFGRTR_EL2_PMOVS
+		| HDFGRTR_EL2_PMCCFILTR_EL0
+		| HDFGRTR_EL2_PMEVTYPERn_EL0
+		| HDFGRTR_EL2_PMCEIDn_EL0
+		| HDFGRTR_EL2_PMMIR_EL1;
+
+	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
+		return;
+
+	kvm->arch.fgt[HDFGRTR2_GROUP] |=
+		HDFGRTR2_EL2_nPMICFILTR_EL0
+		| HDFGRTR2_EL2_nPMICNTR_EL0;
+}
+
 void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -5232,6 +5269,8 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	compute_fgu(kvm, HFGITR2_GROUP);
 	compute_fgu(kvm, HDFGRTR2_GROUP);
 
+	kvm_calculate_pmu_traps(vcpu);
+
 	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.50.0.727.gbf7dc18ff4-goog


