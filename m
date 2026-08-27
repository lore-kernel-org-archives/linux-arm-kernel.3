Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F051DC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UD/WXSEkIW8wMh9gaB0TOOHS2Vrc2AyN517gGWFLcM=; b=Tcyf0xn09Jo9NdshytPglrIcFC
	kw2I8RG7f2xg5ee06FH2HV8Wz0FCji7nWKM+xjK6BZNip7shK+qvalb22Doxwm/5Eh1bHNJ7LDgi3
	pfPVgkrasn70lkxwQl8W6wgK4FwhBBEzM3suPu1EyeWL7kfAFSTgMA5wLP3JiMXLSypXLr5twbVh6
	Xg6T3hVmO4zBpS/lY4R2Ohh59/rxDh9RKQso8CW9Q4I0WIJW4zDTBxffyZ1ib1lljJLEDEUHnQQ99
	C917QIuMOFx25zutpM2bhah3WDckL3ZYpmbBtEI/Tcqo2QJQGsm+BiaBkxxWzyyWo+kk26oLf3wN3
	vjEGhF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXhL-00000003rC2-2MKA;
	Thu, 27 Aug 2026 10:51:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXhI-00000003rBw-3kdi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8888842D79;
	Thu, 27 Aug 2026 10:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FDC1F00A3A;
	Thu, 27 Aug 2026 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787827864;
	bh=5UD/WXSEkIW8wMh9gaB0TOOHS2Vrc2AyN517gGWFLcM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JPvKX0GQrMXP/+9/EKWhqLBqjlTWBE7J5S1z9PgXXUShXOo5piNTW9mKGzZGSi5HQ
	 u2gCNP7qwfTu02xUJ1mFAp3RfZ8qZNbvS6RLpVmFEBqnYmYR9AwuKhSC962HL4e3rQ
	 3fKRzS0XBCz7qikOehu5VI+6UU3U5rLx4gFloALXlv9zkZobbtl7wxqVwJ6Mp7mbGa
	 iT9Ovgffo6AF+t5b0K//m6bwM13TQ1j52SS9g27eVx6khzPSn1c7XNDVHOgkjgNjBp
	 hQm1I7Eg6BM6+i+FVGRgLakAUtJ+tWVNT/ySTpCItu5vp14uTmXtVHANXhcZ6Qz2Ar
	 sTdcxW2MB0fvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5688A3809A19;
	Thu, 27 Aug 2026 10:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: selftests: Pass the IP proto mask in
 the
 TC selftest
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178782780993.1160948.1335335298813579043.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 10:50:09 +0000
References: <20260825211748.360935-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260825211748.360935-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 hkallweit1@gmail.com, alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, andrew@lunn.ch
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 25 Aug 2026 23:17:46 +0200 you wrote:
> The stmmac TC filtering rules have recently gained sanity checks to make
> sure the passed keys and their respective masks are aligned with the HW
> filtering abilities.
> 
> The stmmac selftests failed to pass the mask in the match data for L4
> filtering tests, and are now failing consistently with -EINVAL :
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: selftests: Pass the IP proto mask in the TC selftest
    https://git.kernel.org/netdev/net/c/9a56a27e6002

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



