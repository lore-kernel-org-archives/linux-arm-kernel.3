Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72E6E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cTQ7dIuLzDTMKdT4MZZitwWUZLarutprzerK3v04Kw=; b=xbvWPQtapvn3/9b0uv3ayDwxUQ
	yL77iZX79iwJVVK6PtI9zqZaLbe2KViij5Qc8sLlyi5CBWnKCIPJVUBCij1vCMPhHDIwhAgsfDFSe
	Ws6ZTChudgUWQMuHmgxbR8czqWxdmgzayQWtPhxT6Lfq1PUUWKFU3Or7GKJQDLsysW8h6g76deC91
	uwDPlpY4jPhBwgFiUt/V9EXFcrgVW/zLbAnjGwGldAegqGwK4cqWHM+2MHG7nPX/Ppz6IzgAsLkDJ
	kqxyDLhsYqvTLMsuHrN11rvZR3JPh1ACPX7KrDhD8R605qvGf2aoK3/+eWVXn6fsUMzCI8VO8PJNW
	OZ6iIW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA3l-00000000F4c-1HRe;
	Fri, 27 Dec 2024 13:07:21 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9yK-00000000DPT-0hLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:01:45 +0000
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id R46ftd7xiqvuoR9yJtyHhl; Fri, 27 Dec 2024 13:01:44 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yHtxwZhN0LRR9yItqdBw; Fri, 27 Dec 2024 13:01:43 +0000
X-Authority-Analysis: v=2.4 cv=erfZzJpX c=1 sm=1 tr=0 ts=676ea537
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=6Yv2FhbjKrII3ob1PCcA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6cTQ7dIuLzDTMKdT4MZZitwWUZLarutprzerK3v04Kw=; b=F3xXgcoX9ktxnTnZTRr1CL67xf
	6UmNwHnPb6nZAVix18evDOrLL7zE+MejmiDeuKW28QLVftVdZq2h+tSEoEWXxCz7e9fKJxHHom2In
	vbu/S12M5FyluLBj0t/sQDecjEYq0uTGo3NlmPoE9xHjlTJcbUb6XQ0W0wA1u6OgJoFCVGyjnavYo
	jEI65DKXh+AwrNzoI4MNi75iI3lCj9g09d3Vu7reN3KJk4lt99kPkDnkNlmyx5gOLIxBFAihvoT99
	mkHwVlhXV+FT8qLPW/rhzsOAszlQrd/mHXnC9jj5Rt5Rwm2CK7cN5uq/+LG8JPENVC3gZ/ToGdqjs
	IErK2ZQw==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yD-002EaQ-2A;
	Fri, 27 Dec 2024 18:31:37 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:53 +0530
Subject: [PATCH RESEND 04/22] dt-bindings: clock: sun8i de2 clock: Add
 a100/a133 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=1302;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=oZlIUbxg1cWJwuwv38BcMjpxkWeQ5cHkxaRh0Lf8Dn0=;
 b=swo9HdKJsdunmD/nPYdYttUtU1l2mhY5S9vLJNNbt3Lk+EGVKMvX4bRB8pzSp26tMKsBHMmfC
 oVkIg2F3xAfBT8IoZ1oUqcCkAc/sniyc05IBs93ll6afKn9ntw5uWAF
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
X-Exim-ID: 1tR9yD-002EaQ-2A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 145
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfF5ZFfHCmZ/Jh/HN4w+iDzZIDZAIzgAHzhoAQHWPMecCRThmIy4Di0Db+zXe5LZIhF3WqKWjBBoXILp70c/vHQxVnEI7sKckkTNqy+9/Sp2pDoPpX9sP
 s9omq/Ebgg2BB8vFfTLrRmCoCE2UQdPDf8jxDlNZBAvDSxKiZsbV9aBiy0y5SljLGnHzjBerA/73gyTNjOqCZi8WrruMKGbBofWU2TI3tUFRtNmosq6vjhTl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050144_223188_2082596D 
X-CRM114-Status: UNSURE (   5.60  )
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

A100/A133 uses one mixer without rotation support, which is same
as sun8i v3s. Add it with fallback to v3s compatible.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 3e00905b66ca..ed038967929b 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun8i-h3-de2-clk
       - const: allwinner,sun8i-v3s-de2-clk
       - const: allwinner,sun50i-a64-de2-clk
+      - const: allwinner,sun50i-a100-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
       - items:
@@ -31,6 +32,9 @@ properties:
       - items:
           - const: allwinner,sun20i-d1-de2-clk
           - const: allwinner,sun50i-h5-de2-clk
+      - items:
+          - const: allwinner,sun50i-a100-de2-clk
+          - const: allwinner,sun8i-v3s-de2-clk
 
   reg:
     maxItems: 1

-- 
2.39.5


