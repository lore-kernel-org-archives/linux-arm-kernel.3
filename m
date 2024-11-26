Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A44CD65521
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtfXj6f94jfKDhcjRYiwvTmOtzBjLccGGr990w/xJjg=; b=404ejpre9doHBImmG2dRuu+ZvZ
	18e7yIqanZkqgK6JytIRONAkmh/bAm9H8dq1LTALzN4AelAIq7WD2CdoIbh9xXFvTCubH2z84K/KD
	WFMPsaVgjKaQpxzboY0MEn6N42P7VBYdYQ+gFBq6/u5LpJEOzSV8z2o7MdrTiyHy9QmI8QjLmv8SI
	QJkWad5H6EDBFzJUmgEWiTTfG0cJnlanID5fFC7BFRv6686tXmkRslZJM6GiuqGNTUZTZ+Ec6cEXF
	v0bGxCkPq8Bk7a33UxmSuo8VsmKZNzTiqnUn3AtMPAOhfGG1PXL2D8AxAAapOjC7cHQOxolkZ8oOO
	nQsiOgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFycj-0000000BCE3-10Xt;
	Tue, 26 Nov 2024 16:41:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyWC-0000000BAlg-1NDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 16:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43AC95C5C03;
	Tue, 26 Nov 2024 16:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D8C4C4AF0E;
	Tue, 26 Nov 2024 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732638866;
	bh=aLADfVdJwu7pVH4jyO4JLYrYN2QXLRTdfULyaE/hhro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iIJ0o9grhzf3ogqzw3x/kMs2kKQMu/cLVamRsp+423CuIKVEJiSseroysPhapkDuz
	 nHXnmDX6jsjWOrNm5JIwvT2t0Vq9HxKNM57gtaGKuFftXYv2YCC0h+C45thH5wWGtB
	 dfkwpKDGqYkCpdQreNZtZryccfgfRoXczYYs87iegFKzJhKOtmF/IhBUZLomqbZ0cs
	 B+eYaAIx0iXA67UuwCkB82gbx6Lx2VftDSmaKsfnRpsjU+bfMkiLuCGC2x6CfMen8J
	 QsIuD4LAUsbtC43WW3syG/dksCkIaGE7UccJ43oWDX6YoYuhsCcH2SA9XyMB1jJ+15
	 4rXhMmappzHBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3D2E6ADF9;
	Tue, 26 Nov 2024 16:34:25 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 17:34:23 +0100
Subject: [PATCH v2 4/5] arm64: dts: apple: Add touchbar screen nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-adpdrm-v2-4-c90485336c09@gmail.com>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
In-Reply-To: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
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
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732638864; l=6676;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=n9b2YUQwSr1QuOHNKxm3h8or5r6XP2GVaG7Of22NML0=;
 b=fArXHUTD+PqmEhJHsjSmWR1xxq1aKs06gQ7d1kDvK7olUQl1Rr7+Dw1LMQRpCzfoYeoxkesbM
 DTOlbEMtHZBAlmHo0JnDPBRW71XDDnfxwTKNdeFX2EhYk4yFHPF0BX3
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_083428_485941_40236A63 
X-CRM114-Status: GOOD (  11.00  )
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
 arch/arm64/boot/dts/apple/t8103.dtsi     | 61 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 62 ++++++++++++++++++++++++++++++++
 4 files changed, 185 insertions(+)

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
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9c27911b3867d1279c133c936b7413c9eafcad8a 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -356,6 +356,67 @@ cpufreq_p: performance-controller@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
+			reg-names = "be", "fe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+				<0x2 0x28400000 0x0 0x4000>;
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
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
+			reg-names = "mipi";
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
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
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..b8d2d22ab81adfb7642ea362c6a6af4c04a9bf9d 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -379,6 +379,68 @@ cpufreq_p: cpufreq@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
+			reg-names = "be", "fe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+				<0x2 0x28400000 0x0 0x4000>;
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
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
+			reg-names = "mipi";
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
 		sio_dart: iommu@235004000 {
 			compatible = "apple,t8110-dart";
 			reg = <0x2 0x35004000 0x0 0x4000>;

-- 
2.47.1



