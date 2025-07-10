Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E15C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CDUMK0C5WhusnGjADECcfU0iOU3s4nlSWfB0CUfxkE=; b=AW00tQcW2PyA4x7IVa6R6QID80
	vrOCwT6lrBBg/v2QGlyLSgim7Z37k7kDlagpxv1HpIN/KON6OO4pGqCFuUrUXCS1bASCVya3x07Ed
	wur7Ly9YKpYIFGnw3jOA+yr7YC+Z11ARX67btTsnTqeblLnvVnY/gjvjIPcYl7neQMvaBoEnj5XOp
	zqRxZV11cE6R/v8osC1auRbEW//9r+EQLq1gMswj4UkCFqyDSLhQRiW8h8R73UfTpDA14Q1QO+4Xd
	1M3g9capU5VtvKanrYFDBPokaO8aQW5uofr9Bkn3NxJpjRYBWb1Li5t1gCfW6300P5JlET6FJ+EbQ
	SdfL7G+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0QQ-0000000DF7f-2XCy;
	Thu, 10 Jul 2025 23:11:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxuD-0000000CwIe-1P43
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1752179408;
 bh=7CDUMK0C5WhusnGjADECcfU0iOU3s4nlSWfB0CUfxkE=;
 b=AII+/EMZsso20VAsV3phQ/SCK02ZGobd7Wcw0umlGqw3vMV/kn+6ySRgzFKQRHjjNqf8NTVvx
 /1AHTdAzrYDD4rgq8mKPksrQkfHk5U5EEGPvoFPaI08V8XdKIoEIAWmUPWpLnMRDS1nuTT5Vjk8
 ClVKAwi+KNJpMgZF7P1VcujRoy4hG8f9DRqwvpvGdgtNobETm2OTDm6FE2RKzSbic2mdif/lYbm
 2nM80iTL95BsrnK4KCgQJDZ+xL8ICUEUx0SfKBUSVo5YdOfprhDxv7O2NzeJXQqhlLuw71pYoKg
 Gv9hZ50SicN40wDOtLqhrrA5Ci233SeMF/ubNvGLdKlw==
X-Forward-Email-ID: 687022cc5dd88a88be4f4e1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.3
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
Subject: [PATCH v2 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Thu, 10 Jul 2025 20:29:39 +0000
Message-ID: <20250710202958.3717181-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_133009_422147_18F8E020 
X-CRM114-Status: GOOD (  12.30  )
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

Changes in v2:
- Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
- Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
- Drop regulator-boot-on from usb 2.0 host regulators on Sige1
- Add bluetooth and wifi nodes on Sige1
- Collect t-b tag for NanoPi Zero2

These boards can be booted from emmc or sd-card using the U-Boot 2025.07
generic-rk3528 target or work-in-progress patches for these boards [1].

The patch "arm64: dts: rockchip: Fix pinctrl node names for RK3528" [2]
is recommended to remove a few CHECK_DTBS=y W=2 node_name_chars_strict
warnings for these boards.

For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
Fix UART DMA support for RK3528" [3] is also required.

[1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
[2] https://lore.kernel.org/r/20250621113859.2146400-1-jonas@kwiboo.se
[3] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se

Jonas Karlman (6):
  dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
  arm64: dts: rockchip: Add Radxa ROCK 2A/2F
  dt-bindings: arm: rockchip: Add ArmSoM Sige1
  arm64: dts: rockchip: Add ArmSoM Sige1
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
  arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2

 .../devicetree/bindings/arm/rockchip.yaml     |  17 +
 arch/arm64/boot/dts/rockchip/Makefile         |   4 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 467 ++++++++++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
 .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
 .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
 .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
 7 files changed, 1213 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts

-- 
2.49.0


