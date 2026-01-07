Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5523BCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzjQ71QOzFwdcKXYIUMHyHGKK62LcHqc9vxBvjOCudQ=; b=n/ySQa/33a4NKnUPnmOiJieEAW
	OyMnTIm7AetW2uaWjKSdY6pfhnI+3sNSkm8CAY/T7Il66Az9IOSlEN7eDY4l2nvycPN/NZV0+dM45
	g+re3ZOKxJS+N3Vz6gvy8Wkl0HSSc3SwrfpuLIaa7iXTOoTHmUL8L4k418eC6PuRqaGkGmmeAvMOG
	p5sT3Wt7ZCbgIDqumnxygFhKAxMkp9bZ3lspbxuAslkCblFWuyFTPZalbqZbhxJAaWHmy+Uym2OKJ
	Mx1rVTTjZHgDiIQ0bUzf3ZiJaMzz0kQYGC8ZxDDIFkkDaMDO02EEqrLBt6Awa7sQqAuL4jByU6+n0
	C/K6MI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdI7K-0000000DzpU-1WS9;
	Wed, 07 Jan 2026 01:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdI7J-0000000DzpJ-0oqC;
	Wed, 07 Jan 2026 01:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89A036013C;
	Wed,  7 Jan 2026 01:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0BAC19423;
	Wed,  7 Jan 2026 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767748419;
	bh=LSzIB7ZvHtwbKLPR0CyVa0RD/fmT9XyawYFuu4l+x2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sXVEYb0FWM4yiX9H8pkjr5yACRcxuuHJ5r2Y1O/+IeVBtsrTzPaTPtRlwhsmM+n1b
	 JgCcsv0gDqrn92BjwnGcHmGoQ4CiXRES01yJIF72P308s3L2LZIa53sTzNEuDS1S07
	 ZjDipzBUHmQn+d6mCx1ErVizEB+B5OLp9imDhgZOsmdeQ2MPDYnz/PuOXBwvW7TBM1
	 4z4W7yK2VY9MyH0497cadAEpOECnLgbE0DhqC+HPIId5xkco3fH+LApXrZf2bpJuXD
	 oQ2bsXDSKPNFNTY7XM+8kG7KQcNsysACJp5PtbxVsTvNQQd4m3YfmTUVUhQZ+CwXiI
	 3p/4nDyHtue8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2904380CEF5;
	Wed,  7 Jan 2026 01:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: npu: Dump fw version during probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176774821677.2186142.2029655991938895121.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 01:10:16 +0000
References: <20260105-airoha-npu-dump-fw-v1-1-36d8326975f8@kernel.org>
In-Reply-To: <20260105-airoha-npu-dump-fw-v1-1-36d8326975f8@kernel.org>
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

On Mon, 05 Jan 2026 09:49:16 +0100 you wrote:
> Dump firmware version running on the npu during module probe.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: npu: Dump fw version during probe
    https://git.kernel.org/netdev/net-next/c/e4bc5dd53bf5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



