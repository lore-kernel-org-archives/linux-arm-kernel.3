Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8807C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZD7e7lS6np8xcPoE89XQdSUqvckt6z8hBlyas+Zg58=; b=A9Y6PcczvrnYVA0ZCFHlLpbKCu
	jcTArcsnLmdtkx4QS0eYNH7DUEuAPMr1p2Y60Vy6t3/RCFg9Jnf3eIKeiXZ9lS7vo9re4UaDZmgVe
	KQINiF4fAffxjFfsXm7VeYTnVViets0ZZHeMkRKnnbu3HOlHaTyPDIfNdz6YuK98Vy6YssJYCGJzn
	SlNJCb57JhbfsE3V6ecOuVGuUjyg6r1bYjzp8yhl49clnikP812ropXRPTFTOlNQqkPMZ8iiQT/wB
	otqX/VrNm0TulVvEyRnjaQZk2vPylVCAsSSn6TA/yUFx6egb8CdPedXUu0hMfcUOMKsNNFmZ+JNaJ
	mAcjwMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvMB-00000008czv-0IEM;
	Sat, 22 Feb 2025 19:40:11 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGS-00000008cVl-3gOF;
	Sat, 22 Feb 2025 19:34:17 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcd50841f4so1510323eaf.0;
        Sat, 22 Feb 2025 11:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252856; x=1740857656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZD7e7lS6np8xcPoE89XQdSUqvckt6z8hBlyas+Zg58=;
        b=V+geCO8tYCwqMo3uM1wssDHJ/SSOqqs2sq5RwCiOnm4233CjZt0rhTmyBU47e5OWU2
         +C5mrGMm/FaRCXEv32KG+2OiaCuLuKvbjzPdYXV+RO6yMx1G/xAJgOLMwTcmKhdqZaI4
         P50WtLdt4e0Y/oeEIPXCzSe2rEp4LHhfxQ8lNE8BEDM8meAMJMwWrkPD60awmjKoHLBk
         5f5Vxzvp1T+j0bis8kdsgXnLeuOq3btYatjcWYMMFho7Le8rql0iCjOiBkCGIdjCo6AG
         wngkX5bdFWXjOT4iy8hZn22FFBO21SMS2EF71T3XzWCpDFPXN5Bpp75ibz8X2aFjICx7
         X7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252856; x=1740857656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZD7e7lS6np8xcPoE89XQdSUqvckt6z8hBlyas+Zg58=;
        b=qHM9ly1HxMloGnXh0cD1SBbyZpGq9wS14uI+wdlEVSZEfy9GwupEH6IgxcHFGqWXLQ
         MIsJoS3VvNBEJkhWoP+MKonHPc0QMDYuTMQXR7p2KjcnMiTshVSxniFYy7kG+x5dGwr0
         9MmITBtAP275HZAFB6pZ1b8iG7evad+/UoIXt+wKlhQzg01mTpyg0miFo+rn1gmZX3RA
         4f0jHRsej9vp35jyIMYVKSMSBUQKwAH6ES9UwLZUOHgNRdV0MlB1K80agmLIywFlIFiQ
         G2UYZjun4J3kWm5GHAkkv9ELks8oXla8+x3gUicK4ph7IBeNIfqr2CpTJMKLKM7fmgai
         5WSg==
X-Forwarded-Encrypted: i=1; AJvYcCWrNJnegmml9jEfrtl/QgvTWznnYxbjPxE+aAf/nJ1I8mqIrK3/JA3bd6NphJfBMn0w/6Ve73D51fPbXMwnVVI=@lists.infradead.org, AJvYcCXBUxSKY8/B6PjO11mmxej3lR6NitXFIqC7DxjxWmEJE2LT21Ky7J3wbm1e7YsbnXFhZAub41aB2fW7pVX11kbM@lists.infradead.org
X-Gm-Message-State: AOJu0YzNuk7ZSIHu3iILoKTABMmoElvL8Yd1eCmeoUT376S0az7tfuXG
	QcWWgXfRIwq9D1ltmdKJHFPPwzVLvd7XBBl0Pg07dD7pJNczs8MP
X-Gm-Gg: ASbGncubd7NSvG/sBIQb5Gh9n3Fmtsut//PhjrAhbGUkpSQuXyERD0Aiw1dmytYEm39
	nSewfpNH63y/0czfbB8By1WSJoqC9DMpNPv0teTxhFeLyB0KuIRHNCsI32dy7dblTue/WqZf2ke
	GnfsA7L41I1a+ouGFztlO+ITKzx1VpXEqb7+yON6H3l+tVyVx2kWEL01cAwB3JEJmqCSonm86Y1
	vuOYhmp9OBEJLx9FNKMibkwG1+tqgzJBbMFMxgTupMFicrBWsZduKaoqKv/fP+reAjPBCLq6jMQ
	CadBptnUKy+nJ+oQR9l+mQfwYkuNLmIaTg==
X-Google-Smtp-Source: AGHT+IGAlE7E53XcWVW/rCeVZVzlbW04JQK5gia0SAjU0WBqiKDwJ9mVpl7FBpm7jj5IT4VGe6a3EA==
X-Received: by 2002:a05:6820:16a2:b0:5fd:896:f222 with SMTP id 006d021491bc7-5fd196017d7mr5491847eaf.4.1740252855847;
        Sat, 22 Feb 2025 11:34:15 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:14 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 3/5] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Date: Sat, 22 Feb 2025 13:33:30 -0600
Message-ID: <20250222193332.1761-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222193332.1761-1-honyuenkwun@gmail.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113416_912787_03BE9D4E 
X-CRM114-Status: GOOD (  13.91  )
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

The RK3588 Single Board Computer includes
- eMMC
- microSD
- UART
- 2 PWM LEDs
- RTC
- RTL8125 network controller on PCIe 2.0x1.
- M.2 M-key connector routed to PCIe 3.0x4
- PWM controlled heat sink fan.
- 2 USB2 ports
- lower USB3 port
- upper USB3 port with OTG capability
- Mali GPU
- SPI NOR flash
- Mask Rom button
- Analog audio using es8388 codec via the headset jack and onboard mic
- HDMI1
- HDMI IN

the vcc5v0_usb30 regulator shares the same enable gpio pin as the
vcc5v0_usb20 regulator.

The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
for HDMI IN.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 57c5c013cc08..d068b9018cf4 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -151,6 +151,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-ultra.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
new file mode 100644
index 000000000000..06800733d11e
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "rk3588-orangepi-5-compact.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Ultra";
+	compatible = "xunlong,orangepi-5-ultra", "rockchip,rk3588";
+};
+
+&led_blue_pwm {
+	pwms = <&pwm4 0 25000 PWM_POLARITY_INVERTED>;
+};
+
+&led_green_pwm {
+	pwms = <&pwm5 0 25000 PWM_POLARITY_INVERTED>;
+};
+
+&pinctrl {
+
+	usb {
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc5v0_usb30_otg {
+	gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+};
-- 
2.48.1


