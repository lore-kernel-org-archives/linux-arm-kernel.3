Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2001606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qlkuNuqE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAHXjRzz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PStXvf3iUmXPcABgpAYzb33URw4ffKrt5L254s0zmQA=; b=qlkuNuqESG180pOrEUN9ntZ/nj
	izeih732IfIpghzQjiJhHIBwE8KD/1cmCTYMbRPm+g/+oaXepJT3nJnJLe27u2i1YlgGCRvg6pP1G
	h3AMAeuKf8vWdA2y61fgVXDk13rsOwcBi/9l/W6pUTsCAU+x7MCxE4sWE2BmN8vg+jT1mh/gLhjHU
	UfyGOW1udNiKPFRJP7RRVVuzNkWI1EQBMLjLbOZidvAcLF6gAo43opMAd5enK8GJftlMMpccXRL2Z
	LfH5evjJPwpwLWlU75XWMvgladjI08nH8vYRSyPl18Bw2gnTl4eUeD1gLVmVZvMsOcNjgzKaSi23W
	+zF4z8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7t5-00000009WmR-0kIA;
	Tue, 20 Oct 2026 11:20:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7t3-00000009WmK-0nhQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:20:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50F086053D;
	Tue, 20 Oct 2026 11:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B5B1F000C6;
	Tue, 20 Oct 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495208;
	bh=PStXvf3iUmXPcABgpAYzb33URw4ffKrt5L254s0zmQA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UAHXjRzzdxfR/ULHHEnHgMSTlKsDykG/sG+9eG+RIaMqPw6SDTn64CI6BZt1bQIef
	 qAnBs8eF3Ox+C8rM/Tia1qaJ6M/o4bgYikKm55IDQmFJoc4dd0J25dZwG39lbhWG3o
	 5i1kDgPUTig5tdUf4xg1+uByBg7j1YKcyDmJs95NNhPaY7FTHeMSR93/slISOP1rGc
	 dm+ScO9L+/l4PvZ/ATjldNGPBB7D2SkJ7T81PqAB+iqcAYvMHgfHS2E3fIBfIIp+hL
	 qedrcdBIDA+fqTaaS+kGgLCFC65tFeNW0F496ea8Hs92O5wQGB6PinwraddOqcL+qq
	 ZXvPjIAdMG+Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F149E3808209;
	Tue, 20 Oct 2026 11:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: fix mqprio and cbs combination
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179249520652.3674783.16445702452498504687.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 11:20:06 +0000
References: <20261014-stmmac-mqprio-cbs-combo-v2-1-372249daa81a@oss.qualcomm.com>
In-Reply-To: <20261014-stmmac-mqprio-cbs-combo-v2-1-372249daa81a@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, dcaratti@redhat.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 daniel@riscstar.com
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 14 Oct 2026 11:05:25 +0200 you wrote:
> The channel-mode mqprio offload and the CBS offload can currently not be
> enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> mqprio offload as soon as any TX queue is configured in AVB mode, and
> tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
> is active. As a result the combination is rejected whichever order the
> two are configured in.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: fix mqprio and cbs combination
    https://git.kernel.org/netdev/net-next/c/643f9c0bd877

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



