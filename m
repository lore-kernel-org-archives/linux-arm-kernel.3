Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68A4C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SybaexsRX+Rtd5PWuWwCqi8p8vKvlhdbrWaPr0ItO50=; b=tODhNAzSfH3oForUB5ciQ+zP5u
	Oo5IHGBRVaoe1sMouzfzTx8XlFYMh7e+4XsrHly06JV/jfj0QXj+gXSKF07bft3RDFOZAUBFC7mfp
	JkuuGV88+EJ4oSVfJRXbN16EapFoeBOIEEPOnewhwcnJDZIQdYd21PZ5iLGPfOiYf26ZNRJ5HEaVJ
	8VBq2U4yxU7QSv5JR7cPtOAd8PYnadMFq7ybi4wOibxBCi8yGRlRva7n+7iLwV5DW4DZjC9CsvUbv
	eK8H8PfA/aFt/u2yKN36H6jURte2Le/syWBStJ5/Jk7hLMLFjDQ0FoSlhIE3ptWQLrHV6C855nSXJ
	K85zSV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EHw-0000000BSts-1Khy;
	Thu, 17 Apr 2025 01:43:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EEl-0000000BSSK-0kY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 01:40:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E82045C5573;
	Thu, 17 Apr 2025 01:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E85AC4CEE2;
	Thu, 17 Apr 2025 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744854017;
	bh=UoCuiaGvDBeZSmxO3zSagieMB01Bk1UlqzL8YeuKlqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZGlMmei8xjtxQyO6x4K3hletTYTm9UxXges6gJQHhLUYnbdxutkvIw2eyEy76Reps
	 iAe94TvZSef60IabGBW2/KCK7o07LQ2zeqGLrFO9ToPFvQQyARVjqVGiZ5jfMRwUic
	 hNyd7id0u5XLeC9pp8IW+X/FccvQwQ6Rs7P0dXb1DE0BdsfOwFCQX9IsvDfC5Ojdjq
	 q9r3DXaqzHSS6tY9LSjaJm8ycfsyqdnagIC+e4SaGROsleRRRrCgHa73O9pCNeKBNo
	 wJFbA76HTCVUr13N9JLtlW5V8Lawhqo0Id57jkmQNU7xSwHADxO+q5Ly7idtT+y/YR
	 8BcEYKP6h3GDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD203822D5A;
	Thu, 17 Apr 2025 01:40:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: sti cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485405548.3559972.7306929702229052794.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:40:55 +0000
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_184019_281982_58239637 
X-CRM114-Status: UNSURE (   9.86  )
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

On Tue, 15 Apr 2025 17:42:39 +0100 you wrote:
> Clean up the STI platform glue code.
> 
> - IS_PHY_IF_MODE_RGMII() is just a duplicate for
>   phy_interface_mode_is_rgmii(), so use the generic version that we
>   already have.
> 
> - add init/exit functions that call clk_prepare_enable(),
>   sti_dwmac_set_mode() and clk_disable_unprepare() as appropriate,
>   converting to devm_stmmac_pltfr_probe().
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: sti: use phy_interface_mode_is_rgmii()
    https://git.kernel.org/netdev/net-next/c/72d02a9f9410
  - [net-next,2/3] net: stmmac: sti: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/403068c6c9c2
  - [net-next,3/3] net: stmmac: sti: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/b3334f9f708c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



