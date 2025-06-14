Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CC6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 01:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCyaW2TvD+N3BgTJEN0+mDjYS35P/9sn4q7gdt0s5MI=; b=HW4u/bQGcngdbzwDjiQ+D/U6Ov
	DSCKvgxbJN0R5epyV5bcXznq1O1PUX06vSAJEsZ86T4qf5XYsyJUiKSXBQFnpNEKUxozRHi/IdCZ2
	R4G1ZO4vwwIXasfMWJ0sijl09i4TeTMwIqJJLM0Ul+wmNn9W2qCu5akGFkAeRE7oVxAdSQC0933vT
	pBlABh70G/GdMU16XOtyT8R7teQC5GqBbp7hZEycXEZHb2u4t4gGmGowB7JFx5bF18c7Q4VuKSlqb
	yXubSIiz86CDUrfUMqDMafVDWu6GfO3ASyzDxwYonqdtSk814wnOmWTHVisuNkT9eZOdFGAFDqA5E
	6ArpJoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFl2-00000000TN1-22Og;
	Sat, 14 Jun 2025 01:32:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFis-00000000T9d-0DU3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 01:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 208A14AB3B;
	Sat, 14 Jun 2025 01:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8697C4CEE3;
	Sat, 14 Jun 2025 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864616;
	bh=IpEiRYgc9LKV8Z1ziQUlfI4E1VV+WgxlOCcgZoh2KBU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FgVuJ7n2LYhSWOVu/G6MkUV9r2o2F9qZzsaF4iw3FsgyGkqtiNaqI+2nEBDLibZvX
	 DZEP7l2xkroSQauSLSJCYnys0yUR4V4JRCbSDryZo23wQfB+QmHcS5+BdSf0yiNpWe
	 E9sJWrIXCQA+1losiRK0nyqK/wbLD/s3EChAC+uU5RlLjgBObgJilcfjXFkBtUnKWt
	 DMYMqNOE22f5MC3+vP+Ux08CKRm6gL/02oyMGLbcIjgtkpY1EdtnNcLY37Mi7ZXhfG
	 EC2ZolxZ4IoDd0F4JdEkvUEiicnSvLuC0uvW1lXCMCz6v5SblnIS2sJT03e4O/V1l6
	 hnUTkU8xwkrHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE4F380AAD0;
	Sat, 14 Jun 2025 01:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: improve .set_clk_tx_rate() method
 error
 message
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174986464550.950968.6157080480528979172.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 01:30:45 +0000
References: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_183018_107319_202005C8 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, 12 Jun 2025 16:21:17 +0100 you wrote:
> Improve the .set_clk_tx_rate() method error message to include the
> PHY interface mode along with the speed, which will be helpful to
> the RK implementations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: improve .set_clk_tx_rate() method error message
    https://git.kernel.org/netdev/net-next/c/bd1d76a6f18f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



