Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyEbgL/DE3XaQNmV45jqJ+6PRNx/4WLm+5/Q7HMMYbM=; b=w/TNwHO8MuolRoVqCG94sfXVnP
	c4ptjS7L3WhMtNGVlAbqPAusk8+VHbZr19eq7bFaemvyKRxeX3VgozDp0XAK4RIizKTfihHTL3iEq
	eGYPGlzCgejQa+6CGKvJFIFYj98fRSty3oXNT8XuKwKRD9GXQ3zwf2yCvhTyuarlpIXRkSngwdAgO
	qZxpjKd4aMSBUYOn6AgbtmnH6hPa5Wy/F0GRTa34sGe60rDrBtM47fBTpgFtO7ixmsrYGZKp6Ldj3
	xKDHjsXbOMzNtenJ41MJdjkY8yfcIT+I4L1v3cL3NugLEFJImPowTHJtuI8nsKfsOq6/K8I7X8hww
	Ft1183iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffB8-00000003Lj8-0J8q;
	Wed, 05 Feb 2025 13:10:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetd-00000003HxF-0S07;
	Wed, 05 Feb 2025 12:52:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so13147714a12.2;
        Wed, 05 Feb 2025 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759968; x=1739364768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyEbgL/DE3XaQNmV45jqJ+6PRNx/4WLm+5/Q7HMMYbM=;
        b=gXMIcYqmz5QqLUiq3Ky1Czrye2a1bdZmcxf13S1I2i1dHPFHBhLRr2//wMrcsxH5xW
         /CrFQVM7/DahEsPCuky7Y8EbXTuK8HVG40Qz0SYHYrqtNuO12lROWVB2130m8XpIpw4G
         abxuRLkWc0+07J/rXi5ddQhLotAulJ/lNbmlERvlRYR5nIKigNsNrsUdVbtL5bTlz6vm
         B/iNmwzxSV/nCzutQ1YPrg4t5QycXPnk5mls4deBbGvizrAYrXygoq4S3lx0JNGXX3SC
         yjW5jxhRzs4OO6RdGyuQWNDstA91QNJTmnxNr6xqrOAZk9QWzCSoWX1UZGtonCAAtWl3
         q70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759968; x=1739364768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyEbgL/DE3XaQNmV45jqJ+6PRNx/4WLm+5/Q7HMMYbM=;
        b=kVVjbkW6XkF3xE/jWbRq6fZRmBha8+eW4aZ7UaCBj4wI/M7GcgDvtKippF3oqSVSlC
         xeJy4t022Xs1TZactmhiy0ERJEFkvYNepqki3hwkL85IT4HdhjRoHmA+kkKO68oxOYCN
         MW52EGY71AEllQ54MMcJM+C4lVHBHn7YGuDCgoKigce5kWCFMADloW3OZ0jr9HZay57o
         j66HBxky1No5s2lJBPQKFrG5KOY6unI39aEINQq9009myYj1Q3J+L5CxusEVZdhdFPwl
         uc9ukKgJO9B6UWUffMlfaVl4Xtsl6CreCXM2QFnNuQTYDG9Hu0AyQEEhAMkPdk/+4R/3
         U/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV5sQV2N70BYpOwfsN29jXa5LsgR5QDLOi/s19B4P999Srqh+Z8vzNnEhFqbpTWNLlMkMAff0+jpmwcd6KUTNg@lists.infradead.org, AJvYcCVGtQSXqKysX4GizqdXt3FpHsR63IqvC59VHBTY0AKNrd7F07jCxFYQe7ilT8U5jHJm+u6ZXfN2xDos@lists.infradead.org, AJvYcCWYvc7ge7L9F94NTSlaM3ZLOWxGyMXq4jOh6PgXRhKIBTQ3RtCozQIzN1Cl/dQ/7XGaQJTIWfw3f/Z83mA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhAgadbA/qsSL4SmbYVrmiamcIlFVs13XqON9oAaCMjOC2Fq5X
	8WLrvfn/h1cf/2dlE6SxbAPKEjFA1XKr/u38TfDNk5bzNBFK4Cq/
X-Gm-Gg: ASbGncvGbjKFpT+5bzdxqblQ5mYsP773v5+ortGDt211TEHqc/Xck7G9RXru+hmf8Ly
	Cs5JFBccMdwcKo0u7ZV4IPCLWG011ItY/Fuu9lZR+Ndriiwe5qDWusCRPrwlavZLnz8hc9kxQMB
	NsimqMq0YVfR8nlVWYHGknInWXWhevzhKUSITkAjT1zGsj5opUgQ91yEsvxepGXn300gjf+Kgnl
	GWyciMy2OYRqTuWYrPiO0umNCsDhJ2fQDAtlOK+lzGeCOfwzymo8qVpSiCM0+fvTqDAz+sIbSmx
	1tjNcKFkSGsuNo5UW+IX4QXz7F/OncUi7IIOWJLutA5hdw==
X-Google-Smtp-Source: AGHT+IETUIvDkqTKdY7k2714QPYM3xUPceBcb2unO/nI5NYhZ4IV4FRiMa6FjOclLKPwMVNHsxzJ0A==
X-Received: by 2002:a05:6402:358d:b0:5d0:cfad:f6c with SMTP id 4fb4d7f45d1cf-5dcdb764604mr2738652a12.21.1738759967460;
        Wed, 05 Feb 2025 04:52:47 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:46 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 10/10] ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s
Date: Wed,  5 Feb 2025 13:52:25 +0100
Message-Id: <20250205125225.1152849-11-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045249_154306_08F13FF4 
X-CRM114-Status: GOOD (  15.89  )
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

Yuzuki-lizard is an Open Hardware board based on Allwinner V851s SoC. Add a basic dts for it.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../boot/dts/allwinner/sun8i-v851s-lizard.dts | 196 ++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 48666f73e638..af84073f6a51 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -260,6 +260,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3-sl631-imx179.dtb \
 	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
+	sun8i-v851s-lizard.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts b/arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
new file mode 100644
index 000000000000..180d10b1a06a
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+// Copyright (C) 2024 Andras Szemzo.andras@gmail.com>
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "sun8i-v853.dtsi"
+
+/ {
+	model = "Yuzuki-lizard";
+	compatible = "yuzukihd,lizard", "allwinner,sun8i-v853", "allwinner,sun8i";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+	    reg = <0x40000000 0x4000000>;
+	};
+
+	reg_vcc: vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_vcc_1v8: vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usbvbus: usbvbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usbvbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc>;
+	};
+
+	reg_vcc_3v3: vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc>;
+	};
+
+	reg_vdd_cpu: vdd-cpu {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&reg_vcc>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		status_led {
+			linux,default-trigger = "heartbeat";
+			label = "led:red";
+			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pio 4 6 GPIO_ACTIVE_LOW>; /* PE6 */
+	};
+};
+
+&dcxo {
+	clock-frequency = <24000000>;
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpu>;
+};
+
+&pio {
+	vcc-pa-supply = <&reg_vcc_3v3>;
+	vcc-pc-supply = <&reg_vcc_3v3>;
+	vcc-pd-supply = <&reg_vcc_3v3>;
+	vcc-pe-supply = <&reg_vcc_3v3>;
+	vcc-pf-supply = <&reg_vcc_3v3>;
+	vcc-ph-supply = <&reg_vcc_3v3>;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_ph9_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		spi-max-frequency = <75000000>;
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "awboot";
+				reg = <0x00000000 0x00020000>;	/* 128K */
+			};
+
+			partition@20000 {
+				label = "dtb";
+				reg = <0x00020000 0x00020000>;  /* 128k */
+			};
+
+			partition@40000 {
+				label = "kernel";
+				reg = <0x00040000 0x00800000>;  /* 8MB */
+			};
+
+			partition@840000 {
+				label = "rootfs";
+				reg = <0x00840000 0x077c0000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_ph11_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mmc0 {
+	bus-width = <4>;
+	broken-cd;
+	disable-wp;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mmc1 {
+	bus-width = <4>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	pinctrl-0 = <&mmc1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	xr829: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&pio>;
+		interrupts = <4 7 IRQ_TYPE_LEVEL_HIGH>; /* PE7 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_usbvbus>;
+	usb0_id_det-gpio = <&pio 4 9 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
-- 
2.39.5


