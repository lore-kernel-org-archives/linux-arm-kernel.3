Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A0CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQD2Rea8tT9Evki9cBF/txLTFbUp+ukuW+gnffNHODw=; b=vICz1Eb77DkfVFQXaFpgtzHppF
	Q35wTvmUpflIxKyID5BHRrV5S0p0y3JMjxi+fS/ORTM3R+dV2JFnPvu7tw0c5LRGWSYvAgxLb0N4e
	qYqSR/Rb9MIcmOT7Cq+xof35SN5gCbMdvawNxlGgqLBC8xJifD9efu0TMeLlyigvaA6fPWfHtB66I
	NEL8hp6UeyzTP3Hkcq/FP7UpGbtg1BS5QK9al6optrvHzZN8mgP2fntUaHxx4dOZ2++Sw1wP2ebKc
	GJDqPOcaCeVZG60VEQsBnfjca/XI8CGcHXcJxnJW+LrelpTYJ7gsKprFzpdDFAh9EMuNRV6CfDcm/
	8mE4lnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZc0Y-0000000GN6E-04z1;
	Tue, 16 Jun 2026 22:11:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZc0T-0000000GN4l-2tqJ;
	Tue, 16 Jun 2026 22:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B99340357;
	Tue, 16 Jun 2026 22:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ED41F00A3A;
	Tue, 16 Jun 2026 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781647900;
	bh=CQD2Rea8tT9Evki9cBF/txLTFbUp+ukuW+gnffNHODw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jKbwD3o2tt0FtNHDpOTzRUzaNm7iND58wdAcyq2/wDBecABCppjOk+AP5zWhoT9aE
	 RV3k8vVvAe7bz0DyGUraz7LSLLvBKbQ8F1LyVmL+mnQB/Gl0fXBimKpdX8JO9ZgbAY
	 Vv1BawSJWEfYBTR4544VerFG7Av+DSFEvT2aPGzyDeiKUzr1fqytuq2b4x/eI1J4EL
	 SbW26dbJv0EnNQx8EgOeskhqro30dm3avZICvfRxZQrBt1NRABe2wy59sNSty+Lbpr
	 ts208rSiN33hkJmT37/qJ4aiFUCRqGm70mKf4jPaQUrbZb7pzJM01B7HJHvYsVaQ82
	 1tLPRuYjDNwMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938533930C2B;
	Tue, 16 Jun 2026 22:11:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] [net] net: airoha: Fix QoS counter configuration for
 Tx-fwd channels
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178164789527.1259509.13170564105480598534.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 22:11:35 +0000
References: <178161132384.2164449.18407700117859190327@gmail.com>
In-Reply-To: <178161132384.2164449.18407700117859190327@gmail.com>
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

On Tue, 16 Jun 2026 18:50:29 +0800 you wrote:
> In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
> using register index (i << 1) instead of ((i << 1) + 1). This caused
> the Tx-fwd configuration to overwrite the Tx-cpu configuration for
> each QoS channel, resulting in incorrect QoS statistics.
> 
> Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
> counter configuration.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: airoha: Fix QoS counter configuration for Tx-fwd channels
    https://git.kernel.org/netdev/net-next/c/1402ecccf563

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



