Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0943CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtvLadg8SqPwhQvo8VZ4d1LYGlksfLQL+irk20UHeN4=; b=v4f4L6BBroFOYjhzbRPQNlrmNx
	cjaAwYYWYS4S+EnpOg/uTqJfkG7/9+4oliGzK35lQ4RQpvqJiWf6tR43rM+UN1gvLmyyh2aE7Hyp7
	cYjdot4ZylZDEDlkSQPVJTOfCYwhr5zTwc748Ds57gD4n3itX92ejWuMfne+Ihg9Ynxtkjt8BvwHl
	ffT0NE+Smf73suf946vYpSY78pZmcq2ZHd4CMp0ltAkP8Q9HGxz9p6ToLQiCDmqmyDZiRHl/YOx0w
	33txIYWOY84sJzCx26Su5uW0ji7rEVxwZnSawLCuqwvQZrsncp3LlYBrdhjoJX8NGPAyHIdxMmWoz
	/IdnYdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KvB-00000004LJl-1Q6E;
	Thu, 16 Oct 2025 10:09:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kus-00000004Kvx-1grA;
	Thu, 16 Oct 2025 10:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760609335;
	bh=UT1tGvKU5Kvq7l45Piyw1w46GgfZtcLVNXUBPC/Jvcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nNSNiutkn7HdoT12AweE3Yf8fveb8adNGcEY8mIxvDC56vs5OWPYUEfyqDtwnzJ43
	 xue6+GOI6FE37MWsEDfvPmV0vTgLFM9YyRYfmTNP1ePNLzVR4zmKPogw/V5utQyjVf
	 QEOVbHfmrxKUq+u3CtdnBSj8QEkLRIEjtoVuTOxlF6bMCwvctIZC9oC7mUyG1kmva7
	 +zzYsvgRdvLJAdPgrmDKJUVbxcoedx2XIOLJiT+0+hfUcpoj3O64m/C3YKBbtAlAG5
	 nt430CPqMt95EzW/umLdkgxt0e/Ma3rfp03RYKyAQJHj0suGDHPJbnLzpD6BzSmr0s
	 KyIcxgeTJFFpA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3364617E14FF;
	Thu, 16 Oct 2025 12:08:55 +0200 (CEST)
Received: by beast.luon.net (Postfix, from userid 1000)
	id D6C8E10C9C79E; Thu, 16 Oct 2025 12:08:53 +0200 (CEST)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Thu, 16 Oct 2025 12:08:51 +0200
Subject: [PATCH 15/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-openwrt-one-network-v1-15-de259719b6f2@collabora.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
In-Reply-To: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030902_795521_892FDCE9 
X-CRM114-Status: GOOD (  10.95  )
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

The Openwrt One has 3 status leds at the front (red, white, green) as
well as 2 software controlled leds for the LAN jack (amber, green).

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 4d1653c336e71..0c0878488ae98 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -43,6 +43,50 @@ reg_5v: regulator-5v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_WHITE>;
+			default-brightness = <0>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm 0 10000>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-brightness = <0>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm 1 10000>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&pio 34 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &eth {
@@ -109,6 +153,13 @@ mux {
 		};
 	};
 
+	pwm_pins: pwm-pins {
+		mux {
+			function = "pwm";
+			groups = "pwm0_0", "pwm1_1";
+		};
+	};
+
 	spi2_flash_pins: spi2-pins {
 		mux {
 			function = "spi";
@@ -152,6 +203,12 @@ conf {
 	};
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
 &spi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2_flash_pins>;

-- 
2.51.0


