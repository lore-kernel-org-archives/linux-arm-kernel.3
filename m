Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F879C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urEJ1iCqjowrLavMJa9C2MOiJ+o/pXJzRbOE1+plnWQ=; b=tP+VblRF/nbtdprnMsy+v+AQ7D
	uSZJ4fjE8aPPkav/7tGkd9AqneOMfl48jtkJHra6IMLGaaRpRPT32KpX8aQTDxio8xhYS2GGx/HI9
	Ep1Vixk32ZAIvzUJUPrGTzW/48huBNGkrAYEFUydLyB0LUm4h+y3eXjpnxnQBcB7TrSI22RvwAEpR
	9+JA9TBasHlravsziPra7FUjk7oyTdYr6Gyd10+MYdZ1sj5Hkriu7V8dopuEl2lVLRPC88qtSMkOW
	UJEkz98yLEp0Sh9FPbM7MbESYvZILhEXS3AHstBV3h16boCdMWD4F9Tp4tY+ANH3iOuPLbflMI5Sg
	Lsqyek8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvIg-0000000CxQ1-0c3a;
	Thu, 26 Jun 2025 22:42:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUszN-0000000Ciqp-3VAT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:14:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A69D825F3C;
	Thu, 26 Jun 2025 22:14:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIk8a1SjmYCl; Thu, 26 Jun 2025 22:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968867; bh=/qSF7L7luLEiSviSyNY6D/hHKodT+5kgEBURabc71E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QJ/1ifXRgToky+vzRXaBpGEr4GwfEFzDf0ByDOjTMwRjXJK8QdYqvpKAwzM4sTDKl
	 H8bbtB4VBXsSfpsBpaLSPBN/t1ophYjj4s9m450afzy4yKEAksMqN+lsdjTzbv2Y17
	 ZyvBmV1SAqMMySzXUNTV42taa+hWa5I0BUcrsEfp4KHkSXpzSE0ErXZ3Wc9t/9sXC2
	 nTTZ/WPobaQnw7xqOPmRiBeqHwuCgWBnJ7ngn0Ie53cigL/XAbcqp+BGobDus+6VQf
	 VrCGjGY2N/iGN5jmVx1IsEOTN6ekw4d8kBl229v6P/mExaTWVruiSlGhUCLj5G7Yca
	 gPlMn3lAQcb2g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:27 +0530
Subject: [PATCH v2 4/6] arm64: dts: exynos7870-on7xelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-4-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1963;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/qSF7L7luLEiSviSyNY6D/hHKodT+5kgEBURabc71E0=;
 b=aHmPaBlIkzPBoxVcVsk166TsubVpviXc5kOwtF14MzZHL+OR8JH/TSwvq9aS8HJQIcdi4zfKG
 XR4R9cFnYGwCaBi6odcn42MLZ/wyMdPBrEqGL4NBL35qsX4HUzZjj8z
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131430_008020_DA638606 
X-CRM114-Status: UNSURE (   8.58  )
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

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 51 ++++++++++++++++------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index eb97dcc415423f405d7df9b9869b2db3432fb483..149c72676c3c337388b1e4b631e563362750d4ee 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
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
-			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
-			width = <1080>;
-			height = <1920>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -122,6 +109,44 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	panel@0 {
+		compatible = "syna,td4300-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+
+		width-mm = <68>;
+		height-mm = <121>;
+
+		panel-timing {
+			clock-frequency = <144389520>;
+
+			hactive = <1080>;
+			hsync-len = <4>;
+			hfront-porch = <120>;
+			hback-porch = <32>;
+
+			vactive = <1920>;
+			vsync-len = <2>;
+			vfront-porch = <21>;
+			vback-porch = <4>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0


