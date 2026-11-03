Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC0606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NASVT9FE;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=DsXd0tFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MOf4jGoNjklui20b3tjGfAb5reyk40611yCdNTmL8YM=; b=NASVT9FE5riHtRfCwWeur9TyL8
	qtaXm2DE4E9Ss4/VypPUSR/EBfwyvFYVD23xhlBWIlnjSoD0HHlb/XDifA4B53VVqcNS0bIQQre3t
	AfLnLX8HYOzbexBDVvCAGGOQMpG1vX9/iCN1dTVoTHy3SYkeSfhcJnh+mNTzd/ZyRd/NrDjtGNOMV
	+PCW7c0Q1FcDKV0WwaHbMsrFVjue+f/5fmLzvDlqfWEtynfYqBEw4qgLTnxz5C4u0+iUVlYBRmCoz
	1Zy7IEZW4utzGp4kVl/Ger5bgQ2U4uanQeK3nuK+K7qNzW110qnHGOEL4pzeDFZ2yiO+Xhl4gU6HZ
	lky8fhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ6G-00000003Omx-0Wbf;
	Tue, 03 Nov 2026 18:19:12 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([2001:1600:19:5550::42ac])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ6D-00000003OlH-2noj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:19:11 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJxff6CMBz2nD;
	Tue,  3 Nov 2026 19:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793729946;
	bh=MOf4jGoNjklui20b3tjGfAb5reyk40611yCdNTmL8YM=;
	h=From:Date:Subject:To:Cc:From;
	b=DsXd0tFDLTDRXX3RSqyLlcB1kW3IhvNccFTPnIAI9MNsLSqO9qNP0Vs4mUtBu/E5x
	 fv/PF2FeyeNnamovPYIvlSII91vhuXpDLPSw8/XrlQ0MyTUd6pDcAFcX47FpKUX3p7
	 fr+Sl/a5D+vQXNBQxC3OXLqKsvTWXcvNdKP9kpIbTA2IFW/3zPR7CFtZHUy+miu04S
	 HPayaCPNIuz2g8Puj9gFKsi9Fu4qncciMG79Fuf7XCBpUgBsXP0Q/6XS98XwD49Wku
	 /cyKq7brUT4mXjalsDI+jCHPRvXgq+XwEx9nAdpjxQuP8CCE0+1BOAT2M9PzG5Nhie
	 0a6/TJtBedWQw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJxfd4ttrzfD0;
	Tue,  3 Nov 2026 19:19:05 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 03 Nov 2026 19:18:58 +0100
Subject: [PATCH] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on RK3399 Puma
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBG4as0s3aSUhIiXsW4oPBrx4bSgDQmT
 e8u6vLbvLdTQRYUunQ7ZWxSJC0N6tSRn9zyAEtopqEfjFK95jxrbS2vNTqenMyp8iYBiQNiYu8
 ih7MZYbR1VoFaZ824y/v3uN7+LnV8wr++YTqOD1jo+mCFAAAA
X-Change-ID: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_101909_864753_2CA84769 
X-CRM114-Status: GOOD (  13.88  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on RK3399 Puma module fitted on
a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Camera only works once the ov5675 driver is adapted[1] to work with
24MHz MCLK. With the similar work done for RK3588 Tiger[2], we now have
all our modules supporting the same set of features when used in
conjunction with Haikou Video Demo.

Same request as made in [2], please only merge this once the OV5675
series[1] is merged.

[1] https://lore.kernel.org/linux-media/20261026101646.2450051-1-heiko@sntech.de/
[2] https://lore.kernel.org/linux-rockchip/20261026102027.2451025-1-heiko@sntech.de/
---
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 141a921a06e47..6c28e7e60ef28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -100,6 +101,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -122,6 +129,50 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clock-rates = <24000000>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkouta>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&cam_output>;
+			};
+		};
+	};
+};
+
+&isp1_mmu {
+	status = "okay";
 };
 
 &mipi_dsi {
@@ -145,6 +196,10 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_dsi1 {
+	status = "okay";
+};
+
 &mipi_out {
 	mipi_out_panel: endpoint {
 		remote-endpoint = <&mipi_in_panel>;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


