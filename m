Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4087CFD377
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4EFkclHnxBSnL2Rrwz4TjPZ73VeDWsjyo0Ai/6COUQ=; b=kGKfMekoLeKAdmGsb5EnDb4V3H
	fGTcfefNooBSZagWfM/PmknGu2+uqh/o7r0PIPmpM5+DNAxUTVd+VNm7dogWFjOZnxBDoVGkRVXua
	WEDv+s/j5LoGzHoyKtznJ3Uxm+e8SLICpylgQYatIWYKga3NNCluQyPgQQjga+AEU4NQONe+FHACH
	p/gaCDK0qkcDDKt8NloXz7KY2OE8Vz9m5mC4ZajBVMc1v7HLFhAKgjQ94jjShT8ZlPiabeh/qYxku
	gnkQwHFLc7egJF53zU4m2WwGEFS0seuEfDZfR5lQQpVZLBWRftDDEKhsACPvcMKtk7iUlw8uLGkEz
	WEpwQ4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqId-0000000D89o-3Mhv;
	Tue, 25 Nov 2025 10:29:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqIa-0000000D892-3tZ8;
	Tue, 25 Nov 2025 10:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764066565;
	bh=7uW/PXDiLv9bv4bENX8rg44XZjAgahdiMX0JiQRX2I0=;
	h=From:Date:Subject:To:Cc:From;
	b=oIW8VZef+01U2T24JyiygW+GD4PPXZypkwTThVtJSJ/6SqqSF0PaErqhm4ZXIJjva
	 oPNfpvmrzHkkFOopuTqz3rPiAgSpl/XkWUtNRS73oSI7CHeRlDclqzHaJOgRaXpOV0
	 BDOYDGw7zw7iy74+kGvwhzNqlrOjSzOU/rzUdxKUtk66wuLUWfHG4UkG2SMrdyrcbn
	 HnUI9QSbcWuTXmuqU/RX0MgoKeSx4+ULmZnHWY1sB2/7Bk3A6xbe0T3K7v7qdkRU2k
	 G6spX8ulidlkVrxn9jCzw9S5TczAypVrs3OwEg5WPL7mQMIiMnTIbhUmetiQ1NckbD
	 WmGppMOAhDDZA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AD6217E10E9;
	Tue, 25 Nov 2025 11:29:25 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 25 Nov 2025 11:28:27 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8365-evk: Fix touchscreen reset
 line polarity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-mtk8365-evk-touchscreen-rst-pin-v1-1-316facb96d63@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMuEJWkC/zXNQQqDMBCF4auEWXfAJCSIVykuNB3rIElsEkUQ7
 95Q6fJ/i/edkCkxZejECYl2zhxDDfkQ4OYhvAn5VRtUo4yUyqAvS6utQdoXLHFzc3aJKGDKBVc
 O6OykG6ulaRVBfVkTTXz8hGd/d6LPVqFyjzAOmdBF77l0ItBR8I9Bf11f5+jMdKIAAAA=
X-Change-ID: 20251125-mtk8365-evk-touchscreen-rst-pin-c6f30631582e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hansg@kernel.org>, Martyn Welch <martyn.welch@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764066565; l=2133;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7uW/PXDiLv9bv4bENX8rg44XZjAgahdiMX0JiQRX2I0=;
 b=d2MA9BX2I4lYvmutC7pNGGQXPbS/4HScsFXrKxJQPCLNAMvPk5obmdysja2thJM7k1Z+KHI+R
 +dL9j6hq2wBATRVuQttcio/vinEvWhMaa2Ob8g8DPmNe3pgGdbm8RzV
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_022929_135979_2253243F 
X-CRM114-Status: GOOD (  13.79  )
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

Commit 7363096a5a08 ("Input: goodix - remove setting of RST pin to input")
modified the Goodix driver so it no longer tries to set reset pin as
input.

It led the driver to fail to probe during boot time on the Mediatek
Genio 350-EVK board because the reset pin polarity is incorrectly
declared in the board devicetree:
```
[    6.253819] Goodix-TS 1-005d: Error reading 1 bytes from 0x8140: -6
[    6.277884] Goodix-TS 1-005d: Error reading 1 bytes from 0x8140: -6
[    6.305503] Goodix-TS 1-005d: I2C communication failure: -6
```

so fix in the mt8365-evk.dts the reset-gpios property and pinctrl
configuration of the touchscreen node to use the proper polarity value.

Fixes: 7363096a5a08 ("Input: goodix - remove setting of RST pin to input")
Fixes: b28c4af8e44b ("arm64: dts: mt8365-evk: Add goodix touchscreen support")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Patch tested on Mediatek Genio 350-EVK board with kernels based on
linux-next (tag: 20251125) and v6.18-rc7.
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b5dd5ef9fa11ae1d54aa754325bac2e184b90dd3..4aa802ba85ce541f57ffed439262c15e1d7bcfe3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -352,7 +352,7 @@ touchscreen@5d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_pins>;
 		irq-gpios = <&pio 78 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&pio 79 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&touch0_fixed_3v3>;
 		VDDIO-supply = <&mt6357_vrf12_reg>;
 	};
@@ -695,7 +695,7 @@ ctp-int1-pins {
 
 		rst-pins {
 			pinmux = <MT8365_PIN_79_CMVSYNC__FUNC_GPIO79>;
-			output-low;
+			output-high;
 		};
 	};
 

---
base-commit: acb2ca6959161544908b4ad1537b0b70c80f052f
change-id: 20251125-mtk8365-evk-touchscreen-rst-pin-c6f30631582e

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


