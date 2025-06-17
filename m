Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368EEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owL8VrtpI4A4L/ELmkd2ca11ITWWGjt30KjpL7fRe7w=; b=goOnatkGwAVvMsMoZljmjnynBG
	iTcIxBXIiUcaPqruyD3qBJlbgtaa52O2ooUJKW3svlkvxHuw9vaulL0H/ZL/yICyBTMIf+yH3S82K
	ujcSQDbpQhjUTx3h9csomqJZSV1MfU1Q9lKFXdLyaV1f5v/1Z01GcH7J9YFItZiniiXbfzTDeSKIm
	BOXUFZUqQq+qSSalkQodE9UQN/2IcViof2LY71L1K22eanBo5WpvgN+sf+jDv6XqGxGGFHumq8ZR/
	av1GjwtzQ3E7y6+eFoCND5qkpA7q66hSkr0564chVOsJOWh3VeITaAgxw7GP4BIWcma6AmCHIgYuX
	DoYHjlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVAZ-000000078l5-05Fu;
	Tue, 17 Jun 2025 12:12:03 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUyd-000000076cC-1OFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:59:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1729644964;
	Tue, 17 Jun 2025 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=owL8VrtpI4A4L/ELmkd2ca11ITWWGjt30KjpL7fRe7w=;
	b=pO5m+4TbC0lPzSPArA+c3WkfJhcFcgXxxNuPxG5vco8mOzNQNg6yXclEQ4zWytZZhSskYJ
	uomgj9cxQdY325INSPOAWAZb2bz9cIazzIdN2Z9hwGWjcyr7xbucYkqrTTEcb6sTB1iDTJ
	Wb+wJDbxJ89W0KpDBCxtJ5i2oi7LNX3f56fr3ytSyDJVHOz6ZQBIouXYtMCKKK+EzMph4T
	58lajRTZ4Y52qphmBuBJ/FwKcwPpNkdvh/6knKDtpNJfA4LopsodXLd1V9w7iqeeqss5SX
	MiRAXydbdO4e7/s633Jq/9aFeCCY73d5aZPfTenA25qcOKvQr3zuOG7HPX13Xg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:27 +0200
Subject: [PATCH v4 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-4-827cbd606db6@bootlin.com>
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
 Kory Maincent <kory.maincent@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045944_213121_DD1DF4AA 
X-CRM114-Status: UNSURE (   9.28  )
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

Document the seeed,am335x-bone-green-eco compatible string in the
appropriate place within the omap family binding file.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Forgot a 'e' to seeed in the commit message.

Changes in v3:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 7e0d5d376d57..ffea0c3006c2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -124,6 +124,7 @@ properties:
               - oct,osd3358-sm-refdesign
               - sancloud,am335x-boneenhanced
               - seeed,am335x-bone-green
+              - seeed,am335x-bone-green-eco
               - seeed,am335x-bone-green-wireless
               - tcl,am335x-sl50
               - ti,am335x-evm

-- 
2.43.0


