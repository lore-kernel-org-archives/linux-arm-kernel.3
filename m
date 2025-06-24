Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84036C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3/4pskH4zkzaReCicB1gb13VlZ+k0YNTLILKLM7K3A=; b=gmCgF532gE5UZbLuB/fJ/W9UgY
	ku8b5mE5JCyKhrPiSOMcoNAKo0zumgK0D9s3YGkNntT3y8nQVDlKNqwBCIqWSXEJk5tX/2SzPAZPE
	zIaxxmTPO96lIcQHZLRi98ZQRyX77ocgcSrW0JgZ4bjHwsMMXFx+7/7y2wgyuvbBgjaaCCPviTAa0
	L3QBLTXlByStQ9u2gdyFUDZuPsy6lvNbvKZHrDpGS6GaHOG/3+qmZHzrrMclBLMNFKrDlXdiBLjhG
	4NuU5J5pQ9H8bk1e8kstkUK9mkdJLm7dfLczJi+VtPTTMAMHVi0VlVufQg9173f6S70a2/MpY3jL9
	ps9NTVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7px-00000006QUk-0ptO;
	Tue, 24 Jun 2025 17:53:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4ih-00000005vdr-45O0;
	Tue, 24 Jun 2025 14:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T3/4pskH4zkzaReCicB1gb13VlZ+k0YNTLILKLM7K3A=; b=nHQXEIkK4+oqqYag5YZixfHfEM
	NCvxWweZjYjHsZPJAR2K1aQyf3jg9IPJ7JeR17OFYrP1Og/3pwxTCSHy53AjVvmctTQZQzktZqjNJ
	olCG5tx+xWeoRP1HQ7Mx5Ml3yLWiVuJ5jh8eGna+LsMY6YSRUy9ycRAFUdH3/XmzjCnG/O1eVVUKI
	cjuUTYsvZ53UdR83Q1ay0PcsEJC0Z6vqLoYfNv/AwWExtrH/YE79LKp0Al1ngK7j1pvf3zGJgUP1l
	mOkRq+jDr3ax3ukf/DSfAv9BRCWSVF3pCOEI1vfRSYecSeZzbAkWXFd9q9bY60/B0Sh/eOgpzxQQx
	usKZ++Mg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4if-00000005SuW-1REx;
	Tue, 24 Jun 2025 14:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775631;
	bh=votyLIDaI2OVokn2ZsItATBtAymLH6ZkR3IIUoNFEJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrLYwC1BbGhl1bVQ1OPOhrJp2Mx5/IDUBNFf+cOMhIqHYFZaO2CMx/txxTd00g337
	 +dYjKoSgDh4P8XPJLAOIdGdWMTwU1jRXk9PnOZw2GfrvKmEAGCNevgiwxwNPp9zyog
	 FGYJpYTJ8qRZEgUmUAsHsH19ufzZNfLWsYPByGONWmQCqzFdtML1ovT19hNdFpV0BM
	 OciicYoTMTRWP1yNSPAEDHNkMxCWIdbmaQIVBnff3SlqAWL1Y0lwfZQyR4QuXNOKFl
	 yyvSQFTZwLzJgTZyjztNd142yxwV7DAUh6NHowEo3ejtlkqWYyTWinStht01lHENq9
	 p+/H1JQaVHPVw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D727B17E0EA4;
	Tue, 24 Jun 2025 16:33:50 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 16/29] clk: mediatek: Add MT8196 ufssys clock support
Date: Tue, 24 Jun 2025 16:32:07 +0200
Message-Id: <20250624143220.244549-17-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153353_583307_89A923B9 
X-CRM114-Status: GOOD (  16.68  )
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

Add support for the MT8196 ufssys clock controller, which provides clock
gate control for UFS.

Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig             |   7 ++
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c | 109 +++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index c55a7c8bdcc5..848624792a23 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1068,6 +1068,13 @@ config COMMON_CLK_MT8196
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
 
+config COMMON_CLK_MT8196_UFSSYS
+	tristate "Clock driver for MediaTek MT8196 ufssys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 ufssys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index fc941b5baf04..ee6a1bb5ce38 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -163,6 +163,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
 				   clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o \
 				   clk-mt8196-peri_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-ufs_ao.c b/drivers/clk/mediatek/clk-mt8196-ufs_ao.c
new file mode 100644
index 000000000000..858706b3ba6f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-ufs_ao.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+#include <dt-bindings/reset/mediatek,mt8196-resets.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#define MT8196_UFSAO_RST0_SET_OFFSET	0x48
+#define MT8196_UFSAO_RST1_SET_OFFSET	0x148
+
+static const struct mtk_gate_regs ufsao0_cg_regs = {
+	.set_ofs = 0x108,
+	.clr_ofs = 0x10c,
+	.sta_ofs = 0x104,
+};
+
+static const struct mtk_gate_regs ufsao1_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x4,
+};
+
+#define GATE_UFSAO0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ufsao0_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_UFSAO1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ufsao1_cg_regs,		\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate ufsao_clks[] = {
+	/* UFSAO0 */
+	GATE_UFSAO0(CLK_UFSAO_UFSHCI_UFS, "ufsao_ufshci_ufs", "ufs", 0),
+	GATE_UFSAO0(CLK_UFSAO_UFSHCI_AES, "ufsao_ufshci_aes", "aes_ufsfde", 1),
+	/* UFSAO1 */
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_TX_SYM, "ufsao_unipro_tx_sym", "clk26m", 0),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM0, "ufsao_unipro_rx_sym0", "clk26m", 1),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM1, "ufsao_unipro_rx_sym1", "clk26m", 2),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_SYS, "ufsao_unipro_sys", "ufs", 3),
+	GATE_UFSAO1(CLK_UFSAO_UNIPRO_SAP, "ufsao_unipro_sap", "clk26m", 4),
+	GATE_UFSAO1(CLK_UFSAO_PHY_SAP, "ufsao_phy_sap", "clk26m", 8),
+};
+
+static u16 ufsao_rst_ofs[] = {
+	MT8196_UFSAO_RST0_SET_OFFSET,
+	MT8196_UFSAO_RST1_SET_OFFSET
+};
+
+static u16 ufsao_rst_idx_map[] = {
+	[MT8196_UFSAO_RST0_UFS_MPHY] = 8,
+	[MT8196_UFSAO_RST1_UFS_UNIPRO] = 1 * RST_NR_PER_BANK + 0,
+	[MT8196_UFSAO_RST1_UFS_CRYPTO] = 1 * RST_NR_PER_BANK + 1,
+	[MT8196_UFSAO_RST1_UFSHCI] = 1 * RST_NR_PER_BANK + 2,
+};
+
+static const struct mtk_clk_rst_desc ufsao_rst_desc = {
+	.version = MTK_RST_SET_CLR,
+	.rst_bank_ofs = ufsao_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(ufsao_rst_ofs),
+	.rst_idx_map = ufsao_rst_idx_map,
+	.rst_idx_map_nr = ARRAY_SIZE(ufsao_rst_idx_map),
+};
+
+static const struct mtk_clk_desc ufsao_mcd = {
+	.clks = ufsao_clks,
+	.num_clks = ARRAY_SIZE(ufsao_clks),
+	.rst_desc = &ufsao_rst_desc,
+};
+
+static const struct of_device_id of_match_clk_mt8196_ufs_ao[] = {
+	{ .compatible = "mediatek,mt8196-ufscfg-ao", .data = &ufsao_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_ufs_ao);
+
+static struct platform_driver clk_mt8196_ufs_ao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-ufs-ao",
+		.of_match_table = of_match_clk_mt8196_ufs_ao,
+	},
+};
+
+module_platform_driver(clk_mt8196_ufs_ao_drv);
+MODULE_DESCRIPTION("MediaTek MT8196 ufs_ao clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


