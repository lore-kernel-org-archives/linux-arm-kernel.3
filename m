Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC1FD9E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn+/pw+sqUd40+/Q1+UUANp55rqH4oaZ3ablgaToIAI=; b=w9cNzeM/CqUnYPv5WdJ9eF5fyz
	7Js7oYE4XoUdKQOWYWSBJxwenXF+9WNpgSja76IqjK7ZAsk8WBdmtIAD+CfWmNCpK9jGcoxoxZwer
	tIBNF3l/XHJjIFs8l8gpQfmh2UZdqvfzb82UmLP+iC6gAYfDAvIRW1Ye58t80APiMrHgo1zcsdCX3
	jvby6xlfnsfb3FlrjXTMUQC6Wa60uYFaH0rpi9CnRjtNn3M+A+RiUuamGwtCpBJK/3WI+mCRrZvuM
	nNP62dxBdfVqu3c60xheozj6K41uNmVnWPShTl84oLWig6XhHjsVpKQUvnoEzu7y7JiH3s8jsBo9U
	oZGBrq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmzW-00000007VDO-0k25;
	Fri, 27 Feb 2026 01:50:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmzU-00000007VDI-40fQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 01:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E540600AE;
	Fri, 27 Feb 2026 01:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB567C116C6;
	Fri, 27 Feb 2026 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772157003;
	bh=zEIkP0v+Gt6GKxEd6rrduCgxlWdMNrWP0C7sJGM9NSY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CmbRBvhE8XpF06ktiuTWDldt8B3JOhztqsyrsGnCtopGkKWJbUKXD6rOrA4HWEZZu
	 o2J7w+J8JyjfPG7HU/WZOPjF4vVlAINDAwTdtvBpw8a9fZWHOZ/cAi24HVfvJCscYL
	 i9rUOTanNM6xLJzmbWWQqpMaaIYRQy8GRMxj0G9Qat4QoEI7Fmaoiu1VgphqdTvAsx
	 nZA13RyQ/gGLtC1GanNG9puhtv2e4d4Ws5QjW4l0I46KQn/z18ISjzzaZJuTSnXK4D
	 zcsgF6y+8lwL1cOXHiB9yhL5TZQKo6LmZDfAJtTATIHt7dBAS5DO0ZmPkYRlPIs8yP
	 N96jAjMs4B2ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CA5393109B;
	Fri, 27 Feb 2026 01:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: ptp: limit n_per_out
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177215700779.1935486.3167937625716884926.git-patchwork-notify@kernel.org>
Date: Fri, 27 Feb 2026 01:50:07 +0000
References: <E1vvBhn-0000000ArCg-4C4u@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vvBhn-0000000ArCg-4C4u@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 Jose.Abreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Feb 2026 10:01:19 +0000 you wrote:
> ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
> subsystem uses to validate userspace input, such as the index number
> used in a PTP_CLK_REQ_PEROUT request.
> 
> stmmac_enable() uses this to index the priv->pps array, which is an
> array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
> using priv->dma_cap.pps_out_num, which is a three bit field read from
> hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: ptp: limit n_per_out
    https://git.kernel.org/netdev/net-next/c/5c894879f17c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



