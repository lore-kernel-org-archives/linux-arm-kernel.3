Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330CAFB5EA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/hi+1wOJKjw3OT5uL/YSPKmwx8B8rRMe9EtYtzbU84=; b=tGaL2noc4MZAT7ENfK8jA6MLir
	F2JWZi/qTtXLswneHhxNxsuSRsweTbutuzS9YusenJowsxcV5bxFaRmZ2TXnviBTZoVas6wrFxDo7
	gqrkikWsjdj34RAJokDgjtHI//YgnEWmyOy7EEcnhDEMpC2dcCAza/LobyZHxFHbfB1jOpKUmJfh9
	HXxTQEB3Yg/4CzIkA1DwW0iL/xWtJwMnbk3TmUta00S/BIQe1Tnis0zqfHEs/xRMztBaEEmhD1exi
	v1zjBDonDo8sVcWCDjAVbaK+okjsU7ilD902ZMsznen2TE8EJn/5uhup/M7qSwqGUrsdc6alKPxI2
	X6I/ro3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KCJ-00000005Fe5-1xXl;
	Tue, 17 Mar 2026 02:30:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KCG-00000005Fdd-24ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 02:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8383240D79;
	Tue, 17 Mar 2026 02:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AAEC19421;
	Tue, 17 Mar 2026 02:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773714615;
	bh=HFGrF+WKuDD37BuJkejevChhMrqJNM8P9feyiAuFfx0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gcJz9kF7PPiFyYYfZ4gPGuHZ96t2EEYgo6V7GUsvUQEqp83IUAB31+hsycHHO0bgg
	 iS5BXXKjAfz8gZOv3cqnuKMrCrMPUncgrZuffaKYhbgOqw5c+vMiq3x4X1FFKlWd7+
	 /Ag2HJ076IkyB8mzzK2xxd4ZBTo/CFEcAv4eLREerqQRXD6EMHvP0ywyj2o0TVqA3l
	 Pfjkk1RJmWgJhfiFixaAH0eBlZD/LCZCnUmXH4YZWBqeNNnNXJy4zJq7wVEM2SxVi6
	 CXfXKXQO4UbiVTJ0WBwWZC+W3Ydt2QHO4jB5cVpnpywbDMtCMhKSXgCH3YukKXP7IR
	 CE7lmAjOIRlIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDC33808200;
	Tue, 17 Mar 2026 02:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add HSR multicast FDB
 port
 membership management
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177371460779.3397946.14299476389534020900.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 02:30:07 +0000
References: <20260311082923.2962937-1-danishanwar@ti.com>
In-Reply-To: <20260311082923.2962937-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 jacob.e.keller@intel.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_193016_555196_AE2B53EB 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Wed, 11 Mar 2026 13:59:23 +0530 you wrote:
> In HSR offload mode, multicast addresses can be added via HSR master
> (hsr0) or directly to slave ports (eth1/eth2). The FDB must track port
> membership: P0 (0x1) for HSR master, P1 (0x2) for slave port 1, and P2
> (0x4) for slave port 2. When the same address is added from multiple
> paths, memberships must accumulate.
> 
> Implement a hybrid approach using __dev_mc_sync() callbacks to track
> basic add/delete operations, checking netdev_hw_addr->synced to
> distinguish HSR-synced addresses from direct additions. Post-process
> to handle overlapping memberships by checking refcount:
> - refcount=2 with synced=1: HSR only (P0)
> - refcount>=3 with synced=1: HSR + direct (P0|P1/P2)
> - synced=0 with P0 set: HSR removed, clean up orphaned P0
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ti: icssg-prueth: Add HSR multicast FDB port membership management
    https://git.kernel.org/netdev/net-next/c/45339c237c6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



