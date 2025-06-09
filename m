Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DEC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=; b=HwojPpMIVub0VPuqpEoYLqjAzn
	4utRWno30cAotKt+E8VIMWhFcHqB9w4C92Nnj3+CrUFW+oiVUX/sJ08D1geC8iQ7wN0qaGT0r3Lam
	dsCvHLTE053are39g0v32qxohvb84PzgKq5yReaWDAocdKNN4gUUerXu1QhM9unfajqcJ5LPwgBjU
	hNjA9sdKUcNlqkKIZyiAAHgAzQnz5O4ICplLkTlo9DTRPKjXpIGDabwqlH8xwhcwuV6oB5ixtF9xR
	THKuIMQflvViKkqP++QTP+wTEyngpE5ebRv44bSMhfq0W/OrKsQb1cx13H5NhbcL1tez2VYyux9VK
	gTqTxS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfOe-00000004g9o-1Rmz;
	Mon, 09 Jun 2025 16:30:52 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOegj-00000004Z3V-2Nlf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:45:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CF7220594;
	Mon,  9 Jun 2025 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06HUies5V7PRfoIqtd4meQuakxr9viCcxBP1N+2s1sA=;
	b=UoMb7V90JShTczupXgSLtQVmxGlNn48FWlFY1dFphcg69udmG/2Pq3VxGa5LJLbUeMP4k1
	nEwHF1/Gjtdqu9HYNTYiHrJiKgbOg/Ab2qH2il7mtRUFWv8mYSIWE3l/WTzt5Qbh5RcFKH
	j/dLtEuy96ZHsq3k+Gfm45T7Tp75VE+GkD0raQ9Crlerv0yQEFtn+w7E9SBH3iWiTc56eD
	PDQnsCxh7GdrYA9wv/rBLaq9RkWCnTK1V8Ys7gkf8Hn4N/EqIYmm3ml3vgBGQjeVsb0iQy
	2UjDO6U9hSOchED4GuxwGEWlSQIe+A9PRsVXguMdaea1Bch6HoVuxH6Msy4/yg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:53 +0200
Subject: [PATCH v2 3/5] arm: dts: omap: am335x-bone-common: Rename tps to
 generic pmic node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-3-5278026b7498@bootlin.com>
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
X-CRM114-CacheID: sfid-20250609_084529_737462_20753401 
X-CRM114-Status: GOOD (  10.71  )
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


