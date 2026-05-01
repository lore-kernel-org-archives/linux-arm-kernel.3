Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82825CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcUXILApPYbJmZVAe9rvUD8ScMEsBCpayhLYZpcyGpA=; b=QUUKniasqpcXpa1DerCCEvWhoX
	SWd81rdIbsWrvJRU3n9Wl2Rs8gZcf2+LliYkpaC513PRtSDlY2RKeOTH1znH1AlWUL+YLKYIS+sja
	NvDA19zGHtFGMX+pflrz4ZE/cxi5r5r2QVYKSLqGPFPSIFDz0lKiqi2PcVWxIZxHP0FNJWmTpz/ps
	t+b6J9MHpEzLVWRzgVpZGFSYGIYOEFO9pEoE9l7cwtd9YWFGfuCCjctJjKpo7+j+o5g/cfX4zkJvp
	BuFaooLWXECnkzgiUZMr2FuEPhQmTp0r42A4N7KxANeaWi4HbM6P4ZEQdAqEVVsnSfcpGkSTWwii/
	Dgg9jFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlum-00000006cin-13CQ;
	Fri, 01 May 2026 11:20:12 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluj-00000006ce5-1jyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:10 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-44a122a5128so786522f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634407; x=1778239207; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcUXILApPYbJmZVAe9rvUD8ScMEsBCpayhLYZpcyGpA=;
        b=sJq1YiKyuwa0olMZTNxihib/sAD+YbnMtZdpZ/ZKZmMk04yuwteD7HveSaK7xegsUx
         bLoId15pfJNePZTIP0s1eY00gpYIcaUuwRg80YSEYK81QxtVGPuFNU6Pm+R510OEiubj
         hZVQe5ZtYFQ7wI0b8L/qCr35MoOG44vcV3TyHdfz9qtqy6xtsJ7OjBxuna8JJlWD/XGS
         ybgwbTHM11pnNPyixEsUgM6t4AFv3feJtvkUiUIH0L251WMG2B9fiYPSQdQ0Dxuiv4gw
         W0YNP8N+020q14UmzVzjjPPdQ8m320rHGQtjaO8W+JUoblCGPILw0PbQlX+g6Tn8KMqZ
         oEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634407; x=1778239207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcUXILApPYbJmZVAe9rvUD8ScMEsBCpayhLYZpcyGpA=;
        b=UusAwtiYLoHsZXlycVaD73jTkSsboGC5Sy7Kz0KsfaDKd5gGrOsjNO3C+IdMeITtoY
         9uXYuxlfC5Kqmfj05/tlex3TFO+9Zfm7SNgJJhZjntfuKGPTdgv8/4PTF45UZhlI4eTe
         DtofZlnd+QOUptDNWM1Hv59AN96uLXEqIVgXUuQVnU08oTWt2tdgNkh2Vzo0aMMwex6h
         pkpp+9kURY0rJirxR3fREN2RI71oDy1/odTLTKrZMSedlhKlm4iWlge8KWQNluuLM5l0
         kQUg0EurinaO6tDI/nnYttn/BQwzuHnPPrvbOQysHvjNuxwzJKnC8Wk1mQLQw/Iyzu1X
         6Xyw==
X-Gm-Message-State: AOJu0YwuFP48j4phL9MvCX9q14lb66qL48PzhbkX6wec3GwVaSHmyijj
	zfX6on+yHGd1ZclK82fPB/UU5W0C+jI0w9NNu4Qod1brAiMh4hyYf9gSHYHmXyXH5ZS6xgron98
	2B+sqAlRUHPAZrRVOLDfGb0i/ADBzTtZ2vVXn9nDURBANzFoyIX4ooYrjGi+sAmPJDgxtyu30Uq
	dKfa3K0Pw5Qgk1CPwfbYbYUo4mNjJVrRvl4lKOFVJ4x7ZeuNxatjNiaK8UUhSrJiIJjw==
X-Received: from wmrk4.prod.google.com ([2002:a05:600c:b44:b0:48a:6a1b:6c3b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:a:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a84532792mr89794945e9.29.1777634406991;
 Fri, 01 May 2026 04:20:06 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:09 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-8-smostafa@google.com>
Subject: [PATCH v6 07/25] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042009_490411_9C436039 
X-CRM114-Status: GOOD (  20.94  )
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

To establish DMA isolation, KVM needs an IOMMU driver which provides
ops implemented at EL2.

Only one driver can be used and is registered with
kvm_iommu_register_driver() by passing pointer to the ops.

This must be called before module_init() which is the point KVM
initializes.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  5 +++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 20 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++++
 arch/arm64/kvm/iommu.c                  | 26 +++++++++++++++++++++++++
 7 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 851f6171751c..52898d2a3ec6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1733,4 +1733,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+struct kvm_iommu_ops;
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c..0ddef54f7434 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
-	 vgic/vgic-v5.o
+	 vgic/vgic-v5.o iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
new file mode 100644
index 000000000000..1ac70cc28a9e
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_NVHE_IOMMU_H__
+#define __ARM64_KVM_NVHE_IOMMU_H__
+
+#include <asm/kvm_host.h>
+
+struct kvm_iommu_ops {
+	int (*init)(void);
+};
+
+int kvm_iommu_init(void);
+
+#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 89d0533921f9..606c0e1b7bd0 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu/iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
new file mode 100644
index 000000000000..406c8fb9b3b9
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOMMU operations for pKVM
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <nvhe/iommu.h>
+
+/* Only one set of ops supported */
+struct kvm_iommu_ops *kvm_iommu_ops;
+
+
+int kvm_iommu_init(void)
+{
+	/* Keep DMA isolation optional. */
+	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+		return 0;
+
+	return kvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 8041f6e80cd1..1f6b221db9a0 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -14,6 +14,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -329,6 +330,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = kvm_iommu_init();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..f247384fa193
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+
+static DEFINE_MUTEX(kvm_iommu_reg_lock);
+
+int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
+{
+	guard(mutex)(&kvm_iommu_reg_lock);
+
+	/* Only protected KVM before de-privilege. */
+	if (!is_protected_kvm_enabled() || is_kvm_arm_initialised())
+		return -EINVAL;
+
+	if (kvm_nvhe_sym(kvm_iommu_ops))
+		return -EBUSY;
+
+	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
+	return 0;
+}
-- 
2.54.0.545.g6539524ca2-goog


