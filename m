Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg+/1CKy1BOtonhw8GAQavpaE5sBngLputrohP126YA=; b=2uMYjY8j6ifRGkUdpRYfB18K0h
	4FwGm1OvWPDhFBTDbIXmcb7yrK0aM8gWBVXX1gJf4Kv7pR1B5eQ0c1nI2Sk+xmyhjptDQJjOamPCv
	R4eh1SSu24IAdtTAAaikaNPCtcW5c3J8ViaBmNKv7LAu2yI9JUdCO8dIzThB6yBehYX5sY8fDwh2l
	JCAeORIH71g53pPO16N4hSPIr/CLtsHcQprTuKsp5BNXeY6bMtt6Mu3L0wG08b770u10fPbyFK/et
	5UgTwObd2LJJuBlb6LHKJBX7RSu5NXTXzi4hpvEVh7NM35J9vth3sisMcfyU3Pm4wzlokU9vsZ6A0
	J1NqKS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfW-0000000BtUR-0D2a;
	Mon, 01 Jun 2026 21:59:34 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfU-0000000BtQW-1Hwa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:33 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c0c272e532so20642895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351171; x=1780955971; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg+/1CKy1BOtonhw8GAQavpaE5sBngLputrohP126YA=;
        b=vfPEZiyjLtaFG3D3nLsSfuhAYllFBvi5lHNb3Oz2xN+VHveU7Aonr7JqT4UHNORWTO
         DSoetu/i0Dw8g0oRJ9uIsiz5GGlGOauQnd9jSuuWrYOpvBEOa5FP+VOIzMOCIEXvDqvn
         6zuQnbr0z7hhxWJodfvAwSZE/mktw7DURRI1e7PZEk6crQiF6vx7LHI0TKNlK5OgWle/
         QdOPVGssEKngRjoM91dUFbpdngtxLjKZn39gUwwXqhbqUamTguBvkgpHh9ivg2tpV+SU
         4BI+nrob2ZVjjRaLbXZTq0sBZK3HIGQgJL6TnkcyHfSe06+h9KqlbOkyBhh0eNZT/Hr+
         CJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351171; x=1780955971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg+/1CKy1BOtonhw8GAQavpaE5sBngLputrohP126YA=;
        b=O0/xZdwUQA6AUcZADVQ82O/vkyM7AvVrrMV7+XkOtRYWPywzUiaJZNtZs0EPwO6E4J
         Yy0PNn9rGUi/0uhThKj8E/flSbwWVnGTwryHzdomVQkfOApsGfBw2xbnxI2JoWV6WBIW
         L7PbNzzw0PTqQPt1QKtGcKs/eo/CkbxURfkxHkka/uJWyiZ+cpvq21EaUZoDKCRzNQ3p
         2S609RIErkdd1H32qAzclnSZpKg2zdH7IcsJoMduYoPOcmaISJhj8jYYYawL4L1fEQ38
         0EYPNUctB06LVSDUTD+v3bH8y3W1Qc8Zl/af0R7L9ORRlE6DVcNCYPy67mvnjGHb6ybs
         Fjbw==
X-Forwarded-Encrypted: i=1; AFNElJ9J5taQFb8QYHZ5+5frx/Iqw+uTjkTUfZx03tlOHD9KO2TO06kBdvd6thsoCTzuAdNVlc4xzP26zx4t8bZYAbbj@lists.infradead.org
X-Gm-Message-State: AOJu0YyG633RNgocaln/tIopMQ6WFzwAMuMZR8UO1LyMDIFvhZLthD5w
	617EChZ/yFnr+AuEFs53ZcbhFhY4DJcMDXvImIwcxF35eolpw+JKUpOfbMZfl7Z01yvwSz0GnB3
	/ig==
X-Received: from plblo7.prod.google.com ([2002:a17:903:4347:b0:2bf:8db:4516])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:15cf:b0:2c0:c3ac:4af3
 with SMTP id d9443c01a7336-2c0c3ac4e7cmr96353685ad.15.1780351170705; Mon, 01
 Jun 2026 14:59:30 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:06 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-10-praan@google.com>
Subject: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime & system
 sleep ops
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145932_377709_07A501FE 
X-CRM114-Status: GOOD (  30.30  )
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

Implement pm_runtime and system sleep ops for arm-smmu-v3.

The suspend callback configures the SMMU to abort new transactions,
disables the main translation unit and then drains the command queue
to ensure completion of any in-flight commands. A software gate
(STOP_FLAG) and synchronization barriers are used to quiesce the command
submission pipeline and ensure state consistency before power-off.

To prevent software metadata flags from leaking into physical registers
or polluting the tracking pointer, a newly introduced bitmask
(CMDQ_PROD_IDX_MASK) is applied to all register writes and tracking
updates.

The resume callback restores the MSI configuration and performs a full
device reset via `arm_smmu_device_reset` to bring the SMMU back to an
operational state. The MSIs are cached during the msi_write and are
restored during the resume operation by using the helper. The STOP_FLAG
is cleared only after the CMDQ is enabled in hardware.

Suggested-by: Daniel Mentz <danielmentz@google.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 172 +++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  18 ++
 2 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d31e50b64b50..542de3a3173a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -28,6 +28,7 @@
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/string_choices.h>
+#include <linux/pm_runtime.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
 
@@ -110,6 +111,40 @@ static const char * const event_class_str[] = {
 static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master);
 
+/* Runtime PM helpers */
+__maybe_unused static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	if (!pm_runtime_enabled(smmu->dev))
+		return 0;
+
+	ret = pm_runtime_resume_and_get(smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu->dev, "failed to resume device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+__maybe_unused static void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	if (!pm_runtime_enabled(smmu->dev))
+		return;
+
+	ret = pm_runtime_put_autosuspend(smmu->dev);
+	if (ret < 0)
+		dev_err(smmu->dev, "failed to suspend device: %d\n", ret);
+}
+
+static inline u32 arm_smmu_cmdq_owner_prod_idx(struct arm_smmu_cmdq *cmdq)
+{
+	return atomic_read(&cmdq->owner_prod) & CMDQ_PROD_IDX_MASK;
+}
+
 static void parse_driver_options(struct arm_smmu_device *smmu)
 {
 	int i = 0;
@@ -789,7 +824,8 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 		/* b. Stop gathering work by clearing the owned flag */
 		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
 						   &cmdq->q.llq.atomic.prod);
-		prod &= ~CMDQ_PROD_OWNED_FLAG;
+		/* Strip all metadata flags */
+		prod &= CMDQ_PROD_IDX_MASK;
 
 		/*
 		 * c. Wait for any gathered work to be written to the queue.
@@ -4828,7 +4864,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/* Command queue */
 	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
-	writel_relaxed(smmu->cmdq.q.llq.prod, smmu->base + ARM_SMMU_CMDQ_PROD);
+	writel_relaxed(smmu->cmdq.q.llq.prod & CMDQ_PROD_IDX_MASK,
+		       smmu->base + ARM_SMMU_CMDQ_PROD);
 	writel_relaxed(smmu->cmdq.q.llq.cons, smmu->base + ARM_SMMU_CMDQ_CONS);
 
 	enables = CR0_CMDQEN;
@@ -4839,6 +4876,10 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
+	/* Clear any flags from the previous life */
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);
+	atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod);
+
 	/* Invalidate any cached configuration */
 	arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_all());
 
@@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	if (is_kdump_kernel())
 		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
 
+	/*
+	 * While the SMMU was suspended, concurrent CPU threads may have
+	 * updated in-memory structures (such as STEs, CDs, and PTEs).
+	 * Any invalidations corresponding to those updates were safely
+	 * elided because the command queue was stopped (STOP_FLAG == 1).
+	 *
+	 * Since the reset invalidate-all commands above have fully cleared
+	 * the HW TLBs and config caches, the SMMU will fetch these descriptors
+	 * directly from RAM as soon as translation is enabled.
+	 *
+	 * Add a memory barrier to collect all prior RAM writes to ensure the
+	 * SMMU sees a consistent view of memory before translation is enabled.
+	 */
+	smp_mb();
+
 	/* Enable the SMMU interface */
 	enables |= CR0_SMMUEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
@@ -5580,6 +5636,117 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 	arm_smmu_device_disable(smmu);
 }
 
+static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
+{
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
+	int timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
+	u32 enables, target;
+	int ret;
+
+	/* Abort all transactions before disable to avoid spurious bypass */
+	arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+
+	/* Disable the SMMU via CR0.EN and all queues except CMDQ */
+	enables = CR0_CMDQEN;
+	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
+	if (ret) {
+		dev_err(smmu->dev, "failed to disable SMMU\n");
+		return ret;
+	}
+
+	/*
+	 * At this point the SMMU is completely disabled and won't access
+	 * any translation/config structures, even speculative accesses
+	 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
+	 */
+
+	/* Mark the CMDQ to stop and get the target index before the stop */
+	target = atomic_fetch_or_relaxed(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
+	target &= CMDQ_PROD_IDX_MASK;
+
+
+	/* Wait for the last committed owner to reach the hardware */
+	while ((arm_smmu_cmdq_owner_prod_idx(cmdq) != target) && --timeout)
+		udelay(1);
+
+	/*
+	 * Entering suspend implies no active clients. A timeout here
+	 * indicates a fatal CMDQ lockup or hardware stall. We proceed
+	 * anyway to prioritize memory safety (avoiding stale TLBs)
+	 */
+	if (!timeout)
+		dev_err(smmu->dev, "cmdq owner wait timeout, (check runtime PM + devlinks)\n");
+
+	/* Drain the CMDQs */
+	ret = arm_smmu_drain_queues(smmu);
+	if (ret)
+		dev_warn(smmu->dev, "failed to drain queues, forcing suspend\n");
+
+	/* Wait for cmdq->lock == 0 to ensure last CMDQ_CONS_REG is written */
+	timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
+	while (atomic_read(&cmdq->lock) != 0 && --timeout)
+		udelay(1);
+
+	/* Timing out here implies misconfigured Runtime PM or broken devlinks */
+	if (!timeout)
+		dev_err(smmu->dev, "cmdq lock != 0, forcing suspend. Polling CPUs may fault.\n");
+
+	/* Disable everything */
+	arm_smmu_device_disable(smmu);
+
+	/* Handle any pending gerrors before powering down */
+	arm_smmu_handle_gerror(smmu);
+
+	/* Avoid consuming stale commands if we timed-out to drain the queues */
+	if (ret || !timeout)
+		cmdq->q.llq.cons = cmdq->q.llq.prod & CMDQ_PROD_IDX_MASK;
+
+	dev_dbg(dev, "suspended smmu\n");
+
+	return 0;
+}
+
+static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
+{
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	int ret;
+
+	/* Re-configure MSIs */
+	arm_smmu_resume_msis(smmu);
+
+	/* Clears the CMDQ_PROD_STOP_FLAG as well */
+	ret = arm_smmu_device_reset(smmu);
+	if (ret)
+		dev_err(dev, "failed to reset during resume operation: %d\n", ret);
+
+	dev_dbg(dev, "resumed smmu\n");
+
+	return ret;
+}
+
+static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return arm_smmu_runtime_suspend(dev);
+}
+
+static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return arm_smmu_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops arm_smmu_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(arm_smmu_pm_suspend, arm_smmu_pm_resume)
+	SET_RUNTIME_PM_OPS(arm_smmu_runtime_suspend,
+			   arm_smmu_runtime_resume, NULL)
+};
+
 static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,smmu-v3", },
 	{ },
@@ -5596,6 +5763,7 @@ static struct platform_driver arm_smmu_driver = {
 	.driver	= {
 		.name			= "arm-smmu-v3",
 		.of_match_table		= arm_smmu_of_match,
+		.pm                     = &arm_smmu_pm_ops,
 		.suppress_bind_attrs	= true,
 	},
 	.probe	= arm_smmu_device_probe,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 719e499c72ce..51a3281a1e46 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -392,6 +392,9 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
 #define CMDQ_PROD_STOP_FLAG		(1U << 30)
 #define Q_STOP(p)			((p) & CMDQ_PROD_STOP_FLAG)
 
+/* Mask out software-only metadata flags to get the pure queue index/wrap bits */
+#define CMDQ_PROD_IDX_MASK		~(CMDQ_PROD_STOP_FLAG | CMDQ_PROD_OWNED_FLAG)
+
 struct arm_smmu_cmd {
 	u64 data[CMDQ_ENT_DWORDS];
 };
@@ -655,11 +658,14 @@ arm_smmu_make_cmd_tlbi(enum arm_smmu_cmdq_opcode op, u16 asid, u16 vmid)
 
 /* High-level queue structures */
 #define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
+#define ARM_SMMU_SUSPEND_TIMEOUT_US	1000000	/* 1s! */
 #define ARM_SMMU_POLL_SPIN_COUNT	10
 
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
+#define RPM_AUTOSUSPEND_DELAY_MS	15
+
 struct arm_smmu_ll_queue {
 	union {
 		u64			val;
@@ -1217,6 +1223,18 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				struct arm_smmu_cmd *cmds, int n,
 				bool sync);
 
+/*
+ * Lockless pre-check to elide invalidations if SMMU is suspended.
+ * Races with concurrent suspend are benign: the cmpxchg loop in
+ * arm_smmu_cmdq_issue_cmdlist() acts as the true commit point.
+ * If we lose the race, that loop observes Q_STOP == 1 and safely
+ * drops the command. If we win, the suspend thread waits for us.
+ */
+static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
+{
+	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
+}
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 void arm_smmu_sva_notifier_synchronize(void);
-- 
2.54.0.1013.g208068f2d8-goog


