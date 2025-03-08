Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D6AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 03:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDx292US95jYkqQ2/FiW9XZ6IbU+8baV+8evi8n1Ng0=; b=B9L/xlBGRXp82watbUBNxWfGgZ
	H0sNG9IcDeP6AROP33HKenLekk77jDH2w4MGMrwUBZ6hc/MBJmu4T/9q/OEq2ijmeCsW5fb4MMaYR
	4BOg99v2I0eBa19iBuyREvAc6eMD+YHqKe/geOXL/CThYEbYBwC25U6YzR0c4guB6INvzWjzFGa3p
	CF0K6m4UMCFM7QSOVrChR++k4jfFs/xFrSciCuou8XRBmiymY4yjdG69eT2pX9Z+GSd+jRzJXxxj1
	vzmiT1z4AJchN3o3VnP+f/dxj7mY5rCpRNXey7j25/O3QUDn9sQQfujlbqXJgwV7mGeYRYQQ4ywxB
	vAuATg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tql5h-0000000G7sh-0V8v;
	Sat, 08 Mar 2025 03:43:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tql2o-0000000G7NL-24cb;
	Sat, 08 Mar 2025 03:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 263335C66B2;
	Sat,  8 Mar 2025 03:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C3C4CEE8;
	Sat,  8 Mar 2025 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741405208;
	bh=VbfFId+c8hU5TKBC8vVV3K3Ub0jULqeS8673sNKaj7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mV7oTwwpvL0aeS+JSNZl3l8a9/aRCG7F9Js6RToq04XDgUGqYoGAPcje1iM9jtDNn
	 8KdCPVCgeiA9aadZfulZYr4hUzqfWPIyhUY0uZZqpO8yYKKqFDsIlNX3iQ1qBSIi9b
	 VLVPJMaSHVflnFMNfUrjcW+MmlWE0a+zhK/SfdfyreuWSia4jVQ+wyJBEXBtnk8MJX
	 RGCNk0ygocpcj0TgkwAu6AegZtA67CQDjTw0H2rO+59j0Vm7XTv//hUK+oVAG3B1+V
	 rc9BVSkzgtfG+38Ici/qeBxoWWQ7CwfbubBDbn6H1hqsKQ0P4FRe3OgtGN8lsPsrgd
	 CgtPosWoTw7Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71901380CFFB;
	Sat,  8 Mar 2025 03:40:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 0/4] riscv: sophgo: Add ethernet support for
 SG2044
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174140524199.2565853.4357984309163755989.git-patchwork-notify@kernel.org>
Date: Sat, 08 Mar 2025 03:40:41 +0000
References: <20250307011623.440792-1-inochiama@gmail.com>
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, clement.leger@bootlin.com,
 emil.renner.berthing@canonical.com, jan.petrous@oss.nxp.com,
 yong.liang.choong@linux.intel.com, jszhang@kernel.org,
 rmk+kernel@armlinux.org.uk, olteanv@gmail.com, 0x1207@gmail.com,
 romain.gantois@bootlin.com, fancer.lancer@gmail.com,
 joe@pf.is.s.u-tokyo.ac.jp, l.rubusch@gmail.com,
 bartosz.golaszewski@linaro.org, peppe.cavallaro@st.com, joabreu@synopsys.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, looong.bin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_194010_571738_227D2D15 
X-CRM114-Status: UNSURE (   7.59  )
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

On Fri,  7 Mar 2025 09:16:13 +0800 you wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Changed from v6:
> - https://lore.kernel.org/netdev/20250305063920.803601-1-inochiama@gmail.com/
> 1. rebase against latest net-next/main
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
    https://git.kernel.org/netdev/net-next/c/114508a89ddc
  - [net-next,v7,2/4] net: stmmac: platform: Group GMAC4 compatible check
    https://git.kernel.org/netdev/net-next/c/f8add6654d3c
  - [net-next,v7,3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
    https://git.kernel.org/netdev/net-next/c/9ef17cafc36b
  - [net-next,v7,4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
    https://git.kernel.org/netdev/net-next/c/a22221ef5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



