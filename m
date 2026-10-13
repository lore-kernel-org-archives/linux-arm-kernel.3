Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B36CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp4AwVfLQNcSfDsteZE+KsaLnuHbio1WLfcumtJEKNM=; b=gAXKLkwlPSYl/fpvfxl+aELJf3
	bvKuchmGt6nNIX+drm7FYIF1YTQGTU148rN5jJVladKN8JsXSCDCzDKSk6ln6es0FCUXpd0XktUjn
	rI51i5rtYZTAIcVLIablMvOg631U9tt6FumPj/POCfo2Zwhrv+RsO5yqeUR1N0YSDFB6J4ynsat9Z
	5VdT/xtTRzd1XrpyVoDHLw+CKIYk5c1X+k7eIjveJpk8tF89nkHrefFVgMiSq+Ffxgp8zjQ9olBtc
	cKWVkDBfzUdTpL6cCe+oJBAKfzfRzWW8MASeAS8WMpogCnNMRXN2mEk6pFp2RuakIzt7ax+5F4Eim
	n+nk4HLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaHP-0000000Ces7-1Eon;
	Tue, 13 Oct 2026 11:02:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaHO-0000000Ces1-3geu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:02:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 522B360261;
	Tue, 13 Oct 2026 11:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AA61F000FF;
	Tue, 13 Oct 2026 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889366;
	bh=Gp4AwVfLQNcSfDsteZE+KsaLnuHbio1WLfcumtJEKNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QQtJxEXWiiQ/CNuHogiyN2CqBayIUDzgoAtsrG+cMuPNl4tDUX4mKTeOO+ZHSxYax
	 upV6klH4AZRB23oJhOTJMr0ArBq2RVTenNqvxs2sK34GPuI+phIBBB/wF/+bfHwUiy
	 hcSMhESPnA2XHlHLQBaK1f0+4F2Bu+flk04Netm0r4ZghCz51HMPY3ol3pFZtpYssF
	 pEipITuIOa46VE2DidJcyOOqRcaBMJZ86m78JLrwfSvaMMIsB1lThzKi8uC7aS5FID
	 uCmY9rDWaYOqfMlM8SBx75byDyoI6Qw8YO8iyc3yFFX5lK3ZoO24JlPtT+8/ayPiNs
	 nKDUXKB3RUsQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F19853927051;
	Tue, 13 Oct 2026 11:02:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: ptp: switch to gettimex64()
 interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179188936464.222572.15666839095638245831.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 11:02:44 +0000
References: <20261008103809.1848255-1-jjc@jclark.com>
In-Reply-To: <20261008103809.1848255-1-jjc@jclark.com>
To: James Clark <jjc@jclark.com>
Cc: maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 mlichvar@redhat.com, nb@tipi-net.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  8 Oct 2026 17:38:09 +0700 you wrote:
> The stmmac PTP support currently implements the gettime64 callback to
> retrieve the hardware clock time. Update the implementation to provide
> the gettimex64 callback instead, adding support for the
> PTP_SYS_OFFSET_EXTENDED ioctl.
> 
> The system clock readings are taken around the read of the nanoseconds
> register in get_systime(), so get_systime() gains a ptp_system_timestamp
> argument.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: ptp: switch to gettimex64() interface
    https://git.kernel.org/netdev/net-next/c/d7804253678e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



