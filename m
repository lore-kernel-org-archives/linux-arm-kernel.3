Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94273C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhfjLOpPcT6PTGeIpVH242ZZv4ym47po7gNPqcAoryU=; b=1iVRQAvzUnOUYU3YW6Qe6BZc+Q
	mDodEgEDYFPQYyWMSogEgXYvDg0TEqCoHSBWfh/9dGJBVnhVlhB476+o2pOgItfm/Xv4gR+/dCvlO
	UqIywNIO/1NO9FFkCQijsmxfE0S6vvi8ro4o3vcQkJdfmrt0kAA7/PgdjMTybC39ki5gidEMEOyV2
	qR2OMUJL1jtRZpsVV1RFBAsGO189RlP3tCUFDEgqlfC4oUGcMxR4kabgIDNgCFzNg9Q20V+xgUmTT
	KEIA2e3oIYDAJhi1Z9xKyR4PfFCklw1pc9ulvIvAM5QbsoBm0yMp3bfPlFLtvAhXZwP5iBO6+ZXJN
	l+MCBDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV8I-000000078NW-1Dob;
	Tue, 17 Jun 2025 12:09:42 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUyd-000000076cE-1TIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:59:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEFC84389E;
	Tue, 17 Jun 2025 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhfjLOpPcT6PTGeIpVH242ZZv4ym47po7gNPqcAoryU=;
	b=mY9dJUqc7JNAtL87rmqWSKxk7Ies8jOqBcGbru0oezsTNqR6YywT/hujs4QWEG8p1/jLng
	g+QwWJkdBGz7FB4hZ5ZqWrPn4gYnCkg1kSZjs0z0lvSbnxSryc5xJI07Jwbi7kfrjeAaM7
	hhuZ+G2T3rYTgrUrMG31QDf12Wh51+CD+Zvysp6tvUA6eMECHG9ZlW7hfP1d8tpn6nfrbg
	qUPket0XECEFhY7Giu5trnHy/r430EizMvxB3kxvUGNE/qHWVd7kxPp9BaiYJ7wmtPPd5n
	NnUTpGqZD56FUxMclWaqbgYH+YCvZm6aqGC43iN7XdeSyX4iHKwBBh1L6TfRSw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 17 Jun 2025 13:59:24 +0200
Subject: [PATCH v4 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bbg-v4-1-827cbd606db6@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045944_198937_508595EB 
X-CRM114-Status: GOOD (  10.31  )
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

Add several compatible strings that were missing from the binding
documentation for AM33xx-based boards. Update vendor prefix from
"ti" to "beagle" for BeagleBone to match actual hardware vendors.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v4:
- Rename ti,am335x-shc to bosch,am335x-shc

Change in v3:
- Change vendor prefix from ti to beagle
- Remove BeagleBone board variant description.

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..7e0d5d376d57 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,12 +104,32 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - beagle,am335x-bone
+              - beagle,am335x-bone-black
+              - beagle,am335x-bone-black-wireless
+              - beagle,am335x-bone-blue
+              - beagle,am335x-pocketbeagle
+              - bosch,am335x-guardian
+              - bosch,am335x-shc
               - compulab,cm-t335
+              - grinn,am335x-chiliboard
+              - grinn,am335x-chilisom
+              - gumstix,am335x-pepper
+              - isee,am335x-base0033
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - myir,myc-am335x
+              - myir,myd-am335x
               - novatech,am335x-lxm
-              - ti,am335x-bone
+              - oct,osd3358-sm-refdesign
+              - sancloud,am335x-boneenhanced
+              - seeed,am335x-bone-green
+              - seeed,am335x-bone-green-wireless
+              - tcl,am335x-sl50
               - ti,am335x-evm
+              - ti,am335x-evmsk
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


