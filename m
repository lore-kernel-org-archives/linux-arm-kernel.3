Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D88C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 00:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikesVMyU8GIDPp0PUGYx0cWmJ5xN4U6c26tRvP0TWKA=; b=S0pkvcMOPJ173POIOrf/7qKI23
	rxzP5CD29otqE1VePQliD0FacjzHjaA2qzTT83QkWpSge+vgjxPdDhodqv0h99OrCKaROJpELHe5e
	Sk2Mnpq/z1vC0fJjaWJlpwsXwssEOXgSnlpKudPW9jUZCOkJO9xQsQQ32MI4XmrxtCRqSMEmu4x25
	CYonKathtqiAK1uk4SVwAUqfAh9BMYtJ7QBHdp1/Tn9geJQE0u2TcGJal3UftWoEGDmBwItbYYwU0
	Htp+up+R0TkU2Q6ZdjiWN65rGFnR0JDkMvTgImgDTj3ikP3UsJW6VzYh4I+NCyJPxLTtOMPt0uP/M
	mc1tEsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3Mp-00000000lDO-1lz3;
	Tue, 04 Aug 2026 00:50:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3Mo-00000000lDG-29AL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 00:50:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D303B405B2;
	Tue,  4 Aug 2026 00:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C6C1F000E9;
	Tue,  4 Aug 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785804649;
	bh=ikesVMyU8GIDPp0PUGYx0cWmJ5xN4U6c26tRvP0TWKA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cRiHyw1DRr8KtiYWWb1oOq5Q74/VYv5FLnzLlSjNwT2UM/M7NejIORXZM2jaKLSBF
	 VtmtYKHyKgM+gmrguISlg+u3ImxpuYvhM61t44Ys6Zd0cWOTvI4kkCGinQq2Wak7ms
	 onfUoQmC3X9TqTrr2ds1qM0mn+rPEHIGJZN4YHh5JjoIfDt/xKI1N8qg+WaLfKLYz8
	 5EUkCsMY2FX7Q2/8lfJKQe2pjm7N0P4UfarRug1cQe7OVFt2sTG3pUf7pjXb21ZtA7
	 hDPRE53nTYWd0gHQkW/QB35dmykZnUh5+5VuO6l3VQ53dFbsf9Xny4CoULq0kWL69r
	 sFuvvUafOZl1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB33924467;
	Tue,  4 Aug 2026 00:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: only use MAC loopback for
 selftests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178580461039.2897167.3732640516841415246.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 00:50:10 +0000
References: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, o.rempel@pengutronix.de, zxyan0222@gmail.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Jul 2026 17:57:25 +0200 you wrote:
> stmmac selftests currently use PHY loopback when a PHY is attached, and
> fallback to MAC loopback otherwise. PHY loopback however isn't ideal nor
> necessary for the tests we are running, that only stress the internal
> stmmac features.
> 
> Some PHYs bring the carrier state down when in loopback mode, which will
> prevent any packet transmission even for ourselves, making selftests
> fail for non-stmmac related reasons.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: Don't use PHY loopback for selftests
    https://git.kernel.org/netdev/net-next/c/1528af830077
  - [net-next,2/2] net: stmmac: Don't rely on the PHY for flow-control testing
    https://git.kernel.org/netdev/net-next/c/48806dbee0c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



