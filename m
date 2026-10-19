Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E0CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KInJ3paQXH/r/eztgkZasWopqYMEIr3EbinIXUkboXQ=; b=R3GcERopJll5WQJEq13CK7mYLK
	e8VHnUdIMfB7Bxhb4LxmtZrfh8oP/fGiBcREbq9A+AamJiACnQXsq6bdY808a83UGaHIA91NNRNFR
	nTogM0kfaTR3XHi6mw+FJdj+3sohReW2K3xJeWd0O5huw2pa1g659qGG5zfkbi6qUPYrlyjhGw847
	DKcjmUI9khYjQR+QU5szN2HeXqZS0/l5BOv8ysI8m8fdJJ0jrslYNs0Gt1qr3qmG7/Zg8tmyqEByY
	jcMM3FmQ09XKmKVOtbeBzAdb1scORx/ivnpyxnk41p6OAMs31iz/Hz/se/J8bTh8IVug1PqDc7lJR
	56OHm5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoDg-00000007jNb-01Vz;
	Mon, 19 Oct 2026 14:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoDe-00000007jNU-39Gg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:20:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2711D43E72;
	Mon, 19 Oct 2026 14:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088F71F000C4;
	Mon, 19 Oct 2026 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419606;
	bh=KInJ3paQXH/r/eztgkZasWopqYMEIr3EbinIXUkboXQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IQ7SL1lwHa1IZkrRErSk20R0UtIQye5spFJXkJZdLigMmWPaBgTteNgv7G+cFh5Bm
	 EkM0Ep1MFGGWZ0JQQJ+64Lr+jrjQ6yg9dgtil9d0uSweamw4biWaUhzJqzEzBEe1Bn
	 VPhzwtag6DjmIbp85Jk9Qmp0PvSnhkZibsTiLoKfBg+vPkeTs1Mw+90pvbGSZFn1KT
	 3Uzn1uH/Isa5ntxsb8sz2pJE4NLMbmS0ND4OQePeY58vIIN/8hCTicFicUF5rwsafA
	 jKgvME0ns+VuP70zgAwOFlgl48irvHYBPitzjRgSpLMKo6inaUecAeGRkSplDoZa5s
	 iTMBsCsBUrIOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F152C3811A60;
	Mon, 19 Oct 2026 14:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: leave the datapath running for
 normal-size MTU changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179241960478.2682066.13061031646169111370.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 14:20:04 +0000
References: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
In-Reply-To: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ansuelsmth@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 13 Oct 2026 11:54:13 -0600 you wrote:
> When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
> receive limit do not change. Update the MTU without restarting the
> datapath.
> 
> This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
> rejects jumbo MTUs, so all supported XDP MTU changes take this path.
> Jumbo transitions still use the existing reopen path.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: leave the datapath running for normal-size MTU changes
    https://git.kernel.org/netdev/net-next/c/d1241cdbbcf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



