Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA1AC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulh1dPI3L1SxP7LLxw1EsSyfBt9XripzbpCsqcOXeMM=; b=hrcOpy4L7AqwZYAg5Aoo5V3UTn
	cEfBw44KrQZ1HmlyyG+cU9oi0dqbQK9NjnOev4t3Bo2b4gRuzaQ2VY3C+zVbVbKBrT+7V32d/GpvL
	HYpK/Ahjivue4kS1GUEyKemZCwzSziHlssEj1Cx4MVwE3VPaRugFKcDk++vjGQ9d0h2SY8hUUnmA3
	kBc6PGBGD1hfD0XlHlco5kZwURnKhcXkepaW2RIZEu82rRDA2U6D007JT2f+E2NVvsJbmZDDcwmKj
	hxXiKC7LcM86VgCKpZ9j4vxO/hzX/cgfRjBLeduG6tVgQVKpqqbijIPoQdtVmRH/SDolPcBfAwTYv
	MQtfbYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUBX-00000008smG-1gWw;
	Fri, 07 Aug 2026 23:41:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUBV-00000008slq-4C2T;
	Fri, 07 Aug 2026 23:41:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 753B0600B0;
	Fri,  7 Aug 2026 23:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C17A1F00A3A;
	Fri,  7 Aug 2026 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786146065;
	bh=ulh1dPI3L1SxP7LLxw1EsSyfBt9XripzbpCsqcOXeMM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Pmg4iT+AYQgxC+7RQJv2MgAiU4ULsMuE+PTh0hwaZ1/W8hsQvBlSBOuCJGo7eIhJ3
	 Wsz4qV/1Zv9WAzFKYqN6txcEajHUzxTgPBoo2fsijn4LlAkB5DVUx4AKhE+Wz2py10
	 MNBrXfBecoLzmRv8p3p6+X9ATubwcMvhDPpPeMEmYQViJ+ETncRwV1HnqyyRglEHCt
	 ceQ4jNplX7Q/7WFnj9iFAKJGkphoa6qlA8DWDWZi8LoMgLomCao3GcafE6vCU5LIbH
	 QuSptlAcc5jTwsToPd0WujLWoPkr7UXibUXpgKJ4ZesprMBOUPEYLkjShnmAEk0BCL
	 7e8SeplYH8EOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AD2380CEF9;
	Fri,  7 Aug 2026 23:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: mediatek: add EcoNet EN7528 PHY
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178614602338.2465504.18347820222618862870.git-patchwork-notify@kernel.org>
Date: Fri, 07 Aug 2026 23:40:23 +0000
References: <20260804103321.3331802-1-naseefkm@gmail.com>
In-Reply-To: <20260804103321.3331802-1-naseefkm@gmail.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 edumazet@google.com, hkallweit1@gmail.com, kuba@kernel.org,
 matthias.bgg@gmail.com, pabeni@redhat.com, dqfext@gmail.com,
 linux@armlinux.org.uk, SkyLake.Huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Aug 2026 14:33:21 +0400 you wrote:
> The EcoNet EN7528 MIPS SoC embeds four Gigabit Ethernet PHYs (PHY ID
> 0x03a29491) behind its built-in MT7530 switch. They use the same LED
> register layout as the other SoC PHYs handled by this driver, but their
> LED controller powers up with its external control disabled, so the LED
> pins stay dark regardless of what is programmed into the LED control
> registers.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: mediatek: add EcoNet EN7528 PHY support
    https://git.kernel.org/netdev/net-next/c/b6e2649fff15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



