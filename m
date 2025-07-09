Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556EBC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naDAgVEz0v6CFo6A5lwwbZ4ycQOU+YuKAc76hTSp4NY=; b=3RuaETTgTnS60hPna7z9jSBwpr
	O0mkACPTFPVLOAtZpeN16mx78y6kGm3shs4RkhiG6pmsuX43y2LdOgUncsl4IEKwlQq9en1ZJsNLZ
	LK6G8bx0kJMC8eiK5imFA25n8hbb2h6DoWgE/ctqn4W7BOaHjeSljsmms5Bsgs8UNUaVA6v8wZdBC
	75aLrEtgCUpVxDAVHjQKk00n0EmH3rJdUm50Dl0FRCdhhWB+Ocb5mfvToyGGEVg1ZdqTn6oGa52WS
	ReCL1Zqg0WLqZS0jZAYfeMtPGltCQsnCdEakcwxy3bC7Rdgi/PGZZHWTi/8Pp61z4ZIAi2I2mbriw
	NzS1mmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR2K-000000087er-2Yks;
	Wed, 09 Jul 2025 09:24:20 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPLb-00000007pSK-2rag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:36:09 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 05572A0AED;
	Wed,  9 Jul 2025 09:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=naDAgVEz0v6CFo6A5lww
	bZ4ycQOU+YuKAc76hTSp4NY=; b=q+JLsAhHPG7Slqcbgdyd17dfe5IIAec8r90q
	eaYUvt49jalar9TDNa4/nzUjekUnmMO+JHO9yBh58zvGp15d+9DbeQ01PfSV0xlp
	VUxEb7K5Q+oetM76i6+2aTmGjHztFF+7MxcBfytOvM5E2v5nXzRUooKeYBcmUBp3
	COOO0MhZh74Y/FF9+2OLdlRtvN322+/fEfw7zAlgKwBUPANHYnredp0LGILsG7PJ
	P09QgOf7TiVWj8nhDO1EMmGAlnCXcclGe2i2a0ZKVUvLi+wNredAEcFSca08pt9Y
	ferfpB+dwB66JwN1mRc2tpO3LEplSuaoEe6rHVol2Szfi+754LtBrpW/6GxPA5nm
	4WmJs2B/55Q8I7o3VA2qqvv2jrVElwFOD0yDyBGl6Hikqbj7rE8TMcEH81zsI4na
	UvB+Ig/T+WoDv9D/p0Ja4PAkCKo6mPO7EY+YEHaE35T4zZV/HFTRXaDnCIBINVsu
	ot2BsGJvKmKrEK1sA6iH6L030IKe1tOXUtPWjtlTA0i7M2tL++tbGRPKhjAyFeLe
	SI/iAjPMcdneGjabqpX+UC2hzL6kF0VAskAvryINAFq8AANjWIOALyIy1x0rIPNQ
	x1bnL1Gx3LowKIc89MzKpkGNl3y9s4zvWKuEy1LX4xYopxzC/kaYHKmRImccaR0E
	NtTNU/8=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:35:43 +0200
Subject: [PATCH v2 2/2] ARM: dts: imx6-utilite: Replace license text
 comment with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-clab-dts-lic-v2-2-ae14e0fd0bf3@prolan.hu>
References: <20250709-clab-dts-lic-v2-0-ae14e0fd0bf3@prolan.hu>
In-Reply-To: <20250709-clab-dts-lic-v2-0-ae14e0fd0bf3@prolan.hu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Christopher
 Spinrath" <christopher.spinrath@rwth-aachen.de>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046565;VERSION=7994;MC=1895809622;ID=156668;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003607_875472_6D8F435F 
X-CRM114-Status: GOOD (  17.94  )
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

Cc: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 39 +------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
index aae81feee00d..f7ba19141ffb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013 CompuLab Ltd.
  * Copyright 2016 Christopher Spinrath
@@ -6,44 +7,6 @@
  * Utilite Pro:
  *	Copyright 2013 CompuLab Ltd.
  *	Author: Valentin Raevsky <valentin@compulab.co.il>
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
 
 #include <dt-bindings/input/input.h>

-- 
2.43.0



