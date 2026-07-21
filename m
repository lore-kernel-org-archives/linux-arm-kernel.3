Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB8EC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsEIGcspohxSKfWmv6M8XET8JahqnW8ojtQncthEbnM=; b=YkHrBKc0LjUaRodW9wW1k2zPUk
	66XMYtWzoE/mGk4WBbkUmr/rEw/mWRZaPia3dkLFpJ///C6iUUsRAFgfQYm6Tn3w7wGIBlRnVwdFv
	0bJywOLU9Jr7YaIv5dBSF+Q2Eu+KrUBHBLi6ANhXt9PrEN8jrXUW7zC9Ma20OszIjdLVYtzSQhcaS
	mjUEIN+V+b/o18xxs+0zDrK+zBou0/TX95d+tZ44MsawUp9AKr2vSC9ISyxTeaZbTyz/mZ6WU8CuG
	UVVigkS564TjKimuRRQXpZICaZO5z9Yfke0JhLm9jMFCV9x+zTl5o5D+wNhakuzEXxUnwytW6dRYT
	N/+X07pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIW4-0000000AUZ1-1oOO;
	Tue, 21 Jul 2026 22:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIW3-0000000AUYv-3put
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:00:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98FB84004E;
	Tue, 21 Jul 2026 22:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B05B1F00A3D;
	Tue, 21 Jul 2026 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784671241;
	bh=MsEIGcspohxSKfWmv6M8XET8JahqnW8ojtQncthEbnM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nI6XvGn1txtQLNq46u6pD331/mmCFBOdhy52DXOKxx91rMqGQF/zR1ehilp92CPXX
	 FZ66Uo5vegJQ602SKScfCgC2vTbvbhx6Vg3nH3YIp89KzsiJPkkK5nVfD3dmBfobBp
	 HFXgygUBbK5ven3rRd9dYTE0HIWhAJnCFVrHETTAVWdYyDUBSRnrgD2OYIcXE0BpE3
	 7JdMb+UgzXpWyi3JcQSpE0olSdkObsSaU4LinpHS4Ato3TusxCn3zh0jWlRSKW3i24
	 7qXm/IgL9Um7/lB12v9oEDQc7WUulZVefG3oX3hRPAED4joNDUOPhOz5vlppfZ8/MU
	 fz25o29+ghQ1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E0380820D;
	Tue, 21 Jul 2026 22:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178467121083.1102577.17257961368358653679.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 22:00:10 +0000
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 18 Jul 2026 16:38:47 +0200 you wrote:
> Now that timestamping is controlled through an NDO, we can simply
> call phylink_mii_ioctl() to handle ioctls.
> 
> The only functional difference is that phylink_mii_ioctl() ->
> phy_mii_ioctl() can handle SIOCSHWTSTAMP, but this no longer happens
> as this ioctl is not longer dispatched to the ndo_eth_ioctl().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Simplify ioctl handling
    https://git.kernel.org/netdev/net-next/c/357997831d0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



