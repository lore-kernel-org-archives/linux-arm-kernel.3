Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A929C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4xSW+80MqoDG23KGcCM5xT/Ae+6OLrjp6YJqiTmAcg=; b=a+F6G3BLIfrvOPKcQJUnftdwj9
	cQdccM2pnVdAmev0VRcBksYGODgIlI7cVOxJlxL4ANHNBOhZyUvGEaoWTXErUJLmom1CSMYs3+UvM
	M86yeAA+oNR8xIelsZwrKHFms1fl71akFfTNUpgfgAvG14WOMYaw+gMf2qEzjniB1BAbbzJ/yW3Ua
	L/pfO9eTgMTmbl5Gv7SofobSGRc3iPcRxoJ8d66MjI5lpqPta8ZvK5EHpidb5h52uZ0DABIGmkYzW
	GJ3+XCLkeTUVJkkpFof9I6b6kNyhrIFy7Yxs2WIl8u/hMMNIDQrRHo9YuXWLHab4WsGT12zAR8mqb
	NZr604iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8x2-0000000HFIV-3zNi;
	Fri, 13 Jun 2025 18:16:28 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6fC-0000000GxDi-22h3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:49:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96DA24444A;
	Fri, 13 Jun 2025 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4xSW+80MqoDG23KGcCM5xT/Ae+6OLrjp6YJqiTmAcg=;
	b=Wp9VUg8PovgxA0M9BNy/D7GFxOFV0At/cEaSO6bkpnSQZPOFlgtSy1Rnowsf8RODLwjha9
	SXNhn0Gh0jB8jIRuJFDUjcqmLRL+/qfiMAXk8zXqkI1OAx5pCdjtQsmyQiGS8tA+WlUTwG
	FtA5ZRqSgV39ErgkBJdtxw4oCdXOVpMi+lzHUDQIbd7QT+H/dHANhRbvjpMOUkRR2P2PCF
	srp0pVRwf5OMxzvaC0hEDeAy6rpiyCi+BRR3TqKcO9lL90T7qN26bMN2BBCH1uZiIXk+Ke
	qSKSTMOQhfd7Oh5PcdkOl/bm6RLZPRPiP/mXzKQuakTX/kE9xvkxkCc6U5b1Vw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 13 Jun 2025 17:49:47 +0200
Subject: [PATCH v3 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-bbg-v3-4-514cdc768448@bootlin.com>
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
X-CRM114-CacheID: sfid-20250613_084954_685550_AB47336A 
X-CRM114-Status: UNSURE (   9.20  )
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

Document the seed,am335x-bone-green-eco compatible string in the
appropriate place within the omap family binding file.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes in v3:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 45fa1c61cafd..b8f198a7b763 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -123,6 +123,7 @@ properties:
               - oct,osd3358-sm-refdesign
               - sancloud,am335x-boneenhanced
               - seeed,am335x-bone-green
+              - seeed,am335x-bone-green-eco
               - seeed,am335x-bone-green-wireless
               - tcl,am335x-sl50
               - ti,am335x-evm

-- 
2.43.0


