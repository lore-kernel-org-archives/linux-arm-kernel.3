Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363EC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZaMdScOuViKuR5f8yRHEFF6Xafdvr12KHrN2lbVNtY=; b=xf//cL4PrxyONylq7NPWg12paK
	zexrwJ86tSu8ATFYqDE3YvEeY1djhddMcE4+UTkUeL8KehpfmvMbYM6tXaMW4YtfsqnhTY+kuJ/Gs
	mqHAEjFXSVlUTnVqPZ9kZ1brJ1fIf0fGm8/hckfhGj37DJP592QQ22KfK51jvQl2gMGBrooRI6pxe
	WbZXH/6Ssps1DJ2sTdHpoHxzSOZ9YH3g5vzoLP7+fyDbZ2sDBDlct8tvwPROThEM6aE3WNfTPk4E6
	TcJx7K7IZR8B7DnrvG2/ZU2/e8kTgi2/LOdm3h75hBZ3Eu+PkL76OmDVKtOwM/d4n7aFWal1obws0
	01cpYEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyT-00000004jGJ-1Vy4;
	Thu, 27 Aug 2026 19:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyP-00000004jFT-3fbk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 19:41:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE8D7600D4;
	Thu, 27 Aug 2026 19:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32801F000E9;
	Thu, 27 Aug 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787859676;
	bh=KZaMdScOuViKuR5f8yRHEFF6Xafdvr12KHrN2lbVNtY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RNfh1QsecBVNl1WzAUJcgDE2ylUkIrkOMtk/rNxfGqq+CS1HnNWoGuStBLTnax6ZJ
	 9D5m7rrFS8+CzXrHlw+7G5KhLMbHNFmAhLRe3aEhgzbs49cXjeuCkBtDJoU0dfpBUq
	 l3a+kbc2mtAC7oHyRvQZE3K2veus191iqgycw54P/TyNexoLkbcP5UK3kG7AOOxqyA
	 NNjOddBE1FerK1tCVHmmQBBSyrQVxe3zPq7jWxezNZ8WO0P2/f46y7AZw2aSHYO0g3
	 bpbJVlafqXtJyPXG4QSk1Vieg/im1OupyJBVCqGAacZumzX++BEG6sRI2TehR87h/7
	 14wwO9CCeXYOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5694C3809A8D;
	Thu, 27 Aug 2026 19:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/6] net: stmmac: More selftest related fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178785962189.1816627.5526551046496058964.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 19:40:21 +0000
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 hkallweit1@gmail.com, alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, kernel@esmil.dk, minda.chen@starfivetech.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jan.petrous@oss.nxp.com,
 ovidiu.panait.rb@renesas.com, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Aug 2026 16:04:52 +0200 you wrote:
> Hello everyone,
> 
> This series addresses some (but not all) issues found while running the
> ethtool selftest on various stmmac platforms. As a reminder, ethtool
> selftest are run with 'ethtool -t ethX', and for stmmac the goal is to test
> hardware features and bugs from the IP integration in the platform.
> 
> [...]

Here is the summary with links:
  - [net,1/6] net: stmmac: selftests: Check multiple MMC counters
    https://git.kernel.org/netdev/net/c/d29b399150b0
  - [net,2/6] net: stmmac: dwmac1000: Account for the primary MAC address for UC filtering
    https://git.kernel.org/netdev/net/c/9698b6da3714
  - [net,3/6] net: stmmac: dwmac4: Account for the primary MAC address for UC filtering
    https://git.kernel.org/netdev/net/c/82187f42c014
  - [net,4/6] net: stmmac: dwxgmac: Account for the primary MAC address for UC filtering
    https://git.kernel.org/netdev/net/c/2739d6f9a2b8
  - [net,5/6] net: stmmac: selftests: Account for the UC filter list for filtering tests
    https://git.kernel.org/netdev/net/c/cd8c3b2752c6
  - [net,6/6] net: stmmac: selftests: Don't test flow control for small rx fifos
    https://git.kernel.org/netdev/net/c/96e8cb5527ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



