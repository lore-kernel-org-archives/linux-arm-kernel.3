Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B91C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 01:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/vaUN8SadathI4jxOqi9n01Wg4n5ht8CeaibvOt1Yc=; b=dReMlcWQ/5oEEuBtWvsUUJz8YI
	qVllQF63psS9iylZ3Q5cZPMefoKU3V6gl7AHGgpcsweU3uILsEMKRobUiCHAYIAceya/1QVhT2c5B
	QJACxKZCdSJQjWNs4Yma7hfx+i+SdItkhZDWOzxlN6jW+0qjnCzjfCg4f8HwgOwBR0GpIvrEs1SIT
	vfXFy3ZJYlfKLppSjm3TjoclfEfCclJaucrqgBL2QMeaOGonzgDMJ2OrbLCRGRTs7rAVvHyyqbH6I
	uNmfTuRdf6I7THpMQx+SZuNhHbvxBoTYJF1yt2UZCy4MDd/9xcyOfnjl0pfpikD5XyIcz6/kWP2di
	tokfSnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kD1-00000007sMo-1b8S;
	Tue, 08 Sep 2026 01:01:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kD0-00000007sMi-3RQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 01:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F00E960514;
	Tue,  8 Sep 2026 01:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44221F00A3A;
	Tue,  8 Sep 2026 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788829269;
	bh=p/vaUN8SadathI4jxOqi9n01Wg4n5ht8CeaibvOt1Yc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FbOhjWh/uyfcH8rCLz35B6S2j1ujViyXvAhKHCazfMayH3mvq1dqXf2KStEE4BRsT
	 WT1i+o14Dxi9an7haIBCsnBGkIVCEUDT4M7JBMCPR83FJRu/b89ZcDQBs+j/5ahrvy
	 pfkJOSFUrhQCURUh8zpyMsXLNWzptGAlSf/8Q1NyRBXYsylYASglaEKnan/pHX/tW7
	 jgNkDwPJewrunvDc8l8qwtGxQoh1Q75vUnMM/CbGWUjqMaZAdrEZd8tXi9Zv2kJris
	 kRXQDIzPDFSUDnbhNsLj+vcLFsAKOv5vqJ8GSwY5XftmBwiSm3+aU6ShzzMvJF0mnT
	 5i6SiXoeNCPDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B6339E8A5D;
	Tue,  8 Sep 2026 01:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: cortina: fix typo "trigged" in comment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178882920839.3227186.17273676298075009873.git-patchwork-notify@kernel.org>
Date: Tue, 08 Sep 2026 01:00:08 +0000
References: <20260904115917.13695-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904115917.13695-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: ulli.kroll@googlemail.com, linusw@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
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

On Fri,  4 Sep 2026 17:29:16 +0530 you wrote:
> Correct "trigged" to "triggered", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: cortina: fix typo "trigged" in comment
    https://git.kernel.org/netdev/net-next/c/fde5a8bc4cc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



