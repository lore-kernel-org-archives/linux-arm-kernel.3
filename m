Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF8CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u3g+p7pQ6JoJVQEnX5LE48ozxdUNMa5LUsxD2CLpza4=; b=L2/sw7EB15rhfrgM51u0XeWiQm
	CorQ8Ax1gqvtm/FMRgqo1bN8wGTzl6IHL2Aj28DC6sX+Ebs1Hf5ey05oDN81yfQBi9gT0ASwHlKrK
	gIrBXwPaWPxK+6zRFwPxROaj2q0C2rdwGTn8YWQjV6HUKlNBnrygCoxmCM0qw8TWHbgUEBCnpEOuk
	RPpE3+w9dmn27VvGQ/kOySNMnWeZeA76SI2keI/DR5CF+0SXhTVAQ75Fgrffl4DX1gEoqh3yYKBuf
	Z65TvpYKNk3EWYKTBYAgwcZdDPDk4q7xa2orwn1diExwXvafpdgbKOiXKCLR6wNZpCSNgQS6t/+3Z
	eAvE0xVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr3H-00000004ylM-42CQ;
	Tue, 09 Jun 2026 07:39:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWr3G-00000004yl8-0fnH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 07:39:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C8A601DC;
	Tue,  9 Jun 2026 07:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFB41F00893;
	Tue,  9 Jun 2026 07:39:07 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v7.2
Date: Tue,  9 Jun 2026 10:39:04 +0300
Message-ID: <20260609073904.813405-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.2

for you to fetch changes up to ac75ae436723e5fe68dcc8e806f66d0358dd56f7:

  ARM: configs: at91: sama7: add sama7d65 i3c-hci (2026-05-25 22:55:30 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v7.2

This update includes:
- I3C flags for the SAMA7 family of SoCs

----------------------------------------------------------------
Manikandan Muralidharan (1):
      ARM: configs: at91: sama7: add sama7d65 i3c-hci

 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

