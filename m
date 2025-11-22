Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761FBCFC516
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 02:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ef1TtzA8WVza3rwyZiadfpAeBx2N0tENsQFGuE+Wss=; b=f+caNO4ydXKM8+lwYBgpYuX+ge
	RpAC8w6wJLHn7AvCutikTexUuQV7wz1CLG+ceK9+XQBsPRRXriPhHBVl+/eBtuJ7XIo+I5HELx7t8
	l2RYvI0zIQTCSyTr9L28hKRPzFsZ9T09eOSU2MPHbh+NyZ4Es4ikY78AUTMsuwWwmCS26PCu8bmZ3
	szPi4GIDCenmWITR6Va1fNo9VKb5wNlHTZJtfNZKqf/P5mcSGtnWU3oVXlXL9jX5G2iTxVyj8D7hs
	ZKdlCMQJW89L7+u8D5cTriSaL2YWU3sjgeDzckgKesaOkIh6YuKHWZawzLOvRHl6wYViXH2hVjhBw
	B893eXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMdFH-00000009Bsi-11L8;
	Sat, 22 Nov 2025 02:21:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMdFF-00000009BsV-3mXC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 02:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 272BE600B0;
	Sat, 22 Nov 2025 02:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2420C4CEF1;
	Sat, 22 Nov 2025 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763778051;
	bh=N/GqJc5kp4W33XuSJpLT2jBZ4MHlInurgmhHBSKSiAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vDn0ls5eNfi3PLIKOS56zjr42iSAO/TrxI3WymCFuEAFPjhcCZ3eA0VS8kcZpg64c
	 Cs7v3QTZLXc73kfsOBaVBjuvB/MU/SMYC/X6FIJtWaYN4A2EMnxwj9c5UmmuEfGBW6
	 nx4jfhsQwsC6+c7FUSn5nupGkj4Y1Bf+pE2E8+Q9446/SfGM2cHGwt3eiwPeFzA4cZ
	 MIz6LTQ5gQLHZgJ+I7I5rNvKjsOXSWnDz8GVu+9IIDXcH4gRhhyM4moZ2YjdokbH+W
	 4DIW9rDvbmpbmUlbAgkfiyvOaMftePQ/eRq8wyzaM7Jw+yUiESHieKRACIlNf86e8Y
	 +EW5qOFPd+GmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7112F3A78B25;
	Sat, 22 Nov 2025 02:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos: "rgmii"
 accessor
 cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176377801599.2657243.16800744775068465298.git-patchwork-notify@kernel.org>
Date: Sat, 22 Nov 2025 02:20:15 +0000
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
In-Reply-To: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
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

On Thu, 20 Nov 2025 11:24:59 +0000 you wrote:
> This series cleans up the "rgmii" accessors in qcom-ethqos.
> 
> readl() and writel() return and take a u32 for the value. Rather than
> implicitly casting this to an int, keep it as a u32.
> 
> Add set/clear functions to reduce the code and make it easier to read.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: qcom-ethqos: use u32 for rgmii read/write/update
    https://git.kernel.org/netdev/net-next/c/f54bbd390f5f
  - [net-next,v2,2/3] net: stmmac: qcom-ethqos: add rgmii set/clear functions
    https://git.kernel.org/netdev/net-next/c/819212185ae5
  - [net-next,v2,3/3] net: stmmac: qcom-ethqos: use read_poll_timeout_atomic()
    https://git.kernel.org/netdev/net-next/c/9b60ba512c7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



