Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FF5C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t267H+Xjy70DfN6XTLGNuJg/rzEU4tIA4A29SQzOONw=; b=1CZVut7yS3ZUTnEljUMR70EIfN
	gvj8NAlkodoBU5JTA0kz0SwtXSF806wtC5kPpK2NVcQE52UhbBCdPgeZCsXRbPt6g47C+XHWLZZnK
	zhLv850/O9qNBJu0LKk5eZXnHLGgk3mBg2GxID0gr6+bIzy+DdIKKjTS5iWDPqHtE2hHfwKXwkejx
	CkgXUQUlPD6wznqSeFo+claYIaZvyoh9bBZxIeMu1aaHNkzUkPZoCd10Au4dqt6GUHtTFem348klz
	4GxbyUTv+A5RVtr6g0uySo7whuXRtwMKLnbHFxoBNzy2tEfwBvFBdyPyiE5HeQpfQ81FWm7iSZGrb
	/I5f03uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mCF-0000000BaS1-2pOw;
	Thu, 24 Sep 2026 16:21:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mCE-0000000BaRO-0EqW;
	Thu, 24 Sep 2026 16:21:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68DFB601EF;
	Thu, 24 Sep 2026 16:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3C01F000FF;
	Thu, 24 Sep 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266877;
	bh=t267H+Xjy70DfN6XTLGNuJg/rzEU4tIA4A29SQzOONw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WlVAKJYUG2h2BEfgMlJvmLiLOXQULaKIAFv1ri2EAsxSqRkwzMrkypjDnGgKtaDdT
	 9eads90jWb6XOqr7Rt6VszN70xqoKPgdhLqs4EH7MV2J3ylXX1geSBfc/umwtqPfOs
	 F10Z8t+TIkFACe5weI3TTYGU5kpeNH5vUbM9MEgOXYAZ98ixZ+pVBKWGlZm3pLkqlf
	 CpOBNXHuPO84rKfj+nTuf5M0B0zfFfe9A4Q6ULM34yyelRjYXOWRypObeRoT0gVg91
	 KyMEzF9mpxC/D2G5CIqskRoeNAU5rI+r/4aGRDuB7sByBDileFaS3svttqPMcxRA8z
	 ptS/ABXK6R8CA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5692F3A566CE;
	Thu, 24 Sep 2026 16:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix two crashes on driver
 unbind
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179026680615.1636687.12670916217033906178.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 16:20:06 +0000
References: <20260918015020.2518315-1-f@lex.la>
In-Reply-To: <20260918015020.2518315-1-f@lex.la>
To: Aleksei Sviridkin <f@lex.la>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 andrew@lunn.ch, olteanv@gmail.com, gerg@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Sep 2026 04:50:18 +0300 you wrote:
> Unbinding the MT7530 driver from an MT7531 dereferences NULL in
> regulator_disable(). On a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44):
> 
>   # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
> 
> oopses there, and the build it was found on sets CONFIG_PANIC_ON_OOPS, so
> the board goes down with it. Fix that and the same command gets as far as
> mt7530_remove_common(), which disposes interrupt mappings the switch's own
> regmap-irq chip still owns; the regmap-irq thread then faults in
> handle_nested_irq() later in the same teardown. rmmod reaches both, since
> mdio_module_driver() calls .remove on module exit.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
    https://git.kernel.org/netdev/net/c/c2cdef41e0b4
  - [net,v2,2/2] net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq
    https://git.kernel.org/netdev/net/c/0d80ba0a204c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



