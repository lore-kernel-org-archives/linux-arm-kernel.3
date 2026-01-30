Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E14FD73EB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl4T9K7yxeOzQF3K7J15j/aPZEwLdeCpMAFY54mXzns=; b=TotfykGM1kIK7rRBWRVJZl1HRW
	0B7gcPdXIZitH2/DVfmnjSrbOijUVDhmae4rz7tHCz1HDGyGmPAYPz6aLtchu46NKcPZ8pZT99Yhr
	WlSWNN4MDyEmrlwXde3rUK/lAOQyL8FASqOUQ6Dxh3CQCvhukx+8EVnprn9vGDNHYF9MGiAP9PHOa
	tE1BtrhZNnFiyVI47fH/tEC1deijQenYOvDtn/zkFZrb53BFP2vPmzW3NWyaPmXwD9SOrsbFkHzz8
	JWtundPbPSw1KW6yBNvF99ro/n/RrVBykTIk3zvuxDaoH+IsXNwMzsr5XafepJ9EETjzQBPITBKTU
	hRa863yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleb5-00000000ueV-0oll;
	Fri, 30 Jan 2026 02:50:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleav-00000000uZQ-00QU;
	Fri, 30 Jan 2026 02:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEBE744534;
	Fri, 30 Jan 2026 02:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A5CC4CEF7;
	Fri, 30 Jan 2026 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741448;
	bh=YnXhxfv/PgSEeYazcWLixzHseoSlG5XpJcXQaxI+Imc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kB0wdIkFjFPhwfMk7mjY2gf3zytLxtNfGxwrsr1ZaZO3MlgQDJ5OMUAGDEWtKl0uX
	 9h7BfLJUTpV1BQVd5vl5a9aw0LTzaETreSpBkKazR9UgM8jwUj1EmOyiJfjM4E9O9g
	 ww81WeRevmvXI5+XRCIfxvN7DLaSbqHpqzTnIc9XKGCDcKcbcHMiJ+CNhnXGQSNoFL
	 uYPTAumpC9rM1G3pj+V5LF2QaBaisbf17MVOFqDmb4wtpeTqAdNk8ScpbuZek3X6JE
	 jL++/0Wl+YETV/1iykFkAuTQS3X7ecwKM+Uwi9iPDXGkMMM0oLF7sHAwvbIb1YO9/A
	 BTvM7tgYSTGHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB5B380CEE0;
	Fri, 30 Jan 2026 02:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/2] net: stmmac: thead: avoid conflicts with
 PHY_INTF_* definitions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176974144135.3149010.17418895035388677174.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:41 +0000
References: <E1vl35b-00000006upH-2zt9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vl35b-00000006upH-2zt9@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, fustini@kernel.org, edumazet@google.com,
 wefu@redhat.com, guoren@kernel.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185049_871505_B0C0D188 
X-CRM114-Status: UNSURE (   8.52  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Jan 2026 10:47:59 +0000 you wrote:
> Avoid conflicts between stmmac PHY_INTF_* and GMAC_INTF_CTRL register
> definitions by replacing the PHY_ prefix with GMAC_.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: avoid conflicts with PHY_INTF_* definitions
    https://git.kernel.org/netdev/net-next/c/88afa0dd655c
  - [net-next,2/2] net: stmmac: report active PHY interface
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



