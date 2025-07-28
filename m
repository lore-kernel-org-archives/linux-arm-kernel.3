Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6841C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNqiciGNbDvOVxE+CtY3bj2b4l2gg16t6NtA8moWKCo=; b=wW6t/kpIQYaEvx22gBoEgyk467
	nKzmUFtVVr23im2bPxk4C4s4QEpdo35INGcE3RQq4mcPhLlg+W51sowd5twUtApzZg8/JJqFcCdF3
	EgGqSBU3YEoqYUfjsJHhu1zq9WOnM41u7pO5Yfwpe4mPofnkQiHBwWBt7y2jMOMAogO07HqrRgm45
	LQXTh+JoaSEaeMNa/Bewj+wLwwqYAd2GDcBHjLGTeQdF5ilDVPAo+xI4qVhmtBh1Dizu1NV7wvVtg
	Oh5z9iD//EKCQkdh+g3+fkisveMYyAlNLH7crsVU6EH6B8oFkEbXqQXYgm3zHxRBTtFpsixGJvm/C
	CSLdZtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTij-0000000FHsc-0MBO;
	Mon, 28 Jul 2025 19:41:13 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2k-0000000F8vG-0mdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4538f375e86so36589395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725224; x=1754330024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNqiciGNbDvOVxE+CtY3bj2b4l2gg16t6NtA8moWKCo=;
        b=J7pmGMV7Jmg12Quq491A1/47mMDBMDChtqIT9mfBE4VUJgEvfCfiNB4CdhEy2pMEdJ
         Je7hBsynBwQtvVNjiAxoxLP343amKiFVdbWFIBflaoaybV1TMR5UGRt5NlvbCAC7HTWa
         KmrLsncZJ23qNCd19XBH1q/Wdva0R5+ztJjWS6Vi2/FB24XxtuxDF+fVShtaykKxPGpW
         UZDJp75KNkEmXg2Ak97FzCrbH10rdhiKdKwOzHNlQXIB7d14UB8E8cOx9ocptkxmzZhC
         piaoD727HC6yoPIHKsWWB5GEyx2nZ8U3mtROzIZQ4j/qoqLaxzR2Nb9eS665XCcPNcJm
         m91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725224; x=1754330024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNqiciGNbDvOVxE+CtY3bj2b4l2gg16t6NtA8moWKCo=;
        b=DGkP8mSghsvWGail7LfBRzi94d6ZThtguf0xNUtNcxUYUyGFnJ6qf1DCaeTQ8dYhMU
         Rtv2PZorxVKirTLJTq9S9ZO7bjbYtNayOWp3QiCzoTSdpjutSANhhYWKpl+djo7sqiBs
         1v4tmysLhug9Z+005UAknetJCObYTwScuDALGnv24hglan+91wqjnzPblyvLCGyUPg5K
         /HJHOCR06RD6R0dmycG/nYi488pXUT3ACUyT3zynMhop81o0mxAjecXJiMcknBT9+4y6
         uy/5EB4hwP+BwRvzd+CVxf6tb3bjWnPze7aWo1lNJm5J6lBM8pNrYPJUlpyhs6lI5GwM
         UFZg==
X-Forwarded-Encrypted: i=1; AJvYcCUgpmva7cc92HUOFlwHuPr7AOcD19XS3Jp7jmpsOUwTAUC+OgV7hmLrGH0rWy2BwzjhTlxLhZfrxv+dEstmNlbs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyse0PiocOOphp/BD0ystKrsPViz3q7GgbtZ64d3U8C3RTyJXT1
	RQ6++ZhNiC5OTl62SHLQ9AOqGLHZgEpyugF2iglTjbvclJ5BkDClHS772MRW7FnikoRfcmD3pr8
	uuG+kfJYe61eAwg==
X-Google-Smtp-Source: AGHT+IEz09KUv2OxAPyDlzfr699/1qziOwALIawld3qpvPOE7K8k/mL0W2XcO/kW0IXD9mKeU33jEW1uY9lkQw==
X-Received: from wmbei27.prod.google.com ([2002:a05:600c:3f1b:b0:456:1b6f:c878])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:456:eab:633e with SMTP id 5b1f17b1804b1-4587dd0db72mr87600635e9.17.1753725224509;
 Mon, 28 Jul 2025 10:53:44 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:01 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-15-smostafa@google.com>
Subject: [PATCH v3 14/29] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105346_226533_52507BEE 
X-CRM114-Status: GOOD (  25.67  )
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

To establish DMA isolation, KVM needs an IOMMU driver which provide
certain ops, these ops are defined outside of the iommu_ops,
and has 2 components:
- kvm_iommu_driver (kernel): Implements simple interaction with
  the kernel (init, remove,...)
- kvm_iommu_ops (hypervisor): Implements identity mapping for
  the IOMMU page tables

Only one driver can be used and is registered with
kvm_iommu_register_driver() by passing pointers to both ops.

The flow of the KVM IOMMU drivers works as follows:
- The KVM IOMMU driver in the kernel after being loaded using an
  initcall (before module_init) it would register with KVM both
  the kernel and hypervisor ops.
- KVM will initialise the driver after it initialises and before the
  de-privilege point, which is a suitable point to establish trusted
  interaction between the host and the hypervisor.
  In this call the IOMMU kernel driver typically starts probing
  the IOMMUs, parsing firmware tables and initialising hardware.
- Then the hypervisor init will be called, to take over the IOMMUs
  and initialise its data structures.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h       |  9 +++++
 arch/arm64/kvm/Makefile                 |  3 +-
 arch/arm64/kvm/arm.c                    |  8 +++-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 +-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 18 +++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++
 arch/arm64/kvm/iommu.c                  | 49 +++++++++++++++++++++++++
 8 files changed, 105 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3e41a880b062..43f5a64bbd1d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1674,5 +1674,14 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
 void check_feature_map(void);
 
+struct kvm_iommu_driver {
+	int (*init_driver)(void);
+	void (*remove_driver)(void);
+};
+
+struct kvm_iommu_ops;
+int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops, struct kvm_iommu_ops *hyp_ops);
+int kvm_iommu_init_driver(void);
+void kvm_iommu_remove_driver(void);
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7c329e01c557..5528704bfd72 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -23,7 +23,8 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v3.o vgic/vgic-v4.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
-	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
+	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
+	 iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 23dd3f3fc3eb..2f494f402c48 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2451,10 +2451,16 @@ static int __init kvm_hyp_init_protection(u32 hyp_va_bits)
 	if (ret)
 		return ret;
 
-	ret = do_pkvm_init(hyp_va_bits);
+	ret = kvm_iommu_init_driver();
 	if (ret)
 		return ret;
 
+	ret = do_pkvm_init(hyp_va_bits);
+	if (ret) {
+		kvm_iommu_remove_driver();
+		return ret;
+	}
+
 	free_hyp_pgds();
 
 	return 0;
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
index a76522d63c3e..393ff143f0be 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu/iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
new file mode 100644
index 000000000000..a01c036c55be
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -0,0 +1,18 @@
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
+int kvm_iommu_init(void)
+{
+	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
+		return -ENODEV;
+
+	return kvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index ee6435473204..bdbc77395e03 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -13,6 +13,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -320,6 +321,10 @@ void __noreturn __pkvm_init_finalise(void)
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
index 000000000000..39465101074a
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <asm/kvm_mmu.h>
+#include <linux/kvm_host.h>
+
+struct kvm_iommu_driver *iommu_driver;
+extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
+
+int kvm_iommu_register_driver(struct kvm_iommu_driver *kern_ops, struct kvm_iommu_ops *el2_ops)
+{
+	int ret;
+
+	if (WARN_ON(!kern_ops || !el2_ops))
+		return -EINVAL;
+
+	/*
+	 * Paired with smp_load_acquire(&iommu_driver)
+	 * Ensure memory stores happening during a driver
+	 * init are observed before executing kvm iommu callbacks.
+	 */
+	ret = cmpxchg_release(&iommu_driver, NULL, kern_ops) ? -EBUSY : 0;
+	if (ret)
+		return ret;
+
+	kvm_nvhe_sym(kvm_iommu_ops) = el2_ops;
+	return 0;
+}
+
+int kvm_iommu_init_driver(void)
+{
+	/* See kvm_iommu_register_driver() */
+	if (WARN_ON(!smp_load_acquire(&iommu_driver))) {
+		kvm_err("pKVM enabled without an IOMMU driver, do not run confidential workload in virtual machines\n");
+		return -ENODEV;
+	}
+
+	return iommu_driver->init_driver();
+}
+
+void kvm_iommu_remove_driver(void)
+{
+	/* See kvm_iommu_register_driver() */
+	if (smp_load_acquire(&iommu_driver))
+		iommu_driver->remove_driver();
+}
-- 
2.50.1.552.g942d659e1b-goog


