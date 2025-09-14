Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0427ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvpjs0BqN0pyTli6k6OgxsXb9XXuOU84MIIbCqeK10g=; b=kS7d6rQU8M5MVXnBswZAdgrsbe
	U8NgFDeRPXtHHicryqZZ3j+BJJ+i1G8gnx3kWdBFGQcisGVb5vzpvkhs2qPEi853A02H57a7ifwKF
	MhWMQzqu6PR5SCn3UgqNWZ9iDt/+Ll+uHyUyrfkOWEK3XXoH6u+7a11xbWwnL978SkYh8BFiWSgdV
	nTACBbjL4K1ceBvmnR8SCpryKTJ9jLYZyMP9iytq2Jfbgpd6EPtlaf4k2/hS049yCJsKic0/Gg6+/
	v7vzKZq6n9Dapb9T4SlgLDlPGLT0Pz9eI8Lf4qz+stlrpoJqY21JSkkO0sZOqfGcajsUhAfZl1/zu
	qHGEEiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxt3H-000000027Fi-1u6d;
	Sun, 14 Sep 2025 20:10:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxt3F-000000027FI-1D1h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 20:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F26304429C;
	Sun, 14 Sep 2025 20:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA54AC4CEF0;
	Sun, 14 Sep 2025 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757880620;
	bh=jaRrPAgWKjDQlUKhFim10dcggCFExzmEAeZ51T9N4xM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ioa37xFKekcZtgaxszIXsoLrlcf9VeQ4jiJy8Ujo7j9mZK9elQuYamTRAX+Xg+Nt6
	 FM6t88R56qJrsRyJaa5fCYjLvE71WMNyJ/8CS5hYvq/NSLxibnMEXHB6Z3WFuesxPC
	 B+X2ihYTNHfUpLmGIz18GnKsPl4mOvn7OykGZytzokHDD13pYqCXs/AqkIal0EGt7e
	 8PTUUzTT0G8DbhvedE9cjJ56BoLeLTg0qwH6OzqtosUmBmfb1Q80fSqG/XmqscJv14
	 1PR+08FPb7cCMfiH032SMQJIWeu6+HTrnwuOIS61yTc0cEuZBgeqIbldtEfZzcp/qp
	 nToUB4GK0VytA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE83339B167D;
	Sun, 14 Sep 2025 20:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v16 0/6] PRU-ICSSM Ethernet Driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175788062248.3540305.3507616475736965699.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 20:10:22 +0000
References: <20250912104741.528721-1-parvathi@couthit.com>
In-Reply-To: <20250912104741.528721-1-parvathi@couthit.com>
To: Parvathi Pudi <parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_131021_368608_3FF5B8A4 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: pratheesh@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, bastien.curutchet@bootlin.com, mohan@couthit.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, conor+dt@kernel.org, alok.a.tiwari@oracle.com, richardcochran@gmail.com, johan@kernel.org, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, kory.maincent@bootlin.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 12 Sep 2025 16:14:49 +0530 you wrote:
> Hi,
> 
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).
> 
> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
> Linux kernel. The current set of patch series builds on top of these components
> and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
> AM437x and AM335x devices.
> 
> [...]

Here is the summary with links:
  - [net-next,v16,1/6] dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx, AM43xx and AM33xx SOCs
    https://git.kernel.org/netdev/net-next/c/eb391228ae08
  - [net-next,v16,2/6] net: ti: icssm-prueth: Adds ICSSM Ethernet driver
    https://git.kernel.org/netdev/net-next/c/511f6c1ae093
  - [net-next,v16,3/6] net: ti: icssm-prueth: Adds PRUETH HW and SW configuration
    https://git.kernel.org/netdev/net-next/c/a99b56577da4
  - [net-next,v16,4/6] net: ti: icssm-prueth: Adds link detection, RX and TX support.
    https://git.kernel.org/netdev/net-next/c/e15472e8f2e7
  - [net-next,v16,5/6] net: ti: icssm-prueth: Adds IEP support for PRUETH on AM33x, AM43x and AM57x SOCs
    https://git.kernel.org/netdev/net-next/c/1853367b76cd
  - [net-next,v16,6/6] MAINTAINERS: Add entries for ICSSM Ethernet driver
    https://git.kernel.org/netdev/net-next/c/7d4b52174dac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



