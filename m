Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E892FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYJjipLiGeFYloNgGUFs+2zvPe7aA90w0P0PeIdsfXk=; b=2VK4LtPAFjpElPVMNMOAouaRfN
	QM0ObWEyOcgsTwHv0Q/TY3L80j7CevIBmJoSZHXu3N4a3d1AneJfoi0dLBRAo7mE6AZ02ZbWOj5t1
	G4v2oYpml1jggHUpD+216o0XMLSAgr0vl32qCUr/wUjmo396zmbSINRYAvSDYSUyQLxT1Oynp2mri
	AHniKceAFyjLN9+/8XZJgOYKvhoWAd3jkMxymd4ugrm9PEMhqbVHGzPJcCyJdsHV4St3ea+5Uh4B3
	DZ01YlcnqskRe8uaKN5JW8AuUIFAluXvfmeT+GkYA7cpnNyRb24989884hA+fKGnlf3HH7TvplZd/
	A9iUpRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeOC-000000011B4-2ioT;
	Tue, 28 Apr 2026 09:05:56 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeNz-0000000111t-3MMp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:05:45 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6211D20153F;
	Tue, 28 Apr 2026 11:05:42 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 284F8201613;
	Tue, 28 Apr 2026 11:05:42 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 15FFA1800083;
	Tue, 28 Apr 2026 17:05:39 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH 4/5] arm64: dts: imx93: Cortex-A Core remoteproc device node
Date: Tue, 28 Apr 2026 17:08:18 +0800
Message-Id: <20260428090819.17761-5-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020544_122186_89AD8000 
X-CRM114-Status: GOOD (  12.07  )
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

Create device tree for i.MX93 14x14 evk and 11x11 evk, add Cortex-A Core
remoteproc device nodes in these device tree.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 .../imx93-11x11-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../imx93-14x14-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  | 14 +++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..9fb2b94b83b4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-11x11-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..b2481bf19b4a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-14x14-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
new file mode 100644
index 000000000000..9d9a60404d2b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/ {
+	ca55_1: remoteproc-ca55-1 {
+		compatible = "fsl,imx-rproc-psci";
+		/* bitmask:0b10, assign A55 Core 1 */
+		fsl,cpus-bits = <0x2>;
+		memory-region = <&rtos_ca55_reserved>;
+	};
+};
+
-- 
2.43.0


