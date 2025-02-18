Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081EFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Knli9HItcYLIFXFtjARrFVz3HqnZ51SSpR3Nu8YGDuM=; b=ZIAypJspS36oteMpVFQjoD4QHI
	D2SJxlQidhG7tme2vkndA4TlLzog5PpVQSjKrjBRw16Fg6u3RCoou8uDqHmGm47M7GWwn+vh0bZhz
	cUYPGlq+kxDcbyU+q5s9a/aewJwHbRnzmkqqbLQ9hrjwX/ZREE2R4o7OJ2mXWr8oTbVDGYCLnWN80
	YecVRkjC50QwXQXxeTV3iehNO7Wed5Z4cCBDMg/Z1zPZCOPvJfGUKxeAPjbJlYO/6cSyqYy3RicGS
	j+vdFdgeanxwJBu3I4O2LpZVvSH/kT37Mltk+jnxt4nT5XK0wpdQthJ40kyhWQMehgn1xux0e2vlp
	IE3D3u0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIMc-00000007881-3fYS;
	Tue, 18 Feb 2025 07:49:54 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIFf-000000076WK-3O3x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 07:42:47 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52604 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tkIFd-00G0MD-0L;
	Tue, 18 Feb 2025 08:42:40 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 02/15] arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
Date: Tue, 18 Feb 2025 08:41:43 +0100
Message-Id: <20250218074156.807214-3-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218074156.807214-1-andrej.picej@norik.com>
References: <20250218074156.807214-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_234244_020077_14216AC4 
X-CRM114-Status: UNSURE (   7.45  )
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

Not using pull-up on the host wake-up line triggers the wake up
immediately after device enters suspend. Fix this by enabling internal
pull-up and setting interrupt triggering on the falling edge.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Teresa Remmet <t.remmet@phytec.de>
---
Changes in v3:
- no change
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 5eacbd9611ee..31d5c57d3c24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -255,7 +255,7 @@ bluetooth {
 		device-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 		interrupt-names = "host-wakeup";
 		interrupt-parent = <&gpio2>;
-		interrupts = <9 IRQ_TYPE_EDGE_BOTH>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 		max-speed = <2000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt>;
@@ -332,7 +332,7 @@ pinctrl_bt: btgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x00
 			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x00
-			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x00
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x140
 		>;
 	};
 
-- 
2.34.1


