Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+yuilHW;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=fJ8U0Hu+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9iwvQZgnt7hwuOvmuAPn07z84fgtfJ4EdovCl8V1dk4=; b=D+yuilHWCyijO4Svj6MDw0qIb4
	TUI0NuKd5xqHJkAlbZlqNL0TTJZciehM969x20Ht6eFQvOyGMrzv0Fp2ruZcZ6ldOal7Vbx7QF8tL
	9uM2fF1S/FWUEMdFni0WAExm2CJ1EbcpcUhSFv2uxQF6Vx1xUUA06kWyyMLwmjMp6eTtjo7ATX2Dl
	Jg3VipBGbovuzxtto2rF9LgRZ3OYmkN0C5yS8FXXT0biRIgg30Hl++Y2y2A3amvReidiZSLlgF5fT
	ZxY7byqP3B5Lr21gMVaeipRKh1pZwyyQGAQWCrwxcwPf5ULX1MKP0rKdA3o1ZlvlOZYpxP1WFrzxD
	0awGq2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHoo-00000002Ffo-2GjR;
	Mon, 26 Oct 2026 10:20:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHom-00000002Few-2hih;
	Mon, 26 Oct 2026 10:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=9iwvQZgnt7hwuOvmuAPn07z84fgtfJ4EdovCl8V1dk4=; b=fJ8U0Hu+yjGXC2+RfaOWRxkHXg
	oKrFh6ESQQPqgdz5Ktj5H/j5+5P+eQH7m7mZ388hWU2ya14urCUm2Usm9bS0ubAjV9bPkIq/3Jx1I
	+OB0slH/vTs3W6CaB/r6DMrzHGi6//AXt5m7uy0W5oyk0NZgljrDDfM1sP9FafQSUPrYzrujrDSK1
	K4i4FrCcMvZ6vL+0WCAycRmt56wQWVyn5ciVaUBPg4IKlaDnlDy9zLkVfirlZHxq1KJ2MCYTsxBBr
	1pQUCFdpbAy5aTwsAqKxO8d0KH/u9W7stGFAUMwRG2ip+wN8PtoDmWn3mLLeMQKhPeb/YhNzXdwl2
	oUM+kWZg==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH] arm64: dts: rockchip: enable camera on tiger-haikou video-demo adapter
Date: Mon, 26 Oct 2026 11:20:27 +0100
Message-ID: <20261026102027.2451025-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_032040_946480_C289A643 
X-CRM114-Status: GOOD (  10.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The video-demo adapter also contains a camera, hooked to the CSI input
of the RK3588. Add the necessary infrastructure and devices to enable it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../rk3588-tiger-haikou-video-demo.dtso       | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
index b8636fcb4f39..c403054c3c16 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso
@@ -12,9 +12,11 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 
@@ -25,6 +27,43 @@ backlight: backlight {
 		pwms = <&pwm0 0 25000 0>;
 	};
 
+	cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
+		compatible = "regulator-fixed";
+		gpio = <&pca9670 2 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		regulator-name = "cam-afvdd-2v8";
+		vin-supply = <&vcc2v8_video>;
+	};
+
+	cam_avdd_2v8: regulator-cam-avdd-2v8 {
+		compatible = "regulator-fixed";
+		gpio = <&pca9670 4 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		regulator-name = "cam-avdd-2v8";
+		vin-supply = <&vcc2v8_video>;
+	};
+
+	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
+		compatible = "regulator-fixed";
+		gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "cam-dovdd-1v8";
+		vin-supply = <&vcc1v8_video>;
+	};
+
+	cam_dvdd_1v2: regulator-cam-dvdd-1v2 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pca9670 5 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+		regulator-name = "cam-dvdd-1v2";
+		vin-supply = <&vcc3v3_baseboard>;
+	};
+
 	vcc1v8_video: regulator-vcc1v8-video {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc1v8-video";
@@ -57,6 +96,23 @@ video-adapter-led {
 	};
 };
 
+&csi4 {
+	status = "okay";
+};
+
+&csi4_in {
+	csi4_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <450000000>;
+		remote-endpoint = <&cam_output>;
+	};
+};
+
+&csi_dphy1 {
+	status = "okay";
+};
+
 &dsi0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -96,6 +152,12 @@ &i2c6 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -118,6 +180,31 @@ pca9670: gpio@27 {
 		pinctrl-0 = <&pca9670_resetn>;
 		reset-gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		assigned-clock-rates = <24000000>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mipim1_camera3_clk>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&csi4_input>;
+			};
+		};
+	};
 };
 
 &mipidcphy0 {
@@ -142,6 +229,14 @@ &pwm0 {
 	status = "okay";
 };
 
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};
+
 &vp3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.47.3


