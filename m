Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8296CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aah23fF+mOOv5wgGxyKr36zpiO4hkn2V4BFOb43mSb4=; b=RSjqd9zC835ZUXUMt4GqHvexKB
	p6ln9s4kkqE0P5z4l67tGH+niat2mdP/S9EHo1MqH0sGcsc5yWTBWgEpih0ESFWewQW252H4NYkh3
	Qr9QHXUC7SAcSrtoLPuCt+AGHSvoQTVHazdpvgBcHaTnBw0E6N95AXwzw51MvOrCrPVZFrzSwNq6M
	kKnef3Fc1xH/sfOnQQEp5oAYDpEKKx2ZprGokDEyG506DVmoTD235OBeJ+gnN7mPvVAC4CWIxe256
	akbr1dE83DiHzyS1BQnGkEf8OLBN7JMyERMH2AYahsOkfcuJn/WGPtfW5xfVdS4xESsPd/Q/SPji1
	tgr2jjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVpB-000000004ez-1i2l;
	Thu, 11 Sep 2025 01:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVp8-000000004eD-2fSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB6E944B26;
	Thu, 11 Sep 2025 01:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83677C4CEEB;
	Thu, 11 Sep 2025 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757553005;
	bh=MVGxfRakQnPxyH3uyjRFiBz07temXygvvaFLoRNylVo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KR8pWo3JR3b3F+aXwXyH2fVJl5W6keyReuBUyj2196B0cEit46XXGgkoJlGkE2EGj
	 qGWFr2glITXyI0/GNojAltsc5NXDcJwHcOjp8EM1MjWCd7cLU93sHbA84wIyLGMDCX
	 0QJRw3BIFaT73mgaGtehKMzLj/BRCw4VAlHCUSTuRNnmbhTUSq3wele7+ogUGXiJem
	 8TR+9z9YME5oaLBYfd7zfw3jVx2rBZxSvsmjLhfAkbmnfeQkmaPN+yQtW9Ybjwth0o
	 9vUCt+HT5fKQ37eSJ4giiOuxpow5/hyBJQJjh5K9FZ+k5Eno0kebMcalRcxqVP39wu
	 aXgpEcOe7svng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 85E48383BF69;
	Thu, 11 Sep 2025 01:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: use PHY WoL
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175755300850.1617124.3396751776402491049.git-patchwork-notify@kernel.org>
Date: Thu, 11 Sep 2025 01:10:08 +0000
References: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_181006_698970_8978CEE1 
X-CRM114-Status: GOOD (  11.82  )
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

On Tue, 09 Sep 2025 16:54:15 +0100 you wrote:
> Mark Tegra platforms to use PHY's wake-on-Lan capabilities rather than
> the stmmac wake-on-Lan.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> This is the last patch that is needed to WoL on the Jetson Xavier NX
> to be functional - the only patch that hasn't been through netdev
> is the DT patch that's being merged through a different route. Once
> all patches come together (in other words, at the next -rc1), then
> WoL will be functional on this platform.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: use PHY WoL
    https://git.kernel.org/netdev/net-next/c/724b22d38a83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



