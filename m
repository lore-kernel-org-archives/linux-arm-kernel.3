Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2E9CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQFNt+9a4A5dfeMowDT9WSpy81hGD3mNS+Yhz4JhQsc=; b=lN9+IMHaoOTYSbd8o6uKPoAH55
	oFvZrpL/C9F2qMXqSxCi5KVeT6QXj9bjw8fCOBT2YH7T3xRc6wwKUT+CdutzQ1y6IR57fPIPD2zDd
	FUeUFfFUPGd+ME9fdrsGX2cMiEPi8GW4rKko4o0v6pndDg3SrTSxUnlIzJSJXAJVaUujx+FC2RKSc
	vRy0D4JF4yFWGRFkqehUMXX4IpC74IBh+l8RqrDr/niFTM+lgCXDZC5/20VeoBVLoxxLVak7zWP0B
	JrGRiVp3UC0UZlN/CPik/6cpDP8NA9VuN6qDzxzdwwMXYlpZdPvfvdtxF54d9d3BIhQjGXJAmGZLj
	KgxW680g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPp-00000006h7K-0bPX;
	Fri, 08 May 2026 14:42:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPm-00000006h4k-19XX;
	Fri, 08 May 2026 14:42:55 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778251370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQFNt+9a4A5dfeMowDT9WSpy81hGD3mNS+Yhz4JhQsc=;
	b=Hq7fIZZpmdqb/0DbT5BBcTSNGjtFgSTBhapTssZ7MaUZC35grTfpkmLjNWc8S2wr2j2ZLu
	b3ud3HyomsKJ8pO6VoPikbRrxntV8P2jfYaYk7v0jnr1GW76Ay3S3Hlht0lXaUCzHFaHgT
	PVyCU3aZncDC+GbKKi+7wASTgcdBNB9Gd98ZaqnzEYhiFA8+ZWqMy0GqJC8F7Ob2Dz88Wm
	Kigs3xtw5LzNqCa9OfTLcRxN8Na9RAHC2t5saL3jLUG13/IvemAVFsFNlFuPslQZyl9ext
	5vj6l4rIl4hHCoxp/3knf9Fvq1MJtWz8Cmr0nu18asRuzn3xTzLRDmnd6Rg+XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778251370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQFNt+9a4A5dfeMowDT9WSpy81hGD3mNS+Yhz4JhQsc=;
	b=T4JTklaJWumJ4Zp9TUC52vo/VxxPnfwanI+f+aw79NywQc0k6ARI/r5eU/En80tqA2zxL7
	GFOarnerbeMtcYDQ==
Date: Fri, 08 May 2026 16:42:44 +0200
Subject: [PATCH v4 1/5] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rpi-otp-driver-v4-1-cf8d725d8821@linutronix.de>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
In-Reply-To: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778251369; l=1195;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=+kkWUzDTio/ByhdKzh2wtj7KRg3wTOQXzmfdrn64Jf8=;
 b=Wd7sEwtQi7ou5NUNCMPp2Z0xVIUb98/tB4VL5L+NVc3h29Sho7Ys9p6ou3E5srJeBtKO6KK8V
 ME/ebRQiq7BAytj+Ac4LWlRVnZgqnaSHBbIEqfZVgtFxScXCyO4G/E6
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_074254_458517_404E190D 
X-CRM114-Status: UNSURE (   8.22  )
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

Add a compatible string for the bcm2712 firmware. The bcm2712-firmware
is compatible with the bcm2835-firmware so allow the bcm2835-firmware as
fallback.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..a3a5243b9170 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -21,9 +21,14 @@ select:
 
 properties:
   compatible:
-    items:
-      - const: raspberrypi,bcm2835-firmware
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
+      - items:
+          - const: raspberrypi,bcm2712-firmware
+          - const: raspberrypi,bcm2835-firmware
+          - const: simple-mfd
 
   mboxes:
     maxItems: 1

-- 
2.47.3


