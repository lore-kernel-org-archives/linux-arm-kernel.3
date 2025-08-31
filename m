Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A8ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 02:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE0Pvp9i8/WyWJ3084il/AIfKJAaceRSFYUMTMCNpvU=; b=JGM5MPm+EHeGYBJtkhcN5mx3kE
	IWo5yzp9BO1EoV6H5lvDW2UFh1MV4AgROxA3VjqYSPwTd/A84JRtBiHUIzxEg3vjafIwpfiU2WXfY
	AsVFNXJ89QXfLfWUQ5uspIg/y9cd7vU5AdubIUOsSijWKwcOa2MvJYOtUzBwKEhxZv9APMh8Dwib0
	dEIGHyGkkJwrs0LCpyFGUNkYVZBq7ndrcS8nOl3LIduDcQVumrtuimuvpe7Z4X1Qhmml9bbleJGRa
	z+HhjoIW5JJ6j25/pDepST0JTGp3T6daU7hmmeBy/Zo2al49DEz+WdA9w7D0nEpex6h40kzyvfVoO
	HfACSqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXir-00000008n8Z-3Amu;
	Sun, 31 Aug 2025 02:23:13 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usXan-00000008kya-02x2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 02:14:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 31 Aug
 2025 10:14:38 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 31 Aug 2025 10:14:38 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/4] dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles
Date: Sun, 31 Aug 2025 10:14:36 +0800
Message-ID: <20250831021438.976893-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_191453_051397_CDC36CA7 
X-CRM114-Status: UNSURE (   8.83  )
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

Add SCU interrupt controller compatible strings for the AST2700 SoC:
scu-ic0 to 3. This extends the MFD binding to support AST2700-based
platforms.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 5eccd10d95ce..67be6d095fe4 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -75,6 +75,10 @@ patternProperties:
             - aspeed,ast2500-scu-ic
             - aspeed,ast2600-scu-ic0
             - aspeed,ast2600-scu-ic1
+            - aspeed,ast2700-scu-ic0
+            - aspeed,ast2700-scu-ic1
+            - aspeed,ast2700-scu-ic2
+            - aspeed,ast2700-scu-ic3
 
   '^silicon-id@[0-9a-f]+$':
     description: Unique hardware silicon identifiers within the SoC
-- 
2.34.1


