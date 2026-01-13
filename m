Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910ECCF45D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 02:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvrsM42Ai6Qzf178VzuSBrCyB3nGuUlrFI8CGy4NmSs=; b=kvEKOBo6vAMwbkXVNWXkMfAKh9
	0W+C63vV0d/nx36c0lNcpzRAxgOtAcxRznMLrXp6ICp2zNhRjNA9qsHW56BFcFBb04lD475eAb+6E
	HjpG/dEB2TEai66MDSu6uU+WB5RkQWUib6WNyujdbmPUunXISFYXrmZp8SGu2V24xcvRnVQZzW8GX
	MJHFXWyseaf8nvg5a0c7z46Oby+X1JguoOqAYoaao2cVgHP+9lfGpSatGKmmI5PC7oZGOFlOmxHmk
	HwJmOB0XTV2GQepmySGCE5I8qAKIzkB+o1LzbyfpTVS4HibxHJegJPxErse/vj13AtX81zWSXsZ1b
	ZjzPuabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUB4-00000006QJf-22z5;
	Tue, 13 Jan 2026 02:30:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUB1-00000006QJ1-0y92
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 02:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B3A6443FA;
	Tue, 13 Jan 2026 02:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EBDC116D0;
	Tue, 13 Jan 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768271434;
	bh=ykFPF5PfTurP6Wq683RO5rLVlwtTOfgUgkOw+O9Mh3s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fQEoT3phOQ5LmGcUFeuuh+77bkdrqi3yPAIXfuouf9aTd35aioNYUJOB/xkzG2C9Y
	 E9hW5kVxXBSln5dBfJ+MI+dM42D6JBTXzUB1Kc09yUvSDNAGtZd5OoQV4rUGAvujow
	 L6Ssbupn5SjChziAai1ZzkCGhFZixJ+2Y0Pi/p1C2jL6KDGs9uZVQJkrj88oQPaqew
	 CVRWKfRgpEarzi4qIL1A/4oYYN6YnNZCl8b4kcKrmCb9O+Oz0vuDvtRlznyrJMoAaM
	 2MPFgqWyZM6abDyMjHOmBsfyH83SfRRJDX1JV63vP5gdsEvpkeBaFPOXI5ZacMbbF6
	 JCNs/UinR0Txg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B96B380CFDE;
	Tue, 13 Jan 2026 02:27:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net: stmmac: cleanups and low priority
 fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176827122776.1606835.6977840080640500582.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 02:27:07 +0000
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_183036_098801_8717F7B8 
X-CRM114-Status: GOOD (  12.44  )
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

On Thu, 8 Jan 2026 17:35:20 +0000 you wrote:
> Hi,
> 
> Further cleanups and a few low priority fixes:
> 
> - Remove duplicated register definitions from header files
> - Fix harmless wrong definition used for PTP message type in
>   descriptors
> - Fix norm_set_tx_desc_len_on_ring() off-by-one error (and make
>   enh_set_tx_desc_len_on_ring() follow a similar pattern.)
>   Document the buffer size limits. I believe we never call
>   norm_set_tx_desc_len_on_ring() with 2KiB lengths.
> - use u32 rather than unsigned int for 32-bit quantities in
>   descriptors
> - modernise: convert to use FIELD_PREP() rather than separate mask
>   and shift definitions.
> - Reorganise register and register field definitions: registers
>   defined in address offset order followed by their register field
>   definitions.
> - Remove lots of unused register definitions.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: stmmac: dwmac4: remove duplicated definitions
    https://git.kernel.org/netdev/net-next/c/1fd3b573713a
  - [net-next,v2,2/9] net: stmmac: dwmac4: fix RX FIFO fill statistics
    https://git.kernel.org/netdev/net-next/c/65b21a7d4de4
  - [net-next,v2,3/9] net: stmmac: dwmac4: fix PTP message type field extraction
    https://git.kernel.org/netdev/net-next/c/e91a7e45bf0b
  - [net-next,v2,4/9] net: stmmac: descs: fix buffer 1 off-by-one error
    https://git.kernel.org/netdev/net-next/c/ec3fde9eead0
  - [net-next,v2,5/9] net: stmmac: descs: use u32 for descriptors
    https://git.kernel.org/netdev/net-next/c/d3b8c9b39356
  - [net-next,v2,6/9] net: stmmac: descs: remove many xxx_SHIFT definitions
    https://git.kernel.org/netdev/net-next/c/670d10509f85
  - [net-next,v2,7/9] net: stmmac: cores: remove many xxx_SHIFT definitions
    https://git.kernel.org/netdev/net-next/c/8409495bf6c9
  - [net-next,v2,8/9] net: stmmac: arrange register fields after register offsets
    https://git.kernel.org/netdev/net-next/c/58bc0f0bfc1b
  - [net-next,v2,9/9] net: stmmac: remove unused definitions
    https://git.kernel.org/netdev/net-next/c/5a78fd3debad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



