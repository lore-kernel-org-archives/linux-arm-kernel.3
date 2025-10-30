Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E40CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sacQ0fs7VFfz7vltRXga0Bqy4l8742KI2AxqpLX2ebU=; b=S1nQMGX7X3KaI0duLTwE591JNF
	99+5IbNu4pb6LTLeg+f4qNXE1N6peviqlEUIooU8VROae27Fa65f8aiz4PV/16SEK8imxixU4lOow
	P0K0uYVt+21GeEwj3dXUZXGVwuJMrOWrp9hKYypKBCLIS40MXy+Rw0uW4o/N4rxJQ/7wyZoEGuk/2
	6YmdMENlmsRCn21sKS3LGS7KEi/DYF3N9e7FT8BJ+BvnW7jdNhVQhQz328p78S8D7Lbv4nD4IRAyE
	VF4jtl4D7MfdAoq+uKR4opUrPJ34Zf6d3BNJz2WmtbCYZI7phHTlfgmpvSKenAWRbu6iWXJXcQrSj
	34V/9MLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCk-00000004f92-344z;
	Thu, 30 Oct 2025 19:21:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCf-00000004f5f-3GvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:21:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 23FA125EC4;
	Thu, 30 Oct 2025 20:20:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGHbm5yo8muT; Thu, 30 Oct 2025 20:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852055; bh=q0Ub59ZAEdYr+waJdvNVnGcxWOdPZwHebmm7+h4GM0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N1gtAPWPCkaL83FeRN3Rv+iM0voU1Tq0OL0POyzA+HqqR9cZylV9Q1DmcqjoqODKs
	 3Mb8COznHaIrAa/xArCIRgkC61ckiqarnDDbzXgjF2depx/orpSAbx8PHE1WJE7M+4
	 6YQc43gU1f2yO0eS6Blq4B7nOSqCESDB57fq9cUYASpmomH9dmVpXvK4BLjEuvwWfX
	 g6izYcD3t3o8/TexLVwQZZ4l/1qD3rb07VZryNhppoatQLFa9MVNq+m6T64X7EemdZ
	 W2zn8Ks7zQvkpzzdcz2A1wCJp4PtAckPuouZcRQDbkxEHH/Y35UCK3VhV+tqORvlNo
	 0Y1LhKdI5gOlw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:17 +0530
Subject: [PATCH v4 3/5] arm64: dts: exynos7870-on7xelte: enable display
 panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=2290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=q0Ub59ZAEdYr+waJdvNVnGcxWOdPZwHebmm7+h4GM0I=;
 b=bFV8U08tpx1eoePV1qg30Le+zARNiee3fgjoNvyl4g0pCeR2pYOHqFNgSECEVCUoBy3XzBd3W
 R+PumpW/U6GCFlizYKagz3SyTr5tnRVu3niPokSwMvNX+pQ7m1RdoX5
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122057_976135_3D7576BF 
X-CRM114-Status: UNSURE (   9.80  )
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
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 ++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 2a3d91d390ec7a6e0c49dde493a99e5b18ea2235..29e124c72e9d25f05705909a981477f46a86efcf 100644
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
@@ -108,8 +95,9 @@ ramoops@46e00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (1080 * 1920 * 4)>;
 			no-map;
 		};
 	};
@@ -122,6 +110,47 @@ vibrator {
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
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
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
2.51.0


