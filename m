Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE1FD7082
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMNnJ+xAbhL4LwxsgRluL0GNGS32DXB6PY0AmcmF+W4=; b=4z6JdIOhqtvw5XyT2KpYNrTeyv
	pIT8+zrC2yEt3u591IJsshnzjkmVmXNscrrUFcptzNw+f4PKc2YCRqq9eZjwOe7buTgCMFmgPnI4w
	rFrnbzSpJVam3fcXUVKXjU9GCi455o14KrzKTNxNKOFPVUFjpPYuxp0FbjvZVB+lncyo8D95JR5NA
	x3Hp+diQZi0zJ8U9LpOtO941a+oJKEEf7zLr2opsDF+j7xnfM4uNMIiRCby0GNWEdVnM7uZ1tTLfy
	S0Hfsj+NmGEMm0BXlakeSdjOpXQ66+SKye1CGtmbe3VUp5C854Bu1ATrK1D29CYZxr6xMVkHgWOhr
	jJVVPbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQZ-000000066gO-3373;
	Tue, 17 Mar 2026 11:17:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQS-000000066d4-0p6U
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dMNnJ+xAbhL4LwxsgRluL0GNGS32DXB6PY0AmcmF+W4=; b=P64e0IP4Osb0LHWIpLc7wDU0t/
	3Iw2CI8tdu3SdTyaFPn2z/2lNM4lVvjuvoVkq3v7z1yE9IYHe7n+3v5LKWedugBD084/aAK/IUMfb
	FepGzY2Tx9SbPV3K0rNSOAblaEbsb/geZw7a+lXCmJbDnStecT2YWueXSGUo4HmZydJSvz+WQfBpN
	Ka4djMxcJbiFW9xoHM5LRIqCsm5dUU2aIyXCPOA09sexlF+06vnR87tYJjQL58BIXugtuIt7GUV1W
	gMH+yqpC/CGnD/oCsKB3xns2Ry8TOuGOvHl+5/gn+ADm3ZqYoEAb9voBVURTjaVh5vdhDdvncuhmt
	H3g811ZQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQO-00000008nyC-0ITz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dMNnJ+xAbhL4LwxsgRluL0GNGS32DXB6PY0AmcmF+W4=; b=q6eiv5xAXRMF6SkhkAXPUAW/x8
	onDKXptFXfbNgn9vcfdY9/3MARi1D95J0Fbgbi9cfhHnL+mM23wJB6S+uFjh35op1hTvyCNqtzerB
	fYKUhqppx1RQgn2HRnhUyBTSLqO42+BZbKY9XGcw90rXjsODu+z3C5JP58vOQBXRzTXg8EZ201whn
	TKy0Hbo9YvMrcoweEVgqdRkUQhtm6PuEU8GoA9QLeTeZPy9P1WtAn1o8BjLgoc6GjVkw1wyfi9An7
	TX3gj/60MhwP1dantNgJ8315P5IwCt0BulAktECOYa9kDkqRrkr7yDSxgAMSI+lwobRp4bqtIJ65G
	m+yjmsIA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQN-00093Y-1y;
	Tue, 17 Mar 2026 12:17:23 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQM-000MCw-2V;
	Tue, 17 Mar 2026 12:17:23 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT overlay
Date: Tue, 17 Mar 2026 12:17:02 +0100
Message-ID: <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_111724_345228_DD42F43F 
X-CRM114-Status: GOOD (  12.57  )
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

This overlay enables the LWB5+ M.2 wlan module from ezurio.

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 +++
 ...3-tqma9352-mba93xxla-mini-ezurio-wlan.dtso | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index db536522600ac..9a55a86ad385b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -495,6 +495,10 @@ imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-dl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl-lte.dtb
 
+imx93-tqma9352-mba93xxla-mini-ezurio-wlan-dtbs += imx93-tqma9352-mba93xxla-mini.dtb imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
+
 imx8mm-venice-gw72xx-0x-imx219-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-imx219.dtbo
 imx8mm-venice-gw72xx-0x-rpidsi-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-rpidsi.dtbo
 imx8mm-venice-gw72xx-0x-rs232-rts-dtbs	:= imx8mm-venice-gw72xx-0x.dtb imx8mm-venice-gw72xx-0x-rs232-rts.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
new file mode 100644
index 0000000000000..12a14d8711035
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Martin Schmiedel
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+&lpuart7 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4329-bt";
+		vbat-supply = <&reg_3v3>;
+		vddio-supply = <&reg_3v3>;
+		shutdown-gpios = <&expander0 5 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usdhc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	brcmf_sdio: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+		reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.43.0


