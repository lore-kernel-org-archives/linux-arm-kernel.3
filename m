Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47513C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=INofVc3vayZ17omOmsrTU0mCKgOXj0EdNGj9WOSzMF8=; b=vWj8c55bJJEsrPGGlE+nn1AGab
	ZGbc9zgBq765DillG8ZnSPGQItjRV1VRfcG6x5CTLPBm98Ju4dryuy31PJQnW7qRXaqZHyupPGV90
	Tkw2q8rADlaZsWVK9IPTfdMI3IxFj7SiIQZavdyUpScF6bEnpobaC6Tr+Ek2t6ZgeRTy27Dw9pYV3
	R1kpLn9b0GKB2KV22LOf2Xknz+sOz4qdwnATtTneXKH6feba82uisLXsUNHFXENlQVwUXvtg8XcCp
	ApLsd8j3ATBNqFp29zHFq9eeQkMvSumjVsjHjVq3InssRGlm8OKrR0KjxQJPo1xI72BhLHwSVdffv
	5laCaEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQt8-000000085uQ-3R5w;
	Wed, 09 Jul 2025 09:14:50 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPIZ-00000007p6V-1PWT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:33:00 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id D53D0A055C;
	Wed,  9 Jul 2025 09:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=INofVc3vayZ17omOmsrTU0mCKgOXj0EdNGj9WOSzMF8=; b=
	T6S0v3glKutswVxsbHf0SPuEAyb29Xy/bC++ria2PhKawxQ+2pFa50TFti1rUhzz
	BeinmgQaZDSSk6EKw1KccI2xVZKHx2veUmqUlf/NcOc20tbJjh4x3s8U/3+2HZUP
	hQcdjVaODvc+0mIBmRvwPPezbuCWS0g/cre0cYEC5QHPhMsEDABZreBRaD+ihHIe
	ZlkDIxQeJX3IgBC3QQjG0N4Nov5pOZd+QJIPni55jo2YR6hA5GqwW8zfB6KYYmAg
	OzfkDZjNFZQv9KGHaMYCxaQtmRKu9ZLakXsjDyoXVpBQX3VBkwkq6sKH9SYJwHRc
	h8tyPYniW3YlQaSKHLzEdjqFWi2r63840SDwNpIKzxsNse2vPSVX3q/9npEfBuSA
	KsfCy5quVTU/3yOTw7uRL3hsUjyMg/+TFWPge6OVlR7XfgQeW7TA1vRXv1Th3jZJ
	dVUxzCVE9K/0iUjLc//hHYbNoyWrjZV1y4oeZnY0L8QOSsgxW5tObkYzVrIKOgsi
	lLDT/s+aa2TZvkhw0bI+7au0Cx9DkQLPKgkrS8sJvU2ciZn848EV5w2OFt44GdA7
	oGiclZZ5t5mC6pXxROfUomD3fZbRKsEWhnmxA6abyNc27QQdohpgv/RNlAdjBFMv
	Vg/D0BBSaI0vot6+Q7h1XyjC8/YWmEj7HHiad0zcLTc=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:32:44 +0200
Subject: [PATCH] ARM: dts: imx6-display5: Replace license text comment with
 SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
X-B4-Tracking: v=1; b=H4sIABsbbmgC/x3MwQqDMAyA4VeRnBfolOq2VxkeYptqwHWSiDjEd
 1+343f4/wOMVdjgUR2gvInJOxdcLxWEifLIKLEYald717kbRrFlpo/HuBrOEjA1nt2d2hS6Bkq
 2KCfZ/8tnXzyQMQ5KOUy/0YtsZYXz/AK8LjR/ewAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Lukasz Majewski <lukma@denx.de>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046376;VERSION=7994;MC=4240065730;ID=156625;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003259_544429_A70F7708 
X-CRM114-Status: GOOD (  15.66  )
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

Cc: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 .../imx/imx6q-display5-tianma-tm070-1280x768.dts   | 33 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi      | 33 +---------------------
 2 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dts b/arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dts
index 16658b76fc4e..059750270fc4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dts
@@ -1,38 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017
  * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is licensed under the terms of the GNU General Public
- *     License version 2.  This program is licensed "as is" without
- *     any warranty of any kind, whether express or implied.
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
index 4ab31f2217cd..4e448b4810f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
@@ -1,38 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017
  * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is licensed under the terms of the GNU General Public
- *     License version 2.  This program is licensed "as is" without
- *     any warranty of any kind, whether express or implied.
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

---
base-commit: c435a4f487e8c6a3b23dafbda87d971d4fd14e0b
change-id: 20250708-display5-dts-lic-f35e09a6fc73

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



