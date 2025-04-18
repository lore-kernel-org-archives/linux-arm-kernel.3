Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F195C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 02:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUfulZ9YerLLuMfctIibYgz1agY7vbYGK+8zVCyBLQQ=; b=IFsiAY8XEKJ6zzh6k/tj3DGzrr
	IWrsdm+VsnGED6w263evZm7X3PpHAdemtG9vRP/YaxZpCeo8tHyyRk5V+j8R9TcmOpvp+1MPtjXqX
	KJMC28PTLaYrOOVIzdZ2RbFQwX+424nagn0AN24VMiUtMtddwJzABUScqGD3Hc57BN5psOoOFK5Co
	qBrXNk+RSPXQL9dvFVcvjn8YwwZ8Y2Er2Af9xJ7VAvTGVTs7tEwrKHemAUuGoDLmLTMPJ+DpAmSwI
	R0eJlW0ns9OKPLYJNNNRsdxc21pMnkw/R4+NvTqGMa/MXlEsxpfC8oz81w4xaEUEW0vpXl7vJKOYf
	lLYpqVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bCv-0000000EqTP-1z1E;
	Fri, 18 Apr 2025 02:11:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bB3-0000000EqC3-2HAW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 02:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE7315C54AC;
	Fri, 18 Apr 2025 02:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6481FC4CEE4;
	Fri, 18 Apr 2025 02:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744942200;
	bh=DojIOl1pVFu1mQqpy1zqyKE8kukp8trKGpMnSq9nMOI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cdY7ayAd0nLdploAuNKyMPQR1mPvfrv2vaw+zphf9w5KDt4cM8xoDrhYr6N7Ch6QI
	 ltqKkEr0FJCfjomWwQyRp629dAyrEq81h2JWM/xiRdTEohZmF9fnB8AYDJr5CUB8mZ
	 OdkGLTrgkQW500tyK7uJDdKebeERTpHjRBuRA759cfC5DmNQgelrn66b6oUe9OfG+s
	 A1TDjMScB6bQY6Hao9jPN5QTf/bo8KzkZxy6QWwSJdaG/eqq65wSWEVe614NWWcFou
	 4h9Dpg0wLom6ddUUyfLXFLyEixtA0kOE7MLjcXtx7aj+zeeEdMZRhwulA2KRapQ0j+
	 pn2PfFIKNJIDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF0380AAEB;
	Fri, 18 Apr 2025 02:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: use PHY clock-stop capability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494223824.79616.1586155052116698470.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:38 +0000
References: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, treding@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_191001_628243_DB04C114 
X-CRM114-Status: GOOD (  10.13  )
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

On Wed, 16 Apr 2025 11:09:33 +0100 you wrote:
> Use the PHY clock-stop capability when programming the MAC LPI mode,
> which allows the transmit clock to the PHY to be gated. Tested on the
> Jetson Xavier NX platform.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: use PHY clock-stop capability
    https://git.kernel.org/netdev/net-next/c/7c6cd70ffd0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



