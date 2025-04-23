Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407D6C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOlPI5XoOp7dbZsqos+LPW8hA4Z3kHMF0g6USobQV/s=; b=P7EtMStdkzbN6Eg3x0JfRqYyAU
	P25dHPXx9w83TB2q4C11WjnuvvrdZDAMFQ9Ux/KcEOWjT+mZgCZ2W/zcIiEb26tMjoJvd5NEmLNz1
	IjXHUFLGPei8KNGxDhhgozZw7A+QfrBMVllcZ5ePTt8fav7drfglYp5A79Wi9edrv+21iTMZ8P43t
	Tu3K42CItem4dnZy53bBUYdy83afCm0/Dx3BSHBJV0zrB5Gq8KQ7nKWk4YTJtGOfWD7p9ew/5ImmB
	LNqhGwtG2QuBQFRzBPLsRcIUNMtHgM1U/wx1Geq0pIDCmxmfC8LapwnD2X0Vfb6J8eTkz3LcmMhlw
	IbUBLHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PcP-000000091gf-2RnJ;
	Wed, 23 Apr 2025 02:13:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PYp-000000091FF-1qm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 02:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57EFF43EBE;
	Wed, 23 Apr 2025 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF178C4CEE9;
	Wed, 23 Apr 2025 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374202;
	bh=mfA8LCGyK1ft3dVgLyO0no1zPL7rJ2QqTHlgV6oRXU8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LJRyZofHrIWVdj2cNJN1mYZWKFIhGf3r1M1ry/4o1nWCmhs6Zhjnd4sNg4r2Qn6pn
	 IiaA8KEJLeT75wSHPxOS/ngZtJ8B6oySkr+bMelzKJCEbnS8N99qWBk26xWHVMJvE4
	 hHFYXcL9kzdxCvp0Sk5FCAmq51rj8Ffg3J078GTPz9CMJkwvHYjj2c67Hm2o9xpyUG
	 r1FPDhMgJ6j/wWvOKcux+suI2FeimfPxnFs/toD0xcZjZW+mGU84VF1HWkayF0fQ5P
	 0UgtHgkgjwU4W+K/7astVsKcHZcP9Qa9m99UIoplFVZoMI2QVcunOBAtjz7843j8ZI
	 XXHK9hx/qKcyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7A380CEF4;
	Wed, 23 Apr 2025 02:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/4] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174537424123.2115098.14548979135070706572.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:41 +0000
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, rmk+kernel@armlinux.org.uk, peppe.cavallaro@st.com,
 joabreu@synopsys.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_191003_500230_BE35E22E 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, 17 Apr 2025 09:40:11 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
    https://git.kernel.org/netdev/net-next/c/8c989368c04c
  - [net-next,v8,2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
    https://git.kernel.org/netdev/net-next/c/8fff7ae84d18
  - [net-next,v8,3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
    https://git.kernel.org/netdev/net-next/c/461f6529e594
  - [net-next,v8,4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



