Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB27C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/GSzkl2Nxca7CIyFcabK5xtVIYKYECe6sj5eIIHwJQ=; b=N5c37turgNqrgDmTLQcsf+ePyr
	qxkgRsRr8FPcNxJq/+G+ZCT9Rc9+e1//ShiwNPI379bXvFR656vCc/csD9FoZTyffuAmsoVd1VJjU
	R3QdWCQqBLpxK4ocKP013uS6WqaTKSp5fKaaLnedoQQ/GZfDA9alsQ82Zuw4D+HnjsOyws27DaTNH
	nRSxWE2v+z8cJNlUZg4ejP1nTHJfnOdxG4qf8f1Y3v+P1P+KpE592nmdMU2WS7tXqgW3jGSEj1K7D
	oEM4HKaituRpDQHzXIiFhPLPvozK8Z0hbW22gmNv8xcY/3LKi2dXGVRous6wxDrIE9W6CInLVdk2J
	24mEnjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiMN-00000005PxR-3uzA;
	Tue, 28 Jul 2026 14:00:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiMM-00000005PxB-0byc;
	Tue, 28 Jul 2026 14:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5014360A5E;
	Tue, 28 Jul 2026 14:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035E01F00AC4;
	Tue, 28 Jul 2026 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785247241;
	bh=G/GSzkl2Nxca7CIyFcabK5xtVIYKYECe6sj5eIIHwJQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kqQDcazgaOOLR3VEAlLG6nz1zlIXJFUOB62R84OLjHT7shjH0WrTnmPu7DHksgWNx
	 MF6PjYpFXs4wOh79whWUo1YWkKchRiEuVTorf4AlaYDI2g2ZWnH6mxhWO+us3Ciqcc
	 WvRyLKDcSx/nrR56QnnQBPXbpTMaxB+rSeABuTlps2kscITGLALDAenzhIX/mTyiAi
	 GCJ6I1KMo3RIbGdWQBDpJmWq3UYmEOiYVt3MZKjrhxa0zUQyglrGEGuSbrXlSK2MSE
	 F1AFSvXQM5DUZ7mZVXSEzJugTnk5hWYDnFeYpl63BtQljFGO5Eq6iPSzmh1zRz17b6
	 e8uGgfHqXZtjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197DC380DBDD;
	Tue, 28 Jul 2026 14:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: pass eth to
 mtk_handle_irq_rx in poll_controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178524720564.1742182.12718299327810762541.git-patchwork-notify@kernel.org>
Date: Tue, 28 Jul 2026 14:00:05 +0000
References: <20260723055735.885112-1-chenguang.zhao@linux.dev>
In-Reply-To: <20260723055735.885112-1-chenguang.zhao@linux.dev>
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, zhaochenguang@kylinos.cn
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 23 Jul 2026 13:57:35 +0800 you wrote:
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
> 
> mtk_handle_irq_rx expects a struct mtk_eth * (matching the request_irq
> cookie), but mtk_poll_controller incorrectly passed the net_device *.
> Calling ndo_poll_controller with CONFIG_NET_POLL_CONTROLLER enabled
> would then crash.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: pass eth to mtk_handle_irq_rx in poll_controller
    https://git.kernel.org/netdev/net/c/e095f249e220

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



