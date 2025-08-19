Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D3ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 01:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3BcOjy92xvz3H0V6m8ty5t/YXGWVveJ2w9hBBiM8C4=; b=4Ha0Lfrg5L8bu76tUtp+397ZtZ
	26iTn8WA4UX5IEkyq7JqGpsq01iDdwZsi/zLX9XDyVp2Ya7XjfmY4mamozri1bRjS9yGXEyjSACdw
	y3zb8sDjFXcnG2fgXtqO3iHLVX8H6YpUl9C6T19jXAjINxSxHDOjP8/O09a/pX7NjMhAs4P+Nq9x2
	lc2BJlu3+H6/XPHoIfbzS82/6h2uH0ao9UY0UR8k1++ZycwI0X8hiyIQxD3ChDnbInVZcsjDBNJ/J
	8W7naQzcxcS4DO4WxLMMM+CMVdXBV4iXWp6/4AaDvwI1itVJI0V7Nz1dZuwjMgYlHordkNEVgV5Wg
	NH0AOcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB5c-000000094uE-0urh;
	Tue, 19 Aug 2025 01:24:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB1P-000000094aU-1Pvw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 01:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B26F6111C;
	Tue, 19 Aug 2025 01:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB40C4CEEB;
	Tue, 19 Aug 2025 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755566418;
	bh=imG/COrLI0xVx1ALeCqp04JnSJqQTYTunHsThHcZ3I8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=plD62Ex9l6pV1NHPyPjLMLTkTsUI805/2pd2ujdpQp4+tLCoC83T4ZIPS13/Xnegk
	 RP2s97IkcwdtF55vfrUWWZVVjCDTMi9055n6J7sBDCW8E/jm+AvkTz0vvEbzTzMSCU
	 4Rj6yG1Sess3UqqyWY+q5m0tIZui06wbssfumY0409GHonL8rmFmqV710yebrI6QjW
	 LQ17VAXvqmcc+A2RmJiYO0PeAMxYQLqsA/q4++V9qzCMizU5ZOm3M6IOu+Ht+5vEya
	 eL6pWI8nPRJ6QNyseD6MK5hFwE90/+kQav0CTT5DBke7iWfVGpyDNzqtSZxoOyPjAh
	 ZFgzYRROMNE+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DAC383BF4E;
	Tue, 19 Aug 2025 01:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/7] net: stmmac: EEE and WoL cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175556642825.2971230.1225757977150449764.git-patchwork-notify@kernel.org>
Date: Tue, 19 Aug 2025 01:20:28 +0000
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Fri, 15 Aug 2025 12:32:12 +0100 you wrote:
> Hi,
> 
> This series contains a series of cleanup patches for the EEE and WoL
> code in stmmac, prompted by issues raised during the last three weeks.
> 
> Andrew's r-b's added from the RFC posting.
> 
> [...]

Here is the summary with links:
  - [net-next,1/7] net: stmmac: remove unnecessary checks in ethtool eee ops
    https://git.kernel.org/netdev/net-next/c/6d598e856d10
  - [net-next,2/7] net: stmmac: remove write-only mac->pmt
    https://git.kernel.org/netdev/net-next/c/49b97bc52aff
  - [net-next,3/7] net: stmmac: remove redundant WoL option validation
    https://git.kernel.org/netdev/net-next/c/b181306e5e68
  - [net-next,4/7] net: stmmac: remove unnecessary "stmmac: wakeup enable" print
    https://git.kernel.org/netdev/net-next/c/f17bd297bb83
  - [net-next,5/7] net: stmmac: use core wake IRQ support
    https://git.kernel.org/netdev/net-next/c/d09413dd2577
  - [net-next,6/7] net: stmmac: add helpers to indicate WoL enable status
    https://git.kernel.org/netdev/net-next/c/6a9a6ce96229
  - [net-next,7/7] net: stmmac: explain the phylink_speed_down() call in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/5e5b39aa6f82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



