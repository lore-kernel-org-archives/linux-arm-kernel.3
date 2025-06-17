Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=; b=VXlcvGzwALgaD35pDro/wXIZjr
	I2G1XBJQIbh83NKcdZXNnR+8AYzeIsljZoAC02LuMf/aI4tuPVsDhZXE54vqUQjWZOSwfANk4D5xh
	0HWlQRzohbqaLXydLwk2zYfUTD/AncmvC94dce39jAjX9Ptt3iFRJLcID03Gcq4Tk66gV4X5nscXd
	7oWiHV1LkauUXfb/BvuCO7a1SwW1xCKb6BTJ7tcQHDWGKvBjzf9HaA05lTPwWNurW+eEfERge8Lso
	dgJ1EsemZm+dBBptEH7lK1h0LwjK+8v0flb6PH3QSranwvhM3ETKyuzgeHmGTR0znsNPRiwjYxuD1
	Re5Wrv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV5y-000000077u0-2SGy;
	Tue, 17 Jun 2025 12:07:18 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUyd-000000076cI-1QYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:59:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9C9F44969;
	Tue, 17 Jun 2025 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=;
	b=gZiK7Um3Q0+KQDFkCsWIxeV8NF25+hNqIKNy52wxZwKWIc3RZArw0sbiKUmXbOmS4BNJsN
	+Z4R8xR9wGjo/xw4AJOTFBs9k2l5btv++qn575WgJVMc1WHCqnFH5vAEPjyMncFH5zfY4a
	D18tU+GQeYJgiF1FXJWIgjwFkLRPdgKSC6MFu3wfJNjfxOsTL3DFX9P+1FXuDwRabUaqXx
	58itZiG7AqVGd8AsuY/+ooLC5DI/2pXDnpnSyRPFLEaOpZ4SjXpBQvR/PpGTd6TlYJId8t
	DjYZ1vS/8f1mKdtL5hFt8iFTSfIezWbEvnQ7CJ6NbTxecTpKh9gfulCAi0GTrg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:26 +0200
Subject: [PATCH v4 3/7] arm: dts: omap: am335x-bone-common: Rename tps to
 generic pmic node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-3-827cbd606db6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045944_188647_36DD2FF8 
X-CRM114-Status: GOOD (  10.72  )
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

Rename tps@24 to the generic pmic@24 node name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch.
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index c400b7b70d0d..ad1e60a9b6fd 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -212,7 +212,7 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	tps: tps@24 {
+	tps: pmic@24 {
 		reg = <0x24>;
 	};
 

-- 
2.43.0


