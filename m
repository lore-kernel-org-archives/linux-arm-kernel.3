Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7004FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsN1T6L83srZgilF5kt3qouXhBxTQ7s/Q1aBq4w0S/I=; b=BQxhsBjuBqnXZSRtI9PfoMY2Nb
	GuRCrAmCRu17oduT6PAbwr2lXjgcfMT9kuIMaS4R+z1OuU1b3ifAOTLW00urlg3OIExCdfa7DYo3y
	oiVB1OtJwD8OCKdOmtRK0VrUI3PxSyUhkrQd+GFdF+OPemCRr124vm80SxCkDnXYFGKh9yUYW7GOl
	qTNWsVqtz6tA5TSM0HWB/lr5ObxkH+Sfm3MfrLv0FS7avK8+2AcAwNYjc1j+JviSu+wfsan5x24Z0
	TpldZV9NgOWTgo/k5C8TNIZGU9M1GL9jUuZGFn6AKy7SK3BDhYTjMBRDiKUhHIVUr42LtKBqxO19c
	a09lE6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaoi-0000000CAxu-3B0v;
	Fri, 03 Jan 2025 06:05:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTajv-0000000CA0e-2YlE;
	Fri, 03 Jan 2025 06:00:57 +0000
X-UUID: 149cec3cc99811ef9048ed6ed365623b-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TsN1T6L83srZgilF5kt3qouXhBxTQ7s/Q1aBq4w0S/I=;
	b=aNaXvgf/AvIsHxoZQ4CoUHne+8bvsWYH48481XdPlwjtFZeFWZQAqNPk7dT+I5sxmL9Nd6CB2A9H+xGEOkWjloYN4yHOV4eQQ0rDrSUMrJ6FvmsC8X7shZvOEJDgUCOea4+kVI/DVA7ZGbCIgu8whN63zTA0vWFrXzZRmAt6xHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c2471643-0288-4d98-806c-9a5db5a96549,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:61db4b37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 149cec3cc99811ef9048ed6ed365623b-20250102
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 284206438; Thu, 02 Jan 2025 23:00:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:45 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: [PATCH 2/5] PCI: mediatek-gen3: Add MT8196 support
Date: Fri, 3 Jan 2025 14:00:12 +0800
Message-ID: <20250103060035.30688-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250103060035.30688-1-jianjun.wang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220055_658128_F0AAE67B 
X-CRM114-Status: GOOD (  22.11  )
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

The MT8196 is an ARM platform SoC that has the same PCIe IP as the
MT8195.
However, it requires additional settings in the pextpcfg registers.
Introduce pextpcfg in PCIe driver for these settings.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 88 +++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123ab..ed3c0614486c 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
@@ -123,6 +124,17 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+#define PCIE_RESOURCE_CTRL_REG		0xd2c
+#define PCIE_SYS_CLK_RDY_TIME_MASK	GENMASK(7, 0)
+#define PCIE_SYS_CLK_RDY_TIME_TO_10US	0xa
+
+/* PEXTPCFG Registers */
+#define PEXTP_CLOCK_CON_REG		0x20
+#define PEXTP_P0P1_LOWPOWER_CK_SEL	BIT(0)
+#define PEXTP_REQ_CTRL_0_REG		0x7c
+#define PEXTP_26M_REQ_FORCE_ON		BIT(0)
+#define PEXTP_PCIE26M_BYPASS		BIT(4)
+
 #define MAX_NUM_PHY_RESETS		3
 
 /* Time in ms needed to complete PCIe reset on EN7581 SoC */
@@ -136,10 +148,14 @@ struct mtk_gen3_pcie;
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
+ * @pre_init: initialize settings before link up
+ * @cleanup: cleanup when PCIe power down
  * @phy_resets: phy reset lines SoC data.
  */
 struct mtk_gen3_pcie_pdata {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
+	int (*pre_init)(struct mtk_gen3_pcie *pcie);
+	void (*cleanup)(struct mtk_gen3_pcie *pcie);
 	struct {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
@@ -162,6 +178,7 @@ struct mtk_msi_set {
  * struct mtk_gen3_pcie - PCIe port information
  * @dev: pointer to PCIe device
  * @base: IO mapped register base
+ * @pextpcfg: pextpcfg_ao IO mapped register base
  * @reg_base: physical register base
  * @mac_reset: MAC reset control
  * @phy_resets: PHY reset controllers
@@ -184,6 +201,7 @@ struct mtk_msi_set {
 struct mtk_gen3_pcie {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *pextpcfg;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
 	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
@@ -422,6 +440,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
 	}
 
+	/*
+	 * The values of some registers are different in RC and EP mode. Therefore,
+	 * call soc->pre_init after the mode change in case it depends on these registers.
+	 */
+	if (pcie->soc && pcie->soc->pre_init)
+		pcie->soc->pre_init(pcie);
+
 	/* Set class code */
 	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
 	val &= ~GENMASK(31, 8);
@@ -848,6 +873,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	int i, ret, num_resets = pcie->soc->phy_resets.num_resets;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *node;
 	struct resource *regs;
 	u32 num_lanes;
 
@@ -903,6 +929,18 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 			pcie->num_lanes = num_lanes;
        }
 
+	node = of_parse_phandle(dev->of_node, "pextpcfg", 0);
+	if (node) {
+		pcie->pextpcfg = of_iomap(node, 0);
+		of_node_put(node);
+		if (IS_ERR(pcie->pextpcfg)) {
+			dev_err(dev, "failed to get pextpcfg\n");
+			ret = PTR_ERR(pcie->pextpcfg);
+			pcie->pextpcfg = NULL;
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -1047,6 +1085,12 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+
+	if (pcie->soc && pcie->soc->cleanup)
+		pcie->soc->cleanup(pcie);
+
+	if (pcie->pextpcfg)
+		iounmap(pcie->pextpcfg);
 }
 
 static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
@@ -1277,6 +1321,49 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
 	},
 };
 
+static int mtk_pcie_mt8196_pre_init(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+
+	/* Adjust SYS_CLK_RDY_TIME ot 10us to avoid glitch */
+	val = readl_relaxed(pcie->base + PCIE_RESOURCE_CTRL_REG);
+	val &= ~PCIE_SYS_CLK_RDY_TIME_MASK;
+	val |= PCIE_SYS_CLK_RDY_TIME_TO_10US;
+	writel_relaxed(val, pcie->base + PCIE_RESOURCE_CTRL_REG);
+
+	/* Switch to normal clock */
+	val = readl_relaxed(pcie->pextpcfg + PEXTP_CLOCK_CON_REG);
+	val &= ~PEXTP_P0P1_LOWPOWER_CK_SEL;
+	writel_relaxed(val, pcie->pextpcfg + PEXTP_CLOCK_CON_REG);
+
+	/* Force pcie_26m_req and bypass pcie_26m_ack signal */
+	val = readl_relaxed(pcie->pextpcfg + PEXTP_REQ_CTRL_0_REG);
+	val |= (PEXTP_26M_REQ_FORCE_ON | PEXTP_PCIE26M_BYPASS);
+	writel_relaxed(val, pcie->pextpcfg + PEXTP_REQ_CTRL_0_REG);
+
+	return 0;
+}
+
+static void mtk_pcie_mt8196_cleanup(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+
+	/* Release pcie_26m_req and pcie_26m_ack signal */
+	val = readl_relaxed(pcie->pextpcfg + PEXTP_REQ_CTRL_0_REG);
+	val &= ~(PEXTP_26M_REQ_FORCE_ON | PEXTP_PCIE26M_BYPASS);
+	writel_relaxed(val, pcie->pextpcfg + PEXTP_REQ_CTRL_0_REG);
+}
+
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8196 = {
+	.power_up = mtk_pcie_power_up,
+	.pre_init = mtk_pcie_mt8196_pre_init,
+	.cleanup = mtk_pcie_mt8196_cleanup,
+	.phy_resets = {
+		.id[0] = "phy",
+		.num_resets = 1,
+	},
+};
+
 static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.power_up = mtk_pcie_en7581_power_up,
 	.phy_resets = {
@@ -1290,6 +1377,7 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
+	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
-- 
2.46.0


