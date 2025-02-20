Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70247C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 04:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJqdFLU48tnq92+2A61DhSAxiXGci5HKtgHpbeQ/4oU=; b=cUoezYTxpsAW2J9nWrLTfB6yWs
	uGsYwDn0R0/Tqcg8XxyjMmjDnbt9VHDXQyTGStP6eLVGHJvPl76dba8bMZ2qNPgtzdVcJZjYG83Kf
	40qrbB4jH281Ueh8DPRZOje2LgzFRxorIZvjzQbEc9iJjnYwvumdl7MXa+Ikzn9N4VjnRkk/9ofxK
	997FmqAC62EEThkEnVBv2TNHMd0X2m8QLuXxaB/dB8iSEDU9434X6EOlvo9eg1hBBYfHw82eFsHSW
	bXaipdEiVNRRUn00+ReHuauiVPxSFiqi1Q8c2zFkfQUAdpNazwRuMnAXhA5QCh+IU91qwLZoDWoaW
	cpbzNFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxyD-0000000GgT7-3A7i;
	Thu, 20 Feb 2025 04:15:29 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxtw-0000000Gfut-19LR;
	Thu, 20 Feb 2025 04:11:05 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-72726b6da52so124072a34.2;
        Wed, 19 Feb 2025 20:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024663; x=1740629463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJqdFLU48tnq92+2A61DhSAxiXGci5HKtgHpbeQ/4oU=;
        b=XiL0lb5GU2XWClxTeolDpVhrwr79/mOxFnhMdvu1QysepwpM2o5ouQckQp9rYpSqnm
         oZNDJcZ25VHFSvAzHumx1yRamBSHl6ztpdrUKOuQ2+dQbkZYK4ZLEmTL3DFjlcEa2w74
         NVFAd+09tSljDdUqVj3aOPUXxgOtvJ40jTQkAD2aYofw1lBxa8p8s2091t0vngAy0Idc
         Sjvtb6pcBZUOCe79JVMjiritd2Bn6jNq6IrN3g5+QvtkslOMRJk2tzcRU+/0AQBvbtR1
         uT7rwrCTAEE07WA0VQ/JnHnbK1U28o1IUG1nNo8dCEdWMlaV+zMvVUkamhYSQc5aWg4y
         v1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024663; x=1740629463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJqdFLU48tnq92+2A61DhSAxiXGci5HKtgHpbeQ/4oU=;
        b=IBXfIyHxiubLU6D7LCVn16zD0EwxJYMiC3hUeZTXnd/jwruGZbDY9E9wNDoI8spHjK
         96RQJOV2Cv2GwPcMsfkdpRID6RvejwvHbmzmZQYI2NvaPrkjCj037m8NDI7yVcZNrti4
         PsHbnlc4K/S4i6Zj3jSpbBuvBtA6OyMQZUQgCLAWmZWm4uS3gLJDqtSegwR/ewQx2KjA
         djy0u70kYEZASSxiGY3YOWu+ah82MzS+n5W3SKQJP4gj9170j4rpt6XOtPkcbIJ8ANQZ
         KL6OWBOOueMQEi74cHCOminn4kXD9hJPK8jkmV+CokXOuJ+3pIfe3K1CdeEcUvUCEeZ9
         UvOg==
X-Forwarded-Encrypted: i=1; AJvYcCX7rh+HHM0s6iBISy9Hbw57CjyekFpE7F+0XSvSkXHY7bYe0jYgrpR+f1WK7UAW1QJ+bP0H9G6oTVcRQ4C2cOo=@lists.infradead.org, AJvYcCXda7b0uWD7uubwSRNctcNZmbTKNFSMavlamH19I3rGUVrqykQvK82aN3bzK8sJ4SZflmd/0bTndyUSOuzYjDkz@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVLUskP3JW/IAGXyLV1ZsAZBze9JaqrHU+6mw8/X3RHvQcxjL
	3Ftf5eEbOCb6ISszBPvENEtS3ZxYGjERpXpikcnHP3yMOT705Dm+
X-Gm-Gg: ASbGncvyd+H+w3zqAy0MaB4I+AmrMOFQoRMEtQq1smYXjkJWCNsVtA0qq9iTJNIrEEl
	PLS5KsxMiFJvPdpuDNUZ0Agzm7dnRZTyajpXttrqb6DgwKB0OzsXz7PDI2q7XFTfRqX6e6o702M
	NdtswaSZ2HTeeVNx/opz9LQmtc2RglcJUcz81tApp10InBvxmdc+YJlPIz4i2jzWQ0zWfFtetFd
	2mBebBf7HTsd6Io/hgbIDi87gpusrFixwQ/NU5ueWUlL0dhr5UkAOSGJZSKIUufyUNRpNkX7XoC
	QgJvnZti8f/2134rkOutKo40
X-Google-Smtp-Source: AGHT+IFq+LbJlTio7nz2ar+eCrCU4GrZWBLeVv5oMljjH7p8qOeVSrEML6pFWikcIU79YuIBePDZtw==
X-Received: by 2002:a05:6870:702a:b0:29e:7d35:2319 with SMTP id 586e51a60fabf-2bc99a502c7mr15652236fac.4.1740024663245;
        Wed, 19 Feb 2025 20:11:03 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:20f3:777f:5ae9:b018])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm1025875a34.47.2025.02.19.20.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:11:02 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED v5 2/4] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
Date: Wed, 19 Feb 2025 22:10:08 -0600
Message-ID: <20250220041010.3801-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220041010.3801-1-honyuenkwun@gmail.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_201104_312687_393AAE08 
X-CRM114-Status: GOOD (  14.68  )
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
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index def1222c1907..d0deffb8a1f9 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -150,6 +150,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-ultra.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
new file mode 100644
index 000000000000..93561b7a0938
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -0,0 +1,25 @@
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


