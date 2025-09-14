Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E437ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/abO/AAknOTr5NDGQmH3vNR4qZ15YywjI1SEsy1J+w=; b=1QdB7fxsfwzY/gmHNQ0ByHEyYY
	6KERpX5N1xP1va/EBCKjU+3vhqVz4k85gC55aU2UPvYfV31yNWA/LVxpKclqoErBm69hexnNlKE5L
	Apc93QwhA+jT3ZMKsOS1YWJbSUQszFoATOJXtGbFq50qEXZbna8+tGp6g5I+FkcSllIX8yXn2iePR
	8FvHVcA5A+LnsNirFSkC5fGtgKlHuL0mVoot4mMjZmcYLKOttdoToPkfZEcFnFIfuRgPbkfL8IO9z
	5Jxah8dNhHfGZ3j+AJ8UXXolctP42rh5e2mHeUoejFpUfXT67UwVyEaubDH8ZxhCB2xMifTsjLW2M
	j0GtsS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxs7B-000000021Nh-1VYs;
	Sun, 14 Sep 2025 19:10:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxs78-000000021N7-49aD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAD3344357;
	Sun, 14 Sep 2025 19:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F437C4CEF0;
	Sun, 14 Sep 2025 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757877017;
	bh=HyErwXZjJxtC9lke1N7NrfDdKBhf9mDw543eo29YW8w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E1zPJ01dh7kcko3XfxPCXOE0PzCnY3Y+TW/DO9qYP7YofigcyrnOeNJZZYqewjcaA
	 g1yCXHROYGtXy/JbC++uEb1NWs/JlSOJfqLX7JrDG+0/NF1lnaxT1n0HniKXJs734Y
	 NaYz8max6eY8y4xXrgOMtvqcOaXgyVN9rj24O2l1G//UNKAy83cfi9DFA7QrX1ESIw
	 hHXmHNS5/7ePiSnU2aFvKUImBS3tP2Md+MDk17UmqpPUJhIViDwauA8U5ziKQDr5A0
	 dbd4YiCcnMrnR5W9g6Ncykc/hCLXmc6j/iu0aFTdZjuMaa2/InPKkR0D3DLdSXyLMu
	 LheY9KHtjydDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FFC39B167D;
	Sun, 14 Sep 2025 19:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: timestamping/ptp cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175787701925.3530077.1414169170117971537.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 19:10:19 +0000
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 ast@kernel.org, andrew+netdev@lunn.ch, bpf@vger.kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 sdf@fomichev.me
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_121019_069564_8076EA17 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On Thu, 11 Sep 2025 12:07:03 +0100 you wrote:
> Hi,
> 
> This series cleans up the hardware timestamping / PTP initialisation
> and cleanup code in the stmmac driver. Several key points in no
> particular order:
> 
> 1. Golden rule: unregister first, then release resources.
>    stmmac_release_ptp didn't do this.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: ptp: improve handling of aux_ts_lock lifetime
    https://git.kernel.org/netdev/net-next/c/9a1d6fa0012d
  - [net-next,v2,02/11] net: stmmac: disable PTP clock after unregistering PTP
    https://git.kernel.org/netdev/net-next/c/99a8789afd12
  - [net-next,v2,03/11] net: stmmac: fix PTP error cleanup in __stmmac_open()
    https://git.kernel.org/netdev/net-next/c/454bbe5913b2
  - [net-next,v2,04/11] net: stmmac: fix stmmac_xdp_open() clk_ptp_ref error cleanup
    https://git.kernel.org/netdev/net-next/c/586f1aebc9a1
  - [net-next,v2,05/11] net: stmmac: unexport stmmac_init_tstamp_counter()
    https://git.kernel.org/netdev/net-next/c/ff2e19d5690e
  - [net-next,v2,06/11] net: stmmac: add __stmmac_release() to complement __stmmac_open()
    https://git.kernel.org/netdev/net-next/c/67ec43792b11
  - [net-next,v2,07/11] net: stmmac: move stmmac_init_ptp() messages into function
    https://git.kernel.org/netdev/net-next/c/4fbd180acd57
  - [net-next,v2,08/11] net: stmmac: rename stmmac_init_ptp()
    https://git.kernel.org/netdev/net-next/c/b09f58ddc6ca
  - [net-next,v2,09/11] net: stmmac: add stmmac_setup_ptp()
    https://git.kernel.org/netdev/net-next/c/84b994ac4e4e
  - [net-next,v2,10/11] net: stmmac: move PTP support check into stmmac_init_timestamping()
    https://git.kernel.org/netdev/net-next/c/9d5059228c55
  - [net-next,v2,11/11] net: stmmac: move timestamping/ptp init to stmmac_hw_setup() caller
    https://git.kernel.org/netdev/net-next/c/98d8ea566b85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



