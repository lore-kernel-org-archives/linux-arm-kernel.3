Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E4AFCD0A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 03:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyIjgsXrYebsSpqeZUuXnzqWIj/NcQy5f8XrUqTFtK4=; b=bNbdYP9nldCahn84ub3CWBRjpx
	mQ3YD6wFA9knHM7RPs5d0vlITGUfWdu1JoqzSKejPUzNqee8AP9RZ5gGpi4rC2xsQbnu9gp6Fk1gn
	EJIuMgtzLb0CLwKS0pHNHrzCYEBIzh4Do9xuv5bCYV7H55KTr2t80cMuQXPkQQEbWfMZNObR5eED2
	px4dpXpkBKjFBtic4zoywmNG7TCiPCYbQJAPdlXfO4AuPOlVEdpJ8DdAkCsxc5CD6GRYt+moNIayw
	Kl/lgXsPb+D8AGBQbGCnLlBUziPmrsq4o7AY5XZn1mqa7CPahfa/SbQPEqEG6Bt1eH4+nXnfEAE43
	Q+ZM8alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hm1-00000007igs-3TkI;
	Wed, 18 Mar 2026 03:40:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hlz-00000007igM-3wHR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 03:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E611860054;
	Wed, 18 Mar 2026 03:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B69C19421;
	Wed, 18 Mar 2026 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773805242;
	bh=ci1TLeG+Q5wv5yzhht4iMsaCcAqoSh8bQP++IRr5860=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TXIHu+hM0Lmy2qrU8gxrRdmeIqAmHvUXGdeiRO3cplllQ9CCZFrUiSsraDSRzmWkO
	 2AigU3LiEXukj8PNRUAJjufPSJy9GmZ7lslsliwlNPIq0LAM8PW8Et6ziw4+7/cXNd
	 TMXnvCAxjYO25M4dmPRelp0MNPNGaTLhYGeyYCcWzXm45TW9AgqXoFyq2k5WJtQuLp
	 AsYjPdQNOf3R+penE6+IpDsACWjbETVvLuo2u+1Rw2XYXaCaauZfnMyTbwcgvJrIRg
	 D1o3D11tWuX3hEE7DeURO5qlWQlOgVsRmJXCEDu6XB+yUeILlXGsDFoc734jbG5LWn
	 usq2LTIj8TbPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0D13808200;
	Wed, 18 Mar 2026 03:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 00/15] net: stmmac: clean up descriptor
 handling
 part 1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177380523454.113469.14485009686148036566.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 03:40:34 +0000
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, ast@kernel.org,
 andrew+netdev@lunn.ch, bpf@vger.kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, hawk@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, sdf@fomichev.me
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

On Sat, 14 Mar 2026 09:40:40 +0000 you wrote:
> Hi,
> 
> Part 1 of cleaning up the stmmac descriptor handling. Rearrange the
> struct stmmac_tx_info to pack better, and introduce helpers for
> duplicated code handing the transmit and receive descriptors. Remove
> unnecessary struct members that are only transitorily used.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/15] net: stmmac: rearrange stmmac_tx_info members to pack better
    https://git.kernel.org/netdev/net-next/c/12b4b16c0c7e
  - [net-next,v4,02/15] net: stmmac: helpers for filling tx_q->tx_skbuff_dma
    https://git.kernel.org/netdev/net-next/c/a4b1590ee0f0
  - [net-next,v4,03/15] net: stmmac: clean up stmmac_clear_rx_descriptors()
    https://git.kernel.org/netdev/net-next/c/ee19df4d3bb7
  - [net-next,v4,04/15] net: stmmac: add helper to get hardware receive descriptor
    https://git.kernel.org/netdev/net-next/c/ee1b6a94ba12
  - [net-next,v4,05/15] net: stmmac: add helper to get size of a receive descriptor
    https://git.kernel.org/netdev/net-next/c/4f6280c450ba
  - [net-next,v4,06/15] net: stmmac: add helper to set receive tail pointer
    https://git.kernel.org/netdev/net-next/c/e9d0cafa9d60
  - [net-next,v4,07/15] net: stmmac: remove rx_tail_addr
    https://git.kernel.org/netdev/net-next/c/bea37bda7f75
  - [net-next,v4,08/15] net: stmmac: use consistent tests for receive buffer size
    https://git.kernel.org/netdev/net-next/c/0b3d09031437
  - [net-next,v4,09/15] net: stmmac: add helper to set receive buffer size
    https://git.kernel.org/netdev/net-next/c/a32734d25d87
  - [net-next,v4,10/15] net: stmmac: simplify stmmac_set_queue_rx_buf_size()
    https://git.kernel.org/netdev/net-next/c/337191f37748
  - [net-next,v4,11/15] net: stmmac: add helper to get hardware transmit descriptor
    https://git.kernel.org/netdev/net-next/c/c493261de1c4
  - [net-next,v4,12/15] net: stmmac: add helper to get size of a transmit descriptor
    https://git.kernel.org/netdev/net-next/c/2c3525ad09e9
  - [net-next,v4,13/15] net: stmmac: add helper to set transmit tail pointer
    https://git.kernel.org/netdev/net-next/c/b2fd52d90b8a
  - [net-next,v4,14/15] net: stmmac: remove tx_tail_addr
    https://git.kernel.org/netdev/net-next/c/0da7809235d9
  - [net-next,v4,15/15] net: stmmac: use queue rather than ->queue_index
    https://git.kernel.org/netdev/net-next/c/8cde3c87039b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



