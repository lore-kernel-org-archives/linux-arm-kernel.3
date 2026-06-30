Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D36C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq2ATW2JSNHysJMJorGQ3YDIHg6LPeqIwvJYtvUnwf8=; b=vWY0gMXzFLLQ74wduuxPMBF7JP
	bsazi7x27RL+wd/blC/UzjW63dJgYMjaqCUfUkmb8Nk1U4y9NZHJ3mEuh4S+MtO6l/ZrAclxKq4sC
	3Y+yXzpzKXrzP06VlNFBOdaVDnm0Oh5KC4sHEbb6BEsOvA6oaTYi5HNcKcU2kha9O/rm2TccoQDAX
	b01H8tfeBDYOV72IFpKJHSM1IvOTyPU/OV+0skEw43RFIW8J5FTx8pMjP35M3k8NZK23GDJH1GOYX
	iezYv/T1gijvK53bNqyAglowS95QmqkfUEh/FLmKR2OdQB+rfDzEtg0HhqLC/QnXLFVLPhqzZc37W
	JktU2gJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefYP-00000000Cc3-1zpg;
	Tue, 30 Jun 2026 20:59:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefYM-00000000CaL-3I5Q;
	Tue, 30 Jun 2026 20:59:36 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782853172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq2ATW2JSNHysJMJorGQ3YDIHg6LPeqIwvJYtvUnwf8=;
	b=jV/r2iDPomCyIGyT3bclVSqN4Uz7/VGsP3ffmowanT7Utgmw7/9O0mZqNsdQaCB7Vt17Io
	rvIc5V+wAlbs+3MBWIgnixdlsHepw9mkWUACiQr88soc/ANiklACKdUtp/C7GLuTtSU3Hc
	vYUW4UdXGiz5WzMcwn8bmI81EsrJtc1ILG7TLTRcygs6kNABv6THT3Qax6w8cjVV2k1h1g
	+XmCqVyATs/U4VuJzZIVkaNETIIDOE15cYa4maXyXYZDR2UFnYsA+L3uof2TIIVzlqVisQ
	4ksqR4HHkcg103fbg097bhxRAwGGLuTkzzet7PCxodbK+CG7434foyVSai5+yQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782853172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq2ATW2JSNHysJMJorGQ3YDIHg6LPeqIwvJYtvUnwf8=;
	b=grPEsb7i2JpEMZuDo9sS5jTSHv0kGUGLPpLNNCjHLAN+IDiOhc1mdSrUhy3bs+WmXhV5DJ
	hGSIAMj2XgPkMoBg==
Date: Tue, 30 Jun 2026 22:59:28 +0200
Subject: [PATCH v2 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
In-Reply-To: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853171; l=1166;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=PNNiSTCi7EhpAclKeO532TViWIYhN8h+fgNrfR/aiXU=;
 b=9YJyLntrGvo+CpvtMU9SzUYAdKoIjLJlaUK+K0FaqltIg2LL4G8XghH0NmcVVUmV+KVFFELgy
 rqu/HSBw1F1B9S5xmsRJMrXQJUAIhpaBUpNmqZqux2grnJ/PAgsyQXv
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_135934_978420_5F77B52A 
X-CRM114-Status: UNSURE (   7.98  )
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


