Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31F9CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/XcSAGeoGp/BP+1XhwRml/MI2qj10vi9ZYd7jCnORI=; b=gslrS5Lzma0+8upeBgnv0myDkf
	YHePh6lLq4qlsH+na8cZ27QnWte5Ko64aJWe1+icD/AFjZoxX0mnjnudjfBVnpsgH/GZRl4kYahBw
	pJyQH19hhSsqOwjt4Q4F90Zq8m2Xgjqe7B0awCBxkSBbml5eBd+qsr/X4Ew7FDLQFSTuAumK9/hen
	gworq02HEpwTLL5NUPGUfz8D75FLG418qCh5GwaXeQtCdJ7SONlcVcMZI8r+unJA133gfL5iNF0zY
	5cjRyXpamVxQjY02P1t4kx1DFQz1BpTvum2R9N/BmwC/vgnxQNoDVew1FOp6nuZ6OVAtsMDVfTbA6
	Q5yk0s+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFCL-0000000EscO-0HmZ;
	Mon, 15 Jun 2026 21:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFCJ-0000000Esbq-3gk3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 21:50:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 363E5401BF;
	Mon, 15 Jun 2026 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170051F000E9;
	Mon, 15 Jun 2026 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781560223;
	bh=B/XcSAGeoGp/BP+1XhwRml/MI2qj10vi9ZYd7jCnORI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FPlgPyPnuMeIfmdNU0MP3k6aXAwqDVGYRcBE+vdzcnANEahuHxJHj2EkNlS3P1irG
	 bA8kdm03jzL0CAYujQzr05f7I7SgYDmlEH7AdJf7+j1+P17KJGHbFrrKRJX2ci7urj
	 YvTxUdTk3Mz5yKlyDsq1tygwgKni+g9/IcHtySqn/EY1SQq7ephrBf5+WEu+BsbXC2
	 /61fn0E1dvpYIf1ilHh1HAK/H1u/RBp7e5FfRPATCcPXShx/cKIPK8b6Eu4qZg5sO3
	 uTraskHJ8ayVvuPud8Rfc890OZKeOsgL+Ky+qeM7fuLqQBpT7XTRGm/JxsmD1QPJNq
	 kM5RnuPl7b74g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568803839A06;
	Mon, 15 Jun 2026 21:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 net-next 0/9] net: dsa: netc: add bridge mode support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156021814.308382.3109768586287971042.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 21:50:18 +0000
References: <20260611021458.2629145-1-wei.fang@oss.nxp.com>
In-Reply-To: <20260611021458.2629145-1-wei.fang@oss.nxp.com>
To: Wei Fang (OSS) <wei.fang@oss.nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, chleroy@kernel.org, andrew@lunn.ch,
 olteanv@gmail.com, linux@armlinux.org.uk, wei.fang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 11 Jun 2026 10:14:49 +0800 you wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> This series adds bridge mode support to the NETC DSA switch driver,
> covering both VLAN-aware and VLAN-unaware operation.
> 
> The NETC switch manages forwarding through a set of hardware tables
> accessed via NTMP: the FDB table (FDBT), VLAN filter table (VFT), egress
> treatment table (ETT), and egress count table (ECT). The series extends
> the NTMP layer with the operations required for bridging, then builds the
> DSA bridge callbacks on top.
> 
> [...]

Here is the summary with links:
  - [v5,net-next,1/9] net: enetc: add interfaces to manage dynamic FDB entries
    https://git.kernel.org/netdev/net-next/c/ca394837dfdd
  - [v5,net-next,2/9] net: enetc: add "Update" and "Delete" operations to VLAN filter table
    https://git.kernel.org/netdev/net-next/c/c52b6702a948
  - [v5,net-next,3/9] net: enetc: add interfaces to manage egress treatment table
    https://git.kernel.org/netdev/net-next/c/3cc291a35939
  - [v5,net-next,4/9] net: enetc: add "Update" operation to the egress count table
    https://git.kernel.org/netdev/net-next/c/d51f238a154a
  - [v5,net-next,5/9] net: dsa: netc: initialize the group bitmap of ETT and ECT
    https://git.kernel.org/netdev/net-next/c/1a58ae73dd74
  - [v5,net-next,6/9] net: enetc: add helpers to set/clear table bitmap
    https://git.kernel.org/netdev/net-next/c/8469b17310d1
  - [v5,net-next,7/9] net: dsa: netc: add VLAN filter table and egress treatment management
    https://git.kernel.org/netdev/net-next/c/84b4a3b30abd
  - [v5,net-next,8/9] net: dsa: netc: add bridge mode support
    https://git.kernel.org/netdev/net-next/c/751aa5a5d593
  - [v5,net-next,9/9] net: dsa: netc: implement dynamic FDB entry ageing
    https://git.kernel.org/netdev/net-next/c/05b5ee610fbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



