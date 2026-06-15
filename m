Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F44FCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwMz3Qb6KBIZ52xe7qK98ZGfUwF79kBhrbQewBx7nyQ=; b=EIKMw+yCi/HQd4AnvgYKcnmL3v
	YeSyM6Sv/gJGEcw3lebr5BOc4GtiM+CRfasPPNoE5gjqWjOk6XGHld/o+GaYkcfHZ06mitv4MzM9+
	Iw4YPx32n7aW6TwaiP7zaA7DYQdAmcx3dVMIU5rsYzIvSao3lVXUgX6rJyte+tWIuTttgWYI3BVZK
	Udezkctedpn+tJ5Ubq4riXRx+cT7kWNHFEQGz3x+FrCan4SDvqsIIUKNUFFZ9BJMYWGspN4Atw1ey
	CfsipAxyKJYdXSYVOijbWSwvVkJWWcd9BFWsaTYd623Jr8OgDCmjpKCLRcTfy3V/j3wFeUWA5Sffv
	iYeAS/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8o-0000000EuYt-3RaT;
	Mon, 15 Jun 2026 22:50:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8k-0000000EuVu-0oZY;
	Mon, 15 Jun 2026 22:50:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF9B2406E6;
	Mon, 15 Jun 2026 22:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F171F00A3A;
	Mon, 15 Jun 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563845;
	bh=iwMz3Qb6KBIZ52xe7qK98ZGfUwF79kBhrbQewBx7nyQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kpFUzUpjmsudEqj03T/RyCQyqW4CFcKL28HfgBZJou1WkNzHlCmzA6eQIItcdlCaV
	 aDtvH7S9Trp7NOqp/Ic/oeYk820jao2FTDNdML2qLHYO2KhT+xUUujd0TXC8Ngk0fk
	 HqTCpVYEAFyKWq0f3fvWgyqZHntzK8qZuq43W++whlJQr6d1pwu4xjCkMHGdJGqITB
	 Q0dSDVMAXOOBbem7Od+RCcWmoLOzI0zSR13t42H3L8UwvEX6V1ZjgzSx0rpINr+45y
	 BQAXjZbgyaZ1e7NrpC3whFUOwzdozLhwPD9uNncBs0ZYtz1Ht+RdS5nmJUtWCGfJKn
	 nqzhyOeShflIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 196EA3839A08;
	Mon, 15 Jun 2026 22:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix non-standard return value in
 airoha_ppe_get_wdma_info()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156384063.325968.5097287869534609850.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 22:50:40 +0000
References: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
In-Reply-To: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Sat, 13 Jun 2026 08:22:31 +0800 you wrote:
> airoha_ppe_get_wdma_info() returns -1 when the last path in the
> forwarding path stack is not of type DEV_PATH_MTK_WDMA. This is not
> a standard kernel error code. Replace it with -EINVAL since the
> input path type is invalid from the caller's perspective.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Wayen.Yan <win847@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix non-standard return value in airoha_ppe_get_wdma_info()
    https://git.kernel.org/netdev/net-next/c/05173fa30add

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



