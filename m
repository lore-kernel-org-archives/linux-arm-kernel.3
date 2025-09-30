Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50324CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMbWnppujNTvQEdW4MtjQDxY7MQSHtpybjA/3/1b6F4=; b=dLiQTs+8bc43w+CFREok87L7sK
	26QedrkHPkbcMwN46AmXS8INYrdib/Trq7k4Avy/f2lCwgvn2bmScKLlk3gg3zA3Jupz/DzA6hA0V
	j8aZlM1IojVzLji8rSozms5O4nv6yFaFfOtrKltUvT2cD0R/ED9FbbORHVdtEqqwkw/HcmqF1PslM
	W8cXZKZf5lAYMIir9JgKsH6/h5ppsIaNcTc+1O07y3VLlMe96SfymzMpbz6YLg2ELBaT97LtuNGbD
	3/jjRE9WKyok0G5YSX5EM63Spwaq3joG2CI7MHpTPRNFLobJyH4pD3rj53Qyxo8Qx4R/SIoqTYS1R
	ebSm5FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PfK-00000003qUh-1zoT;
	Tue, 30 Sep 2025 02:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PfI-00000003qTw-0UmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF11248880;
	Tue, 30 Sep 2025 02:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A363C4CEF4;
	Tue, 30 Sep 2025 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759197627;
	bh=r2SHYFrcUFIZfSRfIG042SXPAw55FPb1NYT4hakUlZU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OCNRapFBl9LNEBFYco2lY/ZCai5OeRtqIU+CdV9q7+q/U57RrnWtTQzZe0k5/iLvK
	 JthHBiZkjxrvpTGoiM9UelfcowEW9vI6xVApYbPVm1fHmWYaSwfIQK5nXP7to+0rIB
	 CcQA3LmSMKer+ySmMgfeU/TCgbFLMDuGPOKYO+nv9APIoN2yCzGLgkhdFYMxdTp6ux
	 4RbBBEwNL9FS9Noc3xOFfmlVENgsvDCr1P0lmgI0fH8rUHVAJz6WnRKL+9BGslJizS
	 8hv8vSmvBN66jGIrrcclYa1aXIbYGeQue/bEWFwuejdp62V6VU3caXCCPeo5hU7PA4
	 yjz2fLN2wpBlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3412239D0C1A;
	Tue, 30 Sep 2025 02:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove stmmac_hw_setup() excess
 documentation parameter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919762074.1786573.3483201535680526845.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 02:00:20 +0000
References: <E1v38Y7-00000008UCQ-3w27@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1v38Y7-00000008UCQ-3w27@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 0x1207@gmail.com, kuba@kernel.org, hayashi.kunihiko@socionext.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, richardcochran@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_190028_173370_388A190D 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Mon, 29 Sep 2025 08:43:55 +0100 you wrote:
> The kernel build bot reports:
> 
> Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3438 Excess function parameter 'ptp_register' description in 'stmmac_hw_setup'
> 
> Fix it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 98d8ea566b85 ("net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller")
> Closes: https://lore.kernel.org/oe-kbuild-all/202509290927.svDd6xuw-lkp@intel.com/
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove stmmac_hw_setup() excess documentation parameter
    https://git.kernel.org/netdev/net-next/c/6d3728d424a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



