Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtAIo4LC5nz/LIrUdiNzKJEHmPZG+tC7ntAkO02ma7M=; b=Yuyc1rvBit1bPs+ieO8CzjPR2F
	VSMLBBAGiZALSgHDe7rkPH2CE8fOV/F3m5nhsO1rgIyt04MdrwHexWbhTnV0yuRoXS3xRcqTJQe0I
	iXSETJ3n51ZWAC4GrGV7+UudIX7CElNu+yacAHaMZconzeCTSsX3Gy+36PvckTnrvq0ARW+m0ZJWl
	cnAKQQy7qAE8LTmcxIDxx/8EXgV7E1n9Z77DKWDboW8zaCD1RwX6bxRAZriTAS/PFqF3sdu/mWInF
	9DHFdNHz424LwVKkCmiikDBbmmObvonlR1MunZX+i/5SlpRuxrfhb8fxJMmk/6vijZeyKAYBD68tx
	j+bX0pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZPf-0000000FOUH-1tGV;
	Thu, 29 May 2025 09:18:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZH3-0000000FMdg-43Ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89FA6A4F500;
	Thu, 29 May 2025 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F9AC4CEEF;
	Thu, 29 May 2025 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748509804;
	bh=Yb2uSf81m/g9NlDY7wmvxatJgdvhAEkJ2SZriq2WmG8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cpuc0gljbw7Wel8lndc9mBJ6wKLR2x1eW0jJMO9g8nZ6QrREy5jr9bWDS2rnNd3Kt
	 3828I2yiiEBHzYBGtEjCUyeVP8fzrFgNXi16tghzh2vxXuK/bMWwX5Idrh+rtK5Z1n
	 5nlbEHz3Hj7+Shfs/mHCQefQK+L1buCyoz30c3Rk0n8B5sgpUV819bID9G8gY3B8T7
	 bQQ34g5U9bfVDRUeYFlM3VC9HmFyYP9TSVof/Ij53VfJzkAci/d5G92IV0Igodh+b3
	 Od5wZ/LIOitZJInY3nhFQK/WajIY83+/LsVv7rPR9HpBZeCetNdNa6dZGnnsTrHQdV
	 MysXznv41IAfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F2939F1DEE;
	Thu, 29 May 2025 09:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: platform: guarantee uniqueness of
 bus_id
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174850983774.3198213.12132601744057177877.git-patchwork-notify@kernel.org>
Date: Thu, 29 May 2025 09:10:37 +0000
References: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
In-Reply-To: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jakob.unterwurzacher@cherry.de,
 heiko@sntech.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_021006_085313_98781558 
X-CRM114-Status: GOOD (  10.44  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 May 2025 13:56:23 +0200 you wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: platform: guarantee uniqueness of bus_id
    https://git.kernel.org/netdev/net/c/eb7fd7aa35bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



