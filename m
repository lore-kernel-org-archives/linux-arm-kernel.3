Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF2CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlfMEbuNKRt0Y8GuGIo5sMuGI6165ASv6AlXFVNFP/o=; b=eZkaWXXXb/c4jSmOzZDleVWAd8
	139wysoQbZA42GyFKLwIz1i5U/3YHkptpUMTENjgr584bgrcthP3homrHOchxm5vpjCFYIen9s6YS
	4/xEFBPWzC333BXvprOisVLW3/kEybEWrf5NHUZ1Yim7p537WbgLV98budu75aR59WUbbou9Du8nQ
	8jvpqAx1Eqt+HJ95V4SKN+ZpPq8XXScX3Xrz1lsnNRDA0fc7mS1B6c8Cchjwf1MutDycZP8e0YzLA
	L5RcZYg+JHttscP4D6ewB47YSzCZc7Y+vbGBOYLEfAlw9+E22rId2vya7OmmZXA+RE1yUPqfX3G5f
	RHrk0bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4C-0000000DUWP-09cl;
	Mon, 20 Oct 2025 12:32:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp29-0000000DRdk-3u1I
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SlfMEbuNKRt0Y8GuGIo5sMuGI6165ASv6AlXFVNFP/o=; b=Mza8srynSkBEsztUb+KHpizeWI
	OWgjRYkXUQ8IYjNQo9MwdkanDMOBqzwhaHeGOhIKPDFNGDMXWTzOiltZIcsVixfQ1rfrPDNYEuHTD
	ly8kt2hRX1rY6EoqmMjve87+S0nv5r9/JsFs7p+E08rrcuttwmaUGfyGqahRze4R8nBfo+paFaq4U
	ndTq/o0u/t9l6rUKDvhLoMMxlR2Bu3jbURZAU4dMbuBceJwUQCiNJTAdhINi5rqDylaNapUy1xYoU
	ooHJ7jQLyim9pXPBQsJPvYnEjSYTzSH0CXjk8bJbpR+Dx4E16k3d/qjrfLa6w4M5G4LlBm7mQ7E2h
	qOmoKfgQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp25-000000074Hz-1q7O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C38AB48ACB;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C27C4CEF9;
	Mon, 20 Oct 2025 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963415;
	bh=28uyvToSZ2wxs4D1BkP60rnZSmMDcYW5fh2ng+t4laQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HC6zfLSgImuLu3xwiOcw2Avn/Ddq7/OI9lz5RPHGb6gX2TjWdSgjUfM9CbcGCObiM
	 xyJ7VnCCWCV88lSFlGpUIt13hpROXffa41lrisfwr4zDp6ILfvk/uynl8Pr1HyvFP6
	 RCTY8GOir/plxxRMXHKZ/uJYzg7QKyrW9tYeSsMKqnqopj3chDSTLEUO4JHWdZ/mDw
	 mDBMt+cUK8RZgEmHjHz3Qs4/N9rgKwxoj1+GWKfx9MWpXc8t++4N4K/Y+0SnGy8xEe
	 bW+lqgvuaRbA3pBPCyViISdI3i9OJAIwpI+LWyM+Dq9fVODpIkgI49un9GYGYUwnKB
	 inO7Y/+LNdAlw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1h-0000000FUu2-38od;
	Mon, 20 Oct 2025 12:30:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 21/26] irqchip/gic-v3: Drop support for custom PPI partitions
Date: Mon, 20 Oct 2025 13:29:38 +0100
Message-ID: <20251020122944.3074811-22-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133039_023664_036BE96C 
X-CRM114-Status: GOOD (  23.28  )
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

The only thing getting in the way of correctly handling PPIs the way
they were intended is the GICv3 hack that deals with PPI partitions.

Remove that code, allowing the common code to kick in.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Kconfig      |   1 -
 drivers/irqchip/irq-gic-v3.c | 133 +++--------------------------------
 2 files changed, 8 insertions(+), 126 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a61c6dc63c29c..648b3618fc784 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -36,7 +36,6 @@ config GIC_NON_BANKED
 config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
-	select PARTITION_PERCPU
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	select HAVE_ARM_SMCCC_DISCOVERY
 	select IRQ_MSI_IOMMU
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index dd2d6d722fc5e..6607ab58f72e6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -26,7 +26,6 @@
 #include <linux/irqchip/arm-gic-common.h>
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/irqchip/arm-gic-v3-prio.h>
-#include <linux/irqchip/irq-partition-percpu.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/arm-smccc.h>
@@ -46,8 +45,6 @@ static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
 #define FLAGS_WORKAROUND_ASR_ERRATUM_8601001	(1ULL << 2)
 #define FLAGS_WORKAROUND_INSECURE		(1ULL << 3)
 
-#define GIC_IRQ_TYPE_PARTITION	(GIC_IRQ_TYPE_LPI + 1)
-
 static struct cpumask broken_rdists __read_mostly __maybe_unused;
 
 struct redist_region {
@@ -68,11 +65,15 @@ struct gic_chip_data {
 	u64			flags;
 	bool			has_rss;
 	unsigned int		ppi_nr;
-	struct partition_desc	**ppi_descs;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
 };
 
+struct partition_affinity {
+	cpumask_t			mask;
+	struct fwnode_handle		*partition_id;
+};
+
 #define T241_CHIPS_MAX		4
 static void __iomem *t241_dist_base_alias[T241_CHIPS_MAX] __read_mostly;
 static DEFINE_STATIC_KEY_FALSE(gic_nvidia_t241_erratum);
@@ -593,18 +594,6 @@ static void gic_irq_set_prio(struct irq_data *d, u8 prio)
 	writeb_relaxed(prio, base + offset + index);
 }
 
-static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
-{
-	switch (__get_intid_range(hwirq)) {
-	case PPI_RANGE:
-		return hwirq - 16;
-	case EPPI_RANGE:
-		return hwirq - EPPI_BASE_INTID + 16;
-	default:
-		unreachable();
-	}
-}
-
 static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
@@ -1628,13 +1617,6 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
 			*hwirq = fwspec->param[1];
 			break;
-		case GIC_IRQ_TYPE_PARTITION:
-			*hwirq = fwspec->param[1];
-			if (fwspec->param[1] >= 16)
-				*hwirq += EPPI_BASE_INTID - 16;
-			else
-				*hwirq += 16;
-			break;
 		default:
 			return -EINVAL;
 		}
@@ -1643,10 +1625,8 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		/*
 		 * Make it clear that broken DTs are... broken.
-		 * Partitioned PPIs are an unfortunate exception.
 		 */
-		WARN_ON(*type == IRQ_TYPE_NONE &&
-			fwspec->param[0] != GIC_IRQ_TYPE_PARTITION);
+		WARN_ON(*type == IRQ_TYPE_NONE);
 		return 0;
 	}
 
@@ -1703,33 +1683,12 @@ static void gic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	}
 }
 
-static bool fwspec_is_partitioned_ppi(struct irq_fwspec *fwspec,
-				      irq_hw_number_t hwirq)
-{
-	enum gic_intid_range range;
-
-	if (!gic_data.ppi_descs)
-		return false;
-
-	if (!is_of_node(fwspec->fwnode))
-		return false;
-
-	if (fwspec->param_count < 4 || !fwspec->param[3])
-		return false;
-
-	range = __get_intid_range(hwirq);
-	if (range != PPI_RANGE && range != EPPI_RANGE)
-		return false;
-
-	return true;
-}
-
 static int gic_irq_domain_select(struct irq_domain *d,
 				 struct irq_fwspec *fwspec,
 				 enum irq_domain_bus_token bus_token)
 {
-	unsigned int type, ppi_idx;
 	irq_hw_number_t hwirq;
+	unsigned int type;
 	int ret;
 
 	/* Not for us */
@@ -1748,15 +1707,7 @@ static int gic_irq_domain_select(struct irq_domain *d,
 	if (WARN_ON_ONCE(ret))
 		return 0;
 
-	if (!fwspec_is_partitioned_ppi(fwspec, hwirq))
-		return d == gic_data.domain;
-
-	/*
-	 * If this is a PPI and we have a 4th (non-null) parameter,
-	 * then we need to match the partition domain.
-	 */
-	ppi_idx = __gic_get_ppi_index(hwirq);
-	return d == partition_get_domain(gic_data.ppi_descs[ppi_idx]);
+	return d == gic_data.domain;
 }
 
 static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_info *info)
@@ -1813,45 +1764,6 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 	.get_fwspec_info = gic_irq_get_fwspec_info,
 };
 
-static int partition_domain_translate(struct irq_domain *d,
-				      struct irq_fwspec *fwspec,
-				      unsigned long *hwirq,
-				      unsigned int *type)
-{
-	unsigned long ppi_intid;
-	struct device_node *np;
-	unsigned int ppi_idx;
-	int ret;
-
-	if (!gic_data.ppi_descs)
-		return -ENOMEM;
-
-	np = of_find_node_by_phandle(fwspec->param[3]);
-	if (WARN_ON(!np))
-		return -EINVAL;
-
-	ret = gic_irq_domain_translate(d, fwspec, &ppi_intid, type);
-	if (WARN_ON_ONCE(ret))
-		return 0;
-
-	ppi_idx = __gic_get_ppi_index(ppi_intid);
-	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
-				     of_fwnode_handle(np));
-	if (ret < 0)
-		return ret;
-
-	*hwirq = ret;
-	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
-
-	return 0;
-}
-
-static const struct irq_domain_ops partition_domain_ops = {
-	.translate = partition_domain_translate,
-	.select = gic_irq_domain_select,
-	.get_fwspec_info = gic_irq_get_fwspec_info,
-};
-
 static bool gic_enable_quirk_msm8996(void *data)
 {
 	struct gic_chip_data *d = data;
@@ -2174,12 +2086,7 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 	if (!parts_node)
 		return;
 
-	gic_data.ppi_descs = kcalloc(gic_data.ppi_nr, sizeof(*gic_data.ppi_descs), GFP_KERNEL);
-	if (!gic_data.ppi_descs)
-		goto out_put_node;
-
 	nr_parts = of_get_child_count(parts_node);
-
 	if (!nr_parts)
 		goto out_put_node;
 
@@ -2235,30 +2142,6 @@ static void __init gic_populate_ppi_partitions(struct device_node *gic_node)
 	gic_data.parts = parts;
 	gic_data.nr_parts = nr_parts;
 
-	for (i = 0; i < gic_data.ppi_nr; i++) {
-		unsigned int irq;
-		struct partition_desc *desc;
-		struct irq_fwspec ppi_fwspec = {
-			.fwnode		= gic_data.fwnode,
-			.param_count	= 3,
-			.param		= {
-				[0]	= GIC_IRQ_TYPE_PARTITION,
-				[1]	= i,
-				[2]	= IRQ_TYPE_NONE,
-			},
-		};
-
-		irq = irq_create_fwspec_mapping(&ppi_fwspec);
-		if (WARN_ON(!irq))
-			continue;
-		desc = partition_create_desc(gic_data.fwnode, parts, nr_parts,
-					     irq, &partition_domain_ops);
-		if (WARN_ON(!desc))
-			continue;
-
-		gic_data.ppi_descs[i] = desc;
-	}
-
 out_put_node:
 	of_node_put(parts_node);
 }
-- 
2.47.3


