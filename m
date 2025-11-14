Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F3CE7AAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXKhvnbnRDnIlJt2E/ftcbaIRr7slR2nNVEf95+X+NM=; b=4djN1VMEyxXwRJK3kdwh8ONMlr
	q+vKbsSV/fqTO6YhyK96PoSqBc5aJG95VL/cCYdf0RbuhAyT6NDku1X2Oa21HWn+IuMY53Udp14g3
	BmXh0KNEYUzldOP0cJjolcDFxogdq8RWduVQy1LoQl4Lz7ckkCOzSYXWMJKS7dwZfN0WLAMAi9P6v
	1PJVvGwGaZlHXeCIOuLYEGFe7SZ9J/rbOmjy+ErIC4WkjvY/4oMcgBxD5sF6C0YWZgtLj1H+oUUaq
	pURIJ5wHnAoimP4gDC1+tyh/gg50DbaOsUKii+4zqWzaJ2xm7nAvVW3hJNCj+QZbLJZX/t+jq005Z
	GP7DmFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqld-0000000Byqr-16xL;
	Fri, 14 Nov 2025 10:10:57 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqlZ-0000000ByoE-2Q7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:10:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
Date: Fri, 14 Nov 2025 18:10:39 +0800
Message-ID: <20251114101042.1520997-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_021053_616550_F599217F 
X-CRM114-Status: UNSURE (   8.42  )
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

Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI bindings.
AST2700 FMC/SPI controllers are not compatible with AST2600 due to the
following hardware differences:

- Address decoding unit uses 64KB granularity (AST2600 uses 1MB).
- Segment register semantics are changed.
    AST2600: start <= range <= end
    AST2700: start <= range < end
- Hardware limitations in AST2600 address decoding registers have been
  resolved in AST2700, so extra callback function used for bug fixup
  is no longer required.

These differences require distinct compatible strings for AST2700.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index 57d932af4506..80e542624cc6 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 description: |
   This binding describes the Aspeed Static Memory Controllers (FMC and
-  SPI) of the AST2400, AST2500 and AST2600 SOCs.
+  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
 
 allOf:
   - $ref: spi-controller.yaml#
@@ -20,6 +20,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - aspeed,ast2700-fmc
+      - aspeed,ast2700-spi
       - aspeed,ast2600-fmc
       - aspeed,ast2600-spi
       - aspeed,ast2500-fmc
-- 
2.34.1


