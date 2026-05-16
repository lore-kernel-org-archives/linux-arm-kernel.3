Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CEACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 00:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbgsIXHt6NlrCnc23vse88z1ZKMItJ298APbJStYoog=; b=y6+tx6OWjTHZ+USKZcApdLmStz
	aoooGb0FkeZTNMJ8uZ9JzA0itRBbqsIVdnw4WV0LW2LHHJYBrIwvKWUCQHwZTyiMoIUkWT+WmxMhi
	74IsMIwNweqmEQEMcdvqSTigZa64vUQdltnkdemA+u6DRPwxQqLoi305ZsFVGWrlCQsXJBz6XVMcM
	V42perE98X5X3GAyqrUesHpZe1/58YxrmhbK4Atb2Quuxlhin//EJGojPNFJNOSZ2d5InEbtaX+CA
	vnn0JCF9R4mjJH6xOvt+eR7MhyoXZ03GoO+kVBndnvwii0Kw31Y6u1s6wzg4Px8srt7RgN3Fj6zUS
	dBG0zvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO34N-00000009ofy-2nj8;
	Sat, 16 May 2026 00:39:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO34M-00000009ofi-4A5Y;
	Sat, 16 May 2026 00:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17B7660142;
	Sat, 16 May 2026 00:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC88DC2BCB0;
	Sat, 16 May 2026 00:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778891993;
	bh=6vI4kXZvk0IYP3RH7MFbxQnidjQVlIqxXdx01DpVYT4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ceP1WYOa2Gp2NAwGMKUmQbam0CbNXr+ppK2b5xKtKg5V9/8kRuCWB6AaebOPKvpAn
	 yIdiYvrTnH+rf7yc6T2gWLktt5TH+CsEDzfEev1yj/sG8Y0lRgEM5S6J9dO3Z9XCFX
	 g17WoKcrJW3Svaqje+rpgaDWkR9FSCDMURQDSwdS19aHSxjISDxEDgNCsV5KDudKOU
	 jBcFZjKRXlBeqBsOMP8pAmFmup42Vb9LGTi+VqwF7wY8KUH2lzJpvjJawduumsJgil
	 D04sCaJ+nVam1DM7Z3Cxr/oUSBtJbrc7uhIRwunYMHtcKQCdtBm1wIY7vj/AM0zMjE
	 FGgkkFIF3M8SQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199CC3930A23;
	Sat, 16 May 2026 00:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Reserve RX headroom to avoid skb
 reallocation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177889200689.209257.3972061209487026689.git-patchwork-notify@kernel.org>
Date: Sat, 16 May 2026 00:40:06 +0000
References: <20260513-airoha-rx-headroom-v1-1-bd87798e422d@kernel.org>
In-Reply-To: <20260513-airoha-rx-headroom-v1-1-bd87798e422d@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 xuegang.lu@airoha.com
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

On Wed, 13 May 2026 17:03:59 +0200 you wrote:
> Reserve NET_SKB_PAD + NET_IP_ALIGN bytes of headroom for received packets
> to avoid skb head reallocation when pushing protocol headers into the skb.
> 
> Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 14 ++++++++------
>  drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Reserve RX headroom to avoid skb reallocation
    https://git.kernel.org/netdev/net-next/c/bbfb1983944f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



