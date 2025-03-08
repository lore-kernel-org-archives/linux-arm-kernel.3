Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 03:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz27tYeiCjFPLI/Ia9JT2BoeelYq/luj9gLhwg4BEdU=; b=jKPkB/M/+gTC0qgGK4MEILV+5+
	hNYkSLCk/FVUtBmFvaEofCQ5XScnKB3ZOmWsKDZcs+lLCkTaeZVZwVsnF9BTBDDWIk+2YYwusB0Kp
	X/7LnPi0U2PZKGakx4b3DTk/dcSAf/Xlla9X5aWB6/oN/ma0IY/FOS2bv4nH/F9MJnbncbHTj63RS
	qp7QCilrnSgSdPoY1z2YOPOp1+Vl6WbvWmPA3kdO1SKs8uY2FdS/UPUROgioNHoen2UvPSZBRLQY1
	jsCld08NpKll0127DNUWKwERCyyTTziS/vXfuXvax6GfJ8lDwzwxDftm+Cui5cTds92If8TezyeBj
	LlbevVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tql7I-0000000G85u-2D1h;
	Sat, 08 Mar 2025 03:44:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tql2t-0000000G7OU-11zS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 03:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE2AC5C66AE;
	Sat,  8 Mar 2025 03:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61973C4CED1;
	Sat,  8 Mar 2025 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741405214;
	bh=/1551EvwFLFRJgDZVyhrnnVaVXrnUUlMvSTMNOwJ2lU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fN9oY017Ls8+PnLtnXlkLqnk6xJ8SIsGVkNRV7njjgGQunqPJ1J3CZshucoLnX7fq
	 34gDS4FJM05Udfnjt83J+sk/d+WcNTHZEa4eEUDcVLpHLRBMb06QIdNB4+ImB3zjDX
	 DulC7OrPKKo7TYefkXHYNY1laYXghgaRJmjQBF5SDfvhL2AOBzXtvj2iwnAGeeSF0l
	 2egyiTsIls2QcjHWcqtVyO5zu/rnP68+jCaioXLrQJmP9W8EibmxD0RVk2diDCOhAj
	 mcHuzyjHAggi1DmnxNe4S4bN0eGw84zo7d5MPm5V7ZtvGhzAGgpbYO+xZDMJfKkb4v
	 TFvhu6ilXUfnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D93380CFFB;
	Sat,  8 Mar 2025 03:40:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove write-only priv->speed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174140524774.2565853.6497124340077503983.git-patchwork-notify@kernel.org>
Date: Sat, 08 Mar 2025 03:40:47 +0000
References: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_194015_344740_65DE65FF 
X-CRM114-Status: UNSURE (   9.15  )
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

On Fri, 07 Mar 2025 00:11:29 +0000 you wrote:
> priv->speed is only ever written to in two locations, but never
> read. Therefore, it serves no useful purpose. Remove this unnecessary
> struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  2 files changed, 4 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: remove write-only priv->speed
    https://git.kernel.org/netdev/net-next/c/64fdb808660d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



