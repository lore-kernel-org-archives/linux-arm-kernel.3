Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ADEC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=magOOHovAa+Ccs4FFkwkFsOjuxT9nGSwp4DFZwyMrs8=; b=MTPFpaVe62NRCgQYcN6rd8gD2+
	Q9D+yUvxL/QJWMiRR2SftONZOi+fLNm9WXk8/ElEWTTXkPeY8PDbUWrCKkt1M0HIyrAeMJqBF6kAW
	Tci300R9Igdvi1tYmhQU0UOmy8XZ+zTscKNSWtdvJN8grf+xfG2AGahY+XftRqVnJ1TCx8dhww1Ub
	iR9sjjw16oAjutJIPPpU/ku6iYmii7mQTPytsTMsJMYovanEYhkXbCBoStv2MuKj+QI15eUXf9VRK
	SEiUIUobqUS/klHmOOwOA39MU1iE3SLdX6wIWArVKk2ug9VOT16mjTVQ/BiO8I/drqoNbhPZL1cDn
	ZLgYV7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vim1L-00000006Pe5-3AWZ;
	Thu, 22 Jan 2026 04:10:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vim1K-00000006Pdo-2xun;
	Thu, 22 Jan 2026 04:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E23E4600C4;
	Thu, 22 Jan 2026 04:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A2AC116C6;
	Thu, 22 Jan 2026 04:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769055009;
	bh=ofP1gtLiqq1eTObDexbFNR0ZvruNYC4IYExlkuReqX8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=suxncde7DILcjPCLzvEb2KXoGjOpkBnPB1ty2yQRKP1NSEqCZ/jzaCwnNTiehRUrM
	 5tWrEZzEaP95w2oWTG+aOH4p3iC4nmyjIKoa+XjWjBMWewr4oT1V6xelY57Slg6bQW
	 n/XjCw2IkuIcJlYSfRWDNpneqVnQ2lCqmxDy3MZnExQ79inaBJjVZHEB/ot6CyKhUv
	 rTFSBRGpFbLoJd+eyx1BwXKdimgQvbiyJKH5RwFHJWOx/NFfdsg0my2zOz9ypUg2xf
	 hs7SM1lXFvoDho/hqWM/FOyRIFT0XqiR4dIQJ5VeXzIzw5l1elD3qzp3QFeGR1SQ7P
	 gKlPd8K53kFhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB2C3808200;
	Thu, 22 Jan 2026 04:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: pcs: pcs-mtk-lynxi: report in-band capability
 for
 2500Base-X
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176905500636.1552379.14340282395835713572.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 04:10:06 +0000
References: <b1cf26157b63fee838be09ae810497fb22fd8104.1768961746.git.daniel@makrotopia.org>
In-Reply-To: <b1cf26157b63fee838be09ae810497fb22fd8104.1768961746.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: lynxis@fe80.eu, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, axel@gembe.net, Josh.Bendavid@cern.ch
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

On Wed, 21 Jan 2026 02:23:17 +0000 you wrote:
> It turns out that 2500Base-X actually works fine with in-band status on
> MediaTek's LynxI PCS -- I wrongly concluded it didn't because it is
> broken in all the copper SFP modules and GPON sticks I used for testing.
> 
> Hence report LINK_INBAND_ENABLE also for 2500Base-X mode.
> 
> This reverts most of commit a003c38d9bbb ("net: pcs: pcs-mtk-lynxi:
> correctly report in-band status capabilities").
> 
> [...]

Here is the summary with links:
  - [net] net: pcs: pcs-mtk-lynxi: report in-band capability for 2500Base-X
    https://git.kernel.org/netdev/net/c/e8ca461f7d19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



