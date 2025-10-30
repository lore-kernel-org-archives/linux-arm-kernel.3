Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85375CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iWUDfIkl81jtcYvJoTmYZumSWpo1jQ0DAgBOlTMVL0=; b=xAczM7bla3lM2jch3mqTM0YxHp
	593BGzxOeO8AtfFfy3ZkCnCjrWEVrDDwjse/8LK0hjFw3kEkXWEVj46xWsFziYCmftYwgdB6ccgT0
	2Nbh0KDfdCFAZcsVS1wSkXZW0PhApVNlUsBhUZfXEQqeh7AdgYAu1rIebmY3ZHILFvmswwJmq0GWh
	NdZ49fuV/rm5huK7hRRPOhpaSwpOMQ8NEVAg2PAfmjeHW9hm0hs5w4k5EfpcdKttRzL9BZpclD2kA
	bjnIfH839kzuyAUzjoxWovqIEHjtuTo7MNowmmiayy1nP53uFh6fP8GUpEP6QkAGvOGUl1G7v7CJd
	b8lY3M7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCe-00000004f5M-1nLP;
	Thu, 30 Oct 2025 19:20:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCY-00000004f2f-2HPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:20:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 356ED25C4A;
	Thu, 30 Oct 2025 20:20:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOxjjuOkuXg1; Thu, 30 Oct 2025 20:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852047; bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U0wBS5AYE2xtI/+slVvTPa7rjnQv1cVzlZdIWt7cSSjrm2UmzQ3ucgAjfDgNFNpDU
	 1YK3WwlkalUfoOhjZGPT6eeol3t936LTC85zsJB1tTVxhXsJ0Iu9YUs8K/7iIKIo+g
	 YW/33oUciM34E1/vMJfik3Yv05KG6+hyxTXwGfzPUibosJqRXXbHyooVEIg97hCj/V
	 E6XG0UAL1spcWPlykzl6H3tkbw/pnaFFvauVOPO4B7qeaGpiSjzWIAh0KZ7p+jl3PD
	 YX1HJZT66wx57Rb/ddLhPz4qSjExDnbC3LeDoKff41DSP2QYk9zyu4k33hq3LD9Zp5
	 j/2CR0ALxnvsg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:16 +0530
Subject: [PATCH v4 2/5] arm64: dts: exynos7870: add DSI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=3704;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
 b=hDqLMiI0s1DaIIRkORJ5vOPp0OsxYNL+59Zn1xSpco2YyrlZ1/KoeZMgg4K/w89oWNLpmPfre
 Aql+70XVxphB2Pof9ASb89YcThlBNBMtzEAvQN2UfHCgzrTxFsNSZh4
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122050_858648_918CF15E 
X-CRM114-Status: UNSURE (   9.34  )
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


