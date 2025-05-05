Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D7AC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHUmRqC710I5Zczb2Gv8+GrvF7PyHiekDQRANAyhxgo=; b=tF9jYVb3ZLicpP0uTwtiAxik1Z
	4r6JIqni0IkOOK3RnEoO1gES1wCqUEBudUt/STlGyG3zgPWMt8XVwZfRor9n7sSugdMFRZ0UmyMrb
	8b8fXhQ4x2zMhQ/6hZXjOa7eXXmNaKMWHsaHydz6urV69iVSTT7yokDjDggNHhaYBIjujhQ3O+JSJ
	XPmtDq4KvFOvV4QaFSZQCy98jhaApLxr0rxz66mqIHloMBTOXBCUT59NK7C+9X8aBZRVbcaB7Y3A9
	pd0t/PSFkPJJpzXOkqognBJImNXA4TthzS/0j26TsB+Qvzq/j8a4qgS8CM9UlZRzImWTQfToHY1yc
	9HVWeD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByi2-00000007zUq-1o7A;
	Mon, 05 May 2025 16:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySX-00000007wML-1R9Z
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 16:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YHUmRqC710I5Zczb2Gv8+GrvF7PyHiekDQRANAyhxgo=; b=ENF+b/NVpH0t8iTRnz+sNLs0xA
	zDzijdfF2qiX4PEstLuCUJpFeSShjZszp9xXEGoOc5tnO2JOs4j2AuH8aoLVq/rWIxm+U0aX1VtYs
	jMiPulh0z3rGE9gBrnl8NQWhHzgHpuhC5U+U+5Y1Q63O1oUgrBMeOuJaLx4EUMJYROeVnxhzMqnU6
	WxObsJmjKBptn5a2rbz+Ae618Fqwi6z2Xn/aU/qxPEzsjTuHJpSUl9oaAsdU2rET7BF/zDKP3hESS
	Nz7IoC76/If+wGJkZB+eELtHHyb6iLGLUoZ4la9mfHU6fiSjbfEDHphASTp0ki/nOjVcAl0/196TU
	HWal1loA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uBySS-0000000FVjN-1rn5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:23 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-739525d4d7bso3095360b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461657; x=1747066457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHUmRqC710I5Zczb2Gv8+GrvF7PyHiekDQRANAyhxgo=;
        b=YKnT9TXD6EwHMx9xBch8XJPR3+4zOvTWiL2bVY8AwAAVDZgaE55p9dU5cFQitWgTQn
         2UKTXAj6VdIY1gZ4sprrh1v2LUUJGsE6auftNAnModHurB1RQMiOtXWncSO9zGvjJBKB
         v5tJDdTHhyDgC6GYb6saKeYXlNEmcXVf95850yYRxGscRisQlMC2TmwVhyFnO2X72GP9
         OBSUBujFpREcqD8N4dd9MM4yng0iBKTthHVkqolEDIebpwj/V5wb7O6mww6s/EfezaXQ
         RresBQk38vjIFQMbP/9vM/+IWap8BDDeF13GNSOXik+pBKGBk2Zhr19tQLxZo1w59nP5
         Sbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461657; x=1747066457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHUmRqC710I5Zczb2Gv8+GrvF7PyHiekDQRANAyhxgo=;
        b=t2/vngxfHY+ZTBSuRNlbtg3cdQHMU/ICFUMz8ECmIvUIaBSnIn5h0Xj1m1jtPH5XiN
         4ndY9xELsFhorV+4fiMToHE7VRTWcx4H+S4aVjXynVeN3CUJncs5+65u9M2RY8c0pQSY
         ZDIePyQwV5N6QTaQXFkgh4QdGyLkYIGVQDUobzWBxDv8QM1UMgp09hrGgGcfrHrfFrAe
         1HGnCeQ2yobliv/gLXUbp/OJZiDwTc2rOm88ke5G2zrczMIbjrIvTh3TDUkeEyACYlCe
         ld7SvcRwDU6Ykg8nfH2btrEUFMZU052K1lvC75gY5E+akNcy9eE0WaiGsuL1Vu1PGTeS
         BywA==
X-Forwarded-Encrypted: i=1; AJvYcCXU/k/yTqNq6jFbNlcsLxooioXfr9TEKjTijskcgFNZ9momg/zgf3TfpQVcdqsXhFGhHWpkgLoXtCAHQAWR3l9W@lists.infradead.org
X-Gm-Message-State: AOJu0YwvM2uOlUYaW8ayT5vmrbVKBZvJTVPMZVd6qmhJIKGZoT7ncrkn
	6XmNjNXbZKkIdl3To3F89XTm+2a7m3ZHDbNfgBsK96cEUuHkT4Sa2Ywt4wT++xBCN6cZFuyeMTs
	a037Idy+GUA==
X-Google-Smtp-Source: AGHT+IGpv50Wz1FmfbCrQKvOYpNfJ4AHoIP5XJSc/cts11lJ70nVyGRkWYp/qqNzmDSatbGKe3GytAHP4hN+Uw==
X-Received: from pfhp37.prod.google.com ([2002:a05:6a00:a25:b0:740:813:f7bb])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1bca:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-7406f1769bemr10644622b3a.19.1746461657217;
 Mon, 05 May 2025 09:14:17 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:07 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-2-jiaqiyan@google.com>
Subject: [PATCH v1 1/6] KVM: arm64: VM exit to userspace to handle SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_171420_776127_65B618A7 
X-CRM114-Status: GOOD (  29.76  )
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

When APEI fails to handle a stage2 abort that is synchrnous external
abort (SEA), today KVM directly injects an async SError to the VCPU
then resumes it, which usually results in unpleasant guest kernel panic.

One major situation of guest SEA is when vCPU consumes recoverable
uncorrected memory error (UER). Although SError and guest kernel panic
effectively stops the propagation of corrupted memory, there is still
room to recover from memory UER in a more graceful manner.

Alternatively KVM can redirect the synchronous SEA event to VMM to
- Reduce blast radius if possible. VMM can inject a SEA to VCPU via
  KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
  consumption or fault is not from guest kernel, blast radius can be
  limited to the triggering thread in guest userspace, so VM can
  keep running.
- VMM can protect from future memory poison consumption by unmapping
  the page from stage-2 with KVM userfault [1]. VMM can also
  track SEA events that VM customer cares about, restart VM when
  certain number of distinct poison events happened, provide
  observability to customers [2].

Introduce following userspace-visible features to make VMM handle SEA:
- KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
  when host APEI fails to claim a SEA, userspace can opt in this new
  capability to let KVM exit to userspace during synchronous abort.
- KVM_EXIT_ARM_SEA. A new exit reason is introduced for this, and
  KVM fills kvm_run.arm_sea with as much as possible information about
  the SEA, including
  - ESR_EL2.
  - If faulting guest virtual and physical addresses are available.
  - Faulting guest virtual address if available.
  - Faulting guest physical address if available.

[1] https://lpc.events/event/18/contributions/1757/attachments/1442/3073/LPC_%20KVM%20Userfault.pdf
[2] https://cloud.google.com/solutions/sap/docs/manage-host-errors

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 12 +++++++
 arch/arm64/include/asm/kvm_host.h    |  8 +++++
 arch/arm64/include/asm/kvm_ras.h     | 21 ++++-------
 arch/arm64/kvm/Makefile              |  3 +-
 arch/arm64/kvm/arm.c                 |  5 +++
 arch/arm64/kvm/kvm_ras.c             | 54 ++++++++++++++++++++++++++++
 arch/arm64/kvm/mmu.c                 | 12 ++-----
 include/uapi/linux/kvm.h             | 11 ++++++
 8 files changed, 101 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/kvm/kvm_ras.c

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index bd020fc28aa9c..a9de30478a088 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -429,6 +429,18 @@ static __always_inline bool kvm_vcpu_abt_issea(const struct kvm_vcpu *vcpu)
 	}
 }
 
+/* Return true if FAR holds valid faulting guest virtual address. */
+static inline bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu)
+{
+	return !(kvm_vcpu_get_esr(vcpu) & ESR_ELx_FnV);
+}
+
+/* Return true if HPFAR_EL2 holds valid faulting guest physical address. */
+static inline bool kvm_vcpu_sea_ipa_valid(const struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.fault.hpfar_el2 & HPFAR_EL2_NS;
+}
+
 static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 73b7762b0e7d1..e0129f9799f80 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -342,6 +342,14 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
 	/* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace */
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
+	/*
+	 * When APEI failed to claim stage-2 synchronous external abort
+	 * (SEA) return to userspace with fault information. Userspace
+	 * can opt in this feature if KVM_CAP_ARM_SEA_TO_USER is
+	 * supported. Userspace is encouraged to handle this VM exit
+	 * by injecting a SEA to VCPU before resume the VCPU.
+	 */
+#define KVM_ARCH_FLAG_RETURN_SEA_TO_USER		11
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/kvm_ras.h
index 9398ade632aaf..a2fd91af8f97e 100644
--- a/arch/arm64/include/asm/kvm_ras.h
+++ b/arch/arm64/include/asm/kvm_ras.h
@@ -4,22 +4,15 @@
 #ifndef __ARM64_KVM_RAS_H__
 #define __ARM64_KVM_RAS_H__
 
-#include <linux/acpi.h>
-#include <linux/errno.h>
-#include <linux/types.h>
-
-#include <asm/acpi.h>
+#include <linux/kvm_host.h>
 
 /*
- * Was this synchronous external abort a RAS notification?
- * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
+ * Handle stage2 synchronous external abort (SEA) in the following order:
+ * 1. Delegate to APEI/GHES and if they can claim SEA, resume guest.
+ * 2. If userspace opt-ed in KVM_CAP_ARM_SEA_TO_USER, exit to userspace
+ *    with details about the SEA.
+ * 3. Otherwise, inject async SError into the VCPU and resume guest.
  */
-static inline int kvm_handle_guest_sea(void)
-{
-	/* apei_claim_sea(NULL) expects to mask interrupts itself */
-	lockdep_assert_irqs_enabled();
-
-	return apei_claim_sea(NULL);
-}
+int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 
 #endif /* __ARM64_KVM_RAS_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 209bc76263f10..785d568411e88 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -23,7 +23,8 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v3.o vgic/vgic-v4.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
-	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
+	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
+	 kvm_ras.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 19ca57def6292..47544945fba45 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -133,6 +133,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		}
 		mutex_unlock(&kvm->lock);
 		break;
+	case KVM_CAP_ARM_SEA_TO_USER:
+		r = 0;
+		set_bit(KVM_ARCH_FLAG_RETURN_SEA_TO_USER, &kvm->arch.flags);
+		break;
 	default:
 		break;
 	}
@@ -322,6 +326,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
+	case KVM_CAP_ARM_SEA_TO_USER:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/kvm_ras.c b/arch/arm64/kvm/kvm_ras.c
new file mode 100644
index 0000000000000..83f2731c95d77
--- /dev/null
+++ b/arch/arm64/kvm/kvm_ras.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/acpi.h>
+#include <linux/types.h>
+#include <asm/acpi.h>
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_ras.h>
+#include <asm/system_misc.h>
+
+/*
+ * Was this synchronous external abort a RAS notification?
+ * Returns 0 for errors handled by some RAS subsystem, or -ENOENT.
+ */
+static int kvm_delegate_guest_sea(void)
+{
+	/* apei_claim_sea(NULL) expects to mask interrupts itself. */
+	lockdep_assert_irqs_enabled();
+	return apei_claim_sea(NULL);
+}
+
+int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+	bool exit = test_bit(KVM_ARCH_FLAG_RETURN_SEA_TO_USER,
+			     &vcpu->kvm->arch.flags);
+
+	/* For RAS the host kernel may handle this abort. */
+	if (kvm_delegate_guest_sea() == 0)
+		return 1;
+
+	if (!exit) {
+		/* Fallback behavior prior to KVM_EXIT_ARM_SEA. */
+		kvm_inject_vabt(vcpu);
+		return 1;
+	}
+
+	run->exit_reason = KVM_EXIT_ARM_SEA;
+	run->arm_sea.esr = kvm_vcpu_get_esr(vcpu);
+	run->arm_sea.flags = 0ULL;
+	run->arm_sea.gva = 0ULL;
+	run->arm_sea.gpa = 0ULL;
+
+	if (kvm_vcpu_sea_far_valid(vcpu)) {
+		run->arm_sea.flags |= KVM_EXIT_ARM_SEA_FLAG_GVA_VALID;
+		run->arm_sea.gva = kvm_vcpu_get_hfar(vcpu);
+	}
+
+	if (kvm_vcpu_sea_ipa_valid(vcpu)) {
+		run->arm_sea.flags |= KVM_EXIT_ARM_SEA_FLAG_GPA_VALID;
+		run->arm_sea.gpa = kvm_vcpu_get_fault_ipa(vcpu);
+	}
+
+	return 0;
+}
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc673..a605ee56fa150 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1795,16 +1795,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	int ret, idx;
 
 	/* Synchronous External Abort? */
-	if (kvm_vcpu_abt_issea(vcpu)) {
-		/*
-		 * For RAS the host kernel may handle this abort.
-		 * There is no need to pass the error into the guest.
-		 */
-		if (kvm_handle_guest_sea())
-			kvm_inject_vabt(vcpu);
-
-		return 1;
-	}
+	if (kvm_vcpu_abt_issea(vcpu))
+		return kvm_handle_guest_sea(vcpu);
 
 	esr = kvm_vcpu_get_esr(vcpu);
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b6ae8ad8934b5..79dc4676ff74b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -178,6 +178,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
+#define KVM_EXIT_ARM_SEA          40
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -446,6 +447,15 @@ struct kvm_run {
 			__u64 gpa;
 			__u64 size;
 		} memory_fault;
+		/* KVM_EXIT_ARM_SEA */
+		struct {
+			__u64 esr;
+#define KVM_EXIT_ARM_SEA_FLAG_GVA_VALID	(1ULL << 0)
+#define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID	(1ULL << 1)
+			__u64 flags;
+			__u64 gva;
+			__u64 gpa;
+		} arm_sea;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -930,6 +940,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_SEA_TO_USER 240
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0.967.g6a0df3ecc3-goog


