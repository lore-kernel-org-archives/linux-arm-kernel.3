Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE54D31A08
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 03:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsZPydRHeRaOFVIg336EGIuJoEGmppBsiFGcFo2GugA=; b=IWcmpHw7xjYVnKAH1KuNO+8UF4
	fykrPio14egEmWqJsx0LUoOS+VB4RzMmK9dJdN8BTWAgZxsnW8wWVqpvaLyc9SLE5oSqvleQLvLiS
	G1n2gVlV64TvqRlBz2R1rvNA/DPVGTS/rkCCQTQabxzujqrLcO5q4zL+rloM00lAPmTAnpTsLAtuE
	l12WhAXVEUJUfmZAlfY+HhTArHoRMcl1f6NHiEti4vNWIz4KhMF0uIDjCgiNkvXBybqMM7wLiu6zX
	yHPUwAngkmem1ijMBuWmA6XsjFTOveLw+fCabcKReT0BQjxMV3HRXzzmqxeQbQSZrX/iSOD1Ibjj8
	sODhI9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfrB7-000000080nw-2Mm7;
	Wed, 14 Jan 2026 03:04:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfrB5-000000080nY-0WeG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 03:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9562140D52;
	Wed, 14 Jan 2026 03:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A330C19423;
	Wed, 14 Jan 2026 03:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768359849;
	bh=jJVWTKrbZnnrbSSyMrERZV7TPbUDbyAnpakRYlfbiWE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NWD5rE6+pXNTWgwxgdJh+3zWszpwjjMyTMfd6sG/wGgRdujF8GeSf5UXNMsTgpvYt
	 6WSrJOuOn+CTYXmfUd30Gmg/v+iQtOJmyX8WIiRnwp+7RnMng2qENI321/tAQqfmAc
	 rKoyogVmV83ymAyX0x5hpHNQtaPw7O1CNKsSpR1QHgVCjZTBSTUux6sC4xB7YSUQUT
	 fWwcJNVt2a6wHwqYr+nKeaqeooq9/0KBYVcgWl0gYkklRvxFEEYZcGclIChI2sRGsG
	 jZ1AutkgWo9HFWL04xFyHRtOF0Qw4W3hEJPNhecunfECJUmmV/+LQ577tXSf/G/W9D
	 ISJJpL1YLMpeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B649F3808200;
	Wed, 14 Jan 2026 03:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v22 00/14]  net: phy: Introduce PHY ports
 representation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176835964227.2565069.4308063830365885517.git-patchwork-notify@kernel.org>
Date: Wed, 14 Jan 2026 03:00:42 +0000
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, andrew@lunn.ch,
 kuba@kernel.org, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@csgroup.eu, herve.codina@bootlin.com, f.fainelli@gmail.com,
 hkallweit1@gmail.com, vladimir.oltean@nxp.com, kory.maincent@bootlin.com,
 kabel@kernel.org, o.rempel@pengutronix.de, nicveronese@gmail.com,
 horms@kernel.org, mwojtas@chromium.org, atenart@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, romain.gantois@bootlin.com, daniel@makrotopia.org,
 dimitri.fedrau@liebherr.com, tariqt@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_190411_209037_9EE89218 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu,  8 Jan 2026 09:00:25 +0100 you wrote:
> Hi everyone,
> 
> This is v22 of the phy_port work. Main items from this versions are :
> 
>  - Rebase on net-next :)
>  - Removed a "contains" keyword in the binding
>  - Added a comment for phy_port SFP implementation
> 
> [...]

Here is the summary with links:
  - [net-next,v22,01/14] dt-bindings: net: Introduce the ethernet-connector description
    https://git.kernel.org/netdev/net-next/c/fb7a8d0786e4
  - [net-next,v22,02/14] net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
    https://git.kernel.org/netdev/net-next/c/3f25ff740950
  - [net-next,v22,03/14] net: phy: Introduce PHY ports representation
    https://git.kernel.org/netdev/net-next/c/589e934d2735
  - [net-next,v22,04/14] net: phy: dp83822: Add support for phy_port representation
    https://git.kernel.org/netdev/net-next/c/333c29a27f96
  - [net-next,v22,05/14] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
    https://git.kernel.org/netdev/net-next/c/ffb8587363a3
  - [net-next,v22,06/14] net: phy: Create a phy_port for PHY-driven SFPs
    https://git.kernel.org/netdev/net-next/c/07f3ca9e092c
  - [net-next,v22,07/14] net: phy: Introduce generic SFP handling for PHY drivers
    https://git.kernel.org/netdev/net-next/c/d7c6082f7e77
  - [net-next,v22,08/14] net: phy: marvell-88x2222: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/ea317f077a38
  - [net-next,v22,09/14] net: phy: marvell: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/1384e1383829
  - [net-next,v22,10/14] net: phy: marvell10g: Support SFP through phy_port
    https://git.kernel.org/netdev/net-next/c/35d1a5464b47
  - [net-next,v22,11/14] net: phy: at803x: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/4e26a284b9be
  - [net-next,v22,12/14] net: phy: qca807x: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/154bc3b66c31
  - [net-next,v22,13/14] net: phy: Only rely on phy_port for PHY-driven SFP
    https://git.kernel.org/netdev/net-next/c/bad869b5e41a
  - [net-next,v22,14/14] Documentation: networking: Document the phy_port infrastructure
    https://git.kernel.org/netdev/net-next/c/62518b5b3d8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



