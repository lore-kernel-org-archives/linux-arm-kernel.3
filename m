Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD8C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0R7UvEnhCni08A6zvyB5ypdO3lgXpKbMitNA1dEJ4Q=; b=DNUk7az5B8tlqKGBtVd0ldlOC1
	rK8WXShblao4oaPDtfc3kRW5cyWA90ExbimCX8L/nzipyNuP9zcz+wEbcR+zpjeUusnhDTd2eASiu
	bs1RJl21BFGi2XRl7O3ZRPC9eWGvOqclWPQtd67MQZg1vJi+NfzH7EbjEa5r6dfPBFK6w2BoMavWW
	//xZpbL/0wuGYtcT4IMwi0tBQNDROPwIUaQ1+GErtYSq+6EsuJWDQRYgtfOn+owTCKLYtbU7WWLp4
	dp0uLZTaetlTDMa5mfmJ1QH5S9tdPD3BKSso9ehmoa18Tywk3SL2C9HsA/OxTYiWvLxZlPCsaX4Mz
	nT0inkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZP-0000000GmDj-27OD;
	Mon, 03 Aug 2026 10:06:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpZL-0000000GmBg-47oR;
	Mon, 03 Aug 2026 10:06:54 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0R7UvEnhCni08A6zvyB5ypdO3lgXpKbMitNA1dEJ4Q=;
	b=L9h67yDeIbfzHmzFdZukIwmFnggpBJvp9AoVxEVo+MFJu1LYIGqe5LRePiZ/nCCxJuKXWn
	all87GKEjWrlFjErAV8e7EkCjKVXb7bSd4bUk5KCqxmGYZlZ55J7XA1pOFmGfIPxUPyCvy
	b9OyqC4PzhJB6GTeDxlZO9RtJXmDKfwks8+weQnlzet2Cm3uv/TT72eQA9rizuQGFIgmRX
	6kt8nuJz45Yp8NG5GF0lElXVopwK7HksZ+Lru0AWVT79SmgZ70mxZVh/TU2N/GrFXBgdgc
	XJJkDM/rpw0owVNfy78vn2AZAX6Ka2dUWidQMqnQYr64TsTzW6dq+KZYBVcoSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0R7UvEnhCni08A6zvyB5ypdO3lgXpKbMitNA1dEJ4Q=;
	b=gHvG8Fg6B7ZlxZ5a3YDJ7jIpEIVLx+AUjxWKoQEZMjHgvrem1UJXv98sfWwXy7yxmhYWcV
	7JxxnR0b2KxBLlCw==
Date: Mon, 03 Aug 2026 12:06:41 +0200
Subject: [PATCH 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-1-401934357a44@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1077;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=LYWeZ2upKWS8B2/ERLkNN+fvSd4smTBxK5Abj2B9biA=;
 b=gkK0yU8KAwFOk2pPVSuHRdmUsI17ApQ2RP0YRm+e0WKA1in5BBqe69EC3+myiBNHJS6/+tuy3
 OUeHZHyyT8TBhL+d1Brf0OMbwneDF4A1DI5csZ+36oV+Bw9nmwbUUT0
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_030652_180707_44D66EC6 
X-CRM114-Status: UNSURE (   7.82  )
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

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f3..43729a887f84 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -25,8 +25,15 @@ properties:
 
       - description: BCM2712 based Boards
         items:
-          - enum:
-              - raspberrypi,5-model-b
+          oneOf:
+            - enum:
+                - raspberrypi,5-model-b
+            - const: brcm,bcm2712
+
+      - description: BCM2712 based Boards d0 stepping
+        items:
+          - const: raspberrypi,5-model-b-d0
+          - const: raspberrypi,5-model-b
           - const: brcm,bcm2712
 
       - description: BCM2835 based Boards

-- 
2.47.3


