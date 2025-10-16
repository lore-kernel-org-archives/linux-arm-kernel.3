Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci9cQUS4iV6pzMvlfYXWEfvkxrFumijtVmx/FqY0VDc=; b=H5OFlRlBCMekFVo2gfqwNph087
	RnzUvawASucK7jeeHwy4DXSOQyXsmjgMwugvWssNahUtzx+KuT+Ly3ax/3vxYbG9pO192YAJbCLhm
	Lz4MSSfdH6qXoDQA/8mfIaRND3mg3hRJ2wMF+zRYgks9qrYElTbaelUM6wWfk/MVcaFN4NFbIzqwt
	z3qhd4ey5lywD6nEfeZWcyKKH3LfMmF8dQJzMv65w3H4m5orJgGWMSlJx3l7upvR/YlIf0xGtUJ59
	MCXTbm2gbf5hQOsyF1NiMs5O/IZozVOxxlLyFPigZqMiS8/pOlVifZbBKlpLwJ9J7cj9xcSj+19O9
	Z5Roh58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9X79-000000067Bo-1GAp;
	Thu, 16 Oct 2025 23:10:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9X76-000000067BA-3iTl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 23:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A58D40192;
	Thu, 16 Oct 2025 23:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B2AC4CEF1;
	Thu, 16 Oct 2025 23:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760656228;
	bh=7AUlS/E/OmspYWOQMifKYx2KW7NrQ6lvqhU6h0IwChE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q0MLGu9zZFT+dmRt7e4efsxOyKWlLoPYupOEksSgrt8aMxyfl/jbIxtivbj8TNn5O
	 v6x4BaqC3tPY6C1Io5g9D18XlWWvOvEOekiiTXVYAJxxYUTkRNEBk//Qs99X5kuAf+
	 D3Fpzw/uA6A25M9e7UeaEWYxD/lBUmsy67+E0DdeE9lRHi31676/i1ZotqS4/XAS6n
	 HJUrDW/cKNyiWBK36zT7IliROMXrft9r6ehusOKJqlgR1UBYKxyYYDmkuf27N7Bajc
	 Ex8ez8sOUoMP5Gup9dUJt8ItnPWNV7iUk8SXO5UTbgiWJrV1WraKEANo08DVe4VhDU
	 UDy5tacS3p/xA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F553810902;
	Thu, 16 Oct 2025 23:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: stmmac: more cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176065621200.1940287.10394518101609096808.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 23:10:12 +0000
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_161028_942402_667B8928 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, 15 Oct 2025 17:09:07 +0100 you wrote:
> The subject for the cover message is wearing thin as I've used it a
> number of times, but the scope for cleaning up the driver continues,
> and continue it will do, because this is just a small fraction of the
> queue.
> 
> 1. make a better job of one of my previous commits, moving the holding
>    of the lock into stmmac_mdio.c
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: dwc-qos-eth: move MDIO bus locking into stmmac_mdio
    https://git.kernel.org/netdev/net-next/c/12a7b7bc1427
  - [net-next,2/5] net: stmmac: place .mac_finish() method more appropriately
    https://git.kernel.org/netdev/net-next/c/0bc832a54d27
  - [net-next,3/5] net: stmmac: avoid PHY speed change when configuring MTU
    https://git.kernel.org/netdev/net-next/c/e82c64be9b45
  - [net-next,4/5] net: stmmac: rearrange tc_init()
    https://git.kernel.org/netdev/net-next/c/07d91ec99a8a
  - [net-next,5/5] net: stmmac: rename stmmac_phy_setup() to include phylink
    https://git.kernel.org/netdev/net-next/c/4a4094ba7ad2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



