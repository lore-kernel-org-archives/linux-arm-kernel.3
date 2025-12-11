Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A59D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scUXHBA8U36RhFOiHgBOHOnbtB8kt5qA5NvPIcX39Ts=; b=tMhjlLY3kdr+IRosPeRZTIL2o6
	KNJncuCXclWMrF4Kb6XseOJ2mIkG1+InW/u4MLxKKL+somWl8pKd4hFCEUDJoC3an2jzFwIrNHi8v
	SDr+K+MWP3C2Ic9eAVGpdKQzn7DiK+3IogQhjXkzxIdkiqHuvuDpN7PxGAYHyQjM5btv0I3bKzf0/
	tyCGXhsSMJMNTfM4GxdDermEWsruIbtSEIZxPm0Lfd0S94qUD7XRvY5Smf6G7GLb3wLzKO6TSReye
	hb9dtAtC3+b5iCa5V8E//2TUrLmy+/yzB7DOCWikhzjb0+bzwRK71+RXHtpZWwVh8TwHs8LTOOY/b
	2NgaNP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKc-0000000GP3P-1QdS;
	Thu, 11 Dec 2025 08:47:26 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKY-0000000GOz7-3kYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442840;
	bh=scUXHBA8U36RhFOiHgBOHOnbtB8kt5qA5NvPIcX39Ts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kbl6jMARUYr9p3EhuRIx7DFr993blzu2iTSvxCBzC3fcoeeUKB+9dEEGIjvFgrC0o
	 699wvbd4O/UbmujPS7oflU1iFRhNWEToKfk+Vp1mY6yY6s5tL5XTf61LjTW49Imt0d
	 /e7f2n+Si4v0YguWCG1wYgpyRyFqcsGg5Dn/1LI1qMteB5gDQn5X9mZUpno7EACIu2
	 gd5EueGuo8iBbwcEkaEjWHim/XQb9BiSKFABt992wnwtnry/uL81BXUNwibzSeVP9s
	 jGZvAtr7yYywK4Yy+6GvHqtljVdtsLA/M/Xcd+M1mKP2OtgSBYKPCGP25M89RjZotV
	 Zz+JFpjGUR8kg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 24FF57D6BB;
	Thu, 11 Dec 2025 16:47:15 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:52 +0900
Subject: [PATCH RFC 10/16] dt-bindings: crypto: Document aspeed,ahbc
 property for Aspeed ACRY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-10-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004723_154990_27420B74 
X-CRM114-Status: UNSURE (   7.91  )
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

The g6 DTSI already provides the property and the driver errors out if
the AHB controller's syscon can't be located, so define the property and
mark it as required.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
index b18f178aac06..0dac6ee5043e 100644
--- a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
+++ b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
@@ -30,11 +30,17 @@ properties:
   interrupts:
     maxItems: 1
 
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the AHB controller node, which must be a syscon
+
 required:
   - compatible
   - reg
   - clocks
   - interrupts
+  - aspeed,ahbc
 
 additionalProperties: false
 
@@ -46,4 +52,5 @@ examples:
         reg = <0x1e6fa000 0x400>, <0x1e710000 0x1800>;
         interrupts = <160>;
         clocks = <&syscon ASPEED_CLK_GATE_RSACLK>;
+        aspeed,ahbc = <&ahbc>;
     };

-- 
2.47.3


