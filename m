Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A8CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2t7hapSvuD12xX2RQBv6KxWIYjp8Yr6JWro08pU7dQ=; b=1QPGTy/OUAfS5AyfohQCqi0KlM
	1sWwpnHWlGjfvL7MDBOW7+M3Hy874H/3BZ+FRzasgot2sqOniGyFz3TjRycY5pSEP3VN2CdnSj5uV
	iNB394aCn9TW8f2Dv6ZPjy8IWxXUz6YtLmNLVzUaY38BmcObpyPIMr7UzD/llUHHxpn/8D0Mek7lU
	VlH3eDdhbospbUe3swW1fWf3TwsG+TxBXB31hzHb7zhGmWwJTiX8DqM9UUInZNUhMdcP+Piz7k+cC
	llS6lFWIPvEtiK6vrtvfBE2u8I2SBgTDWZT/78Vcv1X0aOlrFfdS52/SE6pneFMgmLbv/Nl95LWhe
	yQrBscKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwSL-0000000C3Ni-2VRH;
	Tue, 12 Aug 2025 21:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwPn-0000000C2v9-1BBQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 21:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 988DD5C69CB;
	Tue, 12 Aug 2025 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F4CC4CEF0;
	Tue, 12 Aug 2025 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033614;
	bh=coaleDkEw2ri40zMf0iBd5QOXvs/OQOHQ7AAZgHkX3g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D+6srMj6RQUdBm/eEwEuvGo5CanVDw95qZeJkB2llEU87IEDO7Ufes75U15DWr1kL
	 xno7pVgUhvpqg5pezP0yKUZ4k02aDrAyVKslLrXTxiFJzrejnE+iisSuLfiNM+cHap
	 bM3JtTtZtPtvYT6uF6zNhI/4AiVBpRCuACoJbWj+9Lj4obeREh7F2d/BIC7CjxPStK
	 p7M7ujXf8RgO1tmSaLrLGsQFUgnURx23151+WWFzJcx8RfhpYGGULadM4pXvinZIT8
	 htQRSCaKGz2IPPZsGR3a8RJmZ4EEKPsPAO9Qa+W9b0Ew8lfBjZ5RZR0NUGM5BelP04
	 6BwyEvJkXEO0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC1383BF51;
	Tue, 12 Aug 2025 21:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: make variable data a u32
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175503362599.2827924.4642075233156887123.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 21:20:25 +0000
References: <20250811111211.1646600-1-colin.i.king@gmail.com>
In-Reply-To: <20250811111211.1646600-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_142015_358171_CF3C932A 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, 11 Aug 2025 12:12:11 +0100 you wrote:
> Make data a u32 instead of an unsigned long, this way it is
> explicitly the same width as the operations performed on it
> and the same width as a writel store, and it cleans up sign
> extention warnings when 64 bit static analysis is performed
> on the code.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: make variable data a u32
    https://git.kernel.org/netdev/net-next/c/11b99886d194

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



