Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4610FCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHGG1rrfCa6iW5IzHFVnISXxH0BdHc+dP0J0kdkANIg=; b=C/lAAwUJizhzI9+DwEPzqulGH8
	OA39B3PGDsDzl9xgLVm0j76MBgw9WVc7HlVVyRj1vk3HQlYRMPOa6plw2XECCccAEfDv3EiOzYggY
	zyvXXFP4TpySg2u1nRyxtCWDpe+s7ZgArfRweRJE3wY44cl1U20VKvL1/iOLU12VEpDuLosQ3lYko
	/D7U2SYzIRDqXQwv8QhcAsPi7sYtuqItjz0NOtwpJujP9s0YCOUGaoHnKu1hX80X4ypWAEWMMyO6g
	E09SbEr9/WYXn5Xd32/tdXmfn4t1tY2iZhwvNbQGAJI2RXFD1wqj9G7t9rZ0p+15tnEQ1bHqaB3BQ
	npPQPgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr5B-00000004ywp-0vsd;
	Tue, 09 Jun 2026 07:41:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr5A-00000004ywe-1YGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:41:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEDCE4457D;
	Tue,  9 Jun 2026 07:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7831F00893;
	Tue,  9 Jun 2026 07:41:04 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.2
Date: Tue,  9 Jun 2026 10:41:03 +0300
Message-ID: <20260609074103.814073-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.2

for you to fetch changes up to 8071815790141d3f05e32b972a6c79fdbbb88cfa:

  arm64: dts: microchip: lan969x: add OTP node (2026-05-25 22:59:07 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.2

This update includes:
- the device tree node for the OTP controller on LAN9691 SoC

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: lan969x: add OTP node

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

