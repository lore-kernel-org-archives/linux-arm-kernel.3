Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2C4D73EB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 02:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpFzYK0pQ6kwrXgjTwhpRWJMnr17ONyKDwG7dMMGPYQ=; b=wQF++cqunbqiGot3d81FyuIXtc
	KfCpX0bg5yIIz0M9Tp3yMs51pUsSi4PKP7JVBaVR3acv3gn74z+AkXZzOH56hDZp/UZLqUBk8rI6G
	PGhVK9TubdH83N3IOtoLg7DGHbTSfvfGlDcbG8fVYm78ISjuj4Hjf689u4Pl+spLyJHEg/4uiE7GP
	ph5CZ/Agsqs0d+KIvRuHQUSzbe89kwSo5RKM3BseHd7eyCe39vtEVJeWdBLo4bNJssSJLqmB5GtIg
	0GnTzkPw7N/g7SYNVH4LmwFcdjVVViv5nJzFd9/JyqgfjnOkixO7L1D3sK3TMXTRnRe4rzh0DQQ6I
	2YWQZZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleax-00000000ua4-1CSF;
	Fri, 30 Jan 2026 02:50:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleaq-00000000uWM-29VX;
	Fri, 30 Jan 2026 02:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20A5D6012B;
	Fri, 30 Jan 2026 02:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD91C19421;
	Fri, 30 Jan 2026 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741442;
	bh=DDD2HhaWU8hgGNcvsxgeR8SKHG9Tsx5ygB6TGhAYZ04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e69iaom0KVVwNSrLlbLpYVy3WJJtrfzlkmiBdfoFdUpZCoO4RgyJ1CkGIaJ/Ik1CY
	 b0Q129iqFKEDsJANqfrCLO1TS5owegvwSOQbLrEjpl8P6lpUpUQlSX0/8nY76rctyO
	 2wOH8tTmpiilNk3ZvG6GtOTo7VMPqGUXf+xaItER3DuzLXhfu7xi0LFce0PCDT9lCu
	 I9zVRAn6eMazlpssdqX66pNZq82Ks1jPd5r0QkNMzUQOeAlqOA2eX/Sq9YkcAxcL6Z
	 5pSpPpwf+4IwzZr2nT+VcBVx5KIYPf982ywliNkwJ6SssAP18bCFtmfhfGlG50hRCr
	 Ut+9fOZNRNCkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8D1E380CEE0;
	Fri, 30 Jan 2026 02:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: report active phy interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176974143534.3149010.10116225722696356568.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:35 +0000
References: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
In-Reply-To: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, fustini@kernel.org, edumazet@google.com,
 wefu@redhat.com, guoren@kernel.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
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

On Wed, 28 Jan 2026 10:47:43 +0000 you wrote:
> The original patch needs dwmac-thead fixed so the PHY_INTF* definitions
> do not clash.
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  6 +++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 10 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  2 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  2 +
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  1 +
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 52 ++++++++++++++++++++++
>  7 files changed, 69 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: avoid conflicts with PHY_INTF_* definitions
    https://git.kernel.org/netdev/net-next/c/88afa0dd655c
  - [net-next,2/2] net: stmmac: report active PHY interface
    https://git.kernel.org/netdev/net-next/c/d9009f72ed88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



