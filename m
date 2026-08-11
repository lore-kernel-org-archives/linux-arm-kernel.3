Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8821FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9faxvCSlME9QEKQ1ahFv9nOyOfV75qVRHVIQ5bM1Z4=; b=Y7ofBfavymVhl0CXRAPvaC3psp
	qJ2i+bvkB10BW53PIazgtFAVniKgVvtNqZPuZ1nYQEWZNTfCZ6isADNlc5xTy1kSHqTBtH88OGTNQ
	5oVDLget+lfsLpULj4uxZaCirjnWWCkqHAUiwUQ8+hNGS/FQw3adgQJ8zaCDAf88nhtLdAgvSvybH
	hjHWlUK/O7L/IEYC7VZUasHutXZZhD0S63TkMW6TYbEpky9BubVG1hFGSHmg7yuZlViVigqzUzQw+
	gFQACfPNuhu0CCfGH63c3nGEftEBxYdPyCJ8jGZsr7qhhq2u2eCoblI9jpXG9E+khWtGO1OOgSg+n
	83IzBviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxt-0000000EQak-358y;
	Tue, 11 Aug 2026 16:04:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxl-0000000EQVZ-2gWs;
	Tue, 11 Aug 2026 16:04:27 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9faxvCSlME9QEKQ1ahFv9nOyOfV75qVRHVIQ5bM1Z4=;
	b=MBrra3QUZrU58LZoX5t4IoQLaBZK3ou9BMTZh+j41a5K+LH+uHp3Wbm9FPcrj/z0q+yQyl
	VnFecThJ0O5DpKJSnppHqhVsAqZhtsfVq6HxjW8VikvktCzFd8RLOBzgapMX0XgpMR0I+Q
	EauOMhhP5v78jGs9JZ0PZfbWP8OQPZdXwEXA7wZXa9UI813Nr/7xzcGLBkSB9I7J54Ui0T
	M5dtAtIr6r170uhJ6lZTOmoFyIPLMsNmBTH3y6MWj/y7JFRyP/2VfoGhJpRbf4HGjww7N+
	T0f1sVxhUkXFLmNrp/TJz/YMc5mRIm9xHjmdP2u7w4FC/ygzyTNGn3EFfm5FJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9faxvCSlME9QEKQ1ahFv9nOyOfV75qVRHVIQ5bM1Z4=;
	b=ukVRVAyt2Jhrq4oa6FSMGsLU04GXBqmCQS4BFQNqKUm30KJ7r8YkNDcVv98ceWuxSAgPga
	yVUyF/AsfyOIDwBA==
Date: Tue, 11 Aug 2026 18:04:16 +0200
Subject: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
In-Reply-To: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=1343;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Bz5VIkoQKpnIVRzFlQBbxMRZX9jrt37vpkpuL+tVX6c=;
 b=Kq2vLt/BC4nMMMCMU+G9SBH7lCVFa9vJgvXyBYNbH+/wAZ8poGKw+rKmZajb97vlLs9xU+ayo
 vWb1W0JZmyrD6A3WoC4CnoAu53p3purxTnchEcGqYwfsGlto0TCISiZ
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090425_831241_AB3CFFD3 
X-CRM114-Status: UNSURE (   8.17  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
the spi interface.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..81aec81c5ce12 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -69,6 +69,14 @@ usb_vbus_default_state: usb-vbus-default-state {
 		groups = "vbus1";
 	};
 
+	rp1_spi0_default_state: rp1-spi0-default-state {
+		function = "spi0";
+		groups = "spi0";
+		bias-disable;
+		drive-strength = <12>;
+		slew-rate = <1>;
+	};
+
 	rp1_i2c4_default_state: rp1-i2c4-default-state {
 		function = "i2c4";
 		groups = "i2c4_2";
@@ -94,6 +102,14 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_spi0 {
+	pinctrl-0 = <&rp1_spi0_default_state>;
+	pinctrl-names = "default";
+
+	num-cs = <2>;
+	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";

-- 
2.47.3


