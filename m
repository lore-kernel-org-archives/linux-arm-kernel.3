Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE2BCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrxwLH3h7n3WE3GduP3w2rYXEh6p2JqY7Ntn66XaIHg=; b=n/9kqhgefj7u+GZ3J/JQh9RzcH
	riCvrq5zpqWjkZGmF/szGIzUv1z0Klk3aabKI0FwGck2cGlWimPVdnLpPSKZiDkKMdO7rz34qnxDz
	RjWbI3XQPIcBYaC1+Z0m+JL/esdwylNKooSE3Afim+1JfoFhiMMUc3Wxh/Se11BVFDpKAzPA4tLId
	w2Xsf3UqvUkHQmbk+9qWpBYhGxInV2btagPlNYlvOIlGj0azOEf69LGgrhc6S2Eg727aKPY/GQQZN
	0aBdf9XclQgZv4mPYmK/80eWTWxJCRNCyK6RhZkqXvgKlOf5BhCxWC8u7RahZL8gGYvTppIhga/R5
	auEDcISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ7-0000000FZHp-3lBL;
	Tue, 12 May 2026 05:21:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYu-0000000FYsq-1fhi;
	Tue, 12 May 2026 05:21:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB5B9446F7;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CDD6C2BCB0;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=RIpGNaoDTAHuGIHlQtRcIWCRPbEDo7uD7YNwwpO5Pio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=paRfOxsldGL2KhICflxpZMl6dfURYhyk766HxH7NKiPiyfypKNPT65k1kOJbPbi3r
	 TwuH4Vs+T1UKyjJJ4CkUAw8kqiiEh9uE4XyoIFF0UxQnOAbd707fWAA464uDRm9L1+
	 OiYeT78S2bkuzJFocgQOXuNIoLZqaZz4WWNJsT2rgUPNwLwUglAXNIpVPVhhHpAwfA
	 D/8Gshi8kms1NMFzY95PwhoBeX2TlfXZGKQSmrEvYjnotaamyS8rsFikpZbPvFulsS
	 87JrK+1+XCT+6H0oHWe+9IyD1gaJ3JjFWuGGt+mtdhTyqcnv5EFA+xD/t1w1Ek8FRL
	 9WkaRbRMyYoOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83612CD4F24;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:27 +0300
Subject: [PATCH v2 13/16] ARM: dts: mediatek: mt6323: add thermal support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-13-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=1594;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=hUyvSa8MYTwV73cQfjfUS4VTPsNzQkrB0KKei9sFl3w=;
 b=iBXBJZ/5flzM6Pf+lOnm4NFJqNw9k+B/NfwaNSs7a/M4ot2GF0rt3PvAo32sJiacjN+R/WvmW
 V4hKYbt4vbzC0WPWyWnRHKeOSQ6rnmouUXor3C4RWhJmez7RgdpMcpv
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222144_681156_5AF6EF8E 
X-CRM114-Status: UNSURE (   9.65  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 thermal.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index 435936b477fa..9825e15ab4e4 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -6,6 +6,8 @@
  *
  */
 
+#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
+
 &pwrap {
 	pmic: mt6323 {
 		compatible = "mediatek,mt6323";
@@ -21,6 +23,16 @@ mt6323_adc: adc {
 
 		mt6323_efuse: efuse {
 			compatible = "mediatek,mt6323-efuse";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				mt6323_thermal_calibration_data: thermal-data@14 {
+					reg = <0x14 0x4>;
+				};
+			};
 		};
 
 		mt6323_leds: leds {
@@ -274,5 +286,24 @@ power-controller {
 		rtc {
 			compatible = "mediatek,mt6323-rtc";
 		};
+
+		mt6323_thermal: thermal {
+			compatible = "mediatek,mt6323-thermal";
+			nvmem-cells = <&mt6323_thermal_calibration_data>;
+
+			io-channels = <&mt6323_adc MT6323_AUXADC_CHIP_TEMP>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+};
+
+/ {
+	thermal-zones {
+		pmic_vts_thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&mt6323_thermal 0>;
+		};
 	};
 };

-- 
2.54.0



