Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67421CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 01:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qV5Qohp4C3MlXghAlTMHvo7o5st/jIjbzOpR3A+jqE=; b=or776rA7J0c3xoOKmOjGA9YLZ0
	L34XHro5g6901SQYL3C9vZNJcv3mA39i9NkTECbF5eLa80mpLgBdCHQVvXokpDlBxYmQ8MQgJKmjB
	tQf6D1g7rikVcDwT4HX/+YL0n7kUP3zy9pvQ9h0nD6HAPSMBfBaFQfFIUjDpNMeYjMj4HhNDUAU1W
	M+bl8Dh/DDYQ/AOVdtZKnlIU7KXJX85dAYyBC2r6Rayl/FDqHdFuczIxgV7sH5WgjIg6qhTBThOUF
	dOPd+vDzi3ByIWtITvXENHU7WXCoLwBWaOSdM3i6yokTMP0fqzpRj5uFIpfh/tyrAf+e3gEYslIGP
	ICz3KMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdNV-00000006LL8-1vPy;
	Tue, 11 Nov 2025 01:41:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdNS-00000006LKh-1ywg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 01:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E1B54377A;
	Tue, 11 Nov 2025 01:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760D7C4CEFB;
	Tue, 11 Nov 2025 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762825257;
	bh=5fszHu+0NCe/j4FS6aCuGypK1jI8uEB60+HhsE1RoDM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ej5vH736g5NaLrNiPp3r8PZLRcIYOfQLNlEfvnPDfkI9IJSISWOA2ekr+xdlF31Zi
	 9q5eoncrecK2zUGqVCWk3wVGtGHpnT4Vip7PtoPpWJe5wAHbbCk7XA7X1ZfQyADUxa
	 3P851l+s5FAlKV4VLYc5MOgQ5AfQM8jvPiX9mpw3dyetXLvzToiApKSzGPIDDpNwaL
	 l4h8BrAH8vSWPg3038O2LY0Nh49YFze0jWmJnaS5M/DnfFt1QpIMtUNfTEQSCavqab
	 7IiuRqTmE/WO5aA3+vtoLgRRzMdfREkNVy6vR7+LkyHxW3WQQxVBRDwOfn15DF17h1
	 FbvZ2F3a1dqmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E2E380CFD7;
	Tue, 11 Nov 2025 01:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176282522801.2843765.16848615144063968700.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 01:40:28 +0000
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_174058_534823_8304F401 
X-CRM114-Status: GOOD (  10.23  )
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

On Fri, 7 Nov 2025 08:27:44 +0000 you wrote:
> Convert ingenic to use the new ->set_phy_intf_sel() method that was
> recently introduced in net-next.
> 
> This is the largest of the conversions, as there is scope for cleanups
> along with the conversion.
> 
> v2: fix build warnings in patch 9 by rearranging the code
> v3: fix smatch warning in patch 11, added Maxime's r-b.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/11] net: stmmac: ingenic: move ingenic_mac_init()
    https://git.kernel.org/netdev/net-next/c/2dd63c364534
  - [net-next,v3,02/11] net: stmmac: ingenic: simplify jz4775 mac_set_mode()
    https://git.kernel.org/netdev/net-next/c/307a575775fd
  - [net-next,v3,03/11] net: stmmac: ingenic: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/da6e9fd1046f
  - [net-next,v3,04/11] net: stmmac: ingenic: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/dbf99dc7d166
  - [net-next,v3,05/11] net: stmmac: ingenic: prep PHY_INTF_SEL_x field after switch()
    https://git.kernel.org/netdev/net-next/c/14497aaa5eb6
  - [net-next,v3,06/11] net: stmmac: ingenic: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/0e2fa91c55c0
  - [net-next,v3,07/11] net: stmmac: ingenic: move "MAC PHY control register" debug
    https://git.kernel.org/netdev/net-next/c/35147b5c9e41
  - [net-next,v3,08/11] net: stmmac: ingenic: simplify mac_set_mode() methods
    https://git.kernel.org/netdev/net-next/c/608975d4d791
  - [net-next,v3,09/11] net: stmmac: ingenic: simplify x2000 mac_set_mode()
    https://git.kernel.org/netdev/net-next/c/2284cca0bced
  - [net-next,v3,10/11] net: stmmac: ingenic: pass ingenic_mac struct rather than plat_dat
    https://git.kernel.org/netdev/net-next/c/9352f74fd13d
  - [net-next,v3,11/11] net: stmmac: ingenic: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/34bf68a69122

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



