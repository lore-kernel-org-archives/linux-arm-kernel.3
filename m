Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F9+GT50M;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SH7ETnz1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeaPBug6/xWLhwouYwYkca8RXEKCAo3ofPz2I6rBfnw=; b=F9+GT50My16Uf6E0vlW8VsBDof
	/iszZtul4WNi8yK0stDAFkGYlO9pE2s4zypYWNN37IZaRLn4viB61ptzMw+rn+ZHx0NXZHFMlwRtg
	plf/ohEGOWoo4EGp9rDcDe0apNypZFxo1ZIl1rZP/8wANCSQr+vY8BP2GN7i5KJKTHTm54hDu1NHO
	MIFDUySK6Prxnf66Fr/q7GxWBWgEiJWDP3pTrEOcPynQM9a3T9O1XMdV/DityY7y9XCItotNP7+0B
	Pl5dJ2jDVfmXpxQ10PA4kGAaK188wEKFFcVsXthhbSQik1Q1Hr513ne2dGcF3RNDggNoWGOi2wUtp
	1Axa9/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgED-0000000D4V3-1yjk;
	Thu, 22 Oct 2026 00:00:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgEC-0000000D4Up-23nM;
	Thu, 22 Oct 2026 00:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 911C460A97;
	Thu, 22 Oct 2026 00:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434A81F000C4;
	Thu, 22 Oct 2026 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792627215;
	bh=oeaPBug6/xWLhwouYwYkca8RXEKCAo3ofPz2I6rBfnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SH7ETnz1YetRCDkzeITBRMBeku3mwFPAxNZWkqy6KmisasaXRbX4c4kCLRfifqzyJ
	 NpaaYD+up0TXFSX0C/3gyj07Iro0J/ymad22CpJrvUwagcJojPs14Ey+vmMwe6mYxk
	 EWx1PcDCAtrOXGDFl62y63LcSoW+QSEXhyvCkbd1OoNY9JCutqPvG+S3Pj7TieuXoQ
	 iIBLm92zZUYGE1UAVCT9hYRfJB1m4G4oyg1SHREO9Qr1M+0iAhSoiPlr8DqTDsoPiH
	 uLeAhH9kCVb8TKLBJavXbW5IGSsuuIwSh752UIp7/S73NTf3PJc3I2szPD7k26zcUA
	 py9Sq9NWLuulw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A374380A963;
	Thu, 22 Oct 2026 00:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v12 0/6] net: pcs: add basic support for RK3568
 XPCS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179262721377.1368559.4824000922345412806.git-patchwork-notify@kernel.org>
Date: Thu, 22 Oct 2026 00:00:13 +0000
References: <20261017054406.1828061-1-coiaprant@gmail.com>
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 17 Oct 2026 13:43:58 +0800 you wrote:
> This series adds proper SGMII support for the Rockchip RK3568 SoC
> using the integrated Synopsys DesignWare XPCS, along with necessary
> fixes and refactoring in the stmmac core and XPCS driver.
> 
> Motivation
> ==========
> The RK3568 integrates a DW XPCS accessed via APB3 and connected to
> a Naneng Combo SerDes PHY.  Several boards (e.g., Ariaboard
> Photonicat) use this interface for Gigabit Ethernet.  However, the
> current upstream stmmac driver does not support this configuration,
> and the XPCS driver has issues in SGMII poll mode that cause the
> link to be reported incorrectly.
> 
> [...]

Here is the summary with links:
  - [net-next,v12,1/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
    https://git.kernel.org/netdev/net-next/c/e42329945d16
  - [net-next,v12,2/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
    https://git.kernel.org/netdev/net-next/c/20bd39c3c267
  - [net-next,v12,3/6] net: pcs: xpcs: add Rockchip RK3568 platform glue driver
    https://git.kernel.org/netdev/net-next/c/b9e7cb89aac8
  - [net-next,v12,4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
    https://git.kernel.org/netdev/net-next/c/dffa8241fca5
  - [net-next,v12,5/6] net: stmmac: dwmac-rk: add SGMII support for RK3568
    https://git.kernel.org/netdev/net-next/c/5cd3229579ef
  - [net-next,v12,6/6] MAINTAINERS: add entry for Rockchip XPCS driver
    https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



