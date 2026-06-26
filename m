Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD2CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKdovRIrKfyxu635TzziBG37YLmIxh49GjmLAgAIHUg=; b=yxsKWzuA/0rH83r7wZ4xS4w/e9
	MBi3UGABBHbfRRwAFOYQaB7KxRwPo033l/idXjrF0Vd0jYSWxLOfCP9/eBzJmryVCgJK0AMB8Ji+F
	NEe3oyqATqCso6NETNWBnc9HEUGDSBgZqKk/tGQdifiw5iSqy3tMjqeZFqndYYvz9jm3uTpPVYeum
	8KoWTD9InhUCZmi2WRXxa7HyikRc6TGTyEU8OxFUHb3bC5aA7fRtWKm79mZsT/b1RkI3USIVhs1k5
	UQwgYhRy4DSAxsbIwY9tutYQWXxe+5e37byjW0HnHJUbr+ESpOmhwH5/bDsuf+m8nNUDMzTySXCx7
	1L6SAs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oH-0000000An2D-0nJg;
	Fri, 26 Jun 2026 08:21:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oF-0000000An0H-1hx5;
	Fri, 26 Jun 2026 08:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FE59600AE;
	Fri, 26 Jun 2026 08:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1993C1F00A3A;
	Fri, 26 Jun 2026 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462070;
	bh=mKdovRIrKfyxu635TzziBG37YLmIxh49GjmLAgAIHUg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oEW0CG/94G+fLSDLCrwsou32pQbWB6aRMjW87zHUXlLuzZy/K+I1NDQCu52QeCv+N
	 0TPRnMW9bKrWxlzErKoh6Ecg83BOIz34dfafwUDpyS4WrAIzV9XM9DaMzJmeazcnfe
	 gUXg2/NLVqviD9vIVFfepRpzSJ8k4Nn7zXmbkbKknP3/7bUrWk6ngWdpkmPqFQAU0z
	 I5gzfoLdLWMLSFKa5DFSxK35JX+mSj0pTwSe4jpHtdfI5zxX7n7EX7oYXx7eVo+Q8E
	 lmzcE1dniK06SAVV710pZ1FtvT+xV0UEHP2v9FGQvH7XiEITgiIpEdibHF3Xr4Hjoy
	 cbujCc5RGAtIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5697639389E8;
	Fri, 26 Jun 2026 08:20:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/6] power: Use named initializers for
 platform_device_id
 arrays
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205698.3816447.10450599511697138681.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:56 +0000
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29_=3Cu=2Ekleine-koenig?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, sre@kernel.org, visitorckw@gmail.com,
 bleung@chromium.org, groeck@chromium.org, linux@weissschuh.net,
 krzk@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 hansg@kernel.org, m.szyprowski@samsung.com, sebastian.krzyszkowiak@puri.sm,
 kernel@puri.sm, dlan@kernel.org, andreas@kemnade.info,
 mazziesaccount@gmail.com, sven@kernel.org, j@jannau.net, neal@gompa.dev,
 amitsd@google.com, samkay014@gmail.com, spacemit@lists.linux.dev,
 asahi@lists.linux.dev, imx@lists.linux.dev, wens@kernel.org
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

This patch was applied to riscv/linux.git (fixes)
by Sebastian Reichel <sebastian.reichel@collabora.com>:

On Fri, 29 May 2026 12:18:15 +0200 you wrote:
> Hello,
> 
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> [...]

Here is the summary with links:
  - [v1,4/6] power: Use named initializers for platform_device_id arrays
    https://git.kernel.org/riscv/c/e28f7498dd81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



