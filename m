Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F3E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9uSdWg2W+/jZzpQme78vy46Hfh/geU/9mPnscNwTkg=; b=tx1JOi3NWxtJcsgkP7cmQIhPzO
	D0NOoKPKDNf8XA9WGH1VmOFtnznRPRBrV+yzU1CxnKPFQgS4+X9uK1y7kwNC0l4ln6jilIdluGcwN
	gouNl2wpjTcC+gYWz+z+AnxCPybANewdvR9Nm/fG5rbUCtMi1c2CxS9ng46mxk5so5baqmKun3gJk
	Ovmzi4xfqa+tz2vN/oNyvJjCzS79iY56YpHULn2WE8M9wFinlO69ZQPkWoJNGXbppncT7mf25jNAO
	senUp9X/DNWGGx4E6aRX4SE9++RnlbiyWzVSwLyxbpNCjQ7i0eNGpYPMebK+TJtUUGei9Ss8/Xyjr
	KHXXuDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fl-0000000FlBM-1lAl;
	Tue, 23 Dec 2025 16:28:53 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fd-0000000Fl6Q-3xLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:49 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id D7ED61FE21;
	Tue, 23 Dec 2025 17:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507324;
	bh=c9uSdWg2W+/jZzpQme78vy46Hfh/geU/9mPnscNwTkg=; h=From:To:Subject;
	b=p7WQcdd+5mSMJcHI4K53cxzrnluu16Blo5CeVgl7zeD5vaGHGcKO64GKoKq0pNkw3
	 OnRW73XC0twTfHF3Av8v4l7AGqPlf/SucPo4fEvOMX0InEjrYb1e7Q3W1p+K0WHOW0
	 brxTy5AYkkc9IsiAR1QA2/B9Zi1uhzIYarSV+xs0wBXrYQVWHA1QZWeolt+g3HHrXe
	 tLkPVx/slXzzv/mZa1myRhnygO77rrvwtUYWaoV20X9bn1EmvT3Ts9kiynYYicZWCs
	 7CqnT3iUIn0GGiTQp8hebsBmU6lYbcuWIQJb+FfxcXZwgHxizJheqGi5WHqze9v9Sq
	 2FNAY80a3Noig==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] arm64: dts: freescale: Add Apalis iMX8QP
Date: Tue, 23 Dec 2025 17:28:30 +0100
Message-ID: <20251223162833.138286-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082846_593797_58FCDE84 
X-CRM114-Status: GOOD (  13.08  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for the Apalis iMX8QP SoM mated with Apalis Ixora and Apalis
Evaluation board.

Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
A72 core instead of two.

The two Apalis SoMs variants share the same schematics and PCB, and the
iMX8QP variant exists only on revision V1.1 of board.

Link: https://www.nxp.com/products/i.MX8
Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 .../imx8qp-apalis-v1.1-eval-v1.2.dts          | 26 +++++++++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1-eval.dts | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.1.dts         | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.2.dts         | 16 ++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1.dtsi     | 16 ++++++++++++
 6 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..61c7f0383f91 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -350,6 +350,11 @@ dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
 imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-eval.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-eval-v1.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-ixora-v1.1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-ixora-v1.2.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
new file mode 100644
index 000000000000..b5318de67cb0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2024 Toradex
+ */
+
+/dts-v1/;
+
+#include "imx8qp-apalis-v1.1.dtsi"
+#include "imx8-apalis-eval-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX8QP V1.1 on Apalis Evaluation Board V1.2";
+	compatible = "toradex,apalis-imx8-v1.1-eval-v1.2",
+		     "toradex,apalis-imx8-v1.1",
+		     "fsl,imx8qp";
+};
+
+/* Apalis MMC1 */
+&usdhc2 {
+	/delete-property/ no-1-8-v;
+};
+
+/* Apalis SD1 */
+&usdhc3 {
+	/delete-property/ no-1-8-v;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
new file mode 100644
index 000000000000..d558cff2582f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+/dts-v1/;
+
+#include "imx8qp-apalis-v1.1.dtsi"
+#include "imx8-apalis-eval-v1.1.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX8QP V1.1 on Apalis Evaluation Board";
+	compatible = "toradex,apalis-imx8-v1.1-eval",
+		     "toradex,apalis-imx8-v1.1",
+		     "fsl,imx8qp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
new file mode 100644
index 000000000000..a73a6324f552
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+/dts-v1/;
+
+#include "imx8qp-apalis-v1.1.dtsi"
+#include "imx8-apalis-ixora-v1.1.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX8QP V1.1 on Apalis Ixora V1.1 Carrier Board";
+	compatible = "toradex,apalis-imx8-v1.1-ixora-v1.1",
+		     "toradex,apalis-imx8-v1.1",
+		     "fsl,imx8qp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
new file mode 100644
index 000000000000..71568d7ec8e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+/dts-v1/;
+
+#include "imx8qp-apalis-v1.1.dtsi"
+#include "imx8-apalis-ixora-v1.2.dtsi"
+
+/ {
+	model = "Toradex Apalis iMX8QP V1.1 on Apalis Ixora V1.2 Carrier Board";
+	compatible = "toradex,apalis-imx8-v1.1-ixora-v1.2",
+		     "toradex,apalis-imx8-v1.1",
+		     "fsl,imx8qp";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
new file mode 100644
index 000000000000..1e5311512344
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2022 Toradex
+ */
+
+#include "imx8qp.dtsi"
+#include "imx8-apalis-v1.1.dtsi"
+
+&cooling_maps_map0 {
+	cooling-device =
+		<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+		<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
-- 
2.47.3


