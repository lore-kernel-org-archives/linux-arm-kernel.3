Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F32CA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHCZ4jzwq0SUmQozvYYGYAytoGKzCG0emXp6tqpGgyg=; b=iIcK55MBhQYOCLGpzkHRIkTUZB
	50uXCxbvSevy6BdfGFhT2pL2109lgsO/vBO94v7f3zA5/srY/0XvFsbBtMdTgeee19pPBPE/1nDho
	8zyHVs1oMKrjts6OeRgYazNas02SEqND9Bfwv2R97p5Jc3ojGfvZIR+tNZNY/YX7WWSv20IROISIJ
	fTuD9g/1UtL0TaukS0PW+4yt4E5V+Nxcf/osQ1XeEPmu3UhjgRYUoGTQWezB4xPvt1x4TJbEU/zzw
	hLLVVO8lD8GfbRjIkQhYWa9h1LtmzO3U6vitgf4EK1DMxf+p9QrxYY4cxOFbqG3oRX6AiuuKx9gEl
	4VbzqZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbOn-00000003IRV-0irv;
	Wed, 07 Oct 2026 23:50:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbOl-00000003IRK-0pRE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 23:50:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FB5660136;
	Wed,  7 Oct 2026 23:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066981F000FF;
	Wed,  7 Oct 2026 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791417010;
	bh=FHCZ4jzwq0SUmQozvYYGYAytoGKzCG0emXp6tqpGgyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lz3wT1G8q9z5RJ/SDn2oaMdKQM2Vl5EmX+Qf7Ylp54t23KDdaI4wOAEQV6+v7AS2b
	 dT4W57fzc0vsz5l5NMrWHqVFudXzsZnlU+a9Blxc43+31LlECwRpQvDT8SLeWSgiVB
	 mrKv4uJyKkb3iHmDa0WOS71FeBJTCaBeYm2ZdrutCDJ2kwd01cKcOO7mFGqsKWdpbT
	 1m8r8XL4zRiYC5aJtfIYzd2Kik5POV9wXAkQu5WsRLKqvOoqiYOQ0S3qzFS5YS66C9
	 xq97vHNziboxK4utu2JTwPuPt3TMkahLbwryEuBSrXyNKr0FBq4t05NKLSBBgLZA3b
	 ijaNEy+lRlieA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BC3809A08;
	Wed,  7 Oct 2026 23:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: axienet: do not report TX completions as NAPI
 work
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179141700857.3739009.7908196051581049456.git-patchwork-notify@kernel.org>
Date: Wed, 07 Oct 2026 23:50:08 +0000
References: <20261004065930.1004953-1-maimon.sagi@gmail.com>
In-Reply-To: <20261004065930.1004953-1-maimon.sagi@gmail.com>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 suraj.gupta2@amd.com, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 robert.hancock@calian.com, sean.anderson@linux.dev,
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

On Sun,  4 Oct 2026 09:59:30 +0300 you wrote:
> axienet_tx_poll() reclaims every completed TX descriptor in one pass:
> it passes lp->tx_bd_num to axienet_free_tx_chain() as the descriptor
> limit, and @budget is only used as the napi_consume_skb() bulk-free
> hint.  It then returns the number of packets reclaimed, which is bounded
> by the ring size rather than by the budget, so the poll can report more
> work than it was given.  This was seen after TX completion interrupts
> had not been taken for a while and a full ring was reclaimed at once:
> 
> [...]

Here is the summary with links:
  - [net,v5] net: axienet: do not report TX completions as NAPI work
    https://git.kernel.org/netdev/net-next/c/f9d58127380a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



