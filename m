Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E3F99C81
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 19:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kGEx+pOJo+o9N2lIQM4Ucna8+1jei3bmdPtmEyy1xU=; b=KrBBzHIKwSLyRa0YHbkYeROgvU
	7jwfqLcwD4DP/25IYpGcblvPJS0BHno0J51bPldN3zjLBqWKbfqu3/CPzhvvVBlKWugLcl6H5sVFW
	t7L3+D7Bkk33LlPHqqwTdl0qPp3xpJrNkJQKCy5XhxML0yGLAs/hdIuWn3kf4/xluS5LCFxpa5ngx
	49ANmwJ7G1aDsy1JiwSYsMA0s2+TmTWG07Wy7RlNlWjbrn8Lfn25sR7f6Kvb+7Cb3eAxrs3QtAShC
	bowW5eQH/P6ke5tmPX4sfJEe67nGkO+gza1S31e29x/JmhZhwsKsusQQnERxo5cPVsyRzrssErpzU
	67LilQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBDs-00000005AXX-1PhM;
	Sat, 18 Apr 2026 19:20:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBDp-00000005AXA-37wJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 19:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A10843E6F;
	Sat, 18 Apr 2026 19:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4EAC19424;
	Sat, 18 Apr 2026 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776540045;
	bh=s5SdtgrqQaWGvxyOocfvVTmGIyntRJLtgQ7WiZdv5dA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KR42lGXBR2U6rgtVc+mVv2nfkFkQqXVvjj6lIs3eeP7BN6+pjMTpZoG2xmm4O2NxI
	 bCecK9lqwrDGr7x2UDoHNqhVZWziKmWUFuJXl+1wLTnEOr7rhdPErL7ND0EqBssiTE
	 QtUNdnZJJWaJoeVco4whegzjlHJ2SH7rfmdlNrZ9iqKSjTFiE7FjzRgXqC0zC3RDDH
	 uFMJDxFLJTRhtD3tJ6QkRQPMjL0qIdJbHEAes2uoHywvFt0ebdxhFn/XFl+7zVTLhc
	 V3JGnF31gHB4Bp3s+j1Ms6KOyfY0DiYlJxcCAHkLPSPYagoOCLoAK39QOFRqUtHv3i
	 Jq7vDs6YOxTag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA055380CEDD;
	Sat, 18 Apr 2026 19:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net,v3 1/1] net: stmmac: Update default_an_inband before
 passing value to phylink_config
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177654001129.508728.16812510297262829320.git-patchwork-notify@kernel.org>
Date: Sat, 18 Apr 2026 19:20:11 +0000
References: <20260416102609.7953-1-khai.wen.tan@intel.com>
In-Reply-To: <20260416102609.7953-1-khai.wen.tan@intel.com>
To: KhaiWenTan <khai.wen.tan@intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yoong.siang.song@intel.com, hong.aun.looi@intel.com,
 khai.wen.tan@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_122053_858826_83C4FE05 
X-CRM114-Status: UNSURE (   8.16  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Apr 2026 18:26:09 +0800 you wrote:
> From: KhaiWenTan <khai.wen.tan@linux.intel.com>
> 
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/1] net: stmmac: Update default_an_inband before passing value to phylink_config
    https://git.kernel.org/netdev/net/c/8cff9dbe89d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



