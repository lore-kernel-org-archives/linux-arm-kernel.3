Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F7FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iWUDfIkl81jtcYvJoTmYZumSWpo1jQ0DAgBOlTMVL0=; b=onMIGU/bEPnb6lfulBW2Z36ehF
	sWGis5VNwLakDIt4/AxvUY/Vm4QAxGYswpTl36YYUL6EdW+SWwuJZ+TpGmvWlJaGyebmQsAtlbZOA
	5sH7YmzV2XuKUE/RtsWm7/faMbedPjijUxNrQBmbH4D93OjmdoMfo06dz1bpNArYCrz0uxV6HTCrR
	k9eq2gD+pxvG+5V6sX7GdMyLIT/Rv3ho7EOLAGc8akaU5ai441QSD+f9oP+kEEGwyyBPksp/L1cjm
	6yRNHLH000IyHc6FD3tSjNPVv1nlCRGN7FiiaF6oxczCTt7Zr8sf8aDAlXa0lGVWciR9lvVIQ/sLH
	uU8DfjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veP-0000000GzS9-36IQ;
	Sun, 28 Sep 2025 17:57:33 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2veL-0000000GzNY-0NiE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3B70F25E06;
	Sun, 28 Sep 2025 19:57:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXL8j0hWmIV4; Sun, 28 Sep 2025 19:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082246; bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cFyntp89NxE1QHijjo6B+U2OpDUXG8anZamfT00LO/F9J3fmOQFN5lor93+YNJz2I
	 E++uGal3RXotmWRy78xu77KY4oWZiOgl3/XLicIqJE8zFrLXSINgDV+4O+QRDHp+Vw
	 QuVgKQQd49fXY1TqADJcoS5w3ic/L8HwvBON1Mvg7IIDM9U6IWPm8nyGsgUkkuTuCk
	 AGkHzkjstEVUg3jTPkfMkl2FpYosKN7okHu3+LPFXHFBeyMVhJT7mTpoa/DirijEwW
	 OLiapuf3APkfTkI+g90ozogeiK6bkagvhd+myGz9Z/UijK5HkJLlLp3qf2F2FZ+X42
	 KzCKBikLt45hg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:37 +0530
Subject: [PATCH v3 3/6] arm64: dts: exynos7870: add DSI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-3-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=3704;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
 b=dLXXRWQBXHdLs6xYpMLA5pxtEBJn502oObEr5cmyyPicuWmzlJgGvKqYYqqiIdxmyBGOz4htq
 s0fU57zN/TSBrLNLSbgGWlRArZxlggGf9UTCpPfCxxfAd7gAZkZ4Ms6
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105729_407002_2EF5B234 
X-CRM114-Status: UNSURE (   8.79  )
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

Add devicetree nodes for MIPI PHYs, Samsung's DECON and DSIM blocks, and
DECON IOMMU devicetree nodes. Enables SoC support for hardware to be
able to drive a MIPI DSI display.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870.dtsi | 84 ++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index d5d347623b9038b71da55dccdc9084aeaf71618c..2827e10d69625a22328eb20183dc354c9acbfb8e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -178,6 +178,14 @@ pmu_system_controller: system-controller@10480000 {
 				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10480000 0x10000>;
 
+			mipi_phy: mipi-phy {
+				compatible = "samsung,exynos7870-mipi-video-phy";
+				#phy-cells = <1>;
+
+				samsung,cam0-sysreg = <&syscon_cam0>;
+				samsung,disp-sysreg = <&syscon_disp>;
+			};
+
 			reboot-mode {
 				compatible = "syscon-reboot-mode";
 				offset = <0x080c>;
@@ -675,6 +683,77 @@ cmu_isp: clock-controller@144d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
 		};
 
+		syscon_cam0: system-controller@144f1040 {
+			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
+			reg = <0x144f1040 0x04>;
+		};
+
+		dsi: dsi@14800000 {
+			compatible = "samsung,exynos7870-mipi-dsi";
+			reg = <0x14800000 0x100>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;
+			clock-names = "bus", "pll", "byte", "esc";
+
+			phys = <&mipi_phy 1>;
+			phy-names = "dsim";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_decon: endpoint {
+						remote-endpoint = <&decon_to_dsi>;
+					};
+				};
+			};
+		};
+
+		decon: display-controller@14830000 {
+			compatible = "samsung,exynos7870-decon";
+			reg = <0x14830000 0x8000>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
+			clock-names = "pclk_decon0", "aclk_decon0",
+				      "decon0_eclk", "decon0_vclk";
+
+			iommus = <&sysmmu_decon>;
+
+			status = "disabled";
+
+			port {
+				decon_to_dsi: endpoint {
+					remote-endpoint = <&dsi_to_decon>;
+				};
+			};
+		};
+
+		sysmmu_decon: iommu@14860000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14860000 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
+			clock-names = "sysmmu";
+		};
+
 		pinctrl_dispaud: pinctrl@148c0000 {
 			compatible = "samsung,exynos7870-pinctrl";
 			reg = <0x148c0000 0x1000>;
@@ -692,6 +771,11 @@ cmu_dispaud: clock-controller@148d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
 		};
+
+		syscon_disp: system-controller@148f100c {
+			compatible = "samsung,exynos7870-disp-sysreg", "syscon";
+			reg = <0x148f100c 0x04>;
+		};
 	};
 
 	timer {

-- 
2.51.0


