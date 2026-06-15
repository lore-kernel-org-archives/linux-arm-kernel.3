Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0380CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T57rr/fexxAyKKAD9vP64yQclmlYeocSTP22QwpKjPU=; b=binJ0b2V3r2xH4+37AV9HMf400
	d9FbT4/KRlbI/44KsgHjORNftfSJCHqDe+jhofWQmC2GqLgYGbmG4T8Oti0qdw6NhkLJsIbPiF8JC
	FWzfTgmivOihyeg4W1eP6QTfk7nPNJcg1h1Fqm+6yThyJ8nymgl1dEKcRl8/msk4geEFFuxgqR4oM
	0GVz7Wwgk4CsHjYJE+ayyoMx4Q3qTMksoAsURCwznEP3PZJEfL9yWlifpZIWw0y9iibeNT+t4GGsU
	s5hVg0i2JUE0MIgChdsJkYObKwgjBLyUV4f0823iXC6+HVy24MU5zd7FlJkslpPKOIRKZLpcFEhqC
	cRMzLVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8k-0000000EuWB-2k04;
	Mon, 15 Jun 2026 22:50:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8j-0000000EuVK-0Foq;
	Mon, 15 Jun 2026 22:50:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 764B044299;
	Mon, 15 Jun 2026 22:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570A61F00A3A;
	Mon, 15 Jun 2026 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563844;
	bh=T57rr/fexxAyKKAD9vP64yQclmlYeocSTP22QwpKjPU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HHa0eArAA6Ld0Zj3yp6vGoxUPOoQmUCKHXCnC0q5zrnsQm2Au5pVRe0UAmhnf5d3s
	 WAdzDrOqCd6R8F5ml/XISNZ6hMDpfSNg/KbovMbsghZlcHVvF+DvS6XBuOWnOi9vaD
	 q8PNpCTF7NFYMhaq2vAosnH6+K207slsGGmNq5SdIhGp1bkGgbzCE17E2hx5jx4d2A
	 48MNWhO90uBx2ao/SMxWin5SvbSeB3d53Q2tumhuluTTu2RVe069D1F11eLUVQO5Um
	 pnrLBUqb+zWiYeYD6DgJ7VyM7CC7ZlCIvnQ8FrM5yqvpOf/A9vNd7b2DrBqcfwZBEi
	 VYwbOqbEz96Aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938083839A08;
	Mon, 15 Jun 2026 22:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix typos in comments and Kconfig
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156383913.325968.10885453250477186810.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 22:50:39 +0000
References: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
In-Reply-To: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 13 Jun 2026 08:41:16 +0800 you wrote:
> Fix several typos found during code review:
> - Kconfig: "Aiorha" -> "Airoha" in NET_AIROHA_FLOW_STATS help text
> - Comment: "CMD1" -> "CDM1" (Central DMA, not Command)
> - Comments: "GMD1/2/3/4" -> "GDM1/2/3/4" (Gigabit DMA, not GMD)
> 
> These are pure comment and documentation fixes with no functional impact.
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix typos in comments and Kconfig
    https://git.kernel.org/netdev/net-next/c/a061dfb063fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



