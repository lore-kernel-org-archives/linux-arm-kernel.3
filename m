Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0BBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pswaEvXrxqiCuPqguUrIpa+69TcLaVsgIe/a8Du3h30=; b=3TJW9sUo9HtkHpSjMsE0ZezQUo
	jm9wUIyK2sJrrhJM/UIz+5wV0gCqk5rws/ZUygOqFl+x4Pt86aanb3Xza9fzl0gIq5HN5T4XqfRM+
	M+1lPEwKbumMc5HVHG3JQ1pJQ2tJpVE6y/dQcKILGC8GQwYmS+KGSoaF1LwDuIf0LGcZdpOZM4WDo
	ESDOtltjrUc7ltTQ63E62zSr2jtXT/uLtyqSxc4hXTrhfNacsJkgxizNZrhXASWgvfIfvllqhWm6Q
	FzbZBIfBsymMpcY9nH7g5+InhFEXd/eRGfQ73gI7G2KYf8iLXIAffdg7STgTcANA0Zq5A88WRJCfU
	VXkJgu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsMW-00000004MNR-13zD;
	Tue, 24 Jun 2025 01:22:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsK9-00000004M5E-33Q3;
	Tue, 24 Jun 2025 01:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7172629C6;
	Tue, 24 Jun 2025 01:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4619C4CEF3;
	Tue, 24 Jun 2025 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750727984;
	bh=i8HmAnFDktLAN6p9Nv9fj36EDKY0uQqypdcdnsV1cUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qbApFGTxhNc7UDhHKJ6J3UJL7OJd4o9QzP04wE6FkvuMWVkHWcMPGiR4XeEhNt/jt
	 Hm7XfNrXcBTbOyvml0OjsO7A5senyOlKulf7qbDc0gGriU7VfqDi6IWwa2LpHL4yzP
	 eK99+RUI+1DmZhKSI8BvenGL+bVwY1Y8WkBSTih7Lsqtu2ADfL7JHkXQtoi3FsH24Z
	 1291NiwRQsGbpvbC2yBqJUZXUhCrq/vlj75dbhjJkwFMqZNViC4BhQdrTYnBymlQbU
	 JOmCCL1QYq132gIQfwfOiakDt4uED1sNUxCjXIbdKRY2PKwdZJJvx+nKnERCTYwunC
	 oPtTLXkOyNigQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBE5239FEB7D;
	Tue, 24 Jun 2025 01:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v6 0/4] rework IRQ handling in mtk_eth_soc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175072801175.3355543.2001178239431704817.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 01:20:11 +0000
References: <20250619132125.78368-1-linux@fw-web.de>
In-Reply-To: <20250619132125.78368-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, frank-w@public-files.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 horms@kernel.org, daniel@makrotopia.org, arinc.unal@arinc9.com
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

On Thu, 19 Jun 2025 15:21:20 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series introduces named IRQs while keeping the index based way
> for older dts.
> Further it makes some cleanup like adding consts for index access and
> avoids loading first IRQ which was not used on non SHARED_INT SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/4] net: ethernet: mtk_eth_soc: support named IRQs
    https://git.kernel.org/netdev/net-next/c/ee85b483fefb
  - [net-next,v6,2/4] net: ethernet: mtk_eth_soc: add consts for irq index
    https://git.kernel.org/netdev/net-next/c/498190100992
  - [net-next,v6,3/4] net: ethernet: mtk_eth_soc: skip first IRQ if not used
    https://git.kernel.org/netdev/net-next/c/9c0feca0a68b
  - [net-next,v6,4/4] net: ethernet: mtk_eth_soc: only use legacy mode on missing IRQ name
    https://git.kernel.org/netdev/net-next/c/070e98dd4e26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



