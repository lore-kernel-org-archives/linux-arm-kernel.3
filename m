Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3BFCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYfJh+51yj2R4Kc20BEo/16TMlYX/OGjxFXaijOHj2g=; b=jIwsEitEgCgdwz1FnOruQZuDyC
	kg5Wr/S1I/NdkpK74TRD8l3+uydtel+HtFYYL732b1Ig7AZbWkQp4gvxH5aaP0/cqHf2uxN6Qj2ae
	9SXfS33h+E77UgnLPEL43Kl76/Mr7YVbbyncuYPWJKy5/0YdKVPihDvSeat5vdFKxVWYFolB2Ymvv
	Zv+M4V54b05DpmcH/iWM4rvhCgn1othHZXHy6HoI6ZnVoSNyUYn4nBHoRUifD/ai/Tj7wZnGds9cs
	xlLePxxytrvU+i5WDluSNwbv/yoAbyERf4Bfs1BQCv1i706XwVOPf/OxfxFv3OuB1GnOIOSi7kVbk
	yFYTb+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxqU-0000000G2Xo-3tTm;
	Thu, 04 Jun 2026 02:30:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxqS-0000000G2XS-1JSo;
	Thu, 04 Jun 2026 02:30:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F14E404A6;
	Thu,  4 Jun 2026 02:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8241F00893;
	Thu,  4 Jun 2026 02:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780540207;
	bh=pYfJh+51yj2R4Kc20BEo/16TMlYX/OGjxFXaijOHj2g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mYT/Gk6lgBe5ptQyD8lFkyNRyBmkUESqSu/6n2CRrDLBo77wah3HAlrHvI1FkTp4w
	 pOP6FtIHww39OAkIkXAmx9e99BOT8/eqbCVM6YcNgXf0kVseuxCFNge5MjPmDIwp1h
	 tpcuaj/IX1ohCVlszxLmr6U6Rk7uxt75lAfJ+h3Pxja+UxQwG3IHFsZzdRpFTUuN+J
	 Wdorom7dBgeCytDsxAHMV78iEUxukQ7ZeVKV0hP4XFV+43jyFl8dcht1I4AVv0DlVK
	 +g3zLkIsCEOxpndhxapyywVr0GBN6OV2psac2jsNQhXXZ5QvLh8dPBLdAhAaf4WHR/
	 U3ZzvNdBJVgXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A5739308E6;
	Thu,  4 Jun 2026 02:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] Fix use-after-free in metadata dst teardown in
 airoha_eth and mtk_eth_soc drivers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178054020839.2211213.18332239171948439867.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 02:30:08 +0000
References: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
In-Reply-To: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, fw@strlen.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_193008_384612_F78C5316 
X-CRM114-Status: UNSURE (   7.57  )
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

On Tue, 02 Jun 2026 11:21:03 +0200 you wrote:
> airoha_metadata_dst_free() and mtk_free_dev() call metadata_dst_free()
> which frees the metadata_dst with kfree() immediately, bypassing the RCU
> grace period.
> Replace metadata_dst_free() with dst_release() which properly goes
> through the refcount path and runs call_rcu_hurry() if refcount goes to
> zero.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: airoha: Fix use-after-free in metadata dst teardown
    https://git.kernel.org/netdev/net/c/b38cae85d1c4
  - [net,2/2] net: ethernet: mtk_eth_soc: Fix use-after-free in metadata dst teardown
    https://git.kernel.org/netdev/net/c/80df409e1a48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



