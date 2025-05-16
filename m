Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A3AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 22:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMdvH4PPPXXvZIW++XYjRWqBj79OmQ/TG7jGv7JYhqo=; b=o4zuibJrl8kIPscJcgbMqRX2kV
	G+gJOJdlkt2M3Nx/JgQW0+bQcEIaClNVHyRgj+ZIwwCSuoRkBy8OlBYae57tV3Ix5mxXZQmxMemdZ
	Z3KqJbMSvf9kQnZuG++Wa5N0PK9tbU9PWi/2mPhAy7tvXAAVMynNQt+fk8Ec+QBUzDsE2FUMhmlTV
	fthIJxsrCpBHmmc6D7tJ7DU6jrCbi9gC0cgWJhWh0F4SJGW5f/bRjVED7Fg0I7P8COpjmRTRzS+/L
	u2VmsF6rg6d58NV/uBvAWxrrM+9PORGrATQypgnuDoxzYqnLiBUzUARVvtj+WVnf41pV49X3qLIJP
	2J9w+vPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3uT-00000004muc-2GuA;
	Fri, 16 May 2025 22:52:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3sQ-00000004mZM-1QY5;
	Fri, 16 May 2025 22:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DF78A4E3A0;
	Fri, 16 May 2025 22:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2B8C4CEE4;
	Fri, 16 May 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747435800;
	bh=jaqgZ8jTqjEHCQOEGpjn1OUVdzxI1XKNc7sg63lUh1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZIOYvBt+b0EDDr0oLpmf/qCjyaIY1n2GsW1nysdMWgaTAXD5bMRWus+MiOd5atZJB
	 Q0mKL6Kz8NudIm25uoIgMaDV4HPZs8k1VtbMsS7upJvVVVAb5doVSFNF0ueG77kihr
	 PXvC8tKLAh1+6q4vK4IUMOhoIbAcl7AHDCXK5vNmOpWOaQJND9m9JasKLmj7WFaSmp
	 3gCp078VlsetaQ+CWPMgBRQuv008D3t9xBUHj9ffbzHR9i1bQ6RnY/d2yTVghQK+fy
	 YWYSPmL0/zmIxPqA78wBWvwBJIzQ7Pt+/bEwyIPfvSARcGyqIx5inc20IxA4y5bNJr
	 QYag+2smslkHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 352EB3806659;
	Fri, 16 May 2025 22:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,
 PATCH v2] net: phy: mediatek: do not require syscon compatible for pio
 property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174743583700.4084431.5953049222658087870.git-patchwork-notify@kernel.org>
Date: Fri, 16 May 2025 22:50:37 +0000
References: <20250510174933.154589-1-linux@fw-web.de>
In-Reply-To: <20250510174933.154589-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 frank-w@public-files.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_155002_448401_C9E728CF 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sat, 10 May 2025 19:49:32 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Current implementation requires syscon compatible for pio property
> which is used for driving the switch leds on mt7988.
> 
> Replace syscon_regmap_lookup_by_phandle with of_parse_phandle and
> device_node_to_regmap to get the regmap already assigned by pinctrl
> driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: phy: mediatek: do not require syscon compatible for pio property
    https://git.kernel.org/netdev/net-next/c/15d7b3dfafa9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



