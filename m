Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B869C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pp4FFW5WKodAE4xjZQ2NzlV+b/LCYa18rre+bnZt+4=; b=ruh7mZsnULPiyl8nx3TmUyUKGT
	p9spb3LiE5qfeG+MjfUO3TtsJLwfyPSwTCksyJxMpjNnASgKC7WTKGBWNtsQucDfgW82Pi0VIvRLv
	5Px5XwSQffO2zK0BxWe9YLxcSlGP/kGvSzcLTZcBaFeB2UXsP+UZx/y9ae2i+7elI9bkIY6tM9qcn
	iqq19Ikx/5D+QGYITMF9+qliY0APbn5+et5jOlpKrOMGaEtBVuQdWGERVYug3Dz3QT8u3HMN7qP+m
	Mlsy2caXusr1L8Xg+PpFNN0xOU/gC9FbO5Ax3yGjQ9OYO+hyamwE/6BpCOVxZmwamxCt2N/jPP8Hr
	ThTki7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0w2-00000000xSM-0r6I;
	Tue, 22 Jul 2025 00:32:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0tV-00000000xH1-30Z3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 00:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D017A55E36;
	Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B36C4CEF7;
	Tue, 22 Jul 2025 00:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753144208;
	bh=EuXF+5F3Ni9nk0OZtht9On3rD4KnpjFnW5CiFlFPJ4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hNvVM2ILTkgT2tJhvZUztstWQeW8RdLLShELouOYs4IMW5F81FnEhAePJrVZN1iZA
	 LnRxGkRwfNx1V3F+vHpPpLbycJ52oZx4as5KD1Mq/OP2a3Mp8141w1YZdOnd6DVZsv
	 V7ml8aNpHm+5fYhrOWAfCYOCD8sVDD/1+RTYoz8DZFh9IrkYDIgCQCH65Mte84SzNq
	 LvYA3Xp8xB8zNX49Dx0UTdQhQup4aNiOkynqE5qbV7M+m/hZ8ufSOrMG6F1QJYTJjD
	 ulTMxFwpCH14Ze7CDqzNDZkRO9nxNX9K8ycX14X03wId75FQ0nHQNR6aiNoKXTLf+J
	 xYHdQ/G1KxnzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE02383B267;
	Tue, 22 Jul 2025 00:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175314422650.243210.16859795582435366531.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 00:30:26 +0000
References: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250717071109.8213-1-biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, biju.das.au@gmail.com, rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_173009_887067_62B05220 
X-CRM114-Status: UNSURE (   9.73  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Jul 2025 08:11:06 +0100 you wrote:
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> 
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
> 
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
    https://git.kernel.org/netdev/net-next/c/72b4612af36f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



