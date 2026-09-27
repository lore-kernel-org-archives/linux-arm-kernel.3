Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24172C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TnQxYgpCNkWFsilYnSP0IcpmCqqzaPwYvLR7k4wkAvk=; b=0K4+12P1hQ/T7xx1Bf3jTJV5Wu
	OLe16Mct/pUB4UZNC4z1KixRlBtlfamyaRkpfh+cCB+oivKbQRBRMqichsIieCaeX322zKshtASYN
	8dVsuOksckP4KgD0vqe/fAOMcsdGhqCO5+Rne6ntm6iA99o+2Me426tjuFnSRHgpwczgvO+9SqlbK
	w1TsctFG+98TcKgfmzgNYwz0OFBJd6J4SjMafWTgrFCnzn+cdX1GTxiI3mJyyKxz5TYPX/SJy5wp1
	igGwfVprM9gRUJDcU/E/UMFf/n9u9f7bgCsP6GnV1Uh7oYGgovFzbgrOmqzW3P4DRa8fpjFoB4LEJ
	Tk5hzBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvAk-0000000Gmdv-1LAY;
	Sun, 27 Sep 2026 20:08:30 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvAh-0000000GmdZ-1ezZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:08:29 +0000
Received: (wp-smtpd smtp.wp.pl 34551 invoked from network); 27 Sep 2026 22:08:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1790539702; bh=TnQxYgpCNkWFsilYnSP0IcpmCqqzaPwYvLR7k4wkAvk=;
          h=From:To:Cc:Subject;
          b=DayQRYMxvGbmOy99dc+WfOpWTrknJd6y84OnpyqBtZlFno5LbL6N99/KQaCuH2Fk3
           BheIhW6B0uFWPo7fZR3HcssKxh+p+YlnGLLwrkVlrB9nrMWLEaQbXT4j6aEXAOsG54
           /uk+ESmW7WPO8J70kdUsms2eTKf0amuQI+QnYo+SwoW4ZsvIE6W15HwwQyLSjwaH4v
           n3TH74v9uD6qyMxrMGyQ+F6Vj1S+K8lFCiy8ywLqA4Whhgg2IcPPX/xe9cj1fs2b/H
           thhJuYNLGjihbkGmpe0b78SK1CgqOh/aDLVN3IqWUd83xRox0nIJp0IuwImawOxiI7
           1jJ9C1ai9FQQA==
Received: from abajkowski.lan (83.5.247.9.ipv4.supernova.orange.pl [83.5.247.9])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 27 Sep 2026 22:08:22 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Sun, 27 Sep 2026 21:38:18 +0200
Message-ID: <20260927200820.795348-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 6b11e7dc137ab51735648a9f2219e6a2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [UfB8]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_130827_898347_AC68BD4E 
X-CRM114-Status: UNSURE (   9.15  )
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

This patch adds support for Ethernet LEDs. Keep the default LED settings.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
Changes iv v2:
- add defaullt-state property. Previously, the LEDs were dark by default.
---
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 6e57ee19e799..c23315994799 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
@@ -132,6 +133,27 @@ &external_mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+				default-state = "keep";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.53.0


