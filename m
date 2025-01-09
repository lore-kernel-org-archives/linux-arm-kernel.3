Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8552CE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 22:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcQiAladiMvBqV5ZnCyr3LaD+NU0u/sAizfHBq6hmSk=; b=X2FuHTkTjY3Ay5ZcrK6oaqvHaG
	SNXL84MFm7iwQQpa10rOqzMHaC83ta65FPvz8KlwC4nw3pWweqNtOEj2THZaEN2mWowSze3CC1tge
	HXil0wtQjc6lSSKjrMbboHPGTbBMTPpAketttma5a/tGLvIH3HhRHWVcqWc5mSe50J4pRk0qUmO5T
	uW9VU9VMTagnA4OuGYc5JuFsEBumuFykdqJe3rtc8bydmI5GImvx1ObnPRB0Lc/oG1mYokGltmT+9
	sY7a/JIk8Zi9lyqaw2Wl6VFPSx3DAnt1G7gLi+rPDvgvbxqM+hgoeqa17T4YDDuxgEkpdmxz0QONl
	g1yGdiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1L6-0000000DUT3-21FL;
	Thu, 09 Jan 2025 22:49:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1Js-0000000DUOF-3Tmg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 22:48:06 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1F3D4C002818;
	Thu,  9 Jan 2025 14:48:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1F3D4C002818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1736462882;
	bh=CK72pTv1jRJuSZTidr21qWWo2R8tycAcuLfjUB9JQgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJptsJ3JlowpgALf+wJjUqx+ETN2S/xtx3xEfGEVntSKuBNeRfXYi5GH2zd4aLIeX
	 iYeAZm57iuXrcfq82YnLK0fc0BDgKHt1XKX655ZNO3TDblCQg+g9Prm45fZSw8Bxmd
	 NH9rbHAN7/x7Zbu3XTH9XSbw4/gyp2w6aB5WlUHI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BCCF218041CACA;
	Thu,  9 Jan 2025 14:48:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Sam Edwards <CFSworks@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 6.14
Date: Thu,  9 Jan 2025 14:47:56 -0800
Message-ID: <20250109224756.3632025-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
References: <20250109224756.3632025-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_144805_227505_AEFDD1F4 
X-CRM114-Status: GOOD (  13.78  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-arm64

for you to fetch changes up to f5ce990af7cf9ced0b3459f3d9aed0a27a74d00c:

  arm64: dts: bcm4908: nvmem-layout conversion (2024-12-17 11:39:21 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.14:

- Dave adds the display pipeline DT nodes on BCM2712 (Raspberry Pi 5)

- Rob removes some undocumented properties

- Same ensures that the CFE stub area is reserved to allow secondary
  CPUs to be successfully brought up in Linux, also making sure that the
  address used in the spin table is also carved out. Finally he adds
  support for the Zyxel EX3510-B router using BCM4906

- Rosen converts the BCM4908 platforms to use the more flexible
  nvmem-layout representation

----------------------------------------------------------------
Dave Stevenson (3):
      arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
      arm64: dts: broadcom: Add display pipeline support to BCM2712
      arm64: dts: broadcom: Add DT for D-step version of BCM2712

Rob Herring (Arm) (1):
      arm64: dts: broadcom: Remove unused and undocumented properties

Rosen Penev (1):
      arm64: dts: bcm4908: nvmem-layout conversion

Sam Edwards (4):
      arm64: dts: broadcom: bcmbca: bcm4908: Reserve CFE stub area
      arm64: dts: broadcom: bcmbca: bcm4908: Protect cpu-release-addr
      dt-bindings: arm64: bcmbca: Add Zyxel EX3510-B based on BCM4906
      arm64: dts: broadcom: bcmbca: bcm4908: Add DT for Zyxel EX3510-B

 .../devicetree/bindings/arm/bcm/brcm,bcmbca.yaml   |   1 +
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 ++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 193 +++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile       |   1 +
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |  12 +-
 .../dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dts  | 196 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   |  18 +-
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |   2 -
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |   1 -
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |   2 -
 12 files changed, 488 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dts

