Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452A2C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BE4ao5MP8rbHBjdHtNFtYJxy5/GgWgE6oAwjYaQQuHw=; b=x1pojGxvISHkQgfxcxXrZlOLQi
	Tvbm/iG35MD5OVzDCBn3DGm152qyZ/w8vcL47GhP0NcnBHf28nzEFldZEZwQiUqaIwlnKODxv07ma
	xGvUWSbrCpOcz9kl6nzix8ucA3mBt7+OBKBE4F3rFhk5eYn1zKVEjvr2N7ekRwd9TGIEuxOrePnoJ
	4+fAD8jhnNm4csZx4ASg7DU292Ay4OrsEtiLp2Dj0bkWyjKNUA3bofufX/tZRJe7a6Llm7fxKcb9G
	yuDpw2dn2csiwJIDRXJFpS+G3o1lpXGQffj/7ORClerpnZLQijpMDUR3v9tsTL4wBPj01IpCZiUrF
	3nys3KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQmE-000000084Gz-0rva;
	Wed, 09 Jul 2025 09:07:42 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPHH-00000007osn-2t5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:31:41 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 57D28A09FF;
	Wed,  9 Jul 2025 09:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=BE4ao5MP8rbHBjdHtNFtYJxy5/GgWgE6oAwjYaQQuHw=; b=
	IfPVUmc5nGkKUJ2/gUmLmw3mXJbQ6DsJ5mv4G1Ejbj65lMP/J0EActDUHgNqCIqg
	5+aM9MFTqnsA0rETeAu0b4GajsZV1qBbBfL0qLoPMKmVgklLgIhEY+5HSgr6eE6o
	VPX0I6T4/Vxoc56sIcbVoQbQ+plNBlEO/igUUS8hKdoF+4BIiRrvX3uif/AJdcvV
	BuLjVCRPOuIRUVVsf4OzS0iS4smZHvHfAPcVfkcQXqn5eOy3BEZC4AFJKM0y08S6
	gwnsqEI3GOG6mFsPRYe6/8iQPQl22WDdMp9n2XSMqqlGUSRFeag88CCr2WDbNxLt
	u9P2A8Rl/QB0XxrLANVV/2PdUfFlfLA9Javbf642waryKTGE5Zbs5GPUs64dZxNx
	Ni9u4z3nKb+IrShp7zAzQJKYwrzN7lsEBi8NdJQ6SMpDqyIkMw9Pu/zppo//gpWw
	H3tfDc40xOBePIdhgL6uivqJOjFNwiAm8m0xwFDQwldOQcmBECq4oK0eq9FcpS+q
	qw4Z68oLrwcCYXJ5LmSAbPqoYxqCAjZR4kkpFAQB6DeHNN6zkm5n3vgPbzBxPqyO
	cTl9TxWvSUNWlNxn9ja8EMOblozrJAoORU4HJHaxKwlXPl1k2SaeBd1Mt4cjcp7i
	A6NVvoTETjj+JvnlwpauMEHES5CNKbDLCzg509GV9nU=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:31:31 +0200
Subject: [PATCH v2] ARM: dts: imx6-litesom: Replace license text comment
 with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-litesom-dts-lic-v2-1-b907084ced96@prolan.hu>
X-B4-Tracking: v=1; b=H4sIANIabmgC/3WNwQ7CIBBEf6XZs2sAMY2e/A/TA5StkLTQsNhom
 v67tHdv85KZeSsw5UAM92aFTEvgkGIFdWqg9ya+CIOrDEqoq2iFwjEU4jShK1xzj8bd2laTdXR
 xUFdzpiF8jsdnV9kaJrTZxN7vP5PhQnkv+sAl5e9hXuRe/y9ZJErUQpJ2Uks7iMec02ji2b+h2
 7btB2ePFS3HAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Marcin Niestroj <m.niestroj@grinn-global.com>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046297;VERSION=7994;MC=3525334923;ID=156592;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003139_960033_3998F257 
X-CRM114-Status: GOOD (  17.49  )
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

Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
Changes in v2:
- Fix msg
- Link to v1: https://lore.kernel.org/r/20250702-litesom-dts-lic-v1-1-401e4d141bf0@prolan.hu
---
 arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts | 38 +-------------------------
 arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi  | 38 +-------------------------
 2 files changed, 2 insertions(+), 74 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
index 5e62272acfba..7a4127670a6f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Grinn
  *
  * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
index 8d6893210842..c387753f833b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
@@ -1,44 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Grinn
  *
  * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
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
 
 #include "imx6ul.dtsi"

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-litesom-dts-lic-ad9774ebde3d

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



