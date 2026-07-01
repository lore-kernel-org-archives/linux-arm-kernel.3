Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q/M4iftPwXwOXkuB442nTPnYH/p2eAZGJdhwDTouz8=; b=n4eLQ3KCBMSnByHmV0WxYjSiXF
	yn5aU4lZg+M4FTehZYBa3Bww5AaMcuTTj80aDsGpJzgNndkvpLTJWawm8NgBQj6Aktuvs7Dr9DyUo
	DQKi3KOEP/SrJy8nZh3ZsYlYxyAf+3LWY8iriG4Khy7W30Myd5AxGKwpOnIzEfYOAq8hYaoOPC+dB
	VK+dZKaw+1NcwvieGq2KHz6Foe9l39X58F8MrSPiLiIlvqYZQcfcpS2jP1Axspwweu5B7A+GNYOFt
	22h3oOubx6rnvXM0jg0A7si5jvy7VDOlbws1MfrIgGcnhCIaJsYdKwFl3vCrNuVHXONNtsf7XLpqU
	HI+t6N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiNU-00000000OHQ-1R8y;
	Wed, 01 Jul 2026 00:00:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weiNS-00000000OH7-3zOO;
	Wed, 01 Jul 2026 00:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D86A460139;
	Wed,  1 Jul 2026 00:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0A91F000E9;
	Wed,  1 Jul 2026 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782864029;
	bh=/q/M4iftPwXwOXkuB442nTPnYH/p2eAZGJdhwDTouz8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=D2aridIB3ZeNJJR3QUrliEur8twz15o6NHQ3r4VfEqZ4ETR7iR4Pcmpw5QOls9KWg
	 ltdTxZYZRZUW7G04XshPf1tQrDKzMzGzkUSCpoRrq01HHBFl6KI1ZNg+A0EihUDQ85
	 Nn9/j5cFtBd93A8542gMmvRvLNPhVlsZlGm/unA5oSqjRfx0Sssw6SyErZ08s5sS0r
	 wdXiV9NryfEhhimef0etZQj0seb/z8TTI9ZjY0OFngTzUGWG5UiWq5EZlaVgH5tvzo
	 7uagUhv9ei4cRcZc7VrB0c2q7hSjQx6n5p1nbz8XvvSHDY8gNuo7YLSf228yTJeONP
	 M3PWol6eIbbXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939E5393A963;
	Wed,  1 Jul 2026 00:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178286401313.341356.16335263979724856348.git-patchwork-notify@kernel.org>
Date: Wed, 01 Jul 2026 00:00:13 +0000
References: <20260629132633.1300009-1-arnd@kernel.org>
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, arnd@arndb.de, brgl@kernel.org,
 andrew@lunn.ch, sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.com,
 Frank.Li@nxp.com, robert.jarzmik@free.fr, krzk@kernel.org,
 gerg@linux-m68k.org, tsbogend@alpha.franken.de, hauke@hauke-m.de,
 zajec5@gmail.com, ysato@users.sourceforge.jp, glaubitz@physik.fu-berlin.de,
 linusw@kernel.org, dmitry.torokhov@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux@dominikbrodowski.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Jun 2026 15:26:20 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
> 
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,
> or linux/gpio/legacy.h for the few remaining users of the old number
> based interface.
> 
> [...]

Here is the summary with links:
  - [01/13] ARM: replace linux/gpio.h inclusions
    (no matching commit)
  - [02/13] m68k/coldfire: replace linux/gpio.h inclusions
    (no matching commit)
  - [03/13] mips: replace linux/gpio.h inclusions
    (no matching commit)
  - [04/13] sh: replace linux/gpio.h inclusions
    (no matching commit)
  - [05/13] mfd: replace linux/gpio.h inclusions
    (no matching commit)
  - [06/13,net-next] net: replace linux/gpio.h inclusions
    https://git.kernel.org/netdev/net-next/c/a53d1872f2be
  - [07/13] ASoC: replace linux/gpio.h inclusions
    (no matching commit)
  - [08/13] pcmcia: replace linux/gpio.h inclusions
    (no matching commit)
  - [09/13] phy: replace linux/gpio.h inclusions
    (no matching commit)
  - [10/13] media: replace linux/gpio.h inclusions
    (no matching commit)
  - [11/13] Input: matrix_keyboard - replace linux/gpio.h inclusion
    (no matching commit)
  - [12/13] gpib: gpio: replace linux/gpio.h inclusion
    (no matching commit)
  - [13/13] gpiolib: remove linux/gpio.h
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



