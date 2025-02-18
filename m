Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0901C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wBUUBmlh4+v3mimZMQL44FQWAncoMeRPlEV3jQWXZes=; b=1ERwTPYGKEUXpx
	+yJMPe4yFWSOADEhEzC1DFajUEgfES5YQWjoONWseKKl+ddX82GwoCNLhrWAk6RAnQDgYEBY8hiPN
	sDIDvDRgFc1Yt+rLO4d1bAlCUd+/cjGVkBqot2fi/k0hLO2ocoxOYvG09qthrzmzuDmXAsFii7E5C
	Yd2A3ixihz+7g3Ura5K9TtAZ0pSCLYi3gKnrglgE5Nlr9FomaTTSTsi5LQmEj+xIFQBL8/cq6xpVT
	KftpkoGk5+LN6VtQGGwRTVhU5Ruq/x0pFvV7n3DTxObH7wjCc6SFxXbTQNY8ILzAur3n0/TH6LQeR
	YpCm8iBs0LuX+FvF5Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMVy-000000086hX-2J8f;
	Tue, 18 Feb 2025 12:15:50 +0000
Received: from smtp-42ae.mail.infomaniak.ch ([84.16.66.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6X-000000081VW-2NEo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:35 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVd2gHPz4FR;
	Tue, 18 Feb 2025 12:49:29 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVc59ZGzkyq;
	Tue, 18 Feb 2025 12:49:28 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/9] arm64: dts: rockchip: align and reorganize Theobroma
 DTS(I)
Date: Tue, 18 Feb 2025 12:49:11 +0100
Message-Id: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdztGcC/x3MQQqAIBBA0avErBvQIZO6SrSQmmwoLLQiiO6et
 HyL/x9IHIUTtMUDkS9JsoUMXRYwzC54RhmzgRQZRVrjkUZ0q/iAs5NlO9FSRbqyytamgZztkSe
 5/2XXv+8HVPcwi2IAAAA=
X-Change-ID: 20250211-tsd-align-haikou-724214707659
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034933_749680_E9723F1B 
X-CRM114-Status: GOOD (  10.12  )
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

We have three SoMs that can use Haikou as their carrierboard so it'd be
nice to have consistency across SoMs on what's enabled by default. To
that end, Tiger Haikou now has UART5 enabled and Puma Haikou now has the
EEPROM found on Haikou specified.

Additionally, some devices were configured or enabled in the wrong
places (either SoM DTSI when they needed to be configured in
carrierboard DTS or vice-versa). This moves things around to better
match actual HW definition and make it easier to reuse the SoM DTSI
without having to undo carrierboard-specific changes. While at it,
disable devices/buses exposed on connectors which do not have overlays.
They need to be enabled in the appropriate overlays whenever they will
be added.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (9):
      arm64: dts: rockchip: enable UART5 on RK3588 Tiger Haikou
      arm64: dts: rockchip: move DDC bus from Haikou carrierboard to RK3399 Puma DTSI
      arm64: dts: rockchip: move I2C6 from Haikou carrierboard to Puma DTSI
      arm64: dts: rockchip: disable I2C6 on Puma DTSI
      arm64: dts: rockchip: enable I2S0 in Haikou carrierboard, not Puma DTSI
      arm64: dts: rockchip: add EEPROM found on RK3399 Puma Haikou
      arm64: dts: rockchip: enable Ethernet in Haikou carrierboard, not Puma DTSI
      arm64: dts: rockchip: enable I2C3 in Haikou carrierboard, not Ringneck DTSI
      arm64: dts: rockchip: disable I2C2 bus by default on RK3588 Tiger

 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts |  2 ++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi       |  4 ----
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts   | 18 +++++++++++++++---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi         | 10 ++++++++--
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts  |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi        |  1 -
 6 files changed, 27 insertions(+), 10 deletions(-)
---
base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
change-id: 20250211-tsd-align-haikou-724214707659

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


