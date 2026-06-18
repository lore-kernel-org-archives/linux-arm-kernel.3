Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87347CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 00:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fVcwov0xUbbsvxiR509uVDetK1RWIqoecjtKQCv7YQ=; b=OX6KTzhjv5RIYPxZZ1xRl/dVjo
	DVoA4cejpvi4nSi+y9rM4B6fXSOCpMIpuOPFxFoK7mR/baEw0uJzunrGcqPSkrR0/ISzTGsKU5Pv0
	USZHDWqVHGP6lmvox3wgWXjl9L4GSYLY2I7i5KYdkdFGQ0GVCnUrIvA0sZniqe10FS+w9oEgkTIPX
	+2uS6oyqChX3YkGnZJ2edHsfdAdawvNOipThq2dHPXX2fYQ6ncIAyx2wQ68JhZnLqEqcM2c1g+vbs
	8TBANBXf+EbOyu/YXzTh7F0lW5RovqygrwD8SwOA31+NjmV0Kqh9idyfkKm0F21uSkh+suNsGAffi
	hjySHGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0V7-00000000Rqd-3eVN;
	Thu, 18 Jun 2026 00:20:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa0V6-00000000RqS-1T4l;
	Thu, 18 Jun 2026 00:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E0B543B75;
	Thu, 18 Jun 2026 00:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E51F000E9;
	Thu, 18 Jun 2026 00:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781742055;
	bh=4fVcwov0xUbbsvxiR509uVDetK1RWIqoecjtKQCv7YQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fboahXFexfnQG2mmEymI4v7jf3N6BQJODVoQswWVNXRmEI/DQvPH1yBnoWNfsd+q7
	 oAtIV/06GLHxrjBADEAO4nizn5DIgvYqYvqcLPAUm1SKE+ua8srU99ekdeBvxTk3+s
	 38GUM+deRGe5Rkf7Rl69YO9BteCmVrgvQ2nu65TtFH5nsqUdkAHtnsHy9LJI9Dw4qJ
	 Dh9/1VqdH45QNqoYpPp27XYn+NMCR9qVLrEUQim9rMM61jkOXY5x3AhMaBP/dYWHj/
	 JQX3sZPo7SEMPbP4MjUZVSnT/q0QRiT2P0GTjjLvIncSuNZFYgQKInwBAy6r/yfuKo
	 KDVSr22ZV6UjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A4E393102B;
	Thu, 18 Jun 2026 00:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix supported_interface
 set
 after phylink_create
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178174204913.1875263.9684568124296836411.git-patchwork-notify@kernel.org>
Date: Thu, 18 Jun 2026 00:20:49 +0000
References: <20260615151106.15438-1-ansuelsmth@gmail.com>
In-Reply-To: <20260615151106.15438-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, daniel@makrotopia.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 15 Jun 2026 17:11:00 +0200 you wrote:
> Everything configured in phylink_config it's assumed to be set before
> calling phylink_create() to permit correct parsing of all the different
> modes and capabilities.
> 
> Commit 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988
> internal 2.5G PHY") while introducing support for 2.5G phy for MT7988,
> probably due to an auto-rebase, placed the configuration of the INTERNAL
> interface mode for the supported_interfaces for phylink_config right after
> phylink_create() introducing a possible problem with supported interfaces
> parsing.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix supported_interface set after phylink_create
    https://git.kernel.org/netdev/net/c/e4b4d8410c7c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



