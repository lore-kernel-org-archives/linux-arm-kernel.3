Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE34CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 00:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJfI2AtsgPukABcfv4WhnnjIU2SAuDCvXf50tBWZ0iU=; b=A4ACjgsrjXqBcgBUKN80yCDrjm
	t0pERoCp3SyDArL8jGeoo0k7taQWr9Xf/wqpAVITIgfQFkpp8oGn2VAw/Toxmj9XQNK24nl+o90nb
	GWHuZfoBcBrPbVfgcWPH53FvYXbPXVxk97EhnIbqoYml3EvypXSjJKkwq/Km9f4gCTaZmt2RvWNpO
	BUmiHDhp3zixnn4UnOxXtSzprfIXeygvQSiRTbuAGr0QyxvCZFj6/9Mliu2v1cbEL4sMx/8+s4lMC
	rlJunJBSjIobjdN4FpSnLbqm8wJ+7ph+8x/urTjAV8f+v9XFRu+rrVAEeeJeElwfblL3h3a4ptPAr
	ta0TBx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGYr-00000003I5C-3y0E;
	Thu, 30 Oct 2025 00:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGYq-00000003I54-40IK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 00:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 088DD6033C;
	Thu, 30 Oct 2025 00:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B48C4CEF7;
	Thu, 30 Oct 2025 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761784239;
	bh=tQIruejwpKTnBaTSE8KgQ617sg7pjgA/bUfxzMS/3Mc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K8kd55vjC1NG01Kdeh4jGuJmG/xyIbES63tC9TUeBMt2tYQTLzYa6MU4RACwGJ5mH
	 7p6TaqzbMBhEG7JjyKuKkrYnU2kdwhKedaSUD644XDpbHMwMDX2yMndmJIiQr4BQBO
	 JgwtKIRdypeKmf3V//RP/Jr+HxdVtDiyGfuxyg9dtoXLDhklqjAlkJegHPzPFeeZmc
	 izDHIMn/QUtwD36ei0NengCxMAsJcO+T40YnfHTQ+JLIWVsBpxH9h43N9Vo16Wt7So
	 AKQO6crKRES5HRK+wvofPWa2+bzZ30Q36TU9EU5WJpC6++NAGOkwd6cYPNuvzcwNcX
	 WWlf6AFEBWosw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1953A55EC7;
	Thu, 30 Oct 2025 00:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/8] net: stmmac: hwif.c cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178421675.3262354.14278133392680967130.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 00:30:16 +0000
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, richardcochran@gmail.com
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

On Wed, 29 Oct 2025 00:01:25 +0000 you wrote:
> Hi,
> 
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: stmmac: move version handling into own function
    https://git.kernel.org/netdev/net-next/c/fc18b6e98cce
  - [net-next,v3,2/8] net: stmmac: simplify stmmac_get_version()
    https://git.kernel.org/netdev/net-next/c/f49838f77cf6
  - [net-next,v3,3/8] net: stmmac: consolidate version reading and validation
    https://git.kernel.org/netdev/net-next/c/c36b97e4ca77
  - [net-next,v3,4/8] net: stmmac: move stmmac_get_*id() into stmmac_get_version()
    https://git.kernel.org/netdev/net-next/c/7b2e41fff76f
  - [net-next,v3,5/8] net: stmmac: use FIELD_GET() for version register
    https://git.kernel.org/netdev/net-next/c/b2fe9e29b5f6
  - [net-next,v3,6/8] net: stmmac: provide function to lookup hwif
    https://git.kernel.org/netdev/net-next/c/7b510ea8e58e
  - [net-next,v3,7/8] net: stmmac: use != rather than ^ for comparing dev_id
    https://git.kernel.org/netdev/net-next/c/f9326b139b4c
  - [net-next,v3,8/8] net: stmmac: reorganise stmmac_hwif_init()
    https://git.kernel.org/netdev/net-next/c/6436f408eb21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



