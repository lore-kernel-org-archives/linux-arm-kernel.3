Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8BECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYZQGMIsBZJ6zesK/ZZPs9ypTUtEAFj7kefQq0k9z90=; b=b2RHyN915htpXACKBUg8xD+U1K
	xau/p/yVse3BCVQegmKUmbtshHoS5j7lWi1kd4DdA+sluX6GS8X+iChB6JUAZLEDkj9PgMKUXdowI
	/NzcmXgO+ievU0OgGYyv7oxr2LdbSRIeaetAtIFpNs9SFomcg8lbhG8HAcK5GDVgXWA39A4ysiat8
	MjOD+7N3vJQc0LmRbgg+JepIB8RmZmyot7MfQ6wecgR0BwpFwvFFsRBg5emV/0iGJXWu6qTR7s3pK
	ZzNgoKcHbkR5Gh8zRcQbRrSPFoLA6XQw9qibYf3ys9hZdxUd+SbNvd1sCX13ZrKvfB24VzoCd2byM
	C+sZ4Uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umT0Y-0000000GCMX-0N1H;
	Thu, 14 Aug 2025 08:08:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSgq-0000000G8j8-2yIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:48:04 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EFEACA0255;
	Thu, 14 Aug 2025 09:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=bYZQGMIsBZJ6zesK/ZZP
	s9ypTUtEAFj7kefQq0k9z90=; b=rT2moRWiJtxd9erkYOaIuYXi9kY+9/GFH8MG
	aIm8VrOfhQxfVKCkj6IjpNfZ/abglSiJ4h0MX7CTZcGJExz/nJiXg3rEiCiNxZh2
	g0EoWOaQjKIwrKU/nKaSbJG2ZmVVyIHWnhkeYsFqQdD7zG0a8AFKFEMJzQxqC79N
	LUfKTRvDi8veKf6jiNionLhuyRaYClRv13YgOqpUiPKh40gZmGhRWL/lSVw6xXs3
	rfAKzaePCxKpQ5HY9qBp0sigePLtgwe0sBRW5gDJ9glHt3WTwNqWr+56NhyiVJn8
	+y7ogRgd3ciVtJBj1fBcHjrXLFNr4ON9A3a2ACEWa6hTAGbk/yiLJgOXeZVlbc6v
	8maZIB3/ZgmewWPMjM/SZmdl4uwHg0s4yHgPL0ThryHYoHJqVyPkG56RM+Xn8GWU
	l5nm3qxW9begVmF02CNbPKzgRrNdoVcuI4iP2Fnecggyj4m1jUEb8WiZ9YpRdGym
	sH+sj0Liv3iO//0KZcTtbLz86D+OtKUEkQpE6Cg6CeevZM72hTSM2Hweng63hxrw
	tgUeV4BldKCRQ3TGzHbp7blMwuTp7mg9plETNPEzP4EcZ3Ofh2nDXYV9oqgztseY
	TjwJ1Td3LSWclWh8EkgEaBiXXK/KPkaf2b0LiiBYQ2xN4OyK8XLFpRZJ4JrQy65u
	Hd8G9lg=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Thu, 14 Aug 2025 09:47:45 +0200
Subject: [PATCH v2 3/8] ARM: dts: imx6-sabrelite: Replace license text
 comment with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250814-imx-misc-dts-lic-v2-3-faff7db49a5f@prolan.hu>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
In-Reply-To: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Troy Kisky
	<troykiskyboundary@gmail.com>, Gary Bisson <gary.bisson@ezurio.com>
X-Mailer: b4 0.14.2
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1755157669;VERSION=7995;MC=1443896893;ID=1088343;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E617667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_004801_204330_F28722BC 
X-CRM114-Status: GOOD (  17.32  )
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

Cc: Troy Kisky <troykiskyboundary@gmail.com>
Cc: Gary Bisson <gary.bisson@ezurio.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts | 38 +-------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts
index 33040761b253ae704c57797a1d04589094a7c7db..c0771645cad78f22e1bafff77fd29069d4db4c65 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2011 Freescale Semiconductor, Inc.
  * Copyright 2011 Linaro Ltd.
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



