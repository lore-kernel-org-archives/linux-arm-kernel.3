Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B98CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PpQ5Q+/WxFamVACCCDqheZwVbws4LyRysJ9ya2PJsI=; b=xDmEddxZXHC1EPO6TliJ80X4o8
	sifVCtSxXcyhChrHKsQmkECGFc+Wr6f6okyTJbP3d91QNFH9UCkvcX5QuvZMxHZsEnryQ4U/zrkir
	Xf3JASY1699zvoF3KpGsysxJvSw+jXSW8Byyk3kHNjP7D6xBQ5ST8k2FdC205DGdPXggH91fJk6jP
	9UkmvebF785IN+farGQM8H066thy0C1xO8UbW9Qy7MEmnNkuXIqto+/0UifLbZwzSycvTeS+wD1zM
	Qdo/b4U//LKts+d6tkZ8Y1QK1dw8UxlRqMxqC1pOshiSJHQ40XW8PIfHM8hmTqM38JLxxjYv1eQ9f
	Rsf0vk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVWY-00000001b9n-1rnO;
	Fri, 16 Oct 2026 00:10:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVWX-00000001b9h-08Hy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 00:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F66447A4;
	Fri, 16 Oct 2026 00:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491541F000C4;
	Fri, 16 Oct 2026 00:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792109412;
	bh=6PpQ5Q+/WxFamVACCCDqheZwVbws4LyRysJ9ya2PJsI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BpPWMToIJxGTNSyNy0PntXZyirvyKv8vkL8kZvsuqjk4g+BsfmMsCSs3LzmsNUjHC
	 VP3afeJWfHMnNAAUUMLEd4gd7W9GmP6x89ebLe25KXv5hzotgOUdCr49W1t2p/9Grv
	 sjryzU090Sps2I62emvhkzPlxmaMht6cN9PqQir/ubaYEx30XHikyUpnpdWu9HA1yK
	 Fih8nggUdAlM+LcmHsy/LsiJKaKmOEcc/dBY6Pcsd+m5ZeXAK1HyfEOIvCsunVMuRu
	 +BhG28h1/QOb3MtKxjsucPclVpScUF8MVZI2lRK8n8RyBI4taAqFBTPE8ljYYXnzYF
	 YInwJg9B+MaRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3ABC53808209;
	Fri, 16 Oct 2026 00:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix RX coalesce frames counter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179210941077.4168191.1895696190084335171.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 00:10:10 +0000
References: <20261009111138.320089-1-zhangfeionline@gmail.com>
In-Reply-To: <20261009111138.320089-1-zhangfeionline@gmail.com>
To: Pengfei Zhang <zhangfeionline@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, zhangpengfei16@xiaomi.com, netdev@vger.kernel.org,
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

On Fri,  9 Oct 2026 19:11:37 +0800 you wrote:
> The RX refill path should set the IC bit once every rx_coal_frames
> descriptors and leave the rest to the RX watchdog (RIWT), as done by
> commit d429b66e2ebc ("net: stmmac: Implement RX Coalesce Frames
> setting").
> 
> Since commit 6fa9d691b91a ("net: stmmac: Prevent divide-by-zero") the
> counter is increased by N+1 for each descriptor and then compared
> against N, so it is always reset to 0. With a non-zero rx-frames, IC is
> therefore set on every descriptor and every frame raises an interrupt.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix RX coalesce frames counter
    https://git.kernel.org/netdev/net-next/c/0d20963e0aeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



