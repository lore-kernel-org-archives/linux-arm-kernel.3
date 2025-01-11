Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2324DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNWFk0HpvzgfhSifLXpgahMAyBhuMS9OHWywQveo/zs=; b=0+bvsoCac5uFUrVCkLlOpFkh/l
	StAqT/B8mQkOk9VdOBZc3bs3E3yuSdv5uuiaKH6gJfoD5I0bB6OP+fX2dVcu6k/U3NzZx24uiERC3
	mg0YekZa10fVfwesz0KkEFGca8I8aAyRgnI+KUec11k6MtoSBAxmyJgM0PR/j3MJJRzVMBk4Iif1b
	arvgciAvbqfV/qOpcjjMhzQ4iKPrySFJN+/sq0t7knwqllIkn2UzEFjFF7BGD+owLr9KRLy2Ng1ir
	tjIymC6kXMrzrQH82CCCgkHcYkDwBp4iPgcgSUOHkCPPoNs3wTN38yLZA3scGzf95cO+Tck7GIPEN
	/yiprusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQyb-0000000HYqR-1X2T;
	Sat, 11 Jan 2025 02:11:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQxN-0000000HYis-04T0
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 02:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oNWFk0HpvzgfhSifLXpgahMAyBhuMS9OHWywQveo/zs=; b=MaaCI3q1FmVW+leDgix+2tsWVv
	bSkoycnQwdelyT30usJjU5LLNX1hE3NHwD+Zsj13c5+/LoSqsOuD5GDkRXXcE6qJdwNJ2j6pvVvLr
	MRNxTr8Q3huNdu4cqb9aURcX7M/NIVpss+m1nFZslgbwRN7NnmjI5rgsTHjscNtLykuPBmTlqrHyp
	LUWW6bQqxE+NexrFAt+D2cJkc4SYlchgT/IBBn32HF16xgtM5SUomNIpdmMZ76TEPrq9d75wiotPT
	HDPYz0a52ml7dc1RwjUYWZZnD9KMrnQHs7ked5YrwLa2FPHpDrAP21DZHLT5Srlq+fapPwNLTpDaa
	bXOfbacA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQxJ-0000000A0BN-1Wp5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 02:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 589265C595C;
	Sat, 11 Jan 2025 02:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C4CED6;
	Sat, 11 Jan 2025 02:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736561423;
	bh=DEfwp4XBTsdzzsNRV5w7wnpG6wWSu/8qAaGrRyAKc5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qJf7OL/sLA88XpOeplNMc/0+yDnKglR9KA5yWmzEG+Nl5sT2fSuIK6KhvRAroa/6p
	 QlctkjG3cK5lGL+ficRQBy8nLWEN3mkxJrUVyuoZFRp58EUCVfsFOBuLtMk6mb2Z1V
	 pwLz7I+Tr3vp94q7sUbS4presUbVgwvyTsBYc+0JDJnqlepbVEdZ5F9xUtCFGe9wlL
	 OXTcQjNx2fogkqNzVI+c3NhmKGoXoDRIXrY0qzJUHkJixQoSDRsoQDCk4x7f2s7Wcu
	 emBvY+6tj5t44/urzVpXdLaQMtwezVL2MzrYioIQn35EzwqqfLm7wn8W1/7K4g3CEL
	 xn5/csFmZpkdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C89380AA57;
	Sat, 11 Jan 2025 02:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 00/18] net: stmmac: clean up and fix EEE
 implementation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173656144498.2267647.15302002781849970108.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 02:10:44 +0000
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_021029_785425_B9A9F3CA 
X-CRM114-Status: GOOD (  13.69  )
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

On Wed, 8 Jan 2025 16:47:24 +0000 you wrote:
> Hi,
> 
> This is a rework of stmmac's EEE support in light of the addition of EEE
> management to phylib. It's slightly more than 15 patches, but I think it
> makes sense to be so.
> 
> Patch 1 adds configuration of the receive clock phy_eee_rx_clock_stop()
> (which was part of another series, but is necessary for this patch set.)
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/18] net: phy: add configuration of rx clock stop mode
    https://git.kernel.org/netdev/net-next/c/cf337105ad38
  - [net-next,v4,02/18] net: stmmac: move tx_lpi_timer tracking to phylib
    https://git.kernel.org/netdev/net-next/c/1991819debaa
  - [net-next,v4,03/18] net: stmmac: use correct type for tx_lpi_timer
    https://git.kernel.org/netdev/net-next/c/bba9f4765515
  - [net-next,v4,04/18] net: stmmac: use unsigned int for eee_timer
    https://git.kernel.org/netdev/net-next/c/7e19a351b22d
  - [net-next,v4,05/18] net: stmmac: make EEE depend on phy->enable_tx_lpi
    https://git.kernel.org/netdev/net-next/c/beb1e0148e6d
  - [net-next,v4,06/18] net: stmmac: remove redundant code from ethtool EEE ops
    https://git.kernel.org/netdev/net-next/c/80fada6c0d3e
  - [net-next,v4,07/18] net: stmmac: clean up stmmac_disable_eee_mode()
    https://git.kernel.org/netdev/net-next/c/e40dd46d2fc5
  - [net-next,v4,08/18] net: stmmac: remove priv->tx_lpi_enabled
    https://git.kernel.org/netdev/net-next/c/865ff410a071
  - [net-next,v4,09/18] net: stmmac: report EEE error statistics if EEE is supported
    https://git.kernel.org/netdev/net-next/c/517dc0450675
  - [net-next,v4,10/18] net: stmmac: convert to use phy_eee_rx_clock_stop()
    https://git.kernel.org/netdev/net-next/c/a3242177d9f2
  - [net-next,v4,11/18] net: stmmac: remove priv->eee_tw_timer
    https://git.kernel.org/netdev/net-next/c/2914a5cd811a
  - [net-next,v4,12/18] net: stmmac: move priv->eee_enabled into stmmac_eee_init()
    https://git.kernel.org/netdev/net-next/c/0a900ea89a0c
  - [net-next,v4,13/18] net: stmmac: move priv->eee_active into stmmac_eee_init()
    https://git.kernel.org/netdev/net-next/c/1797dd4e3e8e
  - [net-next,v4,14/18] net: stmmac: use boolean for eee_enabled and eee_active
    https://git.kernel.org/netdev/net-next/c/cfd49e5fc30c
  - [net-next,v4,15/18] net: stmmac: move setup of eee_ctrl_timer to stmmac_dvr_probe()
    https://git.kernel.org/netdev/net-next/c/84f2776e3919
  - [net-next,v4,16/18] net: stmmac: remove unnecessary EEE handling in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/27af08164247
  - [net-next,v4,17/18] net: stmmac: split hardware LPI timer control
    https://git.kernel.org/netdev/net-next/c/17f47da103a6
  - [net-next,v4,18/18] net: stmmac: remove stmmac_lpi_entry_timer_config()
    https://git.kernel.org/netdev/net-next/c/1655a2279971

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



