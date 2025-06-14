Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF449C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 01:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVgxhylRWtF8uS7jJvJgHuhYOJhenAWkgY2eBiXsDZc=; b=20hJumgUTkyqifN7xuMPaUqbOm
	8ErO/fKu4Wy7t74s7B/sdZ4wO9NhOACcYmvwdPgg7b7heZyNU4UUE6lNgxJuntp+hJ/vUoQMjeL19
	/d1FstUKgw6QoVnpdvoXJfUY/h3aI/ACUK+kCvvuE8UiUcbcmg5ovDGzaAFN+yfg/Kzt4Qjf3VKF5
	UTbuj+k/R63H//xw6a8p3d+P6aP8sWOCc+Ut8nm0b2mnLAFsZyb3e4IU6YmJ+fJhEsIkZDMD8FAcE
	u3t+oskPAGqTi2n3GfyDm1G8jlM+xvi++nLbY9MetQwDVj1rgX1+/RG773ynXE2sMzXoZtcC7+hFs
	E96HZebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFnA-00000000TXx-0dOR;
	Sat, 14 Jun 2025 01:34:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFis-00000000T9c-09P4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 01:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5377A4AB6B;
	Sat, 14 Jun 2025 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3502AC4CEED;
	Sat, 14 Jun 2025 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864617;
	bh=QIV+0F7UZEbXQVCCIS9fHsBk/4g/yEoVPJWLkDhWNBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qqtu94yfZ2DfHot5pwD3vPDL5d2cNUN1FDRalN7UwtNAXuBHTNxbibyfZriuRde1A
	 EsW/+NPfQgMmzB6g+H0d5iOD5ahWTLUhy2eUXXJzfbhxgTj4DChuj5CY/+/MpQb2Kd
	 YSyuzt540/ABCkexn4DGgJ0mibZEmpVVnJUT2/oHhENZ8f3ULqRF6qhDzfA/CgOsI/
	 gqMmb/TQU0n/YTBBhq/nfYoXgTYD+Gs7mcM7LRxFtOCXsqcAJN8Ck8bZInSsSohsNp
	 /FAoYZkYmr1jHlkY5azzPPwvX3VuyLsfYxMj2RVIh52WuwCcyJQVARi2D5oRkrGpl8
	 N2tqyQ2apoWaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1C380AAD0;
	Sat, 14 Jun 2025 01:30:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: stmmac: rk: much needed cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174986464674.950968.7803319715888152554.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 01:30:46 +0000
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_183018_102026_8D2668D1 
X-CRM114-Status: UNSURE (   9.55  )
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

On Thu, 12 Jun 2025 16:40:54 +0100 you wrote:
> Hi,
> 
> This series starts attacking the reams of fairly identical duplicated
> code in dwmac-rk. Every new SoC that comes along seems to need more
> code added to this file because e.g. the way the clock is controlled
> is different in every SoC.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: rk: add get_interfaces() implementation
    https://git.kernel.org/netdev/net-next/c/1f59e30403a7
  - [net-next,2/9] net: stmmac: rk: simplify set_*_speed()
    https://git.kernel.org/netdev/net-next/c/e6e9e837d312
  - [net-next,3/9] net: stmmac: rk: add struct for programming register based speeds
    https://git.kernel.org/netdev/net-next/c/3de607d13b6b
  - [net-next,4/9] net: stmmac: rk: combine rv1126 set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/29f0aca13914
  - [net-next,5/9] net: stmmac: rk: combine clk_mac_speed rate setting functions
    https://git.kernel.org/netdev/net-next/c/d8d6096f8161
  - [net-next,6/9] net: stmmac: rk: combine .set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/3930c2cca657
  - [net-next,7/9] net: stmmac: rk: simplify px30_set_rmii_speed()
    https://git.kernel.org/netdev/net-next/c/c5cddcdbd2af
  - [net-next,8/9] net: stmmac: rk: convert px30_set_rmii_speed() to .set_speed()
    https://git.kernel.org/netdev/net-next/c/9165487d21a4
  - [net-next,9/9] net: stmmac: rk: remove obsolete .set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/0f3a079786ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



