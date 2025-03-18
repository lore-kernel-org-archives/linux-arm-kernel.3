Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D42C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bx3hlLUPA7P25RPEJWCUY5OcL9K6BpDlbii0s1hppY=; b=qv7RRxg2XxNe2zxUuk2e87hd+v
	yTCeC3pTSQLo8cKa3lDOJDVSIETU5Ns10Wz9Fyny+VZI1oGKS053ZeqZPHErw3OxaVf8e/8S1xZ+X
	bHvLjfp1qrYrVXnPmpgtpdD8jpbdINHL3YySNApNZlATGypKjdgGM8FTQe7ZjkN7fS2Led7bQPFc/
	QnnsVvD5KaQiPZQkfLWpU4r0LVtFxi0SiN7EhyOdsft5XgaAp5TDDtXFngwYBnAfMY0vTOL/AGKyF
	Glo4zfZY9ANuiDSt9ySebmY+tHX8BR8lnE3mL6EYBGJ1MJjInx35mgheSkzKkiwu6b47EEVs/6Cpd
	25Mxvydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS5K-000000057yq-02tN;
	Tue, 18 Mar 2025 08:14:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS1Q-000000056dj-3dwi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 496A85C5820;
	Tue, 18 Mar 2025 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE585C4CEDD;
	Tue, 18 Mar 2025 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742285399;
	bh=e4UkUqezG5Edul9MR9g7cuOdXGh4POpZl16i1wixQDQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZWjcObUZxhGiH4eIk1yWPqxDOE5HkuArp5QehkKNI6dRN9NBC7+htVOdEkVXhhUqS
	 yZ6t/6zxWh4M7++33uZERs75I4qJMmZPg8rwPACrkP9AU768Y1BajdVFGn1B3rIf1i
	 soZ/X1MkWoTqesRTXq6KABjtY/9szNg13Ap6lHIgA3poaB7NOYCji+pgbeQNfR5/5c
	 Kip0rplrjKD66t39hV4AEzqv6WZK9WqPtC8W7YyGQLuTSk/J12P5UQbaeZ0Sz044VV
	 io4OfxejnSAQToQbHLpCUAwXUYoiNp0DdFwKqiK2QE9QSgJnYHGfB2HB92nWEy53/Y
	 /u4vLPFKKK1aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E85380DBE8;
	Tue, 18 Mar 2025 08:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 00/13] net: phy: Rework linkmodes handling in a
 dedicated file
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174228543527.4071400.14783355936899188267.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 08:10:35 +0000
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, linux@armlinux.org.uk, hkallweit1@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@csgroup.eu, herve.codina@bootlin.com, f.fainelli@gmail.com,
 vladimir.oltean@nxp.com, kory.maincent@bootlin.com, o.rempel@pengutronix.de,
 horms@kernel.org, romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_011001_023177_5461331E 
X-CRM114-Status: GOOD (  12.55  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  7 Mar 2025 18:35:57 +0100 you wrote:
> Hello everyone,
> 
> This is V5 of the phy_caps series. In a nutshell, this series reworks the way
> we maintain the list of speed/duplex capablities for each linkmode so that we
> no longer have multiple definition of these associations.
> 
> That will help making sure that when people add new linkmodes in
> include/uapi/linux/ethtool.h, they don't have to update phylib and phylink as
> well, making the process more straightforward and less error-prone.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,01/13] net: ethtool: Export the link_mode_params definitions
    https://git.kernel.org/netdev/net-next/c/79f88a584e35
  - [net-next,v5,02/13] net: phy: Use an internal, searchable storage for the linkmodes
    https://git.kernel.org/netdev/net-next/c/d8c838a57ce2
  - [net-next,v5,03/13] net: phy: phy_caps: Move phy_speeds to phy_caps
    https://git.kernel.org/netdev/net-next/c/8c8c4a87933d
  - [net-next,v5,04/13] net: phy: phy_caps: Move __set_linkmode_max_speed to phy_caps
    https://git.kernel.org/netdev/net-next/c/4823ed060919
  - [net-next,v5,05/13] net: phy: phy_caps: Introduce phy_caps_valid
    https://git.kernel.org/netdev/net-next/c/87b22ce31235
  - [net-next,v5,06/13] net: phy: phy_caps: Implement link_capabilities lookup by linkmode
    https://git.kernel.org/netdev/net-next/c/dbcd85b05c5b
  - [net-next,v5,07/13] net: phy: phy_caps: Allow looking-up link caps based on speed and duplex
    https://git.kernel.org/netdev/net-next/c/fc81e257d19f
  - [net-next,v5,08/13] net: phy: phy_device: Use link_capabilities lookup for PHY aneg config
    https://git.kernel.org/netdev/net-next/c/c7ae89c6b4d5
  - [net-next,v5,09/13] net: phylink: Use phy_caps_lookup for fixed-link configuration
    https://git.kernel.org/netdev/net-next/c/de7d3f87be3c
  - [net-next,v5,10/13] net: phy: drop phy_settings and the associated lookup helpers
    https://git.kernel.org/netdev/net-next/c/ce60fef7fecc
  - [net-next,v5,11/13] net: phylink: Add a mapping between MAC_CAPS and LINK_CAPS
    https://git.kernel.org/netdev/net-next/c/3bea75002a05
  - [net-next,v5,12/13] net: phylink: Convert capabilities to linkmodes using phy_caps
    https://git.kernel.org/netdev/net-next/c/4ca5b8a258b6
  - [net-next,v5,13/13] net: phylink: Use phy_caps to get an interface's capabilities and modes
    https://git.kernel.org/netdev/net-next/c/3bd87f3b4405

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



