Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBiNzngweTlvRpfY+thWwfGL9VYxxczr7Qvh/TNwJuA=; b=yU0KQZqUcxKpapaR0BZglfyuxc
	j1IRYLLr4n2J1O6IS7K8GbUCwkwuIAzfvpVngPbxOaP9OKNoDYNGJuH/d1W/ybmcWm2cFKG0fFOck
	ejG6LrfeTpn6AVtKg8p8JIktmF9dsQXnMc0ZT/Ia3Hfo9JnsAYBAsONMX7h2cZi8/yA6FWG5uBarW
	Sfd4QdtscEH6Oy6F/7rMNNquh92zo5xZzLwU/R5ntjdYf47nyQm4cNWbWY2aJ6xVCkRXGjQXz7H5q
	PMWEFayrtcAqy2ssBuJOqLhQnGM0CzHKs0NPGst/X0JLdOywbPz9UQ+qoFktGgZLmnLgD8TfVoljP
	HGEV9uxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAko-0000000Bh87-3dIe;
	Wed, 10 Sep 2025 02:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAkn-0000000Bh7w-1tvp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B776023B;
	Wed, 10 Sep 2025 02:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0CBC4CEF4;
	Wed, 10 Sep 2025 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757472012;
	bh=nZR1dALMHbgyKK0AcfI3cwQlZU/usFmgnkGpJdsY+VY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jNNYJenb6kLy4W+zjOyyxLdIhcU9HLhymCSwGuibjRkXSPspqS2H/lq//IBjA2oV3
	 e3fjw2bf1FtolwO/SC9+X5JG0s8sR78WdTmeeduKCn271/oLfDGyz/ALWOruAIs4DB
	 Lp1s4I7TA0pkGg/Kwco8Ft55oz4Y9Tx4+OCEqZCo80t2ZxWQrQK9vAq/Y11PcGbHqQ
	 Z3eI6di0eZCReRSKOOm58LB4umiQWPO82O/elfVYMEUrCMmE0I28h3ivd1nQpg4XQ4
	 QoPHIl6ooVNFSB4SW340+x19ofkmzBxTqNvrPPhyI6SICKMvmRYIdbyV28wOyUo1xd
	 JCr05fb+oO9Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB6383BF69;
	Wed, 10 Sep 2025 02:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/3] ptp: add pulse signal loopback support
 for
 debugging
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175747201550.884239.5015453227972787708.git-patchwork-notify@kernel.org>
Date: Wed, 10 Sep 2025 02:40:15 +0000
References: <20250905030711.1509648-1-wei.fang@nxp.com>
In-Reply-To: <20250905030711.1509648-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, Frank.Li@nxp.com,
 yangbo.lu@nxp.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
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

On Fri,  5 Sep 2025 11:07:08 +0800 you wrote:
> Some PTP devices support looping back the periodic pulse signal for
> debugging. For example, the PTP device of QorIQ platform and the NETC v4
> Timer has the ability to loop back the pulse signal and record the extts
> events for the loopback signal. So we can make sure that the pulse
> intervals and their phase alignment are correct from the perspective of
> the emitting PHC's time base. In addition, we can use this loopback
> feature as a built-in extts event generator when we have no external
> equipment which does that. Therefore, add the generic debugfs interfaces
> to the ptp_clock driver. The first two patch are separated from the
> previous patch set [1]. The third patch is new added.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/3] ptp: add debugfs interfaces to loop back the periodic output signal
    https://git.kernel.org/netdev/net-next/c/e096a7cc0be1
  - [v2,net-next,2/3] ptp: netc: add the periodic output signal loopback support
    https://git.kernel.org/netdev/net-next/c/67ac836373f4
  - [v2,net-next,3/3] ptp: qoriq: convert to use generic interfaces to set loopback mode
    https://git.kernel.org/netdev/net-next/c/f3164840a136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



