Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C4CEF99DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DFZb6T1rg+uxKvbW8WujCmxBeOptW0dlxuln8o2RP8=; b=gPFRlMo5zKXznaia1vnH27Ui36
	ldPWyoWrSSF/I0DajLPw5xRCChKi5TRZU4kOsI54sIT/GCNnXOk3kxMyBm+THYd6AEMVKvUQFDVXn
	/17z6D5jjVz0QLOYkwYKKCcdM+sERdZknGLfZ2mGa42GPM7GtW/K7AzouPSZBwGHSJ46f+owFqeWF
	42Xhz1bcTAPOWQU4ZUdENKwRJA93bVRLm4l72L8FEWi/B7EVIIHwYvgRvYTC7FU/u7V42FoUgMgtP
	zl/MYvN6fTAs5X9BPKiLuRZujvjxOzmPL4kgCLjaBJhTzckw3v12PWwQK8wY6yqTwp2d6gUvEzEmN
	rBlebAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqznz-00000003uoV-1EcD;
	Fri, 13 Feb 2026 20:30:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqznw-00000003uo8-1Ugl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 20:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45ADF4439B;
	Fri, 13 Feb 2026 20:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F365C116C6;
	Fri, 13 Feb 2026 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771014619;
	bh=5Kt/TKVWBsSUqUTIqLI1iXg/DdngCWvR0T0lEzWHZaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M8X8TZWPP8U9DqfALFNzdqFyTEpBxb10+urNwyCc0BN4oIuknrcTkx8k9srjaD9jb
	 jw3CIsP5jD81VrAQeeRZsiJMQuadq73wQ2SG+EExyIpegGmAaG/yFSC3ZsRRof1O+9
	 h5IytQokhVQzsaqEVjCz/T0lWtdVTXU0xggrnBiAhNchpV+1Mp/RjfhDi6OmOR9nDB
	 wK9ib83/OMQSfHweN1oqM3k8VTjlTY8NrG1rjfZ2ePzgHe7eQCnboaAcBin37CVZ9q
	 J9juAVa6Vp3Lf6TsAHzLrV4B/usTPAC4tan7jUWsTJqC6kTbQUTZwX1DbtnC1K8dgh
	 foJTi+u7pEROQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B18D3811A44;
	Fri, 13 Feb 2026 20:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: fix PTP clock max_adj value
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177101461282.2548179.9241300584725576319.git-patchwork-notify@kernel.org>
Date: Fri, 13 Feb 2026 20:30:12 +0000
References: <20260212-sparx5-ptp-max-adj-v2-v1-1-06b200e50ce3@microchip.com>
In-Reply-To: <20260212-sparx5-ptp-max-adj-v2-v1-1-06b200e50ce3@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 horatiu.vultur@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_123020_435789_A40379BB 
X-CRM114-Status: GOOD (  10.28  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Feb 2026 12:02:30 +0100 you wrote:
> The max_adj field in ptp_clock_info tells userspace how much the PHC
> clock frequency can be adjusted. ptp4l reads this and will never request
> a correction larger than max_adj.
> 
> On both sparx5 and lan969x the clock offset may never converge because
> the servo needs a frequency correction larger than the current max_adj
> of 200000 (200 ppm) allows. The servo rails at the max and the offset
> stays in the tens of microseconds.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: fix PTP clock max_adj value
    https://git.kernel.org/netdev/net/c/a49d2a2c37a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



