Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8D4C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJh2Y6OdJYtieJbzFOlChfIGiWxVwx2cLiWVoVq+9Sg=; b=fDG2lHnu9+sD0hINj5BbuEqOPl
	+8kc3tAW29Ad2txugEhtqdP+wXKoT+PR8R+LEJADuOtaoF1cknSHr/8HzIuHzygDY55R4LZoBNgaa
	+gXNOApwFlMdrD6FUpiuTIQ3jPmYeJ9aMxcatLgzXHD4r018znm5xRzo7ZR+Ba14I3AOAMlhdu4T+
	y/8FuguPLHH8xEnUmMONNpQIgTsKlPoY1RP23ylolVCl9k9MBNNYbh6GcZAtN8R5bEANQgIVhA+JS
	QAWK8xo5JQCOOVC5YJMCG+sHl9u1vEZ1hpyBqByQE80wQ/sM3AjHTE61yc2JLJxd1IEUDg4T32qvd
	O7ieubbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5xu-00000006Ins-3Viv;
	Tue, 25 Mar 2025 15:13:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5ul-00000006IOx-2meF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1874243CE3;
	Tue, 25 Mar 2025 15:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FDC4CEE4;
	Tue, 25 Mar 2025 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915403;
	bh=LeTQS4831V5MzsLiMC9LAw9t50lIBowdpyY0TiML4j8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OSv+owgNR70SmVzshxqqtEMPZkBl/rNogjzzKsghyVHlQ28cLSkSU9S/GVwbqpgsq
	 hUMhkGTKbJ4QDckbTjwRefRsG3C+58481bAz4v/iuCcIHMWR6LXkqfwdV2bMHUywZM
	 5DLt3iDXsoGjGGu6GRI6rzgDeRTKkjRiC4ERjnzDbUyP5s7NTWOmL61d847gDli+aI
	 r86gRcsJ0VfBhzqFu4Wmg0kAuLtov8i/nSGY52Odk9mDRowrmnZmS8WfIkJwGDCFY/
	 sngqbstTr1Xy/huJRbp/lTdykx9mm7/aeG7I7zf37Rm5vsjWlXBPNTPtP1KESIqN1y
	 BinaN4QGIvxaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B0FBF380CFE7;
	Tue, 25 Mar 2025 15:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: improve stmmac resume rx clocking
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174291543949.609648.15797575724114490670.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 15:10:39 +0000
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_081003_726635_10C23084 
X-CRM114-Status: GOOD (  13.58  )
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

On Thu, 20 Mar 2025 22:11:06 +0000 you wrote:
> Hi,
> 
> stmmac has had a long history of problems with resuming, illustrated by
> reset failure due to the receive clock not running.
> 
> Several attempts have been attempted over the years to address this
> issue, such as moving phylink_start() (now phylink_resume()) super
> early in stmmac_resume() in commit 90702dcd19c0 ("net: stmmac: fix MAC
> not working when system resume back with WoL a ctive.") However, this
> has the downside that stmmac_mac_link_up() can (and demonstrably is)
> called before or during the driver initialisation in another thread.
> This can cause issues as packets could begin to be queued, and the
> transmit/receive enable bits will be set before any initialisation has
> been done.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: phylink: add phylink_prepare_resume()
    https://git.kernel.org/netdev/net-next/c/367f1854d442
  - [net-next,2/5] net: stmmac: address non-LPI resume failures properly
    https://git.kernel.org/netdev/net-next/c/ef43e5132895
  - [net-next,3/5] net: stmmac: socfpga: remove phy_resume() call
    https://git.kernel.org/netdev/net-next/c/366aeeba7908
  - [net-next,4/5] net: phylink: add functions to block/unblock rx clock stop
    https://git.kernel.org/netdev/net-next/c/ddf4bd3f7384
  - [net-next,5/5] net: stmmac: block PHY RXC clock-stop
    https://git.kernel.org/netdev/net-next/c/dd557266cf5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



