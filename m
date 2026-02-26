Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D526FD4609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 03:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se/fdQNY3dzKEynx6uWLjx3+bZRddjz553rxhD9dfnI=; b=uZietvUBuJWmt01+pFuOrR3Yht
	3HR37QkL6wCrbBAhbXkg8pcaHd1zfBp+qhdJ0Alf3mOX43dPeOc0D58RApb/wtJwd0aCSXJjTiOJN
	d+p/BFE/lJIEmCAJ3SIMc71rkA+KD4IDfsz+nTwBbqQHivxBSVkZjyZzQlQhDJiH3GZhccPe2cd+5
	1UJua4nr92LI6k2M3oFt2tM24+qcNgGo6g+h5gn+izup0i7hKVvPoLH7944yTe9FQKuJsv6X+iUYM
	wJ5Lkb9rlHUQIvCaaSnl6cvIzN3862q49oo/1ti4kvUB4T0tmt8DI3Ft6UJolkdt1Igy4FRIUXYAd
	qRSNOIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRvI-00000005JJS-3WmQ;
	Thu, 26 Feb 2026 03:20:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRvG-00000005JJ3-1Lvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 03:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D11B40C02;
	Thu, 26 Feb 2026 03:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B979C116D0;
	Thu, 26 Feb 2026 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772076017;
	bh=2zmgXg8tJ0GzwYGuMnLjz1ZeoPrFhYj5IT1BMlHijNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mR7dRM2laJxdyx6iZmCw4IkMUwjaMrUDPl1CCXLdLrm8zC2sion63uMHd5bIfr1lk
	 iiqyl/oRlv1UXoa1FPMww9Dm+MktLVle0I2Lw1WPR7MgbbDR1QgPzbx1k1ED0PA4h8
	 rmAOVB+0agDoHHyUFRZzMCw06EB+gatJXGKAaNCbyXIIVe93RvtqgOrYZcNcQWoKDL
	 leMoE/3yIecGQ79VBg071sVO3NPmiwdzWkvK9v60kMVinl2WqE1GQEXQNsqMpmaNAB
	 MDjFEHwNuIJHwF6JzNEj6GqLja9aCrQoVuxa08wYZ68Iab0mkAyAvxaZtowR5IUfOj
	 +dYKsaD1J2Ivg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C44380A94B;
	Thu, 26 Feb 2026 03:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: fix interrupt coalescing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177207602178.1018003.6114992445042344713.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 03:20:21 +0000
References: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
In-Reply-To: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_192018_409248_0E984AED 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, 24 Feb 2026 09:01:13 +0000 you wrote:
> Hi,
> 
> While cleaning up the descriptor handling, I noticed that the accounting
> of transmit "packets" for interrupt coalescing was buggy in that it
> takes the difference of the two indexes into the circular list of
> transmit discriptors and merely subtracts one from the other without
> regard for the indexes wrapping.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: use circ_buf helpers for descriptors
    https://git.kernel.org/netdev/net-next/c/819101c3c158
  - [net-next,v2,2/2] net: stmmac: fix transmit interrupt coalescing
    https://git.kernel.org/netdev/net-next/c/dd53a0e85969

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



