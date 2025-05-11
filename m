Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E782C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2n2o30Q/kVq/KYG6vVQ5aU24ZZC3guR83pv90r8Jms=; b=wXV1ttMnVw2Ny/ZExZg5g3ukuv
	SqaX+X22T3+APB8ZOAVP6frGlkaCRbRQAyEzQcSIQR4pdaKeaUOMqJWNJvoa4/7EcAK8q6Dm91J8r
	FOJPFeG+KE9xeDpg5jDFETZDvrWc+RXOnl/YrqCBwkYpiTwZT4xdsgQPylDoeXEUd91DorpCK3fAo
	E3Pw6TwvfclVGeDwmLvTM/4L1I5Mdt/LYc3gjV4/3l0MWdRDIKNCZMR6HK1hDAe/0uTNJMT2Xd167
	2pCk1PBdWA0j5gYMVKzopXbFIEe+7wz4Pa8PutP5eG/3lnnDsblgjmM53RQV7/wwth0bkhJMX+CAF
	wAkjRaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8gX-00000007SAp-3HSk;
	Sun, 11 May 2025 15:33:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XB-00000007LXe-2Y6b;
	Sun, 11 May 2025 14:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F2n2o30Q/kVq/KYG6vVQ5aU24ZZC3guR83pv90r8Jms=; b=P0/TnOtBbmmTFDcOjV+MJGSApR
	QHxJH93D0xYyDqwQkI/k1dClUsrsd+t07GV+Il3j9NV0aFjYuRuXsXNHqbw3wOv6oNufvpGRqfF8S
	JcO9TCrn4ieuu8SjmVc0BmVEBfu4y68croDXSOFqojJc/Ufr+/yAULHQTJfCiMdD2rMSR64eWFEJo
	5XEmrI5gNeIhMWSvHZixXCsT0gyndQHiUdqzbuYI52mtJAjL6MvTr8YeNWnUFofit9CPOsXVRScem
	PYyKPEV8idfOi8oVj4WThMfLZXf5+YmpGO1OLiokHiov6nNSh+bB5CkoZR9VWDf+k0TGokhSP1jmM
	qiXoU2SQ==;
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7X7-0000000Gchb-0QB4;
	Sun, 11 May 2025 14:20:04 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id B834D10001E;
	Sun, 11 May 2025 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2n2o30Q/kVq/KYG6vVQ5aU24ZZC3guR83pv90r8Jms=;
	b=UkJ9gZ3TP4mpv73nR6bUQtH7yGllG6/eGkZpNCk35tuvz48EK/69cOkqd6hnAG94NrseXq
	UyfPyK2r5z0SjCtzXWY2KZis+aFtV8wyZ5f34jQS6CojsZLF3/mITkkpCMJTYe2onk9h33
	EBvRNMKhsXLdxdGChzIyNw2fp7FlMPk=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 9F11E100787;
	Sun, 11 May 2025 14:19:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 05/14] arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
Date: Sun, 11 May 2025 16:19:21 +0200
Message-ID: <20250511141942.10284-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 730e5bd4-362e-4c00-a35e-0ec77e8f4691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_152001_728098_8ADB46BC 
X-CRM114-Status: GOOD (  10.29  )
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

From: Frank Wunderlich <frank-w@public-files.de>

In order to use uart0 or spi1 there is only 1 possible pin definition
so move them to soc dtsi to reuse them in other boards and avoiding
conflict if defined twice.

Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 14 --------------
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi      | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 37e541a98ee1..23b267cd47ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -328,13 +328,6 @@ mux {
 		};
 	};
 
-	uart0_pins: uart0-pins {
-		mux {
-			function = "uart";
-			groups =  "uart0";
-		};
-	};
-
 	snfi_pins: snfi-pins {
 		mux {
 			function = "flash";
@@ -356,13 +349,6 @@ mux {
 		};
 	};
 
-	spi1_pins: spi1-pins {
-		mux {
-			function = "spi";
-			groups = "spi1";
-		};
-	};
-
 	spi2_pins: spi2-pins {
 		mux {
 			function = "spi";
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8c31935f4ab0..ab6fc09940b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -209,6 +209,20 @@ mux {
 						 "pcie_wake_n3_0";
 				};
 			};
+
+			spi1_pins: spi1-pins {
+				mux {
+					function = "spi";
+					groups = "spi1";
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				mux {
+					function = "uart";
+					groups =  "uart0";
+				};
+			};
 		};
 
 		pwm: pwm@10048000 {
@@ -244,6 +258,8 @@ serial0: serial@11000000 {
 			clocks = <&topckgen CLK_TOP_UART_SEL>,
 				 <&infracfg CLK_INFRA_52M_UART0_CK>;
 			clock-names = "baud", "bus";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
 			status = "disabled";
 		};
 
@@ -338,6 +354,8 @@ spi1: spi@11008000 {
 				      "hclk";
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_pins>;
 			status = "disabled";
 		};
 
-- 
2.43.0


