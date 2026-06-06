Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F467CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMLca7nfWY9RizQfqQEviPppjRfuz0UhEGaO/4cVevs=; b=Lt1cYhHHOrZpzNqwpGa/6C4wQj
	JNMBTjjKf9TWaiW/91ZzFkLQa1mWHQkXSk8wQ0DUp/xCX7DwcuqQ8e4z+c3D9x14HrbAaF7ihRt2y
	jKA1cZi7k1CAeHS66+k2NjMtz1GuH8CrCx2niXbk0rE8ZwlJTrsHRU1/P0e6ED4Yka9laIYX5kzqa
	Cx5E9Z8EfPPSK+kJSIX1nBO8Hk4vdgCnC8gTqAtlcLMPnzFEYRYusCewN+66qZVIthl13aGs/oWcC
	oXoGdzAfzl50rI4hNYDJWkFZMxzPDqLT7kj/wG8/HiBs7XvZ3pOGG7qgFnQnpdM2wnc5v/+XuuuxD
	PE01Rw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgUV-00000001OE3-2sqm;
	Sat, 06 Jun 2026 02:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgUU-00000001ODh-2Jef;
	Sat, 06 Jun 2026 02:10:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8A04441CC;
	Sat,  6 Jun 2026 02:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B5F1F00893;
	Sat,  6 Jun 2026 02:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780711825;
	bh=kMLca7nfWY9RizQfqQEviPppjRfuz0UhEGaO/4cVevs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TfEVPsW2JDPmWdJxiQloAJKrWYcn3IRGJ6yfNo8yR35J7dWRDFDbOaS5l/Duu393s
	 r61sP4XE9OxzRF3L2TvMvtCPVtG0h5Ra9cTPqTrSsZLOyLQ0ml2m9dpVfmL0CfEFm2
	 ywl+PjirMHj7sUS/bAKuVauTatFDdExPcn7dEzpqCn8XPOTKQbnnPdnoy7pi5GDfOV
	 v8PZ01Lu+CQBfaf+Kgl0lmFfCpfTjvsYzFAwvAAqwLgVyALQXaEEnPk+QGNkWTqEzd
	 zk7o8yl41w5La+mgN8zQGebVZHqlF8dqKb2QvKyoPSPTablFn0J9XqamR5xjFK8duD
	 OnilhwFDZ9uWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E43930A9C;
	Sat,  6 Jun 2026 02:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v9 0/6] net: airoha: Support multiple net_devices
 connected to the same GDM port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178071182563.3993660.16859528929943768907.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 02:10:25 +0000
References: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ansuelsmth@gmail.com, benjamin.larsson@genexis.eu,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, xuegang.lu@airoha.com,
 madhur.agrawal@airoha.com
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

On Wed, 03 Jun 2026 08:00:14 +0200 you wrote:
> EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
> manages the traffic in a TDM manner. As a result multiple net_devices can
> connect to the same GDM{3,4} port and there is a theoretical "1:n"
> relation between GDM ports and net_devices.
> 
>            ┌─────────────────────────────────┐
>            │                                 │    ┌──────┐
>            │                         P1 GDM1 ├────►MT7530│
>            │                                 │    └──────┘
>            │                                 │      ETH0 (DSA conduit)
>            │                                 │
>            │              PSE/FE             │
>            │                                 │
>            │                                 │
>            │                                 │    ┌─────┐
>            │                         P0 CDM1 ├────►QDMA0│
>            │  P4                     P9 GDM4 │    └─────┘
>            └──┬─────────────────────────┬────┘
>               │                         │
>            ┌──▼──┐                 ┌────▼────┐
>            │ PPE │                 │   ARB   │
>            └─────┘                 └─┬─────┬─┘
>                                      │     │
>                                   ┌──▼──┐┌─▼───┐
>                                   │ ETH ││ USB │
>                                   └─────┘└─────┘
>                                    ETH1   ETH2
> 
> [...]

Here is the summary with links:
  - [net-next,v9,1/6] dt-bindings: net: airoha: Add GDM port ethernet child node
    https://git.kernel.org/netdev/net-next/c/a4597204b681
  - [net-next,v9,2/6] net: airoha: Remove private net_device pointer in airoha_gdm_dev struct
    https://git.kernel.org/netdev/net-next/c/4408f5206809
  - [net-next,v9,3/6] net: airoha: Support multiple net_devices for a single FE GDM port
    https://git.kernel.org/netdev/net-next/c/a9c2ca61fec7
  - [net-next,v9,4/6] net: airoha: Do not stop GDM port if it is shared
    https://git.kernel.org/netdev/net-next/c/99b9d095d71e
  - [net-next,v9,5/6] net: airoha: Introduce WAN device flag
    https://git.kernel.org/netdev/net-next/c/7758cb462ff7
  - [net-next,v9,6/6] net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configuration
    https://git.kernel.org/netdev/net-next/c/ef2aee987174

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



