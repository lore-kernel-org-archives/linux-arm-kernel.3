Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DCEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDZAUrd6NRutmlohcpBajtWgWqhY6Z8CRqs5nInrP0k=; b=OmlAvDT/S5JNgtgxlUnjmFyun1
	uJas5E3mVNBWscEHotn9C+B6iyrOGiEUfS0jV37KeqJnAU5exY4YImY1HddN084W6feji+NS9gDpi
	+O+6LpeH5US6egaaUu4PT9jI6med60DcAcdt4z05nn8UEHzWfMjhcXh/cNO3gZ/CT8ojwwGpw/BZn
	OB8tGgw4F24PZbbb4vxqy8h22gn34zGi8LOZMRE/9mA/YST6Kh7Srk/jj1zLYHANy96C7TxdfQzVg
	++V5hhOpGW3TDqWkGRJVL9HB/vYWv6Tc6irh1rdApbPKa5Aee+K84+HktwwVjtjw/nd6eSbr44tYL
	kQC8KF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RwN-0000000Ddtl-3xVR;
	Thu, 17 Apr 2025 16:18:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RC3-0000000DWTn-1cFd;
	Thu, 17 Apr 2025 15:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E290E44557;
	Thu, 17 Apr 2025 15:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67DEC4CEE4;
	Thu, 17 Apr 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744903823;
	bh=iIwq3SepiLZOW3+bHC9Ee86Ar1qvIl3ZCPXcm+Gnlxs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=duBEkN2dyHx6WeI6lWcGRUk+VJbfJ9TusBkSmL0/DqZyPtXuwuOyRI3ldPAOk76/i
	 FpU2MNJsPf2EYmm13g+MjUWTt1x9VF96ROOr+szjwtj9zmEpO0lQvzysJ5OiPxbJjh
	 aSPHSbR0J0lR2JrBv8nopXjiuIe/HGeIvP+Q4yT1tqqpgLkSCugkjvmAzJai9EAJWd
	 dGHvsQzMW/LgmAcdTbMfy4j8RHqNfSg7QyL/CYMv7kH7E1KrnrjreAHuFsuydK1Y1r
	 nX0X7499t3/a6siu49RylwDl5hk1KX+fmE8NdeABD94VA1q7XQ2b9YVd7LKazr9O5K
	 eI5tMLEqtBlnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E47380664C;
	Thu, 17 Apr 2025 15:31:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 1/5] net: ethernet: mtk_eth_soc: reapply mdc divider
 on reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174490386075.4117078.7252062901146226930.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 15:31:00 +0000
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
In-Reply-To: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_083023_447063_95BFBCC2 
X-CRM114-Status: GOOD (  10.01  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 16 Apr 2025 01:50:46 +0100 you wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> In the current method, the MDC divider was reset to the default setting
> of 2.5MHz after the NETSYS SER. Therefore, we need to reapply the MDC
> divider configuration function in mtk_hw_init() after reset.
> 
> Fixes: c0a440031d431 ("net: ethernet: mtk_eth_soc: set MDIO bus clock frequency")
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] net: ethernet: mtk_eth_soc: reapply mdc divider on reset
    https://git.kernel.org/netdev/net/c/6bc2b6c6f16d
  - [net,v2,2/5] net: ethernet: mtk_eth_soc: correct the max weight of the queue limit for 100Mbps
    https://git.kernel.org/netdev/net/c/6b02eb372c67
  - [net,v2,3/5] net: ethernet: mtk_eth_soc: revise QDMA packet scheduler settings
    https://git.kernel.org/netdev/net/c/1b66124135f5
  - [net,v2,4/5] net: ethernet: mtk_eth_soc: net: revise NETSYSv3 hardware configuration
    (no matching commit)
  - [net,v2,5/5] net: ethernet: mtk_eth_soc: convert cap_bit in mtk_eth_muxc struct to u64
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



