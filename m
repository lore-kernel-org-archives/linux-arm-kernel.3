Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE8CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6px+nXDzusrLIi4mnpw8PNp1AiBEN07yTsIQi4XgWr8=; b=bK2ltQRlwaW5twiiL9xfjBQU9k
	MA1+zz0Uz5Gj8F3Luxb83Wrf+H2ISdPDaaYAgygJ7HgGJMbdVJMgt+7hSy+DB6kWVEH/GLA8EdlyJ
	anQMvAnZegYmRQ5LZfcGmJnXuAfVqX2yUCJ+bUOy/3ESw+rdM+vkZpO6s/zScJpbTb5BzTCcwt8xU
	VTUk1CbmfdW+hmSIeeESKfXTzi3bfwSvc6Rd9acAT+45fK1yhXf3EsWkh21FVkcabghG2ZHm00DnL
	IJgk8Wu6qAmOeOSax3vh13b5vEwB1DTogCTSSanIsrWAtMApH3wvP2+kz76VbwMefiRKm2iQXZ/NG
	FgrOj1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErGX-0000000Cj2T-1Vef;
	Tue, 13 May 2025 15:09:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr9e-0000000ChhS-1vK9;
	Tue, 13 May 2025 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=6px+nXDzusrLIi4mnpw8PNp1AiBEN07yTsIQi4XgWr8=; b=grbKuMFLj6dP9cN18V/wm3cars
	jtosbqKbNclRRw1uX/Zk8st3eHqMarBhTaQOsz6tk8/97e0/7LleOfyy0gOQS8asG1MrmG29R6EZY
	p2OKYn8wQlbUEsWuZC4vjb7ldFU5SCkxjQN5jFoniVNnLfi+QXopHAb2UccdYVcCUj9UEdp7d8mXW
	S3HkRXryc7aG4uf/V2GunE2I1ZCIfyJXD6WDaKuYze+uIHRo1BjWubsN+du06/Jg2anigQr8IDjvg
	aOgf2Z3dWWcFFrCmyLLd2MxplN6ex1HKgj3kIGYBo9vGtOsMcujjhrqfRmGC9B1fs3BevEZJ9lsQb
	FLYu8YBg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEr9a-0008L7-Gx; Tue, 13 May 2025 17:02:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add two board-families from Theobroma-Systems
Date: Tue, 13 May 2025 17:02:28 +0200
Message-ID: <20250513150234.2331221-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_080250_521924_7443E5C1 
X-CRM114-Status: GOOD (  14.85  )
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

Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
found with a variety of display options.

As new boards should not use the deprecated snps,reset-* properties
in the gmac node, I also added a core mdio-node for the gmac and
converted the Theobroma Ringneck board over.

Testing with the new node both before and after converting Ringneck
showed the board finding its network both when booting locally and
from the tftp/nfs.

changes in v2:
- add received Acks/Reviews
- drop "rockchip" prefix from system-power-controller (Diederik)
- split out prototype-pins to prototype variant
- address Quentin's review comments
  - ethernet0 alias for Cobra
  - a number more pinctrl entries for gpios
  - drop unused slp pinctrl entries
  - additional comments
  - use gpio-constants for pmic int
  - ordering (nodes + properties)
  - clarify vccio_sd more
  - interrupt line for pp1516 accelerometer

Heiko Stuebner (6):
  arm64: dts: rockchip: add basic mdio node to px30
  arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
  dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-cobra base dtsi and board variants
  dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants

 .../devicetree/bindings/arm/rockchip.yaml     |  18 +
 arch/arm64/boot/dts/rockchip/Makefile         |   6 +
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 +++++++++++++++++
 .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
 .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 599 ++++++++++++++++++
 .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
 12 files changed, 1482 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi

-- 
2.47.2


