Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLAiLL79QjyIx+1JLsvUOulmeLRE5ec5oVb06BZTnTU=; b=jYYa67F98Ne3a+jcFbHPPRqJHS
	5XTx18krJAGKo2mHRiZ8BHaO0ivTNjBRM0qKriso+rjAzPsqAOYkpToNS2IekE47xM/XjbOjqNA0P
	OQJknCx8LgSFFA9uooufqxheXr+l4u7n4L/HJR9orpdmFpmAGp8ISQn5WRmUFZU6orTEaBjrLRHJ0
	IiQ5zEA8L4Kqq3TwRFazsplfphxdBFCUdnTLVN8WtKl6udczt5MgXReYaFctTWCiGm9L4YFj5ZMp+
	rJE/VCkljUK0YCj98s6sES+pNbxwd+BMlPTDEWBMs1Iyeu+OrF8wwb+ad0iFtY7iVZCRw0QUg6At8
	PEQ+4Mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYHv-00000005CtR-06Cf;
	Sat, 10 May 2025 00:41:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYFw-00000005Cfo-1pif
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 00:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E380629F6;
	Sat, 10 May 2025 00:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEDBC4CEE4;
	Sat, 10 May 2025 00:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746837593;
	bh=hU5x5nV621PCXb98dd7QNAbrE73+PaQ5xx0FQ9+8knM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A7+jNr0HNwuo15U+Nm15rn6xSLrb4t7GyjtyBFUwopRjXp4IlcaNbkKMFtZvPG6nZ
	 NulpbIMpXB5V1uGCx1zvlZoHGIP/e9UQN+kKWQBLNNlZrypakkjxhLoR6hT8PTmudr
	 1rE/xK6DCE/gFicMObwo6gZp0L9fu+L3eI8JBgJbrXdYdk/IytKRFZOVgcm7oVN+ns
	 0jNCP0VrtQwAH1JngkV+jh4TJIWinoppC9jA0a6q7MilxMZHAYiGzIoJAZeCXTKTuc
	 rgAUzEk+kAOOsuvpvVo8RRfZVEfdkJKWQBGTzxbapLMe67LpwUUXhnJ9/KWaVwvnU2
	 5ipkrFFWiCnlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB4381091A;
	Sat, 10 May 2025 00:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] Refactoring designware VLAN code. 
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174683763150.3852829.17036982288908409763.git-patchwork-notify@kernel.org>
Date: Sat, 10 May 2025 00:40:31 +0000
References: <20250507063812.34000-1-boon.khai.ng@altera.com>
In-Reply-To: <20250507063812.34000-1-boon.khai.ng@altera.com>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, 0x1207@gmail.com, matthew.gerlach@altera.com,
 tien.sung.ang@altera.com, mun.yew.tham@altera.com, rohan.g.thomas@altera.com
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

On Wed,  7 May 2025 14:38:09 +0800 you wrote:
> Refactoring designware VLAN code and introducing support for
> hardware-accelerated VLAN stripping for dwxgmac2 IP,
> the current patch set consists of two key changes:
> 
> 1) Refactoring VLAN Functions:
> The first change involves moving common VLAN-related functions
> of the DesignWare Ethernet MAC into a dedicated file, stmmac_vlan.c.
> This refactoring aims to improve code organization and maintainability
> by centralizing VLAN handling logic.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: stmmac: Refactor VLAN implementation
    https://git.kernel.org/netdev/net-next/c/1d2c7a5fee31
  - [net-next,v5,2/3] net: stmmac: stmmac_vlan: rename VLAN functions and symbol to generic symbol.
    https://git.kernel.org/netdev/net-next/c/f3acaf7364a6
  - [net-next,v5,3/3] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping
    https://git.kernel.org/netdev/net-next/c/534df0c1724b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



