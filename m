Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B56AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PX/vrWDozn9skphOo2jIefLe9G/mGU2FGJiqotPCMoM=; b=sjPuH2KnwNusCtRudSagAv7847
	ZCLQuEWgI6qHvwykiB/sdpGsD61PlKIoXCGR+ve2MUWEH/KXljJwwgJ8B6LOpk5q2L0Z2iJPJCceY
	93TYw8j3/Hm/bkLIAu9tofWlP7i9b9uuzNB+Ux1hzzBreOuxIZYaFCeqovry5h+Q08hiDRCgpLXqS
	JRNK6xorDXh2EYmxtry1pPUT+UXG0KsPiWKt29SVdEYhvFexICUWFPEfEhelxYIdDbwIf2Q/o2KVN
	ml1/Shb1CQuLMrSE1bJnb0zCgA0HWIFNWS5E5JxKTV/AMU5/p4EXU0qRDCAoHwSN3bpwfspuVQwF9
	foX6AK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Z4k-00000004aDF-0ZuN;
	Tue, 15 Apr 2025 05:43:14 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Xz2-00000004Ri8-1q63
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:33:19 +0000
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xyz-00Gb4I-25;
	Tue, 15 Apr 2025 06:33:12 +0200
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
Subject: [PATCH v2 00/15] Update PHYTEC i.MX93 DTS
Date: Tue, 15 Apr 2025 06:32:56 +0200
Message-Id: <20250415043311.3385835-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
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
X-CRM114-CacheID: sfid-20250414_213316_635992_526F9046 
X-CRM114-Status: UNSURE (   4.86  )
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

Update i.MX93 device-tree sources in mainline for phyCORE-i.MX93 SoM and
phyBOARD-Segin-i.MX93 board with changes from the downstream kernel.

New SoM features:
 - PMIC support
 - EEPROM support
 - enhanced eMMC support
 - fix eMMC for ERR052021

New board features:
 - RTC support
 - CAN support
 - USB support
 - I2S audio support
 - 2nd Ethernet (EQOS interface)
 - enhanced SD-card support
 - fix SD-card for ERR052021

Link to v1: https://lore.kernel.org/all/20250410090251.1103979-1-primoz.fiser@norik.com/

Changes in v2:

Patch #1:
- add Reviewed-by tag

Patch #2:
- move reg property ahead of pagesize

Patch #3:
- add Reviewed-by tag

Patch #4:
- no changes

Patch #5:
- reword commit message (add more info)

Patch #6:
- add Reviewed-by tag

Patch #7:
- reword commit message

Patch #8:
- reword commit msg
- split errata changes into separate patch

Patch #9:
- new patch in v2 (split from #8)

Patch #10:
- reword commit message

Patch #11:
- drop CAN regulator hack in favor or "can-transceiver-phy" mechanism
- reword commit message

Patch #12:
- reword commit message

Patch #13:
- add Reviewed-by tag
- remove empty line

Patch #14:
- add Reviewed-by tag

Patch #15:
- new patch in v2

Primoz Fiser (15):
  arm64: dts: freescale: imx93-phycore-som: Add PMIC support
  arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
  arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
  arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
  arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
  arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
  arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
    write-protect
  arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
  arm64: dts: freescale: imx93-phyboard-segin: Fix for ERR052021 errata
  arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
  arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
  arm64: dts: freescale: imx93-phyboard-segin: Add USB support
  arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
  arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
  arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically

 .../dts/freescale/imx93-phyboard-segin.dts    | 243 ++++++++++++++++--
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 165 +++++++++++-
 2 files changed, 369 insertions(+), 39 deletions(-)

-- 
2.34.1


