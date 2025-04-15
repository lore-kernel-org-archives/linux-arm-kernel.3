Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F6FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXwsQXUimXOuhdkm8ycFFFWFM0fYJbGEnXU9sokVCm0=; b=YTGEWCtxwFFHM4ja+4xDU3D4Zk
	EPGFOqQ5WM7sFx5Jrk1Lf6amIG4CQ3+g+rMhPYaibEhT3EooHy6/7qdBSEyKDINRj6E0RuAO9Qqs5
	JdUKrBYP9B4p6n7/F0haonaps8eHIVajbfC3qjGp2UogNRkmV7JieEs45yxsGiekDqb0xiVBQC28M
	tLsbXO6poSXd/J86BW+Y/MfSqlYXC8giPRDchoP2N4FHRwWM9loNhwyVjnQVCkKI8e3qlWzuQCq/x
	BTSGxioOw2p6bW7NmdWQJbhoEwEFJyzy4s3eGPeOdUj8oyXIg7XVi6cfenf+gPn1RM85gNVhn6Pxy
	kftDHH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ivo-00000006NZ6-3JR1;
	Tue, 15 Apr 2025 16:14:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iOQ-00000006HcJ-0TA5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A28014A328;
	Tue, 15 Apr 2025 15:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8538CC4CEED;
	Tue, 15 Apr 2025 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731609;
	bh=dzwTkeVW3m8NZo5p+8+xPOs71OcTG5vKrAZ0wG5pETs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lYO4VTGqisxqq2ozajFWSqr3ercrEOC8Wwga3+2rt4jygg4ysPzvQWpVqrr/fv4GM
	 9eQxL9axGqSdqERr97ccZQcI3oB6Cnx0KayrR7JgtoETApG/n/6A1bNmRRDCUa2eWq
	 szOJu3GdtjV8QQ/oDnvO/hq776avp0CNhrwH09r+dGFlg16aYG7J3A083VGoT+eHz3
	 Kz2wDPARZYr8KzzgXBcR7sSw88GIB3oCW66knHOOpVJcdxKzxPpMDrNxzbZ8QOxsIi
	 6eKlUfNxxInkyPwpjzd6C10DbgRo02+FUOw5MhAgsnS21XzXLiOVmvOjBK+0dQHdzc
	 t+5hqqwodb1IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBDC3822D55;
	Tue, 15 Apr 2025 15:40:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: imx: use stmmac_pltfr_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174473164749.2680773.17264687658771021637.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 15:40:47 +0000
References: <E1u4Flp-000XlM-Tb@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4Flp-000XlM-Tb@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 festevam@gmail.com, imx@lists.linux.dev, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, shawnguo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084010_166264_8DF2A1E5 
X-CRM114-Status: UNSURE (   8.73  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Apr 2025 10:06:25 +0100 you wrote:
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (imx_dwmac_init), but also plat_dat->exit
> (imx_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: imx: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/b2ee4451c1d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



