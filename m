Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D4C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 23:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqMZmsJw+P2abON4ei6yPGQZiJ1gPP87oeCgoLHuSM8=; b=m5PAsUAO1+pmId6jm0DwMPsxtQ
	+r6W6veeO1YTD8uGu1RQTZkNNZL/rtBCR5Z/nvDdQH0CffaT7GfrCE+6pMWq1neg6h6LcdjYoMBzs
	BGkrIDN8AfQjfOaTChgbxlil6NMlP9boJJxSvXoKyRuXcUyiRpoRaIZzshhDv1HwYkTVTI2xsv5ee
	vpO9hhSdjAIZWuzxJdQviSxGUA515QBLO7yVZrx93RCO0VmHC4ibnUv7G5pF1mdobEt7mc/XxnoD1
	W8YGcRco092SxpG7K+4Q58mf2ODSi9JBT6/UStE8To7x8s1vpCv4EgdyP2wOo94fDJjCf5qyK1e1j
	an3ObPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YGh-00000007qKF-184z;
	Mon, 28 Apr 2025 23:52:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9YEb-00000007q6o-3tra
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 23:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D327C5C546A;
	Mon, 28 Apr 2025 23:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A6AC4CEE4;
	Mon, 28 Apr 2025 23:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745884200;
	bh=vsCYRJOu2+7O/vaGXslstlkjSpMCXUDLAHK65Ew0rG0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aGJP4i/u7wVlXy+99f3czCJoOsn4bi4HjuC4uYD0eZ7DUNidJen8244Hc5WgthPof
	 xDwv5RreNyi0aZOIMyRC0qnk154UIAX0cN4yZyR+N+53PRCBLF/xwrkAaBRRr1vZVU
	 iCSP7q8GciiXf1yZIym1xY6MU1eLTJrfZgBJMQ8YbqEg6CFYVrI3WAoY888ZQWJm4E
	 NTcCeUS2nIA84m0TuKhDRddrr3YXCJkzd+Eic63sX4vhsCHEPjgzPqKgBtzefarWMo
	 ERTHZYuurxiVhCgkHMwUYhls6WP/8qcPEUACvh1fDucevmJcB4Qx8V8D5NyhzPwJAi
	 Is1By8WOGx3jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEC83822D4A;
	Mon, 28 Apr 2025 23:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/8] Phase out hybrid PCI devres API
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174588423950.1081621.6688170836136857875.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 23:50:39 +0000
References: <20250425085740.65304-2-phasta@kernel.org>
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, gakula@marvell.com,
 sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com,
 taras.chornyi@plvision.eu, venza@brownhat.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, deller@gmx.de, horms@kernel.org,
 jacob.e.keller@intel.com, mingo@kernel.org, tglx@linutronix.de,
 viro@zeniv.linux.org.uk, shannon.nelson@amd.com, sd@queasysnail.net,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_165002_056720_0C263939 
X-CRM114-Status: UNSURE (   9.52  )
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

On Fri, 25 Apr 2025 10:57:33 +0200 you wrote:
> Changes in v2:
>   - Rename error path. (Jakub)
>   - Apply some RBs
> 
> Fixes a number of minor issues with the usage of the PCI API in net.
> Notbaly, it replaces calls to the sometimes-managed
> pci_request_regions() to the always-managed pcim_request_all_regions(),
> enabling us to remove that hybrid functionality from PCI.
> Philipp Stanner (8):
>   net: prestera: Use pure PCI devres API
>   net: octeontx2: Use pure PCI devres API
>   net: tulip: Use pure PCI devres API
>   net: ethernet: natsemi: Use pure PCI devres API
>   net: ethernet: sis900: Use pure PCI devres API
>   net: mdio: thunder: Use pure PCI devres API
>   net: thunder_bgx: Use pure PCI devres API
>   net: thunder_bgx: Don't disable PCI device manually
> 
> [...]

Here is the summary with links:
  - [v2,1/8] net: prestera: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/66ada7471155
  - [v2,2/8] net: octeontx2: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/48217b834529
  - [v2,3/8] net: tulip: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/adc36d0914f6
  - [v2,4/8] net: ethernet: natsemi: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/2a5a74947a2b
  - [v2,5/8] net: ethernet: sis900: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/6e5f7a5b5e0c
  - [v2,6/8] net: mdio: thunder: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/fad4d94d9ae5
  - [v2,7/8] net: thunder_bgx: Use pure PCI devres API
    https://git.kernel.org/netdev/net-next/c/06133ddc3590
  - [v2,8/8] net: thunder_bgx: Don't disable PCI device manually
    https://git.kernel.org/netdev/net-next/c/1549bd06e340

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



