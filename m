Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6D0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJNp+wg038R4K9WJU61OGOSJ2cYgVjVUP4sSaAcjd4s=; b=Si9BdBPFCmYEPFBuDv5aVo6INk
	B52TXjVkUNNN+kbWP6cxcuPBwAGxEt7Kb5jw6cD7IxkiSE1Ao7CIHq7ktLbEbaG127ZND2J35cnII
	I7zWS+NoHnLcehGe2TwL4nRyO6qzZICB8jkqQ11gQxeq0w6a1ERu5BWfntTwzPCzdYE1NGYMM6zG5
	54DR9Ooel2T8zqzNtx+u6ESLaRRtf3OQANcMhgP0TW8IBauRjcHrPSgdr/BPm0UF3XWWNT538cFny
	/dWzio72QjStP/AJPyhaTh+5faqwgRu9kgG+AzwT2BwprrYNReBCcsWP0da1QYzV8oyZV31/1fP9j
	XllA7Krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSy1-0000000GC4B-0yNt;
	Thu, 14 Aug 2025 08:05:45 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSgq-0000000G8j6-2mLp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:48:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8A179A0F92;
	Thu, 14 Aug 2025 09:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=mJNp+wg038R4K9WJU61O
	GOSJ2cYgVjVUP4sSaAcjd4s=; b=kn5yB+OMjQn9v8OMbXfKznI5zLAfn/Dp2rvV
	/6s8yyZPttXIUJ/6BRVgAz9iQRftRS9EVfrqr+jyacrozjG5zoOuxMXP8oC+HkqU
	FmcD4XfcayNlZyKxUEecIPb0HXL7fwZiNByz4xoGH34Xj/0QemMeJzKT38TS5wSU
	8nK9Nm6o57XPjcbrNKgZZaiBh++BgstRRRbbTH0TIRI+Y5Wt1oGnhwPsIPL/NE2g
	krxk+CVjESytxKMyz6A+YExIsRhVjv2h8vnaHTqbaZI1HLGINBpkx0VY3yJyfVZh
	7mqs5swXWXky0YvwnWAP9FdaLZXcyzlK1mpt8nngADNqi4fY5E0vrxcxW69PnBF2
	/Cw8jH1WfTayUd9K1eD6b8nnNdLTP0Ct53AO3nHWbF/U1/EJ2JAwE4pp6ro8oUq9
	BxQ9O+mvFWUYRy3OaLSH7N6NPlq8qD1RyLX1c6uJebdoxfYv/EEPoCYoQ7miuUMT
	sPCtjSE4+zzPUSIFvhJ87FVRZ9lycrykmWTEmB0KsjUIF9+edLSJHu5GlY97WIra
	VORf3P0+kkhmDCDN/PNcP+nahN0HtNjDFKQYp9wLyFW7+ngK0mF4oJr5UZivcTpU
	PJcCltevnIcTAkxxXdNFTkKcJfr+e7d4N4ht9bPQSulq8kic5gBhCK+P6PmdN1qD
	/mcGQNc=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Thu, 14 Aug 2025 09:47:44 +0200
Subject: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
In-Reply-To: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Andrej Rosano
	<andrej@inversepath.com>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1755157668;VERSION=7995;MC=4228736068;ID=1088342;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E617667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_004801_193956_67D9A4DA 
X-CRM114-Status: GOOD (  17.71  )
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

Cc: Andrej Rosano <andrej@inversepath.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts | 39 +--------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts b/arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts
index acc44010d510695b28dc8e6599ba006856a89efb..3ad9db4b144254f5400ce894f99fb038e51f64f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts
@@ -1,47 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * USB armory MkI device tree file
  * https://inversepath.com/usbarmory
  *
  * Copyright (C) 2015, Inverse Path
  * Andrej Rosano <andrej@inversepath.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
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



