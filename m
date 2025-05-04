Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8454FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MTHgXBXI80d/WGYJk4hwCsY15MRflC8xTOXUuFqwn8=; b=FdR0WdSBLKNpdPiC5/H3OFW5ge
	oKAI9R57rznDv8HfZz2EEpnvJulPqWdqrmePQKIOCs/R8GxU3nPBvgqEZcV3d0ORjCDr131DglVAV
	BPPeIdO+dv1fj4S8Uh6ngOe171EwzsVyGAZpFJZxQ86gjo7/Ig9pshHcD0CG3wSd04i8HCqVFmVKh
	H+C/VAnVGdi1zTamVgUuQ+pyRxpyVaYZgL4L379M5GH5EQWsnmzwf8nK9LOMLixTiP9agSRmoH4y7
	jSnSJjVDiXsIUEFX7DFHQuhFQwVrUeofooxCgl7XW1bKX1zyQ3yxvVQd6VgSSuxiBixY4/CZNnunL
	kVE5m0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBb7A-00000005T9w-1s8g;
	Sun, 04 May 2025 15:18:48 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBalR-00000005Qqn-265q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 14:56:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F75310293387;
	Sun,  4 May 2025 16:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746370579; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+MTHgXBXI80d/WGYJk4hwCsY15MRflC8xTOXUuFqwn8=;
	b=c/gC/XtDxtqkwskhTWhCb74kn3+AJw7DCJZYuwLStFtY9g/fYR177LCLBNwcf85QcPL1YT
	DhlAUSSmXFfe1Gk03Pael7isO68W+wX7cbZqU59cKnGvd/7Rhekv+z2aU5S/TcV4gI+9Aa
	SzGY+1Dj766onXig1LmlVfy73/a68ukZ34tSRFttujcVXPgPejC9Fm0is870Wc9Hpgpfqs
	swyrCD3haIID3lsQUG8mU9D95GyytC4KI6C36uucSF5A5Q7+2I/zBJUzTDRjkyfUhLEY1w
	tXnI7hR5kGgW5mGgDf/Q4rkGum3Eoyf+f3kMbVUgHCVBnHM3Rjllo9qH5r2diw==
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
Subject: [net-next v11 6/7] ARM: mxs_defconfig: Update mxs_defconfig to 6.15-rc1
Date: Sun,  4 May 2025 16:55:37 +0200
Message-Id: <20250504145538.3881294-7-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250504145538.3881294-1-lukma@denx.de>
References: <20250504145538.3881294-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_075621_680078_661D5744 
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
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Suggested-by: Stefan Wahren <wahrenst@gmx.net>

---
Changes for v5:
- New patch

Changes for v6:
- Add detailed description on the removed configuration options
  after update

Changes for v7:
- None

Changes for v8:
- None

Changes for v9:
- None

Changes for v10:
- None

Changes for v11:
- None
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


