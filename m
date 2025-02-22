Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A38C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HB2300uflqiIiUndQgHCnMwg6h8dJJ3C2ou+rEx6MQ=; b=nAKhPhx24T5mZ65sPC27+y36qQ
	6PbwEkT67Ide9Zaiw9sb2RfReAOS3mgS7i0k+kmfwAIvsJ0hPwFWoHsN/XaKKDn2uZ9aI6dop51DF
	bBaz7jfwH+6KL5VE5lqx94xsz38oYfFBfAmkhUU8wFmCGCtsJQ1Weod7EvPOpSolwmMpc0nJ0lOxc
	ZS2XVaAaHEN+cKwJo4OHx0uBvseb6kgEVukW+nq7tq4a3uKVoraqxzZsFj6NRvaKoexBIFodeEs5x
	Dbf143g5Pyv/YXzz5U8lJB+GCs5F6SJRPnjOyoJcWVhV9WKi9f5LGX+32oFH4JXF737bPtQuY3ZJL
	ZTVsbziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltRl-00000008TFn-2U5y;
	Sat, 22 Feb 2025 17:37:49 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltJ6-00000008Rkn-07aW;
	Sat, 22 Feb 2025 17:28:53 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5f6b65c89c4so1052688eaf.2;
        Sat, 22 Feb 2025 09:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245331; x=1740850131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HB2300uflqiIiUndQgHCnMwg6h8dJJ3C2ou+rEx6MQ=;
        b=GCfWOA037djl/1NFEF6xVxjn4bNtYQYRUpen8Je0Fdm7lvLyrDaGyCeFIrXN0mRpMw
         2NJVY2ceYwajvWRKDqRBtvTtGI6GU9YdIdlgTliJzY7G5vG7SzdQXCKjdpRWpB76qbHQ
         Qym6sobIQk7dVRoiuwxqdgB9fGLkriHHUNpfEiXxtbARGrIN1rQdHchNoArARB7cbq7Q
         SXWUB2U/8zdGAj/GiZEN8HrdrlwgN4ZNF6u1TZxkhSjg+T8AxTCdiNv8kTLPCgrNsK5E
         K3/CNK23zPPOCIGSyDuUMONew97torh8NSzH8N1IlqwV1qwra8If96YAvXaiK2j2UmAf
         TLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245331; x=1740850131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HB2300uflqiIiUndQgHCnMwg6h8dJJ3C2ou+rEx6MQ=;
        b=XlgcKaAtk3aB7RWWDMKWT3s6+mkQcqLAcZf5X58tAtxsurwQhTF7nj0nCEt8Ideyq2
         xf39vJp1FHS2WuS9gkKPM/nj5+1yyyqiYYTj3Ha/Q2tnyyZ6D2MoJqop6Ebh7OGXhQ9C
         vU3yPZHt3z5zFPsQiFpjQ1SyvqhJBbb55d/wG6T/QyPKMTYgln1fm62kDjxuN4xkR69K
         fwh6K3HtCshygPPYA6BYo0aHJXbarcLPgl1EgZ4sTMO/3ZcEj/3dZ7eQJw/gB5ZCkSoS
         leuLJCEvUxAQYr6FpNQ550hFLU5851+m5zvvbYFmhMxkePKJkU+/qfD8aziq7DMYixJV
         rVug==
X-Forwarded-Encrypted: i=1; AJvYcCXgUTGgLLG+OCVQfhO0fvX/uIz1gJdizPqceciuD8L30kPGrm0fCb3FbEVK7yxdc6G00iMeXrt5rnA1rmRcbhQ=@lists.infradead.org, AJvYcCXvo4SiPf9ing3/U3HuRdKrvn/VtcBVXXDKeN9mWYwFMQnOvhF7k183g1n+k3tm0z/Pmu0VyyW9S1h+4ncrr1t1@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJFGmPX5eHTvi7waE4O+vJtev4i7+AXdWXUZGrHMpUmx3vPOJ
	YvVLIm0V/E/mwFKFMdZEHHkT/RzseBhZInLZ0fTE741wtgMmZ1Lk
X-Gm-Gg: ASbGncuC2zF/wNZWLVf1a3Yibexot0mTXXVR3PbIDeUHpbe9XwWy/c4A4KpBoIxMMh7
	k27/rT5UhakMx+rE6IN/ctSiZPxuOw9xLHxcn3jjlrLv90AkwnKUVz+VNGQi/h2/NNV5g+qZFf1
	XqUlWBIVO3xmDoVJV9AyayFwwOmvjizkwtd6Bh9PKgP2cItaG0e5cAG+lG2Vz7p6NLbZf544G/3
	y8jBFYiRisEHN9PLTUMOJZnlID1dCnd9hNrbVz50aF0S+BVe167H1Qha0zqNRrdT2SinrXg/6N1
	OX6efm0eWh0Dk3lDoahBrQuTeUHISU63hA4=
X-Google-Smtp-Source: AGHT+IEMFe+lFEc+YZNmIjaRNRS/0ZWidVHYiCpGOSiTppW75wd8bhABpnWA2+7PGawx6yD39ANwfA==
X-Received: by 2002:a05:6871:710:b0:29e:255e:9551 with SMTP id 586e51a60fabf-2bd50c5a460mr5930657fac.2.1740245331000;
        Sat, 22 Feb 2025 09:28:51 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:49 -0800 (PST)
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
Subject: [PATCH v6 3/5] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Date: Sat, 22 Feb 2025 11:27:50 -0600
Message-ID: <20250222172752.6254-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222172752.6254-1-honyuenkwun@gmail.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092852_092733_9DB5A20C 
X-CRM114-Status: GOOD (  13.71  )
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
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
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
index 000000000000..fa975c5db0ae
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
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


