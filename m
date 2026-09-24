Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52596C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpMA8Bt3nlKlM2NP5rgCGn6shCTfzUIqi6x5MzUvxRQ=; b=N9fMKWl80X9Fs6Ne+BHc8g9KpV
	deifSvCQEChwm/JvOWzLfmkMR1W9gajphDRQBySz3dFv9kObsFg50BonyXaz+Y9QmkdpPVs1S3XKo
	ZnRkOujtvhms/sUmaIOZEjbUZI/dHnYdU5MPHHYDCPIwZbbtFyJJpkp2bdgeFbfjB6PUBqhD2nEqF
	jW0799XY38zjbgNNp0ZN8US9LVXvEi7MNdR6FUVyV80akSl7PJ7gH33B81zPdssBIeDiMui4LSklN
	pt0P3c0rOeIYyr90Y13IJUIcrohORawljTeXgWq/5tu13HBYSR18ENDGAIn/u+Qhss4GyBmEpSzR9
	q5CGSazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHt-0000000Bkul-0acC;
	Thu, 24 Sep 2026 17:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGq-0000000BkK8-21zA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 17:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QpMA8Bt3nlKlM2NP5rgCGn6shCTfzUIqi6x5MzUvxRQ=; b=EHc7HEEfCo4u6NAa8fNe6cR3+h
	Civ3ZObyYcmE7fd6YwxAqp+WPzOkS7mW9+WUQQ6Swx9/c88IT5vgYFf09r17+d+R6wajhhCffMoXR
	cuRAaXbz5Xg98TeBOh9PzBGO7r0Akx+TqrFZBvpyFvo36KqzFJ7Rx+UXNuVHB0E42EJdh6uugNTce
	TPTRLZp58ApgbR5fNaiLRWTXgCdRQpcWTlaZN2rGkIcYBGHUyfuSAVgl9Nf6mzaTtzBwki2D9q08/
	vQdOprq3zxRRih/vSSadhRrn912BvUSOn+e6va0KFuJcj3f7oFbQqzzKWHFpcXTvxEl/S1L8FsPPA
	rXxxDzFg==;
Received: from mail-oa1-x46.google.com ([2001:4860:4864:20::46])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nGk-0000000GFNZ-3mjP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:30:07 +0000
Received: by mail-oa1-x46.google.com with SMTP id 586e51a60fabf-46509ab0149so144827fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271001; x=1790875801; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpMA8Bt3nlKlM2NP5rgCGn6shCTfzUIqi6x5MzUvxRQ=;
        b=np3pc9FYq1i6/4qndJlZAW8nObYM+8+vXIO3Yj00iVyug/UJjwSPsZ9S6PFXUvroDL
         9HkIKj0lTO0Y0n+w7qDHOK+dz379toCQ7KvqyxekJZZV+00HZRQdJhMVnLJXzkef0b0o
         NfG99jyA+dy5AU8z5JDeR1XDeICtwkt0jjaJbS1IETQULbDMzqcIRHFKA2qCDAAKX1Yb
         riEEkIddBdBn7CI8G5Pv5s8GAO9UZqQ6TuI9VUfLXOojpmV1LfxVAH0OQN3Zw85B7O9C
         VmeH/7SpcVFEeaOTb8OxPIw57fCtVq45XuMSMeEB04BLNNefSEBM4KOFw9tgIjUMENsl
         BoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271001; x=1790875801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpMA8Bt3nlKlM2NP5rgCGn6shCTfzUIqi6x5MzUvxRQ=;
        b=h7sP02xDA66GFMaWWKc4/AALfW5keeIbvvdtEQdvuz+BFuoqsCBwVMI9Xhz7Nd+HwI
         YMLPWIZDY08hdzx5gWENnpS56xrKPmeTbO+aLGVGvEVnFzqrvBpniwjkshD89MzitYwk
         OaTdd+abPOt+RmP555sxDEivknWaIXAO4yaqX1ILFQQ8MO9WTEe9Pmn99VECuBw4cXDn
         3t7/6jKLlVA1A83AtJVF3au/YmyiEo/56nCck0eND+cyx/n9aaHCy/Z+0IsN+DwMRIvo
         4zdPbtJJexsD9PnPnl6hl26mUbZxdgdsW6XICkrT0mKlZPS+SWlAgiUkJ06L6lyGPjUa
         DTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBztjrMlYra6GHsPR8YIEKkzBdFPl79tu6TROvN3n+r1hRd9V0g+WLJA5iMIdVyML02QIRXgGo8QuDuXhNi4Ou4E@lists.infradead.org
X-Gm-Message-State: AFuF++n+NnphTSWB9QIWSviobljvMdSDlZ2NlO/xImKHDmgyI7GvtL6f
	MQXgPYJMJzJmwQdJHAIY1ckPvhYD3M6czAvdwi6igUcpjbjGjgRGfKkAvMReD0fmg4kJkeKMcyK
	twvYj1mVtTomJ4g7SI9dpvk3CbA==
X-Received: from ilbem2-n1.prod.google.com ([2002:a05:6e02:2802:10b0:50d:83de:1b53])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f0f:b0:4d6:9153:2966 with SMTP id 5614622812f47-4d72b733d4amr3963904b6e.55.1790271000469;
 Thu, 24 Sep 2026 10:30:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:26 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-21-coltonlewis@google.com>
Subject: [PATCH v9 20/22] KVM: arm64: Add vCPU device attr to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_183003_098030_A14D67EF 
X-CRM114-Status: GOOD (  28.04  )
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

Add the KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION vCPU device attribute to
enable a Partitioned PMU for a VM where PMUv3 and VHE are supported.

When partitioning is enabled (tracked via
KVM_ARCH_FLAG_PARTITION_PMU_ENABLED), userspace must explicitly
configure the number of guest event counters via
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS with a value strictly less than the
maximum number of general-purpose counters implemented by the PMU (or
0 only when FEAT_HPMN0 is supported), leaving at least one
general-purpose counter reserved for host profiling prior to calling
KVM_ARM_VCPU_PMU_V3_INIT.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 Documentation/virt/kvm/devices/vcpu.rst | 42 ++++++++++++++-
 arch/arm64/include/asm/kvm_host.h       |  1 +
 arch/arm64/include/uapi/asm/kvm.h       |  2 +
 arch/arm64/kvm/pmu.c                    | 71 ++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c               |  5 +-
 5 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index deb5c51bc00c8..fb5921ed9dea2 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -57,6 +57,9 @@ Returns:
                   hardware PMU, or interrupt number not set (non-GICv5
                   guests, only)
 	 -EBUSY   PMUv3 already initialized
+	 -EINVAL  Partitioning enabled without explicitly configuring
+		  fewer than max_counters via
+		  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS
 	 =======  ======================================================
 
 Request the initialization of the PMUv3.  If using the PMUv3 with an in-kernel
@@ -162,7 +165,8 @@ the cpu field to the processor id.
 	 -EFAULT  Error accessing the value pointed to by addr
 	 -ENODEV  PMUv3 not supported or GIC not initialized
 	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
-	 	  range
+	 	  range (or N >= max_counters when partitioning is
+		  enabled)
 	 =======  ====================================================
 
 Set the number of implemented event counters in the virtual PMU. This
@@ -172,6 +176,42 @@ explicitly selected, or the number of counters is out of range for the
 selected PMU. Selecting a new PMU cancels the effect of setting this
 attribute.
 
+1.6 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION
+---------------------------------------------------
+
+:Parameters: in kvm_device_attr.addr the address to an unsigned int (u32)
+	     boolean value (non-zero to enable PMU partitioning, 0 to disable)
+
+:Returns:
+
+	 =======  ========================================================
+	 -EBUSY   PMUv3 already initialized or a VCPU has already run
+	 -EFAULT  Error accessing the value pointed to by addr
+	 -ENODEV  KVM_ARM_VCPU_PMU_V3 feature missing from VCPU
+	 -EPERM   Host hardware or kernel configuration does not support
+		  PMU partitioning (requires ARM64 VHE mode and PMUv3)
+	 -EINVAL  No PMUv3 associated with the VM, or
+		  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS was already set to
+		  >= max_counters
+	 -ENXIO   Returned by KVM_HAS_DEVICE_ATTR when PMU partitioning is
+		  unsupported on host hardware
+	 =======  ========================================================
+
+Enable or disable hardware PMU partitioning for the VM. When enabled, physical
+PMUv3 hardware counters are partitioned between the guest and host using
+MDCR_EL2.HPMN (and FEAT_FGT fine-grained traps when supported by hardware).
+This grants the guest direct, untrapped EL0/EL1 hardware access to event
+counters 0..HPMN-1 and the cycle counter (PMCCNTR_EL0).
+
+When PMU partitioning is enabled, userspace must explicitly configure the
+number of guest event counters via KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS with a
+value strictly less than the maximum number of general-purpose counters
+implemented by the PMU (leaving at least one general-purpose counter reserved
+for host profiling) prior to calling KVM_ARM_VCPU_PMU_V3_INIT. Note that
+KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS configures general-purpose event counters
+(PMCR_EL0.N / MDCR_EL2.HPMN); the dedicated cycle counter (PMCCNTR_EL0) is
+unconditionally assigned to the guest partition when partitioning is enabled.
+
 2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
 =================================
 
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8dff576667d10..6180b977d8965 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -388,6 +388,7 @@ struct kvm_arch {
 
 	/* Maximum number of counters for the guest */
 	u8 nr_pmu_counters;
+	bool pmu_nr_counters_specified;
 
 	/* PMMIR_EL1.SLOTS value exposed to the guest. */
 	u8 pmmir_slots;
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 019e5e3d892e6..9d38090eb5e71 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -438,6 +438,8 @@ enum {
 #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
 #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
 #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
+#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
+
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 4a3c6600b2678..31e46a5e937c7 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -505,6 +505,14 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		unsigned int max_counters = kvm_arm_pmu_get_max_counters(vcpu->kvm);
+
+		if (!vcpu->kvm->arch.pmu_nr_counters_specified ||
+		    vcpu->kvm->arch.nr_pmu_counters >= max_counters)
+			return -EINVAL;
+	}
+
 	init_irq_work(&vcpu->arch.pmu.overflow_work,
 		      kvm_pmu_perf_overflow_notify_vcpu);
 
@@ -591,11 +599,25 @@ static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
 	}
 }
 
+static bool kvm_arm_pmu_any_vcpu_created(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (vcpu->arch.pmu.created)
+			return true;
+	}
+
+	return false;
+}
+
 static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
 {
 	lockdep_assert_held(&kvm->arch.config_lock);
 
 	kvm->arch.arm_pmu = arm_pmu;
+	kvm->arch.pmu_nr_counters_specified = false;
 	kvm_arm_set_nr_counters(kvm, kvm_arm_pmu_get_max_counters(kvm));
 }
 
@@ -642,6 +664,11 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 				break;
 			}
 
+			if (kvm_arm_pmu_any_vcpu_created(kvm)) {
+				ret = (kvm->arch.arm_pmu == arm_pmu) ? 0 : -EBUSY;
+				break;
+			}
+
 			kvm_arm_set_pmu(kvm, arm_pmu);
 			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
 
@@ -667,14 +694,26 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
 {
 	struct kvm *kvm = vcpu->kvm;
+	unsigned int max_counters;
+
+	if (kvm_vm_has_ran_once(kvm) ||
+	    (kvm_arm_pmu_any_vcpu_created(kvm) &&
+	     (!kvm->arch.pmu_nr_counters_specified ||
+	      kvm->arch.nr_pmu_counters != n)))
+		return -EBUSY;
 
 	if (!kvm->arch.arm_pmu)
 		return -EINVAL;
 
-	if (n > kvm_arm_pmu_get_max_counters(kvm))
+	max_counters = kvm_arm_pmu_get_max_counters(kvm);
+	if (n > max_counters)
+		return -EINVAL;
+
+	if (kvm_pmu_is_partitioned(kvm) && n >= max_counters)
 		return -EINVAL;
 
 	kvm_arm_set_nr_counters(kvm, n);
+	kvm->arch.pmu_nr_counters_specified = true;
 	return 0;
 }
 
@@ -786,6 +825,31 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
 	}
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
+		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
+		u32 val;
+
+		if (get_user(val, uaddr))
+			return -EFAULT;
+
+		if (!has_kvm_pmu_partition_support())
+			return -EPERM;
+
+		if (kvm_vm_has_ran_once(kvm) ||
+		    (kvm_arm_pmu_any_vcpu_created(kvm) &&
+		     kvm_pmu_is_partitioned(kvm) != !!val))
+			return -EBUSY;
+
+		if (!kvm->arch.arm_pmu)
+			return -EINVAL;
+
+		if (val && kvm->arch.pmu_nr_counters_specified &&
+		    kvm->arch.nr_pmu_counters >= kvm_arm_pmu_get_max_counters(kvm))
+			return -EINVAL;
+
+		kvm_pmu_partition_enable(kvm, val);
+		return 0;
+	}
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 		return kvm_arm_pmu_v3_init(vcpu);
 	}
@@ -827,6 +891,11 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
 		if (kvm_vcpu_has_pmu(vcpu))
 			return 0;
+		break;
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
+		if (kvm_vcpu_has_pmu(vcpu) && has_kvm_pmu_partition_support())
+			return 0;
+		break;
 	}
 
 	return -ENXIO;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 20c46ef705d30..a4779593c4f8d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1756,7 +1756,10 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
 	    !kvm_vcpu_has_pmuv3_strict(vcpu) &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    !kvm->arch.pmu_nr_counters_specified &&
+	    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
+	    (!kvm_pmu_is_partitioned(kvm) ||
+	     new_n < kvm_arm_pmu_get_max_counters(kvm)))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.56.0.rc1.310.g51773c2048-goog


