Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKyRPMGxBhZU9sMrN+qGSV4EIXXEDHgkSTG5S4UPUuE=; b=L1BjiHcWvSHx7Jho/IIk+qUq62
	InJP8CHVTTddvwcxJVJzydL8mAuHiAELZl5eiFmY1bTGBnQSmYmU4/fUd6Ytw+pPU4wKw/1wwxo+S
	iT53Zg0KbcuRWNl5unRs/b7r+XmGZpha5qTSJfk0k4SB6IMIeb+DTwXhrvwcxIdp6w3vvGaRI0ypF
	LyBUI63FEMTsudE+82qjmp5BBoEGNjk9GXytQO5iWgGQrATUOGq9uxND80lzqViYmSpf7Hb+yd4mi
	PtWMPMWVVsPz6uOJ5tdioJZm+AihrCm5YG8+WSE1ZwfWFleX3Dy6nfCmTBAdLECkVgGZhXDiPbe58
	MYEgeL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45kU-0000000ATSg-3Qmw;
	Wed, 09 Sep 2026 00:01:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45kR-0000000ATSZ-0Xaw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:01:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB70643C29;
	Wed,  9 Sep 2026 00:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F21F00A3A;
	Wed,  9 Sep 2026 00:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912065;
	bh=SKyRPMGxBhZU9sMrN+qGSV4EIXXEDHgkSTG5S4UPUuE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K5kJ9674uURCrsuhlpa6HvhkM3ayuWCgOwmrbgTY9eJoWyqhT9ODkEihqZ9yAVJ1i
	 1RSYFdpY714ai9c3R0DEcp2f7bVpUeHLSB1B9hQKyFKCPdYsi0OftPOJqkrzIPwEXa
	 rF8KDKo1aibdPeMQsCXgB6457xSDSaSyvDwwvIAa7TETCZMfTzG3j+nxTthu0I8pX7
	 UhWDsxYsqVsiPDxvv4ubYD8i0SMOSL3N8obD53Jo1Yd43aJ2CVBuJKCfS+CxgKCeh0
	 YxZjW410Dst31wMWAvVVy81Db8oTzVb5AnWQGONPudyWfHXfo7SbmAXz47xNruj8mm
	 +4DLWkL9L8HVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 624A9380820D;
	Wed,  9 Sep 2026 00:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv3 net] net: ll_temac: Return actual error from
 of_get_mac_address()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178891200414.71040.17612268760920600379.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 00:00:04 +0000
References: <20260903213241.1040204-1-rosenp@gmail.com>
In-Reply-To: <20260903213241.1040204-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Thu,  3 Sep 2026 14:32:41 -0700 you wrote:
> When of_get_mac_address() fails, return the actual error code (rc)
> instead of the hardcoded -ENODEV. This preserves the original error
> information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
> and helps callers handle the failure appropriately.
> 
> Use dev_err_probe() to avoid printing an extra error message in case of
> -EPROBE_DEFER.
> 
> [...]

Here is the summary with links:
  - [PATCHv3,net] net: ll_temac: Return actual error from of_get_mac_address()
    https://git.kernel.org/netdev/net-next/c/3d80284b244e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



