Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3549C54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 01:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNXpos+KFKlgWkGg3Bc/Cslj4q3MuxtNfV5w+NKfjeI=; b=OIBMR1Z9HpwOfJWIYAjZklnFb5
	KEOPXjdTW+ZA0s4pnSA01Syl3EsZsL7GYaspz9gW0/qz97A2ZWQ4W6FmY+atLM0pmupPXxNKVHKzg
	b4RbIUhKs5RotmHK6JWbA5P0LfSQ6302757dDp/LGs13acCuVCUny81QCoM5RHPQU25SapOsXRhqj
	CQ2pkLHraCd3X6fb09jNq0HpU71l87+FcIZneTBNPGVNz89d7rInf95/zpXx+6fX0e3n+aLUVCWx0
	0OffJc6u9Hnih5KemgrHl5SXMb2RufUQj4hrdG6IYDuZN3XrZQ5LHCN9RYUcoVqcUTwJxlpPIT9e+
	+WD83DJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHYAI-0000000EUO7-3C7r;
	Wed, 21 May 2025 01:22:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHY87-0000000ETyf-3X1o;
	Wed, 21 May 2025 01:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 164494AEFD;
	Wed, 21 May 2025 01:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49F8C4CEE9;
	Wed, 21 May 2025 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747790423;
	bh=6cw2AlYCWLjE+TSTj9Ic8Mp7D9kUTOyLV7ooRycjEfc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mB/bQrbghUpWn2FzPAGn5pJtKx8CctWB0li00fGLDaHFFU964Qqxj7o15XlV7ZXjz
	 etwAz8hw5ndvhyitxudtAnuRuXnSIY4yZlJv/alZ0m/Wd9VIABw0bFhZkWb25ug2IE
	 /y6moZ4j872KG2nZAFDRHjzu+IsyFtkb1DfPOKn+XEixa/kk3775F/H/mbO5QhO4pb
	 1VX1neg102zea0tGXsJJWrgtnSji4X3t05fr3g+XXQnOrIO7gs63rs2k3Z4XhA8u2G
	 shE8jBF05ulUtW3DkDM78mnQ3I0PWdGTb2qQ7xunbg/7XfuVDj+Z1psNwZG/s8phjx
	 84pLjjzRS4o2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1E8380AAD0;
	Wed, 21 May 2025 01:20:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] Add built-in 2.5G ethernet phy support on
 MT7988
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174779045848.1526198.6198912452247192673.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 01:20:58 +0000
References: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
To: Sky Huang <skylake.huang@mediatek.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven.Liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_182023_903379_EE8217ED 
X-CRM114-Status: GOOD (  11.18  )
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

On Fri, 16 May 2025 18:23:25 +0800 you wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> This patchset adds support for built-in 2.5Gphy on MT7988, sort file
> and config sequence in related Kconfig and Makefile.
> 
> ---
> Change in v2:
> - Add missing dt-bindings and dts node.
> - Remove mtk_phy_leds_state_init() temporarily. I'm going to add LED support
> later.
> - Remove "Firmware loading/trigger ok" log.
> - Add macro define for 0x800e & 0x800f
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: phy: mediatek: Sort config and file names in Kconfig and Makefile
    https://git.kernel.org/netdev/net-next/c/6d243c80fe91
  - [net-next,v4,2/2] net: phy: mediatek: add driver for built-in 2.5G ethernet PHY on MT7988
    https://git.kernel.org/netdev/net-next/c/26948c243041

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



