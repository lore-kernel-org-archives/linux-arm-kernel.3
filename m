Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA9CF64B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 03:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAJYPrM4K5gSwb8aiZs+R+QjqSI51/lCfO33+UlXeXM=; b=I6i1J1g+V9N0NC9aPkBm44dTig
	b2kJquf6sL32gHQTLKg1ifrCkGdV3JeYmvdrtwN8mPzr4lIf4jhHvmXv0lWVNw6nvyLZp7GqXBBy0
	H0CaThI0Kp4EFkXOYzO9syeQqImKEpMTyoMuhXFn7oHN3loR4dal0UHo+bZdgvIch+IxoKjzBiVye
	xOsSsAB5tphtyGuiqVt6AsKWIPwKC+xlMoByXEpKpAQgX949uNu6s+/xQ2RMGjM/cPDW4buvsWf6Z
	Uh6+rCiPPhxoxgjPQITKaAagfLxn2q8IDjstESBxnHS90SeubjgNbhrEQ+aoQYMOFAh+YPW+nguzJ
	OCh0Gg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvin-000000066Tp-07DF;
	Thu, 20 Nov 2025 03:52:37 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvik-000000066TS-2UiE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 03:52:36 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Nov
 2025 11:52:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Nov 2025 11:52:26 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 20 Nov 2025 11:52:03 +0800
Subject: [PATCH net-next v2] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251120-aspeed_mdio_ast2700-v2-1-0d722bfb2c54@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAGKQHmkC/32NwQqDMBBEf0X23JRNGtH25H8UkTSudQ8mkoRgE
 f+9wd57HN7Mmx0iBaYIj2qHQJkje1eCulRgZ+PeJHgsGRSqWkrZCBNXonFYRvaDiUk1iMIYbO9
 WT6gbDWW5Bpp4O61PcJSEoy1BX8jMMfnwOe+yPPlfc5ZCipbsC/GmprrW3a+VyM5X6xfoj+P4A
 pggdPvFAAAA
X-Change-ID: 20251117-aspeed_mdio_ast2700-aa089c4f0474
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Andrew Jeffery <andrew@aj.id.au>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763610746; l=1764;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=wmlwbzLwa1koSK2nuP5aUDcsxGgFbO+ySPwBTpaVBGE=;
 b=EQwlHKt16UBrHnbKrYwuae5GVZPaRI0ZvrdLxxtPSwzgIl19qVZQn7nEwAvXm0CflvUE215b4
 ZoofOto8IIyD90g3yw629h1lKDYScsXryAa6gTti/xdU6fbiNeZHY7F
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_195234_661344_479C8680 
X-CRM114-Status: UNSURE (   9.34  )
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

Add "aspeed,ast2700-mdio" compatible to the binding schema with a fallback
to "aspeed,ast2600-mdio".

Although the MDIO controller on AST2700 is functionally the same as the
one on AST2600, it's good practice to add a SoC-specific compatible for
new silicon. This allows future driver updates to handle any 2700-specific
integration issues without requiring devicetree changes or complex
runtime detection logic.

For now, the driver continues to bind via the existing
"aspeed,ast2600-mdio" compatible, so no driver changes are needed.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v2:
- Remove AST2700 description from aspeed,ast2600-mdio.yaml
- Link to v1: https://lore.kernel.org/r/20251117-aspeed_mdio_ast2700-v1-1-8ecb0032f554@aspeedtech.com
---
 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
index d6ef468495c5..a105dc07ed12 100644
--- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -19,7 +19,12 @@ allOf:
 
 properties:
   compatible:
-    const: aspeed,ast2600-mdio
+    oneOf:
+      - const: aspeed,ast2600-mdio
+      - items:
+          - enum:
+              - aspeed,ast2700-mdio
+          - const: aspeed,ast2600-mdio
 
   reg:
     maxItems: 1

---
base-commit: c9dfb92de0738eb7fe6a591ad1642333793e8b6e
change-id: 20251117-aspeed_mdio_ast2700-aa089c4f0474

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


