Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5234C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qokwuBMm6huB2lTtorC/MIv/Y6cRg0wgade33/WE9Vc=; b=HtBmM7Kwyvn9ZphkdaopilIy28
	Ib5K+h1PqEL1H5/NTCxaJq1+D2On23ITn6T+zh5mXZ5fCYM5xdNl1tb/t0uXHzbKCXe+WPI66g33i
	iiov1AjinnRZNbzR8FhvrySTDsLf2+junASdshfNfZv+MD2/MuuRwRKNtncYbUPc+hcqON4pScBc3
	NEASMZAhyVa+mmcCeX8gAYDFFgjX1ISsbpKTzahtLxWYAHH+iEMND3FfLRL3vdGtZ0o/2UNjusItP
	TU2N/3eXSqYx/CZlk257ZI6ih1t6F1OFFn0hdaBUT2RKL31EwLIumb2Rf4ujlBqNOqzyE3O77NZxK
	T7c7GbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdb4-0000000Fxb2-0CYx;
	Fri, 20 Jun 2025 15:24:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdYo-0000000Fx4G-3RvA;
	Fri, 20 Jun 2025 15:21:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D34DF42EF2;
	Fri, 20 Jun 2025 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750432903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qokwuBMm6huB2lTtorC/MIv/Y6cRg0wgade33/WE9Vc=;
	b=BA8Kqu8WtAJj50BLhl/q9lm1Q2SH1pFyk7JjgDnV+CXfVUfLLzHrH0ccqhB0/c1cluKPdg
	ki2TbOFz0g1pcRTg7yW2BwGjDBMRSMIhhR2TV3ruclIylxwa/evJ+2d5FB+uQ1KotmXHt4
	zQoK9L7QzHPIae8NXpJ+43VqaALUKI46rkZs/HiUY2kKn3SHc2lENl6sUTdUZOYMYBrZrF
	eheGyzW+W+BIVQuJo1D/JlOMfC1FHlZXw+KiYj4Px3Hl1VeF/5WaJ85Yk8jl2nK6+xitma
	V/rXZobsHxoTucuihwCciXyq2+CGCGHvrFrEuWq6lVC2um39/gPpRxYvbn+Gbg==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 20 Jun 2025 17:21:32 +0200
Subject: [PATCH v4 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-camera-v4-1-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 ~diederik/pine64-discuss@lists.sr.ht
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopeimughivgguvghrihhksdhpihhnvgeigedqughishgtuhhssheslhhishhtshdrshhrrdhhthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghhohhlrghssehrohhth
 hgvmhgrihhlrdhnvghtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_082147_395644_103CC5B9 
X-CRM114-Status: UNSURE (   9.54  )
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

Update the OV8858 binding to inherit properties defined in the
video-interface-devices binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
index a65f921ec0fd24e449331772e39a16cadd73a868..491f2931e6bcdf5a1ad2cd4f9eb187055c3a7a2d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -15,6 +15,8 @@ description: |
   controlled through an I2C-compatible SCCB bus. The sensor transmits images
   on a MIPI CSI-2 output interface with up to 4 data lanes.
 
+$ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8858
@@ -69,7 +71,7 @@ required:
   - clocks
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.49.0


