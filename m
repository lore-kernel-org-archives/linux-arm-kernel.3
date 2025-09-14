Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E8CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf8ckUVdyoRp5jXgtkjDTk+uPARWIlZgTzhWpGMvmic=; b=BbzfNHJub4mGyHezDRFvR+cDdj
	MeQ/yop/hxs395Ol3HjvezbhguvPhsWLkyjexlOSGXwdNvUJvTLkGV+LJzUkltAYISDCBc5c/23bh
	0TxPcVz42p9ctZV/ojZsHzJPh0RmHDy4tjclV9gtM3RD4IDIwAtS/BfoImBhU9UUF9LgR21w8r66/
	JRwN2abYYOAat5dpkbl11BDHsDofeNAbH8XO5hL9IEMi5h7JWMd5jx5Nk8SqxGWycEM1Oe9Y6qmgb
	Ec8FIFS+p4EJaCXxMMiwWXJTI1Gh2falwDdBIX2ABFfTWBFWXn1uIawujugeLhE1qjwumCw7t71zE
	UNG7Ifew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxrdy-00000001zak-0f50;
	Sun, 14 Sep 2025 18:40:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxrdx-00000001zad-2kwB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 18:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA907601A9;
	Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA79C4CEF1;
	Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757875207;
	bh=YieT40UUJGq33KYU6kqgUp5hNH+j4q3y+c8x9dfZKSI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AEiY5IJyCBvKp5SFmrw9R3Ld8gUZhhaZLJpAyli3NTlg1zp8qmByc0FjidSZy+O23
	 y+TN7mR8rYpW9PJrTO/tFTR9wIokRxb/80u4VDGNAOZFEJQglgib91C7vRkhDROSaH
	 8DnXF8PQ7ES4aPlP8qpfKvkxx/2RH/wN80qKJF5KirSFhTauyPDZjr1lXAgBa3+Jiv
	 2y6T56wj52TGAYWKP0Kmh6FWnpdOcn1tEGB6KOc1KQK48gtpN4y6PopQ5PhQyreqJe
	 ZVZtYYAvHQL6IzBqxd+ZLgDFuosA79V00dReDKONnsmbTsa1YKTcuHZxsCy7scdD0t
	 QGbEa59BgbHDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E9F39B167D;
	Sun, 14 Sep 2025 18:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] Add GMAC support for Renesas RZ/{T2H,
 N2H} SoCs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175787520925.3525025.295266235162136621.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 18:40:09 +0000
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de, linux@armlinux.org.uk,
 geert+renesas@glider.be, magnus.damm@gmail.com, vladimir.oltean@nxp.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
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

On Mon,  8 Sep 2025 11:58:58 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series adds support for the Ethernet MAC (GMAC) IP present on
> the Renesas RZ/T2H and RZ/N2H SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
    https://git.kernel.org/netdev/net-next/c/d43ce9822349
  - [net-next,v3,2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
    https://git.kernel.org/netdev/net-next/c/264c26934f75
  - [net-next,v3,3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
    https://git.kernel.org/netdev/net-next/c/57e9e4d7023a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



