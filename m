Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B179CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71JsG6gVDXctQDIb7LaTsQ0pEfRTsF6nmijRQ5whL8E=; b=AFyrmEVxTuAy2atRY7bIy/koJS
	yxGuMDvHI/bPjcNpW/K+bN1zeBiz6QwulpJTlLEtIpgoI41B01m3l4YLO1q6cNhteg6xwfWDZgVw3
	ljuA3JnCj3zHestrcrkdgc1RzZ5x+OX3m9wRUgNPkNWHDLnjN0oDy7kxHLIpcGHfvsqfStAs2NlBc
	/nJjS2pbg01fKof6ByoIQx/UGGBhv7X0/hwXHYxA8Yiak3pSx7Ur/pRXDi2OYX72IT/F1aZH9Zu0V
	dRadrWon4h0SvLgciQI+gCL1bU0LT3gTHVGr3OlEiChTzA8EbUAQpeT7ka5hlKkmkYatE8TY5nyOV
	oX6+Ufog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iG-00000001H3H-0PRE;
	Wed, 13 May 2026 05:00:52 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1iD-00000001H1w-0tw6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=71JsG6gVDXctQDIb7LaTsQ0pEfRTsF6nmijRQ5whL8E=; b=IsIznn9BC+baZ2a2HHvTmIF5bk
	UNTAkCwxlMLgNb3NR7tgPa1C+BC1WUD3iSiNW0gHIzrl77Dcu3NvZfLul1GxQnq88cB7c8mb/04+j
	8bKb+PBU7WVDAzawfXWh8toF33zDtoXDOnK+jxNiDpd7ZsGsffhlRKjNPSyWPu2EIDbwyCmPlERId
	kvinxnwUP7TPb/Y8Zx8VnkdfzvJN3ym0I6l//k8YtJ+LSrodgP7LvMmI5LI/n1/BvpIy1kQ0eHgN9
	oUzD4mt4v/64idvTOuH0U1/DfKhYGqd+plLnsInc7ZOHtyl/Dwh+nTaN+zVxXUDQyMQmLlaKX3tW6
	D4U9BPMA==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wN1i9-0000000EbQH-3j76;
	Wed, 13 May 2026 07:00:45 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 13 May 2026 06:59:42 +0200
Subject: [PATCH v2 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-sunxi-a523-gpadc-v2-1-d5efde151dac@mmpsystems.pl>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648397; l=1776;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=n7OmLK+G+swK8U8KTOiNlbnGO2KxE8y9tMCQrEw0lXA=;
 b=ELbVIHXde+q5YmXB8IE0eAW32UNyEM5FTi/D0b4yAJ9QlutFfLOBULwxdjrPewFo2uqDg2SZD
 2/sJxabLF/wB8peOJyGDiopjk42Msve++vCujiqfSK3PCpEfoxN+jUx
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_220049_425920_ABEBC37D 
X-CRM114-Status: UNSURE (   9.00  )
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

Add support for the GPADC for the Allwinner A523. It differs from the
D1/T113s/R329/T507 by having two clocks.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
index da605a051b94..6467800d30e2 100644
--- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - allwinner,sun20i-d1-gpadc
+          - allwinner,sun55i-a523-gpadc
       - items:
           - enum:
               - allwinner,sun50i-h616-gpadc
@@ -29,7 +30,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
@@ -40,6 +46,30 @@ properties:
   resets:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-gpadc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock
+            - description: Module clock
+        clock-names:
+          items:
+            - const: bus
+            - const: mod
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
+
 patternProperties:
   "^channel@[0-9a-f]+$":
     $ref: adc.yaml

-- 
2.43.0


