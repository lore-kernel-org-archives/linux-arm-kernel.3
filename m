Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E66C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CuqPtpgChMhk0+0B9V1dMSVdf3LmZwpa+6ReyOVK1k=; b=zfOkTks6j/Jrw1OYrTqsiwAyOk
	EuebgsbQEwV2aR83qECVIwLem/mhMyhh+7v+/wdvD+PgwxYb3zIgN+xZ+eVKeu4PfPDx7pUMYP+pA
	F3WZ/tRbUtZRO0mot9kOWwRC7ndAw6iNXwM6tjBYSciaVpyGmfVj/d3MPJb36+zoP9SIyG9BuANhX
	AL7mvvE+8C07FR3/znf7yg/XXD3WYoneZfczSEsfj82QH9WwoL9h5dD5rs79d1tBKUXERO8r5VXTj
	YVr0+QxdnV0EzckLGDPQrk65xKjXdssPOvtn/nid8IGMJRw4zYxeMNo6zQCkes9738/9oTV/8/HnT
	e6iyPfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHr2-00000004ZYj-3s8A;
	Thu, 02 Jul 2026 13:53:24 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHqx-00000004ZVO-0pXG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=9CuqPtpgChMhk0+0B9V1dMSVdf3LmZwpa+6ReyOVK1k=; t=1783000399; x=1784209999; 
	b=mhcTIlbgz+Lm8nQzLN8M8d3bLesLJW0rqMNaZoDs/rDZB88vlKICdVLSZeXH/7Q2XTBbydk91Me
	3/P+tLEbuqfgQgcmYg5V/CuZbQ1RFgL3ZEZoJUyCxjZDvjh7JZOFOjwCfwu1sySm4niFGAaN9cgMD
	pY3sxjm0+TPapw/iu9ck7TOu0atT4ViPFdTywbnBGcGSulzbpj/1btOut0SjQFVNNktXo9nS68CEd
	sLo0ZcDSShsfKZ8FWgZydhqOT4O3W5Thod6HEpMeO3O/2iqAo5+lmGjl7JZZNXkQeRTqA7f4PLHWQ
	jTYvXgzabXGG0xMqIHLOl0ZZaOxihmlrcBHA==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 02 Jul 2026 15:52:43 +0200
Subject: [PATCH 1/2] ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b200multiled-v1-1-c1799ad45c96@kemnade.info>
References: <20260702-b200multiled-v1-0-c1799ad45c96@kemnade.info>
In-Reply-To: <20260702-b200multiled-v1-0-c1799ad45c96@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>, Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=+Rv2z64JUVe7fDMTssxAANzbg9IuAfskna7RJrGAWG0=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFluubae/jkzKpct3Fkwz2CNABO/g6Drzpd1USfenRD+f
 /XVYVfhjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACZybCnDP4Mtmy5Mzn6tu9NO
 tt3VJehgG8evB6FftZOsowMur5wbdZrhf8baS2b3Fi/byB5mavrsgt6H3vbcLQybJdg0dAoeBel
 YsQIA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_065319_241199_419160BD 
X-CRM114-Status: GOOD (  10.17  )
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

The device has one single RGB LED. Explicitly declare it as such
by combing the LEDs into one.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index e253e0775ea9..e11d1931c42a 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -64,6 +64,13 @@ key-lock {
 		};
 	};
 
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		leds = <&led_r>, <&led_g>, <&led_b>;
+	};
+
 	cb_v18: regulator-cb-v18 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cb_v18_pins>;
@@ -368,19 +375,19 @@ led-controller@66 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		led@0 {
+		led_g: led@0 {
 			reg = <0>;
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_STATUS;
 		};
 
-		led@2 {
+		led_b: led@2 {
 			reg = <2>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
 		};
 
-		led@4 {
+		led_r: led@4 {
 			reg = <4>;
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_STATUS;

-- 
2.47.3


