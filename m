Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAC7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 02:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOeyusM5DIiYIuNySGAfEhLFj+pcLsnO4f6RqMiCEeg=; b=VnhtHrigd8/nRiY9rIzfEgc3aP
	vQD1KTOqEjfpk8nvPdaI0yMxFacv5C6P2nDTbl595pUF7lFePvfoS+vORgx6uleM4dUz8KY+LRuB/
	ksQk6GY6NYNNLrvdfu5qNautsNdps3/Do2P3NCp4PTPbe0WrsiY/8zlJDYdzB/32wpghb5D7JboSR
	HMasHSaPs131fU+1vmkzkS8wbGcl1ZGH1A6AOtLixCAuuemHEM5OFdwHZj9ndGXwh12b5v7yV8t8E
	knBbGlsV+nbAbH4VGNRrKrsXlolPTw9mV1t8TsEV3DQ6/eUCNvGHdxu2gR2HS3FRmBbF33S7qk5R1
	B9Wwe4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuiOS-000000063kn-0ClM;
	Sat, 06 Sep 2025 02:11:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuiDm-000000060qU-0Lrg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 02:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10F3444BCD;
	Sat,  6 Sep 2025 02:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9FCC4CEF1;
	Sat,  6 Sep 2025 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124004;
	bh=EXTpDimrD71jZCY57QxP2cDPjeFi4jI26zptPDAqL6E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZQw+RFSjo978Rw1kRGeSIP1gERbi/QgVd3Ke0m/cOa4cmj9XZb1gHB6p8Avbw6riF
	 HWpmRWC/gHF/UCpEA4BxLDVQG8xhh6WmHXk7fj3W9ifIco7Yv7xr+slg4OtJCEoEEk
	 h/bL3gs+cnVte8GBNLscn3XfShLxxDnvKFNOTVfIr9L/5qfhaE9hafhWi1PrkosRiz
	 Im6rrUXkZ9diP1D36rBNANDOxCjAYh3xtQm1IfNtDxMF0niqQ2b5/akxIeCtwDeYnL
	 56OovFMCHSo8/WoBDe3HQ1KsiOFXQSDWlZibTocwX6C5I2H0AulAuOYNDm+2s6wCci
	 M3Nvm7WPHntag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D97383BF69;
	Sat,  6 Sep 2025 02:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: correctly populate
 ptp_clock_ops.getcrosststamp
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175712400925.2744531.10227247903778981138.git-patchwork-notify@kernel.org>
Date: Sat, 06 Sep 2025 02:00:09 +0000
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_190006_144223_EF6C09D7 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed, 3 Sep 2025 15:00:16 +0100 you wrote:
> Hi,
> 
> While reviewing code in the stmmac PTP driver, I noticed that the
> getcrosststamp() method is always populated, irrespective of whether
> it is implemented or not by the stmmac platform specific glue layer.
> 
> Where a platform specific glue layer does not implement it, the core
> stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
> code uses the presence of the method in ptp_clock_ops to determine
> whether this facility should be advertised to userspace (see
> ptp_clock_getcaps()).
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ptp: conditionally populate getcrosststamp() method
    https://git.kernel.org/netdev/net-next/c/bb427fb839de
  - [net-next,2/2] net: stmmac: intel: only populate plat->crosststamp when supported
    https://git.kernel.org/netdev/net-next/c/0c9fbb38e2a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



