Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FE1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0h5TtXCbR7pZbVKCneQTrZghH/H8RZNkfWr2OofCu4=; b=V71w91h1MoljATioRYE5ayjW0g
	QUrzbJdv+FpRBuBSAQYGY70kLJKAV2Oll4/djekNmIEV7HpyLLqzUiVbh/yPkI9O0pA0/ofUwAmx+
	e1a/7nqT5IIUDEJvoZkruCh8O4yHssXamXpS1skuEPrZ4CA9Ibnt4M8cRMTbNdGkMdafwXukAK952
	WNNiT63SoMQfzz5/BzM3fO4EAjFCGd7WO+rZd/pZaWCHvhs+QwBKjfmwL808D1aE6htFdcJLwKqHj
	a1sRSntJyQo81aORMG5QSilXotIN6qK+AmjW8N05Kmh7T8+Qc6MYX7LFt4lEUIwGd34yEA69oBlLp
	kf7rj51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfMW-00000004fwM-2JRr;
	Mon, 09 Jun 2025 16:28:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOegi-00000004Z3J-47I7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:45:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DD341FCEF;
	Mon,  9 Jun 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0h5TtXCbR7pZbVKCneQTrZghH/H8RZNkfWr2OofCu4=;
	b=ObhGNNdK/VD7+Ua2NKS1rQnIPe+9NT2xUoyNLEsA2FbUikEsVblxmlEffjsvxdu6mszh3b
	GtKIWYOUeCXfOkRO2ozUlK0rrGlTPcUynZhKatW0tTIJ2R7r6eY/6dgkqg0Z0xigEO2t5M
	G3zniKlwBWw8fC8rYlPjBAdnuKgdwsLbx4hLmHajpdiarb5cvyZhc4gVjqLs6GLfSuwH4E
	2YfLY8boid7o2YvOOZ3+pceRcLJMdT1XIdmqBVVQ/qtqRtBfUY0kYEsVZbZszbY9u9VC/m
	iHjYRPLxkL/a+jH7BwtaCf0o5SpCy05lM4lBUBM6G2IrWP01IV+gImE7ffmXlw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:51 +0200
Subject: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible strings
 from device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-1-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
In-Reply-To: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhop
 ehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084529_171481_B6054E15 
X-CRM114-Status: GOOD (  11.73  )
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

Several device trees incorrectly included ti,am335x-bone-black or
ti,am335x-bone in their compatible lists without including the
corresponding bone-black-common or bone-common device tree files.
Remove these incompatible strings to fix the inconsistency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..fb88eebb8c5d 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Green Wireless";
-	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
index 18cc0f49e999..022ecc971476 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
@@ -10,5 +10,5 @@
 
 / {
 	model = "TI AM335x BeagleBone Green";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-bone-green", "ti,am335x-bone", "ti,am33xx";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
index d28d39728847..d87ac31a16a9 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
@@ -16,7 +16,7 @@
 
 / {
 	model = "Octavo Systems OSD3358-SM-RED";
-	compatible = "oct,osd3358-sm-refdesign", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "oct,osd3358-sm-refdesign", "ti,am33xx";
 };
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
index 78ce860e59b3..0c8a120a1811 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x PocketBeagle";
-	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-pocketbeagle", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 597482822608..f2393ff3f4d7 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "Bosch SHC";
-	compatible = "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
+	compatible = "ti,am335x-shc", "ti,am33xx";
 
 	aliases {
 		mmcblk0 = &mmc1;

-- 
2.43.0


