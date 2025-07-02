Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC8C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoVGFtSX0aw4O03mb0XIG7BE8H47lJYeCCa9lQZ4dcY=; b=GbKvh7HAQokv4lRLocdSyCRmQI
	+EZU0YoiR8u127TAX6GEwTuK6jM+3E3N3RIFY409nQWp32cWYWUSjmg214KIj0kqr1HqKnod9zNd/
	ErJgklQlVBKraYvcg/Y2xL0Yw0+dCJMPRsEA8sQ6twGNucoEJpYam9aZsPY5KiZPSW7xw+PeNH3Ln
	OZhK5Rl8GBtoYm0kUReO6eOxEODtAt7NScMKA40Spf2CH70jDmiMXqKkAIvp9RLoLPo2DsbLSm/eA
	dCpTa8WQcGT7+GAu0G175HtJhsI8j8ql/GPbOHvGTGrkqo3XpZOz1UCt1AlxWWdrLwei05RUttOv8
	8UfLVR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvu1-00000008B7n-0Tq0;
	Wed, 02 Jul 2025 11:45:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv3o-000000080Y3-3zvz;
	Wed, 02 Jul 2025 10:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34CFA461B0;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C28CC4CEF9;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=DxOrqNd9oLxm5FY8Ovl6KbdgdkoW49USz3S5Sld0MXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aOuRzwf2PEmzFRj75TO6aBcFBZfkcH4PYTs3ZqHT3tYfqF+DELK7eW8xTfagn4Zgj
	 0FKiTCH/RQ1XlAf6mD/pyZHyEKjP6nthwxfsfD8o0Pc1t7b7icg1p3OVcOa6SRnzsr
	 TSi4JYjr40rpHFVkYPWdZOA4sYmzKeYM7XAoMlwWcJ1hRXwsO41C+Km02VklhWSRuu
	 vZCysKpBX4AyvC8QSFlNmAxzx1DmIv8CL9Jn/BD10KpfM11AtX4BwQEhp/+cF6KoRs
	 I036ZemkdgHIMTRn6+pBZjBR9I2hWbt9ZNGacVDnWZl2CVQPug56Wby7mnjMCuRBeH
	 Tx2hatlGLGksg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037E0C83013;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:41 +0300
Subject: [PATCH v4 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-4-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1060;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=Kx6Ejx/Cft8/1a8kT4GCe+0clOZmBvvSMcY6Pz+w9ns=;
 b=AZP21JjPvCISZGZjX1qyKkhhLBxQQwgOH+z0TIUIG9ahFKql6YFoig37lshBVbGsC4xAWQvbC
 JOLFrYQDjk1BWkpaA8qo4r8yeY72ZHU1HHzSECHF4VDgDm2oHBC8JkN
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035129_030446_26324ADA 
X-CRM114-Status: UNSURE (   9.27  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for watchdog on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37f0e8a7526cbc99d5aa0d4edc9a55..ba0bfd73ab62a86befead007d4b7d2a870b81a0c 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-wdt
+              - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
               - mediatek,mt7622-wdt

-- 
2.50.0



