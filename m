Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2577FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2loO3nUot9hrudi+28RkSsyElCtJRPUuRb8vLweVC4I=; b=n7sXtJpKixwAyHV+IQnd+D6ikP
	RR7wL2/cqjlXg88Hli0Xf51F7S+ZaouBmBBjud8ykZJo3cQIBnAz0koYzd05Pu9k/S342rirIFYmX
	5u+oL0JylQVNIpTyJzgF3tMTQPQmawrDfwAAPSIv9NIyolJPKFsaSOuUc/OY9MEQiYQIGWW/4ANxs
	g5TX1giIfqtZ84UZoMsZ/PQcJ/rEx21Z9P+HgAWWEsvyyAx61d9UGrWYRQMF6JKqV109Do5dOaugN
	XupZrzmA9JbZi5r9/+ELlFgLn+M402gS0GybhXt5eVRCqlYnNXPmmIO0izl/s7+FUzjKWtC3cqm43
	5SJ/h3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGHv-0000000EvFd-2TnA;
	Mon, 15 Jun 2026 23:00:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGHu-0000000EvFU-36YX;
	Mon, 15 Jun 2026 23:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39FDF43C2F;
	Mon, 15 Jun 2026 23:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8B71F000E9;
	Mon, 15 Jun 2026 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781564414;
	bh=2loO3nUot9hrudi+28RkSsyElCtJRPUuRb8vLweVC4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XqUfBKr3fhhIWXrTvhdy/f0lAg3kBl5RtITob6+G0bTxX0nNh2bF6COVJKUY0ThTK
	 y7g3O/YGHa76eYg02BEpzGm0XJf4K8A+hJtz/BooEN8EutaUczxJcmya+vYOklLEqb
	 KcGKHWZ9ZK3/JDE36T7I1ChdHCFM8rvasd+eTsC84OgdyI+h70eSnTC5TjKZIKlR4s
	 0NuE0rbhIw2Pz+gkvg0k8IeiRIhI6PNPhkUEXMNgmQKmB6sTiMNI+ubwfox6ml/4e6
	 EsBzuWaHWOIyRalqds06+6lXaMYmGG4+uZXl9ws6ODFPaRtupjd4K5TV3nHppUE3Sn
	 WHzBBsz2tvlxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569A83839A08;
	Mon, 15 Jun 2026 23:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix MODULE_LICENSE to match SPDX
 GPL-2.0-only
 identifier
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156440888.329386.11011872053824456703.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 23:00:08 +0000
References: <6a2ded59.63d39acb.391892.7632@mx.google.com>
In-Reply-To: <6a2ded59.63d39acb.391892.7632@mx.google.com>
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

On Sun, 14 Jun 2026 07:52:39 +0800 you wrote:
> Both airoha_eth.c and airoha_npu.c declare SPDX-License-Identifier:
> GPL-2.0-only but use MODULE_LICENSE("GPL"), which the kernel module
> loader interprets as GPL-2.0+ (any GPL version). This mismatch causes
> license compliance tools (FOSSology, ScanCode, etc.) to misidentify
> the effective license as more permissive than intended.
> 
> Replace MODULE_LICENSE("GPL") with MODULE_LICENSE("GPL v2") to
> align with the GPL-2.0-only SPDX identifier. Per include/linux/module.h,
> "GPL v2" maps to GPL-2.0-only, matching the source files' declared
> license.
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix MODULE_LICENSE to match SPDX GPL-2.0-only identifier
    https://git.kernel.org/netdev/net-next/c/b0d62ed16424

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



