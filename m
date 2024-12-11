Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E9EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 02:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WlFT8oj8eWQPH4qdAyO0x6em/coSKGRMEdOjD7D4Uo=; b=5Cut1uODJExVnbpSjDkP55xaj7
	Gl0oAwzeNFfJyxfC6TVvldGx7ZNzGBwNJKO4E3JHBFh2V4SkMcKXNB44fHBBVmFpwvTaQRksfwyek
	+XQ6+arsZkcQhFQrLd/5xN+k+DpK/FTYmRtOS0WsffiefQOJyhsSj+jLh/dfYGV4ZUQAizA3vm6el
	XpXi27bYRyX7RjNNGXRZC0bD1zXTFAPPE73S0e1p7x84f6l3QlP6UuN1Y6ySXOLVfKToL/qzGyWrd
	lGv4uqBVN6290zpNUBiQ1hzwTZoGJ/FnlhueRn5rwauGKXKVmCM6e/EqlNZzYnPp1ZXs7NgCpSdQo
	h1eE7s8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCVd-0000000DVfP-1LPa;
	Wed, 11 Dec 2024 02:31:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCUZ-0000000DVPb-2rlM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 02:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46C1AA41D95;
	Wed, 11 Dec 2024 02:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53049C4CEDD;
	Wed, 11 Dec 2024 02:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733884222;
	bh=y9rtjkxbnTlOCutyUOOiDTGb+6al6ycCqwU8ocBVdzM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uo8Ha9AM7fvVhmBPtoowkrzIhRuXaYM05R4DUeirANT5z9tJBiJgkIWHpBOLmXU2K
	 4Uhz1imZ8YTs3Ip84tPWSy1NZmv0M5RxR9mnrr+cDlACWhO/gU4xPa6Of0GCCC1s0q
	 MA25s6i/Ih1CQeRngG+NG6KK7uYS4wWJn1KlSkSg8t4rMNLjug75pOfbi0PWgLL+pW
	 TnaMxE3wTYlhcNfcg360nQgR1xz8olgjJBKqFA38Z7bw/8uC56WGpMeu9PgzOPuQ8F
	 sk2DH2PJeH6o6gXtvgzYi11AKsQHa2EeY8on1XMHbDtB6PEvnDOYhzhouddFsyGzrb
	 jjtozLougI9dQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E08380A954;
	Wed, 11 Dec 2024 02:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1] net: stmmac: Relocate extern declarations in
 common.h and hwif.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173388423806.1090195.16162842583087657883.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 02:30:38 +0000
References: <20241208070202.203931-1-0x1207@gmail.com>
In-Reply-To: <20241208070202.203931-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_183023_787642_02E8CFE9 
X-CRM114-Status: GOOD (  10.64  )
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

On Sun,  8 Dec 2024 15:02:02 +0800 you wrote:
> The extern declarations should be in a header file that corresponds to
> their definition, move these extern declarations to its header file.
> Some of them have nowhere to go, so move them to hwif.h since they are
> referenced in hwif.c only.
> 
> dwmac100_* dwmac1000_* dwmac4_* dwmac410_* dwmac510_* stay in hwif.h,
> otherwise you will be flooded with name conflicts from dwmac100.h,
> dwmac1000.h and dwmac4.h if hwif.c try to #include these .h files.
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Relocate extern declarations in common.h and hwif.h
    https://git.kernel.org/netdev/net-next/c/46afe345ff18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



