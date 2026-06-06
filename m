Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A9FCD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3bLFsnB5839EFXEZht5YnnLpYejZsji1a+GgQPr6Xs=; b=lXBR33iE2eDOtss4VWGfpaKBdB
	9NfoSJjVos2KFNSBmoswBg3gx7NVxDkMpYURksvK3mBLJngwTFJTb9ikKAhvxyOpgUpXJRrwpmFs5
	z9+M7c8Vno0S2Hmd78XiQTZ4oTLbTkA1hezFdOXyAtE2eXWt0pzGpXDkYyZGhuXaQPFpZJ+RWP7go
	9eNrAg529R4tI4luwR5kWYQPEQCTtxJ6QnFW3o7f2TQYFau3NgOkthUW5i7h8sFlTp2xCHtvYfZf4
	mCwttBjPDHj4gUhgoRuZKvfzR0ijwoXtui4tnGwALKeiSrA3U/jtqpiCPEDx0A5FWpUvJF0j5IKkT
	05FfPo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgdy-00000001OaJ-3DPh;
	Sat, 06 Jun 2026 02:20:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgdx-00000001OaC-2OZ0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 02:20:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 493B2600BB;
	Sat,  6 Jun 2026 02:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A2E1F00893;
	Sat,  6 Jun 2026 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780712412;
	bh=+3bLFsnB5839EFXEZht5YnnLpYejZsji1a+GgQPr6Xs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OEBeRt8vfZhvtrneTFV/QG9l+pY1C1nl9gOMUxhcOBiMOAB+vt1ugZttQAApXmSp9
	 PltSMnKtFDsyfeutOZMAr1Lnf20Ti38wYl4wsNFIafomRr+O0phh/dWOgYwCSk5oNz
	 ABDqPX0ioV0yQ46j90BoJ7D8FTUoyKCOQgxjFP+/GCGelCdK7qTHXQcD1y/3X2ym7N
	 dV7fVA37y0a6Pr4oI8jvvZea5d9sErxCDwpn5XXZLK9VR5m8ADzmeZjqCq43eocsDp
	 SpU9QQgMuf1hDxmBD/7hX1/DnMOMhqwTzc5nXrtzj8G4ck1GRdtiVGfQRf5/+hpKmE
	 IijSmRSY11E/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A783930A9C;
	Sat,  6 Jun 2026 02:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178071241185.3995915.13210125850131582461.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 02:20:11 +0000
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Nazle@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Asmade@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Muhammad Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Thu,  4 Jun 2026 01:30:37 -0700 you wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
> and increment the corresponding ethtool statistics counters. This allows
> users to observe L3/L4 filter hit rates via ethtool -S.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: xgmac: report L3/L4 filter match count in ethtool stats
    https://git.kernel.org/netdev/net-next/c/903db046d557

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



