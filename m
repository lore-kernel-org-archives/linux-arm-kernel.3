Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E3DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQ0brnuopVNUKDJwJH0/VSRDFgILtmVRCbF+TM2fmxQ=; b=LhoE0f3noPpGgR5VnOEwR8wXvt
	GBwrYRG8CqLmHDutOedwKTHSXgP9e2ssiVCjK0Hik0KVBBW3dlAz68uHLeaSs0EwbuRucwTt3BM0O
	8Ngl/YQqGK6l7/CBgoa3qBvdOO5l0HDLp51n01dkdqzCfYdBZ/ZtXyEMKConbNpuLRjXHM5RlvHwU
	G9Vol5iXvBBMxMjxkp8cnQ5hO5FP2B1eCJ1iOxlD1l3V9XuYa21HEH/FhA9+d3WH3GfGq+vQPfBho
	qEwlWAEBUcsMTN0sa8bsliUZqm26MjdHBXuNrz4gC8lt+J9zD085QukpDF7Tx0wJdFr7mXbvyLVBS
	R5tyOIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8UT-000000005mX-2Ynv;
	Fri, 27 Dec 2024 11:26:49 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8DQ-000000002zL-1Fgb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 11:09:13 +0000
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id QxqitH7tvumtXR8DQtzkHb; Fri, 27 Dec 2024 11:09:12 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DMtvshIxK8vR8DOtos1S; Fri, 27 Dec 2024 11:09:11 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=676e8ad7
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=wzO6rqTgGfghY9OkdcwA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tQ0brnuopVNUKDJwJH0/VSRDFgILtmVRCbF+TM2fmxQ=; b=MONGxl3WeJf0arOy1cPFbArXcj
	RMSebZo86+sT9oYvJlias60GqUv3Zg9+bheoQ+qKIRGcEtjIcWS9Q49pW/FhkQrHotmidpp4a/7/H
	OAU396gG20Kp/cyTsoO2pX+1qMTLqVSbAOANlMBYOMQ16ebVXZatJc+jfPKPOsdJcq5zHBK83sn7i
	UV4U+3Rq8EcP8C72VhG8Fc/dpyRe6TkTehNjDGnlENCkvLCOSTKpZm0vc94Hldj1AKepr5AiAvLTM
	OlOcy8Vj++TXUVQdbCTERtAYLlVL+JH6tR2wIWUweXeaGIB7koEcVbtue4/cLFp9r1nPHJOcRbKr7
	jNxpal6w==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DA-000bEK-2T;
	Fri, 27 Dec 2024 16:38:56 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:55 +0530
Subject: [PATCH 08/22] dt-bindings: arm: sunxi: document Szbaijie A133
 helper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-8-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1029;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jEGKbLhjRFmr2GAicFc1z+s3hUCh595jXAXzn9My3y0=;
 b=wGVr4ngKuSoVabYMJ83xGl1sX/P27vzNoNcVRiBreH5glgRC0hjGBmu8/xaRvpjz0+HQviRNZ
 Kl7VJO4tZIDDmoEuw1ZTkBz1LzFAJ32g+0k4pQHAUmeU87/GywdQTyk
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
X-Exim-ID: 1tR8DA-000bEK-2T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 238
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH+fR/Aitvn39xpMWsfAzpj4mpddfYOe+VD8PgAWtDLgyFXD73wI/0EoRC7GWza0JFXWX62/CMO0w7RDndFPejDOgjyMf23gMfrC4eepFLP4FyzT/9v6
 404O/6I+b1d7ijBtlJ9MszstIAIzAWlogt8QajDWqqGMNjxPbDMQcGUglnWW1PqvrlcffedddJhvpnveeBx30uii9Qk/pmUYq1+M6fnOJ7PMTYozVhbQcQSE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_030912_374277_B4E4A4F7 
X-CRM114-Status: UNSURE (   5.63  )
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

Szbaijie Baijie Technology A133 helper board is an evaluation
board of their A133-Core SoM. Add its compatible (with the
SoM compatible) to the sunxi board DT binding file.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706..eb19f8b1fe68 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -891,6 +891,12 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: Szbaijie A133 Helper board
+        items:
+          - const: szbaijie,helper-a133
+          - const: szbaijie,helper-a133-core
+          - const: allwinner,sun50i-a133
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1

-- 
2.39.5


