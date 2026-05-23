Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860AACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=081I3uGh9xMy+jangEiaAfSrrsCOcyEM7Q7SYywZ4YI=; b=s01QlantVPfZgMET6T/qYPiMZj
	qWdUuqhq7figyE0tBvnAYS9sMYZ4b57x33ngb85FjRuqM5u+dK4vpH7RJmqt4Wi9O7Ws6YoR5gy1m
	6SGbuDovHbI7MYXns1sw9xjetkIN4ulJmcWOcvH3g0lRzx+y0TVWhCUdlzQ/mmUIuuib7Vn25Cw/S
	QOZ1xytnxu/zvZt+mzPG5UndOwfRPZrYDoO1C4iPdznt6upIyLYp+IySMoFmHIySZBFK8gETzgWZH
	1w7p7KJh9SonfeIcUO0XZFry1yF8n/nc9IPb7W+hVHpVJF+gTqpSaHvG+QUrfQazHIgGQNpdGF0Ec
	Cr59XzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjS0-0000000D52p-0VgC;
	Sat, 23 May 2026 10:19:24 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjRv-0000000D51m-2gf4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 10:19:22 +0000
Received: (wp-smtpd smtp.wp.pl 42262 invoked from network); 23 May 2026 12:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779531553; bh=081I3uGh9xMy+jangEiaAfSrrsCOcyEM7Q7SYywZ4YI=;
          h=From:To:Cc:Subject;
          b=fiVVcg0yphzYqnPILR2CLP8PxPbR9pYBXBODa6XY0EZ07IvYmSoChVuXgwuw1dHZ7
           TGupX97dbcs2Wzy95dcFgxGI4kC9QsUKK+zcF9Zie5sOkoHh0MwsApMiwgTLMSpPqb
           yjPIDqiD3dZMPam5K05HYU2KU9XkJmp8g+YLG437Mik9nmOXi/s25ejfSaJnVr0vec
           ywkFwm0+XHEwiZKTP5JpZ7NYChvbGz5pfaHvCTkeM38ZyyU15RCo6M7Hi48b+5S9KV
           9rdR6FnUMYFL9WGaXLuHUiKEVzmf1YGBYTUW2w9XERLx58kysMG1qPqEozSVfkad1O
           gof1r+6OxdkuA==
Received: from 83.24.127.64.ipv4.supernova.orange.pl (HELO abajkowski.lan) (olek2@wp.pl@[83.24.127.64])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 23 May 2026 12:19:13 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH RESEND] arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T
Date: Sat, 23 May 2026 12:18:55 +0200
Message-ID: <20260523101904.293215-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 4ff0eba6bf8edec8983f8b295cbbf876
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [wVOE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_031920_131198_F2A9AAF7 
X-CRM114-Status: UNSURE (   8.87  )
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

This patch adds support for keys and LEDs on the Xiaomi AX3000T.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
index a314c3e05e50..db399cb3ead7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 
 /dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7981b.dtsi"
 
@@ -12,4 +15,37 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x10000000>;
 		device_type = "memory";
 	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-mesh {
+			label = "MESH";
+			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_9>;
+			linux,input-type = <EV_SW>;
+		};
+
+		key-reset {
+			label = "RESET";
+			gpios = <&pio 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
-- 
2.53.0


