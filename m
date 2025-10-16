Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D1CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHQyFSp6kQKhr9zkybrzkK9dsq8cpQCapkctcnOwOFE=; b=EMKw1BLC6lYo+uvkFofF4pMaoU
	nCOu+TBCcByb1on2tGbxxzzMDvEdyV66/fxLrrswcZO8SBtGh107JtRkkNneUnwdx5p6mQnkxty+S
	Cy4XFM85SLGbiawmCeNgwcRHu7yEMJsat5EXuqY7qTBNi4SSHo7h+uAeDWbLLxhpQyDdQtKlp2Pzn
	T3zSD1c34MiqyRLUgOcLZbH+A8xc8+DBBeD6Qo2WlPKJ/Z58glVDcrIVypabdWwntSUaqCB307Ie1
	5e4BCugFII4VTDL5uEVOcm6Ib/U/5DMXZBYvHQ/b4TbZIrbUXv/r9OUQGypXuhY211vSrUe9ugO6J
	gO8H7bKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KT5-00000004FCZ-08Bz;
	Thu, 16 Oct 2025 09:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KSw-00000004F5D-1qfB;
	Thu, 16 Oct 2025 09:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XHQyFSp6kQKhr9zkybrzkK9dsq8cpQCapkctcnOwOFE=; b=EKgHbdr0Pvg1n7orZYWeyLkhBJ
	h0d/OOughCVU2OKV5sCQX9mr7GlAe0IgOOE94fYJuZQPr1exE5i/Ay1Mysg40F+mLwntQ3LQNSWBZ
	vk49QyUWGaUC+h0r1/EXI2XCtKkBuW6UTHgwNidAPkIspC5WpzFWb+CW7zuaS95Ii8nKg4/eBEAj6
	WgnpugKfM2aOvFcU/Q2ecO7XeLGwvjKfxToOVbyvzSbf4i2SmG1Y9CipgYh9n2tpPlYP3CBqLfzQa
	rkddOH8H7lgG2TpBTygSsMv2lX4gsorAtna03QqjxGPeBL7MZguNRMp7QKsHcNghT9zVkDItkKtRQ
	Ptj9irFQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KSq-00000006dj0-1QeP;
	Thu, 16 Oct 2025 09:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607602;
	bh=8cL0o7YIJIvGUvRZR66YUBaDYpCZRcjsM75QNQKQhV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wy2FPi+CN0Bh/AZuCvuL2G29Mu3Tdjf5wo6Xzt/tYrs+vNEETnzVlPR4qaITdTiVX
	 BpuCEE5EfwT3qB30pRNoC8mYXWXVLMFhc8cqia05ZV9Aq8lGOV1u1cGfxr4ftmZJPs
	 0nyXfkL4XHeRuD5EudjmDGHLKKoEcuTiRtwKtSnl4ds4iHBl4r89epbuKfK9nquEnr
	 yoLqSLtwbNFw24xCSPrqecQjYky06CAjmM8FMhjEr5juFyXcd7v9QaNzrkmMrGTWqb
	 GQFiRuupQEehPZPwXOllQDjeYsofLlSeSw7dczBO9KZhNWt+ykD0tinBfb1BOBbA4/
	 3xOBPtCEKohvA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B8CC17E1404;
	Thu, 16 Oct 2025 11:40:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 4/5] spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
Date: Thu, 16 Oct 2025 11:39:48 +0200
Message-ID: <20251016093949.127326-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016093949.127326-1-angelogioacchino.delregno@collabora.com>
References: <20251016093949.127326-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_104007_463159_92F843F9 
X-CRM114-Status: GOOD (  25.50  )
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

Add support for the per-bus RCS interrupt by adding a new linear
irqdomain and its irqchip.

The SPMI controller will raise an interrupt when any of the SPMI
connected devices' irq needs attention (whenever any interrupt
fires on any SID) in one of four registers, where each register
holds four sets of four bits of information about a SID interrupt.

This controller's RCS interrupt status knowledge is limited to the
address of the SID that raised an interrupt, but does not have any
details about the devices irq numbers: as this may change with a
future SPMI controller IP version, the devicetree is meant to hold
three cells, where the first one is the SPMI SID interrupt number,
the second one is a device interrupt number, and the third one is
the irq sense type.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 231 ++++++++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 9f416b231ab8..ad7b0cc9cdaa 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -5,12 +5,17 @@
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spmi.h>
+#include <linux/irqchip/chained_irq.h>
 
 #define SWINF_IDLE	0x00
 #define SWINF_WFVLDCLR	0x06
@@ -26,6 +31,7 @@
 #define PMIF_TIMEOUT_US (10 * 1000)
 
 #define PMIF_CHAN_OFFSET 0x5
+#define PMIF_RCS_IRQ_MASK	GENMASK(7, 0)
 
 #define PMIF_MAX_BUSES	2
 #define PMIF_MAX_CLKS	3
@@ -44,6 +50,7 @@ struct pmif_data {
 	const u32	*regs;
 	const u32	*spmimst_regs;
 	u32	soc_chan;
+	u8	spmi_ver;
 	u32	num_spmi_buses;
 };
 
@@ -51,8 +58,14 @@ struct pmif_bus {
 	void __iomem	*base;
 	void __iomem	*spmimst_base;
 	struct spmi_controller *ctrl;
+	struct irq_domain *dom;
+	int irq;
 	struct clk_bulk_data clks[PMIF_MAX_CLKS];
 	size_t nclks;
+	struct mutex rcs_lock;
+	u8 irq_min_sid;
+	u8 irq_max_sid;
+	u16 irq_en;
 	raw_spinlock_t	lock;
 };
 
@@ -287,6 +300,11 @@ static void pmif_writel(struct pmif *arb, struct pmif_bus *pbus,
 	writel(val, pbus->base + arb->data->regs[reg]);
 }
 
+static u32 mtk_spmi_readl(struct pmif *arb, struct pmif_bus *pbus, enum spmi_regs reg)
+{
+	return readl(pbus->spmimst_base + arb->data->spmimst_regs[reg]);
+}
+
 static void mtk_spmi_writel(struct pmif *arb, struct pmif_bus *pbus,
 			    u32 val, enum spmi_regs reg)
 {
@@ -455,6 +473,157 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	return 0;
 }
 
+static void mtk_spmi_handle_chained_irq(struct irq_desc *desc)
+{
+	struct pmif_bus *pbus = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	u8 regidx_min, regidx_max;
+	bool irq_handled = false;
+	unsigned int i;
+
+	regidx_min = pbus->irq_min_sid / 4;
+	regidx_min += SPMI_SLV_3_0_EINT;
+
+	regidx_max = pbus->irq_max_sid / 4;
+	regidx_min += SPMI_SLV_3_0_EINT;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = regidx_min; i <= regidx_max; i++) {
+		u32 val = mtk_spmi_readl(arb, pbus, i);
+
+		while (val) {
+			u8 bit = __ffs(val);
+			u8 bank = bit / 7;
+			u8 sid = ((i - SPMI_SLV_3_0_EINT) * 4) + bank;
+
+			val &= ~(PMIF_RCS_IRQ_MASK << (8 * bank));
+
+			/* Check if IRQs for this SID are enabled */
+			if (!(pbus->irq_en & BIT(sid)))
+				continue;
+
+			generic_handle_domain_irq(pbus->dom, sid);
+			irq_handled = true;
+		}
+	}
+
+	if (!irq_handled)
+		handle_bad_irq(desc);
+
+	chained_irq_exit(chip, desc);
+}
+
+static void mtk_spmi_rcs_irq_ack(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+	unsigned int reg, shift;
+
+	/* There are four interrupts (8 bits each) per register */
+	reg = SPMI_SLV_3_0_EINT + d->hwirq / 4;
+	shift = (irq % 4) * 8;
+
+	mtk_spmi_writel(arb, pbus, PMIF_RCS_IRQ_MASK << shift, reg);
+}
+
+static void mtk_spmi_rcs_irq_lock(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&pbus->rcs_lock);
+}
+
+static void mtk_spmi_rcs_irq_sync_unlock(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+
+	mutex_unlock(&pbus->rcs_lock);
+}
+
+static void mtk_spmi_rcs_irq_enable(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+
+	pbus->irq_en |= BIT(irq);
+}
+
+static void mtk_spmi_rcs_irq_disable(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+
+	pbus->irq_en &= ~BIT(irq);
+}
+
+static int mtk_spmi_rcs_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+
+	return irq_set_irq_wake(pbus->irq, on);
+}
+
+static const struct irq_chip mtk_spmi_rcs_irq_chip = {
+	.name			= "spmi_rcs",
+	.irq_ack		= mtk_spmi_rcs_irq_ack,
+	.irq_bus_lock		= mtk_spmi_rcs_irq_lock,
+	.irq_bus_sync_unlock	= mtk_spmi_rcs_irq_sync_unlock,
+	.irq_enable		= mtk_spmi_rcs_irq_enable,
+	.irq_disable		= mtk_spmi_rcs_irq_disable,
+	.irq_set_wake		= mtk_spmi_rcs_irq_set_wake,
+};
+
+static int mtk_spmi_rcs_irq_map(struct irq_domain *d, unsigned int virq,
+				irq_hw_number_t hwirq)
+{
+	struct pmif_bus *pbus = d->host_data;
+
+	irq_set_chip_data(virq, pbus);
+	irq_set_chip_and_handler(virq, &mtk_spmi_rcs_irq_chip, handle_level_irq);
+
+	return 0;
+}
+
+static int mtk_spmi_rcs_irq_xlate(struct irq_domain *d, struct device_node *ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pmif_bus *pbus = d->host_data;
+	struct device *dev = &pbus->ctrl->dev;
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+	if (WARN_ON(fwspec.param_count < 3))
+		return -EINVAL;
+
+	/*
+	 * The IRQ number in intspec[1] is ignored on purpose here!
+	 *
+	 * The controller only has knowledge of which SID raised an interrupt
+	 * and the type of irq, but doesn't know about any device irq number,
+	 * hence that must be read from the SPMI device's registers.
+	 */
+	*out_hwirq = intspec[0];
+	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
+
+	if (pbus->irq_min_sid > intspec[0])
+		pbus->irq_min_sid = intspec[0];
+
+	if (pbus->irq_max_sid < intspec[0])
+		pbus->irq_max_sid = intspec[0];
+
+	dev_dbg(dev, "Found SPMI IRQ %u (map: 0x%lx)\n", intspec[0], *out_hwirq);
+	return 0;
+}
+
+static const struct irq_domain_ops mtk_spmi_rcs_irq_domain_ops = {
+	.map	= mtk_spmi_rcs_irq_map,
+	.xlate	= mtk_spmi_rcs_irq_xlate,
+};
+
 static const struct pmif_data mt6873_pmif_arb = {
 	.regs = mt6873_regs,
 	.spmimst_regs = mt6873_spmi_regs,
@@ -467,6 +636,45 @@ static const struct pmif_data mt8195_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static int mtk_spmi_irq_init(struct device_node *node,
+			     const struct pmif_data *pdata,
+			     struct pmif_bus *pbus)
+{
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	unsigned int i;
+
+	/* No interrupts required for SPMI 1.x controller */
+	if (pdata->spmi_ver < 2) {
+		pbus->dom = NULL;
+		return 0;
+	}
+
+	pbus->irq = of_irq_get_byname(node, "rcs");
+	if (pbus->irq <= 0)
+		return pbus->irq ? : -ENXIO;
+
+	mutex_init(&pbus->rcs_lock);
+
+	pbus->dom = irq_domain_add_tree(node, &mtk_spmi_rcs_irq_domain_ops, pbus);
+	if (!pbus->dom)
+		return -ENOMEM;
+
+	/* Clear possible unhandled interrupts coming from bootloader SPMI init */
+	for (i = SPMI_SLV_3_0_EINT; i <= SPMI_SLV_F_C_EINT; i++)
+		mtk_spmi_writel(arb, pbus, GENMASK(31, 0), i);
+
+	return 0;
+}
+
+static void mtk_spmi_irq_remove(struct pmif_bus *pbus)
+{
+	if (!pbus->dom)
+		return;
+
+	irq_set_chained_handler_and_data(pbus->irq, NULL, NULL);
+	irq_domain_remove(pbus->dom);
+}
+
 static int mtk_spmi_bus_probe(struct platform_device *pdev,
 			      struct device_node *node,
 			      const struct pmif_data *pdata,
@@ -512,12 +720,21 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 		pbus->clks[i].id = pmif_clock_names[i];
 		pbus->clks[i].clk = of_clk_get_by_name(node, pbus->clks[i].id);
 		if (IS_ERR(pbus->clks[i].clk))
-			return PTR_ERR(pbus->clks[i].clk);
+			return dev_err_probe(&pdev->dev, PTR_ERR(pbus->clks[i].clk),
+					     "Failed to get clocks\n");
 	}
 
 	err = clk_bulk_prepare_enable(pbus->nclks, pbus->clks);
-	if (err)
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Failed to enable clocks\n");
 		goto err_put_clks;
+	}
+
+	err = mtk_spmi_irq_init(node, pdata, pbus);
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Cannot initialize SPMI IRQs\n");
+		goto err_disable_clks;
+	}
 
 	ctrl->cmd = pmif_arb_cmd;
 	ctrl->read_cmd = pmif_spmi_read_cmd;
@@ -529,13 +746,16 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 
 	err = spmi_controller_add(ctrl);
 	if (err)
-		goto err_domain_remove;
+		goto err_remove_irq;
 
-	pbus->ctrl = ctrl;
+	if (pbus->dom)
+		irq_set_chained_handler_and_data(pbus->irq, mtk_spmi_handle_chained_irq, pbus);
 
 	return 0;
 
-err_domain_remove:
+err_remove_irq:
+	mtk_spmi_irq_remove(pbus);
+err_disable_clks:
 	clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);
 err_put_clks:
 	clk_bulk_put(pbus->nclks, pbus->clks);
@@ -600,6 +820,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 		if (!pbus->ctrl)
 			continue;
 
+		mtk_spmi_irq_remove(pbus);
 		spmi_controller_remove(pbus->ctrl);
 		clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);
 		clk_bulk_put(pbus->nclks, pbus->clks);
-- 
2.51.0


