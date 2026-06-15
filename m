Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59468CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzzZkl0ITKGF+e89UCTNrQ3QOTm2s+mNTX72P5uC134=; b=j6k9zXYvUHRm/bhx5Ry67fiMoD
	v4nzd710uvZkSRMFktAbOpv95c2FJipZDd9HVtK0u99Nz+Y8RibNKFXyVW+sJ3uONVkeZmt6ci8o7
	M6CPJWxFclySYntadtwxBy5YSsitMXHSOSbruqP6JbhmaEG7LBPTBX5mHkQy92L7bYMIiixaxBCWC
	SHuNcNFp1yOj58GeB7Zn7pl2jXd2bgy4YvRd/S7iXn7+GT56c4KL3EiJziAZtB5ZC4raGoaneOoMW
	ayFCdnlPifXYuKBdCBkjkFAftC0UM/hQF2ADUqAxBDNijxYDTQkkI/m1QLkaARmdWsoWRlca31Ro3
	xunIKO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGul-0000000ExWi-3MQQ;
	Mon, 15 Jun 2026 23:40:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGuk-0000000ExVz-38DB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:40:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31C14600AB;
	Mon, 15 Jun 2026 23:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67BD1F000E9;
	Mon, 15 Jun 2026 23:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566821;
	bh=WzzZkl0ITKGF+e89UCTNrQ3QOTm2s+mNTX72P5uC134=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AEoY0qeQ6ryZxCtIx8/jTZzyAqawRslLOub3uUTkYMX0kiicXnwmjkT+oK4NhxzGF
	 EQ7Clm9X03BRFRHtMMxlM12FqgogeM39l96olju/Cz3JSbq8H5FNB4szo83f3KRRmi
	 WN6VVVLB5Fhyabn0d/I+19gDZa5dP7kYodSIveQNLNuB+qkBgdk0BBbmfxAF2NsUOJ
	 hc77OMZA8O8rRqOM93gqmpdoz8C9v91aJxCYGRGVDmic4JX5fnlASBDdbMweeq4K9z
	 ordxeihikraCNS9LC7EHq/7Fp5KucgMJ0OMp4WF39JJpsxxH3u81TyBzcFpPNUxOy/
	 d08IJJQWk/7pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198093839A08;
	Mon, 15 Jun 2026 23:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/4] ICSSG XDP zero copy bug fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156681669.339383.12184092559832097375.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 23:40:16 +0000
References: <20260611185744.2498070-1-m-malladi@ti.com>
In-Reply-To: <20260611185744.2498070-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: diogo.ivo@siemens.com, haokexin@gmail.com, vadim.fedorenko@linux.dev,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
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

On Fri, 12 Jun 2026 00:27:40 +0530 you wrote:
> This patch series fixes bugs introduced while adding xdp
> zero copy support in the icssg driver.
> 
> Patch 1/4: Fix wakeup handling for Rx when available CPPI
> descriptor is zero
> Patch 2,3/4: Fix destination tag in CPPI descriptor to enable
> proper Tx xmit for HSR offload mode with XDP and zero copy
> Patch 4/4: Fix Tx copy wakeup handling for XDP zero copy
> 
> [...]

Here is the summary with links:
  - [net,1/4] net: ti: icssg-prueth: Fix AF_XDP fill ring alloc and wakeup condition
    https://git.kernel.org/netdev/net/c/dfb787f7d157
  - [net,2/4] net: ti: icssg: Use undirected TX tag for native XDP in HSR offload mode
    https://git.kernel.org/netdev/net/c/bcbf73d98195
  - [net,3/4] net: ti: icssg: Use undirected TX tag for XDP zero copy in HSR offload mode
    https://git.kernel.org/netdev/net/c/f9691288413c
  - [net,4/4] net: ti: icssg: Fix XSK zero copy TX during application wakeup
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



