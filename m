Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89E9F3C240
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evsYU0Gi3bwHHPRb7qELzJfNnB+liImYa1xKOrbFbao=; b=qUWBJd4vYktFBQW3s+gmtsXN60
	dg91+Xoe6PGb/Di4B436pQExKiwA6bEPo+WIsX9tC2DaeU/p8O3PUR8DRvnCyn0mTLC6bRpsy/S/D
	9socS4DyAT+fAitNegctNODP6Fjaga1ob58v0cFenMa6DoSJTAJQMcVLDQc/Jr/feISQHEdJpnbIN
	rnKxeq29O1BYtcik5BpTd18Mx4W1b//IAx/gvv1JU54b7/k0q87K3zF5qxX2tzXoM34hMzv73/+kD
	SOTddczZrLWWlVK+G4LOcLK5sEiGbS7yymWZkJ/GTQ/BNYY36AARXUI1tjaTrleE1irGyqo4mmp7K
	Fd9/AgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZNJ-00000007HAS-49ld;
	Mon, 09 Mar 2026 12:06:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZMh-00000007GDS-38VP;
	Mon, 09 Mar 2026 12:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=evsYU0Gi3bwHHPRb7qELzJfNnB+liImYa1xKOrbFbao=; b=prWH/tuJsiFtOJ5W+aR0XbfuWB
	WpiK/oNIN5gZhHgFIgmuN0aubsnNUJKJLl7UDH3Chie8eI7pE9wbKc6AXfB5lxDz5pA0JzcG3ESY8
	vxwJFTo2kJd3MzOaXvzStYoMnjvfGfj/yV3BdQZ7FiBLJiga+MOk9klfdEr7U3n/9yXTSQzKy8XkO
	kiejVKLgJcGhkzXikE3uWhRgtXvh18z6U6E896lKvTUBL+FTDrgrOgkBk2QZhlGYGB6nKvaoqdcl9
	jEvFgonlZMkjA7B4D+iBlJnOYgY/nM2uGoMOr9jll0byy7GlswdwxRipY0aiDtLMrH8/8O7BT5YaY
	OSRpKkmQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZMd-0000000C4Ts-0CJY;
	Mon, 09 Mar 2026 12:05:38 +0000
X-UUID: 4064ef8e1bb011f1a6de359d7043e138-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=evsYU0Gi3bwHHPRb7qELzJfNnB+liImYa1xKOrbFbao=;
	b=I+5/kLjnopY8iUionXlcX+2N908dc/uMvBSGpvRhSVUOWBCF5mO0lektcvKbA7kWSVuLs/EGnQ0XyoR131mGDdMXzWfFW2VOPK6cMCkYIJtP/qd5PH2IKn/f8A16FYTeDStxDJGo3Maev64mQL2N7AhD9Jj3RTPyDkDrD2Z7uKY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:ff5a8d76-0ad4-41b5-a4f1-77c1afcefe72,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:65a9b17b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4064ef8e1bb011f1a6de359d7043e138-20260309
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 101022130; Mon, 09 Mar 2026 05:05:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 20:05:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 20:05:20 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH v6 18/18] clk: mediatek: Add MT8189 vcodec clock support
Date: Mon, 9 Mar 2026 20:05:00 +0800
Message-ID: <20260309120512.3624804-19-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120537_008592_9B739EF2 
X-CRM114-Status: GOOD (  19.58  )
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

Add support for the MT8189 vcodec clock controller,
which provides clock gate control for video encoder/decoder.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/clk/mediatek/Kconfig             | 10 +++
 drivers/clk/mediatek/Makefile            |  1 +
 drivers/clk/mediatek/clk-mt8189-vcodec.c | 93 ++++++++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5f48e7174070..32a0b92180ec 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -951,6 +951,16 @@ config COMMON_CLK_MT8189_UFS
 	  option if the system includes a UFS device that relies on the MT8189
 	  SoC for clock management.
 
+config COMMON_CLK_MT8189_VCODEC
+	tristate "Clock driver for MediaTek MT8189 vcodec"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  This driver supports the video codec (VCODEC) clocks on the MediaTek
+	  MT8189 SoCs. Enabling this option will allow the system to manage
+	  clocks required for the operation of hardware video encoding and
+	  decoding features provided by the VCODEC unit of the MT8189 platform.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4179808dba7b..614371c92e81 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189_MFG) += clk-mt8189-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8189_MMSYS) += clk-mt8189-dispsys.o
 obj-$(CONFIG_COMMON_CLK_MT8189_SCP) += clk-mt8189-scp.o
 obj-$(CONFIG_COMMON_CLK_MT8189_UFS) += clk-mt8189-ufs.o
+obj-$(CONFIG_COMMON_CLK_MT8189_VCODEC) += clk-mt8189-vcodec.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-vcodec.c b/drivers/clk/mediatek/clk-mt8189-vcodec.c
new file mode 100644
index 000000000000..87b01e432474
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-vcodec.c
@@ -0,0 +1,93 @@
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
+static const struct mtk_gate_regs vdec_core0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec_core1_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC_CORE0(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdec_core0_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr_inv, CLK_IGNORE_UNUSED)
+
+#define GATE_VDEC_CORE1(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdec_core1_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr_inv, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate vdec_core_clks[] = {
+	/* VDEC_CORE0 */
+	GATE_VDEC_CORE0(CLK_VDEC_CORE_VDEC_CKEN, "vdec_core_vdec_cken", "vdec_sel", 0),
+	GATE_VDEC_CORE0(CLK_VDEC_CORE_VDEC_ACTIVE, "vdec_core_vdec_active", "vdec_sel", 4),
+	/* VDEC_CORE1 */
+	GATE_VDEC_CORE1(CLK_VDEC_CORE_LARB_CKEN, "vdec_core_larb_cken", "vdec_sel", 0),
+};
+
+static const struct mtk_clk_desc vdec_core_mcd = {
+	.clks = vdec_core_clks,
+	.num_clks = ARRAY_SIZE(vdec_core_clks),
+};
+
+static const struct mtk_gate_regs ven1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VEN1(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &ven1_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr_inv, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate ven1_clks[] = {
+	GATE_VEN1(CLK_VEN1_CKE0_LARB, "ven1_larb", "venc_sel", 0),
+	GATE_VEN1(CLK_VEN1_CKE1_VENC, "ven1_venc", "venc_sel", 4),
+	GATE_VEN1(CLK_VEN1_CKE2_JPGENC, "ven1_jpgenc", "venc_sel", 8),
+	GATE_VEN1(CLK_VEN1_CKE3_JPGDEC, "ven1_jpgdec", "venc_sel", 12),
+	GATE_VEN1(CLK_VEN1_CKE4_JPGDEC_C1, "ven1_jpgdec_c1", "venc_sel", 16),
+	GATE_VEN1(CLK_VEN1_CKE5_GALS, "ven1_gals", "venc_sel", 28),
+	GATE_VEN1(CLK_VEN1_CKE6_GALS_SRAM, "ven1_gals_sram", "venc_sel", 31),
+};
+
+static const struct mtk_clk_desc ven1_mcd = {
+	.clks = ven1_clks,
+	.num_clks = ARRAY_SIZE(ven1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_vcodec[] = {
+	{ .compatible = "mediatek,mt8189-vdec-core", .data = &vdec_core_mcd },
+	{ .compatible = "mediatek,mt8189-venc", .data = &ven1_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_vcodec);
+
+static struct platform_driver clk_mt8189_vcodec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-vcodec",
+		.of_match_table = of_match_clk_mt8189_vcodec,
+	},
+};
+
+module_platform_driver(clk_mt8189_vcodec_drv);
+MODULE_DESCRIPTION("MediaTek MT8189 video encoder/decoder clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


