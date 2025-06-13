Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BBDC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vmdIHdbOmeoonnadlmOHGKHVDgOQGVeKLjeKUbgyLI=; b=w59M2U9U6UFO5DUZdNfqWx92SL
	mwQ2v0KFausMylrMIw25/a7bG7wf03YN0F3XK6w6wKbQECdq8IhLL1edBOU0kMlJu4V9oKRGTZdzg
	0MokEpOUPzpFaAUL9F54AbrGtrr3K15bpJGjKmIi0sUX2LjalsS/xYtWQAWqGCDVMAzZ/qu3HFWeb
	TYFLdI2mcFecLCfj3KpRUkk7FLBHaJvX5m89VSn2G+ZE2faGQmctBcLqnw6p4bFP8G/T2TbvnqOu5
	91bZ61mKVVxXkWtHrzmkoi5ghWP2k/MXFBRpTtq1+QvYyCCOigsupzaGAlfzAtVtv+WkroOto58Uj
	X06qms2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8x0-0000000HFEZ-1ucU;
	Fri, 13 Jun 2025 18:16:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6fA-0000000GxCz-2dgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:49:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 401AC44442;
	Fri, 13 Jun 2025 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vmdIHdbOmeoonnadlmOHGKHVDgOQGVeKLjeKUbgyLI=;
	b=OiSjPB0712lJRjWWiBkSb43D9iIVA3qwdEzQeTNL0kNU/BQ8xCk8ITRfAfmPXaBxnrib13
	UpXuQrQadmw+S+B+HC4UuNqct9WIaki5YLRFdRw2IBJpZ+uiVthfmgeHnN1sJO2qc9t2LF
	sjLVrHAGLAjKIcwxnYlW+Sm68GrjijaOvl0EeYRxXUQ5IQKnoevGWDamHMTx+1ed1JpN5p
	865cG3m19eRP/Eav3KsbNno1zoUrPHZHRjNQEvk4pxVIJ/QJC32dVJRK6k5bf9AmFkb8k0
	6UIyYDuhryNSyEib9lG39nS1cyAth0I8gF5bcmbneG53mOAwc4PQ150jSXjN8w==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:44 +0200
Subject: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-1-514cdc768448@bootlin.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvefgvdfgkeetgfefgfegkedugffghfdtffeftdeuteehjedtvdelvddvleehtdevnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepmhgrrhgtrdhmuhhrp
 hhhhiesshgrnhgtlhhouhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_084952_824422_B2A44EBA 
X-CRM114-Status: GOOD (  10.59  )
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

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v3:
- Change vendor prefix from ti to beagle
- Remove BeagleBone board variant description.

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..45fa1c61cafd 100644
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
+              - ti,am335x-shc
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


