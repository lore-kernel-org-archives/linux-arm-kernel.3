Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FF9CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ1HvyFZe9rnbVUnBrY11zqcqxegMPjT3J2vbInY1mA=; b=s8kL2LYh2p169IKMD4N+oDLF4a
	XerbAD+ye0XWzlWn6H40PALkTZRosBNElvRmBdY++jaS5aSRqHNGRsIaQGqgEblm0Xz19hvRHXqND
	CzACiuSE6+ge7yNPd4sk4vV40bCX2UJnRpfaDC9NwZFypwzmDe0jZViPlpdSj23lVO2pvQf2yRBBK
	iB+8UeBwAvTBHt8x39hVXI5Q+mkJ+v3CD/SvFx6XHIm49wTRWpetempCDA1HJPdOSDsKWi0bfAXDt
	/y5KpmfXOYzDpjlXLfVK+O4phZsXAJVrlv64CbRlvOwt5ib182BYK/xX/jpr6ayOxFsA0/aMDY+hw
	/oB99Lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ved-0000000GzeH-3zYC;
	Sun, 28 Sep 2025 17:57:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veZ-0000000GzZC-3AWA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4925C2609E;
	Sun, 28 Sep 2025 19:57:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Gk7c8tPyBsz; Sun, 28 Sep 2025 19:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082261; bh=dz8G2vASF2vWWKjY26SIIdI778aFDZUdkUwOcUEZZPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EP+5I8HeLH43b5mBUIEeRuK/JFt/oMBadeORNRnr0dxs95hh1MOPP3R6U7fPb/p6v
	 SkcU613M1ds79+2RNsJeAmuNqmNlygedeL2Zn/AE1mGO4y2f2+zQ0jdpsdA2vhe71V
	 4oOMzWtw7jz7x2aaNdpQQ2ghHqYQPymgXSHHaZEoNxqLvKOstsXGNchExb2MuZxJpu
	 n+TTGdKRjcJvM1zEC0TqBzg9XtjWkvoQtGkfNeNW4OkuDDPvxDKLXKxED6KX7i7vc7
	 2I+SZSEx1GoD+rHk5/5WtTDCNYli431By169VRSCyXw+ZYFL/Syvk/ugKZXi3o9RSl
	 TsBGWUnUnBSig==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:39 +0530
Subject: [PATCH v3 5/6] arm64: dts: exynos7870-a2corelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-5-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=2281;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dz8G2vASF2vWWKjY26SIIdI778aFDZUdkUwOcUEZZPk=;
 b=bNbC3slo543CtA0K+jVO0kiPtcdAHWpWIlnaP2b9Jbmndbcn3kA70Jmsf9LhMAP9vCubJE/WC
 I+gYCb5buqjBoa3AmQfeq+EAOjuDyDSSx/rVgYbodHiki6xmZ7tUDiI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105743_934939_4CA0720B 
X-CRM114-Status: UNSURE (   9.20  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 ++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..07dff8809afbd34ed91f7d9cf270a16ce7992539 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -27,20 +27,7 @@ aliases {
 	};
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
 		stdout-path = &serial2;
-
-		framebuffer@67000000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x67000000 (540 * 960 * 4)>;
-			width = <540>;
-			height = <960>;
-			stride = <(540 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -110,8 +97,9 @@ ramoops@46800000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (540 * 960 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (540 * 960 * 4)>;
 			no-map;
 		};
 	};
@@ -124,6 +112,47 @@ vibrator {
 	};
 };
 
+&decon {
+	memory-region = <&cont_splash_mem>;
+
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <836000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4101-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 7 GPIO_ACTIVE_LOW>;
+
+		width-mm = <62>;
+		height-mm = <110>;
+
+		panel-timing {
+			clock-frequency = <69336720>;
+
+			hactive = <540>;
+			hsync-len = <4>;
+			hfront-porch = <364>;
+			hback-porch = <40>;
+
+			vactive = <960>;
+			vsync-len = <2>;
+			vfront-porch = <244>;
+			vback-porch = <13>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.0


