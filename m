Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E7CA0EFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpHiiEBurp8nEv7Bro5iYvuvWsP7SMpgTxM1ioPbJlY=; b=RNbDI6PeCd/ZYqccPt98zSAboF
	q/RjdFju7csIiSzxsUrXwm4Rm7areKUb2uF3S6b9JUPBqcBt/cYMKog3BWueCWD4pl/NuzfwI9dyl
	Pi1e6+//xDXscmtnw66O1QKM4DawHzr+r4Uf4sr1sP/sfJJ8+uBKcVOAzytlY+OE0Dwpt/G47Fvsn
	bVqMVGVDQg3iAsKPEJRnWXOsxoG4xJstAT3meqN7xP82eccwdxjSVFZ4W++qy7dyn0oPC1Y14GSUT
	Gf+wr501qA55twF1uCsmAU+P+xfuWPvw7RLg1LOKv9xvYj6Ma2xTCPgj9PbqI6hcRMPoI9pRU4seF
	YVp+Iq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMZC-0000000Accr-3DG0;
	Tue, 19 Aug 2025 13:39:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK3U-0000000ACW0-3qaG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A730246248;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D9CCC19424;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601144;
	bh=4IkvT70nHT7DJuTLaCAnhM8pgdfF6Jlm4i+ijqif6h0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KFAUQzIOR+leIQKJcUy4B90FB3ChcuAZoS9nHClOE2t5JBv9KB+3hppHNdF0WT/Ml
	 U3LaBp8IGvf9rY2B3QAK4OndIR46wiAlmbKbl0y1Lu/r+e2JuzJUSaZ6lbli2OKv4o
	 6uatutfD8cvIkqR7IF76J5pjOWX+O1hgCwbGzpZPn9EeA5zWj13iWfXEnu9GbEVVhV
	 zYAg9mi5ImgFKUcCYraLTy1r5Lc8p8Og3LutjhdRF41rUKlhNXSIOl5JQgamzHZ8dK
	 7mEt6aWINcNeiWTnwumktE3+V5cdZUjoLS5J7k1LOhV2MPhHsBbZ6LO41KXHMZA7Cu
	 pvexCzJPL7ZuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2488BCA0EFB;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 19 Aug 2025 12:59:02 +0200
Subject: [PATCH v2 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-max25014-v2-4-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=1572;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=xr006rWCG+GoAENJGxVDQaJVtVRYuMkX4hmKlW17MZE=;
 b=o3s7pl43uFDuSAYIBTVfU+HDdqpXl0+vhB17TTwnR9M7Nz9N2n3Eh1HwIQ6KGejAGhPTdZPOp
 OUEO0DwIC5JD8ewHxNjwo1HsnRgNLeaHl673uuPCPkyfALCOXeZv5YC
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_035905_016388_A92E3473 
X-CRM114-Status: GOOD (  10.72  )
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

Add the missing backlight.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...p-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
index 3eb665ce9d5d2a1c742ffb4feca046e406e29956..9124cd87cce54a5aa7b7ad674f70f814d1dc3515 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -16,6 +16,7 @@
 
 	panel {
 		compatible = "boe,av123z7m-n17";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -91,10 +92,26 @@ lvds1_out: endpoint {
 		};
 	};
 
-	/* max25014 @ 0x6f */
+	backlight: backlight@6f {
+		reg = <0x6f>;
+		compatible = "maxim,max25014";
+		default-brightness = <50>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+		maxim,strings = <1 1 1 1>;
+	};
 };
 
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_lvds_bridge: lvdsbridgegrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14

-- 
2.50.1



