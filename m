Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEADCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IItUhd+nrIIx8JH+xOhBt3cy+5U1KL3HHWp96QJofQs=; b=c5OU0EJopDMkK66wBj+phHqT8q
	51nSF5/2Oo1cv1fxr4CM3oh8/w1a6Oww3zg1UwtdOl/U09zC2aYI2E65ziwe9E0kCiRuFa8QIa/ON
	YoEYkCSetIptmRQZsCSgfCVkbp3RbpbAGYVhVVY646GQ+igvJGOpBBroc5DdLhtP1l5582XwRBLLU
	zgvSkhrNpf1rY/7j6gusCwGnwdnTFIjpIfAXBvx775Pr4tBN91II7u1+LvUV4ElLwjWXKe4sqHOUI
	Y1Kn7R6uFrGA+a1LtARsdMo32dbo+wIv/6RfOMEs3tHoxy6kBJZtW55FdNWVDaQ2uwt20ULK/Dpt5
	1UZ3JP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU10B-0000000AlFb-1b8g;
	Mon, 01 Jun 2026 11:40:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU10A-0000000AlF5-1t3f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:40:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 907FC60018;
	Mon,  1 Jun 2026 11:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EDD1F00893;
	Mon,  1 Jun 2026 11:40:11 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v7.1
Date: Mon,  1 Jun 2026 14:40:10 +0300
Message-ID: <20260601114010.2652407-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.1

for you to fetch changes up to 765aaba18413a66f6c8fe8416336ca9b3dd98a79:

  ARM: dts: microchip: sam9x7: fix GMAC clock configuration (2026-05-16 19:52:37 +0300)

----------------------------------------------------------------
Microchip AT91 fixes for v7.1

This update includes:
- a fix for the GMAC DT node on SAM9X7 SoC to properly describe the
  available clocks

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix GMAC clock configuration

 arch/arm/boot/dts/microchip/sam9x7.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

