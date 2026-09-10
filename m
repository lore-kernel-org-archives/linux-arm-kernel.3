Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeGR29QlguE5S6672UQs1iNNz/omuVwEQS0a1AuP0ro=; b=SMF/TzxyqKs2BDavJQGxYdT7GP
	lULLkRxp9lHrn76i92QH4aG/fhWFRxWqagxlab3nlDLzXIUgppL0kfa5oTKGFg+X48ydldn+t89iB
	rUk1TngUodSsfGLn6m06R5zWX2CLyLXR3pWiq0PXFFg3pGaO3W1gc5dek14z6HrXgYdLwAxZMJCdc
	Ani78AcnNiBRzHDAZKq1Sg2eLeeNjrWkkfiR4Dft9EffeXRoOIzjVpiS94bafAnBT79ogeSq5yjCI
	u5DKkFzC5Iy6WKM4b38VFUsa61YVh21LEQEoBfYRaRMD8bOr/xgG5nrYlL/rueA2DF9AozI1VxXBP
	gjdAufGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d9Q-0000000EEqP-2jEe;
	Thu, 10 Sep 2026 11:41:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d9P-0000000EEq3-3BMp;
	Thu, 10 Sep 2026 11:41:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30FDE419B8;
	Thu, 10 Sep 2026 11:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125131F00893;
	Thu, 10 Sep 2026 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789040467;
	bh=DeGR29QlguE5S6672UQs1iNNz/omuVwEQS0a1AuP0ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q+OrbAjNSXS69kLu7KxVfyL/qqSP2DU2RcajzTEaPC6mZp5xAgpWLz1DYvjdA85x4
	 +LrMq1+C9Su34aX0n9RbYgH3P/sd++76kAljR08YCDtlPHTjCi5l8vqRh6iZPLbR5D
	 BGABrbyATxWkAWd+RkJFGOA6tifIkX83hk3WVei1JeMoMTb0+1zfG7xP+M091at1yy
	 Dl/g1R1DRGC+m+BLE9ev+4FNVeAu43nxecmosw1zYWN1ErszZN8iylPoa0EgzHTKM0
	 l43FdpiAajGB7N3FPHjwBCiZ3s0evwx5nMm6yPwwT5mvWVuXdGoSOdQSqJdUU1sk4B
	 9rSibZxFhu13w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A8A380CFEC;
	Thu, 10 Sep 2026 11:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5 0/2] net: restore EEE on MediaTek switches and SoC
 MACs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178904040463.1380647.8328651784613064419.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 11:40:04 +0000
References: <20260903123644.23800-1-f@lex.la>
In-Reply-To: <20260903123644.23800-1-f@lex.la>
To: Aleksei Sviridkin <f@lex.la>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, nbd@nbd.name, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux@armlinux.org.uk, dqfext@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  3 Sep 2026 12:36:42 +0000 you wrote:
> Both drivers fill in phylink_config.lpi_capabilities and
> lpi_timer_default but never lpi_interfaces. phylink treats a MAC as
> supporting managed EEE only when the tx_lpi methods are implemented and
> BOTH bitmaps are non-empty, which phylink_create() decides once and for
> all, so EEE has been off on every mt753x port and on every mtk_eth_soc
> MAC that uses mtk_phylink_ops since the two commits named in the
> Fixes: tags. Because the tx_lpi methods ARE implemented, phylink takes
> the other branch and calls phy_disable_eee(), which fills
> eee_disabled_modes - so userspace cannot enable EEE either.
> 
> [...]

Here is the summary with links:
  - [net,v5,1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
    https://git.kernel.org/netdev/net/c/3c18e3c9a54e
  - [net,v5,2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
    https://git.kernel.org/netdev/net/c/d876c9cb2d16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



