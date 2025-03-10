Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBLy6wqoJxrI6Sq3aEgj7fgqeaYRLpYnXmNTnu+lE3c=; b=MGJs80B1oto8EuDtKHdGAb4S64
	gvNbweHd81sRkeu5TnsqZcENcJkVR68RyHoFsFZYbUZd06a0kbXCBS5zVtA6A7ve+G1aDOXbEn32A
	PYLYOkam5uKeGFZ0qm6h4evI4gN0d1lzXI0GxBQk2+CwLzggX0pkxxaY6JkcNhCGD4Tn/5I35CTgD
	oD2lp7ZTLxK2f+qhXZGABCD76qzPcVIYvVup/Jb0uonmEbDG6atH05QcdH8teQm3oJMvJSCSizXp5
	L8BPN/g5algOmBQIavwdGF1Z89nGkBReudZsafyBIPa2nC8CS/pj209N/Tb0BqLkttJx3+N1vg4bb
	VBUoWL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgCt-00000003NJS-1aen;
	Mon, 10 Mar 2025 16:42:23 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfV9-00000003IGu-35vB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:57:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D44544199;
	Mon, 10 Mar 2025 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741622227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBLy6wqoJxrI6Sq3aEgj7fgqeaYRLpYnXmNTnu+lE3c=;
	b=ngbR+vkBc9xzIp6DGmi2QfjL1d5SAO0Xse+YW10wkME9OSgksZMofslMUhRPAQ0jvi9wAR
	xPe/Zgp6aajwlTARRWxqK4PTZ8QSaiFfqGKi04mhnWxlAVArtShUPtIg/GekJa/v5EF+5D
	5dLqWiGtqH1CRFPgcJbL2aTm7LWHhiQzqEimFffoWXeqQz4LgjcIvEGIzCFYJl6wCqnyan
	ytGyUZfOT1h5MTgIIlLU5OVysGTQqHD5cxExmXjI5RgxOu4urIv98hV0kRA0TqneMEio5R
	rxyC24nPF8i8033WyD1dRmF526YVzTxI+Xhvv0wwuH4WtkIjtxdnO2ZqI27uzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 10 Mar 2025 16:56:07 +0100
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-varsom6ul-concerto-dts-v3-1-551e60713523@bootlin.com>
References: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
In-Reply-To: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TMVSI2zGfqwniwiuhzluD6wQ3DWKu2knPI+0dq4y2jo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnzwvRKAtb9RX0+IISECyeAyAc+PzHjC4KgCpRL
 M1VuemYnbuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ88L0QAKCRDRgEFAKaOo
 NmuGD/wJGaqSrv7s/cs4ENQzEcKbTBf1mrVlSz8AIbtBRQUki2H/rO7VInhseA4z1n3EDJwTixp
 ZU0YeVURTIECM7HE+HH5QaNvGMBrsYwcdgnRUzYzxSAD1vTRtYo18+KGnkc5bfacBH+zx8MBILI
 jAv+I6ftaiRvQJFn99j1DXh1Yp4umV09+tfr8eOsWry+fFxHRw5TSL33AwgBt/bP+RZP1J7Ri7k
 oHQHkWth92CyTLHZFiHGf5YfSMI76EOB787BaRIKgPGTjvUVMYSEkqT1YKkhUGYb0Nscv3o+y/F
 333YMY3kwxG++4bWOBex3D2iXk51ZO2NDOM2TFNEh7kufO/X7Pm2hVbhiPVwqrtuJ5WAbzVPzyR
 NP9vtBX588GgZRSS0+t07x3OnJbkXsmzxRBxzm50n7n//JDu7tYJV1gklf9LoRTn2tmAwVTw1IA
 hFNRrD+PALQErnnyjqsvLUqLaYVE1ysk4IvbkzGKCqPW3SZxWxDQLlQmKlMUA/rlP3chaISIjJV
 ug7utTMqrGaleQry+cDI4foIc8VtyawRlI9CS6wWyfasu8GNT2mLC4zOFawMQ659hGYc09ID0yp
 H/H0NV04HJtI9V4PxK7gZQx5fYYdJMyfwooo+/OfXOhi8Ll87BPKK404SNx9IRNQyxS50SqQPAm
 +jIxPYDMrwIEFtg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeljeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrt
 ghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_085712_190744_DC8207FB 
X-CRM114-Status: UNSURE (   7.93  )
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

Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
Concerto carrier board.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0db2cbd7891ffb361e0ac60fe6be66e381b2a8f4..a8f8cb845a2085eb13594adacf33f372185e8b0b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,6 +688,12 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
+        items:
+          - const: variscite,mx6ulconcerto
+          - const: variscite,var-som-imx6ul
+          - const: fsl,imx6ul
+
       - description: Kontron BL i.MX6UL (N631X S) Board
         items:
           - const: kontron,bl-imx6ul       # Kontron BL i.MX6UL Carrier Board

-- 
2.47.0


