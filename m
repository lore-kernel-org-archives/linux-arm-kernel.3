Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D429CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktvIjfxMrOnrAIQuJF/SowoEVNisSucGrU6MG81QF/M=; b=SkHymI7RvdOEcfnz3bIcrIFCy7
	pBPtpcbYXHhUr7MkW9V1u+5PhLn58i7xwwQt7FpQFqqK/wSFPMTEQ96GsSWByRIBnI47pntEq2zrj
	Jhm2ly1XOCwnirGbngc++7tplOes9qSIRNDqU/RKC7VAhVZYwaiPNmmNqPPZ6fFYIPgNoUVh0z2bk
	bB2dpF1i07Z4cUPkqFXW8VbgcPbeIV7tr2riv6DKtSzbz56DfXyRrVoZavr1AzIUoIOPmuzFjE3pe
	8VhhNdyYWSQ8zxE5yDDiIDb6Lmcp4XPZrDlBxnduwKGbHwDyKcUDVoyejzvIunFO88MpqoVI8RWqY
	MAv8SkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHu-0000000C1gg-33hF;
	Tue, 12 Aug 2025 21:12:06 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvdi-0000000BwQV-3fZU;
	Tue, 12 Aug 2025 20:30:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-adfb562266cso805741466b.0;
        Tue, 12 Aug 2025 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030633; x=1755635433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktvIjfxMrOnrAIQuJF/SowoEVNisSucGrU6MG81QF/M=;
        b=i/T2agpMaprEvV8XQix27pcsIuI5fpsqNNH9wncXXn6dRIPRfUEYmchGDxLl09LRJ+
         gkX4TWroHkNbrKmtZ1X4Tiq3252czdLp8jS1EWn85PRWqxs0yuvXPw/nrEouOgPU8556
         0/SksVom2ahYgMF18Ot5xmUc6/M2Lu9c1UWBR/zsBfZyIwZDC9oLN+I3MkFjj9KMLsU/
         VQweqOqlXzE7AoVGX7E81LXAblzl6Kh2Fq/VSsfEASLj+SeECicTSSFYUoDXieqOO+rm
         z/tU/2RAYICEqyh1itU8G1egGtzexXDsIHZIHjWcDqrsZAJa9oB5nDIyL3IxhQFf3nil
         FnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030633; x=1755635433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktvIjfxMrOnrAIQuJF/SowoEVNisSucGrU6MG81QF/M=;
        b=CGWb9TgYLHiAry6CFM15W4pYB+k/8BNR837eAseSVNRYt3h79bUa26SS3N6ZzxSP1X
         bzMmPmpydol/hDtqADUpr6GoGFpF3zNR9L54NJ8f+NRmHsX6+tq6vnFz5Ss2IEKyW1ba
         MMSJ5Lqag1qt+fsTKGcRbiIb4SzDYgxCdA3qAo/v/nfaeHVknLFV0kLlfw0fjjmcWAnD
         uo3dfmDP+MWshAykmMTNq3gcPztAiVkjWj2cyIx2zcbsyu7LKJWJx00vDiZ5u7yHsLq9
         n74p5YNxivskxeI5C84gVU3j6XxORDrvdCJ2J/bF+NdOUOKGPwEKBztZVVK+Q4f2yKhM
         ulzg==
X-Forwarded-Encrypted: i=1; AJvYcCUXfTclGAbpkzGWyqGzFFXltg1T9P/8hee5msUO2RK/5FrcbmPo/5VUkssL2Mk7rfkSxjgT1BMBT5tiiBHzNkE4@lists.infradead.org, AJvYcCXmyGSuqBgMR8m/K7CMrZQUf21nJZUq+r/XRUbas/ZMZRZZMrxHR8stH/r11scYZfmZbnA9fYKVfNr1TEWqlc4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzfmsDbu4ffrlevImlvcGsUiRoCyq1W4ruhGST+px2awAYxUHI
	MwGyyf2ixHdReF7oO8VTEbhCaURnfKbQOwvID5WN/nV44vOaFhZssLbSiqf4lPBVVak=
X-Gm-Gg: ASbGncuf9xa4TuX8GauhHqcSoWya+0uYxFonaBtJs2cRlcJwUhF3WyurADJ5CCdu6S/
	qHbnyH4B0Z+dErvaRyQkUu/7WqTPTL915j+rChyefRL+HcRDLKs4dK2DDNc0wGK6bg2VyR6akFD
	AC6Hwj0x6LajDyJI/rmoHqBGM9e9jAmzg1sUT5c59SdEURV2lBSr7x/cMNYDy+/gV9bJ7vdOjtp
	eevJcDUshjkRnY5s04SGik22WuT1SrQnYRgjzoVIkmR+JX5xk2g0pqz5aeHMGEKiRr8mnt+irwf
	lahin7ifu1CL1E9/38v/ye4d5CZZriy6TPmBQTCBKI/8pdY+hPipi1Imffou+jc4yii9WPAwnWk
	GWari5w+Hae1l3U/kMBvQ/26YJzsup3Q/KikPZ1sZ
X-Google-Smtp-Source: AGHT+IEhBN23fHYD9HD9rJNv5eHIc3wxMe2qLfcYv9cCJJBHEGKutPk282chDrY0GVVVd+6ScJRb3g==
X-Received: by 2002:a17:907:7b89:b0:af2:5a26:b32a with SMTP id a640c23a62f3a-afca4e01f03mr58694466b.30.1755030632925;
        Tue, 12 Aug 2025 13:30:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b58sm2266073166b.58.2025.08.12.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:30:32 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 13 Aug 2025 00:30:24 +0400
Subject: [PATCH 2/3] arm64: dts: rockchip: Add WiFi on rk3576-evb1-v10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-evb1-rtcwifibt-v1-2-d13c83422971@gmail.com>
References: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
In-Reply-To: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pavel Zhovner <pavel@flipperdevices.com>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755030626; l=2878;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=9DqcJtTzlqb1sSS7J90kHNHmzcXcp/6yYNEDD9Y/4d4=;
 b=ZEYpBvII7kSWRyvS+kKlecvScuKWTqUQ49vogugzgI47oBWYhuLAI2pMP+g7Vh8G14THuG116
 Tc2LrzMOkrJCFGqxp06jHZ7m2Wufydr19hT+JuqwQuOvBvcPk6zqW7J
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_133034_917044_213A487E 
X-CRM114-Status: GOOD (  12.57  )
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

Add device tree nodes to enable the onboard Ampak AP6275P WiFi chip
connected over a PCIe link on Rockchip RK3576 EVB1.

It takes an external 32 kHz clock from the RTC chip and requires the
WIFI_REG_ON signal to be enabled before the bus is enumerated to
initialize properly.

Tested-by: Pavel Zhovner <pavel@flipperdevices.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index bfefd37a1ab8c67a17aba0cdb80980102d66bb76..100ca2e23c6093ae517d741fcd047e2a8172f457 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -232,6 +232,20 @@ vcc_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_sys>;
 	};
+
+	vcc_wifi_reg_on: regulator-wifi-reg-on {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wifi_reg_on>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "wifi_reg_on";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_1v8_s3>;
+	};
 };
 
 &cpu_l0 {
@@ -242,6 +256,10 @@ &cpu_b0 {
 	cpu-supply = <&vdd_cpu_big_s0>;
 };
 
+&combphy0_ps {
+	status = "okay";
+};
+
 &combphy1_psu {
 	status = "okay";
 };
@@ -712,6 +730,30 @@ rgmii_phy1: phy@1 {
 	};
 };
 
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_rst>;
+	reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3_s3>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x0 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		bus-range = <0x0 0xf>;
+		device_type = "pci";
+		ranges;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x10000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
 &pcie1 {
 	reset-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie1>;
@@ -730,6 +772,12 @@ rtc_int: rtc-int {
 		};
 	};
 
+	pcie0 {
+		pcie0_rst: pcie0-rst {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		usb_host_pwren: usb-host-pwren {
 			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -743,6 +791,16 @@ usbc0_int: usbc0-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	wifi {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &sdmmc {

-- 
2.49.1


