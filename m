Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DBCD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHWbvWBXo6R1Y5mCluv+7BrQuPrDe+GNhFCSz7RUlBQ=; b=BHvJPYLGZzkVv90cg1+jQRxU3z
	jYP0mA2+QaC8LWuVaL11ModKFkpAx1D8DBKplI8crrdgc/ckfNJAOXxD8kctxUgIpwL2fIZZFFu6C
	HW6qFV0HV6g6UCoVLcKymiOEUS/fkK9TomTRuiHV+IBIuelBET2lfK7Lcm7diyPB3oDdqBfHj9amJ
	DEVCX3dGZMKskmfWViKy3ScVQHB5WQuP7DKtuJZpbiDjBkY8EExvOT0GpZc4G+nJEQEqYrkjhuxTv
	oTuF2wj+SiQo5OAbkVbVyepjj9nzXIZkcAr9KZ+h9YUqDbFvIJe1WSu93SHDTRpAqwMjXSuxCPHp5
	OuBvgmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoXV-0000000A9wp-3taa;
	Thu, 11 Jun 2026 23:10:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoXU-0000000A9wf-1bwL;
	Thu, 11 Jun 2026 23:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9FDC418EB;
	Thu, 11 Jun 2026 23:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB461F000E9;
	Thu, 11 Jun 2026 23:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781219419;
	bh=lHWbvWBXo6R1Y5mCluv+7BrQuPrDe+GNhFCSz7RUlBQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Yx6XtJEB2cfqU8yXrv58PyS2qBlGNOiiLiXQ5bu7EFZqcVAhY94sadaBoG2iStm6I
	 SpntSxesJy9xNHt/0F+F2JZwJj/hQ3X1lNIqubk5VV5XulUykAkJaCtqSe5qVjVnTg
	 kNaeLsx1VhO6tw3o8vT5/ZQ08C6HSa6u8DpYusKo1yKRHacibXsbkYXyYY0r8wBe50
	 dLgW8K/+8WWkL8gYQZtra9KS9D29/j5F29rID07V5sYUOuQRnw0sSA2GjnABRR8Ahx
	 +YPy1B0lvTb7c3F/0/KFhQAFNev4yG9XtCnafFOyG1b7DaIpC1zmZ3JvKflYW4TIiq
	 YpLEBxPh1BXqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198D03930FB3;
	Thu, 11 Jun 2026 23:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: simplify WAN device check in
 airoha_dev_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178121941663.401113.5124460643582532071.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 23:10:16 +0000
References: <20260610-airoha-eth-simplify-dev-init-v2-1-8f244e69b0d4@kernel.org>
In-Reply-To: <20260610-airoha-eth-simplify-dev-init-v2-1-8f244e69b0d4@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Wed, 10 Jun 2026 15:25:13 +0200 you wrote:
> airoha_register_gdm_devices() iterates eth->ports[] in order, so GDM2's
> netdev is always registered before GDM3/GDM4. This means the explicit
> check for eth->ports[1] && eth->ports[1]->devs[0] is a redundant
> special-case of what airoha_get_wan_gdm_dev() already covers, since
> GDM2 is always marked as WAN during its own ndo_init.
> Remove the redundant check and rely solely on airoha_get_wan_gdm_dev()
> which handles both the GDM2-present and GDM2-absent cases.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: simplify WAN device check in airoha_dev_init()
    https://git.kernel.org/netdev/net-next/c/9912dfa2d46a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



