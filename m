Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34EDC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V653CIHpf+sCA9FsZy5lY5aKTZr7iBRrsViFH9Fa8Ck=; b=1H+eOElsShAdtl0p+QMwlAGv4q
	p20ffZd6GAHLtQ63H6taNT32DraFrmRF+/eW1B89RQBmXxg9+ZyS6hVMFmkpesMxIpuCXlk6aMiHi
	d1T4Wlm5IQ/HIgoZExktklMkXEgMAa25nMvNpw7qFtYD39WAcC092lRnAFdR+kbfq+nTg8jJ0jJnc
	gJHUEP2j+ijvqdpqCQRwpCSs9NOxNl3amksE9vlmKfV8J7CWK1E20ibUlDPLolk+vJYqv/SkXFF9d
	+k0BVvlgauvCmm9xXzun6AK6skwYpTmth1yIMsyIjJs2wmKAZKRAz1952UAI1jDcQiD5qvsaTE6cg
	HSvFzxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDRL-0000000AN4b-0jvJ;
	Thu, 03 Jul 2025 06:28:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDOy-0000000AMhD-0S76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 06:26:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0DF21A01EB;
	Thu,  3 Jul 2025 08:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=V653CIHpf+sCA9FsZy5lY5aKTZr7iBRrsViFH9Fa8Ck=; b=
	jebrNMu/DAB3eGxddhmjP6Ftt43ouIkz5H1RlbibUy392ojs1UxQppNX/gxb0V4u
	J+l+0UWZKhnNzPRQKkFplKEmCit2AgAVMLNbaIZ7fFaiUy+EGioKRr0LVb3lyLwD
	3i3PZc/pCnaVdLu+yyb0f00CBmXegNFzefN86kYYJDp+M8tfIGLioU2z6xnuMuwf
	NIWEAN8mjHvPwYQrJp2r9mq1Gmfl0rtWNntJINLpLEfSjI4Er35q+/xOiOaClDUF
	muhIKTlS31LEoug2arqSXxVGR0rTB2Hlop6NpJderdjlhoBl+CpqYitvVFgoq09Y
	BDTBFgmC7vuVM7ZBpOaxLaY1/goVIl+ptBKFGVmRCjWA3Jm8jtbK6VspQMYBw/TA
	MjSoH3SZFbhDK9gyVHC4UuOTVc90IfrNnB8XX2FpC8GRjFo0gT2ne8NxIb5IJeIg
	QObbvljb/ayVDnzTKOa8m4OV8IO04QJQk86vUCvY8RYV8Q51ER4F+66rOI8NuRQH
	ctGtAldZZ1fPVMUVvn6bvDMUzREB64QK+l9Zrib8uxTUWd8j8mwQ/tYnCERnnqGA
	kv7nohsIGAcseq38uK0bpjZpwplq02xPN/wWPKoAgnVBBW8KLmbX8RuWDIMXPxB0
	9iS/70lDSxRLwk4w2bvNNd5J3gYrFsKVg0wo31MB6eA=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Thu, 3 Jul 2025 08:26:16 +0200
Subject: [PATCH] ARM: dts: imx6-compulab: Replace license text comment with
 SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250703-clab-dts-lic-v1-1-768cfb78ceda@prolan.hu>
X-B4-Tracking: v=1; b=H4sIAIciZmgC/x3MQQqDQAxA0atI1g2Mikp7FekiEzMasFNJpBTEu
 3fq8i3+P8DFVBwe1QEmH3V954L6VgEvlGdBnYqhCU0XhtAirxRx2h1XZby3Q6pT6lkoQkk2k6T
 fazc+iyO5YDTKvPwnL/JdDM7zBxinAVp3AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Igor
 Grinberg" <grinberg@compulab.co.il>, Ilya Ledvich <ilya@compulab.co.il>,
	Valentin Raevsky <valentin@compulab.co.il>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751523987;VERSION=7994;MC=2198676828;ID=225030;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C726A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_232632_610044_B1BE7726 
X-CRM114-Status: GOOD (  19.95  )
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

For imx6q-cm-fx6.dts:

The comment header mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

For the rest:

The header is cut short, there's no mention of either the GPL version,
nor what is meant by the "X11" license. That would mean a SPDX of:

  (GPL-1.0-or-later OR X11)

However, since the header seems to be a truncated version of cm-fx6's,
I'll *assume* that they meant to use the same license, but CompuLab will
have to confirm or deny this.

Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Valentin Raevsky <valentin@compulab.co.il>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts      | 38 +------------------------
 arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts |  6 +---
 arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts    |  5 ----
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 299106fbe51c..e1161a750d60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2013 CompuLab Ltd.
  *
  * Author: Valentin Raevsky <valentin@compulab.co.il>
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
index 713483c39c9d..a0e73e71ec5d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
@@ -1,13 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Support for CompuLab CL-SOM-iMX7 System-on-Module
  *
  * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
  * Author: Ilya Ledvich <ilya@compulab.co.il>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
index f8a868552707..4f989c3b0ef7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sbc-imx7.dts
@@ -3,11 +3,6 @@
  *
  * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
  * Author: Ilya Ledvich <ilya@compulab.co.il>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
  */
 
 #include "imx7d-cl-som-imx7.dts"

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250703-clab-dts-lic-937f1ff6ceab

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



