Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11702CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSAPKbtZtGXfQtoZlKM+xng1+JxCq5i9PSUvmzWjhgY=; b=fEPXzge6fEDeDxBimBumaPpUDu
	flAPIieH5qi8H7YYP0W1+iOVFVXAgXeritXnYtjq3tUOSw7ILRThNbuDc5kObydSHc3yuyxGXD61Z
	c3qddMT/7tNYZB4BUnIfTujLxDAA7msTKXuRBJou6mifzmLCzTE0iO3GsEilitOIbrrXgzNdPU8Aj
	uSzBRPGBvS+7+nomkCACypt9hAYHB3UuKqFisgaj/pRA6wUMkaQ17Oc6d9nBqtwB+5qRNNgszpLQ2
	AIYz21zndk+2QgrOy0wYeuFPFKEkETx35tU5jNxYuonzlkef3S+aanPZX5GkE6uYCLWXNcEE2bWvF
	VLOF93dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcta-0000000D0dk-22jK;
	Tue, 13 Oct 2026 13:50:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGctU-0000000D0d1-1GBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:50:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F7E42AF3;
	Tue, 13 Oct 2026 13:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854B01F000FF;
	Tue, 13 Oct 2026 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791899415;
	bh=iSAPKbtZtGXfQtoZlKM+xng1+JxCq5i9PSUvmzWjhgY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VgGv+L6llbhvPAf260XWy93c/9Hljccf3QygrMuZne/a7DVPX1ia4fs9OpqoZAbmd
	 DfcYfRmUGoRGT9brxtaHMV7rZ/n5fEVzZgl8ohAVyQV1YQM9B66ZgDKAQKrR/dn1h/
	 OtNm7UrX2CNu42tE2k7CWewx0QT+p1PnvmQlBoeq1aiQlY85T+WOsN93uKSkchYK60
	 YpyBa8+cmL1rSF1g2kcRiIv6qfA1G1kO/bR7ZwLl6y5fjmF246re0Db17yIONAox9p
	 FfNSk7q23IScTSq9jbu03ir8i1qnFxN/9zF2eyHUWoTf/40agHXC9b3x7lKRwrfapD
	 fXuT3pXuMPjrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 776BD392720A;
	Tue, 13 Oct 2026 13:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: sparx5: add TAS offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179189941412.316800.3089699035347557018.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 13:50:14 +0000
References: <20261006-sparx5-tas-v1-0-5eef1126dfd5@microchip.com>
In-Reply-To: <20261006-sparx5-tas-v1-0-5eef1126dfd5@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr
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

On Tue, 6 Oct 2026 15:51:05 +0200 you wrote:
> This series adds offload of the Time Aware Shaper (IEEE 802.1Qbv),
> configured through tc-taprio, on Sparx5 and lan969x, which are both
> served by the sparx5 driver.
> 
> In hardware, a TAS schedule is run by a TAS list, which steps through
> gate control list (GCL) entries taken from a pool shared by all ports.
> Sparx5 has 128 lists and 10000 GCL entries, lan969x has 60 lists and
> 3000 entries. An idle list is in the ADMIN state. Once started, it is
> PENDING until its base time, then OPERATING. A stopped list is
> TERMINATING until the end of its cycle, and then goes back to ADMIN.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: sparx5: Add registers used by TAS
    https://git.kernel.org/netdev/net-next/c/48b7611964e1
  - [net-next,2/3] net: sparx5: Move TAS link speed configuration to sparx5_tas.c
    https://git.kernel.org/netdev/net-next/c/966285085456
  - [net-next,3/3] net: sparx5: Add TAS offload support
    https://git.kernel.org/netdev/net-next/c/a52629f85a3a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



