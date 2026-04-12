Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F0EE937E7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqEHVbalOZDMrIAVohHC244pfpG/Lm7e2ymVgUVhKuU=; b=2ZWcg1X7Ucu/vstfrHf6LY9Xm8
	2BRzzES+cOYDhbilphAg9hrtEjn+8ZRrmtErFXadPrGcKOvhXb9OVa1RIk9uDTvvoOD0cJ66hDvd9
	XaMqdtLdXUArpipJ4C1493rO84Sz2YpgCzhrJoN1i0bsObNFFgX4l2tIKdjo+kaJzwdPjAZdFfMwq
	lopx0HwkdLmvWqESGrho9IES7G8M1XUTW7nmWm4uvN/c+Xi1wEocNzVCn7GJ+O93xyTC/ZjwgVTxL
	8OngBLUCJmnixb3hkSeVVOthKiD9KiCPNqMoTItoZy0Gc1SxYb30CLnNfYqqdoFlZh878vaavcOUX
	U/zWMwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC3KD-0000000EjFD-0GEC;
	Sun, 12 Apr 2026 22:30:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC3K5-0000000EjEo-1y37;
	Sun, 12 Apr 2026 22:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A47AB44576;
	Sun, 12 Apr 2026 22:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F039C19424;
	Sun, 12 Apr 2026 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776033032;
	bh=Vkbqz7zSnWjuc4pCYjwiNLsgGE+7Xgk1fU+bplSwK2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A7raTKe8zc8OvdXJU8zSKq+zNvse90ovHrWigUqCsBUMRLoc9pKghuGwdsqo+jI2u
	 IlgcW4V5Ac3ntYWPOX0ecHFsQj6cYLonurfiTldpPIODcyKZ06At4sWrEiG2WD/Wwe
	 llH/5OGJtN2IxSv+Ibrv3I0GQDfLAdvHb1CNVlcSCQ4ydwPuwWuzKyXv6WzWwQhWvo
	 9RVehWeezjdo/eQPZ1+VBvBU+MiI1UV4RGamAEh9O6ntTcCSLzobZZfJ/Ui16xogxe
	 cU7kOlfQA9xjw/jl93YBO6BvlB02UbTfy0vkWHc0fkyKV7HfgCn5p/1y31w4IS/Jg1
	 K/JLCRYIWA8xQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C793809A8C;
	Sun, 12 Apr 2026 22:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: initialize PPE
 per-tag-layer MTU registers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177603300480.3841629.11936598519296387626.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 22:30:04 +0000
References: <ec995ab8ce8be423267a1cc093147a74d2eb9d82.1775789829.git.daniel@makrotopia.org>
In-Reply-To: <ec995ab8ce8be423267a1cc093147a74d2eb9d82.1775789829.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 pablo@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_153037_288940_3AFF43BC 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, 10 Apr 2026 03:57:52 +0100 you wrote:
> The PPE enforces output frame size limits via per-tag-layer VLAN_MTU
> registers that the driver never initializes. The hardware defaults do
> not account for PPPoE overhead, causing the PPE to punt encapsulated
> frames back to the CPU instead of forwarding them.
> 
> Initialize the registers at PPE start and on MTU changes using the
> maximum GMAC MTU. This is a conservative approximation -- the actual
> per-PPE requirement depends on egress path, but using the global
> maximum ensures the limits are never too small.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: initialize PPE per-tag-layer MTU registers
    https://git.kernel.org/netdev/net/c/2dddb34dd0d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



