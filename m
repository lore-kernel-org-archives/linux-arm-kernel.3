Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1884C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHaV2BrRGxtRyHzgGIcRbtLSuDhywT1PwY7+3vPsdCM=; b=1jTFtcGgHWWH3ifLCXvYB77z8R
	P3MDK2aYsCijtgYpdsfI93m2keVFfRTTnslmKEeyv2TgZX4wN+SfXicvA6FcOQBs+YTO7gDd82MVf
	WOQzpElpfLg8C0NZj3zOvY4qYjASc494MDrbfX0eG6g5j3xQLwELDMMSftpNbnlBcSuLZNgGAfDIF
	J0lVnzoF/BTPV3vK3oc96UN1JwpgvMrhchGU4xDbMW0hN1IlwxCVeKnr1tDHJ0E9kgSLOWQYQfXFM
	+2rkEUVad6wdefYT4JUwrmTH+0O39/GFy5Dr6PGU4OmC39S4mhNAOuX/RigvskpWsOk49QvJYKE3Z
	CWjQsSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQW4-000000081WN-3Rzv;
	Wed, 09 Jul 2025 08:51:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPCa-00000007oE9-3nhc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:26:51 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 61C5FA09FF;
	Wed,  9 Jul 2025 09:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=IHaV2BrRGxtRyHzgGIcRbtLSuDhywT1PwY7+3vPsdCM=; b=
	hzMzNH8OSeoIYTzDHDe0gpFHQpnWlJa2//2KU+w93GFOqoPK8ynEhhhlcENUUD4n
	anBmxiTf4tkTOmG+KQpNyFMX7oIPYqBj3tCOVSlTl2sX56F80fAAKy2tkaWa7c66
	ldXv0oxEIg54DhyIBbgf93ShlzODWg5Ljy9iHbX8b81y6wyA+6BUsXNQDFW5gIo0
	382onTBlzytxhL550D+VtBtuYLnrJYI2EjiX9AsPCU9om1ZV8SvIa1rCggFe+6vF
	SCktE+xoiuAnTG4lQz0kMNMEG+aIgtLc9DdwsF3IsnNHDOTg8KCanAl/Ct0HOq5P
	deJoLoGbS08OwEBRiNE/QZwXWHQHzUh9xfk+iMGs4kfdIc8T4//yOtU+UJl026zU
	jEBkStrBP9kQnifh7bdwGGB0VEdqem6cGhNM5kcUpyoGgYWJBg9TY40YlbOjCq2f
	4TSOzgRqGTLThyIBfTvKBas4brSdWDU15vnyAfjAMqlXmtA7LTgnUextW65uz+Ps
	xtih59CXVeQ9DNiUDkQGnor9dgD1406cZs305YcvAJNnRBdmNZXB7U9kagMFTTNR
	wPN1mqD7YadAgp6WW9vN0USVFS0QidS9kiFVVmz1kadc1JqFbEE85V/FfOsfcEJP
	7I6DQgoRpdFU9WBGTxqyMDFY5zFAsraaAHHHweUpX+c=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:26:41 +0200
Subject: [PATCH v2] ARM: dts: imx6-gw: Replace license text comment with
 SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
X-B4-Tracking: v=1; b=H4sIALAZbmgC/02NwQ6CMBAFf4Xs2TVtFSme/A/DobSFboItaRE1h
 H+3kJh4nGTevAWSjWQTXIsFop0pUfAZxKEA7ZTvLZLJDIKJklWMY/9CMyUcSGN1klKbuuxqfoE
 8GKPt6L3H7k3mViWLbVReuy3xUGmycRMdpSnEz346803/9cV/f+bIsVJKC8PYWcruNsYwKH90T
 2jWdf0C4gC+rr0AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tim
 Harvey" <tharvey@gateworks.com>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?=
	<csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046003;VERSION=7994;MC=3736621438;ID=98227;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_002649_424141_E2D7F74A 
X-CRM114-Status: GOOD (  17.78  )
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

Cc: Tim Harvey <tharvey@gateworks.com>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
Fix up Device Tree files by replacing the license text in comment blocks
by a `SPDX-License-Identifier`.
---
Changes in v2:
- Fix msg
- Link to v1: https://lore.kernel.org/r/20250702-gw-dts-lic-v1-1-7aac2d00488f@prolan.hu
---
 arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts   | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts   | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts   | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts   | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts   | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts    | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts    | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts    | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts    | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts    | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi | 44 +--------------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi | 44 +--------------------------
 15 files changed, 15 insertions(+), 645 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts
index 82d5f85722ea..50dd3df9dd04 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2014 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts
index 59b8afc36e66..8ca5b6b8da07 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts
index 21bdfaf8df53..b94455406a57 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts
index 103261ea9334..dd978105b42f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts
index 9c6d3cd3d6a7..172dad423639 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts
index 2c7feeef1b0e..44d1871ac666 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2014 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts
index e9c224cea752..22842f2ef685 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts
index 735f2bbf1439..c69fdd064e2f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts
index a182e4cb0e6e..a9a33eeb9712 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts
index ca1e2ae3341e..25a93cd4e5f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
index 29960d1cf6a0..009a9d56757c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2014 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
index c6e231de674a..e3b677384a22 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2016 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index d0f648938cae..ce1d49a9e0cd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
index 71911df881cc..50b484998c49 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
index 716c324a7458..3125cd04d4ea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
 /*
  * Copyright 2017 Gateworks Corporation
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
- *     the License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this file; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
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
 
 #include <dt-bindings/gpio/gpio.h>

---
base-commit: 66701750d5565c574af42bef0b789ce0203e3071
change-id: 20250701-gw-dts-lic-7388cd95f916

Best regards,
-- 
Bence Csókás <csokas.bence@prolan.hu>



