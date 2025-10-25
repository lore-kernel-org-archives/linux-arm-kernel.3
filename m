Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347EDCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YHsvuTbL2Qa+PMnQNppX2D3lK5Z7NgosWVVfwhJTEs=; b=Ed5Rld5hoI2RSQOB4sQ87eUerB
	93xj00QTyW6HdggukfTp2FInZjr3CJ3bhX4HLX/B8/BHTx4mAthnMeFCHw95u0ZqGfLpzQshVr0N2
	G9zEpQ1FHa2DaOWhBDfE/xk/4HgQ7EDrMAjsNXBAYmCRXswv7zz/s/3theMiEGDTmq5+BbTxv4xkp
	MywSKGKXAqXX+aGBNyepVOFGZFwCOwj7LqRSDbJjSvzVxf6HJBUN+cuay79aTDB4uEEVBMHdisoZz
	ZbNqLtJFuoRj3GCTOMeXS33TqJn2v7BMrHja9jxltkZaTvC3jpqSydpdzwWgIvXq0Rh0XmCGjMDvW
	opV+SZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTkB-0000000Aol9-1I5G;
	Sat, 25 Oct 2025 02:10:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTk9-0000000Aokk-3RH4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 02:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B138A4523F;
	Sat, 25 Oct 2025 02:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B53EC4CEF1;
	Sat, 25 Oct 2025 02:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761358256;
	bh=mCPoHtHlO0sapP4Re17dwckEUzpCJ4F8z89uuFCqu0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X0je+6y5nPpzgYupq5+dgtahZgIOJb4dskI1lP7bde+T/WckmlVpgTqkILW09L0Rq
	 7n9N/R1wa1FdVfWAZ/tIEwQTFSJQsqXZCod1rLnlkb1vMBhf1Wnl2hFrR9lHJJfZIc
	 CyqnNCtO4IWnqMRQ1hg2y+fCBHfLSW7RDdTlQOmKdQ/Kg0Gxr85zHETe1FntPypm6a
	 RwEWB5FB83QYKBdtuYVr7x3xqxinK3FU06vXvgdyVQa4mF9EwNh2ilcU5YcwFSoIsa
	 ThuNMXV8dH8jM6HJWodq3JKt9Onfj4HYw27Pr8T/CzLWcH9iVBg1rEY78pVHz4Q9lE
	 TCHbZegaMf1mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DAB380AA59;
	Sat, 25 Oct 2025 02:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: pcs support part 2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176135823625.4124588.6828085723534144457.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:36 +0000
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
In-Reply-To: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_191057_875502_ADE35454 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu, 23 Oct 2025 10:46:09 +0100 you wrote:
> Hi,
> 
> This is the next part of stmmac PCS support. Not much here, other than
> dealing with what remains of the interrupts, which are the PCS AN
> complete and PCS Link interrupts, which are just cleared and update
> accounting.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: add stmmac_mac_irq_modify()
    https://git.kernel.org/netdev/net-next/c/442a8c68f083
  - [net-next,2/2] net: stmmac: add support for controlling PCS interrupts
    https://git.kernel.org/netdev/net-next/c/eed68edac508

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



