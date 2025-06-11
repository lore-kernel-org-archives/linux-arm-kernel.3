Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D3CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 01:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo3yz5BMjYfj9ce62hhtEcdA5mP1hurGDFjgZa6yn1s=; b=X0wMXqpF9CjHEM44Jg+wxyiXSq
	r5beE+FrfRbWpiNSWChWj1t6krDVCka9fhJiRZpSVtEstwZ20zM0X55wjtJbQn1tK4n1QufenmGTE
	x0R/hmGMHjkMY2F/WitvkUlkZEDr4qA+UUNdzGnp7SAFri1OyAHFIhdGYPM0BR6nALeoP+DcEJMIF
	sWemShSYRDDAxN71zNCILeLm2QkVO6YJFSZ5w5uOTII3OcvnnF1DsDrj5bOlzRgLJhaAsy94MzsOB
	eZOWw+dOghdrS0BrkY2L0+eXlE5puK3ZxPl719n0HqetnSSRGO6YxLtsnOaOVQkjiNM80TqsbFZtI
	O+CiVLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPATl-00000008Zr2-1GQo;
	Wed, 11 Jun 2025 01:42:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPARb-00000008ZfN-1z32;
	Wed, 11 Jun 2025 01:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1EA8A50602;
	Wed, 11 Jun 2025 01:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D63C4CEED;
	Wed, 11 Jun 2025 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749605998;
	bh=Bz/sRXFpQ7lHFcfA2/bnaSMfCYG5l2KB657imddWrI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=myqnKGag/LJhx2LvkFJDig+Cf+l5GwrhxfKe0nV5YzDPDazlGq0xQH6pCfy/t5y3o
	 aT2fWpLH7ea2EQQNONG1CMpgr9u/fYoa2liCVT1LcAHHNHb0TQgE5oVHW09edg/JVP
	 jRzKoO3CpLrCBbYWkI3pwDkHufByhZgiYrHN4G8paA7BFpBEc/6xB8s/aUbhL6ldxD
	 WsrUvVqdcOyR3VmjRrQLD9LsbcmpMsIn7O40ZxqzYPWLSZrFbvh5srQLNoeaWRj5b3
	 Zxvc/xXUWp9CM6AARACIYe8NuZ4VE2K0kFKpPBKOTsAuj98anpOBGiBtmmteR7155p
	 sp96SBwi1yO6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE1E39D6540;
	Wed, 11 Jun 2025 01:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Enable RX queues 16-31
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174960602875.2765583.13701311047518290024.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 01:40:28 +0000
References: <20250609-aioha-fix-rx-queue-mask-v1-1-f33706a06fa2@kernel.org>
In-Reply-To: <20250609-aioha-fix-rx-queue-mask-v1-1-f33706a06fa2@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_183959_577189_87B6F0B1 
X-CRM114-Status: UNSURE (   9.40  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Jun 2025 22:40:35 +0200 you wrote:
> Fix RX_DONE_INT_MASK definition in order to enable RX queues 16-31.
> 
> Fixes: f252493e18353 ("net: airoha: Enable multiple IRQ lines support in airoha_eth driver.")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_regs.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Enable RX queues 16-31
    https://git.kernel.org/netdev/net/c/f478d68b6533

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



