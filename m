Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBCAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4WWCOusd3lGhZVenog2kI2nbfxxLMHPA48uOSRsoeA=; b=o8WY3AxpDOOeyCpA8W1GISOIms
	qYaj2tmobK/d0+UiD1/unPuZvHrvJisFSLc57dGVuEgpTMIH4aWvGIGzyhlemJyWvWFtkTe+/MCTJ
	vAtQRuWrqNzp0HaqfqDkTARVJsV6vPPgsMRotsEdXhNnm6FW4RbARn4LXjlhjGx9gqPuWMuiKE5b4
	BZ6F0B0CE5TdDjuc0IIq8Oy5DRqp55Ay23fPrGoZwReA1bo7z8OLxRglzFxJ1UM5iUWJ9KGhWuI1b
	T4AP/MpkIquIJokPXKTiO5vMr5kg0DYggSoBEsE4HHbBzfMDjPyiZAModpr7v7Y+Kg4BNwbUf8UEU
	0g+iQ79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4sB-00000003QSp-305j;
	Sun, 12 Jan 2025 20:47:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4oT-00000003Pl3-3pBt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 20:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8185F5C4860;
	Sun, 12 Jan 2025 20:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AD70C4AF09;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736714639;
	bh=UXXVGCa+xRNk2SvCaJv+CA8sBSVJyc/q/PCalr6FFr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FcazkaHcSkQwCUEfYt/sytxCPmfi1F6DLoDGXUPcrX2/2JA/p/ivChG53ac/cCIP6
	 yRn7gC7BFA9pVHMjztAEJh3/vknH5tSea3+YiahUsESVjJ9zey+jm5236I+4rG4xVE
	 mFQBXiqX4GP1vYSeqahavKHfQpH0SBFDt/8gIqM+IWd2IXRfY1rhXwsLXoFT0+EKPW
	 5ng6M4mNCNTW6EC3psckLMGm2fxqqEeNgsbL5rCg/RnwyR8I9/QMVropGq/JQ72TmO
	 +UAkfNCr5gus009xywfgVN9DFzRcKDxWmtNlrQmRg3ILmXKhskoS/b9zi2AHKtH5Yp
	 83VeHhrxxqutg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EA8E77188;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 12 Jan 2025 21:43:51 +0100
Subject: [PATCH v3 4/5] arm64: dts: apple: Add touchbar screen nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-adpdrm-v3-4-c674dc19fa7f@gmail.com>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
In-Reply-To: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736714637; l=6646;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=WG7cNcrZYygeOthLbnszjYaIOX1Y805VEv9FfVcvhss=;
 b=ztOGvO4oyWk7vGO+d1mZ3viS7ISkBHkNDags3PxGSDJZmlxsgQz0X3s/zhh1HL0qsStCbDO63
 /nRWkfOHE/wCKdWGT+K6wsfAjPradz5K7qJe3lXZ7r4Nl4MDn69AgPM
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_124402_047385_FD220706 
X-CRM114-Status: GOOD (  10.69  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds device tree entries for the touchbar screen

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 60 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..3af8536da779b56bf856cf40befd74d4737baa8f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -49,3 +49,34 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&display_dfr {
+	status = "okay";
+};
+
+&dfr_mipi_out {
+	dfr_mipi_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&dfr_panel_in>;
+	};
+};
+
+&displaydfr_mipi {
+	status = "okay";
+
+	dfr_panel: panel@0 {
+		compatible = "apple,j293-summit", "apple,summit";
+		reg = <0>;
+		max-brightness = <255>;
+
+		port {
+			dfr_panel_in: endpoint {
+				remote-endpoint = <&dfr_mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&displaydfr_dart {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b088f74e0cb9f42fbc8df822fca6451dcd1b717 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -356,6 +356,66 @@ cpufreq_p: performance-controller@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+			      <0x2 0x28400000 0x0 0x4000>;
+			reg-names = "be", "fe";
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "be", "fe";
+			iommus = <&displaydfr_dart 0>;
+			status = "disabled";
+
+			port {
+				dfr_adp_out_mipi: endpoint {
+					remote-endpoint = <&dfr_mipi_in_adp>;
+				};
+			};
+		};
+
+		displaydfr_dart: iommu@228304000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x28304000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_dispdfr_fe>;
+			status = "disabled";
+		};
+
+		displaydfr_mipi: dsi@228600000 {
+			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+			reg = <0x2 0x28600000 0x0 0x100000>;
+			power-domains = <&ps_mipi_dsi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dfr_mipi_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		sio_dart: iommu@235004000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x2 0x35004000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55406783942735a2e9dad54cda00ec..372fe69a96f6b84f576221101a4127d68bb54691 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -35,6 +35,37 @@ led-0 {
 	};
 };
 
+&display_dfr {
+	status = "okay";
+};
+
+&dfr_mipi_out {
+	dfr_mipi_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&dfr_panel_in>;
+	};
+};
+
+&displaydfr_mipi {
+	status = "okay";
+
+	dfr_panel: panel@0 {
+		compatible = "apple,j493-summit", "apple,summit";
+		reg = <0>;
+		max-brightness = <255>;
+
+		port {
+			dfr_panel_in: endpoint {
+				remote-endpoint = <&dfr_mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&displaydfr_dart {
+	status = "okay";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..1eead9640543632c3ba86c1ff766258e3158c84c 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -379,6 +379,67 @@ cpufreq_p: cpufreq@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+			      <0x2 0x28400000 0x0 0x4000>;
+			reg-names = "be", "fe";
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "be", "fe";
+			iommus = <&displaydfr_dart 0>;
+			status = "disabled";
+
+			port {
+				dfr_adp_out_mipi: endpoint {
+					remote-endpoint = <&dfr_mipi_in_adp>;
+				};
+			};
+		};
+
+		displaydfr_dart: iommu@228304000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x2 0x28304000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_dispdfr_fe>;
+			status = "disabled";
+		};
+
+		displaydfr_mipi: dsi@228600000 {
+			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+			reg = <0x2 0x28600000 0x0 0x100000>;
+			power-domains = <&ps_mipi_dsi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dfr_mipi_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		sio_dart: iommu@235004000 {
 			compatible = "apple,t8110-dart";
 			reg = <0x2 0x35004000 0x0 0x4000>;

-- 
2.48.0



