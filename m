Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6272C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0l/ndO/VYAORMAtNkSX1tYxaqQIs5GadFL6w9bnclY=; b=WWb1h5BnM482F4H+uN4+k7eLao
	hIJAcBbtVnKFpH4w9LySz+ahS/YAm4vZ0njH00BPRbHHtecGFFxX76XSHLy+k5/TcwmKTweTI79+n
	k4hoQNORnxzTRiuUX3HUrbssjnWlv4CbakajeQcqmIkF/gYrHqeOyrpCc9QAgf4ACObpBS78sGOzP
	eCwcjsUkzcojKTIjtBM+Hd5bVEm7TMUb9r3jTE5G2l4p02Icy2X6upCkT5QAu6DF7wSpDro6hNK+U
	aaU4UJdBQ06BZVEWYwlicnURR1NSpybo3qnjOF3mBqKAkIRHNoFTz3AQB50Sa5ZasEZTa8xH7b++N
	QpChI10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I2-00000006jYs-0wB7;
	Mon, 17 Aug 2026 19:46:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I1-00000006jYi-03hY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03D25601E0;
	Mon, 17 Aug 2026 19:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB131F000E9;
	Mon, 17 Aug 2026 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995991;
	bh=S0l/ndO/VYAORMAtNkSX1tYxaqQIs5GadFL6w9bnclY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Zll/YueNPB0JNJpPWroXOsr+hmaJobuMEdN4moH9OJmziQcFJoTKAAbkrQglhllOy
	 p6I7rA00H3hUYQ+QQjr0zCXAClD7ajRfqtDeXkzEL9/sQTrv3YySCKDmkYOb1qBDso
	 E6spdpEJ4Sbh68/KAQs2iulAhVwo9gU+XRdJKrjJ3eywxA21B22LEZDegVUvqKXfz8
	 A1XHV44Kw+FEKIeSy+hmRuvKZmhfPximYw1eeqNMRyFWOvhgXa4cpchAGgs8/yTwnM
	 KOan9fNWp6xJAFMv6fFirIKfWNKltQgAHu90Ph3xXHSst+e8dDmxJboANu7+b6hFbv
	 qLGvVe6YeZLuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197E43926262;
	Mon, 17 Aug 2026 19:45:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: DMA address handling fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178699594363.1691257.7676082110902844173.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:45:43 +0000
References: <20260812163832.271742-1-elder@riscstar.com>
In-Reply-To: <20260812163832.271742-1-elder@riscstar.com>
To: Alex Elder <elder@riscstar.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 sashiko-bot@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 12 Aug 2026 11:38:29 -0500 you wrote:
> Update jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c")
> to ensure DMA errors don't get lost due to casting the result to an
> integer of the wrong size.  This was a Sashiko suggestion.
> 
> In addition, add explicit calls to lower_32_bits() to DMA addresses
> before they are passed to cpu_to_le32(), to guarantee the type of
> the converted value is u32.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: use dma_addr_t for DMA addresses
    https://git.kernel.org/netdev/net-next/c/0c1f9020d2ad
  - [net-next,v2,2/2] net: stmmac: convert DMA address to lower 32 before assignment
    https://git.kernel.org/netdev/net-next/c/c11c497af866

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



