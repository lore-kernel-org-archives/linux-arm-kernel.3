Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6F4C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbVYYIVt9FnT2H4cJiQ8MIn3c0XGSa9j3RiqWHQtUfE=; b=kDQWkOL8Jh0AWhmMQNgvbvGysT
	gBdtARdHLy78rdYI3RQjH2YIyBGBeMZwx9ryVCxh0zPjE6gcVYA1SZW6mJEZ6kCLJn6qTmMkinCpR
	/sEHtRQTxQxaAonD4GZokdRHGQLawD6DZYQdrip3EJN6b1f+QqkbvtcCdVgyDMDr3FLxCmPPWaddG
	g+up1ZZ2d+t6DmbekdhjpKj+K5w4/9GdCQMPOohybrNS7TpQE2ZA9KVMUC0I2HYXV6bod716KTgLj
	27oDgYEvi3DbbiXADKUUwAxr6ovsX/3Ndn5dsRQXb0vxDM3RZYrm+QaGpiHdpmAyb3/Td7VvEHcIk
	H3PnTLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tux6x-00000009gfX-0QiX;
	Wed, 19 Mar 2025 17:21:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tux5D-00000009gLM-2kHA;
	Wed, 19 Mar 2025 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8AFFA44978;
	Wed, 19 Mar 2025 17:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4E2C4CEE4;
	Wed, 19 Mar 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742404797;
	bh=LrltH36LcKzUeNqpvSJ0cSNyUs04mlDZqxOw+sb1OXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gwmk/3sCXrryWVFn02KC6xjpk+pafHJkPHLPh/Zq5TEj0QR7BCneUeEc6Jc1jpNTN
	 KEEHR+DrxNT/D6DS6N38wBO+yj8ywpgpl4I2meuluRDkKjBzrC+0Ls5xAymsYS7pAF
	 PPdJ0EovZxtO61R9xfmGLHs5BmDaOfDQmn+CY+MQNE+w0enB0FHsICj2dIaf7gMdxC
	 ujBr2jVJbYOk6d5oUF22g+7kxmDYXqMSwc3vmmFmc8Qi8N8tO5DqM3Y8GdAzY8SBx1
	 MoI4Gjhad2t5bV1YP4VujVh7LGr+2BlRB4H4N9dnFMPA73Q1rbX/l3ecEiAqnc/quo
	 j3pL/y6P8ntig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE637380CFFE;
	Wed, 19 Mar 2025 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: deprecate
 "snps,en-tx-lpi-clockgating" property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174240483352.1121844.16892728893562053636.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 17:20:33 +0000
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 christophe.roullier@st.com, conor+dt@kernel.org, conor@kernel.org,
 davem@davemloft.net, devicetree@vger.kernel.org, kernel@esmil.dk,
 edumazet@google.com, peppe.cavallaro@st.com, kuba@kernel.org,
 joabreu@synopsys.com, krzk+dt@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 minda.chen@starfivetech.com, netdev@vger.kernel.org, palmer@dabbelt.com,
 pabeni@redhat.com, paul.walmsley@sifive.com, robh@kernel.org,
 samin.guo@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_101959_755814_89583A7B 
X-CRM114-Status: UNSURE (   9.90  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 09:34:20 +0000 you wrote:
> On Sun, Mar 09, 2025 at 03:01:45PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series deprecates the "snps,en-tx-lpi-clockgating" property for
> stmmac.
> 
> MII Transmit clock gating, where the MAC hardware supports gating this
> clock, is a function of the connected PHY capabilities, which it
> reports through its status register.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: allow platforms to use PHY tx clock stop capability
    https://git.kernel.org/netdev/net-next/c/0c1f1eb65425
  - [net-next,v2,2/7] net: stmmac: starfive: use PHY capability for TX clock stop
    https://git.kernel.org/netdev/net-next/c/5f250bd72a01
  - [net-next,v2,3/7] net: stmmac: stm32: use PHY capability for TX clock stop
    https://git.kernel.org/netdev/net-next/c/a5bc19e2abeb
  - [net-next,v2,4/7] riscv: dts: starfive: remove "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/637af286f9fc
  - [net-next,v2,5/7] ARM: dts: stm32: remove "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/50a84bbc7ec1
  - [net-next,v2,6/7] dt-bindings: deprecate "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/a62b7901d3a9
  - [net-next,v2,7/7] net: stmmac: deprecate "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/cf0a96de397e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



