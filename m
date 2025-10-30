Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VenRYvm6J8ztbgoSdPBRwnjlKjkK1fib+pjsZ23tyPI=; b=EBhwce4IOVcRCDF0G3z7zZqJJo
	HeEDEHAYraJL63VkRjYQIqlHEOslSHnHoGciQmUDnBpjKcz541024Fnyuh7T3w7kwN7bpgXPz8r4C
	+OkeFhBHx+FsCzM9Uv7eDNKB8Ll0GrKheZIvoXYUNs0zylpechF+0trm3ubhet1v8orS23CCg/qjD
	Ryvy/b77QdgIfQ19nckUCdXCuKLxgOgBaXId36um7AlR/Uuh4Eq413tzpSfyaLNX7tlKne1y19MvH
	JgI3ONyvXSToqa8/5nY209471INOq1QO4tvJOxu6pBoSdHSO6XDW5lJ4h8scwIFCY8BiqrU1H+DFW
	HyUHltoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCv-00000004fFc-0aBa;
	Thu, 30 Oct 2025 19:21:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCn-00000004fA1-3PYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:21:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1726125CE1;
	Thu, 30 Oct 2025 20:21:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPcBtd3wO5oj; Thu, 30 Oct 2025 20:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852063; bh=gCZC2hfr3oNwXsihsbr7So/902BJGZg/qBfw2mGaraY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jSmiYUcRMVvbeMGHiL1iiLoDF8cBo2SJqZzk5XYUUuVbSZR+91g0ELKGk+daUhJ8V
	 MRAMRoAUiEdlU/mbPnAx2U/AequTnRCdE+E1IuzAa/es1/OwUZRxm94fb7nexcPN/j
	 oyk9qVTB58sTGovmg3hZqfge930jaXTbFjNiQAwDHlS4x0jztjv/mtSM54UpgoIpmj
	 pbw++bV78ErF7bwRVBpXSiP477iQ+oqPAOncA1imNV2cubl/2dydQoAU8te4bUjTDp
	 tSNxuz2rKN4sfD1j2YXHe7SEu78dfOKdAxwwhkYBnnxSTn92AfLDDszZH8E/5zST6h
	 eFaW6hyr9CR+A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:18 +0530
Subject: [PATCH v4 4/5] arm64: dts: exynos7870-a2corelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=2281;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gCZC2hfr3oNwXsihsbr7So/902BJGZg/qBfw2mGaraY=;
 b=O4+V9VOCvcV6kL/33xJ9HqNwn/B3q3l+lxMdfIRV5RATyKeuCbegysgtjkKqIQbU16khyJw4O
 Bw7A2/M9TubBP661CRiRsE9K9uWUXqcTu0931F+Fk2QpTVZXU8ZikYO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122105_994288_47926028 
X-CRM114-Status: UNSURE (   9.84  )
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
index 07467158ee6a37e17402fb50554184c4c93f77d5..6f40ca4350ed72b57e511165e53f00e77f8978f3 100644
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


