Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31D1C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 05:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXVeCZZvp+A5NNYGs2s/dwTCkmQjG5Z78vkzsXIMdK0=; b=hDa5ggHJel7kP1C+YuMnAlcO84
	maZ6TRPDEeWSjckvj9g2u9nx8YJmcgLTal93MawuFGpIxm5WlgsFjW+9R6Jaq5YYJMvOebdAB8lyr
	LmxcdDDAE0RlqKJCJ2EokZ/xiTp/lJ6s6gh/+3XsqL48ZnnRDSaFfsPxwS6/l3WEZixfvzK35i2Vv
	uWqBKzOpgNIm/AINRXfYwVdV18UuzvngXx3R5+ZcQqM77YuC/X7nP/Plw8IlVazUUFoyF8rhzxX27
	r89rCDk3KDKa1xOBXc6B0XBIV3gC45V87K5AFN4MdOoFe3kH9cnhVJ7jU71qyKw4cfVfwonSojGPA
	vpD0qGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVOP9-0000000GQnc-3eb7;
	Sat, 28 Jun 2025 05:47:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVOMq-0000000GQWy-3g0T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 05:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC58360052;
	Sat, 28 Jun 2025 05:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC7DC4CEEA;
	Sat, 28 Jun 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751089486;
	bh=mYZq/vP+pCKa5Srrcf2wrhmjIPn3LNdwFBkoYlVxsJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vn1IiSQbeMP6wuA2F27dtSqdbp2ArbL00yPePouVZSblzDKNG8yXiOgK+nnkNuJaU
	 RnLf+f1S3+2cm5EFSVwrYLxHVkJUnAHPMHb95uceI3iP8OsmV0CPFEWP0vKpb94jtY
	 MM9eU+jbuPpIDvleBvdNxN6GQLh5Fq5mdutZKuXAdNnLyXAiR9tv4K+1MzQatOHG1R
	 NANJ+P5LgkglaGAmnQKcbSIdkd0REHSyfETz6YqgPpmhciSz8BrFG+9HkmWeNAomdV
	 2xHC+zSqtOic8OqyBGAv0nwayAAKBADruI0Ots7SIlBd3y1OSV8/Oj5ZPrQSiGwh8E
	 aNO7paZO7eUSQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 469805FA91; Sat, 28 Jun 2025 13:44:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net 1/2] dt-bindings: net: sun8i-emac: Rename A523 EMAC0 to GMAC0
Date: Sat, 28 Jun 2025 13:44:37 +0800
Message-Id: <20250628054438.2864220-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628054438.2864220-1-wens@kernel.org>
References: <20250628054438.2864220-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

The datasheets refer to the first Ethernet controller as GMAC0, not
EMAC0.

Rename the compatible string to align with the datasheets. A fix for
the device trees will be sent separately.

Fixes: 0454b9057e98 ("dt-bindings: net: sun8i-emac: Add A523 EMAC0 compatible")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7b6a2fde8175..19934d5c24e5 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -23,7 +23,7 @@ properties:
               - allwinner,sun20i-d1-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
-              - allwinner,sun55i-a523-emac0
+              - allwinner,sun55i-a523-gmac0
           - const: allwinner,sun50i-a64-emac
 
   reg:
-- 
2.39.5


