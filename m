Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CFFC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TilQ8i0bxzGSbTWKnj6uJy6hAD8gixd/aU3B3kF+KTo=; b=1X5mUORmp/yV63Sm2iCx2AJD+5
	cZ90/n9u1aNwApzmYlQknTC4j1QvjDepIGDsjAo5AGwgtjeI49u8oz5J/R9Aqdinz4tB8Hy2Z1gIY
	HyvQrE2vHZizMhT0w8kyP4WGfKrShdK26t6gpwxEpoDxHKpn0YOuUvnZBtvrx+VyTn5WtRd9phU6w
	M6FtJI+iz6jD0jVmJ1SBjfGgj0JDQJgJc9IxCqvdNrerWekDHOVpxxBGN305/Vb/RaGWn9aGxLR4p
	5U6fSwng9Cz4dQF6TeJjiKtvB4hsb01q6gLBokk0+2HDVbu6zd2ALdxmAhx4wvagFSW+7usy8YTIE
	Mk6JvrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeDP-0000000Gqr8-2JbR;
	Sat, 12 Jul 2025 17:40:47 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeAy-0000000GqS2-2jyF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 17:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1752341896;
 bh=TilQ8i0bxzGSbTWKnj6uJy6hAD8gixd/aU3B3kF+KTo=;
 b=INc6eFNH+rp2E8JQKvongvR/WVdP2qI3GN74d1b9ahynZheytKXKe/c7Txvbh1Eln+nZ3dApt
 o9SNywqrC3jushmdsYcl4D3R7QY5G/4umZlGqlj7T6YmhpgPxTjiGKdQZTWc9eTnj4GvDk16FnL
 NJA+AuOIkTrZIhx0ju8UpuTaAnvpQnRbUUoP6OD1sc8eH2ru1T204Uz/ovWwWsPPoeGw4YBI9MO
 CbAy9QrC7nzpozkjZgdB2C48nQSrtAv//TBN6nF3sBa0juusyWoe6FuYJTogcZ6tXjZXCgy7dSk
 cgRHzAEZ+LzZZ3PC/qQBWGPjFocRPk+pefgJmTdQ4yCQ==
X-Forward-Email-ID: 68729d83d7dd91652d16c15f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
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
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Sat, 12 Jul 2025 17:37:42 +0000
Message-ID: <20250712173805.584586-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_103817_103492_5050B76C 
X-CRM114-Status: GOOD (  11.54  )
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

This series adds dt-bindings and initial device tree for the following
Rockchip RK3528A boards:
- Radxa ROCK 2A/2F
- ArmSoM Sige1
- FriendlyElec NanoPi Zero2

The bt/wifi_reg_on pins are described in the device tree using
rfkill-gpio nodes.

Changes in v3:
- Rename led nodes to led-0/led-1
- Remove pinctrl* props from sdio0
- Collect a-b tags

Changes in v2:
- Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
- Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
- Drop regulator-boot-on from usb 2.0 host regulators on Sige1
- Add bluetooth and wifi nodes on Sige1
- Collect t-b tag for NanoPi Zero2

These boards can be booted from emmc or sd-card using the U-Boot 2025.07
generic-rk3528 target or work-in-progress patches for these boards [1].

For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
Fix UART DMA support for RK3528" [2] is required.

[1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
[2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se

Jonas Karlman (6):
  dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
  arm64: dts: rockchip: Add Radxa ROCK 2A/2F
  dt-bindings: arm: rockchip: Add ArmSoM Sige1
  arm64: dts: rockchip: Add ArmSoM Sige1
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
  arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2

 .../devicetree/bindings/arm/rockchip.yaml     |  17 +
 arch/arm64/boot/dts/rockchip/Makefile         |   4 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
 .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
 .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
 .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
 7 files changed, 1211 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts

-- 
2.49.0


