Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB31606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n4X22o7X;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFmWSkIZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doFwaVtFpS6sC4IuXaKfGyTb696NhEj7zirNI3zBSPk=; b=n4X22o7XOXCMk6dpEZ8Nr8mMAh
	cayfBDePqSxe9VFcs9//Da8+jtcqRRXD929K+PwiB4Wm6f66KamSX3c1ROsA1AMxku2+JFEqmTFCb
	w6elGGIuE/oHdDB/u4FbqS1OsW1oUZGHL5h/0oz4hj58qtPbA2yxQTVvBNwMpnwoe67HWwvT0nMgU
	zr60VZSECGcHprheRO2dJr/QwaJCZh8lbmymI0xyfmDj+lkYecLfJVPB9CoxQbdH1nfWbO8QmHtxT
	ENv81ccMiHiP3BLd9kXz+wqfUrovP1SJd0HBsBLy/rUscrr7U1bNmFYJw33SKOLwv2kt9x7VOMnLH
	i5D1JydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF4Z-0000000AUyD-0t6E;
	Tue, 20 Oct 2026 19:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJF4R-0000000AUv8-2r7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:00:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BC7E60D86;
	Tue, 20 Oct 2026 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E321F000C9;
	Tue, 20 Oct 2026 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792522822;
	bh=doFwaVtFpS6sC4IuXaKfGyTb696NhEj7zirNI3zBSPk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nFmWSkIZRpkljVSa23s6GPJ3aVIW5bIoTnLHx11JdS/V7eYtdXgjiNhXDsgVLmC/O
	 u+AFoyP9sQoc5dZ0l4UCRVYYMNAPcBsoor0gCI7bZIXsBsI+jxaA5fjBNGQoNk/UcA
	 U0HVGNjRC4Cq6kmD+gWSo9XYiQx3dXVYyZWF61RTmDmq5uPBXwr4iJy+gwCgJN3OQt
	 zHIlSNFSl9131/EhLdLyd1T6AoUUE9J4kjC9BHVNqhPc2MUle2iBf3bKw4fehQ11gd
	 ZLpEN5thUzwNIbwODsWVqSmZ3S1RaBdfxycFeTJ3TvcHMUrDUlsLEIzmxrqmFvhK/4
	 CY+PdAjm1i3Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4EF3808209;
	Tue, 20 Oct 2026 19:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: rename skb_unshare() to skb_unclone_full()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179252282077.159319.7792031411876485115.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 19:00:20 +0000
References: <20261015-nb-skb-unclone-full-v1-1-0dfbf01f60f2@tipi-net.de>
In-Reply-To: <20261015-nb-skb-unclone-full-v1-1-0dfbf01f60f2@tipi-net.de>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Raju.Rangoju@amd.com, PrashanthKumar.K.R@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ioana.ciornei@nxp.com, sgoutham@marvell.com, gakula@marvell.com,
 rkannoth@marvell.com, sbhatta@marvell.com, bbhushan2@marvell.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sd@queasysnail.net, horms@kernel.org,
 marcel@holtmann.org, luiz.dentz@gmail.com, olteanv@gmail.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com,
 jk@codeconstruct.com.au, matt@codeconstruct.com.au,
 stephen@networkplumber.org, jhs@mojatatu.com, jiri@resnulli.us,
 marcelo.leitner@gmail.com, lucien.xin@gmail.com, jmaloy@redhat.com,
 tung.quang.nguyen@est.tech, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 Oct 2026 10:16:38 +0200 you wrote:
> skb_unshare() only copies cloned skbs. A shared skb that is not a clone
> comes back unchanged, which the name doesn't suggest. The loopback
> selftest hooks got caught by this and hit BUG_ON(skb_shared()).
> 
> Rename it to skb_unclone_full(). Like skb_unclone() it only acts on
> clones, but it copies the whole skb, not just the head.
> 
> [...]

Here is the summary with links:
  - [net-next] net: rename skb_unshare() to skb_unclone_full()
    https://git.kernel.org/netdev/net-next/c/258c3ae4a4af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



