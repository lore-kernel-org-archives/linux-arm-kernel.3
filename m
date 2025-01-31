Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893B1C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WYs/kgR9xMvuWjr1kYMsrWbEPHqVE+5/a5Cq1MDfH5U=; b=dI1LPLqq+qIcLy
	EijdntUe8Mtqw6A+0AWmzk712pPw7VqNw3+dytXPiNYdz1FffSVSSEDGHBSLEu1eZEL4toy3WT6DW
	driwT2FVhkk3r85stO3y5WI9w/3xGBXujVR1O6+n7DVeH2D4D9KRTf+L51VwekdhO0AHOe0/ShBJr
	ng8c22mcP4AQcRFzh5nu37zfCUbIK9cqoXha5+5LXbfqWUF6Sd1aKmTJSWh3Afk8UY9NX4gOvaz8A
	a8rymP+9gh+9u45ByA1BWkp0Xa2+28Zk3SxJixaLIlAASuHMPCWPg2sHVv0Yk6Z+xJ6h/66HrKTqc
	Sxfyw5sdcQoYO8lDnJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu25-0000000B0WU-15r6;
	Fri, 31 Jan 2025 16:38:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtt5-0000000Ayng-2nIw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=WYs/kgR9xMvuWj
	r1kYMsrWbEPHqVE+5/a5Cq1MDfH5U=; b=JO7qS9Y7phyeFQYKpOU91lo4w25C7t
	TwA5y/Wlic3sbPXCxmmcoePWPUf5ENSvvAQvg/t5/+CdjNb3y6QtTbnBsTgXeeEK
	1s1Miwb3h8+ewBrGxYDiWJGB/aaHjzdBqfdkxnrCJnBEAPzVJ0yzQdmIRYUKQgq/
	+JBTUsJH2L5X65gEr9/5hhCxZ0sCtQh8ZODM/K2aOnk3xLl+ytrnQWPCEVBXvBs7
	CkDFH8aQA80Qlc6CTjPA84voltLgc+bAp/ZpGtzXgNBAQmz+j/LlahqLJQOXaw2F
	uZgWRzCL1bty1h8HfpvT5CImumQEcwh6N9ccdqiLUhnEtH/iNBe3mqag==
Received: (qmail 1739795 invoked from network); 31 Jan 2025 17:28:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:28:57 +0100
X-UD-Smtp-Session: l3s3148p1@CXwTCgMtrP3Uph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
Date: Fri, 31 Jan 2025 17:28:45 +0100
Message-ID: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082859_975763_E770B820 
X-CRM114-Status: UNSURE (   7.30  )
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
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index 885d47dd5724..8b65390d2d54 100644
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
-- 
2.45.2


