Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B76C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmSTT9MXouufQJWGkDRnemigvfWNAFOH7bjz2ZiFIZA=; b=Hy5GPGF9kF/G4EQ6uBiYpSEx/l
	I+3CyO8Njh8YQlqgzGvZ8Pye5RF9mPnxpvPVTq1AQS77koDKp46iFAuC2nYgCv2pOvBCP/nV577Kr
	+5fPHdq3mKQYrke1uF01AmapRm3yi+mirJVyTzeTAEozn+IwzKlIckpRnRdSvEHSt+8KmC1Lk/wPr
	Z0kZ4zVHHDT4ASDMVrlC194BbZ+4iZWf3pYo3rw5cGv+p8QGYfX5p26YYH77G6XK77v+V4NKAOKcl
	hJ23d37GSkOBJLCJ0+JAYjgqJ9XKwO7CfdCeQqe2lwom5cSvvzhKyCW6v3gsY4kHotQuBGDxyQ7Ds
	Uw/zx36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1M-00000005upx-3E3M;
	Fri, 28 Aug 2026 13:53:28 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx1G-00000005umS-0doA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:53:23 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Bb4aJ5Qb4kOZxD736D9iGv6yVSPhK8VULmRQi2enelB9ktsUetMLX7REqTQwNXdvDUq3/PRvvQtspXCdaIVKT+ak9wAWruyKfEiC32rZQ8FY9mg/EsQdq+9S/kfi101Nuyb0Ho5AzigWLxc8s/2AjHUaQAUKSMvDf979PS+w/ScNwQPMlOm8CdjjQKTXqS+0Ji4t36vHMx5i9eL0MLXjIF+H5WUmVx1LDWvE9k/7jXag1jxbMoTKlC+9QntVfMrGpMHNLc4KbRcCKUgp027TpVyl0AFk0+njKQjNldS53nQjriPPNSs69I+8mu1BjnoQ6dviEL7Svvgf42ApVnePhA==; s=purelymail2; d=purelymail.com; v=1; bh=rG2gddjK0mFNccoof/5IKOWP4NxA9PADvpZgCOLr15s=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 28 Aug 2026 15:52:46 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl
 header path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mt6878-header-fix-v1-1-b70dc9b2479c@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=921;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=rG2gddjK0mFNccoof/5IKOWP4NxA9PADvpZgCOLr15s=;
 b=KE6gBW5Hj5eipAueNeLJy8jYk3lPzYk8ps0ZikWrqjP4QTqgVHJN9wEf9tTYwFAdZJ20fl6Ho
 1Sl/4/HcOLFCaKPX/3FOJWwrXuLEmBZK11DUpdNdl28aEiRnkmrlauY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_065322_258171_A27A0C67 
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

Fixes: 07a9bd3079e30 ("arm64: dts: mediatek: Add MT6878 pinmux macro header file")
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
index 4e8e475a7454..5aeceb904b18 100644
--- a/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
+++ b/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
@@ -9,7 +9,7 @@
 #ifndef __MT6878_PINFUNC_H
 #define __MT6878_PINFUNC_H
 
-#include "mt65xx.h"
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
 #define PINMUX_GPIO0__FUNC_TP_GPIO0_AO (MTK_PIN_NO(0) | 1)

-- 
2.55.0


