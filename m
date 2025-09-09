Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88268CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3hayuDfHkSiaf21en8K8f18jrvM/67ABIR7N++0snw=; b=KB1Ci0WQzNNXg7n8FADR8mV7XQ
	sLmaT+SfmTE3KQAcU6BrRl6YDD5VB95cCrus4p+J5ACo4YBgg9wWNyNSMWllEqrMhf/84ft0ik6YC
	DYnEoagmUJ0qEeFCsmlnTUY4iilsl7L4BL0FGL1pLmqdXZClrZ9uTNft3lKeNDCJWxHyA0gtzwnwU
	QyNBBzP4cSnFqcxJfyHAM0xrlghjwMdhyisShD54LxVvbMnEPVePyE8i7V3HzNWh6sX+muBAHNahw
	B8PnRyJ3PDRAFf6Nmitzn9UfQ2T9GQJokgCYsgyIsSBnGmXwIe7uHURzaPjEcl9jw5tZlvSNdEv6l
	T02qdvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssG-00000005Bx2-1WYs;
	Tue, 09 Sep 2025 07:34:44 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvrRp-00000004Zvk-2QFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:03:22 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 47FAAA0B10;
	Tue,  9 Sep 2025 08:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=j3hayuDfHkSiaf21en8K
	8f18jrvM/67ABIR7N++0snw=; b=StZn9836bpGmTgRW/uCNuPgevJ7Qautq0os1
	/tLNoFtb9Ps7d3mDuQR0dWWakYzAHUzoIaM1QTCrwTAdjt3yK3/HsVHebJgd5Zs4
	CTuuoF5273HUXpV7wgiLNgKt/Rh5Sa7dEuxoUr6Gi1g+m7nuVIDcRkTh8pkTqZjO
	ivNLMnb0QsoCcttN+o/F0BTyva3k7LGZJ/1JCNhfc2aH5GKHlQ2D4Egpm3qGsR8I
	Ew/pvyUhX7kAK4XIX5RitvmnQjUvfkPayuJZ2RfqtVEfEHx13wY2y+Fj/WqwHYq6
	eKcu0RMB0FWfbwl4KJu4T07jE81GX0Gq8eFFE6Yj0+BjtlMlFq/rcrFt/OZr3TDD
	3hRzbi7HClNiU0DlC5Krza95LK8gBn+za018pDZNflXsc0Mnmn8FsGGAMe91FvFF
	eyAWJryoOtQCM2JXtNbKKZ8EsEVgNd5ifGCzT19tkg+eakMnqCHjIry4CLNHxNCa
	SQd8vnQbYC314mtuzDwjNXWh6fBmrFblsF/QBdGv2GomvPlfCiTGwE7f93P/suwV
	VzHa2V12071Rbt33jO04FIE15uI9wPsS3OOyjjJKkhfdhJQg/w5M/8Aipyvz++7L
	F05XA1yKHlZ9KGa66cKBr86+hqdp8EqOcu8q70skXre7nrdzuyUFz8POmlY5GdAi
	ibxwMec=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Tue, 9 Sep 2025 08:03:12 +0200
Subject: [PATCH v4 3/3] ARM: dts: imx6q-h100: Replace license text comment
 with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250909-sr-som-dts-lic-v4-3-02f4e0e440fb@prolan.hu>
References: <20250909-sr-som-dts-lic-v4-0-02f4e0e440fb@prolan.hu>
In-Reply-To: <20250909-sr-som-dts-lic-v4-0-02f4e0e440fb@prolan.hu>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1757397799;VERSION=7998;MC=2184406358;ID=61061;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_230321_774202_75CB5CCB 
X-CRM114-Status: GOOD (  18.04  )
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

The comment header mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

Cc: Lucas Stach <kernel@pengutronix.de>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts | 38 +-------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
index 46e011a363e8827e84008dead0390a5e9548ffd0..c6161546a34e16cc9cdc9fe08a569c8c1d8ceb11 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Lucas Stach <kernel@pengutronix.de>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License
- *     version 2 as published by the Free Software Foundation.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 /dts-v1/;

-- 
2.43.0



