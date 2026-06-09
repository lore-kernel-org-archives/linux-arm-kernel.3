Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429AACD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/SmChEyaTxwNDvJOsJZuPwTbPPjn5OrsQpqNkPazWo=; b=4DLfetBITFUHSRSV/WWDBDOtO+
	flaJC2374b7cyyY8NSdtgGM5F/OpxI2nd/NVgUphYTcy3/FAXWeN4Jy4th6YyIAHYeEjlT2Zjeq5/
	fKLAQ9XberHlcdwe3oaY3GEmFGEDexxttrfyLCuNzwkGQHzo2cuJtXF4nMlNXjdzr8AKQO9donley
	pmJzf2CrungRO9mFS1N+LCxbY+hViwSHDV8jvDWHAByVFd1xKNug+OrpXhyMzw6R2P3k8IVkCRyd1
	+tPYE+jmKlvfcc7apej9VQg3nM8yLKGiKKZgCqZWaA+gpKLRF9TxIfpucDonVAmUv4Zfzv6OXTzCs
	CpyRcrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr3q-00000004yp1-0HBP;
	Tue, 09 Jun 2026 07:39:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr3p-00000004yok-14IF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:39:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B22D0601E6;
	Tue,  9 Jun 2026 07:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AF61F00893;
	Tue,  9 Jun 2026 07:39:42 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v7.2
Date: Tue,  9 Jun 2026 10:39:39 +0300
Message-ID: <20260609073939.813573-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.2

for you to fetch changes up to 96b33938cf783c790036e35860b206cf029f2e2a:

  ARM: dts: microchip: add I3C controller (2026-05-25 22:54:37 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v7.2

This update includes:
- I3C controller device tree node for SAMA7D65 SoC

----------------------------------------------------------------
Durai Manickam KR (1):
      ARM: dts: microchip: add I3C controller

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

