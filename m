Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF0DC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGkUk7FpBRO6uhsFQd0B1g4kp0kbIiSm3K/yIZLqmwM=; b=oOHLeD8Geti8t5
	gQX8lZfIZG5C0qpB29+pHXtHHc2gkUIHJfQc3Sjuy10DwLpVMvBF0lK4ODqtrfnO8pGRnPiHqcATi
	LuTV/c9PK+6ordMMlLVh73dASEpXUr1uJShLDA2AIQtC38NMa/SxJFpZ/7XEPXzx3zWsSZlnqOmiP
	BQFoV6pGzNkuakTl9ybggZo0YLI+m8vLwTuYdCZr7EaRCk+VfvAJJXaTZecdyQMv2pjc9GYJu4oJV
	lRipOPJKC6dGxHWpQb2RQpzv6WHc1vWivJdYJyo2P08JybjRLYCxjrCM8mS/6Nc0z4T5VQakcYpLn
	TBhjlx9lBVv6rvI4yZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDBs-00000002yX8-1sti;
	Wed, 26 Feb 2025 08:54:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD7I-00000002xUm-3UIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bGkUk7FpBRO6uhsFQd0B1g4kp0kbIiSm3K/yIZLqmwM=; b=B6NF6l
	0c+evF8uBcrMLRlzR0ObdCXiZerLp+GESMxiD+buPAdz9F9s10Uphfztl9vImJtj
	10zuZMuS7UQdUhS7mjd4/EnQ1h5iVLlixYX05HOfovfbC4rfOrlARBA23DHHuvIo
	FPZrwpmYDLXQhqJPH3rRN3e6FWETmcCV1wgrDW/YNxtCQOhkGPbc9K1i7gboWovg
	00odTmlwIUlsnH7hKdAaEPeKnqgJlmsQEIOemOFYrGX1MUDy3tpcQNG+Rh5Zku0z
	f7fUzKfnYdTaGeeTEnL6AM1ndzL4G1aCESvZv2D9aN+Z2CMAPZq8bFDilcs/dzBq
	lDHPtPIxLbeZpqFA==
Received: (qmail 500409 invoked from network); 26 Feb 2025 09:50:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2025 09:50:04 +0100
X-UD-Smtp-Session: l3s3148p1@qA3bqAcvcq4gAwDPXxaLANR24ZQNPy5l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: ARM: at91: add Calao USB boards
Date: Wed, 26 Feb 2025 09:49:37 +0100
Message-ID: <20250226084938.3436-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005009_785013_73123661 
X-CRM114-Status: UNSURE (   7.04  )
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

They have not been added so far. dtbs_check complains loudly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../devicetree/bindings/arm/atmel-at91.yaml   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 02a8f6aad541..3a34b7a2e8d4 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -40,6 +40,31 @@ properties:
           - const: atmel,at91sam9260
           - const: atmel,at91sam9
 
+      - description: Calao USB A9260
+        items:
+          - const: calao,usb-a9260
+          - const: atmel,at91sam9260
+          - const: atmel,at91sam9
+
+      - description: Calao USB A9263
+        items:
+          - const: calao,usb-a9263
+          - const: atmel,at91sam9263
+          - const: atmel,at91sam9
+
+      - description: Calao USB A9G20
+        items:
+          - const: calao,usb-a9g20
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
+      - description: Calao USB A9G20-LPW
+        items:
+          - const: calao,usb-a9g20-lpw
+          - const: calao,usb-a9g20
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
-- 
2.45.2


