Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537BAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLGcoG1SBhExgMa7CCAIDuzbEQ1srM9l/xvaam3KIPw=; b=vGVuocehNXBAdyDciFIFj1WIl2
	+ipAHuBIfblg6puFeKKaxbqYT3tb0Fxhj4QwPcoSOeypFnIoE6wJ/WPYVF5SCaAK/9+m9PJNkgN+j
	M7OPzg+iosZn00j6rHWuymA1RxoodF8hmAo4tQRQOjMvIHhMbmQ4qazdscEJaCGWS4RE0AW6wYbPJ
	/zWwN13b3VZOXh1uTxidqpdbYF3/fvbRCrNjaNiSRJtegR3Dd6YvzdLU2V7ZVCQKeidpIbOTdLS9F
	BCYo65bUhy/DyrUJ1B2MP33k7MyniwM79n7aGzSquKAgGJa77hW/NaknVmXHGAOOTa44mE72rr+lJ
	VpSZtO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVF5-000000079iW-2OXL;
	Tue, 17 Jun 2025 12:16:43 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUyd-000000076cG-1Mf4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:59:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6B2143881;
	Tue, 17 Jun 2025 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLGcoG1SBhExgMa7CCAIDuzbEQ1srM9l/xvaam3KIPw=;
	b=oA1DORclaov1cXV/8G6Op6VIOXSA9UF1vu0H6+jFfhsc6ZMjaNdNP0Eeo+qNHjFS7D4YcV
	CBkZz7U2vPZTIo0XoCUwF1Vr39KlS8dGV3upEsQ8K5Pzc3jtL9nV1aTzAfMWcMdynOC9ny
	zSwjqCNC08ePWaVDFbvLRi/g74F7FgO7rlMUIzpzy4o/ZumyQSArUcOmCqiiCLIij4LzGD
	arS2DtciyGY7MRm9HBMCgnqb+EXkTPzFcoaiBqO3Z4t1nGNvoUbxGxacUfKL7jOZFh2wNu
	mDqK4dAGKhf+ahfqW9XgtQ8dUwOhk7i4zAP5p79BppdY6TM61V6dYfSzfjeN4A==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:25 +0200
Subject: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible strings
 from device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-2-827cbd606db6@bootlin.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
In-Reply-To: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdegvdetieeugedvteefjedvffffjeehkeelleeggeehueeghfeihefhvdevfeehnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghro
 hhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045944_217421_1303D620 
X-CRM114-Status: GOOD (  12.43  )
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

Several device trees incorrectly included extraneous compatible strings
in their compatible property lists. The policy is to only describe the
specific board name and SoC name to avoid confusion.

Remove these incorrect compatible strings to fix the inconsistency.

Also fix board vendor prefixes for BeagleBoard variants that were
incorrectly using "ti" instead of "beagle" or "seeed".

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Rename ti,am335x-shc to bosch,am335x-shc
- Drop model value change to avoid conflict with script based on this
  value like:
  https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads

Changes in v3:
- Remove extraneous compatible strings.
- Replace BeagleBone board name vendor.

Changes in v2:
- New patch
---
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +----
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
 15 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
index 46078af4b7a3..176de29de2a6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "IGEP COM AM335x on AQUILA Expansion";
-	compatible = "isee,am335x-base0033", "isee,am335x-igep0033", "ti,am33xx";
+	compatible = "isee,am335x-base0033", "ti,am33xx";
 
 	hdmi {
 		compatible = "ti,tilcdc,slave";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
index b5d85ef51a02..08616d449f95 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "TI AM335x BeagleBone";
-	compatible = "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone", "ti,am33xx";
 };
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
index b4b4b80df08c..aa668dfa1c6a 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Black Wireless";
-	compatible = "ti,am335x-bone-black-wireless", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone-black-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
index 16b567e3cb47..476fb6677203 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Black";
-	compatible = "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-bone-black", "ti,am33xx";
 };
 
 &cpu0_opp_table {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index f579df4c2c54..56f9042a5bfb 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Blue";
-	compatible = "ti,am335x-bone-blue", "ti,am33xx";
+	compatible = "beagle,am335x-bone-blue", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..37d4d5a3edf6 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -11,7 +11,7 @@
 
 / {
 	model = "TI AM335x BeagleBone Green Wireless";
-	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "seeed,am335x-bone-green-wireless", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
index 18cc0f49e999..3d6404653816 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
@@ -10,5 +10,5 @@
 
 / {
 	model = "TI AM335x BeagleBone Green";
-	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "seeed,am335x-bone-green", "ti,am33xx";
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
index 648e97fe1dfd..224095304ef3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
@@ -8,8 +8,7 @@
 
 / {
 	model = "AM335x Chiliboard";
-	compatible = "grinn,am335x-chiliboard", "grinn,am335x-chilisom",
-		     "ti,am33xx";
+	compatible = "grinn,am335x-chiliboard", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index fd91a3c01a63..55a454f51148 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "MYIR MYD-AM335X";
-	compatible = "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
+	compatible = "myir,myd-am335x", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
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
index 78ce860e59b3..908203fd9190 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "TI AM335x PocketBeagle";
-	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
+	compatible = "beagle,am335x-pocketbeagle", "ti,am33xx";
 
 	chosen {
 		stdout-path = &uart0;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
index 7c9f65126c63..61210f975542 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
@@ -13,10 +13,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced Extended WiFi";
-	compatible = "sancloud,am335x-boneenhanced",
-		     "ti,am335x-bone-black",
-		     "ti,am335x-bone",
-		     "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 
 	wlan_en_reg: fixedregulator@2 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
index c6c96f6182a8..10488b55689c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
@@ -12,10 +12,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced Lite";
-	compatible = "sancloud,am335x-boneenhanced",
-		     "ti,am335x-bone-black",
-		     "ti,am335x-bone",
-		     "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
index 32669346cefe..f1bdbf053fb2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "SanCloud BeagleBone Enhanced";
-	compatible = "sancloud,am335x-boneenhanced", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
 };
 
 &am33xx_pinmux {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 597482822608..47b1db476cf3 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -12,7 +12,7 @@
 
 / {
 	model = "Bosch SHC";
-	compatible = "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
+	compatible = "bosch,am335x-shc", "ti,am33xx";
 
 	aliases {
 		mmcblk0 = &mmc1;

-- 
2.43.0


