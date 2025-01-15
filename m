Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCEEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKP8RrHIeCMFJb5QdSHbhibyRrdg1c0FCpT82YibogY=; b=zJ+TuSXmP/3DhdNFTUGPHCNXXH
	KW8CRVZplmPCwDMCSEP8J0Sfr4DGTsePgzLtUpRuBYGYov3NYPFYsafMgA7Nn8Vc6DkQ90aLxblRr
	Bf+btLZObtPmYutvE0iWNeC0JvclfwH+IrW0VtLZ38hWp01sfFQOMQcSvb6/HxDQB+su1MtcLV2Q9
	wJ3/OQApN8X3pGSG3CFeodwXbi075OwQminPHX++9tkwK45NSCqndJUASzkU+pQDHArIUwhwZH7d/
	jRMk0O5NxVIV7BqA/hNhBxxDJJXVHa0LBTGhtdtNx0kMUD9utkhy8wI/zWzGP9Bl/jVSLT0bIYlVM
	4vg5YZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtVF-0000000ASJG-0uxi;
	Wed, 15 Jan 2025 02:51:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtTx-0000000AS6I-3NmX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 02:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FC6BA416E6;
	Wed, 15 Jan 2025 02:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C91EC4CEDD;
	Wed, 15 Jan 2025 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736909412;
	bh=XZnxBk+FcFoHxx191qImvZNg7w+IyFMnBMHTXx6L5ZE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ro8Q5VSGF3ozPz8UtYtwIDdO3bUq+DZXh2zvyVFoMzBbsLYiAfm0Vhyg06qEZ6YAm
	 hUU7XtQe6frBDOBahLq5YkoW0eCCXPnnQrKvt9HrlyJ7sADGmfRjJyL84Y7sVoDhEY
	 xyeLkf5MwkMqaeLR2neatqE0uO95H+6LLQotiMElQEwL2hd20j4CxXyRxVq6b1CFhv
	 1BDnko5EJzTjyqnD38D9cijquhOAfRudMIUk62JMZc55P0HJvHJCJ95c4bshAwlSYQ
	 YWsmpNQDzQyrO8HcMLjOlVmpNMEoRPRe0QH71rBohz9nhmnTjuCtVBYevmCab+XFwS
	 c5TgBbBqAT9Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A5F380AA5F;
	Wed, 15 Jan 2025 02:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: stmmac: further EEE cleanups (and one fix!)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690943498.230797.5869251402223823826.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 02:50:34 +0000
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 ericwouds@gmail.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_185013_916333_E82A47B7 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, 13 Jan 2025 11:45:37 +0000 you wrote:
> Hi,
> 
> This series continues the EEE cleanup of the stmmac driver, and
> includes one fix.
> 
> As mentioned in the previous series, I wasn't entirely happy with the
> "stmmac_disable_sw_eee_mode" name, so the first patch renames this to
> "stmmac_stop_sw_lpi" instead, which I think better describes what this
> function is doing - stopping the transmit of the LPI state because we
> have a packet ot send.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: rename stmmac_disable_sw_eee_mode()
    https://git.kernel.org/netdev/net-next/c/900782a029e5
  - [net-next,2/9] net: stmmac: correct priv->eee_sw_timer_en setting
    https://git.kernel.org/netdev/net-next/c/4fe09a0d64d5
  - [net-next,3/9] net: stmmac: simplify TX cleanup decision for ending sw LPI mode
    https://git.kernel.org/netdev/net-next/c/bfa9e131c9b2
  - [net-next,4/9] net: stmmac: check priv->eee_sw_timer_en in suspend path
    https://git.kernel.org/netdev/net-next/c/c920e6402523
  - [net-next,5/9] net: stmmac: add stmmac_try_to_start_sw_lpi()
    https://git.kernel.org/netdev/net-next/c/0cf44bd0c118
  - [net-next,6/9] net: stmmac: provide stmmac_eee_tx_busy()
    https://git.kernel.org/netdev/net-next/c/82f2025dda76
  - [net-next,7/9] net: stmmac: provide function for restarting sw LPI timer
    https://git.kernel.org/netdev/net-next/c/af5dc22bdb5f
  - [net-next,8/9] net: stmmac: combine stmmac_enable_eee_mode()
    https://git.kernel.org/netdev/net-next/c/ec8553673b1f
  - [net-next,9/9] net: stmmac: restart LPI timer after cleaning transmit descriptors
    https://git.kernel.org/netdev/net-next/c/d28e89244978

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



