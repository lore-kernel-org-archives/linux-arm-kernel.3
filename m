Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C0CC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTg5xlBMV3ZpioVnQMKMCNtn41a6TiUkCbtv/ticY0Q=; b=odVODGnWreMV7XDivw1Uhcaq9T
	K45Y91x5M0Nrm+NYA4wXCRkS+KeZai6U26yPR+5E4Iqmd9nHZWKX8OfFSa6oFhiEf7dnOJZ10aNvb
	xrlVSenMMZxROuTZT5snD5xszibrkJyNZRsa6OXqO2d86b/D5MJoNBhu5RBQD9UVH07OjBgUOCLPS
	6Spe8aOIOcHL4cBfV297rIaO2sG0bZ5ZPlux9mP7SogKvYyUb66L/aPSjEaoFspJLOA2iZ6w5oML0
	G2ltYs7W4U72ZvUUUZOrhtmrGGyHuhAQc+nZ+9uITlJFvf0DdlYMYNHE1NCw5gB4pNXuceK43IaFT
	zaJmxjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fn0-0000000FPlT-34gg;
	Fri, 18 Apr 2025 07:05:30 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fG1-0000000FGkS-2Oux
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oTg5xlBMV3ZpioVnQMKMCNtn41a6TiUkCbtv/ticY0Q=; b=cKH8Jjz3UhDIikWoDUs9Pr6GlI
	Mmz/6GL+pGzQYRY4NUFxkPQ1reeW+aRqBnalYDxz5Cs/EBek0U2vd9bYn3wnMVO9bcz7K6nvF8a8y
	vZ03y5b1HiShBsMyWEt/U56nCsO4sNA2kIgj17dyWhsUnjVS0Lug+UUFVqVMkWM+vgi9oHHr1CpC3
	u/PxqDkEA+4KxZd1OM8JjV0tL7PKohBHdlAp7guW4A9Dh4Ii6FkbCo1ybIlEqu9YT73lbykd/uyPq
	6lgqy2uq2Pj9oAYd1IP0qumexjCyfEGGNJtKkWmG7S+eMaVoK9mq5Pp93074AtyBlQDRSkxrgG5fz
	SV6z8cgw==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fG0-00AbM0-1a;
	Fri, 18 Apr 2025 08:31:24 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 15/15] arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically
Date: Fri, 18 Apr 2025 08:31:04 +0200
Message-Id: <20250418063104.2202085-16-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233125_768659_40481424 
X-CRM114-Status: UNSURE (   5.61  )
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

Move pinctrl_uart1 to keep nodes in alphabetical order. No functional
changes.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 .../boot/dts/freescale/imx93-phyboard-segin.dts    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index c62cc06fad4b..0c55b749c834 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -228,13 +228,6 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
 		>;
 	};
 
-	pinctrl_uart1: uart1grp {
-		fsl,pins = <
-			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
-			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
-		>;
-	};
-
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
@@ -257,6 +250,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1


