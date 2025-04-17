Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4826FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjHhKkJJuIfTgHd8sny80l1VSLjLH7wMQLPtWx/1Fp8=; b=GuLpldtpw6/nVVvnPlZG8XqohO
	cNUyRK8Ea62JM9mwm0CFepjHfwfbpz+z768a2/agHHXnL0ktLWBww8of3ZFz6DfR4NRZpcgx7CvND
	HcUO+Z35iDpRIsTLBkB88H+W0rCnuyWs4CvKYHBJjVEbmo8oKMjyEz9gY/Rj2zEDA9ln5U6iP+wU/
	6H+7RFvTB6Sy1foUvwBiWLivwyIUvpaYp9Qo+7pV0mhea3KtkLXUvrSqzyGC8FOFVz6aNmxBuPevj
	KpYfe8IFPxu/ZNUfG9EYdoWUUTgEyPbyMyKsLyDvcf4sJoE/QoXX+kK7xeZP5cK7SJXdi2h+8Nksy
	w0xBMyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OoG-0000000D3iW-00tQ;
	Thu, 17 Apr 2025 12:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Obs-0000000D1qx-1Rqc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 12:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TjHhKkJJuIfTgHd8sny80l1VSLjLH7wMQLPtWx/1Fp8=; b=G9XYqBDIDL5PGoNdgNoKG/6Q8Q
	g53f0FJp16y4WVVGowkXFPOFVqRdGn33x98wEknqNTocoQS2yLifFaZno8LVkfPcFweUmLL73yDxO
	HnuOSo3eoXXTozfM2sC8NNAA5mcrmuTlQoPBvn8Cp1cXEGenqFqZOV7saLSVHcOqPUW1SfztzLlmk
	LbCDoRnM6CjRNmW5sOtMkN1u8DbxFpBqEXxIa3DOFAg8aZ7YznaVIB/oai1bmy62XOBnHTDYAcNng
	A9P4pyqhKQ71XqEfzEupZSDeF1kPqWLhohvwb83dOVrGoWJ3kCQnB4XnrPUUFAgINne8gkJ7568Lc
	y3ocnlfw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5Obo-0000000AHHb-3rJE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:44:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiO3Q014424
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893864;
	bh=TjHhKkJJuIfTgHd8sny80l1VSLjLH7wMQLPtWx/1Fp8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uDqrp5CM30OLjXMpha7y1LHfmI7lnfcli/PcpkmZTQkZQBim2diXTHWlOf++KLuhm
	 BLCrL4S6C94HROpeTlgoDq2dxdLSJGZhHu0yip7dd5xg3Q4eMCuRPO0ZSrrtrazOhy
	 CYQJYBFF6coCpCYAveQgHiuuLA4yG8uh0hkmBJe8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCiOgx016096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:44:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:44:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:44:24 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCi9XD048918;
	Thu, 17 Apr 2025 07:44:19 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <18255117159@163.com>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>
CC: <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v4 2/4] PCI: cadence-host: Introduce cdns_pcie_host_disable helper for cleanup
Date: Thu, 17 Apr 2025 18:14:06 +0530
Message-ID: <20250417124408.2752248-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417124408.2752248-1-s-vadapalli@ti.com>
References: <20250417124408.2752248-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_134449_377219_CF308C44 
X-CRM114-Status: GOOD (  14.15  )
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

Introduce the helper function cdns_pcie_host_disable() which will undo
the configuration performed by cdns_pcie_host_setup(). Also, export it
for use by existing callers of cdns_pcie_host_setup(), thereby allowing
them to cleanup on their exit path.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

v3 patch is at:
https://lore.kernel.org/r/20250410104426.463453-3-s-vadapalli@ti.com/
No changes since v3.

Regards,
Siddharth.

 .../controller/cadence/pcie-cadence-host.c    | 104 ++++++++++++++++++
 drivers/pci/controller/cadence/pcie-cadence.h |   5 +
 2 files changed, 109 insertions(+)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 96055edeb099..741508738f88 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -152,6 +152,14 @@ static int cdns_pcie_retrain(struct cdns_pcie *pcie)
 	return ret;
 }
 
+static void cdns_pcie_host_disable_ptm_response(struct cdns_pcie *pcie)
+{
+	u32 val;
+
+	val = cdns_pcie_readl(pcie, CDNS_PCIE_LM_PTM_CTRL);
+	cdns_pcie_writel(pcie, CDNS_PCIE_LM_PTM_CTRL, val & ~CDNS_PCIE_LM_TPM_CTRL_PTMRSEN);
+}
+
 static void cdns_pcie_host_enable_ptm_response(struct cdns_pcie *pcie)
 {
 	u32 val;
@@ -177,6 +185,26 @@ static int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc)
 	return ret;
 }
 
+static void cdns_pcie_host_deinit_root_port(struct cdns_pcie_rc *rc)
+{
+	struct cdns_pcie *pcie = &rc->pcie;
+	u32 value, ctrl;
+
+	cdns_pcie_rp_writew(pcie, PCI_CLASS_DEVICE, 0xffff);
+	cdns_pcie_rp_writeb(pcie, PCI_CLASS_PROG, 0xff);
+	cdns_pcie_rp_writeb(pcie, PCI_CLASS_REVISION, 0xff);
+	cdns_pcie_writel(pcie, CDNS_PCIE_LM_ID, 0xffffffff);
+	cdns_pcie_rp_writew(pcie, PCI_DEVICE_ID, 0xffff);
+	ctrl = CDNS_PCIE_LM_BAR_CFG_CTRL_DISABLED;
+	value = ~(CDNS_PCIE_LM_RC_BAR_CFG_BAR0_CTRL(ctrl) |
+		CDNS_PCIE_LM_RC_BAR_CFG_BAR1_CTRL(ctrl) |
+		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_ENABLE |
+		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_64BITS |
+		CDNS_PCIE_LM_RC_BAR_CFG_IO_ENABLE |
+		CDNS_PCIE_LM_RC_BAR_CFG_IO_32BITS);
+	cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
+}
+
 static int cdns_pcie_host_init_root_port(struct cdns_pcie_rc *rc)
 {
 	struct cdns_pcie *pcie = &rc->pcie;
@@ -393,6 +421,32 @@ static int cdns_pcie_host_dma_ranges_cmp(void *priv, const struct list_head *a,
         return resource_size(entry2->res) - resource_size(entry1->res);
 }
 
+static void cdns_pcie_host_unmap_dma_ranges(struct cdns_pcie_rc *rc)
+{
+	struct cdns_pcie *pcie = &rc->pcie;
+	enum cdns_pcie_rp_bar bar;
+	u32 value;
+
+	/* Reset inbound configuration for all BARs which were being used */
+	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++) {
+		if (rc->avail_ib_bar[bar])
+			continue;
+
+		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR0(bar), 0);
+		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR1(bar), 0);
+
+		if (bar == RP_NO_BAR)
+			continue;
+
+		value = ~(LM_RC_BAR_CFG_CTRL_MEM_64BITS(bar) |
+			  LM_RC_BAR_CFG_CTRL_PREF_MEM_64BITS(bar) |
+			  LM_RC_BAR_CFG_CTRL_MEM_32BITS(bar) |
+			  LM_RC_BAR_CFG_CTRL_PREF_MEM_32BITS(bar) |
+			  LM_RC_BAR_CFG_APERTURE(bar, bar_aperture_mask[bar] + 2));
+		cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
+	}
+}
+
 static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
 {
 	struct cdns_pcie *pcie = &rc->pcie;
@@ -430,6 +484,29 @@ static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
 	return 0;
 }
 
+static void cdns_pcie_host_deinit_address_translation(struct cdns_pcie_rc *rc)
+{
+	struct cdns_pcie *pcie = &rc->pcie;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
+	struct resource_entry *entry;
+	int r;
+
+	cdns_pcie_host_unmap_dma_ranges(rc);
+
+	/*
+	 * Reset outbound region 0 which was reserved for configuration space
+	 * accesses.
+	 */
+	cdns_pcie_reset_outbound_region(pcie, 0);
+
+	/* Reset rest of the outbound regions */
+	r = 1;
+	resource_list_for_each_entry(entry, &bridge->windows) {
+		cdns_pcie_reset_outbound_region(pcie, r);
+		r++;
+	}
+}
+
 static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 {
 	struct cdns_pcie *pcie = &rc->pcie;
@@ -487,6 +564,12 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	return cdns_pcie_host_map_dma_ranges(rc);
 }
 
+static void cdns_pcie_host_deinit(struct cdns_pcie_rc *rc)
+{
+	cdns_pcie_host_deinit_address_translation(rc);
+	cdns_pcie_host_deinit_root_port(rc);
+}
+
 int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
 {
 	int err;
@@ -499,6 +582,14 @@ int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
 }
 EXPORT_SYMBOL_GPL(cdns_pcie_host_init);
 
+static void cdns_pcie_host_link_disable(struct cdns_pcie_rc *rc)
+{
+	struct cdns_pcie *pcie = &rc->pcie;
+
+	cdns_pcie_stop_link(pcie);
+	cdns_pcie_host_disable_ptm_response(pcie);
+}
+
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
 {
 	struct cdns_pcie *pcie = &rc->pcie;
@@ -524,6 +615,19 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
 }
 EXPORT_SYMBOL_GPL(cdns_pcie_host_link_setup);
 
+void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
+{
+	struct pci_host_bridge *bridge;
+
+	bridge = pci_host_bridge_from_priv(rc);
+	pci_stop_root_bus(bridge->bus);
+	pci_remove_root_bus(bridge->bus);
+
+	cdns_pcie_host_deinit(rc);
+	cdns_pcie_host_link_disable(rc);
+}
+EXPORT_SYMBOL_GPL(cdns_pcie_host_disable);
+
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 {
 	struct device *dev = rc->pcie.dev;
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 4b7f295e24e7..0b6bed1ac146 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -523,6 +523,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
 int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
+void cdns_pcie_host_disable(struct cdns_pcie_rc *rc);
 void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 			       int where);
 #else
@@ -541,6 +542,10 @@ static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	return 0;
 }
 
+static inline void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
+{
+}
+
 static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 					     int where)
 {
-- 
2.34.1


