Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415F2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 22:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0KAFTucrnvIGzwH0rAl+g19xN/WDVnOkjYVo4UolIc=; b=uS1pUEOlUo3ZgtzqrF1e4K/3ZM
	nihk48u9DqtsflClm3Bn9MMBgp6rWkQw1W6AO6lwqAgjawHljsYYguQNfbvdSfjV5CwDVfCOakFNj
	wdNnyHxfPh/315kT+ttXyNyFZrOdzlYWJjCvWWsJP0kMj7ShocPYp3BuefumE/khPa/PGuATLhYOX
	aLgwG8OLhXtI1j/qvQ9O03mnpZEZwE/3Ifo3HDOrDe67RXWrHaQhC330ouorMDoytOoknBzjkIXt0
	d+AMRLVjyc0TvJjXCmdW4PazX7KHQKoxMBZEBJZp8bOMjEEiZsGykeWttNHTpz/S+h2IHsbctk9hp
	te89t2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNne-0000000ENLs-0ENg;
	Thu, 19 Jun 2025 22:32:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNlQ-0000000ENFb-0ZZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 22:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57A60A52637;
	Thu, 19 Jun 2025 22:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B6DC4CEEA;
	Thu, 19 Jun 2025 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750372183;
	bh=MwFEIjokl9M/QFuYv5v20kA6dUf/0XczzCLl9aA4Z1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eIBDh/ku7vb+pN8M07gOWUtgPTg1Y+zWF220QZTqdKeDkASWSurTjlIXfjg7lbLuB
	 u1wjlrqjmmGI7HXwBhYoyJfVd3MowzLtDrRWw3AE7QOH6v4d0dO8hv4JkACONb2z9V
	 LkZNZUBdvD/xPTA6NRBMmUeLflHsVadQqChcIfsBBLXrap/NYeIyMr1Y3QIB7e4Vgz
	 JMUHiZQNW1+1HrAgue1chXee+IAshfL7iapH3o9A/q/2+4LCWA96SwT6mOiLXJl++b
	 UJVSJCYo8zgLlGGc+LsjOPj8Nid9vTtObLxJujbZO8eKX7mrrw5qG5HCAH8iBsZxr/
	 eVKgCMv7z1oOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C0338111DD;
	Thu, 19 Jun 2025 22:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: loongson1: cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175037221101.1006270.844600930827114048.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:30:11 +0000
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, keguang.zhang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_152944_238564_241E8E32 
X-CRM114-Status: GOOD (  11.70  )
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

On Wed, 18 Jun 2025 11:41:18 +0100 you wrote:
> Hi,
> 
> A couple of patches to cleanup loongson1. First, introducing a match
> data struct to allow the per-match data to be extended beyond the init
> function pointer, and then adding a setup method to allow the resource
> base address to be translated to the MAC index at probe time rather
> than repeatedly in the setup function.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: loongson1: provide match data struct
    https://git.kernel.org/netdev/net-next/c/b1cffac4792b
  - [net-next,2/2] net: stmmac: loongson1: get ls1b resource only once
    https://git.kernel.org/netdev/net-next/c/e3527bf4dc33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



