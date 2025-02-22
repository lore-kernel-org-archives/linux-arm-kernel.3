Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2911C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=; b=Y9jbeKWNDtWHBTtabIVGWAOEIN
	tcD/p1XfEBK34gOMjyVd1Iym57Ph9C/FRZNUnMpGZ0N93dGUQkuGbEiisq6uYPOyMt0mTdcSYMngs
	iGPErYYWroRyA2nYfnNP/sGqgMVGkQqE2O+gl+ktjIYjMkf4wbvxSeu5NpJoNK5z05UR2EqppaF65
	UzyJntIbh0A3/G/5OApPSnTfYp9BC1zWyjOR8uq1uRvCEwo+rV8XssA+79EajpCnMkFfsXoMIy7wG
	lPfOnWPIydEHHUYC1fsUWLbAzxY1R01ghWQCEAEIdIs/T7TI/Yri+wugNhzKXLth3maV8qG4uXQXP
	8eZebPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltLn-00000008S6k-2ApP;
	Sat, 22 Feb 2025 17:31:39 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltJ1-00000008Rja-07J9;
	Sat, 22 Feb 2025 17:28:48 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-29fe83208a4so1947379fac.0;
        Sat, 22 Feb 2025 09:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245326; x=1740850126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=;
        b=F45/wjLWSG+9PQNG1xlAU6bgttcdV4l/JCS4dHeyxcH3YRs21FrBP53l2TE2a8prqE
         55uzX+y+kRunnd+UHrWfEBMOg9bVCuSzabj7FPUpAq2RVpDkf/HwORJb86s6+dHiqLjr
         UFKPMgDUEMXltOnZ9YKvgZ+j+mMyQPqrsAwb9k1FvUXC5n8BRziM1vT5wEgBEbLmrxZK
         23+TIE2n16rLrpOJ0KKmWM8ibP79IdqI8uRZXsUgcZRjUFYpQwqE07yHa4gVwacrFoI3
         Kem5MkE9yXhN828rxFLKWkIp7rvHuyoiHsYm5kQm7KRLgMskb/OibgyOKVSy6AxyeIJN
         xLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245326; x=1740850126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=;
        b=nb77zhUaSEWnNVfDDG/TyyUd+zSfnub5ijAEfil94NGbnF6q38PD4J8aIYfCI59GOh
         weM55WUMrH9kZXi8jBBDLTVcngquDyReOBBc6+g7OVsC/kvHTxTxFd4ylLWo2xq8D3MU
         hpMzto+gU8b4sLl3IJAtpmaiPbMaCLq6K989J21P588eAo8lPEET/m/IiDl5dWlyGnCi
         C5LuiiBrWv2UcLS3c9YSc/axdlWNPzAv0X+09SlWwP6cyUxEWIbUkBHPjkjGxEuzlwMd
         PYV4ARO38U4x+g2omzCFyH2f0oNjEIFz3LwNe8Ou0lauoX42C3JSzebjEyl6zx9S6+9+
         1wXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTDRJvVReQapAmdIk8KIfz4+VkwLGYawiwglSN3jemBpd3rR1toNfv1YRMiGv42qbAvGhFmVOl6NIVmMF+7W8=@lists.infradead.org, AJvYcCWXRc4sZNOxMUeRUY9pWixvtNDk6NdLgWkq4c8AzdHgPwrnIisODsQQOVQggULTxYwythzwlSUBro1+fker8vh2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyr72yhX4/aLPsH0cRERV4BrOLIDtYI5uCqZyDLC9u1QS0Y4MZ
	tpETAyJEnuSPFqtWUXLxohfi6MxUWYX9sp72Ug81uwpWp+XOp/fa
X-Gm-Gg: ASbGncsE689XKw74mTvKHguaVQngIGhobr+EzaSdHFZysWvHL+vylqgbJasWEhVOmN6
	d2fMTKLxjfa8w9PeNWNif8EPamEgEMDPg4hzbbUsIzHlqWsFK/ZLdmFCoKdSrMWI4bOZN/YSVrA
	AeuX2mYLayk1ZV4cCb5es+LNzZD6gPgR5OCa4jpnirjnTkWM31I4PlIa3sKGCaKzSvWUBmw1CIY
	W/yUezSTIa6oGHZ4WaT34azHbL2t2U6YTq77dlLpejlqcm/2PilqERnTHhBnMk6vXPs83p6GwtZ
	RdU/iIyBoK2tjC17VY5R2Dl+3NHGv4BxTEY=
X-Google-Smtp-Source: AGHT+IEvlX6bmCxueMeOW3jS1NUONbXb14HRchHHbVtWpxNB8PPRxD9vhqOabVgGgsZS5bRfekLR6A==
X-Received: by 2002:a05:6870:3b09:b0:29e:6dea:223a with SMTP id 586e51a60fabf-2bd50394b13mr6228162fac.14.1740245325836;
        Sat, 22 Feb 2025 09:28:45 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:44 -0800 (PST)
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
Subject: [PATCH v6 1/5] arm64: dts: rockchip: Differences in Orange Pi 5 Max
Date: Sat, 22 Feb 2025 11:27:48 -0600
Message-ID: <20250222172752.6254-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222172752.6254-1-honyuenkwun@gmail.com>
References: <20250222172752.6254-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092847_111252_15E3C79E 
X-CRM114-Status: GOOD (  11.79  )
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

...than the Orange Pi 5 Ultra

The Orange Pi 5 Plus and Orange Pi 5 Max have 2SK3018s attached to the
PWM LEDs. The Orange Pi 5 Ultra does not, and thus needs the PWM
polarity inverted.

Also remove the model/compatible from the dtsi. It should be at the
board level only.

Fixes: c600d252dc52 ("arm64: dts: rockchip: Add Orange Pi 5 Max board")
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi     | 9 ---------
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts   | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
index 87090cb98020..6e4dcd8fff26 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -7,9 +7,6 @@
 #include "rk3588-orangepi-5.dtsi"
 
 / {
-	model = "Xunlong Orange Pi 5 Max";
-	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
-
 	vcc5v0_usb30_otg: vcc5v0-usb30-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -62,15 +59,9 @@ &hym8563 {
 
 &led_blue_pwm {
 	/* PWM_LED1 */
-	pwms = <&pwm4 0 25000 0>;
 	status = "okay";
 };
 
-&led_green_pwm {
-	/* PWM_LED2 */
-	pwms = <&pwm5 0 25000 0>;
-};
-
 /* phy2 */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index 26421ca7843b..be8cc96b5308 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -77,6 +77,14 @@ &hdptxphy1 {
 	status = "okay";
 };
 
+&led_blue_pwm {
+	pwms = <&pwm4 0 25000 0>;
+};
+
+&led_green_pwm {
+	pwms = <&pwm5 0 25000 0>;
+};
+
 &pinctrl {
 
 	usb {
-- 
2.48.1


