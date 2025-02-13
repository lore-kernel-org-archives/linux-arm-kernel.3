Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10032C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HUhoK5tjELfjF0VqSsnZsbkAizYp2E8hPEyT0wBFLSU=; b=JWRVKXBvFYKJnL
	L5kadz64wGxS8apyKReo1vXB39tCiiewYQSiinB2PaZlVUq2iMtRd6+W9lD2Lvbj+IZSWE4FcWrv7
	s0ao1irpQghtWNswkfAaBrijsAAuG1QdWmvgEf9p+Ehg+3TfpUHxqcIHU+dXVW4RpB0NjzJ2QNU5X
	a67EBkGVHa7Rz6HDsng8cHOmMnb5z4tjvzElGfFeo0yILp4r8r9l1v19n0hCdEaoi1YpqDL4HkAyj
	eSSN1/bQNtE6FLxlKnWE7q5NpYAsffE7F3EkErfY0I6WQKHLskSdpxeJOWDdwFFOMD4ys9iKFQCEF
	9plwm8cIcaQATh/VlfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVdQ-0000000AUYM-0gDq;
	Thu, 13 Feb 2025 09:35:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVVR-0000000ASrp-0TMe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HUhoK5tjELfjF0
	VqSsnZsbkAizYp2E8hPEyT0wBFLSU=; b=SgYp9BO+sJEDfmB6Dla7eOwn+K7vbG
	f+PSyGCy8Um/Gk907fN5lQbRGOOTm9xC7lGPK/rhyUFBqXwwTIpWzKjz8gAvpxIh
	bbwt56fszeCSRw/vWlAfZ01U90t/fHw41zPTJNpF4TlzEC9UOP6nmks2uAdQMga/
	xg28hCz/d7HEpxKFiJVp0Q8d5iaiXyc2dkkgI2dzmsALBpfvDs1m1UOqqELRQ5ma
	hqto6+7Bn/uBMCa6AssmmQfyfuKw6nrJgwRslKqFkwJM48NlSQ1F4pu0sDFndk0a
	I1NVAkLHToUckfzOcyk+mYRpH8Ic9eYnjECoMqJIjV2fWVDVmMtMLhQA==
Received: (qmail 1812528 invoked from network); 13 Feb 2025 10:27:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 10:27:31 +0100
X-UD-Smtp-Session: l3s3148p1@PcbTqgIu6LVehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
Date: Thu, 13 Feb 2025 10:26:34 +0100
Message-ID: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_012738_012332_E2F280F8 
X-CRM114-Status: UNSURE (   7.10  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The driver support more SoCs. Add the missing ones.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* add new compatibles also to clock restrictions (Thanks, Krzysztof!)

 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index 885d47dd5724..e803a1fc3681 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -34,6 +34,8 @@ properties:
           - enum:
               - atmel,at91rm9200-pmc
               - atmel,at91sam9260-pmc
+              - atmel,at91sam9261-pmc
+              - atmel,at91sam9263-pmc
               - atmel,at91sam9g45-pmc
               - atmel,at91sam9n12-pmc
               - atmel,at91sam9rl-pmc
@@ -111,6 +113,8 @@ allOf:
             enum:
               - atmel,at91rm9200-pmc
               - atmel,at91sam9260-pmc
+              - atmel,at91sam9261-pmc
+              - atmel,at91sam9263-pmc
               - atmel,at91sam9g20-pmc
     then:
       properties:
-- 
2.45.2


