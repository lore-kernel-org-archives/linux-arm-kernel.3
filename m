Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79851C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 01:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t25KLZUD0gouXQLg7Qsiw+f8g8Wgkoy5xOG4RRabM4I=; b=CbDoxcZ5wEtDpPQJljCRbSYE8q
	jKkSjHr+6x3s+f8fhxJe8n+z6QyztVl3cFJy/W5Zz8iDNWUv6NUVWxZYnzwCRr8BtPAX4nsMCChts
	48YmvLkV3+H4r7+3RHwp/Gg/kFSf/uVvxT8Y3Cv/+s/OBYpOyaX/jH5Rk8ki6k3nTvxrKZ4OHtLm9
	y+lfGnZVrtKqHrPE189H/mtiZxghBIlk0Ve0dR16uguWMujnbjNaKiuHZaEUVMnebu+NyJ5E2xnHU
	ZYl6ZnWezgiXZ/1lfbxRGKXGU8uASEUUeVdTqt93geD92CK9qShyZLc6YHtgAl7G7Hg2CCjBohMtl
	5HC2VWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqHM-0000000H77o-1Fvg;
	Thu, 08 May 2025 01:42:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqF6-0000000H6qJ-3Vl4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 01:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C96F95C5F89;
	Thu,  8 May 2025 01:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC805C4CEE2;
	Thu,  8 May 2025 01:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746668407;
	bh=SYSL3CqLFqQ5L+DAxnRJM/O+kSR8EiapwRLyicH6VJI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZBTeVlVGdT9P1cL+mzAyNaKZAC5hHkaW0XkUsRMAZepSRIgKzAUIV/+sRpcmqfgfQ
	 kjbwLy8dDg7AunLxf2e19es2T/cZkmdMIbphdCiBjPYO4qZ5eJbT55dapzwyZ5tjs8
	 sQM7JWW4TDCvDN4BDJ4IKbVSGX5spb/U146lzc7yAk+nj7/L0VpnvCTXt/NiDXwCoo
	 JsPIIJB++5W2+mtgfzwc7k9QAJ/aYvnLX1jr1HnPj73ZOlN+qoLXjMgdAuQHUG8xyh
	 4juP/fa0VRfhc+akGXr5V2A4pviXNj7GRkPVRjsTD2zp9ZK46/Um7jcRXno65eoXGa
	 hrKldZYlQ0Nfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCD9380AA70;
	Thu,  8 May 2025 01:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/3] Bug fixes from XDP patch series
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174666844624.2418694.14482147133138763410.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 01:40:46 +0000
References: <20250506110546.4065715-1-m-malladi@ti.com>
In-Reply-To: <20250506110546.4065715-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: namcao@linutronix.de, horms@kernel.org, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 vigneshr@ti.com, rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_184008_945376_6BB1DD6C 
X-CRM114-Status: UNSURE (   9.08  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 6 May 2025 16:35:43 +0530 you wrote:
> This patch series fixes the bugs introduced while adding
> xdp support in the icssg driver, and were reproduced while
> running xdp-trafficgen to generate xdp traffic on icssg interfaces.
> 
> v1: https://lore.kernel.org/all/20250428120459.244525-1-m-malladi@ti.com/
> 
> Meghana Malladi (3):
>   net: ti: icssg-prueth: Set XDP feature flags for ndev
>   net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue
>     access
>   net: ti: icssg-prueth: Report BQL before sending XDP packets
> 
> [...]

Here is the summary with links:
  - [net,v2,1/3] net: ti: icssg-prueth: Set XDP feature flags for ndev
    https://git.kernel.org/netdev/net/c/e5641daa0ea1
  - [net,v2,2/3] net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue access
    https://git.kernel.org/netdev/net/c/8b3fae3e2376
  - [net,v2,3/3] net: ti: icssg-prueth: Report BQL before sending XDP packets
    https://git.kernel.org/netdev/net/c/1884fc85ae6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



