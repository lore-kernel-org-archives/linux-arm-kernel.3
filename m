Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C758AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXKU4bqw4RXWS/Jeb9QZECfMVMXpAXcuYesYWPavheg=; b=LCrcCV9NrPJ5VF+68UL7U0r5w+
	BqGLTeRC5NMH940b0f4JdcxuTX+NH0oA7H97XuYc+fzx7IPrMm3p7RGGo5RcZnw6Rpv71RGGdbsbX
	dviNrkedP2TlNrA6HmyRne1VfLCuAWtYmG57HwV3DWqT5xVHdzqqP2oGKqzt444/LTbtn9q+Qpg76
	yPMuXVxryDrEEfqe7Ev+XUh/POfxxhNi+sinvtKBPcQ0+/R8zmPq2GzEnKcse+VlgG6iPBhvbalk5
	p8jUZuYZ2be3XoS2GQPD7jnxDr/AuCAFm6aBXYZ5I9l9OGXNdLU2vC0y7/XpgMp4Z4Do0oqHPkHsN
	+2MnzMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woioC-00000005U4u-1HJl;
	Tue, 28 Jul 2026 14:29:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woinx-00000005TyW-1DmC;
	Tue, 28 Jul 2026 14:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VXKU4bqw4RXWS/Jeb9QZECfMVMXpAXcuYesYWPavheg=; b=aXVvNyMy68AcPDwtrw9LDCud/y
	NpiwpQmw7/Rvu/23wYjVMhOJnw22ybX3y0VutpuYS29hDWt25uCqz33d5B+48V5GbGB7cPlfvpsb1
	BLe0a8rrE0rcVkuxgKaUWK47RYgcNcnqzOrI53/vtucnGbDHMfpM/vin86VCKFCEK7lOfgtbNgqKm
	neUzZsnWDCgwy0YDU7QK60vby0Yt+05J0hx39iSuw9tC2me/1WtuIVxLnl6wJS40cd/z06Hbqf+ry
	GUEg9zHVWjGLlY/42cJLLy8G4SaEcTYuS45Spm62781Xt3rAbuQ7aLkaxdSUh644NLQ636Ihb3Pg2
	j4NfZuig==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woinq-000000051Ap-2Q1e;
	Tue, 28 Jul 2026 14:29:12 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66SES7hA43929834, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785248887; bh=VXKU4bqw4RXWS/Jeb9QZECfMVMXpAXcuYesYWPavheg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=cX+lc5n+ll6SVfEqnw8AqSb38L1rlIrkRHY85d31OOH8P33KPEOJrGGsccNRXanCH
	 X61twjVzB2sQmIqkOznz2F4r0N3kAt9qSnfzoZKhwVDsYvy0vOGKkmNT478LXTBAbt
	 t4+tsQhS6CjS7Z0hruh9sMlQYW7yp5SVy2UxuCBfq7dCEyhKRMbXv1oQ/ldHTp7PiX
	 5Q0Uzc+YjFzWxb7kHrK7OdWRvDLlKRiGQwtbi/qE7PIqwpFZcNfOd1cfRwOt1Uv/S5
	 c0OymfmAnx+uHO4UcKzi1qCYVQREHQLgrGuykzenL5mAQRCFEkbGkorSnQKf8JdlAL
	 GOUBZ0BHL7xLQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66SES7hA43929834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jul 2026 22:28:07 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 22:28:07 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Jul 2026 22:28:06 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v11 03/11] reset: realtek: Add RTD1625 reset controller driver
Date: Tue, 28 Jul 2026 22:27:58 +0800
Message-ID: <20260728142806.1954638-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260728142806.1954638-1-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_152907_448557_2792D7DA 
X-CRM114-Status: GOOD (  14.92  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the CRT (Clock, Reset, and Test) and ISO (Isolation)domain
reset controller on the Realtek RTD1625 SoC.

The reset controller shares the same register space with the CRT and ISO
clock controller. To handle this shared register space, the reset driver is
implemented as an auxiliary driver. It will be instantiated and probed via
the auxiliary bus by the RTD1625-CRT and RTD1625-ISO clock controller driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v11:
- Remove unnecessary whitespace.
- Replace dev->parent->of_node with dev->of_node.
- Add Reviewed-by tag from Philipp.
---
 drivers/reset/realtek/Kconfig         |  11 ++
 drivers/reset/realtek/Makefile        |   1 +
 drivers/reset/realtek/reset-rtd1625.c | 262 ++++++++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/reset/realtek/reset-rtd1625.c

diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
index 5ddf8e5c09c7..38591b6a70b3 100644
--- a/drivers/reset/realtek/Kconfig
+++ b/drivers/reset/realtek/Kconfig
@@ -6,3 +6,14 @@ config RESET_RTK_COMMON
 	  Realtek SoCs. It provides shared reset control operations
 	  (assert, deassert, status) that other Realtek-specific reset
 	  drivers can use.
+
+config RESET_RTD1625
+	tristate "RTD1625 Reset Controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select RESET_RTK_COMMON
+	select AUXILIARY_BUS
+	help
+	  This enables the reset controller driver for Realtek RTD1625 SoC.
+	  The driver controls reset lines for various peripherals including
+	  PCIe, SATA, HDMI, display, video encoder/decoder, USB, SD, audio,
+	  and other subsystems.
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
index 6d68e41748bf..993acd1e2d14 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RESET_RTK_COMMON) += reset-rtk-common.o
+obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625.o
diff --git a/drivers/reset/realtek/reset-rtd1625.c b/drivers/reset/realtek/reset-rtd1625.c
new file mode 100644
index 000000000000..fa87462f50e9
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtd1625.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <dt-bindings/reset/realtek,rtd1625.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include "reset-rtk-common.h"
+
+struct rtd1625_reset_info {
+	const struct rtk_reset_desc *descs;
+	unsigned int nr_resets;
+};
+
+static const struct rtk_reset_desc rtd1625_crt_reset_descs[] = {
+	/* Bank 0: offset 0x0 */
+	[RTD1625_CRT_RSTN_MISC]         = { .ofs = 0x0, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DIP]          = { .ofs = 0x0, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_GSPI]         = { .ofs = 0x0, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS]          = { .ofs = 0x0, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_REG]      = { .ofs = 0x0, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDS_PHY]      = { .ofs = 0x0, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU2D]        = { .ofs = 0x0, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DC_PHY]       = { .ofs = 0x0, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_CRT]    = { .ofs = 0x0, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC]        = { .ofs = 0x0, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SE]           = { .ofs = 0x0, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DLA]          = { .ofs = 0x0, .bit = 30, .write_en = 1 },
+	/* Bank 1: offset 0x4 */
+	[RTD1625_CRT_RSTN_JPEG]         = { .ofs = 0x4, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SD]           = { .ofs = 0x4, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SDIO]         = { .ofs = 0x4, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCR_CNT]      = { .ofs = 0x4, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_STITCH] = { .ofs = 0x4, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY]    = { .ofs = 0x4, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0]        = { .ofs = 0x4, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_CORE]   = { .ofs = 0x4, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_POWER]  = { .ofs = 0x4, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_NONSTICH] = { .ofs = 0x4, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_PHY_MDIO] = { .ofs = 0x4, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO] = { .ofs = 0x4, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO2]          = { .ofs = 0x4, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC0]     = { .ofs = 0x4, .bit = 30, .write_en = 1 },
+	/* Bank 2: offset 0x8 */
+	[RTD1625_CRT_RSTN_MD]           = { .ofs = 0x8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS1]        = { .ofs = 0x8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LVDS2]        = { .ofs = 0x8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MISC_SC1]     = { .ofs = 0x8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_3]        = { .ofs = 0x8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_FAN]          = { .ofs = 0x8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TVE]          = { .ofs = 0x8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AIO]          = { .ofs = 0x8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VO]           = { .ofs = 0x8, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_CSI]     = { .ofs = 0x8, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX]       = { .ofs = 0x8, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMIRX_WRAP]  = { .ofs = 0x8, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMI]         = { .ofs = 0x8, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP]         = { .ofs = 0x8, .bit = 30, .write_en = 1 },
+	/* Bank 3: offset 0xc */
+	[RTD1625_CRT_RSTN_SATA_PHY_POW1] = { .ofs = 0xc, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_PHY_POW0] = { .ofs = 0xc, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO1]   = { .ofs = 0xc, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MDIO0]   = { .ofs = 0xc, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_WRAP]    = { .ofs = 0xc, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P1]  = { .ofs = 0xc, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_P0]  = { .ofs = 0xc, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SATA_MAC_COM] = { .ofs = 0xc, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_STITCH] = { .ofs = 0xc, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY]     = { .ofs = 0xc, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1]         = { .ofs = 0xc, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_CORE]   = { .ofs = 0xc, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_POWER]  = { .ofs = 0xc, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_NONSTICH] = { .ofs = 0xc, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE1_PHY_MDIO] = { .ofs = 0xc, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HDMITOP]      = { .ofs = 0xc, .bit = 30, .write_en = 1 },
+	/* Bank 4: offset 0x68 */
+	[RTD1625_CRT_RSTN_I2C_4]        = { .ofs = 0x68, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_5]        = { .ofs = 0x68, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_TSIO]         = { .ofs = 0x68, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VI]           = { .ofs = 0x68, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDP]          = { .ofs = 0x68, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU]      = { .ofs = 0x68, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_MMU_FUNC] = { .ofs = 0x68, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU]      = { .ofs = 0x68, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HSE_MMU_FUNC] = { .ofs = 0x68, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDLM2M]       = { .ofs = 0x68, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISO_GSPI]     = { .ofs = 0x68, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SOFT_NPU]     = { .ofs = 0x68, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2EMMC]     = { .ofs = 0x68, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EARC]         = { .ofs = 0x68, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1]          = { .ofs = 0x68, .bit = 30, .write_en = 1 },
+	/* Bank 5: offset 0x90 */
+	[RTD1625_CRT_RSTN_PCIE2_STITCH]  = { .ofs = 0x90, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY]    = { .ofs = 0x90, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2]        = { .ofs = 0x90, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_CORE]   = { .ofs = 0x90, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_POWER]  = { .ofs = 0x90, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_NONSTICH] = { .ofs = 0x90, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_PCIE2_PHY_MDIO] = { .ofs = 0x90, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_UMCTL2] = { .ofs = 0x90, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MIPI_DSI]     = { .ofs = 0x90, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_HIFM]         = { .ofs = 0x90, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NSRAM]        = { .ofs = 0x90, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU0_REG]   = { .ofs = 0x90, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_GENPW]    = { .ofs = 0x90, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_CHIP]     = { .ofs = 0x90, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_MDL_IP]       = { .ofs = 0x90, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_TEST_MUX]     = { .ofs = 0x90, .bit = 30, .write_en = 1 },
+	/* Bank 6: offset 0xb8 */
+	[RTD1625_CRT_RSTN_ISO_BIST]     = { .ofs = 0xb8, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN_BIST]    = { .ofs = 0xb8, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_MAIN2_BIST]   = { .ofs = 0xb8, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE1_BIST]     = { .ofs = 0xb8, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE2_BIST]     = { .ofs = 0xb8, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_DCPHY_BIST]   = { .ofs = 0xb8, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_GPU_BIST]     = { .ofs = 0xb8, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DISP_BIST]    = { .ofs = 0xb8, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_NPU_BIST]     = { .ofs = 0xb8, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_CAS_BIST]     = { .ofs = 0xb8, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_VE4_BIST]     = { .ofs = 0xb8, .bit = 20, .write_en = 1 },
+	/* Bank 7: offset 0x454 (DUMMY0, no write_en) */
+	[RTD1625_CRT_RSTN_EMMC]         = { .ofs = 0x454, .bit = 0 },
+	/* Bank 8: offset 0x458 (DUMMY1, no write_en) */
+	[RTD1625_CRT_RSTN_GPU]          = { .ofs = 0x458, .bit = 0 },
+	/* Bank 9: offset 0x464 (DUMMY4, no write_en) */
+	[RTD1625_CRT_RSTN_VE2]          = { .ofs = 0x464, .bit = 0 },
+	/* Bank 10: offset 0x880 */
+	[RTD1625_CRT_RSTN_UR1]          = { .ofs = 0x880, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR2]          = { .ofs = 0x880, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR3]          = { .ofs = 0x880, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR4]          = { .ofs = 0x880, .bit = 6,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR5]          = { .ofs = 0x880, .bit = 8,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR6]          = { .ofs = 0x880, .bit = 10, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR7]          = { .ofs = 0x880, .bit = 12, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR8]          = { .ofs = 0x880, .bit = 14, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR9]          = { .ofs = 0x880, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_UR_TOP]       = { .ofs = 0x880, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_7]        = { .ofs = 0x880, .bit = 28, .write_en = 1 },
+	[RTD1625_CRT_RSTN_I2C_6]        = { .ofs = 0x880, .bit = 30, .write_en = 1 },
+	/* Bank 11: offset 0x890 */
+	[RTD1625_CRT_RSTN_SPI0]         = { .ofs = 0x890, .bit = 0,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI1]         = { .ofs = 0x890, .bit = 2,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_SPI2]         = { .ofs = 0x890, .bit = 4,  .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC0]       = { .ofs = 0x890, .bit = 16, .write_en = 1 },
+	[RTD1625_CRT_RSTN_LSADC1]       = { .ofs = 0x890, .bit = 18, .write_en = 1 },
+	[RTD1625_CRT_RSTN_ISOMIS_DMA]   = { .ofs = 0x890, .bit = 20, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUDIO_ADC]    = { .ofs = 0x890, .bit = 22, .write_en = 1 },
+	[RTD1625_CRT_RSTN_DPTX]         = { .ofs = 0x890, .bit = 24, .write_en = 1 },
+	[RTD1625_CRT_RSTN_AUCPU1_REG]   = { .ofs = 0x890, .bit = 26, .write_en = 1 },
+	[RTD1625_CRT_RSTN_EDPTX]        = { .ofs = 0x890, .bit = 28, .write_en = 1 },
+};
+
+static const struct rtd1625_reset_info rtd1625_crt_info = {
+	.descs = rtd1625_crt_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_crt_reset_descs),
+};
+
+static const struct rtk_reset_desc rtd1625_iso_reset_descs[] = {
+	[RTD1625_ISO_RSTN_VFD]                 = { .ofs = 0x88, .bit = 0 },
+	[RTD1625_ISO_RSTN_CEC0]                = { .ofs = 0x88, .bit = 2 },
+	[RTD1625_ISO_RSTN_CEC1]                = { .ofs = 0x88, .bit = 3 },
+	[RTD1625_ISO_RSTN_CBUSTX]              = { .ofs = 0x88, .bit = 5 },
+	[RTD1625_ISO_RSTN_CBUSRX]              = { .ofs = 0x88, .bit = 6 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  = { .ofs = 0x88, .bit = 7 },
+	[RTD1625_ISO_RSTN_UR0]                 = { .ofs = 0x88, .bit = 8 },
+	[RTD1625_ISO_RSTN_GMAC]                = { .ofs = 0x88, .bit = 9 },
+	[RTD1625_ISO_RSTN_GPHY]                = { .ofs = 0x88, .bit = 10 },
+	[RTD1625_ISO_RSTN_I2C_0]               = { .ofs = 0x88, .bit = 11 },
+	[RTD1625_ISO_RSTN_I2C_1]               = { .ofs = 0x88, .bit = 12 },
+	[RTD1625_ISO_RSTN_CBUS]                = { .ofs = 0x88, .bit = 13 },
+	[RTD1625_ISO_RSTN_USB_DRD]             = { .ofs = 0x88, .bit = 14 },
+	[RTD1625_ISO_RSTN_USB_HOST]            = { .ofs = 0x88, .bit = 15 },
+	[RTD1625_ISO_RSTN_USB_PHY_0]           = { .ofs = 0x88, .bit = 16 },
+	[RTD1625_ISO_RSTN_USB_PHY_1]           = { .ofs = 0x88, .bit = 17 },
+	[RTD1625_ISO_RSTN_USB_PHY_2]           = { .ofs = 0x88, .bit = 18 },
+	[RTD1625_ISO_RSTN_USB]                 = { .ofs = 0x88, .bit = 19 },
+	[RTD1625_ISO_RSTN_TYPE_C]              = { .ofs = 0x88, .bit = 20 },
+	[RTD1625_ISO_RSTN_USB_U3_HOST]         = { .ofs = 0x88, .bit = 21 },
+	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       = { .ofs = 0x88, .bit = 22 },
+	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        = { .ofs = 0x88, .bit = 23 },
+	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       = { .ofs = 0x88, .bit = 24 },
+	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        = { .ofs = 0x88, .bit = 25 },
+	[RTD1625_ISO_RSTN_VTC]                 = { .ofs = 0x88, .bit = 26 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       = { .ofs = 0x88, .bit = 27 },
+	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        = { .ofs = 0x88, .bit = 28 },
+	[RTD1625_ISO_RSTN_USB_PHY_3]           = { .ofs = 0x88, .bit = 29 },
+	[RTD1625_ISO_RSTN_USB_PHY_4]           = { .ofs = 0x88, .bit = 30 },
+};
+
+static const struct rtd1625_reset_info rtd1625_iso_info = {
+	.descs = rtd1625_iso_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_iso_reset_descs),
+};
+
+static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] = {
+	[RTD1625_ISO_S_RSTN_ISOM_MIS] = { .ofs = 0x310, .bit = 0, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_GPIOM]    = { .ofs = 0x310, .bit = 2, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_TIMER7]   = { .ofs = 0x310, .bit = 4, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_IRDA]     = { .ofs = 0x310, .bit = 6, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_UR10]     = { .ofs = 0x310, .bit = 8, .write_en = 1 },
+};
+
+static const struct rtd1625_reset_info rtd1625_iso_s_info = {
+	.descs = rtd1625_iso_s_reset_descs,
+	.nr_resets = ARRAY_SIZE(rtd1625_iso_s_reset_descs),
+};
+
+static int rtd1625_reset_probe(struct auxiliary_device *adev,
+			       const struct auxiliary_device_id *id)
+{
+	const struct rtd1625_reset_info *info;
+	struct device *dev = &adev->dev;
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	info = (const struct rtd1625_reset_info *)id->driver_data;
+
+	data->descs           = info->descs;
+	data->regmap          = dev_get_platdata(dev);
+	data->rcdev.owner     = THIS_MODULE;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.ops       = &rtk_reset_ops;
+	data->rcdev.dev       = dev;
+	data->rcdev.of_node   = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct auxiliary_device_id rtd1625_reset_ids[] = {
+	{
+		.name = "clk_rtk.rtd1625_crt_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_crt_info },
+	{
+		.name = "clk_rtk.rtd1625_iso_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_iso_info },
+	{
+		.name = "clk_rtk.rtd1625_iso_s_rst",
+		.driver_data = (kernel_ulong_t)&rtd1625_iso_s_info
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, rtd1625_reset_ids);
+
+static struct auxiliary_driver rtd1625_reset_driver = {
+	.probe    = rtd1625_reset_probe,
+	.id_table = rtd1625_reset_ids,
+	.driver = {
+		.name = "rtd1625-reset",
+	},
+};
+module_auxiliary_driver(rtd1625_reset_driver);
+
+MODULE_DESCRIPTION("Realtek RTD1625 Reset Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.43.0


