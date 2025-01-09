Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D585E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=szzRx+jV7JEnpVa9t3hMtlu/aLPELISpILa8cGlbM9E=; b=HtHzW3DBmCVTYragUTjg0FdmCN
	TzXm7dLrdrA1WUh2e8KO93oIlLMrhy0QeAs8vWwaMze9Fiwsn8y/yW2eveOTxORxf/7DaFDfC5EUm
	jY12EEXS7ASus0rZgaeJKcktf4tH7QaSBo/qTGoosVwjLBQFobYs6EjApPYvC2lMH9ri2756Q5AO+
	z5sRWKjQMsJ0YALT6VBw5eYM0+nea2c7f/ZMXqk8+xPU8gqPOfHp+BysPcPge4H99fpWNsQSrqNwp
	bXSTwUgYPwiKownavmYBokwxpreDE9f4qafNieUQGRPBaqhry/ITkLgV7R09ynz4gmqYvMzfRBN42
	BINoErqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1MI-0000000DUbt-0wKm;
	Thu, 09 Jan 2025 22:50:34 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1Js-0000000DUOE-3W0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 22:48:06 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 00F41C001A13;
	Thu,  9 Jan 2025 14:48:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 00F41C001A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736462882;
	bh=hzp/epZwqHQdLKQHRQ8aEtFi9PPvpMrlLjzgTmHUt+4=;
	h=From:To:Cc:Subject:Date:From;
	b=ovFziUVVOYKOtnEToSdKAWOzaqdwuL8WH5doV1uaC+iBccwBWC/eOqMtQxj6kCos6
	 4nyNQcVuH9tZFBvoVRM2QVmir0mjeVPYcDVAFUbvMMLQpdGYptTlpTW97ZUkhHEFTu
	 ZQCNGVEDQ9YdVx8qs0II3xWiIhnOVXwqVS3ZcZl4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 9827818041CAC6;
	Thu,  9 Jan 2025 14:48:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 6.14
Date: Thu,  9 Jan 2025 14:47:55 -0800
Message-ID: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_144805_227323_EF216864 
X-CRM114-Status: GOOD (  12.06  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree

for you to fetch changes up to f167292c8d13d31cbe9ffaa8108edcb4e8b1c60f:

  ARM: dts: meraki-mr26: set mac address for gmac0 (2024-12-17 10:23:28 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 6.14, please pull the following:

- Rob removes some unused and undocumented properties pertaining to the
  SPI flash controller on Broadcom boards

- Linus adds a number of BCM6846 peripherals: HWRNG, watchdog, GPIO,
  MDIO, LED controller, DMA and then proceeds with adding support for
  the GEnexsis XG6846B PON router

- Rosen sets the MAC address NVMEM reference on the Meraki MR26 platform

----------------------------------------------------------------
Linus Walleij (9):
      ARM: dts: bcm6846: Add iproc rng
      ARM: dts: bcm6846: Enable watchdog
      ARM: dts: bcm6846: Add GPIO blocks
      ARM: dts: bcm6846: Add MDIO control block
      ARM: dts: bcm6846: Add LED controller
      ARM: dts: bcm6846: Add ARM PL081 DMA block
      dt-bindings: vendor-prefixes: Add Genexis
      dt-bindings: arm: bcmbca: Add Genexis XG6846B
      ARM: dts: broadcom: Add Genexis XG6846B DTS file

Rob Herring (Arm) (1):
      arm: dts: broadcom: Remove unused and undocumented properties

Rosen Penev (1):
      ARM: dts: meraki-mr26: set mac address for gmac0

 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/broadcom/Makefile                |   1 +
 .../arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts |  20 ++
 .../dts/broadcom/bcm53340-ubnt-unifi-switch8.dts   |   1 -
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 244 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            | 120 ++++++++++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm953012k.dts          |   1 -
 arch/arm/boot/dts/broadcom/bcm958522er.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958525er.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958525xmc.dts        |   1 -
 arch/arm/boot/dts/broadcom/bcm958622hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958623hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958625hr.dts         |   1 -
 arch/arm/boot/dts/broadcom/bcm958625k.dts          |   1 -
 arch/arm/boot/dts/broadcom/bcm988312hr.dts         |   1 -
 17 files changed, 388 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts

