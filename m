Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E625E1093162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 00:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1L+cT9PIWnK2qrU2G4YbxYVvFtjeCrnH/bE+eJRwQVg=; b=vHoCqB9Hj7Cf7ew1MCTnR5OS18
	0pm3xwppf546rAKYH2MENvUIa/mSkGzMDDydp3avrwvimrIqxn8MKbu9xGKO1PaENRcbYXQxy0Eg1
	BWYouoF9ySPv+26uZdT6zbR53Fg7MjbqdIf0bua940UepjmTO79IAD7OkjwoBrPeNmG441b4Xq6fu
	1g1oCSaK/7zNkA2kLreNEE5idTFicvmJu5HH2Otxx2Vupznq91EHR+ugSF17tWQniaaz9aHxUqJma
	7XQ/mDpFlMJlsZiEk8TfOw9x4Zp03kWVvas+TiGODbFy3JJVx0LtxyLp2n8rwmdLN+B2Az7U/po15
	/6vRr2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Nkz-0000000BqH3-0jnV;
	Fri, 20 Mar 2026 00:30:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Nky-0000000BqGp-1cDn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 00:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62D9A60097;
	Fri, 20 Mar 2026 00:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176A8C19424;
	Fri, 20 Mar 2026 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773966627;
	bh=e00VxEjfVLHb2cCGEacgmrXQHfHXzKuxaGfyE9rbWAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ddiSyLJn/161inpllbDVZpBtaV3o7frFGCIuu8taIPumvJfxkZQMTuAv62oRuAywm
	 DebB73JLuYuB5TumObxCIOcfSy8yD0kVCzgrRFqYBwz9o4xhHNDIqTGQPkvg51++Ht
	 ieXj3bT8VoNTwwLJ/wA/hVes/F/kbUYheRDKKkbaUkGbxFnvDcyyYDIfufoTeh3g+R
	 Mgwf2Eta3Brk6/F972blvl4qZv1z5O/AFfnLjZqKuJ9tNn8H0+eVNqug2fdgGpySyP
	 vi/ZOpa7gEdGdtFjzLQgw4g1ErwTOf0a2R0L7v07VRK5wnsgdbL6ynmY0j0eAEXunE
	 Vml8NhhcvmCUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E8A39302F6;
	Fri, 20 Mar 2026 00:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: stmmac: descriptor cleanups part 2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177396661753.1861152.5017426942573909830.git-patchwork-notify@kernel.org>
Date: Fri, 20 Mar 2026 00:30:17 +0000
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
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

On Wed, 18 Mar 2026 18:26:13 +0000 you wrote:
> Part 2 of the stmmac descriptor cleanups.
> 
> - rename "priv->mode" to be more descriptive, and do the same in
>   function arguments.
> - simplify descriptor allocation/initialisation/freeing
> - use more descriptive local variable names in stmmac_xmit()
> - STMMAC_GET_ENTRY() doesn't get an entry, it moves to the next one.
>   Describe this in the macro name.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: rename "mode" to "descriptor_mode"
    https://git.kernel.org/netdev/net-next/c/1939749ce92d
  - [net-next,2/5] net: stmmac: more mode -> descriptor_mode renames
    https://git.kernel.org/netdev/net-next/c/33be7846e4be
  - [net-next,3/5] net: stmmac: simplify DMA descriptor allocation/init/freeing
    https://git.kernel.org/netdev/net-next/c/e73b19baa3b1
  - [net-next,4/5] net: stmmac: use more descriptive names in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/b4df951549dd
  - [net-next,5/5] net: stmmac: rename STMMAC_GET_ENTRY() -> STMMAC_NEXT_ENTRY()
    https://git.kernel.org/netdev/net-next/c/6b4286e05508

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



