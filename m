Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB4EC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHbYnH0ztRM4vrUIrRVJUpu82xoEnhr6aNYoNap29Zs=; b=VGacqEMyB7YSj8R0cXDPdVNx4N
	dgEuhftWbxlgqBkeeUhso+n9s1d+BuyN4jP0+BRrxHPyGxQUamTSehe7U/bW/nH+HLZsOqlyN2LdC
	KuPXATBioyAZGoxuCIXy8GaJl4eg6G5t1Omotdef3/EoRZvTIR9V6zmdRf1+bRqdAj3oxwzxl7p7v
	P4NONlwzop134RbthynzYBvj+Uf8sLzd49d67XGYl7+a+LG9YpTU6FE3ZXF1RDpky9dHKwl+FckmR
	QdZEuxwJ65BDPDornhkma1bFEZ4dXY3+19dMro0XZdxp/yzMVTxHqwBOXsTpL/MQvqyIDpgaowF4S
	KAKJ9yhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug367-0000000Cqcl-2oIS;
	Sun, 27 Jul 2025 15:15:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2bt-0000000Cn6t-22xD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 14:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1753627459;
 bh=cHbYnH0ztRM4vrUIrRVJUpu82xoEnhr6aNYoNap29Zs=;
 b=gYXjzAoKEdGATAUVnUKfmGtN/6HPTqoPil1XJfL2LuFLSxYq0an+dK2+jyCkyEYxMnR+z6jDH
 5DyqnPJ69GM8jyGisdunAhycK+0W/7YZQHfHtXw+QO6IKQlxw9dbAFL+8KqB2qoEtdcWjOLaVED
 9ONArJuNZD5jgnQey8SJxxNbgcr7E1sps6HtejKG38dHoyQgex4USRGaFKN1q6JEsF93dMuXbzQ
 rNRdMI0sXsV6S7eiY/F+H3ynTJ6WOJd1WKRQK4ToFHOh63zebDFIWD+zdn8Z7QeItjcoSOoHCWR
 0bOJkWoCPzamX0mBGkxr8vxmA5DQlg7OwpDpupVz15qg==
X-Forward-Email-ID: 68863b3fc752737c6c097854
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add Radxa E24C
Date: Sun, 27 Jul 2025 14:44:00 +0000
Message-ID: <20250727144409.327740-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_074421_926380_0642F9D3 
X-CRM114-Status: GOOD (  14.03  )
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

This series adds dt-bindings and initial device tree for the Radxa E24C.

The product page for E24C mentions that onboard eMMC is optional and the
model I have come with SPI flash instead of eMMC.

On RK3528 the eMMC and SPI flash is muxed so only one of them can work.

I have included both SPI flash and eMMC nodes in the device tree,
however the sdhci node has been marked with status=fail. Something that
possible could be enabled using a DTBO or FDT fixup by the bootloader.

This also leaves out describing the RTL8367RB-VB switch as support for
the switch requires dt-binding and/or driver changes to make it work,
something that will be handled in a separate follow-up series.

This board can be booted from SD-card using the U-Boot 2025.07
generic-rk3528 target or preferably using work-in-progress patches [1].

This series depends on following series for a clean apply:
- arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2 [2]
- rockchip: Add power controller support for RK3528 [3]
- rockchip: Add USB 2.0 support for RK3528 [4]

A branch with all these (and some more) patches can be found at [5].

[1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
[2] https://lore.kernel.org/r/20250717103720.2853031-1-jonas@kwiboo.se
[3] https://lore.kernel.org/r/20250723085654.2273324-1-jonas@kwiboo.se
[4] https://lore.kernel.org/r/20250723122323.2344916-1-jonas@kwiboo.se
[5] https://github.com/Kwiboo/linux-rockchip/commits/next-20250722-rk3528/

Jonas Karlman (3):
  arm64: dts: rockchip: Add SFC node for RK3528
  dt-bindings: arm: rockchip: Add Radxa E24C
  arm64: dts: rockchip: Add Radxa E24C

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |  12 +
 4 files changed, 536 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts

-- 
2.50.1


