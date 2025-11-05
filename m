Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C5ACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK5qhSMo/Yk7LtpjNBFCbURuWrry0m0PwFrgkfyUkJg=; b=roCPmgjruXncqTLr9JlCPYrfzd
	PCq+fzpbIMzzSVXJcKd2jCuCatch181kFUmWKAxTU9KW0ET0hI8gWxfSeqyaTSMf8Sozpag1IQGv5
	zpV1Ltas08PE5XYh1XX3fHvOta3kpxLv/20dJ8M0qQHquRSRGVZdaWj/qyijP+y5PVTDigCDCpDd0
	6k7qeaZCsiqi59ogpsXdjUJ1fndhjUTGKV6spbIAosrbYloaHpp3/zw6eKe6oNJsT2lu05YVTReOP
	sXOqmrBe710TW2a+0HgS6oLLmUAzWL8QXJU8mxp5wLwFF0GlxfhitydcqrFaa+vNDNeHVmRk3wuAF
	S8jasCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSfc-0000000Cs0Y-2Cn0;
	Wed, 05 Nov 2025 01:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGSfa-0000000Crzn-304M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D17FE60214;
	Wed,  5 Nov 2025 01:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDBFC116D0;
	Wed,  5 Nov 2025 01:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762307441;
	bh=0mBzBlQwXGorXEifmZTWdlG1jyZb8jX7hEwudc0iRy0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MMZC1xobgMxy5ev5wYjvRtCg+5fqajpoI+e3k4ccnwvdAznnPQSi9xx6pRoWzydFY
	 q4C6nB8UyjhgF2hW5+R7y/ySmNuXpgyWQ7RsLwj6MFeQ/ruUrCoIQGdjFUrflwiTCq
	 o/kKkuZFTPZ0LXMHGUhxJ9aAIzXQn53ai2WlOvDkk/0+ZlxdNWMLhPpmnXWB87J6N4
	 75lm0mi9Ie4DD+a6tr5mzZAYHA9kJv80i7tkxJmoEnvZHRkpckqPKhFSPTCYUrkypv
	 eQKEnPYuRXFSBFjrIOVhX3ryA8BUXY7hI/s2MKeb6OANCROH/s1slWdJTqaanbcUlt
	 0yc66AYpHp96A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DD3380AA54;
	Wed,  5 Nov 2025 01:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] convert drivers to use ndo_hwtstamp
 callbacks
 part 3
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176230741525.3056420.8097169930615597775.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 01:50:15 +0000
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
In-Reply-To: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: manishc@marvell.com, marco.crivellari@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 sgoutham@marvell.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 vladimir.oltean@nxp.com, horms@kernel.org, jacob.e.keller@intel.com,
 kory.maincent@bootlin.com, linux-arm-kernel@lists.infradead.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  3 Nov 2025 15:09:45 +0000 you wrote:
> This patchset converts the rest of ethernet drivers to use ndo callbacks
> instead ioctl to configure and report time stamping. The drivers in part
> 3 originally implemented only SIOCSHWTSTAMP command, but converted to
> also provide configuration back to users.
> 
> v1 -> v2:
> - avoid changing logic in phc_gbe driver for HWTSTAMP_FILTER_PTP_V1_L4_SYNC
>   case
> - nit fixing in patch 4 wording
> - collect review tags
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] bnx2x: convert to use ndo_hwtstamp callbacks
    (no matching commit)
  - [net-next,v2,2/7] net: liquidio: convert to use ndo_hwtstamp callbacks
    https://git.kernel.org/netdev/net-next/c/2b3844754881
  - [net-next,v2,3/7] net: liquidio_vf: convert to use ndo_hwtstamp callbacks
    https://git.kernel.org/netdev/net-next/c/94037a0e18e3
  - [net-next,v2,4/7] net: octeon: mgmt: convert to use ndo_hwtstamp callbacks
    https://git.kernel.org/netdev/net-next/c/72c35e3a9589
  - [net-next,v2,5/7] net: thunderx: convert to use ndo_hwtstamp callbacks
    https://git.kernel.org/netdev/net-next/c/a23d0486d05a
  - [net-next,v2,6/7] net: pch_gbe: convert to use ndo_hwtstamp callbacks
    https://git.kernel.org/netdev/net-next/c/d8fdc7069474
  - [net-next,v2,7/7] qede: convert to use ndo_hwtstamp callbacks
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



