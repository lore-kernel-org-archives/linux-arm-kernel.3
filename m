Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C1C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLkoBW4KcjWj0y/G1SqxIam+xOIBFXwFZtg/dcSN0sM=; b=xhSclMpf9WOQCuIcCSytNR9QKM
	LTqu0sV6KI2pT8+ioZQboSCsSI8SjXdernaTFNx01cl3KTQK0vdB45WqXcLDEerQW9idH0aeBNLaK
	edOi+FwrEgBn8iAclPbHvy2lNAOPTpPtvQTIzBUsuin2LYnuYIQ77i5poY7PovbWESf5obKSshrjE
	Br6GEJfAse8wyXN5HYxBFnC6SU64EDXWHdiXb0//swJ0BoO25AhXBU2oURxHN1OPjP4kwnGLArXUq
	M0Ly9LzFZcZqrNoLAoqAbKTvTZkfL8OvmO5LwClWGt06bv2y8dr2ZxULcDB1EnIafJnxRlIhGSjrO
	Vi1xfROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRTx-00000008Bgw-0IdH;
	Wed, 09 Jul 2025 09:52:53 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPRd-00000007qKz-3H0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:42:23 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 4FA0FA0ADA;
	Wed,  9 Jul 2025 09:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZLkoBW4KcjWj0y/G1Sqx
	Iam+xOIBFXwFZtg/dcSN0sM=; b=mbX82a42k6kCLeTb8swKYWk9JOW9APbk9JtK
	P4LLU8jHxUixXajRW+3Gy3ZtrGil8EH/OuUKinvpDuhVmHIcEbjtQ7YFQ3+xnixF
	tDXrH0y+gfnaH7b4g3nezGlF1cr0ammTmb2fWP3v7HnaeDhdZI4nqQvxek24Fn07
	l0kSzvCb/I5nu4nHoItwphCYwIi7hRGylCMjFyob/uEqRH5JVZf1/0k2AdbgJ9HN
	vCTlymCgxXvXjxRXJNKtK2Ot4NVY8pQX5apDXDs+mJT3pKuDUDx0jov0uFVxmSAM
	rM8seh3KRNHsiBpSlJPqJB3ankRJdRwiWBBgrdKOtt+YAoJjXwvcgT9hwue6vwO5
	lPj/pzmYFY+ILsZWgijPqSkE31vRBaUeDwWy1r1UYiAAyct0A1nsN/oi+kBY1bsr
	rVeOd2QU/s5meHVTbwvXwsdo8iqDzFka7rKl8pvp9NX2oGq5jIDUvr8p1+wMtC7q
	uegsXvlHx1HeZZCHTSW1S6YsIDbkP1pGcIg53ebmcBSKoO8CRUqBXN8K8G4pKryx
	W97rK4e7pE2HyrWWok3RyRSDrHuCmCn1TVHMgXTc1u+VoXwK9TMR0BSOTXPBln9G
	bZDs/YSW22UjgU2A3oNvGPMzRUFR9qD57IQHF+w7V/eMTTIWcDS9hDZuvircpEt+
	Q0HXLqc=
From: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Date: Wed, 9 Jul 2025 09:42:02 +0200
Subject: [PATCH v3 2/2] ARM: dts: imx6q-h100: Replace license text comment
 with SPDX identifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250709-sr-som-dts-lic-v3-2-51fcbd61aef1@prolan.hu>
References: <20250709-sr-som-dts-lic-v3-0-51fcbd61aef1@prolan.hu>
In-Reply-To: <20250709-sr-som-dts-lic-v3-0-51fcbd61aef1@prolan.hu>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
X-Mailer: b4 0.13.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1752046939;VERSION=7994;MC=1202330779;ID=98590;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2998FD515E657160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_004221_971693_A9D355EA 
X-CRM114-Status: GOOD (  17.39  )
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
index 46e011a363e8..c6161546a34e 100644
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



