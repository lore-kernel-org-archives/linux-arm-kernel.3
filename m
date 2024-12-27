Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071DE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlbwVthHYeKY8tBVeUkULV/njVfk66cYvdQ4ontQNdE=; b=Hsubp6Xli8pdtTyo9tA+XQ3nEb
	Zb/RMFFTixtlUKfXsVbMSOld94UC8dBO840mshwIVJpw1zcjSeIx3qr3ogoNi56gecq+xJTPLVm41
	Q3xL+LaiNSUOHstBfkVCBmgDBPZmG/MVlog9xijjyILdGrfyleXib0IIBAenFMQWiurCG1Jb8CxGB
	W6rOUEWNP8/+1iz7+FDHeeZYnUwvlv71EKNxfpK161yGhdOJfuBlUBaRBV1roR9wydSlEMgB+WlWD
	YNKTJlZpDqMwRFvDLYPnFtX2xPn7lxvH913lRybl8Kq5ZMBSrSGQt76NgxjMknWziCCTQg/o5kVd3
	/dR75sPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8Jh-000000004RB-2l6Q;
	Fri, 27 Dec 2024 11:15:41 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8DB-000000002iT-2PSX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 11:08:58 +0000
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id R43Atb8eqnNFGR8DBtXDHT; Fri, 27 Dec 2024 11:08:57 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8D8tIy5JcEKuR8DAt3tMA; Fri, 27 Dec 2024 11:08:56 +0000
X-Authority-Analysis: v=2.4 cv=Z7YnH2RA c=1 sm=1 tr=0 ts=676e8ac8
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=WudEoZjip3EUb6QGksoA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GlbwVthHYeKY8tBVeUkULV/njVfk66cYvdQ4ontQNdE=; b=pd53rFz9ZJkDS0ouaO8nXwdKE6
	FgHRYmxghu8/C2Gp48uQWw6OKQebOjoXn7jZ9y8lBK8YVJjA3R4durg3pUII9J6hSf32+h3Xuaxbt
	fktY7zl4Y/Q2rzuzMG/ecJ3Ed3nu5m4iCzwmJmvHrwiGdu2sWc6XkmVsAOQFm5Dxy/r1oZHF/yLhg
	xTL6KMMrF6xpBfxwrjjTlf843o3Zt2nC8likCcUGyfsGi42eXcpVneaurhz76z0//74z1WFUwdeds
	ygywXvgDVaBnNoxWdSeJRJSeKpxrElC9Nx38eF8u5VNpV60ORO7KdQvQ+HMwwUaa9FaiMnk78hM1R
	KozSPnMg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Cv-000bEK-2Y;
	Fri, 27 Dec 2024 16:38:41 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:52 +0530
Subject: [PATCH 05/22] dt-bindings: display: sun4i: add phy property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-5-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=924;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=m2A1ofv8GeCezN3hco6q0KsR/PZlS1bM75pboayywLg=;
 b=aS5TfkN0UGdAKzZY1tjWhZEUGcD56oslubatdE1FDBJANXReuqtfiSMZ4B9utGqfWXKwtPxyQ
 ZFLVdqscNOMAmDrol5bN4AAZxErDo7g2KTOdZCrfzstRqCYADh93TL3
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8Cv-000bEK-2Y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 133
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCqgQsvWAVb2UEgmCHM8aqJEYqUoEBOmbErjk8CQFHQqWOrnU99ZQjeGWfuXgyk0ziP4zXrbLmG7nqpQBPA7iTC3eybGSlXaQP59AE2JNxPfg2UL1UCq
 0Yb7g4x8IM75EnbBUQJCrN9cVRoWHxOzYY3vCzC3gKkZyyW2YeKyPrkPVDn4gBWp5mVftlxVOp+j8c/iAgFs9C/5pbr7tVqXqAjyDUJE36bHjqbBswSNPfja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_030857_690891_BDC83DF7 
X-CRM114-Status: UNSURE (   5.41  )
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

lvds in A100/A133 platform uses phy from DSI block, which needs
to be handled in phy driver. Add phy property to tcon with
generic name 'phy'.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..6d8ae781c230 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -115,6 +115,12 @@ properties:
           - const: edp
           - const: lvds
 
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: phy
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.39.5


