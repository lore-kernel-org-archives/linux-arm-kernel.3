Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16615FD88E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 03:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i0cqElL3FWQttc5ynUxbLCGYQL0cUYEinne5EtnxvI=; b=JpNiTl07n9uJTKRarRBvZvd7bQ
	m14EnTS2l1yqPkRrVj0mO77it06Pw/V/B1xaRu/TYfgz7ROklJM3NdcHUj45FjwCiAg3xa49ymv4a
	XVKuDTzJQBrWDEFzrSsu4LMRpZSXo2DnRu0aq6Ljbf7zosMzCB7xAWCaU9JZh2v1NHxnNjPxXm0wi
	Pp73BGe2TOGZptiwJYKwtOiKEfCCUJKahOWhMxwGjMhQHeT5D+tEKaH8YpPKtHvBFR+zMF1vMfOpL
	MnXHFQlr/Sd7HXpmyHabPzKizkfc6gmpY68sCXr7+orhYMBZrtwmtiRsGZUSSo/e3odLIay4W6FC3
	zq3Bd/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09oF-0000000Aa83-1AHR;
	Wed, 11 Mar 2026 03:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09oD-0000000Aa7a-1c2V;
	Wed, 11 Mar 2026 03:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 677D060132;
	Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1298CC19423;
	Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773198028;
	bh=bOXGmh6jsTxCsgYCU4QHEri4xQgWhuXk6jt33pBkt/M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MBo62BpPJVP29oqsWlvaUEmQVEicBzq1LzxONNHQoQJeAlOHFN27fwIYhsEkwpaUf
	 543muqKkM5o5/dNrAJRZigmxY2M5WVe/1QCjnsHxq0Mcj6jR+1xkc+2RCaU2IwQxrD
	 8OgHEkmTQoJAw3xcls+LC8RLLSGdUfS9cRTaEyfHqnau6evdCT0yl2CbgAW3GNHzQo
	 uXZZ3ur23R3qcmztDAFeJ4hQoEMzpQjWuBdaFQCFYCdoE8yAwMNPNbWjq/Hguns5vE
	 1tAT4z+YuaROAdOa0CEyQs/19Dtnb7TN9at5Tao5oFzqNZZe0R2S/6Pnx5s7vWg4fI
	 Ck8Kh3oKcVFEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F783808200;
	Wed, 11 Mar 2026 03:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177319802455.3019253.1878262013471339195.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 03:00:24 +0000
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, wens@kernel.org,
 davem@davemloft.net, edumazet@google.com, Frank.Li@nxp.com,
 imx@lists.linux.dev, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, maxime.chevallier@bootlin.com,
 mohd.anwar@oss.qualcomm.com, netdev@vger.kernel.org, pabeni@redhat.com,
 kernel@pengutronix.de, s32@nxp.com, samuel@sholland.org,
 s.hauer@pengutronix.de, me@ziyao.cc
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

On Mon, 9 Mar 2026 09:38:26 +0000 you wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: provide plat_dat->dma_cfg in stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/7a6387dec8ce
  - [net-next,v2,2/7] net: stmmac: convert plat_stmmacenet_data booleans to type bool
    https://git.kernel.org/netdev/net-next/c/c3d08424e025
  - [net-next,v2,3/7] net: stmmac: reorder structs to reduce memory consumption
    https://git.kernel.org/netdev/net-next/c/3357642e65e9
  - [net-next,v2,4/7] net: stmmac: use u8 for ?x_queues_to_use and number_?x_queues
    https://git.kernel.org/netdev/net-next/c/94808793fed7
  - [net-next,v2,5/7] net: stmmac: use u8 for host_dma_width and similar struct members
    https://git.kernel.org/netdev/net-next/c/758ed85aadd0
  - [net-next,v2,6/7] net: stmmac: add documentation for stmmac_dma_cfg members
    https://git.kernel.org/netdev/net-next/c/9fe167ab790b
  - [net-next,v2,7/7] net: stmmac: add documentation for clocks
    https://git.kernel.org/netdev/net-next/c/315bab9411f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



