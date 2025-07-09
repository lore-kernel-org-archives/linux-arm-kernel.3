Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA08C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFXNzZgsIkYiG7MwBsHnpsXKT3JPGcxCmEcZuEJEixk=; b=IOddOPaUOYKekW1SWPH+6f3Snk
	40qWbhWx76BNGV/olgLg9MlpGFWIoDLqYm/8xxbQ3Rsq1qTUjy5IZcs4GyJRUmZSm0D+jaSQK2Otq
	jE3dqRa+rzArQhTKskSdq6t5R6vL5NmfsPLZnEemqoPquZJDIm3zAKQ46TNH3jnl550hOAfczufmn
	kElEvkt4RpSxAyYmFXEayLXatLqOx0cNBbeaooD4EdQun37BrKuK/zi0R7EHxIoRq+TpzZNlh+LGo
	fODIiLRg9nHSjMnts2zW96uSi2o0VcNtjAr3rKiJtb8pPMRhUZ2aSvMQI3BIMgv6LRUSX5RmnxjwC
	Eu4dpkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQ6h-00000007xb1-3rP4;
	Wed, 09 Jul 2025 08:24:48 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP2T-00000007mlk-1pQs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:16:23 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DC37BA0A58;
	Wed,  9 Jul 2025 09:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=IFXNzZgsIkYiG7MwBsHn
	psXKT3JPGcxCmEcZuEJEixk=; b=YOpLxbPBy2sB/nRcqt71Dov82gF3X8WjyXPt
	wRe479PuI8GNgFnakhy0wJ7b1xqjOD5JkDnkCWdouEAL6Tfqjc5zAf564Bw9ucdz
	pIsvic96F2/mJXPQJN3VfH/r2aStQfXRQZT30a3NIbcx99ET5FAL7j4NbZ6IwjVy
	7y4e9scKOpy+72Wu1JlTwFdAGH6c0cpnHAdW6eb9sJGAA8xnb/M3qzfmp8QCBtFV
	jEaWsrUD3QW9tpY3jJypm1yd5cF/8q5CiwZqMF2zy/HXDJ73ebiNlQ1mDSG9hO2i
	kY0ubMMiSocsf72JszPYgSTDrnn9ziiQw5ywSeeoiAkNlVAWokN5ChSktMMfex9R
	Hq+/MeQP9mxzP+8ovSoEqmijP0yyamFyXfMimoFUrYUC9Zi/IfBpH8cZcAuaL/rO
	KG0WGUj77KdRKWqyYt1UZfcHSRgT1hZ8WjUeiF/IgyRbaNS+1IGxDay+dkRuCzES
	qwVGonZlz2Gh8LyazjU7DJ2ze0tD5iOtDIPvHyYy4sVvrWgnf55mfLLyswh2Lxlt
	WT8GQqqr+PxhoOiBrtOlsLBz23kUr+iUZWI+6qPvjIGMCnpOVqhdQ8iscQVql4RH
	AZ4VjCsuBzz6fXJyAz5BSGwWGaaDZiYHRGLXEOUbgkl8oIZqwXa0VaoHJ0H7DvqO
	nhCaqTs=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:16:08 +0200
Subject: [PATCH v2 2/2] ARM: dts: imx51-ts4800: Replace license text
 comment with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-tsx9x0-dts-lic-v2-2-b9b7d056728b@prolan.hu>
References: <20250709-tsx9x0-dts-lic-v2-0-b9b7d056728b@prolan.hu>
In-Reply-To: <20250709-tsx9x0-dts-lic-v2-0-b9b7d056728b@prolan.hu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Damien Riegel
	<damien.riegel@savoirfairelinux.com>, <contact@savoirfairelinux.com>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752045369;VERSION=7994;MC=1191366156;ID=156413;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001621_945643_6D4F6834 
X-CRM114-Status: UNSURE (   8.79  )
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

Replace verbatim license text with a `SPDX-License-Identifier`.

The license is specified as "X11", but as other TSxxxx boards mis-attribute
MIT as X11, this is probably the case here as well. Savoir-Faire Linux
will have to confirm this.

Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: contact@savoirfairelinux.com
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 079bd3d14999..aa7298e34a10 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2015 Savoir-faire Linux
  *
  * This device tree is based on imx51-babbage.dts
- *
- * Licensed under the X11 license or the GPL v2 (or later)
  */
 
 /dts-v1/;

-- 
2.43.0



