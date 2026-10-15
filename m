Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD95CCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvZXZkvUSAD15cNaKk6sP3PS0iiPsYhfJc7tNMHipvE=; b=rLwALIYYyi8CxYd9JoMQlkcp7m
	LNnmE6ayQJ8T6anK0ILtatxeYtz3LUEe5vvhvVtPzt07CA/h661oOyqK6byklEqFfP0LH94lXl89h
	t5YCIQwh8NthSt/XBKgJtLlL7RFeDoDvJZfKLXB2HhCV+PotxsSeLlooogL9y7Y6dPKB40h27ugU6
	WaIFfo5Uo7iylfdPoD+Tv9sgJT3CgY93eTE6gocHIEbs7kMRb1JtY6MFOpAGusKfRiZDax5kZVjcs
	X7GnFYf8rv7nOarKsFBDjGrX900GQsV9FqtHxViBJBzA5GRvqdI4oNADvvsGNGUCAD8GWwJsamtHp
	dWJFLiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPi-00000000MOq-2ych;
	Thu, 15 Oct 2026 14:26:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPe-00000000MJh-0agQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 14:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RvZXZkvUSAD15cNaKk6sP3PS0iiPsYhfJc7tNMHipvE=; b=HAdu14Mk+ZzIh7OMRAsS5yjY5c
	nZpAEz08nouvoVJw9OA8OG14yjl5dCIM+71t5jcviWMboQ/XZ2mC9hwNZrNZc61p1BP2u+C4OOFH/
	+VBPuKORARis/LCIMDYiug/jJTx+8u2Iu5wHk5o45QNvfkA1hpC3+afRhOhOSXrtgMhTufgbDwtwd
	puFzYNvLDlf5LDzSrisf/Yww7G52apZcWPD0cl+HFsp6NTi7E5X0dC0gBtd7aTRsvmDomGGQAcTdD
	wlyQkUpnV6LEmOgoK4A7DeTHmtM15+6lm9rLqUNu1g4BupLwXoIKI8yHkgSS+NlTfKUgpaeFIAxe/
	mRqdwHEw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHMPb-00000000TBX-0DMH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DAC91477;
	Thu, 15 Oct 2026 07:26:21 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9823F871;
	Thu, 15 Oct 2026 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074384; bh=05KhQBlLMMcBUNB/YK9iSgcp4Cp+gQe+85V4m76ZWnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pteDuhxpEAoGDtrwUFa2OEkQeIaXnJ9FyDsm6fKmfWOVkF2fRFHoaJSK1yxsaHekj
	 SaaJyxn2NMswr79AdcItzxqATQM5+ERBvWHCWOqHbOmy8F31+OPKGUAVWkaZ2Jp5Dj
	 zyPZHXCVcNUARZU7C8dkSAzPIUeKpMN0Jj7VPto8=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 06/15] misc/arm-cla: Accelerator context save and restore
Date: Thu, 15 Oct 2026 15:25:40 +0100
Message-ID: <20261015142552.4128028-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_152627_482969_03B2341E 
X-CRM114-Status: GOOD (  36.95  )
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

From: Jean-Philippe Brucker <jpb@kernel.org>

Add helpers to save and restore CLA context for later domain switching.
The saved state includes DATA registers, LRESP, per-accelerator SRSTATE
and any implementation-defined internal accelerator state exposed
through the IAS register window.

Use ENTERSR to stop each accelerator and collect SRSTATE, then read the
advertised internal register state with REGREAD. Restore by entering SR
mode from a reset, idle accelerator, writing the saved internal state
with REGWRITE and completing the transition with EXITSR.

Reject accelerators that require SAVE/RESTORE operations during setup,
since that path needs a DMA buffer for state storage. Allocate
per-device save areas for all CLAs in a domain, sized from the combined
IASSIZE discovered at setup time.

Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
---
 drivers/misc/arm-cla/Makefile   |   1 +
 drivers/misc/arm-cla/arm-cla.h  |  32 ++++
 drivers/misc/arm-cla/cla-init.c |  35 ++++
 drivers/misc/arm-cla/cla-ops.c  |  49 ++++++
 drivers/misc/arm-cla/cla-regs.c | 295 ++++++++++++++++++++++++++++++++
 5 files changed, 412 insertions(+)
 create mode 100644 drivers/misc/arm-cla/cla-regs.c

diff --git a/drivers/misc/arm-cla/Makefile b/drivers/misc/arm-cla/Makefile
index 84ed1a054a21..c1b14155454d 100644
--- a/drivers/misc/arm-cla/Makefile
+++ b/drivers/misc/arm-cla/Makefile
@@ -3,6 +3,7 @@
 arm-cla-y := \
 	cla-init.o \
 	cla-ops.o \
+	cla-regs.o \
 	cla-topology.o
 
 obj-$(CONFIG_ARM_CLA) += arm-cla.o
diff --git a/drivers/misc/arm-cla/arm-cla.h b/drivers/misc/arm-cla/arm-cla.h
index 6890c813a5c3..6d72d57e5422 100644
--- a/drivers/misc/arm-cla/arm-cla.h
+++ b/drivers/misc/arm-cla/arm-cla.h
@@ -29,6 +29,7 @@ struct cla_domain;
  * @pfn:		Page of registers assigned to user.
  * @accelerators:	Available accelerators.
  * @pg_offset:		Mmap offset of this device.
+ * @iassizes:		Combined regstate of all accels in bytes.
  * @domain:		The domain this CLA belongs to.
  *
  * Mutable, protected by CPU hotplug locking:
@@ -42,6 +43,7 @@ struct cla_dev {
 	unsigned long pfn;
 	u8 accelerators;
 	unsigned long pg_offset;
+	unsigned long iassizes;
 	struct cla_domain *domain;
 
 	bool discovered;
@@ -64,6 +66,27 @@ struct cla_domain {
 	struct cla_dev **devs;
 };
 
+/**
+ * struct cla_regs_pl0 - Saved CLA register state (PL0)
+ *
+ * @data:		DATA registers.
+ * @lresp:		LRESP register.
+ * @accel_valid:	Accelerator state has been saved once.
+ * @srstate:		Save/restore state for each accelerator.
+ * @regstate:		Internal accelerator state.
+ */
+struct cla_regs_pl0 {
+	u64 data[CLA_NUM_DATA_REGS];
+	u64 lresp;
+	bool accel_valid;
+	u64 srstate[CLA_NUM_ACC][CLA_SRSTATE_LEN];
+	u64 regstate[];
+};
+
+struct cla_ctx {
+	void **regs;
+};
+
 extern struct xarray cla_domains;
 extern unsigned int cla_nr_domains;
 extern struct cla_dev **cla_lut_cpu;
@@ -116,5 +139,14 @@ int cla_op_regread(struct cla_dev *dev, unsigned int accid, unsigned int regidx,
 		   size_t nregs, u64 *regs);
 int cla_op_regwrite(struct cla_dev *dev, unsigned int accid,
 		    unsigned int regidx, size_t nregs, u64 *regs);
+int cla_op_entersr(struct cla_dev *dev, unsigned int accid, u64 *srstate);
+int cla_op_exitsr(struct cla_dev *dev, unsigned int accid, u64 *srstate);
+
+int cla_regs_install(struct cla_dev *dev, struct cla_ctx *ctx,
+		     unsigned int ctx_id);
+int cla_regs_uninstall(struct cla_dev *dev, struct cla_ctx *ctx,
+		       unsigned int ctx_id);
+int cla_ctx_alloc_regs(struct cla_domain *domain, struct cla_ctx *ctx);
+void cla_ctx_free_regs(struct cla_domain *domain, struct cla_ctx *ctx);
 
 #endif /* _ARM_CLA_H_ */
diff --git a/drivers/misc/arm-cla/cla-init.c b/drivers/misc/arm-cla/cla-init.c
index 2974bf71033c..a4d2ffaa3136 100644
--- a/drivers/misc/arm-cla/cla-init.c
+++ b/drivers/misc/arm-cla/cla-init.c
@@ -7,8 +7,10 @@
 
 #include <linux/cpuhotplug.h>
 #include <linux/cpuhplock.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/smp.h>
 
@@ -82,6 +84,38 @@ static int cla_reset_pmu(struct cla_dev *dev, unsigned int accid)
  */
 static int cla_dev_discover_accel(struct cla_dev *dev, unsigned int accid)
 {
+	unsigned long iassizes;
+	u64 iassize;
+	u64 acap;
+	int ret;
+
+	/*
+	 * This driver supports context switching with REGREAD and REGWRITE.
+	 * SROP (SAVE and RESTORE ops) requires DMA-backed state storage, which
+	 * is not implemented here.
+	 */
+	ret = cla_op_regread(dev, accid, CLA_REG_ACAP, 1, &acap);
+	if (ret)
+		return ret;
+	if (FIELD_GET(CLA_ACAP_SROP, acap)) {
+		cla_err(dev, "[%u] SROP not supported\n", accid);
+		return 1;
+	}
+
+	ret = cla_op_regread(dev, accid, CLA_REG_IASSIZE, 1, &iassize);
+	if (ret)
+		return ret;
+	if (FIELD_GET(CLA_ACAP_REGSTATE, acap)) {
+		/* Reserve whole u64 entries for each accelerator's state. */
+		if (check_add_overflow(iassize, sizeof(u64) - 1, &iassize) ||
+		    check_add_overflow(dev->iassizes, round_down(iassize,
+				       sizeof(u64)), &iassizes)) {
+			cla_err(dev, "[%u] IASSIZE total overflows\n", accid);
+			return -EOVERFLOW;
+		}
+		dev->iassizes = iassizes;
+	}
+
 	dev->accelerators |= (1 << accid);
 
 	return 0;
@@ -181,6 +215,7 @@ static int cla_dev_setup(unsigned int cpu)
 	if (!dev->discovered) {
 		/* Discard partial results from an earlier, failed discovery. */
 		dev->accelerators = 0;
+		dev->iassizes = 0;
 	}
 
 	/* Clear DATA and LRESP_DATANZ */
diff --git a/drivers/misc/arm-cla/cla-ops.c b/drivers/misc/arm-cla/cla-ops.c
index 5d053c6aa1f7..bb0bac5c2d35 100644
--- a/drivers/misc/arm-cla/cla-ops.c
+++ b/drivers/misc/arm-cla/cla-ops.c
@@ -314,3 +314,52 @@ int cla_op_regwrite(struct cla_dev *dev, unsigned int accid,
 	return cla_op_access_reg(dev, CLA_LAUNCH_OP_REGWRITE, CLA_DATA_IN,
 				 accid, regidx, nregs, regs);
 }
+
+/**
+ * cla_op_entersr - launch ENTERSR operation.
+ * @dev: CLA device.
+ * @accid: accelerator ID.
+ * @srstate: 64-byte save/restore state written by CLA. May be NULL if the
+ *           SRSTATE isn't needed.
+ *
+ * Return: 0 on success, or an error.
+ */
+int cla_op_entersr(struct cla_dev *dev, unsigned int accid, u64 *srstate)
+{
+	int ret;
+	u64 status;
+	struct cla_launch launch = {
+		.op		= CLA_LAUNCH_OP_ENTERSR,
+		.ndata_m1	= 7,
+		.accid		= accid,
+		.data_mode	= srstate ? CLA_DATA_OUT : CLA_DATA_NONE,
+		.data		= srstate,
+	};
+
+	ret = cla_op_launch(dev, &launch);
+	if (ret)
+		return ret;
+
+	return cla_wait_status_dmb(dev, accid, &status);
+}
+
+/**
+ * cla_op_exitsr - launch EXITSR operation.
+ * @dev: CLA device.
+ * @accid: accelerator ID.
+ * @srstate: 64-byte save/restore state written to CLA.
+ *
+ * Return: 0 on success, or an error.
+ */
+int cla_op_exitsr(struct cla_dev *dev, unsigned int accid, u64 *srstate)
+{
+	struct cla_launch launch = {
+		.op		= CLA_LAUNCH_OP_EXITSR,
+		.ndata_m1	= 7,
+		.accid		= accid,
+		.data_mode	= CLA_DATA_IN,
+		.data		= srstate,
+	};
+
+	return cla_op_launch(dev, &launch);
+}
diff --git a/drivers/misc/arm-cla/cla-regs.c b/drivers/misc/arm-cla/cla-regs.c
new file mode 100644
index 000000000000..2452a7601990
--- /dev/null
+++ b/drivers/misc/arm-cla/cla-regs.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Arm CLA driver - save/restore accelerator context
+ *
+ * Copyright 2026 Arm Limited.
+ */
+
+#include <linux/io.h>
+#include <linux/overflow.h>
+
+#include "arm-cla.h"
+
+static int cla_regs_save_accel(struct cla_dev *dev, unsigned int accid,
+			       struct cla_regs_pl0 *regs, size_t *regstate_off)
+{
+	int ret;
+	u64 status;
+	size_t regstate_size;
+	u64 *srstate = regs->srstate[accid];
+	size_t nr_regstate = dev->iassizes / sizeof(u64);
+
+	ret = cla_op_entersr(dev, accid, srstate);
+	if (ret) {
+		/*
+		 * Note that we don't expect the accelerator to return an error.
+		 * Implementations that don't support context switch cancel the
+		 * work and write an error in SRSTATE_STATUS, but don't fail
+		 * ENTERSR.
+		 */
+		return ret;
+	}
+
+	status = cla_reg_read(dev, CLA_REG_STATUS(accid));
+	if ((status & CLA_STATUS_STATE_MASK) != CLA_STATUS_STATE_SRMODE) {
+		cla_err(dev, "unexpected SR status 0x%llx\n", status);
+		return -EIO;
+	}
+
+	/*
+	 * A device that supports SROP fails device probe. Others should not
+	 * report SROP here, we don't support it.
+	 */
+	WARN_ON(FIELD_GET(CLA_SRSTATE_0_SROP, srstate[0]));
+
+	regstate_size = FIELD_GET(CLA_SRSTATE_0_REGSTATE, srstate[0]);
+	if (WARN_ON(*regstate_off > nr_regstate ||
+		    regstate_size > nr_regstate - *regstate_off))
+		return -ENOSPC;
+
+	if (regstate_size) {
+		ret = cla_op_regread(dev, accid, CLA_REG_IASn, regstate_size,
+				     regs->regstate + *regstate_off);
+		if (ret) {
+			cla_err(dev, "failed to save regstate: %d\n", ret);
+			return ret;
+		}
+	}
+
+	*regstate_off += regstate_size;
+
+	return 0;
+}
+
+/*
+ * Errors are very unlikely, but if they happen the device is left in SRMODE.
+ */
+static int cla_regs_restore_accel(struct cla_dev *dev, unsigned int accid,
+				  struct cla_regs_pl0 *regs,
+				  size_t *regstate_off)
+{
+	int ret;
+	u64 status;
+	size_t regstate_size;
+	u64 *srstate = regs->srstate[accid];
+	size_t nr_regstate = dev->iassizes / sizeof(u64);
+
+	/*
+	 * The accelerator was reset and isn't in SRMODE. Later we could support
+	 * coming directly from cla_regs_save_accel() in SRMODE, but at the
+	 * moment we always need a RESET.
+	 */
+	status = cla_reg_read(dev, CLA_REG_STATUS(accid));
+	if ((status & CLA_STATUS_STATE_MASK) != CLA_STATUS_STATE_IDLE) {
+		cla_err(dev, "unexpected status 0x%llx\n", status);
+		return -EIO;
+	}
+
+	ret = cla_op_entersr(dev, accid, NULL);
+	if (ret)
+		return ret;
+
+	WARN_ON(FIELD_GET(CLA_SRSTATE_0_SROP, srstate[0]));
+
+	regstate_size = FIELD_GET(CLA_SRSTATE_0_REGSTATE, srstate[0]);
+	if (WARN_ON(*regstate_off > nr_regstate ||
+		    regstate_size > nr_regstate - *regstate_off))
+		return -ENOSPC;
+
+	if (regstate_size) {
+		ret = cla_op_regwrite(dev, accid, CLA_REG_IASn, regstate_size,
+				      regs->regstate + *regstate_off);
+		if (ret) {
+			cla_err(dev, "failed to restore regstate: %d\n", ret);
+			return ret;
+		}
+	}
+
+	*regstate_off += regstate_size;
+
+	return cla_op_exitsr(dev, accid, srstate);
+}
+
+static int cla_regs_uninstall_pl0(struct cla_dev *dev, struct cla_ctx *ctx,
+				  unsigned int ctx_id)
+{
+	int i;
+	int ret;
+	unsigned int accid;
+	size_t regstate_off = 0;
+	struct cla_regs_pl0 *regs = ctx->regs[ctx_id];
+
+	/*
+	 * When we interrupt the user process in the middle of launching a
+	 * command, we have to wait for LRESP_PENDING to clear before we can
+	 * launch a new command or save the DATA registers.
+	 */
+	ret = cla_op_wait_lresp(dev, &regs->lresp);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CLA_NUM_DATA_REGS; i++)
+		regs->data[i] = cla_reg_read(dev, CLA_REG_DATA(i));
+
+	cla_for_each_accid(dev, accid) {
+		ret = cla_regs_save_accel(dev, accid, regs, &regstate_off);
+		if (ret)
+			return ret;
+	}
+
+	regs->accel_valid = true;
+
+	/*
+	 * "If the accelerator is non idle when ENTERSR is launched, then a
+	 * RESET operation is required after the internal accelerator state has
+	 * been saved"
+	 *
+	 * Reset unconditionally to establish a clean state before assigning
+	 * the next context.
+	 */
+	return cla_op_reset_all(dev);
+}
+
+static int cla_regs_install_pl0(struct cla_dev *dev, struct cla_ctx *ctx,
+				unsigned int ctx_id)
+{
+	int i;
+	int ret;
+	unsigned int accid;
+	size_t regstate_off = 0;
+	struct cla_regs_pl0 *regs = ctx->regs[ctx_id];
+
+	cla_for_each_accid(dev, accid) {
+		if (regs->accel_valid) {
+			ret = cla_regs_restore_accel(dev, accid, regs, &regstate_off);
+			if (ret)
+				return ret;
+			/*
+			 * At this point we must not read STATUS because that
+			 * would clear EVENT. Userspace always gets a spurious
+			 * EVENT on restore, because we have no way to
+			 * save/restore EVENT and userspace missing an event
+			 * would be worse than getting a spurious one.
+			 */
+		} else {
+			/*
+			 * If this context has never been scheduled, then we
+			 * just clean the CLA regs. Also clear EVENT by reading
+			 * STATUS, to provide a pristine context.
+			 */
+			cla_reg_read(dev, CLA_REG_STATUS(accid));
+		}
+	}
+
+	for (i = 0; i < CLA_NUM_DATA_REGS; i++)
+		cla_reg_write(dev, CLA_REG_DATA(i), regs->data[i]);
+	cla_reg_write(dev, CLA_REG_LRESP, regs->lresp);
+
+	return 0;
+}
+
+/**
+ * cla_regs_install - Install and/or restore CLA context
+ * @dev: CLA device
+ * @ctx: CLA context to install
+ * @ctx_id: CLA context number within the domain
+ *
+ * Save the kernel context if necessary, and install a user context.
+ *
+ * PL0 context: Restore the DATA and LRESP registers, and accelerator state if
+ * one has been saved.
+ *
+ * This function is called with all accelerators idle and no trace of previous
+ * work.
+ *
+ * Return: 0 on success, or an error
+ */
+int cla_regs_install(struct cla_dev *dev, struct cla_ctx *ctx,
+		     unsigned int ctx_id)
+{
+	return cla_regs_install_pl0(dev, ctx, ctx_id);
+}
+
+/**
+ * cla_regs_uninstall - Remove and/or save CLA context
+ * @dev: CLA device
+ * @ctx: CLA context to remove
+ * @ctx_id: CLA context number within the domain
+ *
+ * Uninstall a user context, and restore the kernel context if necessary.
+ *
+ * PL0 context: Save the DATA and LRESP registers and accelerator state.
+ *
+ * When this completes, all accelerators are idle. If this fails, some
+ * accelerators may still be running.
+ *
+ * Return: 0 on success, or an error.
+ */
+int cla_regs_uninstall(struct cla_dev *dev, struct cla_ctx *ctx,
+		       unsigned int ctx_id)
+{
+	return cla_regs_uninstall_pl0(dev, ctx, ctx_id);
+}
+
+/**
+ * cla_ctx_alloc_regs - Allocate register state for a CLA context
+ * @domain: CLA domain
+ * @ctx: CLA context
+ *
+ * Allocate register state to save and restore every device in @domain, store it
+ * in @ctx.
+ *
+ * Return: 0 on success, or an error
+ */
+int cla_ctx_alloc_regs(struct cla_domain *domain, struct cla_ctx *ctx)
+{
+	void **regs_ptrs;
+	size_t size;
+	int i;
+
+	regs_ptrs = kmalloc_objs(*regs_ptrs, domain->nr_devs,
+				 GFP_KERNEL_ACCOUNT);
+	if (!regs_ptrs)
+		return -ENOMEM;
+
+	for (i = 0; i < domain->nr_devs; i++) {
+		struct cla_dev *dev = domain->devs[i];
+		size_t nr_regstate = dev->iassizes / sizeof(u64);
+		void *regs;
+
+		/*
+		 * The regs structures are only ever accessed from the CLA
+		 * device's CPU, so try to allocate them on the right NUMA node
+		 */
+		size = struct_size_t(struct cla_regs_pl0, regstate, nr_regstate);
+		regs = kvzalloc_node(size, GFP_KERNEL_ACCOUNT,
+				     cpu_to_node(dev->cpu));
+		if (!regs)
+			goto err_free;
+
+		regs_ptrs[i] = regs;
+	}
+
+	ctx->regs = regs_ptrs;
+	return 0;
+
+err_free:
+	for (i--; i >= 0; i--)
+		kvfree(regs_ptrs[i]);
+	kfree(regs_ptrs);
+	return -ENOMEM;
+}
+
+/**
+ * cla_ctx_free_regs - Free register state for a CLA context
+ * @domain: CLA domain
+ * @ctx: CLA context
+ */
+void cla_ctx_free_regs(struct cla_domain *domain, struct cla_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < domain->nr_devs; i++)
+		kvfree(ctx->regs[i]);
+	kfree(ctx->regs);
+}
-- 
2.43.0


