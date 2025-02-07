Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6416C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSCcx6zEWqZS3mmBUm4FWFtzCHOSUlu1kduPG3MBIwE=; b=suSeKQtiup9QpNIuytkbRG7S+k
	ptDSdE8HjkU3OqqwgRwOv+3rODVJVFa1HfnVRKZWfssF1EtE30GdzQRnbZR2YiaWuujkb7UuZIlW7
	bKWeA+5NrD1MLK9S9Bsh+Vzk8+GCadwIKZBdVjRzvJiZQCV+NLY7ghtyICHJz/wZx/QfhxjYvGR80
	y6erhaNGukyw3kkF8h6WNXPXjHadCqZTrjEidumPrR9jFDZtvICHFdRnFam2MiXqH8i3r8D4fwnyu
	OSiR7c5oy+fN2DwmccAj05zCx3H+W1KZCC4lW7FUUFMMSJmPmC4cKSp4WMPD41o1YfyohxtxIaJQC
	ft1c+w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOlc-00000009iss-2dvo;
	Fri, 07 Feb 2025 13:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOkD-00000009idl-25r2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E21715C5D64;
	Fri,  7 Feb 2025 13:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E9FC4CED1;
	Fri,  7 Feb 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936208;
	bh=wTtl5yJ8SjYiIxrTRTttS85uraz4y2R/n0v+mo941ls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B+vOcqO+5ZsH5kpNEe1fCWSSclq4+rOI7n4L+pVZWLuBRvAQkNBcHDjngccsWITGB
	 xSHq/0zB7wOHAdKBGeMZm1j3wDBplMqYddIEG+j9R2JSJ6OXz4bVhlJFODvozVy2vW
	 2iTJUXi+i4j6c4hp0UUqrHirYRllKEmdZsc4F+FtHxZx89HuFMtLDu1NMzCDcL3B0R
	 rHw8qtyKC5bXPyFArICs3JfCVa8vXY3RueTYapxhLhJy3U39nAuS00C1+Dc3HaiZeX
	 TywTaaeA4p8ah+t60i+QguHPmOxZ80BV3bRh6D/YZwqi8TGtc1n6Dm08oAJ9jpJ//e
	 idS7DXhsYAbTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E57380AAF2;
	Fri,  7 Feb 2025 13:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] Add of_get_available_child_by_name()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173893623629.2244005.12944730869712078303.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 13:50:36 +0000
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: robh@kernel.org, saravanak@google.com, matthias.bgg@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew@lunn.ch, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, geert+renesas@glider.be,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.au@gmail.com,
 linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_055009_577373_802B238D 
X-CRM114-Status: GOOD (  12.67  )
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
by David S. Miller <davem@davemloft.net>:

On Wed,  5 Feb 2025 12:42:20 +0000 you wrote:
> There are lot of net drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
> 
> v1->v2:
>  * Make it as a series as per [1] to cover the dependency.
>  * Added Rb tag from Rob for patch#1 and this patch can be merged through
>    net as it is the main user.
>  * Updated all the patches with patch suffix net-next
>  * Dropped _free() usage.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] of: base: Add of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/8d3bbe4355ad
  - [net-next,v2,2/7] net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/46df19a8dfdf
  - [net-next,v2,3/7] net: dsa: sja1105: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/a76568865c15
  - [net-next,v2,4/7] net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/876e52b2d3f4
  - [net-next,v2,5/7] net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/1364004b5b91
  - [net-next,v2,6/7] net: ethernet: actions: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/76c82eb04332
  - [net-next,v2,7/7] net: ibm: emac: Use of_get_available_child_by_name()
    https://git.kernel.org/netdev/net-next/c/0584a917a209

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



