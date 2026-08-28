Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230FAC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlINXZ+EIw+EgELAuUh1rjQ3RzB2ApdLaUM4jUAlrNA=; b=J676OkN1sjMEhWyhAt68ozbnDK
	CAVqqOkODefIxRvISfrMd/2+xXPsozeb8rXOR8Ixw1vai0/H2lzso+slEftv9zCGeQ3iW4OUHtu2C
	/tbwU7ZcNbxf3Bv5C/Eoh9KOPv8ne/ec8B8kP/blDKwaUKu1zziKXKquP4N9Iwo4p+u22F727Osh5
	VhLEfUT7s6ssKGQ8gkACMGC37k3kXWmg0LxTPjUXPaaf48/A5HVJ8PgnqmY4EWsUsv3AnwaaJ880t
	1hsv0+2VBopA41ymnnQ7ZhXc9mcSluKsDKcbykoEuv81ln6Al1wkclDHzBSYi86zz0BDOpd+o+e9X
	sl9lchUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1S-00000005utW-0VNH;
	Fri, 28 Aug 2026 13:53:34 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1M-00000005upZ-1iN4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:53:29 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=T+kVndoVMQvcJlSh5aszb8qsYh26yPT3Xng40DevpBiud/kjPoWou8NGvjMfDLbmi8nBgQHPg0Uw5P2QpVg2rrlgz8TkhxmLioK3tFPkGXAD0gJKdaDkiR8RRakJqJgKIaFcDuQdFMMRkfYJy1nFocEn4G2dI5JInINEOdO8RAyseVEFNna+kSE+g1Q/gM1TUc/gaCO4lw8G7i1xtulEwNVYITo6jmed0cbQxGMbpDN7qXz9QNKBKPt7h5p9Wgt8ORe42IiZVhAfUUPpoATfK5uOwY2Gg+627VwoaCrv9OIdpLASNdKsIS4YiVm/4jnJMuLThUHGuI9af4hr6tLwpA==; s=purelymail2; d=purelymail.com; v=1; bh=6SUv4EjBs+WWbQ1x1L2Y6dDRKZcRFL/Dgpuq0wiZp38=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:53 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 28 Aug 2026 15:52:47 +0200
Subject: [PATCH 2/2] arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl
 header path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mt6878-header-fix-v1-2-b70dc9b2479c@mentallysanemainliners.org>
References: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
In-Reply-To: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=918;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=6SUv4EjBs+WWbQ1x1L2Y6dDRKZcRFL/Dgpuq0wiZp38=;
 b=zpfKdYG1bipRyx1PxUC+i4rAPitnzbfjRcbPcjAFRJDO+72mQbAubk4h+4ODo8eUFgwzdkCSq
 3DpXWYJnsY0CNYSmIY6a8RWtyMUnq5F+qxW2apVRcHooJMsCiBotDwE
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_065328_503231_EA8800B7 
X-CRM114-Status: GOOD (  11.16  )
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

The header resides in the dt-bindings directory and not in the
dts/mediatek directory. Fix it as to avoid a build failure.

Fixes: c0f1fd9eeb317 ("arm64: dts: mediatek: Add MT6893 pinmux macro header file")
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
index 982bc95c471c..7cda5c73fb68 100644
--- a/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
+++ b/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
@@ -7,7 +7,7 @@
 #ifndef __MT6893_PINFUNC_H
 #define __MT6893_PINFUNC_H
 
-#include "mt65xx.h"
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
 #define PINMUX_GPIO0__FUNC_SPI6_CLK (MTK_PIN_NO(0) | 1)

-- 
2.55.0


