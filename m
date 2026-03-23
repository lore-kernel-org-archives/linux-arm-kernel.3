Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA18F483E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgWshehgMhfld6FZCjPIRSVE5SjC4hqen468WMznyJc=; b=n01+sbMSRiSbkqI5aJM8MzE7q5
	UsWbDgWDgRwQJEwUCZXhI5pl176mJF/s5sm3b1FSC6OTZsbVo1d050F8omsJ124OV+z7nMCz96z7U
	ZZ9G6wiggpzYU73hCg7as9D2oIvPZl3PYwYq5lsc/uSOc4ivvGuNhpPwGXxy4PfaPFHhnVI2VC+jI
	W/I8xgo1gTLmNN3CRQ5qlivKQ77g4TReXbg5/xAdLIR2VO+LELylMW1srGrOaApvezBIOckgPO9uM
	7+NrxekC5UO+Fu2c5tvUKyydGid+jvT1m3dYbo6BZhhhlhwe5W9wuEgJnqkKXYlBx8XUI+z3B7tG1
	C5aIJbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kY6-0000000HPFA-31pT;
	Mon, 23 Mar 2026 19:02:50 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kY4-0000000HPEB-12C6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:02:49 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B4EB7C0000E3;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B4EB7C0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774292565;
	bh=yqpAc7V9WCTRIGe30R7iuLeFEQo1jVQHIymH9wVe40M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKKnRNMsCn1pFUClgZL2Z7hmqgnjCPI4RUJIjMzyneGMFQvyucJqVua3ShEyLPe5H
	 RQaBYafLZXe4FEylLL69b3vOuZu3fk0Fan+XORk96B0PLri0sMsJ12ZZqgfAZQKpMi
	 U/yKBjdLbMsHSPR3vIWl2oNpg+yOU+Twx0jcNncc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 94A7BA88;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Date: Mon, 23 Mar 2026 12:02:39 -0700
Message-ID: <20260323190239.1890505-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120248_341194_ECF3B891 
X-CRM114-Status: GOOD (  10.07  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree-arm64

for you to fetch changes up to 0acb1de2b4df426a62dba33bcd80f3939636f97b:

  arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level (2026-03-20 10:17:30 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 7.1, please pull the following:

- Maira adds the V3D DT node to the 2712 (Raspberry Pi 5) SoC

- Gergor adds the I2C controller, CSI (camera), ISP (image signal
  processor), fixes the pinctrl node and updates the UART10 interrupt
  for the RP1 sister chip to the 2712 (Raspberry Pi 5)

- Rob moves the firmware and GPU to the root level to fix DTC warnings

----------------------------------------------------------------
Gregor Herburger (6):
      arm64: dts: broadcom: rp1: add i2c controller
      arm64: dts: broadcom: rp1: add csi nodes
      arm64: dts: broadcom: bcm2712: add camera backend node pispbe
      arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl properties for csi i2cs
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pinctrl_aon
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt

Maíra Canal (1):
      arm64: dts: broadcom: bcm2712: Add V3D device node

Rob Herring (Arm) (1):
      arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level

 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  14 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  55 +++++------
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  24 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  29 +++++-
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       | 105 +++++++++++++++++++++
 5 files changed, 196 insertions(+), 31 deletions(-)

