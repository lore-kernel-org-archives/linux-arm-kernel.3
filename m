Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956ACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOox2uRaVHzcxzDbkU1ncr7dwdyroKxjIXuOl3sptoA=; b=3qkvAaBtfOk9PJ7+ylpEYnValF
	98JJfSMERTmINqWT8aWDjKsb1hwXckk4/1eValRFu/WuLkUknCd0yTiBQz9P6uLyBinQ0s0cWJy8k
	nloAbQZ4fCbwkuCU8MnOu4kRZ4C24uN4C52rfO2uqXPZFDuOg9B6PM/fSgLHb57/QTgPk04SwKD5/
	JBfmqEbNU5DI2m5p387Nv9YZQl16FuJ+Oe2MGlzu8idc6ZlG9ARxbJge/INDYCS5Tm3MaJ4KCMYJR
	us1NJ6UwZ7jcRqCbjwHYXdX35pn6tkcxgrUM880QxRxUgYkPqsPd+F2zDdWLuxyVCHBHDLNJ4ROvn
	p+I4UarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPsz-00000004xou-2Aqk;
	Thu, 28 May 2026 01:50:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPsy-00000004xob-19t2;
	Thu, 28 May 2026 01:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4593160572;
	Thu, 28 May 2026 01:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDD51F000E9;
	Thu, 28 May 2026 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779933011;
	bh=uOox2uRaVHzcxzDbkU1ncr7dwdyroKxjIXuOl3sptoA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oZX/DTnc5s5KY+hnrBUXkHaGKUTcrVSXOrneobeG6+kpyp5DlCoKLblCcDIXfwxpr
	 OcclAJvDXsKKTqcCyL5GYOFn9iWXzb5MyCZaA6Z6jxUFRzqH+dob0X4vbdHS31CyU9
	 EnNE1fakLRMFjDnk7tD2tTBMZlLN6wYSKHtaOSgTxVFW8Om1iJ6u299CJ+WQ2Uzdx0
	 nz8OqqFIAKUbUPbMJEhqsus+6jp8oQXUSCgm9xzb2rlie8Eql9fOoowbJH7BIlmtMX
	 XSt86LNjLEfBOe//QMZR2gpGQEq/0MbqyudmaNZYRLlwVu6iW2TIBWC/hOGK/b729o
	 MjVc6ZgWNvIXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19BB5380CFEF;
	Thu, 28 May 2026 01:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/6] Introduce Airoha AN8801R series Gigabit
 Ethernet PHY driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177993301589.711996.780315750455117859.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 01:50:15 +0000
References: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
In-Reply-To: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, angelogioacchino.delregno@collabora.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, kevin-kw.huang@airoha.com,
 macpaul.lin@mediatek.com, matthias.bgg@gmail.com, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Tue, 26 May 2026 16:58:05 +0200 you wrote:
> This series introduces the Airoha AN8801R Gigabit Ethernet PHY initial
> support.
> 
> The Airoha AN8801R is a low power single-port Ethernet PHY Transceiver
> with Single-port serdes interface for 1000Base-X/RGMII.
> This chip is compliant with 10Base-T, 100Base-TX and 1000Base-T IEEE
> 802.3(u,ab) and supports:
>   - Energy Efficient Ethernet (802.3az)
>   - Full Duplex Control Flow (802.3x)
>   - auto-negotiation
>   - crossover detect and autocorrection,
>   - Wake-on-LAN with Magic Packet
>   - Jumbo Frame up to 9 Kilobytes.
> This PHY also supports up to three user-configurable LEDs, which are
> usually used for LAN Activity, 100M, 1000M indication.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/6] dt-bindings: net: Add support for Airoha AN8801R GbE PHY
    https://git.kernel.org/netdev/net-next/c/ed28bd094db3
  - [net-next,v5,2/6] net: phy: Add Airoha phy library for shared code
    https://git.kernel.org/netdev/net-next/c/dddfadd75197
  - [net-next,v5,3/6] net: phy: air_phy_lib: Factorize BuckPBus register accessors
    https://git.kernel.org/netdev/net-next/c/5226bb6634cd
  - [net-next,v5,4/6] net: phy: Rename Airoha common BuckPBus register accessors
    https://git.kernel.org/netdev/net-next/c/e08f0ea6daf2
  - [net-next,v5,5/6] net: phy: Introduce Airoha AN8801R Gigabit Ethernet PHY driver
    https://git.kernel.org/netdev/net-next/c/fdb9bf7f1658
  - [net-next,v5,6/6] net: phy: air_an8801: ensure maximum available speed link use
    https://git.kernel.org/netdev/net-next/c/f6465e36353f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



