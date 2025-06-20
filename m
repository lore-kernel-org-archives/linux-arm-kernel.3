Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5A4C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSzxVGLEOB7OKY54YC5zsWFGGMZjH2rYSDjoNFA4NC0=; b=MMsALp1bxy8AQ21Ypdf6ytE+Gm
	1/aCZWD4gl4mVIwlKM2GsQHfVknueqz3eQ0QjRDbZaARGJUtoUlN7TStsIqPTZOGutvRJVmVPjMi4
	EsbQnMnVENMNMzaA1qZthpWwmlk55TAPfL9pl82eLnTwFyyfAqy0qvqbhzhzsD6ibhWPpmD9aFzB4
	tZ/w+zqvdHYSwoVS3Etj43Vn9rcvrZUERAwmkHyWHR1K6j4z0WCjNK7YGHDszQSUtwVWFwNKSO7CY
	oIh0wA3W0vkf866i+QhBIovEaRSIVCqei/hJmuS1jxmEAhl12E66EhkhpYtYB4I1a+1uvyeKQUSsN
	oDVE9HJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdju-0000000FzPb-2EzZ;
	Fri, 20 Jun 2025 15:33:14 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdYr-0000000Fx4J-1bYX;
	Fri, 20 Jun 2025 15:21:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEC2642EA6;
	Fri, 20 Jun 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750432904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSzxVGLEOB7OKY54YC5zsWFGGMZjH2rYSDjoNFA4NC0=;
	b=G9m0rreiy1pQnfTxYznAyBdGINBjaXemHvJP8Yv6pSWfb3tOk0ZwHXDE7XoYwaEj1tSpiN
	gO0VzxT7fCI/LPDFiwhA0H1ybk6Iz08o6rEaFDYmC20w2hAXcwOJBl0q25VjKxAW4ZVbwq
	7t5GZGmByyeaYRbl1me+W16D/Dr6hMA0CK2eOo+TKaFiftOfD0A/brSqsfs43Lx3FaOibL
	fgmmHvYtPZ7+siw4Z8LYzVr0li1B8m3FTxpm1fvs/aY5mjDHk7lYEirFgkmG2tk/BsQHAP
	My7mw+fo477aWRbKBownBK69j8iPxKSYKKmKo5fbhk+U0XTJsOBc0pq3bOmIvw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 20 Jun 2025 17:21:33 +0200
Subject: [PATCH v4 2/4] dt-bindings: media: imx258: inherit
 video-interface-devices properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-camera-v4-2-0201a8ed5fae@bootlin.com>
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
X-CRM114-CacheID: sfid-20250620_082149_559967_054A618C 
X-CRM114-Status: UNSURE (   9.74  )
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

Update the IMX258 binding to inherit properties defined in the
video-interface-devices binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index 975c1d77c8e5d24179e9cb8d92fe7b6798c4d2ec..421b935b52bcaafbee0aff5b5cebc6332409bd8b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -18,6 +18,8 @@ description: |-
   The camera module does not expose the model through registers, so the
   exact model needs to be specified.
 
+$ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     enum:
@@ -81,7 +83,7 @@ required:
   - reg
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.49.0


