Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662E106FD92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RfLTpuDy1k7FODpFenJ5ACrwApu4AGvYnNGI/znSejA=; b=RLXM4lJUfcbV34bERISKYST3i9
	z/ftLDzTI7bhT7panul3QP/WK/yjdySXKqRpzrNq/0BIkuluxyRfi/SC9n+t2dFLns5pllmohC4Nl
	PbTlC9yVXjc2Uq30YNfnoIqRip5cl3RQOugbtLo+vyT8WZS+VDLi2eC+fHN9AaixMWXV/dPgS9JW2
	Hz1JSEq1Ol1Sp4fsF2uiGK0TnfztMME3i0CHdTMtFZTLayF7UfxY9EYh2yyo10N3SC3BSSUyxFbat
	2cTTTyn3lOd44016tPqwsedgJu/lOZ51RF/HsG5i26KjEeHiugmfyT6KCkyuP8ifj0cpNarg/kBv8
	uhyNVF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXm-0000000Gwyr-0ppb;
	Fri, 13 Mar 2026 07:02:46 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXg-0000000Gwv0-0qc8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RfLTpuDy1k7FODpFenJ5ACrwApu4AGvYnNGI/znSejA=; b=P8m9nR9IcxGxYesgsuk+SdU7mI
	Z1UE4KCsppbNUExYnayv1QrWfSf+RvNgmGwMjfuEEX6HCxRVzyUDOd+QO24Obp3E9gFPsaf98qBwa
	6qXRpxVyGVq/9IjRWNXbPZAONOwVD1JuixhpgHwz/IAj1tp5UJmvFPMNpudlhtCW/wYUqoZ0DFJk4
	i04A5lFdFu5abJUDx4LxugoVvflYuJULNhRnOoJUW5n2Y6wCZ/WQ1wHxGA88vwvMQnouYn/I7NQsf
	WHpMXQbkcYBrdPEv0U2gAW20c/YsEYcyUYDwTJVp/P5W3POwpGzHaKpmUEU+gxOmeVT/yX0AiTwtZ
	END86L4w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-000BWF-25;
	Fri, 13 Mar 2026 08:02:32 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-0005Xv-0P;
	Fri, 13 Mar 2026 08:02:32 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:20 +0100
Message-ID: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000240_258724_9E937072 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
index 5058cd9409c75..129b02a69ccf0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/clock/imx8mp-clock.h>
 
-&{/} {
-	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


