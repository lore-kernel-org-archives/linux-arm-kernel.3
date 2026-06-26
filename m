Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E000CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1nXhp9uh5yT71pzm6kmUN3rkr3k2dVlUOP+VY4lLpU=; b=fY7OCM2sYHmSUPSEMGT2UKKl1S
	iGgcgQ+mpqpcMaiD1ZLa8Z5LMHmjyj3Y7B1TBjF86UOdO6JHynTlb/J3bAMbpGrU9kWwooUkqNUoR
	o3siMUWXh4mriYAqd/G0xUlu4UnNh1jNHmrSNLOjj8MpgTP/uj8azIfxIFtocIdcOk2HvqK/XPQ1y
	66UFyRde2ymszEI37f6scXhV0A0e6pBERBYvQBAQHN2Nvem6rLgQRRzYkp4Mbdss6Oge3hCFJN+Xv
	SH1LfhBLkDXio2QNpINWWMzDeiWXiqzgO5eYdXBtQjs5GdPN2MKlo5FtZqJNIs+S8VQwXNgJHon09
	m25dbBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd15s-0000000AgIG-15jG;
	Fri, 26 Jun 2026 07:35:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd15l-0000000AgFK-0Txm;
	Fri, 26 Jun 2026 07:35:15 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1nXhp9uh5yT71pzm6kmUN3rkr3k2dVlUOP+VY4lLpU=;
	b=yoxMlw4Uc6+g/Z/qA56yYQU4zmwvgSrC4C0ABFcNvfTPKCd3rBgTDshLxB4mmeIZFNavdn
	rs3eC6aUbBlisRu045pTI392nRdFpgd+rwy8K/hua7H6h5V10bRuzS7PJd6dlhPRZ7X3Tl
	CL0Y8DkmSoSzZk4M1I2+fH2HzQm8cQ0DXUe0IIdoWmUje9hEdmC87wBh+OOQqWiVUTzPYC
	wLiGJ3Jtnr/Ha5mw5c+zCw2YDBj6/5avm1iqBWgi2zXd1Fyj1dzlIq3GeW8cIzakolfPHb
	lmPvkUcx/z5maX58w0hmGOg8TDp4s4Ssdnh84JyAp2LkDgbIOQ1LYwuenoH8bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1nXhp9uh5yT71pzm6kmUN3rkr3k2dVlUOP+VY4lLpU=;
	b=MsbnVEMzdVCCp+HzzBz7dHAEoCSH7cKLW8aSYsPvOqQ6jrEI/989h2nFDvJYtAyDbTYdka
	3AsGdKknZmukUtBg==
Date: Fri, 26 Jun 2026 09:35:05 +0200
Subject: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
In-Reply-To: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=1100;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=9/ZQNCq5gJY87Vlwivg99tckbQQbIWZpKEao6SW3Wus=;
 b=lBV1L5rIbQd4Ur3y9gSNPOEuOD160vmFYq7f3X+nbyfbIw889R1ezfKZQFu8IVU2p5cnAMMnx
 r8HCUANasTPABneSf2L9NO+q8borCQih6yctV0EjZCQb6G75qtXyBT1
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_003513_308676_A63D9104 
X-CRM114-Status: UNSURE (   9.11  )
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
reboot-mode schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..30b490e0d9fb3 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,11 +133,14 @@ properties:
     required:
       - compatible
 
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.3


