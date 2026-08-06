Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9C2C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TydB11UB/GCYIDS8q/suvoTcvc1zyeq7+Pt4k8NwUgw=; b=G3VJWk7FuDa9qKRbotpncT4VJl
	eUjfZhaYnxmO342juzL1yN2UKyOiGPHXP3xw+rUwY14XhMwGHb5+/ZRpWv0oxAvyUyJyvAi+zuFkv
	y6zT5QRz/BT4w0VIdQBzkY1oErMDRq02M9a7mmfpuoJpOH8t3jHQh5m66INyQgwiT2/XImJ+3mMc2
	VtEmQbAf0/2eB5FDAjD8t66B4YJpfvuVn5eIAOTQZoy8KTrBd2apNdCUnzQ8RjJP2c43vXVdFQ4Gb
	ymBw1Pys7AfA/vtfVHARHnLiJwVZViCz2e2oYtxXmpnKiuVu01m/GoRepGUyxiALWN6T7fX7wX2pi
	gO2eh+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrniz-00000004oR4-0Qh4;
	Thu, 06 Aug 2026 02:20:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrnix-00000004oQI-0MCu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 02:20:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B1BA434F4;
	Thu,  6 Aug 2026 02:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4811F000E9;
	Thu,  6 Aug 2026 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785982846;
	bh=TydB11UB/GCYIDS8q/suvoTcvc1zyeq7+Pt4k8NwUgw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VPFFO2mkSl9nBAMvvzcZEZleV8fvx9CPSZ5MR1nkwiU7kpa+CWv9Baya3Z/U2i6eB
	 IQLZD19pbyCFWydeDEIG7iV3W8JskDy5Ju2cyBI9nuhYDnD6tJ891tg6xo1GdIsNfs
	 jSqOw93gs+LKd26+7jzZyCvgc7anNJqJCVprpx5B5yuxncGvaF2EL6jCuviFQ0hAP1
	 nOuFUQWi8xLGEzvljSDqIaduxjWXhm5gpAaLKeXONUtIFe3cwcrgmM7MKKvSeypRiH
	 jTu85Shl26uKFv25KVSdyWOziTjtkHqlk0sU+lfDlu0cWC7oLo2hXX/P68/jfWBA8D
	 +AWDv98CZj4PQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19940392FFF9;
	Thu,  6 Aug 2026 02:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net RESEND] net: stmmac: raise TX completion interrupt at
 the
 end of an xmit burst
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178598280589.610432.15021421797770719608.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 02:20:05 +0000
References: <20260731194522.55069-1-contact@c127.dev>
In-Reply-To: <20260731194522.55069-1-contact@c127.dev>
To: Johan Alvarado <contact@c127.dev>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, rmk+kernel@armlinux.org.uk, pavel@ucw.cz,
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

On Fri, 31 Jul 2026 14:45:22 -0500 you wrote:
> The TX mitigation logic only sets the Interrupt on Completion bit once
> every tx_coal_frames descriptors (STMMAC_TX_FRAMES = 25), with the
> tx_coal_timer hrtimer (STMMAC_COAL_TX_TIMER = 5000 us) as the only
> fallback. TX skbs are freed exclusively from the TX completion path,
> so any flow that keeps fewer than 25 frames in flight has all of its
> skbs held for up to 5 ms after transmission.
> 
> [...]

Here is the summary with links:
  - [net,RESEND] net: stmmac: raise TX completion interrupt at the end of an xmit burst
    https://git.kernel.org/netdev/net-next/c/d21a374995df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



