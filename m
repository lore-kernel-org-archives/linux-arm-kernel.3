Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE29C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAJi2SDXf7/eYOdmLRt4vSdBn2RFyfkaPxm3J+K4blY=; b=b1Agski5RRcgENTSZcwar7shr6
	QYL0x8neNJ1x/xi5LSU8YVyFtPFpQY4Ua9CazX6/gPzeuqmnQlA9rDb1m9YaaCAVvxGpou0WnzMxg
	ps92+px4g5xXS11hkoC5U1xCL4OTNM7Doh9l01A361gNSeqXVwasotuwLzedUHTL2wix6b37Vvzqd
	Z6lIb9vptq1EH14rex79DSeyOKKYQbPloC/dHF3NsEwQR4HbwzRAkpk4+suRhQoktAzgpGOVcSbCM
	UN/J9UrwP/lKliJNL32NrAZrsy8Di3VhvnLcQfLKP8rIY1Gw+CC7fr1Hq8H0R2wpcv7qthPxceqvV
	TSKGUyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzgM-00000004Nc6-3pRS;
	Mon, 17 Feb 2025 11:53:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzTQ-00000004L1w-2wCE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93F745C5586;
	Mon, 17 Feb 2025 11:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B5C0C4CEF1;
	Mon, 17 Feb 2025 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792377;
	bh=WVZdtyxWLeL3DEMJOOB1Qk8Vaskup1SXbw8mU/RD8l4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PhQ9KhhjT204WMeDlikmoFE4nl3+UDw8yqWHwNG+hhkoT1TBjGKEaxt5VeDOQ7MeA
	 BdNgdeEyohPmYxp1mSiAL7KSh/uYgEVsSHbkXb4bSD2rk2T4G0Oc1zfYbOSomx3e+2
	 GQ5sU6ihAttPUZebGacrBmAByZKfFb5/OvzmJOqsQiMn8PjsK/LIu4kHt8wdOnoz67
	 j0tg0UUzbtpf/51IHKBRADQDcczNGV8mdAVi3M2boMO0yJWy3Iman+Sp05ZG7RL1Hh
	 GVzRVKpdYBecZKf7nIm15eTNZ4DgDf40dZXjUl0U8ZYrmmLpBEil3MAROON5LcNkQO
	 VV0mBuh7qI8Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B40C021AA;
	Mon, 17 Feb 2025 11:39:37 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 12:39:34 +0100
Subject: [PATCH v7 4/5] arm64: dts: apple: Add touchbar screen nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-adpdrm-v7-4-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792375; l=6740;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=JSOTLIy3u+RzLhI+u2VEe5lXWSThmRYNZ8+S2CXn/fo=;
 b=Jq/vFTX3mflq+xjUX3elq1UVaJlxXnnnaE8fnjYx82MPlrkT/LjnhUkKZnV3V0sxf6EsY2oVr
 rOaYz2AapRDDcFB8TBc0pbrm3JQhMRzQ8POgWkZn3lxwduRpWdITfi4
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_033940_927534_08377E77 
X-CRM114-Status: UNSURE (   9.89  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds device tree entries for the touchbar screen

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 61 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
 4 files changed, 184 insertions(+)

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
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..b08176c139ceef913683e41cc7d8a755e6d3216b 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -356,6 +356,67 @@ cpufreq_p: performance-controller@211e20000 {
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
2.48.1



