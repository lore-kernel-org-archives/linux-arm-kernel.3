Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9895CCCD188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DArsQddkJIljkWGUh84qhwJD0umxG9PZt6ga5qPeI8=; b=Gtuj3bpHLmhafx/n647WSO8CtA
	tYQCk2jtFvRwvTvdCCj6K3rtQ0+/Vill2wPRjPrmtF4ZbCE9i+dT4IauvgdzeiJtt02rdkeeEV0AV
	sQT18fabd5Qd3NuVGvxJZ6uXJfujj0kFk0XBTD1O99C4YpSBXNiHM/GKTimc92mAhWgBalEzhO61l
	TbOvYyeWO5lhhV5b1X4yymjOwSqB0Jmca0vRp4RB8cpDhW7lQSzAYjQgoV1fuhxZmYl9BlWw1PVH6
	gipU5yaTU0ofH9oP/9puTdBTrOaKHUQ1g92e/QRYe6eL0J8c88v8wfoomZN2Ll4A5iwjEwaJmstIg
	AGr0eAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kRy-00000005ISU-2Rh8;
	Thu, 09 Oct 2025 06:48:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kRw-00000005IR9-3vHb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 06:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 592AA48906;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12F00C116D0;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759992508;
	bh=SFunblszffFvM+56Io8frqu3y1mfSmEnNBHnGNH6i7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IVVBAgXrXXl/5dl2VmF2Mbm6cEqRokVFGq7mclxsg4fG52d2JYbfOCC1Rcd5sjfbY
	 7CkI7LC7wO4yp6AmIVqu68sHmbhVNkbTC0movbNANrVCi0j6DTLcrXcKS7SR91RXqH
	 mcYl0PjMD7xfetquEzkJjX0Tw59CgUa1ak/KaAGaBL4Tdcsg8uUrwBF7Krm0ekXXb+
	 scCGVYdoBYA54qfZg0feszkBL8VOTATk7/x8K4WLcl/ParbZLlrYkP/4CPg7RnFGmG
	 hJ/NH/MyFPlrn1R2Of7ciMKB/njVHPn8iazvLWWWhKM58pVTVYaj88E6GnzGn6MGkp
	 zlbN/e9bi8aow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EA7CCD188;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 09 Oct 2025 08:48:27 +0200
Subject: [PATCH v4 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-max25014-v4-3-6adb2a0aa35f@gocontroll.com>
References: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
In-Reply-To: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759992506; l=1656;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=y4Wl1rNyuel5kjZN3m44EWcCr4I5S9GstAu3HGV56iM=;
 b=h40vWHPkpauVPc3CSs+IWxRf0co2q25wUyI39psVNwuRLJaoHF4qyjaaCAsXuXxpZxcj2atBu
 HRKSG8k/wxcBEH4CbI2I2L2NS+ooRR/mNPBGmG/yIUkazhrUMHGmx8z
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_234829_048702_8A1B0A1A 
X-CRM114-Status: GOOD (  10.15  )
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
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be4..e8107145a7f3b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,38 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		default-brightness = <50>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
2.51.0



