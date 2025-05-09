Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F96C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 23:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXHZHqr3VtHiIzIielcgJdWHhQht4o8WfjvOcHzL0nY=; b=HFnmXHJiCWHC3mDtxxNHFim6PC
	X64TA70F8PPKRK6mES6qnrDUxzk1QNlTOeAsnwxrS5FZcD+K5ep4r7bHCK2QQ7tr4WJ+5NmDTWp6V
	f6idQupkGRyzA7jrdaDM252dBMFOdFvMH1HePR3bmy+vMV8qnLMjxJ3fkjS0jC/FDv136Ehco6Ccs
	v9uK2bjXn05xOsJfheR20WFSEIZWH+lVBKLHhCMXgOguhyQa+PN9jecwC43ussOzYgPkG201qGme9
	lVI2v6WNyG9j1E/fbznl0IP5CTur391dB9SANjN5Q6cWOlG4Rc8RTl6Dr5xzXPZJEnpKa6Px5tEip
	ZkryNU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDXVi-00000005A2e-1iE4;
	Fri, 09 May 2025 23:52:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDXTf-000000059l4-0k3K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 23:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44609A4D5EF;
	Fri,  9 May 2025 23:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9547C4CEE4;
	Fri,  9 May 2025 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746834601;
	bh=PmAUb3RSGlIBEOYXBDwonQRf65lEnWdbHT32ZjGT6RM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cqi+tNgwaKmvEDUV3syMqCLv6wR3kbpd3JtEvXG0wWWbtZOOHQaqXtxl03eC2G6CD
	 +3L0uMm2KV7wV3dI7Lwb/idV/DRKAzD4eam0GvNZD6IqHXyDc7k0IFqv596lacyDji
	 jpJJiCjnL+PBqJAValIQjmeThcSPMueCMZdCMwSKC2r87UvnKGhWyCEi+USmP2do+l
	 ZLptj7H0DYAlkEjTAJwni7Gf+RM+a15Dy9uf0JpKtIzsP18QudWMpJnjFXvcE51hL3
	 84h/v9GPpIUOgV2FDOFj456+RPtEGbrAa1Hg/RMCkeSKayd51HY/RT0Zd8RuGiCe65
	 dgZvsBYXKDBZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C85381091A;
	Fri,  9 May 2025 23:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: thunder: make tx software timestamp
 independent
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174683464026.3845363.2664384903307721092.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 23:50:40 +0000
References: <20250508034433.14408-1-kerneljasonxing@gmail.com>
In-Reply-To: <20250508034433.14408-1-kerneljasonxing@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 andrew+netdev@lunn.ch, willemb@google.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 kernelxing@tencent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_165003_281615_E65B86BF 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu,  8 May 2025 11:44:33 +0800 you wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> skb_tx_timestamp() is used for tx software timestamp enabled by
> SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is used for
> SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
> timestamps in two dimensions, it's not appropriate to group these two
> together in the if-statement.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: thunder: make tx software timestamp independent
    https://git.kernel.org/netdev/net-next/c/179542a98730

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



