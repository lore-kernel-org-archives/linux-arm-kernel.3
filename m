Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B908FD11701
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niqxQDaW+UyAF9ARf4T4yOF1YW8cp/Thk/VtaHp/VdA=; b=NYEPWUR1leknVK48upZpvPN+XY
	Qg3rkj9x/x0Czjfb49zy+buBnf7ZLk5eQ05gcLCwMDEpb7oEDeiWKJbBC3sB2oxe/YNW+qX3xxnfh
	DyDy9HYnkxNdwdVFNZM+chxofmNzIKesIdXK4c/McD/nO3isahYrp4zlV08FEZ2CJPxLsj6K/vHBd
	p4amg41gUCvUWbcE2AIAoyxUioNIIoueSUkt8zO/Lt5dHJ4snF38Gjf8pLm638TbrC0KNmbCHA5p4
	FdkNjCRq/1WuMtjHv6pcoBrczBLEW0wDytORcT9r42bxsGl6ZptkNdtliKkWQ1f4YnyAowqa+uvnW
	k8d8zksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2TD-00000003URR-0AXV;
	Mon, 01 Dec 2025 11:53:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2T8-00000003UNk-3fd9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 294D0443D9;
	Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E592EC19421;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590006;
	bh=As7VxcdiGSM6WKyddLJP3nl6IFr7YW7eI/5lBDAp5Rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X2HX94rWnPBAkbz7Lfv6lz0Jm3dtbZc2F/CfmmqjLGTeycTJ5FmQ2VidxT7FC8OvX
	 /Lb1w4RSv9TTFXnY8z8+69uAGaatHEURsCnHFHfqId173Skxh0zszEGnMZJpiT4NLB
	 vmUW5V0Qtbf2g3GnOWeVTMinPVsFm7fXbwzzx7N5/+WLWZ6TQ2RYXBt4CWvwwgt7Vh
	 2eJY6YKYs7emIKksS4BNu++56dVrh1xaMmvptVM8HQPu32vFW+vm0ygbDGG6qE71fM
	 go8Ag2NE4sz8SoUkLGe9cFJAFueqjolojCZ3aoczPYP2zVL9b43O7eva0KcE6ddEjL
	 Wo6GMsJpS9S/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75FBD116F1;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:53:22 +0100
Subject: [PATCH v6 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-max25014-v6-3-88e3ac8112ff@gocontroll.com>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
In-Reply-To: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590004; l=1620;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=qi6/BcrCEYVJ/jWiiobwb7h+IH88mEoOqv0vUhXRMjc=;
 b=v9bWOBB/IXa5US40LHAmKkyL4NOpXzigHVKXAlxAEqggqlIBxCCtQzNEEmYXyJ+PDpr2pljlo
 1zO9berqyLCDQdQod7Me8G7CzfQ5ACNwxTkDjdxdWge9tTc2VQA2IGP
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_035326_965763_01E0FC64 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be..0e2914861154 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,36 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 1 2>;
+			default-brightness = <50>;
+		};
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
2.52.0



