Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31A4CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ObXh6kk4XunevPthCtxU9yhwucuotgK1jqwXTy/qtQ=; b=pgYzDhpiX4wc5MT8r2Xe6h1NVm
	RWUOZjWid+WkmEG3132/NrK1utWS6fVW2UAaFp3Nslkfl91ASqSphiCFmCaEXDOcfbNE+Pfai7hwk
	0PHkUsuwRPq/5h36ra4t62Bd4u4GQiLKi4tVUvnt/ZJPiEZknnSmUi8l3n7Yk0ERGFwTjpSVVaiCR
	rbhL6tF5PNU8ZqHZnyqAGiDCQKlvpJYOHALzQWCwdFmz3zBEZm01J82d+Wa1BkAc/A8jFakPRQ6D2
	qcWfF8X28hm2DpTqypglqrnRoo04yfDi1C/fg9vL7iyhnjdBJ4NLJQBYk64PZ1uVBl5iJaye4wOU2
	2vitoJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRzZ-0000000BIPV-2QSZ;
	Fri, 22 May 2026 15:40:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyw-0000000BHtD-3VY2;
	Fri, 22 May 2026 15:40:16 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ObXh6kk4XunevPthCtxU9yhwucuotgK1jqwXTy/qtQ=;
	b=GbrDk0/+3zWfKH0IdzVUilm7KTRmyZqSyX+EsQl/5RdrVpCzHktcDRvUAuQIvJrHIYazaw
	2rAvk+Y9nbJjuxe/x27prvp41nBnPaV1wbYie98/I2/I5g03Ho7gqhb6iRV/fPI8SFcAin
	YoNv5nZjZt8yAqwbMWIcFgKQidSmBGkssvmKKNvWtQGwSKzEwRXIWpj4c7C7taFHgj9iDM
	IhmCDwVzfha5iJWcNOy6mMNKCorywHLlPyDI2KaK7NEIiioEHjxjwNwpaAbO7mET8bzvGK
	cqpKJUw0mmKWoU3uqndqsUp2grPXTIwadmOis+5D3Z2r/TaWYNPvWrwXWoSuFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ObXh6kk4XunevPthCtxU9yhwucuotgK1jqwXTy/qtQ=;
	b=1HZycACm1rjGF/hGUUACNmMyMiDQHiBg+Gq9f2Pmb6/kd1uh72J6I83UYCbNva7noWpjAz
	cxQvLedQ6cE82NCg==
Date: Fri, 22 May 2026 17:40:07 +0200
Subject: [PATCH v6 07/10] dt-bindings: raspberrypi,bcm2835-firmware: Drop
 unnecessary select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rpi-otp-driver-v6-7-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
In-Reply-To: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=1090;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=IfrsMSCpNJWQEqfe46rlehUOfwK8xizeSOL7BdUbETY=;
 b=n26q+46/ZqDMYFZey78jD9XG/wo3dvjxG+HkjrhGRGCgwgUxSzxhDBQBQJJKmPN5PWSi64pHe
 QeILNf39v3MDliJUcnLKRu9UO6v2sDxix9Xj857BxIyDah5qLzDy6OC
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084015_077782_560CBB54 
X-CRM114-Status: UNSURE (   6.17  )
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

The "select" in schema is not necessary anymore since dtschema drops
simple-mfd when constructing the select/filter query for schemas with
compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index a3a5243b91706..7cf9a6fa1e5be 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -10,15 +10,6 @@ maintainers:
   - Eric Anholt <eric@anholt.net>
   - Stefan Wahren <wahrenst@gmx.net>
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: raspberrypi,bcm2835-firmware
-
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.47.3


