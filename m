Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA0D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YuQt/ViTsd3OTZlMf2fjHbcSpDjnD7vrDHlgaLMC7Q=; b=On8wURIj+FwWBnIbpZ4IYeWZv9
	pZR26JLux1eLTHBM6hR5zrVfBdIJ2yd/JYuYCzZLvo6dKh2YEwAYjQE7dg3MEmc/wpoRPV9Xdt3Gc
	EfpSCGldAD96jjgvT5rqA6J1+f52A4FzVQI0Ex1q/vbVJlGq/uVEVKdU5L+hs5M//AaQCgVA32Z/A
	qn4YnS59JeZU/g40rswicPuV5GHDSs06iNx2XRvtEWkVa+0cbE/2H0JKfwXLOGwmRMTHt9emrmsHU
	jbfqUbB/e4qGIPN4hY/HXmjmBTpjjjJ2tCTzNWnZCzkNB3FvIPkCxGQDeWYxVG60vmdGPWYZvauzS
	m/YcFUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcL8-0000000GPWj-3Pfy;
	Thu, 11 Dec 2025 08:47:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcL5-0000000GPSW-3R3H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442873;
	bh=4YuQt/ViTsd3OTZlMf2fjHbcSpDjnD7vrDHlgaLMC7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DtLZgl/pzLlAKfeYBIFJAGq+mv8J6I5TrFfyrELEqhyHJG09MbGTKdzaI0m92ywHx
	 2MQRN0ioXDZBYRrhbN/rfR6CIR+I47pP4z+Lkvli+gD3eYeV3xdvkokIhn6fZCYShX
	 /L6U0sF/Ht/XcG4wFFgWZVLd3Bzsuwt9SqbdM5VV1leb0cZVX+WWNd/GNHx6Y5hhTu
	 Rjp2LmxLo83y96h8HPz6nVv2bNjBzSpIZgYi48iW0I7y/eETOqkoWOBQOj2Gd2WE4j
	 11CxHJJ9ct6uQO1CIWocS6QRvCseG26HsU4KGYFGemSoCE3BLGBJpCYPr00sOiwKyy
	 R6QQN/Jr1usPA==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 05A557D6BB;
	Thu, 11 Dec 2025 16:47:48 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:58 +0900
Subject: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node for
 AST2600 SCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004756_065260_BF3176FF 
X-CRM114-Status: UNSURE (   6.85  )
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

The platform initialisation code for the AST2600 implements the custom
SMP bringup protocol, and searches for the relevant compatible. As a
consequence, define the requisite node and the compatible string, which
in-turn tidies up the dtb check results.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index da1887d7a8fe..3406b98c4d0b 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -130,6 +130,24 @@ patternProperties:
           - description: silicon id information registers
           - description: unique chip id registers
 
+  '^smp-memram@[0-9a-f]+$':
+    description: Memory region used for the AST2600's custom SMP bringup protocol
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: "aspeed,ast2600-smpmem"
+
+      reg:
+        description:
+          The SMP memory region
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
 required:
   - compatible
   - reg

-- 
2.47.3


