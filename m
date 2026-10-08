Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF7CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6nkmv/DDpaHl5YKwomMF3p1zN5UZG16ybANi5RR8Jg=; b=NlJE8DdyowDyYUmhvtyG+imK8c
	MqJHkD1MZvxRsHyut0G0NLUbuMmGQCNi6yxHz5n5mRw6csIX3hEmCMR8zcDeFor2TA9yc/ZFXZ2ab
	FSpqCrBBCzaXwEvzVo+0v+KHDHYblohMRiX5Mn/l76mlW1hP2QENOLH3BBGgNdwAKRteiSyl4j1ox
	ouiNRjBdouMAegaDNF/BQksduKOj5sPxBjChmqIPet3bjELZEO4BR3rIM6U0mCkDXo3OUTQJDJdMs
	RU3L3sx7Gc1TDHhfs3/XuHWsxmzFk8lnFSEd6mmPiNqMcU3OWBoRPA/V84O2UfetD+G+LYpw641Na
	/V2njJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xExsG-00000005Aks-0thp;
	Thu, 08 Oct 2026 23:50:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xExsE-00000005Akl-2Ddn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 23:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE27D439C3;
	Thu,  8 Oct 2026 23:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6451F000FF;
	Thu,  8 Oct 2026 23:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791503405;
	bh=w6nkmv/DDpaHl5YKwomMF3p1zN5UZG16ybANi5RR8Jg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X84G1Tz1+NBASMVv7LWyF0pxG85zWONvjbkufRPTUwl78f2Fr2947zOcEhH6JiGSp
	 1mwu32bEvNGsSZH1alEfPXoDFq73CVuaQ+jyUvxp8xBuDLC5Fmp/tksjuC1clhA7eL
	 yeS+WYpVR1ZGc3Xz+nS3iPtqgXwG5rqvcXm2QfRxxmx3zC5CpTeLLOCxwBT6hj/W4/
	 Ygf2h5jffs8j3jik+4WzXMYyCg6TQdsTDBH6fWx1vbaxybWJQYatwjbHLaENOlA1zM
	 h52TT0RuAym1ajzGBxdsSZe5Ayur+hPlVzm70YyIYiMOSL3xU4qSLroVFohBASTWZD
	 7yc5OkkCV2qMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4574380AA60;
	Thu,  8 Oct 2026 23:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] octeontx2: use arch_extension to enable LSE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179150340428.483817.886115147971378041.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 23:50:04 +0000
References: <20261005162137.71397-1-emanuele.rocca@arm.com>
In-Reply-To: <20261005162137.71397-1-emanuele.rocca@arm.com>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: sgoutham@marvell.com, gakula@marvell.com, rkannoth@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 schalla@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tamar.Christina@arm.com, Jeremy.Linton@arm.com
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

On Mon,  5 Oct 2026 18:21:37 +0200 you wrote:
> Instead of using ".cpu generic+lse", use ".arch_extension lse" to
> enable LSE.
> 
> The ".cpu generic+lse" directive replaces the assembler's current feature
> set with generic+lse, dropping other previously enabled features. In
> contrast, ".arch_extension lse" enables LSE while preserving the current
> feature set.
> 
> [...]

Here is the summary with links:
  - [net] octeontx2: use arch_extension to enable LSE
    https://git.kernel.org/netdev/net-next/c/9142c2f8f84b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



