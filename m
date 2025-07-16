Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7EDC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX/LhM0XGTPFpXq6PulOm5cC+DI6p0qBV6qG8eHjyLY=; b=BvE9eW3lnSOZvEELceVD3/C13g
	zy0348nSe/Aa0d84dTOybhwM95a4NQej+mrqyG1KGsPCfMu3MnMX1yIJ84omWXcgL2Lv+ePe5aipu
	roNTwuURfsc2lcyCHmwzs4nIvMHssfbwUQCwTP5V/V6KWYVnre1dTXQ7LSRZf0eApCGQNjDWb604H
	lOIGna09oKmsI3fJsiXm7htthIiFXVLTmjvXtPy/trpwM3GjSHs+QxE0DrvxTyAvQMwGW/49thYzy
	sFH9uJHVg8BuuEUrO6ivTjVgSJbwbV6XG2XfsSInTnUTsqf4rcomFTD72bS/qPrIMmax4ZhRn1m1r
	P7LK2ZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7I1-00000008R9o-0Yi1;
	Wed, 16 Jul 2025 18:55:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7D6-00000008QiJ-24Jw;
	Wed, 16 Jul 2025 18:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=wX/LhM0XGTPFpXq6PulOm5cC+DI6p0qBV6qG8eHjyLY=; b=WQQvhwWf7yBG3Ewk+e9vfV58cH
	hbEkT6JNw6YW8oiYnBuXcmRgVbe34uwWPAxDYRCactrW6wAtGroV5Fida6vvb9VQSv76TuZxXldX5
	AtwW+ab1QNlEcXCq36whi4oiQ9XL69z2K7N8bhiNh9h4tYvdJgu+Jf1NBHpy2nEXNbWNO0S+tEdXi
	i0AfJCNHdvBPn1wzMIUk7977q25f4sRz3PQxraFoyi1oHy8zDC6oDwf+bDuPBju9lOjc7VjK4HRTs
	V6XEU5j3MwvemXINcU7d7mx66SvEROGnufi4WqxzW9M66kBUreZhfh+skXVv4tdLjj/vgO+X2pgH4
	m7qAbOIg==;
Received: from i53875a74.versanet.de ([83.135.90.116] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uc7D3-0004Hf-Uc; Wed, 16 Jul 2025 20:50:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Wed, 16 Jul 2025 20:50:26 +0200
Message-ID: <20250716185027.2762175-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250716185027.2762175-1-heiko@sntech.de>
References: <20250716185027.2762175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_115032_561491_1C3EBD6D 
X-CRM114-Status: GOOD (  12.31  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390..8dc83263c892 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1164,9 +1164,11 @@ properties:
           - const: tsd,rk3588-jaguar
           - const: rockchip,rk3588
 
-      - description: Theobroma Systems RK3588-Q7 with Haikou baseboard
+      - description: Theobroma Systems RK3588-Q7 with baseboards
         items:
-          - const: tsd,rk3588-tiger-haikou
+          - enum:
+              - tsd,rk3588-tiger-displayport-carrier
+              - tsd,rk3588-tiger-haikou
           - const: tsd,rk3588-tiger
           - const: rockchip,rk3588
 
-- 
2.47.2


