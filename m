Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33909D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 03:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/gxz9L70EgGOxX7lC3id5jzSqCMUnCNLc4lGqjga5w=; b=qJGQILjswQRDXMaL55BvJ79Xww
	KFKFYfuOVfOedPADrIYaCmFlChHzBS9LnRreBV6/dhmSnu6kASJYcJ/EOFRoNGJ2c66O/fe9lJiy7
	ZH1bojGSUb/jEGKGnWn0rAclZ5fvAVDnKbQyGV68omJszRZNvbl4hRe3tXtfFO14A6ppVvTIg4M+A
	Cj880gOxrlRijTqIOAacXgOIrNN+uK7JEB6IqqNSG0OtL8nPeC0ovCmY55F+Hd6VxWRFZL5JyKMwl
	8cefI1ozU5X83XdrbLfvdQHgqAQukaMLMb2OSLehvKPoCxBkAtMCrH9J4/UTvlawrxWTmH2XHVW+h
	2ymDn2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzcM-000000030Oj-1cYP;
	Mon, 15 Dec 2025 03:51:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUzb2-00000002zdV-3TGt;
	Mon, 15 Dec 2025 03:50:12 +0000
X-UUID: 1e80b8dcd96911f0a52f393f94899d25-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=I/gxz9L70EgGOxX7lC3id5jzSqCMUnCNLc4lGqjga5w=;
	b=tKsO30S2q663WCfwZkz4W1xX05BNH5zkgDaJremoLTDwmAy+k4+2dG3eXV2tjffVxraPTP13TsZfBH5fDhnLpaZvYXXOZJriePQVEgDNjuIh+3j6+pOHszeW130/TsGjJED2V5FKd0rmVjNIoo1gu9kbYhEoA0w+hpYojoY/CQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:aeeca3c9-91b3-4ca6-af7f-49a8a631f143,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4dd0c402-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e80b8dcd96911f0a52f393f94899d25-20251214
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1381175532; Sun, 14 Dec 2025 20:49:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:49:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:49:52 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v4 09/21] clk: mediatek: Add MT8189 cam clock support
Date: Mon, 15 Dec 2025 11:49:18 +0800
Message-ID: <20251215034944.2973003-10-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_195004_971632_918EEC41 
X-CRM114-Status: GOOD (  18.20  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

Add support for the MT8189 cam clock controller,
which provides clock gate control for camera.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  11 +++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8189-cam.c | 108 ++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e7fdb5421e6..82a26d952bff 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -839,6 +839,17 @@ config COMMON_CLK_MT8189_BUS
 	  MT8189 chipset, ensuring that all bus-related components receive the
 	  correct clock signals for optimal performance.
 
+config COMMON_CLK_MT8189_CAM
+	tristate "Clock driver for MediaTek MT8189 cam"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock management for the camera interface
+	  on MediaTek MT8189 SoCs. This includes enabling, disabling, and
+	  setting the rate for camera-related clocks. If you have a camera
+	  that relies on this SoC and you want to control its clocks, say Y or M
+	  to include this driver in your kernel build.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index aabfb42cb1b2..95a8f4ae05ee 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -126,6 +126,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
 				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
+obj-$(CONFIG_COMMON_CLK_MT8189_CAM) += clk-mt8189-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-cam.c b/drivers/clk/mediatek/clk-mt8189-cam.c
new file mode 100644
index 000000000000..d65ac08cedd6
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-cam.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Qiqi Wang <qiqi.wang@mediatek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+static const struct mtk_gate_regs cam_m_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_M(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &cam_m_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate cam_m_clks[] = {
+	GATE_CAM_M(CLK_CAM_M_LARB13, "cam_m_larb13", "cam_sel", 0),
+	GATE_CAM_M(CLK_CAM_M_LARB14, "cam_m_larb14", "cam_sel", 2),
+	GATE_CAM_M(CLK_CAM_M_CAMSYS_MAIN_CAM, "cam_m_camsys_main_cam", "cam_sel", 6),
+	GATE_CAM_M(CLK_CAM_M_CAMSYS_MAIN_CAMTG, "cam_m_camsys_main_camtg", "cam_sel", 7),
+	GATE_CAM_M(CLK_CAM_M_SENINF, "cam_m_seninf", "cam_sel", 8),
+	GATE_CAM_M(CLK_CAM_M_CAMSV1, "cam_m_camsv1", "cam_sel", 10),
+	GATE_CAM_M(CLK_CAM_M_CAMSV2, "cam_m_camsv2", "cam_sel", 11),
+	GATE_CAM_M(CLK_CAM_M_CAMSV3, "cam_m_camsv3", "cam_sel", 12),
+	GATE_CAM_M(CLK_CAM_M_FAKE_ENG, "cam_m_fake_eng", "cam_sel", 17),
+	GATE_CAM_M(CLK_CAM_M_CAM2MM_GALS, "cam_m_cam2mm_gals", "cam_sel", 19),
+	GATE_CAM_M(CLK_CAM_M_CAMSV4, "cam_m_camsv4", "cam_sel", 20),
+	GATE_CAM_M(CLK_CAM_M_PDA, "cam_m_pda", "cam_sel", 21),
+};
+
+static const struct mtk_clk_desc cam_m_mcd = {
+	.clks = cam_m_clks,
+	.num_clks = ARRAY_SIZE(cam_m_clks),
+};
+
+static const struct mtk_gate_regs cam_ra_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RA(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &cam_ra_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate cam_ra_clks[] = {
+	GATE_CAM_RA(CLK_CAM_RA_CAMSYS_RAWA_LARBX, "cam_ra_camsys_rawa_larbx", "cam_sel", 0),
+	GATE_CAM_RA(CLK_CAM_RA_CAMSYS_RAWA_CAM, "cam_ra_camsys_rawa_cam", "cam_sel", 1),
+	GATE_CAM_RA(CLK_CAM_RA_CAMSYS_RAWA_CAMTG, "cam_ra_camsys_rawa_camtg", "cam_sel", 2),
+};
+
+static const struct mtk_clk_desc cam_ra_mcd = {
+	.clks = cam_ra_clks,
+	.num_clks = ARRAY_SIZE(cam_ra_clks),
+};
+
+static const struct mtk_gate_regs cam_rb_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RB(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &cam_rb_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate cam_rb_clks[] = {
+	GATE_CAM_RB(CLK_CAM_RB_CAMSYS_RAWB_LARBX, "cam_rb_camsys_rawb_larbx", "cam_sel", 0),
+	GATE_CAM_RB(CLK_CAM_RB_CAMSYS_RAWB_CAM, "cam_rb_camsys_rawb_cam", "cam_sel", 1),
+	GATE_CAM_RB(CLK_CAM_RB_CAMSYS_RAWB_CAMTG, "cam_rb_camsys_rawb_camtg", "cam_sel", 2),
+};
+
+static const struct mtk_clk_desc cam_rb_mcd = {
+	.clks = cam_rb_clks,
+	.num_clks = ARRAY_SIZE(cam_rb_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_cam[] = {
+	{ .compatible = "mediatek,mt8189-camsys-main", .data = &cam_m_mcd },
+	{ .compatible = "mediatek,mt8189-camsys-rawa", .data = &cam_ra_mcd },
+	{ .compatible = "mediatek,mt8189-camsys-rawb", .data = &cam_rb_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_cam);
+
+static struct platform_driver clk_mt8189_cam_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-cam",
+		.of_match_table = of_match_clk_mt8189_cam,
+	},
+};
+
+module_platform_driver(clk_mt8189_cam_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 cam clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


