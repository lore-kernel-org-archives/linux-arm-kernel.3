Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEEFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksHpryQDs7ctPGFoqYhpw5T3GwV1LQ4G2Ed085k1s1w=; b=K6Mu5ChppjHGYMSD8LZrW3OysC
	uOprQLzbfJsZqw92R7k1wej02LSejS/scJjWU67dcl08TmPXFkxIbEGqWkPiw2sU1Ew5uMquz0UA9
	b3yUN6DX3m5CrvCk9LsB8kYiMvu0+2gswQvNaZQK9+PVtYkgw3i+Kn1KEzauDzB9m7rHxco0IejmD
	BtVRGvJEWUsMWd6H+6hpRX5a6p/Ig7VI3HKzihqG1ZH2Lt44NFLYAX6r8XaZ6avvkxrnVHkL43huh
	5seGm+R6Ftc4Jt+qFDHr0TKem7/ITfGcOyBmMbg3BCU0vtMGVQ5R6Vg6nykNz1GGt1lSQuzfmEgwX
	Sg0WF7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfTj-00000008bCQ-2Chu;
	Tue, 17 Jun 2025 23:12:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfRV-00000008azC-3EKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55C01439B8;
	Tue, 17 Jun 2025 23:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328ACC4CEED;
	Tue, 17 Jun 2025 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750201813;
	bh=NLmZbAINQrKpTqQpqNfxPgtqEb0sB7XeT47yiorXI6w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MeY+/BRnKSJtQIpfkUgm5S90dpg8BaAd3E9/X4zxA9F3zdFVm0v82Low6gsBPBOHe
	 iFFOjUJp1giTMHEe0SPayfjJOKYUIxYagHv0n+AAF2ilgYK90TtH9zlfBog6ugcEP4
	 WGcwTuQGzAKLT2wW8gItRfMw2MulwZU5f0u1o+1KwDaGyGvmel+8JA6h0vXVDdI8gk
	 l9MlsvBi9aRk9Ja+hujhrKFI28BcH+xjVLN2PqAHEsl+vVZhgrIub71qvkzsxR9Jo8
	 O87Frd6uUIw9izt1Omd0Md27fdFbmaeiOWUrV/l5WX85U49iWn+A4vTD0mJzoCV/eV
	 HsEiOX7K/5QfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB638111DD;
	Tue, 17 Jun 2025 23:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: rk: more cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175020184173.3730251.3213755803607439009.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:10:41 +0000
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_161013_827361_C468A469 
X-CRM114-Status: UNSURE (   9.19  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Jun 2025 11:16:18 +0100 you wrote:
> Hi,
> 
> Another couple of cleanups removing pointless code.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Here is the summary with links:
  - [net-next,1/3] net: stmmac: rk: fix code formmating issue
    https://git.kernel.org/netdev/net-next/c/a44769c97e9a
  - [net-next,2/3] net: stmmac: rk: use device rather than platform device in rk_priv_data
    https://git.kernel.org/netdev/net-next/c/8f6503993911
  - [net-next,3/3] net: stmmac: rk: remove unnecessary clk_mac
    https://git.kernel.org/netdev/net-next/c/cf283fd6b8be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



