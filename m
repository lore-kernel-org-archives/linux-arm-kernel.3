Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32649E674BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXw2GOKNggDcasJNMHTP1WZO7j9rX2z61SC0Nc27WtI=; b=AiF2UEn1dUdkDHFQDtnLLsXKNs
	jXx+ujtwNHDF4EF7SQswJUptxrA4pTv2g6V4sZp8pFXyH1MetfNNDqf/aRZ1dSvxV9fnxWAsck1tg
	9jzXAXlZ+q/xhKK999cjTfoR4Da5PnnhFq77cmHs3nhkPCBvcKkMi9bKr/ndMbMwvUZK75xPwBeOU
	4yxPV/wZdEkt1YJOun6mCAmRpQRvjEA8rzidpUiks4vrOJ+A6DGpqSQ5J4SBqP98wKKsPkZWdlPYY
	51ZI3sgllm3IW1XkkC3fDg4AiVo7VH1b40xI2wv85RoOM14Lp9hXtRnPd/5tkzbOYz1H8EUAaWKuz
	UJSZghZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n9x-00000006IJY-3Gs1;
	Fri, 01 Nov 2024 08:37:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6n06-00000006Gc6-1HfI;
	Fri, 01 Nov 2024 08:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4C97A40ECB;
	Fri,  1 Nov 2024 08:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03CB2C4CED9;
	Fri,  1 Nov 2024 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449641;
	bh=jhzfbbpIiiPxM14fuzz1mk/HgYx//usi40Pzz6l4ufU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RKSr/Cdyj6ILvMyMPM1zpHtHn6dI8JPHuNInXXQJINcactKaulSFUPiQ/+VkKvJHp
	 U7aThFVEe0DnGkYm03/cQqLbbVqZlFPl8XM1GbRbaskqaG+dRMz9N80CYGwCa9WSdi
	 5uU904RtOt1yIgW81IkEQKgH5E3NidVWEzbbDS+m2xzu18G0d1ynq0SyBDGqAYRvAx
	 3zcaIU5SDbuoEazfeQxNGHSWmFOtrRx1oH6bIzP8Ffb7Kt1vN/uaD4s3lzUgKdA0us
	 x8S9ihcGIQMaomQvmGB9liEHNZWjyrcKpnxxJ+CEHPAzsxoftp9VJf03erT4Eg4nTg
	 NWV6N9uQZlBOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB63BE674B7;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 16:27:20 +0800
Subject: [PATCH RFC v4 4/4] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-a4_pinctrl-v4-4-efd98edc3ad4@amlogic.com>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=1565;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=PpQsqIOiY8S0mM8BBg7BZh/385cWD6OF/06c6qmGVA4=;
 b=/AgQD0G4CfXMvf1y0NwGJ1qPOnpbmXeBoCSPhJhEjYqqy+/UbHbR8UqGy+KDifMKlZz/AkWJP
 0Zc6VFMMz7EDCoAdB0PuLyB92qq8m9bdHIA0voNgT4ZCrzs0E1GZfsC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_012722_606953_0234B2FA 
X-CRM114-Status: UNSURE (   9.14  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..3687764b4401 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/gpio/amlogic-gpio.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,38 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,a4-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+		gpio: bank@0 {
+			reg = <0x0 0x0 0x0 0x0050>,
+			      <0x0 0xc0 0x0 0x0220>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 0 73>;
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,a4-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
+
+		ao_gpio: bank@0 {
+			reg = <0x0 0x00 0x0 0x04>,
+			      <0x0 0x04 0x0 0x60>;
+			reg-names = "mux", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&aobus_pinctrl 0 0 8>;
+		};
+	};
+
+};

-- 
2.37.1



