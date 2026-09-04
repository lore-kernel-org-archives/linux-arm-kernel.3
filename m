Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C9FC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=; b=tGebbyEp3zyIzSBt6L3YpvQS+e
	3XiaGi7JK+uXu+A8J0KGpgdc1a1nRwoeJrbwpzJeKtWYzPSlod+wizlr6yPNbbRM/WiArt2zGDdZB
	K3TxzKNjYXIymW9CNqSD/4l4tKYgpBUi2vb4u64oxRtxVTZdUlpi+MNHz9AOOgiP1797y0+1EZgOp
	h9xrtFi/p9qYo6Q1E0DMAVdSPlSs2p0ACyzcKYyeADSpLTpWqKNAUZ4zsrHtLlA6k2TCfwjM+Hvic
	fR69VR8K3ckWW9wWOk5AcJLDf6effrZwHNGnknX4g468uXPqFSO0C+1bWOEWtSP4Tqg5ybdYj3WM2
	/KAxas8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OdX-00000001GZs-12Dg;
	Fri, 04 Sep 2026 07:46:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OdT-00000001GXJ-3SK3;
	Fri, 04 Sep 2026 07:46:57 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=IEH6dCowFYkVcaYBHPhRPPT6HfFx6gXRhzI4SkLHe8BrkqygfYiDmttEZfq9CqY+bs2T/8
	DKC8KpFCPlxQAxspwprKl9Zj4n1xLP0FnS2T65ElkYBpMorCA9HYa2SlrXcgCwB9WjoHyJ
	LREyTHF2rVwUzSBUzvrWvNzW2QQZmP/mtavUBG01Fnl02xEbndth1kTVJbwJHSoIPBEPu8
	/LIy0D03vvfU/mxDTdb12TasItO0DL2CSsXQTnKL3hgBBZZv/CRA+0wRUVD4hdmzkjCL5s
	qaC5FHTBM/LbkYc7rsF6mTXjxE7AqVH8RGaDmCp+yByhzlqLfAQnxR0LvvWaHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=x8NGYwKR+/Fv7VhGnNMKhojBtA5yPbywehQdjPLSjgLKgmPLjg1N3lA2C83Ghx1zeYe+yn
	Ohd8ATSkkflXqBDA==
Date: Fri, 04 Sep 2026 09:46:50 +0200
Subject: [PATCH v4 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-2-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=1239;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
 b=VF7C8aGUlasLDfXs/AkUeCU+SzcvTP0kvwfcegGrPyJtZzSfFSunlMsKj2erwjY/+cwmOHWeu
 kpltefjMXOODzWAlOgNVa/T4NQHkBGdObtfsWapKPLkDHoBKFGC2ZN9
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_004656_026633_56EEB011 
X-CRM114-Status: UNSURE (   7.92  )
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

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema. The firmware allows a 32bit value to be sent as
reboot flag so restrict the maxItems to 1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..28c5713860468 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,15 @@ properties:
     required:
       - compatible
 
+  mode-normal:
+    maxItems: 1
+
+  mode-tryboot:
+    maxItems: 1
+
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes

-- 
2.47.3


