Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9EEC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMmL27bnm1Scohl4V+bV95IB9bqNz+0Dqo98Wv3R2Gw=; b=FPF+T1nrhsDoE+S6Bfq7rSfZGm
	KT93970AV8GMBt2ID5vaBq8u1RMcqptWO/UpGKSBT3sPcJm0SVxMjQBuDxO1khyDsH8cz78HRtWcr
	6UUxC+Urc7YmqfwGGwKaxvVev7jGE1e1fMIDRrvOc0l8wTDl6F58x07FTwPvz3WOEumHuqhsn96dz
	LSsAL1jOwFNeOxDDGRp3QgNiKlDSg2KnS48eEJxR164mZLGDkEBlBYFzSMTF9CxwXFlQrw4E7RJHR
	uEL+zvDwtxOK56yUOcQdZxfcZO1djPXXF1mr1tNynwWNXkEcPWMAuTbDyuJC0sa3RzpZfgHaohkzD
	G15Xj6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdB-0000000FXig-0PAK;
	Fri, 18 Apr 2025 07:59:37 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFn-0000000FGeS-0eTp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iMmL27bnm1Scohl4V+bV95IB9bqNz+0Dqo98Wv3R2Gw=; b=S+8QWJsdNaTmih/DaybGYWKw/h
	wAUIAErbIMFPFqvVu+7/cWJ7O+IvU+pSk7jy/fqlb0MyIKLQxBmk1UTEnPg9uGgvXfklhEPyXYibh
	g+8WsHvGKO6OHzvx/uulVIKHwAn8kl9+TI70ilqvmXQcwPCZeqiPi+rHIN0eT74QGo8eciJ+uICEG
	Rc+Ur1EkxoBqfrQgwrCj9NYpiknEZ+yozzbl1uX2K+nedtEKQZCumMGEtrJ5rgNZfLW5io4HRILNv
	iHX/HB3Qg2ITw3iBIKjBYpR3ussXwlk3Wh6spSlP2NE4D4lA65PN3bIFE1NRpVCkqB7djNK9kFN6X
	jqlsR/EQ==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFh-00AbM0-2s;
	Fri, 18 Apr 2025 08:31:05 +0200
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
Subject: [PATCH v3 00/15] Update PHYTEC i.MX93 DTS
Date: Fri, 18 Apr 2025 08:30:49 +0200
Message-Id: <20250418063104.2202085-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250417_233111_664949_7851CF51 
X-CRM114-Status: UNSURE (   5.10  )
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

Link to v2: https://lore.kernel.org/all/20250415043311.3385835-1-primoz.fiser@norik.com/

Changes in v3:

Patch #1:
- no changes

Patch #2:
- add Reviewed-by tag

Patch #3:
- no changes

Patch #4:
- no changes

Patch #5:
- no changes

Patch #6:
- no changes

Patch #7:
- add Reviewed-by tag

Patch #8:
- add Reviewed-by tag

Patch #9:
- reword commit subject
- add 2 char indention

Patch #10:
- no changes

Patch #11:
- add Reviewed-by tag

Patch #12:
- add Reviewed-by tag

Patch #13:
- add Reviewed-by tag

Patch #14:
- no changes

Patch #15:
- add Reviewed-by tag

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
  arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to
    fix ERR052021
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


