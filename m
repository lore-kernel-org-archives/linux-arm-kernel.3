Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26770C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Xi/boYfh/IhsPYg+ypTpvM4tcaEwIBhHpIlYN4cYZE=; b=dFL1nYj4OPcesyb/rwPZJJDFM2
	qK6/JFIe3fm7hMBBGmZznJ6Q5yCLMlo/u2ywKhirXn3rPbOorAqJPUFtUOgLmLOrTaEdntEdvEnd5
	QgGwbk+FGw872TkuCWpSSvia0eB1VzGyekaqggeBE/d+G9zdx/dmYOcTTtlMUk3Q+yHc6m/kQxWuT
	cfdlmXwTkeMY6JMewHV0gItyUE1TCCtXj5KMj9dvV7zBtsE7bUdCIR5dBJtoK3tmQk8RV1raHsuhQ
	ic3B6BMpjbwBvFAXCJHIfiCWy4wISmazy5GSQmSLIITkKT70oNdYIVP066sA2WtEhToza9MVG3lK9
	tcFTlATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3b2-0000000GJTf-41bm;
	Fri, 14 Feb 2025 21:51:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3Zb-0000000GJI8-3xGQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 21:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57720A44BAE;
	Fri, 14 Feb 2025 21:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398C2C4CED1;
	Fri, 14 Feb 2025 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739569810;
	bh=z1h2wB2bK+0PVbZBqeWldkozYIvTn5nsgGbyj9aRZYY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DkPZa+0Us/PS8WiwvVjjlaCwyWXc39w7PpXtnVy9xncj1wibdPRNJVqFI3npd32Du
	 xM7CjMfqg0sR8iPN8guuzGZR3U2mvHbeJqJOHVB3HjuDHi2wrmB0dXDBxG1f5S6F2+
	 77jm573zI+itiQ/I7q1YxWW5NTB1TiH+B+bAt3tBIywq2hi5zSh7yoxxoT2YetENRS
	 qtLCuayVtgTVWr7IOwrdKWQAsxdXKDLf9ks3xGGejmcf3q8Z7Pwea4NnxzQJcOexQb
	 B0k0quSPRodsnc575vpREpeK5pv+kfKAzUyV9bVyTSKbXgU8AcBmKeqQgW16Qs4mhO
	 kSd+tlqPxtY6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3C2380CEE8;
	Fri, 14 Feb 2025 21:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/8] net: phylink,xpcs,stmmac: support PCS EEE
 configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173956983949.2115208.7960791375454243091.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 21:50:39 +0000
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_135012_048906_AB1F7188 
X-CRM114-Status: GOOD (  13.18  )
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

On Mon, 10 Feb 2025 10:52:56 +0000 you wrote:
> Hi,
> 
> This series adds support for phylink managed EEE at the PCS level,
> allowing xpcs_config_eee() to be removed. Sadly, we still end up with
> a XPCS specific function to configure the clock multiplier.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  2 +
>  drivers/net/pcs/pcs-xpcs.c                        | 89 +++++++++++++++--------
>  drivers/net/pcs/pcs-xpcs.h                        |  1 +
>  drivers/net/phy/phylink.c                         | 25 ++++++-
>  include/linux/pcs/pcs-xpcs.h                      |  3 +-
>  include/linux/phylink.h                           | 22 ++++++
>  7 files changed, 107 insertions(+), 42 deletions(-)

Here is the summary with links:
  - [net-next,1/8] net: phylink: add support for notifying PCS about EEE
    https://git.kernel.org/netdev/net-next/c/e9f03a6a879b
  - [net-next,2/8] net: xpcs: add function to configure EEE clock multiplying factor
    https://git.kernel.org/netdev/net-next/c/8c841486674a
  - [net-next,3/8] net: stmmac: call xpcs_config_eee_mult_fact()
    https://git.kernel.org/netdev/net-next/c/060fb27060e8
  - [net-next,4/8] net: xpcs: convert to phylink managed EEE
    https://git.kernel.org/netdev/net-next/c/5a12b2cf29c1
  - [net-next,5/8] net: stmmac: remove calls to xpcs_config_eee()
    https://git.kernel.org/netdev/net-next/c/dba7441b3916
  - [net-next,6/8] net: xpcs: remove xpcs_config_eee() from global scope
    https://git.kernel.org/netdev/net-next/c/55faeb89968a
  - [net-next,7/8] net: xpcs: clean up xpcs_config_eee()
    https://git.kernel.org/netdev/net-next/c/760320145a5a
  - [net-next,8/8] net: xpcs: group EEE code together
    https://git.kernel.org/netdev/net-next/c/1d4c99a1ac12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



