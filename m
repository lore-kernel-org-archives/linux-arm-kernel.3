Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB8C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 00:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXNnz+MNIdVbdIjnmAzzJQtYMeNfMWq2EtmaVnHnA4A=; b=ZGNa3j4KXNjbBDWiH0wQ/gGCkm
	RPnmQFHvKlaxslnQRwQgySnA5kzHFbKRElG7yhzOPPYyaaltcFT3P3+3EUz9LLkJlEUbc+iZTWw6H
	ECIa/3EmXHInP6BXk8QDUNZ3qI8PycD7yeCuXjsNLi/NT661eEy1QBCNmzBG1z2IncoMIu/6maw0+
	up7riUq3cb0rKwDGCdLakQJJhDLFW8EXMbjUzfwxk+P3gpa5sYWFJa6SLzhQydHJEklCE1dB3TCzi
	SHLmudSxyKFVDHmBWkqEGb46eXnwe5TSLIg4U24APwI6TadZ3xF+/t1/lK/PVomq5MsXr7HoIT9t8
	eYQcIhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BBD-00000000PRK-2U2r;
	Sat, 12 Sep 2026 00:01:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BBB-00000000PRB-2pdI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 00:01:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91E714089D;
	Sat, 12 Sep 2026 00:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A801F00898;
	Sat, 12 Sep 2026 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171272;
	bh=wXNnz+MNIdVbdIjnmAzzJQtYMeNfMWq2EtmaVnHnA4A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FUR2ON4nmV7hE6ByMmqyPaCe3lFhvFc4CUresaVZVBL1URMPVX8TvyZiJvfT1bcrh
	 J/HUJvzFTxQOUc+PTyFMhjS55ukarq7OoyXoNhM8eUX70tkfiQABvzhF6t4I8JpGKN
	 ex0Ei3nkac53gJilMN2ehV/fIx9jpbgdM9VT2BWo9b0+JXP2xzUpLrd+xh0TVoXeox
	 0cQasaJfnPujd0CPEt4wWH+NheK40oaVa9I7F/aO8AGyZ+kbBGALy88kW00vgHD6Bq
	 WWODD3aZf2REmYUTkr+STP3/PKyCWgN51wzmbQljVhXgiRFMgX+sL6BSJqe+OZD+lO
	 RL4hx5jn3R6xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BEC392445B;
	Sat, 12 Sep 2026 00:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/3] net: xilinx: axienet: Fix IRQ error
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178917120887.3168051.5032452399743854940.git-patchwork-notify@kernel.org>
Date: Sat, 12 Sep 2026 00:00:08 +0000
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, horms@kernel.org, netdev@vger.kernel.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  9 Sep 2026 11:54:47 +0700 you wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes IRQ error handling in the Xilinx AXI Ethernet driver
> 
> Handle errors from optional IRQ lookup and preserve the original error
> codes instead of returning -ENOMEM.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
    https://git.kernel.org/netdev/net-next/c/90ab44517ee1
  - [net-next,v6,2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
    https://git.kernel.org/netdev/net-next/c/2d2f18d49221
  - [net-next,v6,3/3] net: xilinx: axienet: Fix IRQ error handling
    https://git.kernel.org/netdev/net-next/c/bb2b71024976

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



