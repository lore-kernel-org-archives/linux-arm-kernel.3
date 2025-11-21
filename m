Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C06CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmMgzSNybkEcpQi6di7RgNZIuwns0hwI5oRFP3erMUE=; b=0yQFtBUz647EsZFBW7iwonu3m+
	OpQ76CWguLVSdyI/xmc2nifYnQdL0KrO/uu9kxnilNKNZs01Y9pehbgOFp2WATrF+zVP87zgJ9wTZ
	uIzgLyrPRI11OMU18xRTzOSese7uP94/CRXghsBhorGcWbNiVpkNSAwlwKBpLkwd3U1k9ckTEyGoA
	XRT/TcSUL2McclymY1n1nyPSD3H9udB2tGle6txyLKB32PjkrT3vayYLuYhC4ltcJkwffn5hwcxLF
	Z3OQkuF06UFcR0rnBmUnvkReWIR0H47yZThobPZ2ccFApCJUQ6ZrlZM2ADCR61D5xDEq2kUOga+1p
	1tXw3jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSC-00000007fGx-42Q9;
	Fri, 21 Nov 2025 02:00:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGSB-00000007fGg-3Ht5;
	Fri, 21 Nov 2025 02:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCDFC60216;
	Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0F3C4CEF1;
	Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763690450;
	bh=oURpXBr3KdDn9PGKvZ71lA/uZ3b0bjDvzcwrD9A6oco=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RDaxqjBXt1j3UIdjy7D7SVnLs8g7GgWn0u8nIwwGC1fkiNvamtVFDj/FQO/M8D/eh
	 ZYIA8xclzKyMLPZroHugJ3RkCZs5j9pKq0uWtuDFi0aBxiZtSOUzYSr5VSAEob6tbA
	 +24SZmZdWrSItahXVbfOjubhuO2Q9wBLd3uWK8Q1anPuB2bUlhg79qq/F3gvp3PXJe
	 GCBA+D0/jJI9zu1fGsaJShWGCCkqQPKRf5p99z7rHol3XvaTdbp8EZvcxoMvleDjLd
	 cvjpgHB4iUi5H3cdt7LM8reUKZkE25YppGHm/F3OQ8XDVF7CXgsxWVC/aJfF3PxY64
	 b0Fp/3p8/tkTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE07F3A41003;
	Fri, 21 Nov 2025 02:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: pass struct device to init/exit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176369041551.1856901.1355582687378802410.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:00:15 +0000
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
In-Reply-To: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 fustini@kernel.org, edumazet@google.com, wefu@redhat.com, guoren@kernel.org,
 heiko@sntech.de, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jernej.skrabec@gmail.com, keguang.zhang@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 s32@nxp.com, samuel@sholland.org
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

On Wed, 19 Nov 2025 10:02:56 +0000 you wrote:
> Rather than passing the platform device to the ->init() and ->exit()
> methods, make these methods useful for other devices by passing the
> struct device instead. Update the implementations appropriately for
> this change.
> 
> Move the calls for these methods into the core driver's probe and
> remove methods from the stmmac_platform layer.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: pass struct device to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/85081acc6b11
  - [net-next,2/3] net: stmmac: move probe/remove calling of init/exit
    https://git.kernel.org/netdev/net-next/c/32da89a840e8
  - [net-next,3/3] net: stmmac: rk: convert to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/1a62894e040d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



