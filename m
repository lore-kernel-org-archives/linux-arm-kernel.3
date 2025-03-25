Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85C3C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPTgPbLOY+aSWptN4fnzef1nyYQQ172UgP4OAepWjo8=; b=GxKVU90kL6Bkbo+zHgO0fOUJax
	nMGp7VrE4N5WBNam2clro1+CF35iRG6Kexs25sMo8MEM2bLJOS1IRr8BJqC7MbeTdPMYYzI1zlUYn
	cAWyTDYL2iAp8EJqcIP15W3gO5dQajTm8jkLNrwjRKncUJOVh3O++CLc/yw5Z4bW4lIGfqP/lQZQU
	Ck3ZQtTaIdA4vA75ZYpKI89ZAau/+e33pwvYEj4JuWSNJ2pyDJalYCX5BVWQ4YbUT3FFrxs7VXiqf
	ILvpFRqCEEtW+o3WEPyki6qLCbuiGzWLN0uo79aVK126CPHj+kZFyUldCa2lTtuQjCqZPhO0k17OO
	SkvwGC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5zc-00000006J4D-2aCk;
	Tue, 25 Mar 2025 15:15:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5un-00000006IPw-2vI6;
	Tue, 25 Mar 2025 15:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D34986159D;
	Tue, 25 Mar 2025 15:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB9EC4CEE4;
	Tue, 25 Mar 2025 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915404;
	bh=rM2cEQEVYKda9LgagA18a6qU64i4bQNXa6hgu74L26A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qw5sPzUVhPHUW9fD/il87+6z83Jw4hwaJrAGTBy9CUiqw3koPQWc9H/VQKqDTpEBV
	 lXc88fT5IhlMVkV+F0G/kg8fb83Tpq931IlK+GqHe/rEujg345ZUB7aok1aGXWMvuu
	 xIcn8DgX/oczkCxpSFxf7KsqehTQt6JdYIbjrHhTZpqi8xMsTkD+m1N0AX8d7CvoCp
	 JZqSVQuFj65qOGbT/kOqgpeM0+ddZTzn1kryyBXmf3yaWWBMFNcWIBMEIDUpNn2B7I
	 d0NwG3K9seJJEMRpMlunFvX3Kh/BWShA1U3y70fqWV+S7aBwKfecwr7/Pv5IkGho+h
	 SMrIfjj19viBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34F0D380CFE7;
	Tue, 25 Mar 2025 15:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: dwmac-rk: Add GMAC support for
 RK3528
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174291544076.609648.8594782943472190694.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 15:10:40 +0000
References: <20250319214415.3086027-1-jonas@kwiboo.se>
In-Reply-To: <20250319214415.3086027-1-jonas@kwiboo.se>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, david.wu@rock-chips.com,
 ziyao@disroot.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Wed, 19 Mar 2025 21:44:04 +0000 you wrote:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
> 
> This series add initial support for the Ethernet controllers found in
> RK3528 and initial support to power up/down the integrated PHY.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] dt-bindings: net: rockchip-dwmac: Add compatible string for RK3528
    https://git.kernel.org/netdev/net-next/c/1b22f686f199
  - [net-next,v3,2/5] net: stmmac: dwmac-rk: Add GMAC support for RK3528
    https://git.kernel.org/netdev/net-next/c/1725f0eb37d6
  - [net-next,v3,3/5] net: stmmac: dwmac-rk: Move integrated_phy_powerup/down functions
    https://git.kernel.org/netdev/net-next/c/0bed91f2b183
  - [net-next,v3,4/5] net: stmmac: dwmac-rk: Add integrated_phy_powerdown operation
    https://git.kernel.org/netdev/net-next/c/32c7bc0747bb
  - [net-next,v3,5/5] net: stmmac: dwmac-rk: Add initial support for RK3528 integrated PHY
    https://git.kernel.org/netdev/net-next/c/83e7b35c7879

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



