Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B79BCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKIj7vjKy9Y9Vae3A4dMKPMfxiFmPnyG5vDmw/Z5sss=; b=jwPCDROGV9BDkGIhrnxNqhmtuq
	S6CS5ikq5Gpof1WMK5rwNi+AJc+H9fJYWAL0AKWdFVm7WavFrDEN5jPOMqQ9P3wtz7YMYtDliY63l
	xSNfjrA9t2etHU+RKaj2GvdEpRxi7eQZwpfYwC7WQ5KgazdQcxSWzMeB0IipJNze35LG7lmiM/vFp
	UhEh5yZii2T7+sbm/nfZfw1pQhhw5oQCoM7zalDYVJxnr/WdmQmSVQCSSd4QD1dG1CG3Q+Y+nJ+nG
	G3x0W+/lBFj7oB74M9g532w94Hk+lrODImesMUt3mhuDyf/kfp+sebY0Y8nCVhrwEj2S5Ivpf8lwD
	iT3idxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMQ0-00000006hGu-0fvv;
	Fri, 08 May 2026 14:43:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPp-00000006h6i-0FF6;
	Fri, 08 May 2026 14:42:58 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778251372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKIj7vjKy9Y9Vae3A4dMKPMfxiFmPnyG5vDmw/Z5sss=;
	b=CHSB4s5aYDs7S4QMCOXnymg7ULPR08n77kPrYl+rsyga2SQhoLt6+G8ang6TfCWAXlUURk
	4KIhUhrNMEYYg8ukdH7FLvMTto85iAereEMV9t3Nb6xs7DCGRHQyNdLwROHVtzzUrQr0EZ
	TOCKb8zVFOFqXP/DKHGCA0PVXaeGZZAxJnKKd8xwxjpooMXmKM6yIzVNesUskGeNZM9hcM
	j3CwN5pSVSIpGaEkrF+/ZHCUcO2Q8cJ+Hwdmbbs5qkahsullsXOlnBRMJxdsXz3nvMdiUI
	M/d6oU8roGTn2tQCrkv6Y5fcdBrkEQSIiwprt32tdbXdSTyjROssNrobnirHmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778251372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKIj7vjKy9Y9Vae3A4dMKPMfxiFmPnyG5vDmw/Z5sss=;
	b=niIffQua2d/AOucZGbFiN67+AiliRCE5LWjHdcmrq444/SZ7Cy1/SOd1CVHws80K/FwYRs
	BxY1nWHmhLtJgdDg==
Date: Fri, 08 May 2026 16:42:48 +0200
Subject: [PATCH v4 5/5] dt-bindings: raspberrypi,bcm2835-firmware: Drop
 unnecessary select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rpi-otp-driver-v4-5-cf8d725d8821@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778251369; l=1100;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DABsoMXDk2P+S/P+yyf588Zuvkfjmm33Pz1/j6lJE/4=;
 b=gPPKOgDjiowGSTTjFyrQ567SKtkM82Nof41P9IAw2e6PGA7Hc+THk5vpI8G6BT21JUkoEUzRG
 1z16YPnGfaTCWUAVsYhlgIuHDvZLNqsttQ7yM9NZMsjWlOD8v/JzsHO
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_074257_260959_934548EA 
X-CRM114-Status: UNSURE (   6.54  )
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

The select schema is not necessary because the
raspberrypi,bcm2835-firmware compatible is already matched by the
compatible string values. The documentation says "Most bindings should
not need select", so remove it.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index a3a5243b9170..7cf9a6fa1e5b 100644
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


