Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8DBCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibnQe4VUFDv6NqO0BsbuVRca+my/sU/g4Jr5YISRZLQ=; b=o/Xvrrlffe0wBBiIZu2fXZGdAV
	NhDPo3ze8Elg0tTe5pj47Gtzg8ympQURGdTqZdZsrjXHblsQ+YIfXVz0+ZSrN3I9mWpNAZtQnOcW4
	5xyE76Jtt+9uNey+0n/ZU7KS+dU4bFOs0hxm0fjcDvi/aoTT95DZel5XDaYTLT92tSxHKU6jkXFLq
	pDCNJPHI6R4D8lvbPYiM/l5KNWPEDfWkyLeTHejFhtKbLiP2Y/lzpM0spuUbePVHZWqL4FmRs/Wp3
	z/qyVu2wAGHNtCEhY6wUXAC+jyMEGOdKgvl5dFXxJOAT36kULMVJvgKaC0JQjsv3mnxzACjz+9+/Q
	iYuBpi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc7Z-00000001cS8-0pDg;
	Thu, 11 Sep 2025 07:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc7W-00000001cNn-0EGT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AD0960249;
	Thu, 11 Sep 2025 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5264FC4CEFE;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=Ym/gINLHmikuw69uc6+19TWOxHmwsBHXCw48WiyJQsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UD0BngKfEOEQtMBSI8z7uftnKJd3DgMs57frIxGd2AnM10aK4WYIyxvqBQa1h2r5f
	 mYlfCAHyxv1vLNeY5T8kKnrbuPEOsjaGPv8pevpsI2TC9H1OkJZwbihEf9FiFk7wec
	 lVfDOX90DYNiu6TcUCULeD/2BOrWW85mciBL0o6oSxOUDBZoY2i5XAbyzBWGQPmZk3
	 q7quZ9nqCxtleOWF1hlATQuyKkdP3QeqHqtxBdakhYWtdvWrPw9ZY3y/rrR0GcDEkq
	 6SIcXI01gJ5WrZSJDK1ct2Qn1RCwTNSmhCYFYzTkDybsR3ZwU1jPCroi68PiG/aoI6
	 VCuve4TBp0/tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47273CAC587;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 11 Sep 2025 09:53:20 +0200
Subject: [PATCH v3 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-max25014-v3-3-d03f4eba375e@gocontroll.com>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
In-Reply-To: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=1541;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=MKPHYiixnvo18K/Tipnb4mW1ZFhvWvMFDXU6EXpZykM=;
 b=/CA6jwFw9AdCyBAGzCS1uYBPRwTDVmL+ssxdE9/CUUa/h/o7hlenPzXWcz1X3FtED346hee9A
 8SD+Do7xMlUAHbnbtAef882ZeDM34phyYWsrLI83NbXgjNDIo6iamk1
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add the missing backlight driver.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dtso | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be42a17aa89b77bd5b919382c84151..3d0983a3ab5463196de8cefb863bde74426b735d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,27 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		default-brightness = <50>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+		maxim,strings = <1 1 1 0>;
+	};
+};
+
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_panel: panelgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07

-- 
2.51.0



