Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A7DC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoRHycwAmBYUri9rlyFHlZy3NwlBvIOEmEFqOGFEsa0=; b=w5xmOsK9xVfzJe
	/yac48TWLFGVqnrqtKh5oK0KlSnPXKeRtJFrqP3OUgt+pwYhsfmwjWYsW8Gro4m7RtqlbUIVOJJQh
	PrNFOuLMHnpEmTRvBgr8GDGO1DXsZDAw7UFd898JDNPJOlLTABMFc3c3SkJwJw1+Xo5iArUsoBkv5
	lyhvRLLRjd2niHJEeYVe80aLfu9DZWmU5k2JqUjhtRPuPWuk4rce0HikPSDELU3x4CsAsihgcugWm
	bZTzxeEge+b7wPBI4zEaQesZs12ae0EXdRr0H8Vc99VSDY3f/ug7tku0GvzujUVBlwFFVI6NtRh/m
	vapYv+b0kJQx+FKcE3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD8t-00000002xpo-04e2;
	Wed, 26 Feb 2025 08:51:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD7I-00000002xUk-3Scz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=QoRHycwAmBYUri9rlyFHlZy3NwlBvIOEmEFqOGFEsa0=; b=BRdEAf
	WiAlxaoqYaD6f3f5QItwDgDyWd5kZ7L1MGs5AcGUzz0uLGCssb/jfLKHrRccc2sy
	1Wl81g/INbQ5p5RwMaFRtwwfW5Bvv3AQTq9exX0yLHN4APReElmGDUOaqu5vGOJy
	9qHZ9LEqHEqDIK4+uy4P3yJqOKqa7eELp9Ve30J5YfFbDDy4teXdnVaCphvep91N
	vGP/JfEi/iINwqZLsPPhd7kzE8E2lgdyKJ5cKBdbTC7fkjr1s2rCJnVEN6L6nf+7
	El8oL+yfBvxDDAtDiSsnicGc/4VGATbzcPJ0hKbwKBuj0vfVJXPBB29JDdtQPqAt
	zz/8CI5cGM3x6sTA==
Received: (qmail 500365 invoked from network); 26 Feb 2025 09:50:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2025 09:50:03 +0100
X-UD-Smtp-Session: l3s3148p1@u8jNqAcvZq4gAwDPXxaLANR24ZQNPy5l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: ARM: at91: make separate entry for Olimex board
Date: Wed, 26 Feb 2025 09:49:36 +0100
Message-ID: <20250226084938.3436-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005009_785434_774119AE 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Olimex board exists with only one SoC option. Change the bindings to
reflect that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 0ec29366e6c2..02a8f6aad541 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -22,8 +22,6 @@ properties:
       - items:
           - const: atmel,at91rm9200
       - items:
-          - enum:
-              - olimex,sam9-l9260
           - enum:
               - atmel,at91sam9260
               - atmel,at91sam9261
@@ -36,6 +34,12 @@ properties:
               - atmel,at91sam9x60
           - const: atmel,at91sam9
 
+      - description: Olimex SAM9-L9260
+        items:
+          - const: olimex,sam9-l9260
+          - const: atmel,at91sam9260
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
-- 
2.45.2


