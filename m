Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A4CCD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weNg96zxEw0YQOLnRM6yhlBqLpFSoIZgsDdg6LWSa4E=; b=T21yfjrgYuGhp75GHxrIt2POHr
	eltM971N+HNidbmjYuNpTyd13CDW/D43zobJA21Meq+ANIXnxfjWEHCe0gXhoMau7SNlZKgbExbML
	vsXzAQOh9hlvrBbcp6DANBptDAB439HXCk92Mu2MQw9lSYemNpQx7/Tt66/jXy4cosLX/24TEAJRP
	GTrInVE6PThMZ6f6BrSxeaEorf7CJRj2+z+jrDdmKXXwBOwWY9lHQGuApWSHAtI22xqyGl3dTj+yd
	dDGCalt72spkK+QNszUQNgs7g9MpnZ3/rSgLJ1/nhnWOzy78/ooKTDlIkLyEUVce26S7ruFB71N9q
	mF5my95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJO5-0000000HW0B-26rM;
	Fri, 05 Jun 2026 01:30:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJO3-0000000HW00-0cQ6;
	Fri, 05 Jun 2026 01:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4338160103;
	Fri,  5 Jun 2026 01:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED28B1F00899;
	Fri,  5 Jun 2026 01:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780623014;
	bh=weNg96zxEw0YQOLnRM6yhlBqLpFSoIZgsDdg6LWSa4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DCFmOPDaH6XNj24ToBjQJOCu2J6zcZoRZ6/WA1oskRuKTU9HiobgVsYJOk+q2zeFS
	 gQLDtlTTZ8nI/T0p/K7X59cuTglFDyAmG6YQgPbRAanP3mNHUu0mgh2S/O20r8jsbL
	 jTnq8oZxr9QOPo6NcFpjjK3icE0LC4U1Ged+52VL6vQ4FUDKEMgj2cKyUgkkcsx2F2
	 CtxLesaj54PR1KdHOkf4C+2Cjk+QJl8G+iCxwh0Yfql/qWarr7y9dNhcOfvyoMIQAK
	 VcOSSHgkVDvt0fClGN/zlG31QrB5GWxfOaBMfrPIsVu3X57AD5BW9ze9bnOBOrHb3C
	 FtaV/n9CdHWxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D094E3930A8A;
	Fri,  5 Jun 2026 01:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Report extack error to the user if
 airoha_tc_htb_modify_queue() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178062301439.3093327.853203913546216659.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jun 2026 01:30:14 +0000
References: <20260603-airoha_tc_htb_modify_queue-err-message-v1-1-33ec3ab997d9@kernel.org>
In-Reply-To: <20260603-airoha_tc_htb_modify_queue-err-message-v1-1-33ec3ab997d9@kernel.org>
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

On Wed, 03 Jun 2026 12:30:01 +0200 you wrote:
> Report an extack error message in airoha_tc_htb_modify_queue routine if
> airoha_qdma_set_tx_rate_limit() fails.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Report extack error to the user if airoha_tc_htb_modify_queue() fails
    https://git.kernel.org/netdev/net-next/c/144969cd80c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



