Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA9C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE63LoVDPWCa0QMdvT4TmnO/F7iQTH1SWzFz1ZbwKGo=; b=sbRYElbB9WRtaOFvxRRf7vvtUJ
	b/LFoF6xC7E6ILU9lckJZQaJeycAzqRS7ksroXSWgLY3AtA2kfEWoekxJGciu8OaqKarOEhjIy76s
	Gqhsj6JsVsztfxggPxq2jyTkdkmyGYsV36/2mbMXF4fXHgQpYvUbD0NCgwRKzV3X+fmAWRItwG8wx
	NkuexlSBz/SlaTu2Fw9uCTrtgJuNpsIZzR5fLIr1JZoBzQ/cuubTwB3e9m+ypTlNJgoz0SplvUf53
	k7E7xqu8ucW4PjokXV4HUK+ZIOTCaiMP5tCx/Djd6xGcgOFN8g/74Y+AS35EEDSdbMFJkYcE+sxAz
	ocNzLGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXDJ-0000000F4mP-0f6F;
	Fri, 20 Jun 2025 08:35:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWuu-0000000F1rs-0siF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:16:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36132433F1;
	Fri, 20 Jun 2025 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wE63LoVDPWCa0QMdvT4TmnO/F7iQTH1SWzFz1ZbwKGo=;
	b=kwCVz3451E2JKDHiZtUrySRjTxpiEWrbLUhMuqigelChaoGpMCFQo7E+/yyK8byoQvlbhT
	5pbnP4NaMntnRufmh1tXWsvvIy086xo8fKAcM5X4uVGPh0T7Y5/rCpSE8pd6jNdci+oomG
	4AZSaTPn2uYfcdPklrDwWfGgOoCBPYh8r6Vnq8tRcP6UYkskC1nVrBjMN/4zKnHETyt/sQ
	t9ZJOGtGLFIeLXuIpyAgsO/RytnNKfKa2fFN5Pj1GLHLt9LGoIkE7IyHcq86BHS0eqIiNe
	Oz4Ts0kbvd5ahqymX3TtmZg6/keBwy+PaW11edGClJDfAbo8q2MqgHDPZl0H5g==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 20 Jun 2025 10:15:53 +0200
Subject: [PATCH v5 2/5] dt-bindings: omap: Add Seeed BeagleBone Green Eco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-bbg-v5-2-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-dd21f
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrm
 hgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_011608_383350_4F4C6261 
X-CRM114-Status: UNSURE (   8.90  )
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
index 3603edd7361d..aa5df4692e37 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -107,6 +107,7 @@ properties:
               - compulab,cm-t335
               - moxa,uc-8100-me-t
               - novatech,am335x-lxm
+              - seeed,am335x-bone-green-eco
               - ti,am335x-bone
               - ti,am335x-evm
               - ti,am3359-icev2

-- 
2.43.0


