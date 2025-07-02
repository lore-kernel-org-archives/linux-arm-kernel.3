Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CACC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L9mawu75BttQ0R8C0ZKgWcwI6qvXco1im84vXfksbO0=; b=TceR4SwLaEA1W7BBCa4pPD5Knw
	OyqamCSy1MTpJJedGnZag3zCGL1gSuRHk/dlRUqXOb8C+S54mUmWhizuz8g/OtVCdYLD13HisIWfc
	Ta8adeM4plAGvecxkNacpZxKB7CNJRTlc/lnPm3emuEu1zteoN5di8acLe9SNwb0+jv7Y/9ZdZZFE
	IoOK80PLDiuJcWUAbvFhcp0f1nrsFz1uJi+Rt1dwoQYORUuuy8zxdgWLr5PPmhyqlNT0+Hx2kET3Y
	1w9yCsbk9WlAm9lCfPih/X8el+6gGNphfGHJEa3wGKZz6P09zJIBElrv9Icbq8fbRxC49gA/FB2mY
	DeTAjBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrvS-00000007VCh-3kyc;
	Wed, 02 Jul 2025 07:30:38 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrrX-00000007Uoi-1Tjv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:26:37 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C2842A01EB;
	Wed,  2 Jul 2025 09:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=L9mawu75BttQ0R8C0ZKgWcwI6qvXco1im84vXfksbO0=; b=
	E7p5OuCL+Tm2kGTpFi22oIrg11BIW/490a0M3wYYzBlE7oqkHBDTqlJDNZBLeMxt
	EsKeby/UcPKxqV+ZIC4MPMVr+FeEUEd/Nu/0ikiVUntYE9Kcx+Gp+lXr/u/jl21w
	RPJIr2nWPDPejTs9b7D/2sX3vllk8IsdIoCXTq4DXRjNho838srhtBztkcvDSzmL
	pj737mIY/GejPhP8EhmkDpjHOJPycuap7jOgxTM4MO804duewTXOUviIIrY60kqE
	GLU5j8AXOf7JdkJ6I6F4h3aTJSaUD96eZhMaHFDMyOQ9MCofj8aC5cFOb9yEAl2q
	ktCFdCnj9C0XNZgedd0nuFRHCwQqanuf0yN1gpjxj6FH8gJLWGFXR7DXtOYC+L+S
	GqpagFIb5XRkxtKeNzniOmaJMKZM5AW6XY7tt9TPXKNN3r2hTwr7e+YO/A8Bok/q
	wzTeAnXzXf8auzF37U1tKfSmSxegyryu0HO5NGgJGLTyUGFTzh8gNDgLovT3r1+O
	Orgdf943/FA9fPzeXy7y7XQfKYN2JFk6WVgcXMYOY6mZuUCi/NTJFCT10ePun9TM
	h7EGwuYl8vLQinH3VnXeP/L7emLxToanIhCESNk4CjHQLslbFNAx3gYtpp/Gb3nO
	yz4L4lfGM95yh8KyCrkyZeICnhYxPIFq8GvRGkFMMko=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 2 Jul 2025 09:26:30 +0200
Subject: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu>
X-B4-Tracking: v=1; b=H4sIACXfZGgC/x3MTQrCQAxA4auUrA3MD7bgVYqLTBqdgI4lKSKU3
 t3R5bd4bwcXU3G4DDuYvNX11TriaQCu1O6CunRDCukcppCwFlw2x4cyMtEYOMecY4IerCY3/fx
 n87W7kAsWo8b1t3iSb2JwHF+EY3AWdQAAAA==
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1751441191;VERSION=7994;MC=2363341622;ID=348886;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29BB64155D6C7364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_002635_712160_0AFDECAF 
X-CRM114-Status: GOOD (  18.51  )
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

Replace verbatim license text with a `SPDX-License-Identifier`

The comment heades mis-attributes this license to be "X11", but the
license text does not include the last line "Except as contained in this
notice, the name of the X Consortium shall not be used in advertising or
otherwise to promote the sale, use or other dealings in this Software
without prior written authorization from the X Consortium.". Therefore,
this license is actually equivalent to the SPDX "MIT" license (confirmed
by text diffing).

On top, half of the files have the fragment "either version 2 of the
License" for some reason, and not follow up with "or any later version".
So the resulting SPDX license is still "GPL-2.0-only".

Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 .../nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts  | 39 +---------------------
 .../dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts   | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts    | 38 +--------------------
 .../nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts   | 39 +---------------------
 .../dts/nxp/imx/imx6q-hummingboard2-som-v15.dts    | 39 +---------------------
 arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts  | 38 +--------------------
 arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +--------------------
 .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    | 39 +---------------------
 .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 38 +--------------------
 10 files changed, 10 insertions(+), 375 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
index 80313c13bcdb..71cf5ce84a99 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
index e61ef1156f8b..fed260a9fdc4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
index b12cd87f3f94..4e176db56840 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on dt work by Russell King
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
index 2a3699adbed0..fdced9daec4d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on dt work by Russell King
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
index 1998ebfa0fe0..af458873b893 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
index d3ad7329cd6d..509724df7f82 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
@@ -1,45 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on work by Russell King
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
- *
- *     This file is distributed in the hope that it will be useful
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
index 5249f53dcdbc..704ba5b91efa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on dt work by Russell King
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts b/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
index 0e6a325df363..d929f131ff41 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts
@@ -1,43 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
  * Based on dt work by Russell King
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
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
index c3efb001c515..87b41d770e80 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi
@@ -1,44 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Device Tree file for SolidRun HummingBoard2
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License.
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
- *     restriction, including without limitation the rights to use
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
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index 3069e1738ba2..1e41e6fdd5b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -1,42 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright (C) 2015 Rabeeh Khoury <rabeeh@solid-run.com>
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
 #include <dt-bindings/sound/fsl-imx-audmux.h>
 

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250702-hb-dts-lic-caa60c313312

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



