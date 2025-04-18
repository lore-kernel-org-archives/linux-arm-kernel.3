Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E7FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bc/l8RQ6IGv08DVD+8pR8yhxUHNhK0UV4UbPtwrrso=; b=vAfmS/T4HtCo84gzGXmCpYQ8iN
	3nXvLlHl27w7Vx3GNHGxiJdtjRzDVYNo3AzK7EdU332I/gDJmmzN2cQ1onloBC66tGKGvoHdqE+0M
	VcQTDuIV6yPhZbujssQHzjT/FRszABgf6Cs2pEA5ZJ67H9vFc7WOQfoUXMxiboUtK8lnqU2HepQRq
	HO1Cir+enkdFM1VrFmynWTZ3xLwyPWju4cWOAfDwkcchAU02kMLIFNfEJ8qlMsgrb+FNx8QCrUPET
	oQ2aGKrdLpMbl2of3cGom8xM726wswiYvy9E8uK31pFIP0H+D7pi0cCD3fuRbRSfuDOw77bbLN3oo
	pajCeBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fAP-0000000FFoV-1J4e;
	Fri, 18 Apr 2025 06:25:37 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5etG-0000000FD9g-3uXy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:07:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00430102933A4;
	Fri, 18 Apr 2025 08:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744956473; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1bc/l8RQ6IGv08DVD+8pR8yhxUHNhK0UV4UbPtwrrso=;
	b=Ek7dy+uCROq3uBXGZqhiYWttFIVtr48dwyzQEV4uP5/BgFTMu6C70AAks3jidNgZ8FHk2g
	17cenalX+bwluCLMTZK4cZPsx1+y/5WtSZdTTJFGEijfDzF27+q3X178uii2pfd8Nt8SRJ
	YvKnDKIIZDIpt62sWvVBKptBZ45KjWG13HaXumqmuPRgm/3vKr/S219tUETmAJ0Fw+xyfp
	nud4UvICV1zWYyTpZyGbP6pvQroePfXMHmwsjr0a3Oa+tKVl+j8eO3vMKdwUV1/Xo1LIec
	W4YAjbYBYNPbmDym9ZzTOpWmp7AY3jDr3L1vwinNOeDWyOPOiIqO0mz4jxZx9g==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v6 6/7] ARM: mxs_defconfig: Update mxs_defconfig to 6.15-rc1
Date: Fri, 18 Apr 2025 08:07:15 +0200
Message-Id: <20250418060716.3498031-7-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418060716.3498031-1-lukma@denx.de>
References: <20250418060716.3498031-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_230755_109270_50457674 
X-CRM114-Status: UNSURE (   9.90  )
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

This file is the updated version of mxs_defconfig for the v6.15-rc1
linux-next.

Detailed description of removed configuration entries:
-CONFIG_MTD_M25P80=y -> it has been replaced MTD_SPI_NOR (which is enabled)
-CONFIG_SMSC_PHY=y -> is enabled implicit by USB_NET_SMSC95XX
-CONFIG_GPIO_SYSFS=y -> it has been deprecated by moving to EXPERT and
                        its replacement GPIO_CDEV is enabled by default

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Suggested-by: Stefan Wahren <wahrenst@gmx.net>
---
Changes for v5:
- New patch

Changes for v6:
- Add detailed description on the removed configuration options
  after update
---
 arch/arm/configs/mxs_defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 22f7639f61fe..b1a31cb914c8 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
-- 
2.39.5


