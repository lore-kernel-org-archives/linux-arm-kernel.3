Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77100C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vkm7SHhLjq1OSn5E4JsUgyYWZpx99XHrbc4OM7+gChQ=; b=WFRvNtRanvyVDAqmv+oymgj9+a
	B1KQ7K0SjqlLs2+zTcBhf7L/gy2MuP4yWLFBsxDDcF7o/q9Q303a33Ilmr7fKVY3s39efLTOm4aBB
	sirNPxilvWlX2m244PbVgLgA04aAmiKZzPMaRtI7q4cLAr1WlkaCC8iojzCrv9sC1UzSS3cMQpI34
	+6re3ZIugZTSBgHBqF4KOMZFU9/zJUM5SECW8o9LwNuIHPiluH6o4lfaZfcGpN/5EoQwOE10XkK2M
	tmSBqvdJoBrAY+BfaQFiilDg2pEg6474p4JRAQ8tEloV8USgNJP1mwdcF2QIyKq+Oa9q77gZgzG9W
	Iu5Jeorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAyQ-00000000c1W-2uxG;
	Mon, 28 Sep 2026 13:00:50 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAyN-00000000bvW-0whK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vkm7SHhLjq1OSn5E4JsUgyYWZpx99XHrbc4OM7+gChQ=; b=XA0e57lU+7IZ0t80d/jog2GGck
	UCdT2zZoj2UlgGvAjOpDy2nPyxJTG1jp/39ZPxthYiTVbkpwzJ0dxfuqdo1xtCVu2LykdTV0QgOCm
	1K1c3lSqzlE8r7Yv7l5LzNNA59ud123b91EKJl2I4sW1/SCsIjxQJwceLKeGrt/0ERKbnsWmwsuQ2
	m79/QJNpsiuhA+o1p7faQmfwO9ftAkWRcV8uSWcglRQZ4TmdS9iR0am3sqTFRJFxPjXC3RlLFVYET
	hCwMFwiXS4BtEQZ3BD/Y53kNHxA79tO3Uw6vphCmIPn5cHevs1EGikM9NYu51dRa/rP/L9uBeRIkm
	jwuh5zZg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:35218 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBAad-0000000Fp0t-1YMW;
	Mon, 28 Sep 2026 14:36:14 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC
Date: Mon, 28 Sep 2026 14:36:12 +0200
Message-Id: <20260928123612.2250601-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_060047_775207_0494CE31 
X-CRM114-Status: GOOD (  10.26  )
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

Add device-tree for PHYTEC phyBOARD-Mira-i.MX6 DL board with eMMC. The
variant with NAND storage is already present in-tree. Now let's add the
eMMC variant for which the compatible string "imx6dl-pbac06-emmc"
already exists too but was not used until now.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  1 +
 .../nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts   | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..4361708f70e3 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -136,6 +136,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-mba6b.dtb \
 	imx6dl-nit6xlite.dtb \
 	imx6dl-nitrogen6x.dtb \
+	imx6dl-phytec-mira-rdk-emmc.dtb \
 	imx6dl-phytec-mira-rdk-nand.dtb \
 	imx6dl-phytec-pbab01.dtb \
 	imx6dl-pico-dwarf.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
new file mode 100644
index 000000000000..aa3239660bca
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp@phytec.de>
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6dl-phytec-phycore-som.dtsi"
+#include "imx6qdl-phytec-mira.dtsi"
+#include "imx6qdl-phytec-mira-peb-eval-01.dtsi"
+#include "imx6qdl-phytec-mira-peb-av-02.dtsi"
+#include "imx6qdl-phytec-mira-peb-wlbt-05.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Mira DualLite/Solo Carrier-Board with eMMC";
+	compatible = "phytec,imx6dl-pbac06-emmc", "phytec,imx6dl-pbac06",
+		     "phytec,imx6qdl-pcm058", "fsl,imx6dl";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+};
+
+&can1 {
+	status = "okay";
+};
+
+&fec {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&m25p80 {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&usbh1 {
+	status = "okay";
+};
+
+&usbotg {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
+
+&usdhc4 {
+	status = "okay";
+};
-- 
2.34.1


