Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B51CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oK4Ve9O/PRX7M9Aw9BNaO8rFPHLoVqmtNP6LUflFsfw=; b=rpF0/diu+xnHosicV9ixg5ZGt7
	JK05vdtC+sKU1BadQqPoBJuVmhORJfRhwBOjVjodHryR2V7v6AkRoBAR9+QmNn9I6Ebi86Zm/CBij
	flvvcHlx18bp+ckg0qSK0abWn2Fh+/rSXb804vlxqPLX+yZ1+kT2IbNTHu4pW2WOKADEUQWH2xDNF
	BLdV3jhSTIE2S+cjrYWiqMmXzFWQVIwSLzE1LnqQ3yXO6/jw5WTN508y5X9+1kLiJAaxCMhrLFIlP
	aQGky+euuLPZIQrzjt294Uybvt1oOiDFr68XQ+/tmsf4M7P7a1tVjz5+2j5RzLJnLrvq6YdKTZ6WQ
	6N2wmGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtgz-0000000Fc45-2zdZ;
	Mon, 17 Nov 2025 07:30:29 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtgw-0000000Fc3X-3FmL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:30:28 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 15:30:19 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 15:30:19 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 17 Nov 2025 15:30:18 +0800
Subject: [PATCH net-next] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251117-aspeed_mdio_ast2700-v1-1-8ecb0032f554@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAAnPGmkC/x3MQQrCMBBG4auUWRuYhEjUq4iUofmrszAtmVAKp
 Xc3uPwW7x1kqAqjx3BQxaamS+nwl4Gmj5Q3nOZuChyu3vvkxFYgj9+syyjWQmJ2Iny7T3HmmCL
 1cq2Ydf9fn1TQXMHe6HWePwe0PEVvAAAA
X-Change-ID: 20251117-aspeed_mdio_ast2700-aa089c4f0474
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Andrew Jeffery <andrew@aj.id.au>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763364619; l=1811;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=Mj81EjxdRx03SMF1BDIPz2LcJycE1MUESozyiljFuRA=;
 b=w1pnZrswHVUrLtVnSbCd+/kYz2W6un9gP9YIqrCt17cyhGIyuTN64gvRCKimRyU5NtSUScT/z
 AFYvOFYRWI/AaJbK6RY9ErunXmDpLSkNe1srNsJn009Mm3M63KvZK/6
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_233026_844708_4027EF3E 
X-CRM114-Status: UNSURE (   9.88  )
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

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
index d6ef468495c5..1c90e7c15a44 100644
--- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -13,13 +13,19 @@ description: |+
   The ASPEED AST2600 MDIO controller is the third iteration of ASPEED's MDIO
   bus register interface, this time also separating out the controller from the
   MAC.
+  The ASPEED AST2700 MDIO controller is similar to the AST2600's.
 
 allOf:
   - $ref: mdio.yaml#
 
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


