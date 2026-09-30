Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFECA5FB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 05:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNQAJY0VrRNOcqodeuBlYf2NAb7EX7MKHfLgKkoDvxE=; b=0PAd69ERskGR8AUBUtsEwucFeN
	m67QBfASX+JbmSQOzdzhij1DUtP1dp/rz5PsdmptK6NX34R11yOHTCKF9eAloL3wxMj/+Mb8Brpz9
	9f3GtKVj3mJtg/Qu2P9Jy8IfETkNI6fG0dWCDfVVfaj0cXDMrY1vDhWYPhCANzK4aSyOqzcH860Ws
	MAupzoUMqGxZzXBnxxsK4RoY98P/zuz8V4/q1zT35yF/La7SXs0wJ0xDfRX/k3O/mDXf3QfTW7TXi
	SF8vBho1UQ6x3XHWmOleCsHNOsl+pvhJbUB43d3pNeWEaewbgWO/87pNRNqtabNwR+JV8ioYoGWar
	iATM+S2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmf5-000000051uG-30gM;
	Wed, 30 Sep 2026 05:15:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmf1-000000051oP-2CAQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 05:15:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Sep
 2026 13:15:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 30 Sep 2026 13:15:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 30 Sep 2026 13:15:03 +0800
Subject: [PATCH v4 5/9] dt-bindings: edac: aspeed: Add AST2700 SDRAM EDAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-edac-v4-5-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
In-Reply-To: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790745299; l=1457;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=/rj5B9ojWffAdYkp2s4TIp84wfNqe/zSqKMEbEuHOX4=;
 b=Z6HQq7mR546yGnzLBw/SsqtjdNjKle8U107kZdQSOE4waSFfUuhGbCIe8C9JljTOo+uU5Mn+k
 qM0RwE61n72DZDmQGGjfc0FxA/oCbAezVMitvtjEi4Lai8SUPk2ukmR
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_221519_565743_7F012B89 
X-CRM114-Status: UNSURE (   9.32  )
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

Add the "aspeed,ast2700-sdram-edac" compatible and note DDR5 support.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
index 09735826d707..685b6815f293 100644
--- a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
@@ -10,8 +10,9 @@ maintainers:
   - Stefan Schaeckeler <sschaeck@cisco.com>
 
 description: >
-  The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
-  correction check).
+  The Aspeed BMC SoCs support DDR memory with and without ECC (error
+  correction check): DDR3 and DDR4 on the AST2400, AST2500 and AST2600,
+  and DDR4 and DDR5 on the AST2700.
 
   The memory controller supports SECDED (single bit error correction, double bit
   error detection) and single bit error auto scrubbing by reserving 8 bits for
@@ -25,6 +26,7 @@ properties:
       - aspeed,ast2400-sdram-edac
       - aspeed,ast2500-sdram-edac
       - aspeed,ast2600-sdram-edac
+      - aspeed,ast2700-sdram-edac
 
   reg:
     maxItems: 1

-- 
2.34.1


