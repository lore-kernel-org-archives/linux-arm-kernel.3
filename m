Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JfTmF5mcMbLlkfBsdbeklzsnTl46CTDbZERvcEGyu8=; b=3MypvF+ylJAWrP8tX9dgc3U9HX
	+j+KGlyuYXIeHuXir01QcZ4Rx6AI9LQ21EtzhinAF/Qe1oV/cjRU25I1NFWPdfr7fWfOGimloNl2I
	bv3a803qhhILgaUKxUgFSv/g+C1kHkangCrPAdsI7Go6e7HQiFDMF2m9SGjZWBcCgTvNlBA8WS92o
	BMk+0XvJDc2XUFH0yRbgA8qw8N/JjT6Hf5Dlb+wXJtnoPtSMEMxAGcvgusN4/PgAq2JOQRV1UVDPz
	f+2JqyC4J+uWrlhKT+UVegBwGcCTmAO3ACJcZVZYeZDWaFKEpyWriTUA0pvMkmGYdUuRFG1DKC0D8
	/YG1BLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapia-0000000HNF4-2WsD;
	Sun, 13 Jul 2025 05:57:44 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapg5-0000000HNAb-44Ay
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 05:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9J
	fTmF5mcMbLlkfBsdbeklzsnTl46CTDbZERvcEGyu8=; b=flyqmU8dBWfVC8tSpQ
	C9m66Uu6yh5/LFXL+eq4mLTNWWzWNWMMch+7w62Q6S17l5RZPsbsxtR07H2S936W
	QVz39SCU1tYJ6Zyk+8/ZRZ0hp3nEN1pMpGTkvMQWHec8BooeqRKsvOdXDWVQ2FKX
	gobOM752zpeGfFmmodK2FeR7s=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S6;
	Sun, 13 Jul 2025 13:54:50 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.17
Date: Sun, 13 Jul 2025 13:54:34 +0800
Message-ID: <20250713055441.221235-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDXb50mSnNoHrt9AA--.3344S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13Jr43ur1DWr4DKr4kZwb_yoW8Wr4DpF
	nayrsrGrW8JF1rJrW7JFWvgrW8J3srJr1DGr17t34rZrW7Z34UZw1DXryxurWUJr9rtF1U
	KFyrK3WDKr1UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jniSdUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgqT+GhzSioYtwAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_225510_354330_3EBDD0A8 
X-CRM114-Status: UNSURE (   6.25  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.17

for you to fetch changes up to 0c7124658677885b603f1748fb997b3bdc87dc69:

  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503 (2025-07-02 17:58:23 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.17:

- Enable S32G RTC driver as module in arm64 defconfig
- Enable drivers used by imx28-amarula-rmm board in mxs_defconfig
- Enable INPUT_PWM_BEEPER, USB_HSIC_USB3503 and BT_HCIUART_BCM in
  imx_v6_v7_defconfig

----------------------------------------------------------------
Ciprian Marian Costea (1):
      arm64: defconfig: add S32G RTC module support

Dario Binacchi (5):
      ARM: mxs_defconfig: Cleanup mxs_defconfig
      ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
      ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
      ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
      ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Select BT_HCIUART_BCM

 arch/arm/configs/imx_v6_v7_defconfig | 28 +++++++---------------------
 arch/arm/configs/mxs_defconfig       | 14 +++-----------
 arch/arm64/configs/defconfig         |  1 +
 3 files changed, 11 insertions(+), 32 deletions(-)


