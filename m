Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C243CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbYT9rGF4WTOZUWuy2XkjY1pOS+7bJ1poExuGFLgzIE=; b=YouahDzE7NqPN+6dqGN16n3PDs
	iEMVYoJRTGnnwJUYKRLc4O4QQj25/beCatL19/4p/7GY2ScTTCiT43kBgj7qGtln8604IjqT8sEVL
	47S9WvJsIzP+7aiWShsvAqNJqabnZXT7AqA7hw3gSSSIN+lw1ozOCrFXsShMeUE+QYDz9TIvyRYal
	g39nt2kI2Z4EASfph6jO8RufRULJGqa86cfZyrYmeSxiiopXbyjlScmt0lnNLgD8DPJVb/LBRQGZP
	fbXitNxIw1lt2YMCjQhdVAfoHCEGUFzzKi4F/X/Q751qYxXxu2uK9xIh+d7mLvQddteLGykX0Ovc8
	eOFmXUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF5-000000061qD-1Vdu;
	Thu, 23 Oct 2025 11:12:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF3-000000061nw-0rLV;
	Thu, 23 Oct 2025 11:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=nbYT9rGF4WTOZUWuy2XkjY1pOS+7bJ1poExuGFLgzIE=; b=0U2TPhbshCBFcG49CHDQa20y/Y
	57q7qI+ElOOXrIJbgzqPtpkqOFc9yo+c1aOZdkYrfgZyi0oXbCJnViJi5nqQ2X1/IU4WZFC787MiJ
	CnMs6Ltk6ZLw/1ozmOJiE2GRi/dlHXFZa3KXRTjs3jO6DyyjD2JWGg7ik4jmFOkAy77EkqNudS4wV
	KyhIL6M9XlaxAheczHoDPPz8vERtikTSbQ+y92uDj02XNegxJ/UKnMiPVZyYGS7LCzAGS2GT2Db2T
	KbejY7r4ShdyRnDUYiccu9CTsId98uNJ17PvJKUdnlmC6egkeXMd9ZZ6qUQuRrJy04/DhzZ59+o87
	sD6WK2XA==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBtEu-0002w5-RU; Thu, 23 Oct 2025 13:12:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: net: snps,dwmac: move rk3399 line to its correct position
Date: Thu, 23 Oct 2025 13:12:08 +0200
Message-ID: <20251023111213.298860-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251023111213.298860-1-heiko@sntech.de>
References: <20251023111213.298860-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041225_250297_852EDC7E 
X-CRM114-Status: GOOD (  11.28  )
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

Move the rk3399 compatible to its alphabetically correct position.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 658c004e6a5c..28113ac5e11a 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -86,9 +86,9 @@ properties:
         - rockchip,rk3328-gmac
         - rockchip,rk3366-gmac
         - rockchip,rk3368-gmac
+        - rockchip,rk3399-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
-        - rockchip,rk3399-gmac
         - rockchip,rv1108-gmac
         - snps,dwmac
         - snps,dwmac-3.40a
-- 
2.47.2


