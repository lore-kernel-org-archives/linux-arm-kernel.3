Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC359C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uhBAtKd3mtHihAWegUiMkhNqfrz7vOZ4WXMh4xp7tZE=; b=x3wCtxoNcEuOJp
	sfNJ2YXPdGR2T3ahW2otWrpm+bRYTQMKJRz9+Gl0sjyjGGlwi2MTb2wt7yOhEvyoy1BWZcl/lIssU
	L2sM5H+FQsjjA07Vt5uFWLwW8TorCSlkQJ4Mom859XJ9nzc3sWO4OiYFFVnBB7SboLmNG7iNOgdCu
	rIOQ+2+eVDqjHdBa7gnXyPrF3nYKn/UYJSmmhUZ+ek41pfFjQpmuDc0ptsyXbayOFkF5jNt5lRksj
	F7hImvA9qZsp3PEqJlXX7NA/0lOienGrTA09z0mzIIhN1tLJk3+csKXdlzh3eW5USntfZAucq6ehP
	qCX2g6Xr0PbqK6Dzh59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5hp-00000000oJ6-3tbl;
	Thu, 20 Feb 2025 12:31:05 +0000
Received: from smtp-bc08.mail.infomaniak.ch ([45.157.188.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Xj-00000000knE-43SK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:20:42 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YzC5b310fzrqS;
	Thu, 20 Feb 2025 13:20:35 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YzC5Z2rLlzHNm;
	Thu, 20 Feb 2025 13:20:34 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/5] arm64: dts: rockchip: pinmux fixes and support for 2
 adapters for Theobroma boards
Date: Thu, 20 Feb 2025 13:20:09 +0100
Message-Id: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkdt2cC/0XMSwqDMBSF4a1Ixr2Qh4let1Ic5HG1oahtYkUQ9
 16rgw7/A+fbWKYUKbOm2FiiJeY4jUeIW8H8w449QQxHM8ml5kLWkOLYj+SfEGY3ZcCam7JWqLQ
 mdpxeibq4nuC9vTrR+3O48zX+2aY4USkQXt5iZVZIlGmGkOJCCTxai7o2WErTLOKnO5sJ/DQMc
 W4KQ8Qd2qAQNZHurJTIlfYGuVCuCoEHZVTpWLvvX3Q8Y7DoAAAA
X-Change-ID: 20250128-ringneck-dtbos-98064839355e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042040_154710_090B9E50 
X-CRM114-Status: GOOD (  13.95  )
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

This is based on top of
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v6.15-armsoc/dts64
6ee0b9ad3995 ("arm64: dts: rockchip: Add rng node to RK3588") as it
depends on the (merged) series from
https://lore.kernel.org/all/20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de/

Patches for Haikou Video Demo adapter for PX30 Ringneck and RK3399 Puma
(patches 4 and 5) also depend on the following patch series:
https://lore.kernel.org/linux-devicetree/20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de/

This fixes incorrect pinmux on UART0 and UART5 for PX30 Ringneck on
Haikou.

This adds support for the HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
fitted on a Haikou carrierboard.

Additionally, this adds support for Haikou Video Demo adapter on PX30
Ringneck and RK3399 Puma fitted on a Haikou carrierboard. Notably
missing from the overlay is the OV5675 camera module which expects
19.2MHz which we cannot exactly feed right now. Modifications to the
OV5675 drivers will be made so it's more flexible and then support for
the camera module will be added. This adapter has a 720x1280 DSI display
with a GT911 touchscreen, a GPIO-controllable LED and an I2C GPIO
expander. Support for this adapter on RK3588 Tiger is being added in a
separate patch series[1].

Note that the DSI panel currently is glitchy on both PX30 Ringneck and
RK3399 Puma but this is being tackled in another series[2]. Since this
will not be fixed through DT properties for the panel, adding the DT
nodes for the DSI panel even if not perfect right now seems acceptable
to me.

[1] https://lore.kernel.org/linux-rockchip/20241127143719.660658-1-heiko@sntech.de/
[2] https://lore.kernel.org/r/20240626084722.832763-1-heiko@sntech.de

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (5):
      arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
      arm64: dts: rockchip: fix pinmux of UART5 for PX30 Ringneck on Haikou
      arm64: dts: rockchip: add support for HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
      arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
      arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo adapter

 arch/arm64/boot/dts/rockchip/Makefile              |  15 ++
 .../px30-ringneck-haikou-lvds-9904379.dtso         | 130 ++++++++++++++
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  | 190 +++++++++++++++++++++
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |  10 +-
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 166 ++++++++++++++++++
 5 files changed, 510 insertions(+), 1 deletion(-)
---
base-commit: 6ee0b9ad3995ee5fa229035c69013b7dd0d3634b
change-id: 20250128-ringneck-dtbos-98064839355e
prerequisite-change-id: 20250219-pca976x-reset-driver-c9aa95869426:v1
prerequisite-patch-id: 24af74693654b4a456aca0a1399ec8509e141c01
prerequisite-patch-id: df17910ec117317f2f456f679a77ed60e9168fa3

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


