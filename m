Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD5DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NqaOq+Y6A6JWpwec3qqcrxStuJiFGsFgWtQL28Pp3AY=; b=VhEaGdxt+T2tXAyoTl+tam4L9R
	LhLFx70Oq8h0hUc7As5hFsWGR2xwJy3OnGq2NlWpTf6D3lcRVHVJ/FrfRGIOiDo0g8vjSzgYpJ46C
	qnfo76ODobmJn6bCaQNMu2tAz+7Td6IWdF2Pip4c2gpXUUK9v0w40/m2MvObN1Gx2GEZmr16gjDoL
	mzR6JImnlcIk/CHp4kRNFcpmq32ttLqn7GSNpiuvpgkWJS9KkL36FVUWHrf7ZHcqK/ax/zTqTDyYa
	HoJ1ezqtOknw5rpPaRuihh3lixJEuz+dInzh0CgN7KNl0SfttCHM+jpeow2aDS2Czl5jwNHzyFOCe
	B8ABKKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jp-00000008CfI-3swq;
	Mon, 18 Aug 2025 17:33:41 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2pW-000000082MH-0Hz1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:35:31 +0000
Received: (wp-smtpd smtp.wp.pl 16057 invoked from network); 18 Aug 2025 18:35:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755534921; bh=NqaOq+Y6A6JWpwec3qqcrxStuJiFGsFgWtQL28Pp3AY=;
          h=From:To:Cc:Subject;
          b=TrtS4mC1X8oObk0ejFm+RC81OOm1sQu4vfXTCe92WeIw9oRL/QmcoRynsDsyPNPIi
           sfTqB1vTKZqFdD8IpDF8itULE1X8s2iBOJxXAcC+rAgQdfKS33KhKX6mD7CCI/+GRi
           +1S8wA9zPV9PCK2hAhmcVYw1N1fyTpy3gIi5gYcLjugwk+yx0A+u2S/dCn9W2M9xli
           LTaeVpN/J8nX5jbILInuAW9egK9czxrV+G5tliXSBL9zNN4LBjqjIBK7u9EtvQtkPh
           UwvZxmQN1ByhJy9EmrteuVV2JzXzUJp3e4cPDpwww8vrNodieFZBtFHQbM5kghg5qE
           YoZY0i9egMUAw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 18 Aug 2025 18:35:21 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Mon, 18 Aug 2025 18:35:13 +0200
Message-ID: <20250818163520.1004528-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: c4c82e302e075cf6c3724b38962be065
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [ESMk]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_093530_567986_A0AFF546 
X-CRM114-Status: UNSURE (   8.99  )
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

This patch adds support for Ethernet LEDs.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
index 0f29da7d51e6..7688f565ec9b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
@@ -132,6 +133,25 @@ &external_mdio {
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
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.47.2


