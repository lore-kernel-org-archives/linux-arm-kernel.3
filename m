Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F58C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zdk7cJsED5u3sVNSvmH7r+gr5N2ZEPAiGbOl+S/6VUY=; b=S3V8mGXQo5jZTj+dvkcJQXAUUZ
	i+sIEYJ2bwFgkNLm7a0gXHVmG/HtXW7bIK2G/J/VIOSF8muRtBeJa36x/epnK6vvg4O2SaeIyNCjd
	L1FKvbuZ0gZ1ud1GmfRmuPZ+Nz5GjjaZQwvOfVMcnwJjhN+9RhSddGcbgoAVK49MHCNJvnPvboyMK
	Sdbn/1TwSf/vjFBhcprl/SVw8KfJ2NFxYuM0HVjSBY/E5ilAKojE8yxPR73YxrUa1ivvCJfPT2Z7R
	nzZmdiK1ELmZlgz67cK2Ali+/f/IGEYUZUL17EMza9TX94VSoEICpzEtyys01jfFy1kz6LU13xR1I
	+ygnWMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzT-0000000B5EG-2ruo;
	Fri, 07 Feb 2025 20:30:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUfy-0000000B1VZ-4AMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A67DA43BDF;
	Fri,  7 Feb 2025 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB72FC4CED6;
	Fri,  7 Feb 2025 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738959009;
	bh=Rb6tOrngBKFH/uFi5jXEWLdvU2cKpJWevMKs0KTRLUs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jT6w/IUsDCfqAGE1rHixJpsbEIHsyac3G88pcgDVqhXoqbFDrA1nkLKZ8ExpVE13r
	 Li6qq/Y7u12Tes8DnkPUqsTKQKfzQJjQjNcszTkWnjRwbZLiYwtJoCDpEVrqix/+KY
	 MhzZzvc2bBkQtNCqstWeFWeZvK3MdmsnjjrfBUZ0Bnm5B1ClGLh9tpFfCoh9Tw1MYL
	 /2QXkBfzA90nL66vXWQEyegL2bRju/KvIfgjaITLMhptU4uAgsFmKoqBpuUFrTzrjb
	 AH9oPm3OAsKj43AdhK0j2BTCkeB7v22MA+0z+VYugZP0tXkmbl+EtpN9486RKWgCk3
	 yhKI1qqmAYuFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEAA380AAF4;
	Fri,  7 Feb 2025 20:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/14] net: stmmac: yet more EEE updates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173895903778.2367164.15308538342588355637.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 20:10:37 +0000
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_121011_166958_F384382C 
X-CRM114-Status: GOOD (  10.30  )
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

On Wed, 5 Feb 2025 13:39:38 +0000 you wrote:
> Hi,
> 
> Continuing on with the STMMAC EEE cleanups from last cycle, this series
> further cleans up the EEE code, and fixes a problem with the existing
> implementation - disabling EEE doesn't immediately disable LPI
> signalling until the next packet is transmitted. It likely also fixes
> a potential race condition when trying to disable LPI vs the software
> timer.
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: delete software timer before disabling LPI
    https://git.kernel.org/netdev/net-next/c/a923378ab0c4
  - [net-next,02/14] net: stmmac: ensure LPI is disabled when disabling EEE
    https://git.kernel.org/netdev/net-next/c/64c9936330cc
  - [net-next,03/14] net: stmmac: dwmac4: ensure LPIATE is cleared
    https://git.kernel.org/netdev/net-next/c/6e9c71ee65eb
  - [net-next,04/14] net: stmmac: split stmmac_init_eee() and move to phylink methods
    https://git.kernel.org/netdev/net-next/c/cc3f4d5508c8
  - [net-next,05/14] net: stmmac: remove priv->dma_cap.eee test in tx_lpi methods
    https://git.kernel.org/netdev/net-next/c/4abd57687355
  - [net-next,06/14] net: stmmac: remove unnecessary priv->eee_active tests
    https://git.kernel.org/netdev/net-next/c/2cc8e6d30895
  - [net-next,07/14] net: stmmac: remove unnecessary priv->eee_enabled tests
    https://git.kernel.org/netdev/net-next/c/faafe39c77fb
  - [net-next,08/14] net: stmmac: clear priv->tx_path_in_lpi_mode when disabling LPI
    https://git.kernel.org/netdev/net-next/c/54f85e5221c3
  - [net-next,09/14] net: stmmac: remove unnecessary LPI disable when enabling LPI
    https://git.kernel.org/netdev/net-next/c/9b6649a81075
  - [net-next,10/14] net: stmmac: use common LPI_CTRL_STATUS bit definitions
    https://git.kernel.org/netdev/net-next/c/6e37877d222d
  - [net-next,11/14] net: stmmac: add new MAC method set_lpi_mode()
    https://git.kernel.org/netdev/net-next/c/395c92c0fe3e
  - [net-next,12/14] net: stmmac: dwmac4: clear LPI_CTRL_STATUS_LPITCSE too
    https://git.kernel.org/netdev/net-next/c/a323ed92e40e
  - [net-next,13/14] net: stmmac: use stmmac_set_lpi_mode()
    https://git.kernel.org/netdev/net-next/c/305a0f68cfbf
  - [net-next,14/14] net: stmmac: remove old EEE methods
    https://git.kernel.org/netdev/net-next/c/62b0a039cac2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



