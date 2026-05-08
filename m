Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF82CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 22:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJPqzXi9kgp6gTh6d/fj8QRr4f1e5oBYY10/a7jgYV0=; b=wYMC057C+rp1ytoIh+ru+3p9Jk
	aS9KP3USMHpEsUGW/AlEWuulyHspMuuUZheJGYc0aQWX2RK1K5pY8WdgTVHRVHicYf/Ok64Meyt6n
	5tJWgfGSWy8VdT1GVb6WMe5V54EzN+vECzAyl+eOfrmuYEY9But7NRsLupg1WjxF6Ofrw6Ii+r+Nh
	jXVm0uT+66zAMydBuj1Z1bLPyMwMedXweNNbVn39lRwmjnKPFhfbgJIxE65qtReUkq+MaDpSrUutN
	NVV9ZTh5YMLQJnTec5NAhnEs2S/i36lT9ztpy2lkgE6YlwrkQsN618i96t0lY9Q/pjesboJUr9zSa
	tDCdoM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTsV-00000007f9Z-1dHC;
	Fri, 08 May 2026 22:41:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLTsT-00000007f9N-2QED
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 22:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E520B60582;
	Fri,  8 May 2026 22:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97949C2BCB0;
	Fri,  8 May 2026 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280060;
	bh=FYU/15qOeVBqPbvSjXhyZXA3TJXjTjc4EpIfifg/PwU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Oe6pVYeox2+qqYgcZWf+Q4AN+uhEr35Fs7Q433jPfVEqRe+zwzCWEraBsWad58/Y0
	 BLRjt7e4ACn9T5otwG8i2OLqqksLfrY60HwWQX1NqSihzMiRl6QdvDO2JgIBIqL+GC
	 fcy7BUtFsJ3AGwQw3/nsJo+iaOO6nQApRwrZzJYokn4AHrmQ5Boua4IScDLZT6uDZI
	 daN+Qc7rTOW677wYCzC8kZsm1kulQUR8DBPWtIXIwADqnM9qxHVSqkPB9PKGuHtVLR
	 cN7fkPeupD9gZh/Ud27b5jM3aOfjRTB1iuh9b0kZ3GcIjzU9UdYh27u0T1AMUN7J0c
	 AnWsa2ks9LGzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDCC38119D3;
	Fri,  8 May 2026 22:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: change maintainers for macb Ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177828000904.878212.12911947829161473740.git-patchwork-notify@kernel.org>
Date: Fri, 08 May 2026 22:40:09 +0000
References: <20260507120444.9733-1-nicolas.ferre@microchip.com>
In-Reply-To: <20260507120444.9733-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com,
 claudiu.beznea@tuxon.dev, netdev@vger.kernel.org,
 alexandre.belloni@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 7 May 2026 14:04:44 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> I would like to hand over the macb maintenance to Théo, as I'm unable to
> keep up with the recent flow of patches for this driver. After speaking
> with Claudiu, he indicated that he is in the same position as me.
> To help with this work, Conor has agreed to act as a reviewer.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: change maintainers for macb Ethernet driver
    https://git.kernel.org/netdev/net/c/0a549298f452

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



