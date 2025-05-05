Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h84VH0lnrjAiEXqcjuAM3UIyMpIBbTLvejxTYcMFbYo=; b=cSy2OalRLQ14Sx4W6tMccE7arP
	+ZurXpxb2mADEDZUBlPm/4yOlRPhNd0x+FqjCp6UpHD65oIFambn8SNIVJvqsRZDWftwGLeTevHQa
	iaNjaSTnqshHbPauEfYY/vUHMhl2+PyGvz/SiTj7SwOvcIv4jgC6GEfFz6qi9fxuYqaNIPrJysaJq
	XNhzLQLZjBgT1MXiL4aZ5qKWHArbIUA7xeOIM/Menl8BrSqFx39F8Ce4UPGi/MW9O7xxBOopBGlTv
	5rgnyQU39mdZeGaGOM1jMr1dH/reQYmnpooK+AKiaZAHt0uHtpn6P0aeVO6GnEPt+bG825e8Tk0aS
	3A9RyOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzZD-000000088Xi-158e;
	Mon, 05 May 2025 17:25:23 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBz9O-000000084jb-3sTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:58:44 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 38806C0005C3;
	Mon,  5 May 2025 09:58:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 38806C0005C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464322;
	bh=VR/e5N/N0mAjQT36mtOi1fbFG72D0Pi7WWTtR1xdj24=;
	h=From:To:Cc:Subject:Date:From;
	b=IfVFu6PTJyocwWziFhE34742gK6Gil++QXKFqrSHNAVfnwTRkjegs30MwLXuaTQkB
	 EN12U6MsPksytF2mp6Ziyp6roOAvMaBlhKFBzlFq2q5U5jQ49bibZERSkKmC5YbZFg
	 O5KjRpEoqPyZnEMVt3wSYwFf4U5Pr3LjKAtkBZ5A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D521B18000847;
	Mon,  5 May 2025 09:58:11 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Artur Weber <aweber.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 6.16
Date: Mon,  5 May 2025 09:58:08 -0700
Message-ID: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_095843_027856_B8C21926 
X-CRM114-Status: GOOD (  12.03  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree

for you to fetch changes up to 959886105a40a3ba94fa396aca83e1083a2056ab:

  arm64: dts: bcm: Add reference to RPi 2 (2nd rev) (2025-05-05 09:45:07 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC Device Tree changes
for 6.16, please pull the following:

- Arthur adds a pinctrl node for BCM21664 and updates BCM23550 to use
  it, he also drops the DTS file for the BCM59056 PMU chip and leaving
  that board level DTS files

- Stefan documents and adds support for the Raspberry Pi 2 2nd revision.

----------------------------------------------------------------
Artur Weber (3):
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
      ARM: dts: Drop DTS for BCM59056 PMU

Stefan Wahren (3):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd rev)
      ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
      arm64: dts: bcm: Add reference to RPi 2 (2nd rev)

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/broadcom/Makefile                |   2 +
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |  68 +++--
 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts     | 130 +++++++++
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |  91 -------
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts   |   2 +
 9 files changed, 472 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts
 delete mode 100644 arch/arm/boot/dts/broadcom/bcm59056.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts

