Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97402606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N0Usb4Tm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+sUANhi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5iQnN8C63bWH6bekwH74CSDmUU2uCzmKfmamRH3PQoo=; b=N0Usb4TmZkiRnf
	Dz/i9YIxGb0O+5Pl724NpOwyIcChwoVJLPxL7Ml2cUlU57v+TId5+u+9exGfaQDL2XJhoU1Z6afrt
	jXgbxD9POjgaJGUNloQ1H7BCh5MlcCTLl4C/X7PErhxLqWxgqv4qjPIKAvtr1rpN4GIltJDTxX4TD
	XV8qNDZhjMd/XzWwy4egmOh3DcTZf1t9NTVPya/43vyiyRr5ClVxj8vWd32qWTC3AHwhABEbe5LF1
	rVsVe+2LbbjESPfw9MJRRccSFZC8adoUjvn/YZJzdW84Gmjb2RXgD6n/ZKvbxvpbbGRVmOJF/Rfxf
	PqH+yr1SRM0wufkJvLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNplp-0000000GEwG-27RT;
	Mon, 02 Nov 2026 11:00:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNplo-0000000GEwA-3ux9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 600C860EFF;
	Mon,  2 Nov 2026 11:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD1A1F00A1A;
	Mon,  2 Nov 2026 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617208;
	bh=5iQnN8C63bWH6bekwH74CSDmUU2uCzmKfmamRH3PQoo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B+sUANhi1MCbeOc9OJhw+ITLJ+WMmIZV42HIb1sLDzJnu6nzPvXPJQi5Q8M4zkiM+
	 uy2dYdNZ8xnwoMfrE864BxdsPHP4FRKK3Sut55ddiCKmYU/8AX4EkXyWQ7FBn2+8in
	 7Jtn1hvRdyIc30GbqS9H+Ff4xPRVsOPfo9iZpYxErpn6V1tcYMTvEKGr+VrNYO3HOf
	 hbsa8hQMK3SDdUX3Z0nk8vM55S1nV8L6UP9IWjz/sxHgdS39pvSogRKuZ5Hd05ERTm
	 DhmJRY8JUkh9UP4pJLdAdriKG0ALBt341dd+uKGizBmxi0EhhhcUUFNYKv9AwHdUG3
	 wuDUpkVNdazUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FD2380821F;
	Mon,  2 Nov 2026 11:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/6] net: stmmac: XDP path fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179361720655.3945611.14288786310433074072.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 11:00:06 +0000
References: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
In-Reply-To: <20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 james.hilliard1@gmail.com, nb@tipi-net.de
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 Oct 2026 14:48:35 +0100 you wrote:
> This series adds some stmmac XDP preliminary fixes needed to introduce XDP
> RX multi-buff support.
> 
> ---
> Changes in v2:
> - Rebase on top of net main branch
> - Fix commit messages
> - In order to avoid possible dirty cache overwrites, sync the full page
>   dropping the xdp_buff in stmmac_rx().
> - Link to v1: https://lore.kernel.org/r/20261023-stmmac-xdp-fixes-v1-0-efb37e19f5bd@oss.qualcomm.com
> 
> [...]

Here is the summary with links:
  - [net,v2,1/6] net: stmmac: take ownership of saved RX state at poll entry
    https://git.kernel.org/netdev/net/c/26219e9402c2
  - [net,v2,2/6] net: stmmac: drop split frames on AF_XDP zero-copy RX
    https://git.kernel.org/netdev/net/c/834ec9530832
  - [net,v2,3/6] net: stmmac: drop multi-buffer frames in XDP mode
    https://git.kernel.org/netdev/net/c/52ffd771e002
  - [net,v2,4/6] net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
    https://git.kernel.org/netdev/net/c/41d78e9ac098
  - [net,v2,5/6] net: stmmac: fix VLAN tag stripping on short and non-linear RX frames
    https://git.kernel.org/netdev/net/c/68bdbffcae08
  - [net,v2,6/6] net: stmmac: fix XDP RX buffer DMA sync length
    https://git.kernel.org/netdev/net/c/363ff816277d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



