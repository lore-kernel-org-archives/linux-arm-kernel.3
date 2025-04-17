Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7402C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iD4sSE5yD4P7b1CYiiubm+77fK6GwC3IJCcz1e1dQzY=; b=J9Q0F5jdREab6GbW7aN7MvBQvY
	6a8i4b2tlp+k1f+Po1S5ZTCrbrxNgHNjVqRWe7FzcbecKzCpKJ6px/oOAQ6TgUJ1f/SMRnNBI+orf
	0kpouK2GUQ+W3+8hbQPFWF5JPTyuSdfUbEmvIWDTHg0C4RdLP1FCRa63f/fIuyeLUq28eUZ9psWOn
	LS3++xO+83438VhNyWM8VnsPUhsdA8HWCnS74VJF8BYT6BWhSzFhB06biXmpZxkXQijuDfJaMWY7o
	lHF1AqMQI2FHYnShRsjmvwaer+ie8eegJSAMH3gl9KDFjilWyDzOmHO3/lDqAYzP8S6d63noUoMYs
	nf3wW8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ELd-0000000BTHB-0O3x;
	Thu, 17 Apr 2025 01:47:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5EEp-0000000BST0-2eee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 01:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8647FA4A7E3;
	Thu, 17 Apr 2025 01:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3C9C4CEE2;
	Thu, 17 Apr 2025 01:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744854022;
	bh=P5rLUzHGp1rWd+br0EokVbj8xB3CmQiC8msnksIdyVg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E4G3zqxfAjnNdrLBWc19LVvI7Ur7CsdbRnWLwG15rFRKmZlSNOktv6uQ/Lc8AJHZ+
	 tHM69NtMhZvaPvignyHIiUAu1iIO9yb+tcsvdw8jPJ5PBw8Hi3NDx3t3cSt0OlTvY+
	 LkljGDw+OEjihecaQmipsMpsddSlRD6kaAo+WYWWSJYmPEip/kiept/uwAPqJLM0if
	 sbbod1nqvXfF59hvjNwkyKTHJ7w2bwhENkjJ5srAYBh2fol8fqL0rk4hYxtZQ7760v
	 4CBZK7U+x8sfihSrYPO0O8Tl7LIj0krJnN50dUxeLT3Tsvw67oZN9p4Or96BSEYixs
	 bm/K8RYn57czg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE2F3822D5A;
	Thu, 17 Apr 2025 01:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485406039.3559972.1647358182636817567.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:41:00 +0000
References: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 samuel@sholland.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_184023_735010_219F74BC 
X-CRM114-Status: UNSURE (   8.04  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Apr 2025 11:15:53 +0100 you wrote:
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
> (sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/4cc8b57753ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



