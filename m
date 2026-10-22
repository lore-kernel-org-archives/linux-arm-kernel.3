Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNJDTj23;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Q+ATZxU2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WK8sNmEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N9HhUqY/IqwGsUGfXiGCOZzfMPR+bvxUCrZyzcSq4QE=; b=UNJDTj235TetjD
	5MiQIgw/kJbBJCooIF2eoPAuz2qGDtwx/Mw8Hw4WHCO4zUYjzp2zPG+l7MqeCrcBFuU239SaqWpxF
	NQ4/e8oAU/RpX+jOrspRelBQ+t/rRQQ5WFUziRM+p/FOMpr4ZyMGpwN67LvQJky+j3cZ1orAi+AaZ
	QOK1P8WW02Jwwh78zKH2SszLuXjnNDqInpMUo71hNHVXiOzHXk/j4ep7rkIyAmyeIFjFa+DhxuoMM
	2hHCxr+TTTOm5s9iQZ9ObjykufyOJ2irlRRApIni+UmFmFi+0Qz8DqfjZSg1zMTAg2PbcoTpLMMxX
	eo8f+JWcn+eElv7TpfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJP-0000000E73Q-2z0H;
	Thu, 22 Oct 2026 12:54:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJO-0000000E72f-3tWd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 12:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N9HhUqY/IqwGsUGfXiGCOZzfMPR+bvxUCrZyzcSq4QE=; b=Q+ATZxU2FN8EsCde1o7dqHJV9H
	oBINguomhhbX2LWtvkFIxhZoDaBLfiwP2IlgU2m8mZXUgNp9gRyb7zltRSdqwG4+yOMFVJ1p5OrhQ
	zb5E2mi1q0TV66u8an922CYn7hNvIB8yOy0BuAq5qjWTNQQiDCPmNpHhNnhDcEqfGyEvx86hRDrlv
	TSjWFp/Mj981LgXDQv2t9NIkMw8QZix1fU2MRMC5BlB9tFyxzCAcz1R/SrgewowByB758Nk+si8Cv
	o7CMX6yVOszJfmshcB30ai5PhB+YtwKaOOobiweRul64bhQOOvc94YWASao6uqHcbM5vjFPWrInEO
	MfmFOWlQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsJC-000000077jH-0tvl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:54:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-87137a8f4a6so230910b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673648; x=1793278448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9HhUqY/IqwGsUGfXiGCOZzfMPR+bvxUCrZyzcSq4QE=;
        b=WK8sNmEd81Qb2HulsuL6aSD8imL8ZxrZ4mRl2cZNWu6ukqcPx3oHgN5dJmKbDZAQ2C
         DQyTG60d+CPKUi0AQ6ZDlyioAfP/lWRkeZLIAfjIRs2AnI9r6IA+Siv8oT64Vc/OU6qw
         IfX+K2YycXbJb+mzehVIeNNs3oQzx33Yk5Tr/FcU0lfItaI/011ZplB+KX2UoPIAJqrW
         IhlOw8J19k8Jnv0Tb7hTe+wxOH28BX1CcCVOeZ424iyAS41/VQcwG1hPyqNSKAA0/oVS
         e6KRPepkWdJtyizOw8ecVwVrE1KPcjzTpPLdfK6ek0BJSW4zBWxVditw2iDMHrJtJP+1
         Q9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673648; x=1793278448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N9HhUqY/IqwGsUGfXiGCOZzfMPR+bvxUCrZyzcSq4QE=;
        b=I6YcvglDEgTi6vWA1xrL5j+ANy5iBlxCd1vVtqoAxHz7R8c4grWPBcgafPsFOAlb5H
         rNvxGT3hUXKCDq22f9P+wjqHsgM29frrHc2ikfWVl6y9GgwuKsat3YpL+GkEOqrgjBO3
         vmAy3M8U37CcY4zcE9pvnRqX9TaQSyCBawWPIGTGBj08tTCOPyNW89xC0ZXgxUeMRCgu
         nGfTh5GoXmCvMUMpdANVmrGOaCSFCBdNiEE1HBgbzN2c9Y2LNq5FtNTGi54cFBVS/IlX
         FLHLEANkVjwuVt3Bp6AmtNTErRCqpHrXM1Ag8G73HylmoWgReKUAblb6uiqV2+PdUi2N
         TteQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3Yp7qgR5/IY94VqaStVLoDvxs1ebEOKRGdLgIZJMdSG8enP402I8a23w9xCDubsta02Ggfp09DxSgJs9BOQW@lists.infradead.org
X-Gm-Message-State: AFq9FYKacCHtkuQ5ouBPKhhSmmynbI46kUpa/G5xs+h6NrN31jHRbsDG
	D0PAlM2hUnoaG6FoKok4Bj7I1EqXscbBSxYYfyvOVlk2jaoNBR3GNfLq
X-Gm-Gg: AYBFou2/GAnBwlv8fPmQFuwJlwWpXoQrJp1HlV8EX+qYuF5zIYXmme6zkL1LnpriIrZ
	XC/2BCi57xbw5lvT8mdJNVlbuv/JFZKMgkzHmyMv5GE1C05jk9eBRbcPmbG7N0j3tTLk33u6wS2
	x+F3KaoBJnWbfhDgjlOthqCySozHxN5cGDIot7+H2927UfXuqpUqJikCi698LFb7hijLKlOQvRC
	6QzLKxHj0ECKil77ZCpbc5GOXWdZdZYAMNJh/GZ+2S93qUCRFRcUWVqOEbxZ2+a0gPXsxMxwg99
	YgjznfbyUnlsySggHhI+7+P7aV17KsxHQo8wsdo2Jdk4v9vVisOcKpU41ASV1fS/AYVHvjBgiDU
	g4Jwoyhp6D6vc+xhafcpxNiw4bVUFw4ROxVm06YnBW5Vg5a31YPBxDWz7bBGhZEuYgW5f57/h/2
	Q0ak5F5Gj7RB6koXqEnuAsHKYtM94l968G/m939AqgtVXfOH7VyC15ua243rCKkexNluuxRMzGs
	dQNSIe74SjySsFIAR3CGlF9VPFGj6aso0BQALu8dJ81cTt7iO9HT0lkVbEPIWoqHhLPGH5qIdgp
	oF6V
X-Received: by 2002:a17:903:3b83:b0:2e2:c797:d87f with SMTP id d9443c01a7336-2ea4391fa23mr73846635ad.1.1792673648119;
        Thu, 22 Oct 2026 05:54:08 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:07 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: rockchip: Extract common CoolPi 4B board description
Date: Thu, 22 Oct 2026 20:52:53 +0800
Message-ID: <20261022125339.82746-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135417_595111_6572674F 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the CoolPi 4B hardware description into a shared dtsi so that
the ArmSoM Sige7s can reuse it. Keep the board model and compatible
in the CoolPi 4B DTS.

The generated CoolPi 4B DTB remains unchanged.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 936 +----------------
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dtsi  | 941 ++++++++++++++++++
 2 files changed, 942 insertions(+), 935 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index c162abe2dd6bb..cd1f201adefb9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -1,944 +1,10 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
- *
- * https://cool-pi.com/topic/130/coolpi-4b-product-spec-introduction
- *
- */
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/pinctrl/rockchip.h>
-#include <dt-bindings/soc/rockchip,vop2.h>
-#include "rk3588s.dtsi"
+#include "rk3588s-coolpi-4b.dtsi"
 
 / {
 	model = "RK3588S CoolPi 4 Model B";
 	compatible = "coolpi,pi-4b", "rockchip,rk3588s";
-
-	aliases {
-		mmc0 = &sdhci;
-		mmc1 = &sdmmc;
-		mmc2 = &sdio;
-	};
-
-	analog-sound {
-		compatible = "audio-graph-card";
-		dais = <&i2s0_8ch_p0>;
-		label = "rk3588-es8316";
-		routing = "MIC2", "Mic Jack",
-			  "Headphones", "HPOL",
-			  "Headphones", "HPOR";
-		widgets = "Microphone", "Mic Jack",
-			  "Headphone", "Headphones";
-	};
-
-	chosen {
-		stdout-path = "serial2:1500000n8";
-	};
-
-	dp-con {
-		compatible = "dp-connector";
-		label = "DP OUT";
-		type = "mini";
-
-		port {
-			dp_con_in: endpoint {
-				remote-endpoint = <&dp0_out_con>;
-			};
-		};
-	};
-
-	hdmi-con {
-		compatible = "hdmi-connector";
-		type = "d";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&hdmi0_out_con>;
-			};
-		};
-	};
-
-	leds: leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&gpio_leds>;
-
-		led0: led-green {
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_STATUS;
-			gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-		};
-
-		led1: led-red {
-			color = <LED_COLOR_ID_RED>;
-			default-state = "off";
-			function = LED_FUNCTION_WLAN;
-			gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "phy0tx";
-		};
-	};
-
-	sdio_pwrseq: sdio-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		clocks = <&hym8563>;
-		clock-names = "ext_clock";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wifi_enable_h>;
-		/*
-		 * On the module itself this is one of these (depending
-		 * on the actual card populated):
-		 * - SDIO_RESET_L_WL_REG_ON
-		 * - PDN (power down when low)
-		 */
-		post-power-on-delay-ms = <200>;
-		reset-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_LOW>;
-	};
-
-	vcc12v_dcin: regulator-vcc12v-dcin {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc12v_dcin";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
-	vcc5v0_sys: regulator-vcc5v0-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_sys";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc12v_dcin>;
-	};
-
-	vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_usbdcin";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc12v_dcin>;
-	};
-
-	vcc5v0_usb: regulator-vcc5v0-usb {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_usb";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_usbdcin>;
-	};
-
-	avdd0v85_pcie20: regulator-avdd0v85-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "avdd0v85_pcie20";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <850000>;
-		regulator-max-microvolt = <850000>;
-		vin-supply = <&vdd_0v85_s0>;
-	};
-
-	avdd1v8_pcie20: regulator-avdd1v8-pcie20 {
-		compatible = "regulator-fixed";
-		regulator-name = "avdd1v8_pcie20";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&avcc_1v8_s0>;
-	};
-
-	vcc3v3_mipi: regulator-vcc3v3-mipi {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
-		regulator-name = "vcc3v3_mipi";
-		regulator-boot-on;
-		regulator-always-on;
-		vin-supply = <&vcc_3v3_s3>;
-	};
-
-	vcc5v0_host: regulator-vcc5v0-host {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host_en>;
-		regulator-name = "vcc5v0_host";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
-	vcc5v0_otg: regulator-vcc5v0-otg {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio3 RK_PC1 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_u3host_en>;
-		regulator-name = "vcc5v0_otg";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
-	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_1v1_nldo_s3";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-};
-
-&combphy0_ps {
-	status = "okay";
-};
-
-&combphy2_psu {
-	status = "okay";
-};
-
-&cpu_l0 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
-};
-
-&cpu_b0 {
-	cpu-supply = <&vdd_cpu_big0_s0>;
-};
-
-&cpu_b2 {
-	cpu-supply = <&vdd_cpu_big1_s0>;
-};
-
-&dp0 {
-	pinctrl-0 = <&dp0m0_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&dp0_in {
-	dp0_in_vp2: endpoint {
-		remote-endpoint = <&vp2_out_dp0>;
-	};
-};
-
-&dp0_out {
-	dp0_out_con: endpoint {
-		remote-endpoint = <&dp_con_in>;
-	};
-};
-
-&gpu {
-	mali-supply = <&vdd_gpu_s0>;
-	status = "okay";
-};
-
-&hdmi0 {
-	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
-	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
-		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&hdmi0_in {
-	hdmi0_in_vp0: endpoint {
-		remote-endpoint = <&vp0_out_hdmi0>;
-	};
-};
-
-&hdmi0_out {
-	hdmi0_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
-	};
-};
-
-&hdptxphy0 {
-	status = "okay";
-};
-
-&i2c0 {
-	pinctrl-0 = <&i2c0m2_xfer>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	vdd_cpu_big0_s0: regulator@42 {
-		compatible = "rockchip,rk8602";
-		reg = <0x42>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-name = "vdd_cpu_big0_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <550000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-
-	vdd_cpu_big1_s0: regulator@43 {
-		compatible = "rockchip,rk8603", "rockchip,rk8602";
-		reg = <0x43>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-name = "vdd_cpu_big1_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <550000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-};
-
-&i2c2 {
-	status = "okay";
-
-	vdd_npu_s0: regulator@42 {
-		compatible = "rockchip,rk8602";
-		reg = <0x42>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <550000>;
-		regulator-max-microvolt = <950000>;
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-};
-
-&i2c6 {
-	pinctrl-0 = <&i2c6m3_xfer>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	hym8563: rtc@51 {
-		compatible = "haoyu,hym8563";
-		reg = <0x51>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
-		#clock-cells = <0>;
-		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
-	};
-};
-
-&i2c7 {
-	pinctrl-0 = <&i2c7m0_xfer>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	es8316: audio-codec@10 {
-		compatible = "everest,es8316";
-		reg = <0x10>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-		clocks = <&cru I2S0_8CH_MCLKOUT>;
-		clock-names = "mclk";
-		#sound-dai-cells = <0>;
-
-		port {
-			es8316_p0_0: endpoint {
-				remote-endpoint = <&i2s0_8ch_p0_0>;
-			};
-		};
-	};
-};
-
-&i2s0_8ch {
-	pinctrl-0 = <&i2s0_lrck
-		     &i2s0_mclk
-		     &i2s0_sclk
-		     &i2s0_sdi0
-		     &i2s0_sdo0>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	i2s0_8ch_p0: port {
-		i2s0_8ch_p0_0: endpoint {
-			dai-format = "i2s";
-			mclk-fs = <256>;
-			remote-endpoint = <&es8316_p0_0>;
-		};
-	};
-};
-
-&pcie2x1l2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&rtl8111_isolate>;
-	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
-	status = "okay";
-};
-
-&pd_gpu {
-	domain-supply = <&vdd_gpu_s0>;
-};
-
-&pinctrl {
-	hdmi {
-		hdmi0_tx_on_h: hdmi0-tx-on-h {
-			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	led {
-		gpio_leds: gpio-leds {
-			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>,
-					<0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_down>;
-		};
-	};
-
-	rtl8111 {
-		rtl8111_isolate: rtl8111-isolate {
-			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	sdio-pwrseq {
-		wifi_enable_h: wifi-enable-h {
-			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	usb {
-		vcc5v0_host_en: vcc5v0-host-en {
-			rockchip,pins = <3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>,
-					<4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-
-		vcc5v0_u3host_en: vcc5v0-u3host-en {
-			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
-	wireless-bluetooth {
-		bt_reset_gpio: bt-reset-pin {
-			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		bt_wake_gpio: bt-wake-pin {
-			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		bt_wake_host_irq: bt-wake-host-irq {
-			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
-		};
-	};
-
-	wireless-wlan {
-		wifi_host_wake_irq: wifi-host-wake-irq {
-			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
-		};
-
-		wifi_poweren_pin: wifi-poweren-pin {
-			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-};
-
-&pwm2 {
-	pinctrl-0 = <&pwm2m1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&pwm13 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pwm13m2_pins>;
-	status = "okay";
-};
-
-&saradc {
-	vref-supply = <&vcc_1v8_s0>;
-	status = "okay";
-};
-
-&sdhci {
-	bus-width = <8>;
-	max-frequency = <200000000>;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	no-sdio;
-	no-sd;
-	non-removable;
-	status = "okay";
-};
-
-&sdio {
-	bus-width = <4>;
-	cap-sd-highspeed;
-	cap-sdio-irq;
-	disable-wp;
-	keep-power-in-suspend;
-	max-frequency = <150000000>;
-	mmc-pwrseq = <&sdio_pwrseq>;
-	no-sd;
-	no-mmc;
-	non-removable;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sdiom1_pins>,<&wifi_poweren_pin>;
-	status = "okay";
-};
-
-&sdmmc {
-	bus-width = <4>;
-	cap-sd-highspeed;
-	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
-	disable-wp;
-	max-frequency = <150000000>;
-	no-sdio;
-	no-mmc;
-	sd-uhs-sdr104;
-	vmmc-supply = <&vcc_3v3_s3>;
-	vqmmc-supply = <&vccio_sd_s0>;
-	status = "okay";
-};
-
-&spi2 {
-	assigned-clocks = <&cru CLK_SPI2>;
-	assigned-clock-rates = <200000000>;
-	num-cs = <1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
-	status = "okay";
-
-	pmic@0 {
-		compatible = "rockchip,rk806";
-		reg = <0x0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
-			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
-		spi-max-frequency = <1000000>;
-		vcc1-supply = <&vcc5v0_sys>;
-		vcc2-supply = <&vcc5v0_sys>;
-		vcc3-supply = <&vcc5v0_sys>;
-		vcc4-supply = <&vcc5v0_sys>;
-		vcc5-supply = <&vcc5v0_sys>;
-		vcc6-supply = <&vcc5v0_sys>;
-		vcc7-supply = <&vcc5v0_sys>;
-		vcc8-supply = <&vcc5v0_sys>;
-		vcc9-supply = <&vcc5v0_sys>;
-		vcc10-supply = <&vcc5v0_sys>;
-		vcc11-supply = <&vcc_2v0_pldo_s3>;
-		vcc12-supply = <&vcc5v0_sys>;
-		vcc13-supply = <&vcc_1v1_nldo_s3>;
-		vcc14-supply = <&vcc_1v1_nldo_s3>;
-		vcca-supply = <&vcc5v0_sys>;
-
-		rk806_dvs1_null: dvs1-null-pins {
-			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
-		};
-
-		rk806_dvs2_null: dvs2-null-pins {
-			pins = "gpio_pwrctrl2";
-			function = "pin_fun0";
-		};
-
-		rk806_dvs3_null: dvs3-null-pins {
-			pins = "gpio_pwrctrl3";
-			function = "pin_fun0";
-		};
-
-		regulators {
-			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
-				regulator-name = "vdd_gpu_s0";
-				regulator-boot-on;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <950000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <400>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
-				regulator-name = "vdd_cpu_lit_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <950000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_log_s0: dcdc-reg3 {
-				regulator-name = "vdd_log_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <675000>;
-				regulator-max-microvolt = <750000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <750000>;
-				};
-			};
-
-			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
-				regulator-name = "vdd_vdenc_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <950000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_ddr_s0: dcdc-reg5 {
-				regulator-name = "vdd_ddr_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <675000>;
-				regulator-max-microvolt = <900000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <850000>;
-				};
-			};
-
-			vdd2_ddr_s3: dcdc-reg6 {
-				regulator-name = "vdd2_ddr_s3";
-				regulator-always-on;
-				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-				};
-			};
-
-			vcc_2v0_pldo_s3: dcdc-reg7 {
-				regulator-name = "vdd_2v0_pldo_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <2000000>;
-				regulator-max-microvolt = <2000000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <2000000>;
-				};
-			};
-
-			vcc_3v3_s3: dcdc-reg8 {
-				regulator-name = "vcc_3v3_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <3300000>;
-				};
-			};
-
-			vddq_ddr_s0: dcdc-reg9 {
-				regulator-name = "vddq_ddr_s0";
-				regulator-always-on;
-				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcc_1v8_s3: dcdc-reg10 {
-				regulator-name = "vcc_1v8_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vccio_sd_s0: pldo-reg5 {
-				regulator-name = "vccio_sd_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			pldo6_s3: pldo-reg6 {
-				regulator-name = "pldo6_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			vdd_0v75_s3: nldo-reg1 {
-				regulator-name = "vdd_0v75_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <750000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <750000>;
-				};
-			};
-
-			vdd_ddr_pll_s0: nldo-reg2 {
-				regulator-name = "vdd_ddr_pll_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt = <850000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <850000>;
-				};
-			};
-
-			avdd_0v75_s0: nldo-reg3 {
-				regulator-name = "avdd_0v75_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <750000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_0v85_s0: nldo-reg4 {
-				regulator-name = "vdd_0v85_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt = <850000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_0v75_s0: nldo-reg5 {
-				regulator-name = "vdd_0v75_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <750000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-		};
-	};
-};
-
-&tsadc {
-	status = "okay";
-};
-
-&u2phy0 {
-	status = "okay";
-};
-
-&u2phy0_otg {
-	status = "okay";
-};
-
-&u2phy2 {
-	status = "okay";
-};
-
-&u2phy3 {
-	status = "okay";
-};
-
-&u2phy2_host {
-	phy-supply = <&vcc5v0_host>;
-	status = "okay";
-};
-
-&u2phy3_host {
-	status = "okay";
-};
-
-&uart2 {
-	pinctrl-0 = <&uart2m0_xfer>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-/* bt */
-&uart9 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn>;
-};
-
-&usbdp_phy0 {
-	/*
-	 * USBDP PHY0 is wired to a USB3 Type-A OTG connector. Additionally
-	 * the differential pairs 0+1 and the aux channel are wired to a
-	 * mini DP connector.
-	 */
-	rockchip,dp-lane-mux = <0 1>;
-	status = "okay";
-};
-
-&usb_host0_ehci {
-	status = "okay";
-};
-
-&usb_host0_ohci {
-	status = "okay";
-};
-
-&usb_host0_xhci {
-	extcon = <&u2phy0>;
-	status = "okay";
-};
-
-&usb_host1_ehci {
-	status = "okay";
-};
-
-&usb_host1_ohci {
-	status = "okay";
-};
-
-&vop {
-	status = "okay";
-};
-
-&vop_mmu {
-	status = "okay";
-};
-
-&vp0 {
-	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
-		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
-		remote-endpoint = <&hdmi0_in_vp0>;
-	};
-};
-
-&vp2 {
-	vp2_out_dp0: endpoint@a {
-		reg = <ROCKCHIP_VOP2_EP_DP0>;
-		remote-endpoint = <&dp0_in_vp2>;
-	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi
new file mode 100644
index 0000000000000..59234c19bbeae
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi
@@ -0,0 +1,941 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
+ *
+ * https://cool-pi.com/topic/130/coolpi-4b-product-spec-introduction
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588s.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		dais = <&i2s0_8ch_p0>;
+		label = "rk3588-es8316";
+		routing = "MIC2", "Mic Jack",
+			  "Headphones", "HPOL",
+			  "Headphones", "HPOR";
+		widgets = "Microphone", "Mic Jack",
+			  "Headphone", "Headphones";
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	dp-con {
+		compatible = "dp-connector";
+		label = "DP OUT";
+		type = "mini";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_leds>;
+
+		led0: led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led1: led-red {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_WLAN;
+			gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+		/*
+		 * On the module itself this is one of these (depending
+		 * on the actual card populated):
+		 * - SDIO_RESET_L_WL_REG_ON
+		 * - PDN (power down when low)
+		 */
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usbdcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usbdcin>;
+	};
+
+	avdd0v85_pcie20: regulator-avdd0v85-pcie20 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd0v85_pcie20";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <850000>;
+		vin-supply = <&vdd_0v85_s0>;
+	};
+
+	avdd1v8_pcie20: regulator-avdd1v8-pcie20 {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd1v8_pcie20";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&avcc_1v8_s0>;
+	};
+
+	vcc3v3_mipi: regulator-vcc3v3-mipi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc3v3_mipi";
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc5v0_host: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_host_en>;
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_otg: regulator-vcc5v0-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PC1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_u3host_en>;
+		regulator-name = "vcc5v0_otg";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&dp0 {
+	pinctrl-0 = <&dp0m0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		reg = <0x43>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6m3_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+	};
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7m0_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	es8316: audio-codec@10 {
+		compatible = "everest,es8316";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+
+		port {
+			es8316_p0_0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8316_p0_0>;
+		};
+	};
+};
+
+&pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtl8111_isolate>;
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&pd_gpu {
+	domain-supply = <&vdd_gpu_s0>;
+};
+
+&pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	led {
+		gpio_leds: gpio-leds {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>,
+					<0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	rtl8111 {
+		rtl8111_isolate: rtl8111-isolate {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>,
+					<4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc5v0_u3host_en: vcc5v0-u3host-en {
+			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wireless-bluetooth {
+		bt_reset_gpio: bt-reset-pin {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_gpio: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	wireless-wlan {
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_poweren_pin: wifi-poweren-pin {
+			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&pwm2 {
+	pinctrl-0 = <&pwm2m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm13 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm13m2_pins>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8_s0>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdiom1_pins>,<&wifi_poweren_pin>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <150000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&spi2 {
+	assigned-clocks = <&cru CLK_SPI2>;
+	assigned-clock-rates = <200000000>;
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		spi-max-frequency = <1000000>;
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
+				regulator-name = "vdd_gpu_s0";
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-name = "vdd_log_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <750000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
+				regulator-name = "vdd_vdenc_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-name = "vdd_ddr_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-name = "vdd2_ddr_s3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-name = "vdd_2v0_pldo_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-name = "vcc_3v3_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-name = "vddq_ddr_s0";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-name = "vcc_1v8_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avcc_1v8_s0: pldo-reg1 {
+				regulator-name = "avcc_1v8_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-name = "vcc_1v8_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avdd_1v2_s0: pldo-reg3 {
+				regulator-name = "avdd_1v2_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3_s0: pldo-reg4 {
+				regulator-name = "vcc_3v3_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-name = "vccio_sd_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			pldo6_s3: pldo-reg6 {
+				regulator-name = "pldo6_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-name = "vdd_0v75_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_ddr_pll_s0: nldo-reg2 {
+				regulator-name = "vdd_ddr_pll_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-name = "avdd_0v75_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v85_s0: nldo-reg4 {
+				regulator-name = "vdd_0v85_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-name = "vdd_0v75_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&u2phy3_host {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* bt */
+&uart9 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn>;
+};
+
+&usbdp_phy0 {
+	/*
+	 * USBDP PHY0 is wired to a USB3 Type-A OTG connector. Additionally
+	 * the differential pairs 0+1 and the aux channel are wired to a
+	 * mini DP connector.
+	 */
+	rockchip,dp-lane-mux = <0 1>;
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	extcon = <&u2phy0>;
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
+
+&vp2 {
+	vp2_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp2>;
+	};
+};
-- 
2.47.3


