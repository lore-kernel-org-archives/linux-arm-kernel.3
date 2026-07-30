Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC3C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkO+u74+e9THgGCVimFAAwGehYhdaspeWH8EGEZnuyg=; b=dBD2c6RstJveZ/mx0aSpYaZPy5
	xoDRssUUl6kBtJ30MAYB/fynJTaljUgadjMVaXv2FsIxTdVCqMXT6KTCwvrt46/JFUgT9+ssevge/
	3MuLnCuSsGamqvCJPgXkLF/y9uzBeiEr+2oRTTdqygmxjEjEHMSTy721K/lI/qIYnZlmKhlY2Nb/A
	ZTBwXWa4j2FHiUPv2+/jdncWU/YDx+KzSdb8HDDN4RS3kUXF/i9Syt1ETAI4MiyN38z/V0C4TUhEY
	ZK4l6hdk4zZYhp9G2duD9AW0UIQF30dNgBIZRCiN7u9CBaipDsdYJOYJCxQXc7Faj2Zngdqfse95r
	XseApsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOV1-0000000AIKE-1zVE;
	Thu, 30 Jul 2026 11:00:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOUI-0000000AHxQ-2XhJ;
	Thu, 30 Jul 2026 10:59:45 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkO+u74+e9THgGCVimFAAwGehYhdaspeWH8EGEZnuyg=;
	b=VacB9tOi+pzMpXfBgw/3U8egioiKwX3ug2Zoh8Qm8PcAEQXJkzkc8j8v+//+hmFq+41Hbe
	87uqScmNEdhkh8cBm31Dxd8+yp2fhlx/91d5PwB0z8i5bG+PnLusfHFFPjEnFOD4UDAnx3
	Hu0G7qCX6nRjW3WK5Z1Jt+5YzmSuwgPzQecL+I3UC7kkP47q4KF+CfJf2LukD1Ib8j0wK8
	/VJbbU3XIXGV5mssrjUcSSx/4iO4UJA/LAaiU1+EF0qKDvqW/WItbNunwEMk1TDvffdGRu
	dqlMwKyebXBKpQ4IYM6E5QoJEDcdj200BwGsq0Vk9EQS+05RdiShR/V1oh/3+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkO+u74+e9THgGCVimFAAwGehYhdaspeWH8EGEZnuyg=;
	b=gbW8pyi4/8cZcWrQR82clTfp3wXpt7ZKToqg+ycYxySfgY8ZoYWViQhs6311RD8a1Lz7rP
	wzCRwD+0WHz0m0AA==
Date: Thu, 30 Jul 2026 12:59:31 +0200
Subject: [PATCH RESEND v3 2/4] dt-bindings: raspberrypi,bcm2835-firmware:
 Include 'reboot-mode.yaml'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rpi-tryboot-v3-2-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
In-Reply-To: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409177; l=1237;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=C+uGckLOdITLt/kUyMrN4ykbfgkVjGfKLErvQZgVqtQ=;
 b=vJybdRCTWN+mgjR2wqYQP5Se3mSCCAqQ6aohtc+0jLMdBI62XixPgwFE4RhLUXUw+I5axTMLc
 QGONTYjQ/nnBKrH+DWjruxXjU04gXyUWnoXgo8GKmJwtYTginbOqTrb
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_035942_854551_1168C1D6 
X-CRM114-Status: UNSURE (   7.77  )
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
index 983ea80eaec9..28c571386046 100644
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


