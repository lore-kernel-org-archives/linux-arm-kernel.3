Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE92C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 01:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svOZaxnlaASohhDS3XSmTFkaoFSdzYryto7BxNGEFFo=; b=fktLr96hOZ5ohWQ/XJfFYGphaR
	GDEtntxrt9cpkjvbUL+Eo2LGQnK51MLYuq2YR+HeydmmfFrk8vlk9ZgffiJGknuvuXLo3VPi975Gx
	4mgdDuMVimsMMbntgc6tnqrsGx8lle/via9BgXR1szQc4CoNAAaoTbD9sOo2dYA0kv+QwqJEHJGRV
	gV9t1wQIpVX3nToamG2ORGAqV+1rAoIZ4tVT8MbSm7YY6cq/5G5QsvL9IW5LeFUm5Oh/pf7CFPpSV
	2BnV+QZggQAl7b2ESYK2NLYCk+EWVN2V4iaiksjTouJJ0Vz/4Zx8e/9H3bDHk7A4GiC0x+tas2CG0
	UnHkQkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDT1-00000007zcb-3asA;
	Fri, 07 Feb 2025 01:47:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDQK-00000007zDJ-4BNk;
	Fri, 07 Feb 2025 01:44:54 +0000
X-UUID: 1c7cee0ce4f511ef82ff63e91e7eb18c-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=svOZaxnlaASohhDS3XSmTFkaoFSdzYryto7BxNGEFFo=;
	b=ZkvWfVAhgZnZzjgTJXw6ePXoIuTEgRIXeWkWQWF5AtuU60HJ+eCuOQxaXBFcGiEuiXEHBp3Lloz3cJZzAUIDSIumIRZPhvd4uDLfDxGsB4NHz8ZLJRy5bCHg4Wy7I+GHBk/DzLWyYVO5A14F4cVh7LD3RtvycT9rYw8Ul5Ju0DY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e1846691-dc24-4815-8500-98032b843119,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:1e8d45ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 1c7cee0ce4f511ef82ff63e91e7eb18c-20250206
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1675745735; Thu, 06 Feb 2025 18:44:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 09:44:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 09:44:43 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, kernel test robot
	<lkp@intel.com>
Subject: [v2,1/2] memory/mediatek: Add an interface to get current DDR data rate
Date: Fri, 7 Feb 2025 09:42:47 +0800
Message-ID: <20250207014437.17920-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250207014437.17920-1-crystal.guo@mediatek.com>
References: <20250207014437.17920-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_174453_041996_7E6CAA16 
X-CRM114-Status: GOOD (  22.63  )
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

Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412210955.FvO0Pee3-lkp@intel.
com/
Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/memory/Kconfig              |   1 +
 drivers/memory/Makefile             |   1 +
 drivers/memory/mediatek/Kconfig     |  21 +++
 drivers/memory/mediatek/Makefile    |   2 +
 drivers/memory/mediatek/mtk-dramc.c | 196 ++++++++++++++++++++++++++++
 5 files changed, 221 insertions(+)
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16ea..b1698549ff81 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -227,5 +227,6 @@ config STM32_FMC2_EBI
 
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
+source "drivers/memory/mediatek/Kconfig"
 
 endif
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index d2e6ca9abbe0..c0facf529803 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
+obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
new file mode 100644
index 000000000000..3f238e0d9647
--- /dev/null
+++ b/drivers/memory/mediatek/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_MC
+	bool "MediaTek Memory Controller support"
+	help
+	  This option allows to enable MediaTek memory controller drivers,
+	  which may include controllers for DRAM or others.
+	  Select Y here if you need support for MediaTek memory controller.
+	  If you don't need, select N.
+
+if MEDIATEK_MC
+
+config MTK_DRAMC
+	tristate "MediaTek DRAMC driver"
+	default y
+	help
+	  This option selects the MediaTek DRAMC driver, which provides
+	  an interface for reporting the current data rate of DRAM.
+	  Select Y here if you need support for the MediaTek DRAMC driver.
+	  If you don't need, select N.
+
+endif
diff --git a/drivers/memory/mediatek/Makefile b/drivers/memory/mediatek/Makefile
new file mode 100644
index 000000000000..a1395fc55b41
--- /dev/null
+++ b/drivers/memory/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MTK_DRAMC)		+= mtk-dramc.o
diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
new file mode 100644
index 000000000000..d452483a98ce
--- /dev/null
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+
+#define POSDIV_PURIFY	BIT(2)
+#define PREDIV		7
+#define REF_FREQUENCY	26
+#define SHUFFLE_OFFSET	0x700
+
+/*--------------------------------------------------------------------------*/
+/* Register Offset                                                          */
+/*--------------------------------------------------------------------------*/
+#define DPHY_DVFS_STA		0x0e98
+#define APHY_PHYPLL2		0x0908
+#define APHY_CLRPLL2		0x0928
+#define APHY_PHYPLL3		0x090c
+#define APHY_CLRPLL3		0x092c
+#define APHY_PHYPLL4		0x0910
+#define APHY_ARPI0		0x0d94
+#define APHY_CA_ARDLL1		0x0d08
+#define APHY_B0_TX0		0x0dc4
+
+/*--------------------------------------------------------------------------*/
+/* Register Mask                                                            */
+/*--------------------------------------------------------------------------*/
+#define DPHY_DVFS_SHU_LV	GENMASK(15, 14)
+#define DPHY_DVFS_PLL_SEL	GENMASK(25, 25)
+#define APHY_PLL2_SDMPCW	GENMASK(18, 3)
+#define APHY_PLL3_POSDIV	GENMASK(13, 11)
+#define APHY_PLL4_FBKSEL	GENMASK(6, 6)
+#define APHY_ARPI0_SOPEN	GENMASK(26, 26)
+#define APHY_ARDLL1_CK_EN	GENMASK(0, 0)
+#define APHY_B0_TX0_SER_MODE	GENMASK(4, 3)
+
+static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)
+{
+	unsigned int val = readl(base + offset);
+	unsigned int shift = __ffs(mask);
+
+	return (val & mask) >> shift;
+}
+
+struct mtk_dramc_pdata {
+	unsigned int fmeter_version;
+};
+
+struct mtk_dramc_dev_t {
+	void __iomem *anaphy_base;
+	void __iomem *ddrphy_base;
+	const struct mtk_dramc_pdata *pdata;
+};
+
+static int mtk_dramc_probe(struct platform_device *pdev)
+{
+	struct mtk_dramc_dev_t *dramc;
+	const struct mtk_dramc_pdata *pdata;
+	int ret;
+
+	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc_dev_t), GFP_KERNEL);
+	if (!dramc)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");
+
+	dramc->pdata = pdata;
+
+	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dramc->anaphy_base)) {
+		ret = PTR_ERR(dramc->anaphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY NAO base\n");
+	}
+
+	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dramc->ddrphy_base)) {
+		ret = PTR_ERR(dramc->ddrphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY AO base\n");
+	}
+
+	platform_set_drvdata(pdev, dramc);
+	return 0;
+}
+
+static unsigned int mtk_fmeter_v1(struct mtk_dramc_dev_t *dramc)
+{
+	unsigned int shu_level, pll_sel, offset;
+	unsigned int sdmpcw, posdiv, ckdiv4, fbksel, sopen, async_ca, ser_mode;
+	unsigned int perdiv_freq, posdiv_freq, vco_freq;
+	unsigned int final_rate;
+
+	shu_level = read_reg_field(dramc->ddrphy_base, DPHY_DVFS_STA, DPHY_DVFS_SHU_LV);
+	pll_sel = read_reg_field(dramc->ddrphy_base, DPHY_DVFS_STA, DPHY_DVFS_PLL_SEL);
+	offset = SHUFFLE_OFFSET * shu_level;
+
+	sdmpcw = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ? APHY_PHYPLL2 : APHY_CLRPLL2) + offset,
+				APHY_PLL2_SDMPCW);
+	posdiv = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ? APHY_PHYPLL3 : APHY_CLRPLL3) + offset,
+				APHY_PLL3_POSDIV);
+	fbksel = read_reg_field(dramc->anaphy_base, APHY_PHYPLL4 + offset, APHY_PLL4_FBKSEL);
+	sopen = read_reg_field(dramc->anaphy_base, APHY_ARPI0 + offset, APHY_ARPI0_SOPEN);
+	async_ca = read_reg_field(dramc->anaphy_base, APHY_CA_ARDLL1 + offset, APHY_ARDLL1_CK_EN);
+	ser_mode = read_reg_field(dramc->anaphy_base, APHY_B0_TX0 + offset, APHY_B0_TX0_SER_MODE);
+
+	ckdiv4 = (ser_mode == 1) ? 1 : 0;
+	posdiv &= ~(POSDIV_PURIFY);
+
+	perdiv_freq = REF_FREQUENCY * (sdmpcw >> PREDIV);
+	posdiv_freq = (perdiv_freq >> posdiv) >> 1;
+	vco_freq = posdiv_freq << fbksel;
+	final_rate = vco_freq >> ckdiv4;
+
+	if (sopen == 1 && async_ca == 1)
+		final_rate >>= 1;
+
+	return final_rate;
+}
+
+/*
+ * mtk_dramc_get_data_rate - calculate DRAM data rate
+ *
+ * Returns DRAM data rate (MB/s)
+ */
+static unsigned int mtk_dramc_get_data_rate(struct device *dev)
+{
+	struct mtk_dramc_dev_t *dramc_dev = dev_get_drvdata(dev);
+
+	if (!dramc_dev) {
+		dev_err(dev, "DRAMC device data not found\n");
+		return -EINVAL;
+	}
+
+	if (dramc_dev->pdata) {
+		if (dramc_dev->pdata->fmeter_version == 1)
+			return mtk_fmeter_v1(dramc_dev);
+
+		dev_err(dev, "Unsupported fmeter version\n");
+		return -EINVAL;
+	}
+	dev_err(dev, "DRAMC platform data not found\n");
+	return -EINVAL;
+}
+
+static ssize_t dram_data_rate_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
+			mtk_dramc_get_data_rate(dev));
+}
+
+static DEVICE_ATTR_RO(dram_data_rate);
+
+static struct attribute *mtk_dramc_attrs[] = {
+	&dev_attr_dram_data_rate.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mtk_dramc);
+
+static const struct mtk_dramc_pdata dramc_pdata_mt8196 = {
+	.fmeter_version = 1
+};
+
+static const struct of_device_id mtk_dramc_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
+
+static struct platform_driver mtk_dramc_driver = {
+	.probe = mtk_dramc_probe,
+	.driver = {
+		.name = "mtk_dramc_drv",
+		.of_match_table = mtk_dramc_of_ids,
+		.dev_groups = mtk_dramc_groups,
+	},
+};
+
+module_platform_driver(mtk_dramc_driver);
+
+MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0


