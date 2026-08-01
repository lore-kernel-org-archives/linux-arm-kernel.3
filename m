Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C1FC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1oxE096+SJP9W824qVU6+8hGCf8GvtkFKOzw4+nEjg=; b=ZPEzWhDVzYfX4JiPnOtUgC9FDG
	Nc7AfQlodi9MKtSJLQTFej+fIkQWAKmPnAP0Qiy7pqUNpg/rNOIPHS1X2B1s51VBFnvXhnKz26xFY
	QOeR/o+PjwRXmMTJA6aJQ8xI+zp93PMfoY1iigc42fIhT0nHkGQdURoQUHKMOiGQC0dnYN5IytahK
	vH2TaVurfAzi2O2k0zl2k7lED5IEQwebh+pw/PUXD/vUq471gA+O58E/s5WBuZSxaZMxzLTHt6lRw
	RslGaFANznGooUlQdH90PKmBX5xxyZhoRBkJ18THrx1lDsD2VG1BeFi4wCFrCKg9ePJT3dBQOk1b5
	a/fuMg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mp-0000000EE5M-1hzL;
	Sat, 01 Aug 2026 11:21:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7ma-0000000EDT0-28lL;
	Sat, 01 Aug 2026 11:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v1oxE096+SJP9W824qVU6+8hGCf8GvtkFKOzw4+nEjg=; b=nwjv6ri3msJSPhkv+/oWw2wjTw
	J46HJVJlsJnKM8QaGz/AXwhBJVVNEbRvn+wqNWL2ANSZDCILoeiOUywsk1VZxb6AkizycCUU9i3t/
	NUeodWeNiQr3lr8RIP4V9flrWKWH+AJ6d1+e5OTXGJYUT4lq3E9z1qGc1qq6FAGABE9vFT4K7LU5C
	0YIdp46TLR0qzr/QuAYV+8nMJ8s++MlKdgfdGjU9gX8I9hbw/7ZAriB0cBRRCYMw03MUjwXcvkK/2
	DZaFoMfRc48HdnicPjZaLiE+Rs5ur60V2qHqG6h+02ruA64X+Fa1pD1p6BLkGwk27xoS5IEd9vI9/
	DHEA4+FA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wq7mW-000000081Mf-2okW;
	Sat, 01 Aug 2026 11:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583288;
	bh=/FLn2DEgBy/c1f8A7XQpvscRwWNAHYOICbBCj3T6JDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pk1RVjRfDga9RbdYxcXQZsWLnPSIxw3Ts4vYvmWW5rM9jUfCdkgv5T2cUz9Ig+Kbo
	 PvFTofklgkzYaHaqx+D1X4+rxIbQ6EE0F3bPkVwWzQ6gtLarzu09Be6eawlk/Q+QEm
	 GZOPUWxHkoeL8k2bYVkrT0zYM6R1OZLxyKVCNkdV+S9glqm65kO/1SCqkhLLa3tB+v
	 UT6jk2EyvU1BKFwvyJ8Zk/g4dZlKVd9GEqNo4D9r0g46Y+PAhPE6vg43bmUyu+kQTU
	 PNbgPgfqh2aJz63Hcok4wIuWIU/XlVQWbhEiOg2ipqln4Mk4MftyWnPz9GfvqnFuFi
	 zgZBmFifl3DBw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FD9F17E091F;
	Sat, 01 Aug 2026 13:21:27 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:21:07 +0200
Subject: [PATCH v5 21/25] clk: mediatek: Add MT8189 dbgao clock support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-21-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583261; l=5596;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=/FLn2DEgBy/c1f8A7XQpvscRwWNAHYOICbBCj3T6JDo=;
 b=HYQwfkG5z2xonuh8we4disUZRR21meHQLmb3z/7WAfJDCuno5/eBdsIOXofWmlmJvS0Kbqulm
 Zi5Q8Wzqb/TBthsd67hgClQEBED9SDeqWKfdICpyHF00K9ExR1UCEwk
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_122133_112368_5B0E40F1 
X-CRM114-Status: GOOD (  16.84  )
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

Add support for the MT8189 dbgao clock controller,
which provides clock gate control for debug-system.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Kconfig            | 10 ++++
 drivers/clk/mediatek/Makefile           |  1 +
 drivers/clk/mediatek/clk-mt8189-dbgao.c | 98 +++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 8eba45f05968..635b0109ec07 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -839,6 +839,16 @@ config COMMON_CLK_MT8189_BUS
 	  MT8189 chipset, ensuring that all bus-related components receive the
 	  correct clock signals for optimal performance.
 
+config COMMON_CLK_MT8189_DBGAO
+	tristate "Clock driver for MediaTek MT8189 debug ao"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this to support the clock management for the debug function
+	  on MediaTek MT8189 SoCs. This includes enabling and disabling
+	  vcore debug system clocks. If you want to control its clocks, say Y or M
+	  to include this driver in your kernel build.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index aabfb42cb1b2..6ab6df7ebf2a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -126,6 +126,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
 				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
+obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-dbgao.c b/drivers/clk/mediatek/clk-mt8189-dbgao.c
new file mode 100644
index 000000000000..40307bdc93eb
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-dbgao.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026 MediaTek Inc.
+ *                    Qiqi Wang <qiqi.wang@mediatek.com>
+ *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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
+static const struct mtk_gate_regs dbgao_cg_regs = {
+	.set_ofs = 0x70,
+	.clr_ofs = 0x70,
+	.sta_ofs = 0x70,
+};
+
+#define GATE_DBGAO(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &dbgao_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate dbgao_clks[] = {
+	GATE_DBGAO(CLK_DBGAO_ATB_EN, "dbgao_atb_en", "atb_sel", 0),
+};
+
+static const struct mtk_clk_desc dbgao_mcd = {
+	.clks = dbgao_clks,
+	.num_clks = ARRAY_SIZE(dbgao_clks),
+};
+
+static const struct mtk_gate_regs dem0_cg_regs = {
+	.set_ofs = 0x2c,
+	.clr_ofs = 0x2c,
+	.sta_ofs = 0x2c,
+};
+
+static const struct mtk_gate_regs dem1_cg_regs = {
+	.set_ofs = 0x30,
+	.clr_ofs = 0x30,
+	.sta_ofs = 0x30,
+};
+
+static const struct mtk_gate_regs dem2_cg_regs = {
+	.set_ofs = 0x70,
+	.clr_ofs = 0x70,
+	.sta_ofs = 0x70,
+};
+
+#define GATE_DEM0(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &dem0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_DEM1(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &dem1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_DEM2(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &dem2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate dem_clks[] = {
+	/* DEM0 */
+	GATE_DEM0(CLK_DEM_BUSCLK_EN, "dem_busclk_en", "axi_sel", 0),
+	/* DEM1 */
+	GATE_DEM1(CLK_DEM_SYSCLK_EN, "dem_sysclk_en", "axi_sel", 0),
+	/* DEM2 */
+	GATE_DEM2(CLK_DEM_ATB_EN, "dem_atb_en", "atb_sel", 0),
+};
+
+static const struct mtk_clk_desc dem_mcd = {
+	.clks = dem_clks,
+	.num_clks = ARRAY_SIZE(dem_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_dbgao[] = {
+	{ .compatible = "mediatek,mt8189-dbg-ao", .data = &dbgao_mcd },
+	{ .compatible = "mediatek,mt8189-dem", .data = &dem_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_dbgao);
+
+static struct platform_driver clk_mt8189_dbgao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-dbgao",
+		.of_match_table = of_match_clk_mt8189_dbgao,
+	},
+};
+module_platform_driver(clk_mt8189_dbgao_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 dbgao system clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


