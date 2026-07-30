Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA8C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5Pxt3vkSr0XpWjuyyhisYEqhM1nqOyLS5iWyC6pYgg=; b=WF2d/NHNUCbKBZ5M3pcqKtg0Wy
	BFK/9+g06mwMIN5kOq97+4ohQHgy6klTtBCo559YvfB7ZBv+XcdmTuOXiZh/IovFNy0f9p6bt9qg0
	XOyn33bxCmMPhZOiSDO+tdRCaXJA9IngswHHeOTEzAqy8rabE0CMmt2aAtf3iuUnQ4FAJRrXcXx8E
	1RjY/D8i0hrXeZ2hmBkT3kTr2FGsT76iD0NSQFSwTV8rQyROeEDUmIOtykAjVLgLBLVSXe+D9hsq/
	3BMSkycbG46U9a+DNSMhs/gNlNh3RGL/s4Nw/nyPmXfxpO2+6BE6SYQkjQPtPMu6hbxvzSB4AkmUX
	e3lecWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXEH-0000000BJlL-40KJ;
	Thu, 30 Jul 2026 20:19:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXE7-0000000BJgb-3fWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:19:37 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 39C3541C0E;
	Thu, 30 Jul 2026 22:19:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlIxe6CB--oj; Thu, 30 Jul 2026 22:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442773; bh=1pxtEPbbkPgv6h4h//+LaitoTkLz4GRWznHnxVBUQ8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h4HISSZn92Pu1IM0AEE9L4uS4U971ZTHFwAE5YxJv2cDsThm4GvQ+zONhu6Ho337s
	 HlkTEAzOKNL5bOhL1KYzSBLRFv0kicAzNiI78KJT2JuLX3IVGH1SW9YAZuwyiWrczx
	 qY6NEXIbbe15Vz0I2GyBcc7qQg7cU9Tj3BuQLd4nrtOlWqAbgYn9VMj3y1UfoR7l2f
	 JkM6TWWaQjUiWV12j9n/8HBkXMRnVnnLF4cmCpBgsXrQscvznnVZK4nrcjGAYZxzb7
	 t+eaVxS+RNI6586zLBSUqtPsmZlhT1gSEIvA/0hZT6NlPDsYfHflfLsHGO4SC3VwGB
	 G3rmxoe806OmA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:48:37 +0530
Subject: [PATCH v3 4/5] dt-bindings: input/ts/zinitix: document mode 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v3-4-2c8de712997a@disroot.org>
References: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_131936_057415_FD7D4F0B 
X-CRM114-Status: GOOD (  11.27  )
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

Zinitix touchscreens support three modes, numbered 0 to 2. These modes
differ based on their event report schema.

The devicetree schema does not mention mode 0, thus does not consider it
as a valid state. Add it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
index f1ce837b16df..9b51212ea9b9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
@@ -76,9 +76,9 @@ properties:
   zinitix,mode:
     description: Mode of reporting touch points. Some modes may not work
       with a particular ts firmware for unknown reasons. Available modes are
-      1 and 2. Mode 2 is the default and preferred.
+      0, 1, and 2. Mode 2 is the default and preferred.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
+    enum: [0, 1, 2]
 
   linux,keycodes:
     description:

-- 
2.54.0


