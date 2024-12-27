Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4931CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrQzcpsEZrRxzYneklGMKbZSVevXccoK1hLw4KZeU8Y=; b=grAo6TQYPnhSaM7suL3Dcxy00u
	1YUVZ46NTmci419bFQ9SpuMFsejW2Q02983ZK0av3qEHdWupIlCPVu89FSUnJ8yKEgti+ULBoxoFs
	1XeW3qmjBSEy37GD0t5M3AHXORLymzVJMN6r+IoULL9x3/kboQ97U8gUcr4iZiaQpNgpDtD4UGAqA
	U+dmYqW3ty1fNBEryl6aCSqQ1czO4WbHoRo8pFFquxPDvDxkd9sNG7htY8iGlpw+uIYsy+Redw7WD
	NkyL3sTwMOUp8SwQppzCoV7Y/va8Pi2AEhKWQs6/OaQt5oog7X5BBbrgRD99rlN314/rpWAPmRku1
	Dz528IEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA7A-00000000FQR-3FV2;
	Fri, 27 Dec 2024 13:10:52 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9yZ-00000000DNu-2p0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:02:01 +0000
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id R8K7tFWXPvH7lR9yZtJj2P; Fri, 27 Dec 2024 13:01:59 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yWtzT7BZTzLR9yXtOcJy; Fri, 27 Dec 2024 13:01:59 +0000
X-Authority-Analysis: v=2.4 cv=L+wbQfT8 c=1 sm=1 tr=0 ts=676ea547
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=YmDlHjd7AAAA:8
 a=vU9dKmh3AAAA:8 a=L4MHaItcyTsGJ2lxC4sA:9 a=QEXdDO2ut3YA:10
 a=jsfG_yEu7aiiUYXEnMLs:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VrQzcpsEZrRxzYneklGMKbZSVevXccoK1hLw4KZeU8Y=; b=a51Ou5ltEyha3iBDcWn5xra+V2
	vQqFzERbZ0rt9kFCqc8w9FX0QEAQtgrqs5g1gddGdvGTCcSLHCYT7ITmAlacFjuMXMdfHHYHK9CEP
	drLxhQ6lB8Cxl8t04881yaMHOeYKO6QvZdyyEOAw06RY9wfa1xWybD58toGKC2qOVIhqkVSP3yfi8
	zxtb5loyiAZXpRv4SNL2HfSrb2QMJsNoADJuZRYTXCBJH2klz7k3zKkFv0Eja0rt7eCFTqmdC7O0W
	zsKsxyD1CSkeP2UKzED8LmD8An4/zhqrOcMvudDcGI6veQjrZs5s5WNeZOBblI5gMr/Nen+ARAcBk
	RpdZ8QBA==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yS-002EaQ-1d;
	Fri, 27 Dec 2024 18:31:52 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:56 +0530
Subject: [PATCH RESEND 07/22] dt-bindings: vendor-prefixes: Shenzhen Baijie
 Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-7-abad35b3579c@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=835;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jfPsPwWKRhhV21IwFSRmL+uw8EZXVaV/9179PemDy/M=;
 b=lni39rwU25tnv69AAsJH7qvLK1kIIdxSq3e/GX7rwvDNC4wilfdY+0MugpYhJrowi/F9+Z+cz
 48qgQQ/WM3lBnpd731RdJZrm8k03+QmqRSLDdt6rDXXjsYlKkYZ0T7K
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
X-Exim-ID: 1tR9yS-002EaQ-1d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 232
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFO9vLKDIBlVAj+dbTDzUEnJCuDb38CCr1UkAIo0B+737AJewtV9R0m5Eq4Ignko1DaZ/0B0ds6A3bvLL1uCsNpdPmcywET+bKsbDAv+j8NtpP/qkiwj
 RYHdNgLeBfDV5KDBD28uzblakzL4nJlSeakI4pccTM8HMkiNl1DVJiEkiOKBCqkuLTCG3wkutLKRBQO2NSmrRG/NIT8WL4L5UOl2aKlyIqPSScYBQ1y9+CFC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050159_736634_915B19B4 
X-CRM114-Status: UNSURE (   5.03  )
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

Add entry for Shenzhen Baijie Technology (https://szbaijie.com)

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c7..81cbc8b6b195 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1466,6 +1466,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^szbaijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":

-- 
2.39.5


