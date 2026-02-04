Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC15EE8B391
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 03:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lq4EMVgfGLhkcNilwuwSnphAibDU+dsLl6WaouCwDcs=; b=OQXIUwv7Lz2F2ta6dNKVXLN5f/
	s1/3eGP/tB1He8RjVI9E7DTV2Lbug6vwIOAGYolBjIBPPvmNeJWjy5HVRp9ImUCrNYrRgdI/kyiK6
	Gs62l43fkyhjL31eG8XxQg8N1KEK1Mq2iKpe0eWRJzkXUy+Q/pfM+UlaVUng/cOuOlixTMX/GmTEh
	v1Ws2Q1DZDzef3Afr/sm/DaxCytBKliukpBT8OaayXKYD6LvUAMNc06NzrOBUWvzB/q7jsecDqejM
	/WZgXzkYeNYqeusfS6PXVe2k3zSraLwJYS2XMWmgP4GS0bhEvH39BxxP35EXcLGCMXjCNJn4J5yU0
	c/6zvR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTRT-00000007oYi-3sg5;
	Wed, 04 Feb 2026 03:20:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTRQ-00000007oYJ-16vH;
	Wed, 04 Feb 2026 03:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F89940ABA;
	Wed,  4 Feb 2026 03:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B528C116D0;
	Wed,  4 Feb 2026 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770175230;
	bh=gHmM2ZjEnro/lzlK6i3SYqm0I447P+5N5u36K6NBE74=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f1wYf+14b9gipvn5gApCoaFoofSrRCcAIpPqhc4t8SWqgaGlq3poYYuJC44mEUltH
	 XH2Dp4Ix+weI4Rsih59lSfkfZ3lguVBhUYNraPz5l8Xk418NhHWudJSgNOVyr+jT1p
	 esxkHWU9Iew4U7gib8v+puHX9RFNCI6IsznnOZlwpc4EIkDlYzHy8E0Frcz+yqiJl0
	 mCo0v+qif36W7m3z/1/k+vfR/twXPpWBN2DIKBXdEbQhfRCLDwtRTxBKzqQKa7QWje
	 4ywzjUrOpyMsqf+G8ASrrCbjw1ZQTrQMgI0yPbuRzsTJtvu4XqllZwlMtt/DlcBzvu
	 qW+xQvLRLPamQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 910193808200;
	Wed,  4 Feb 2026 03:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/10] net: stmmac: rk: cleanups v3: mode and
 speed for most
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177017522608.2163463.14435686221837710351.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 03:20:26 +0000
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
In-Reply-To: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, heiko@sntech.de, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_192032_323991_F9314C33 
X-CRM114-Status: UNSURE (   9.25  )
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

On Mon, 2 Feb 2026 10:03:28 +0000 you wrote:
> Hi,
> 
> Third installment in the rk cleanups, this converts the interface mode
> and speed configuration for most RK SoCs.
> 
> --
> v2: disable clocks on regmap_write() failure
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/10] net: stmmac: rk: convert to mask-based interface mode configuration
    https://git.kernel.org/netdev/net-next/c/31d28d062aa8
  - [net-next,v2,02/10] net: stmmac: rk: convert rk3588 to mask-based interface mode config
    https://git.kernel.org/netdev/net-next/c/600fe01e947a
  - [net-next,v2,03/10] net: stmmac: rk: move speed GRF register offset to private data
    https://git.kernel.org/netdev/net-next/c/82d1df4b4143
  - [net-next,v2,04/10] net: stmmac: rk: convert rk3588 to rk_set_reg_speed()
    https://git.kernel.org/netdev/net-next/c/8e4b4004e847
  - [net-next,v2,05/10] net: stmmac: rk: remove rk3528 RMII clock initialisation
    https://git.kernel.org/netdev/net-next/c/0c8107dbe720
  - [net-next,v2,06/10] net: stmmac: rk: use rk_encode_wm16() for RGMII clocks
    https://git.kernel.org/netdev/net-next/c/b9544c128c30
  - [net-next,v2,07/10] net: stmmac: rk: use rk_encode_wm16() for RMII speed
    https://git.kernel.org/netdev/net-next/c/4dc66f93b419
  - [net-next,v2,08/10] net: stmmac: rk: use rk_encode_wm16() for RMII clock
    https://git.kernel.org/netdev/net-next/c/33c5c9473a23
  - [net-next,v2,09/10] net: stmmac: rk: remove need for ->set_speed() method
    https://git.kernel.org/netdev/net-next/c/3cf4dfa7b040
  - [net-next,v2,10/10] net: stmmac: rk: convert px30
    https://git.kernel.org/netdev/net-next/c/5031e35f3499

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



