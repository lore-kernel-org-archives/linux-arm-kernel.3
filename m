Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAF0C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fdnq6nqEBB+r/8/KAN754FPwlV+SaQ7SlWtRGIAmTOc=; b=N26G+zcnl7YJOyfQGbxW3Hf2/v
	rDWnaNoK2X231hgPdgyEyGaue+nDUeDecwb2u0SgNPjtdE/rJrvcErkY2US1CP5xgqrGNkrK1h9ur
	CCjwgUOxTeybzAFpTb/yGO1Z30HWapBInZ8PsfoEXC5ffsSHguraw5vO0+vg/SfpcnsWdLxyPwqFo
	SAp8/b8D62v/YNenpJy+/jvr79im4By7iaZVK54j3zdLSUsG52nUU7/Xq0Q0IyP5YsZ3Rrq6PnUjV
	cn2qE7RJNY/SFDbxfGDDhq//p7wvoGXRDmzoc9NaN9fhODxIx3dxR8rEiAB0I/ZxFVnmD6Mx/hBR2
	XFqkIJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeW5-00000006nsF-2S87;
	Wed, 05 Mar 2025 02:29:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQi-00000006htp-2END
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 01:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fdnq6nqEBB+r/8/KAN754FPwlV+SaQ7SlWtRGIAmTOc=; b=e6og+jwRIiR4ueVondoQNOU1/E
	ZQ872vCtWYZ8K8vO2qpkcpMrY00+V1qSmvqNaENNB9QbO8nL0mjLTUTG3935nhuCJ402ZkMvMvz5W
	4RsqQ98q6UFGCWc1A7EUdJmp49KV/o8eZ4nKBhsT/4E91HFkw6brk86s9I0ymNjwZBD4CxuRyU8i4
	lYjgzZCDqIvvWAYlhi3R8HmDTGooBJ2lmU1JggHjYjCfc4A77r++umgkD5+l8igcEbl59kvywqHBP
	dcX6f9Z1Z4ghj5quDvjIKHbjB812zT10JOrCE82vTP+A9yUZTjxZtppdS9Vas6a6S2hG5/bPOyZnN
	We12oxBA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdQb-00000000IYg-3EfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 01:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C87F95C6527;
	Wed,  5 Mar 2025 01:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4240FC4CEE5;
	Wed,  5 Mar 2025 01:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741137599;
	bh=Zo1aULGkAE1iQtalKdej5/kWzCNtDu/xrdwQwX+JEHA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qeRb9AB/dK9DxTDq3Tvy1mXCAEgv6QPsLIucgKLTT79XycFRf90j97Egn9o2ubQDg
	 /Hq0ILo7De2QZxOPHR33hK5REBVX6RFNhi9bk+J0loyC5XWIJmYn+5OlKbwFchGBgU
	 b8+n0obMSTlk+PPOmYIx28t8ukbrq9jyOVw131Y6ljzJZgh8RDKImzjSyzs3GlzOiw
	 jMlc+XDd14OD8Qft/rzQMrxu70AGRlJBU18iOli2nIHsD9qmqk0tuaN1hjeA9pESrP
	 T3H2kZjcIipz3GY6LTq7+OSU/ZULXAomdDWvrlW/wKikuRmmDio5wQNLoGclAx/MCW
	 23RaUrxik/WpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7106D380CFEB;
	Wed,  5 Mar 2025 01:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethtool: netlink: Allow NULL nlattrs when getting
 a phy_device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174113763227.356990.18423879063180957214.git-patchwork-notify@kernel.org>
Date: Wed, 05 Mar 2025 01:20:32 +0000
References: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, hkallweit1@gmail.com, parthiban.veerasooran@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@csgroup.eu, herve.codina@bootlin.com, f.fainelli@gmail.com,
 vladimir.oltean@nxp.com, kory.maincent@bootlin.com, o.rempel@pengutronix.de,
 horms@kernel.org, romain.gantois@bootlin.com, piergiorgio.beruto@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_012007_768320_D4707443 
X-CRM114-Status: UNSURE (   9.23  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  1 Mar 2025 15:11:13 +0100 you wrote:
> ethnl_req_get_phydev() is used to lookup a phy_device, in the case an
> ethtool netlink command targets a specific phydev within a netdev's
> topology.
> 
> It takes as a parameter a const struct nlattr *header that's used for
> error handling :
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethtool: netlink: Allow NULL nlattrs when getting a phy_device
    https://git.kernel.org/netdev/net/c/637399bf7e77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



