Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6920CF55438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOhUlwCiJLCxgbTWzkMR+2nyqKSX9xEdUNORUsemOpU=; b=ph/82d3sujbQrGulYKX//XlYj+
	ykJyC3dKP5uy+VxxHYK/8398jpAfICHmJl9A7WJVe60WMNc2Y8iZLsKUVQN7tsvIocypNgCf9vuQY
	KO6xhQsn+uao2PrgbpK4vv7NwSGkWfmtdtjaiuPGNvhKwwVVLbIqZtRgW1vr2/ujzDRMlwOfjHFZS
	Ev0yEa6+iPsta6y3HSrJjBBGi8HMR1t4411yPjBhjrHA2ZcrQHFQp/5eykgraoP9kHsm4FqWVzlLV
	IlHfES9C2k0fIqkCro98yKf4rNOXJe0R8JXHYIPKCu+/Y3Fbou9R2S44NWXih0wcpDIHZVd7VQxqE
	a6E+g77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv42n-000000033Lm-1VdY;
	Wed, 25 Feb 2026 01:50:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv42l-000000033LC-0NUB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BBEA4456E;
	Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D1C2BC87;
	Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984226;
	bh=hqHD9RFlh+gmpegg8cL1nP31Ba7mVMoIC+E34e8sKf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gbsBe58xM8CPUL4NRKk/zy0iv7QuA1oH0MYcKYyoq8dcNj6DZ7ckecjm8AXhi0KjI
	 DOyD8Hrzissdqy71F50GykotYh8GgeYmZruknBLJXVvD2WGL4eApqDPJXCvn/lzeWl
	 zhDXV0FkCdus+JAGYSKvddZxsyvXoKOyIBUWxiRu9i/2XgPwVQocPueik48gQbJ81r
	 xeXfzP7jIcTs+/jM447N51dKgVgO9VF68eaZjloZzqZp1X3QFfBbZVJMOxA0vccWZN
	 ECmLaOkZ+tgfwlwX1zBgfFrNHI8GB6IIBSKQnJ0fCFjaoyZG4k8YUywLJorp527BAy
	 GH1G8qlv65iPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D8C3808203;
	Wed, 25 Feb 2026 01:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/10] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177198423153.31093.1747668496554974371.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 01:50:31 +0000
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, Frank.Li@nxp.com,
 imx@lists.linux.dev, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175027_179714_B9CF4171 
X-CRM114-Status: GOOD (  12.49  )
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

On Mon, 23 Feb 2026 09:33:52 +0000 you wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: stmmac: qcom-ethqos: rename "por" members to "rgmii_por"
    https://git.kernel.org/netdev/net-next/c/ebfc2be12ec5
  - [net-next,02/10] net: stmmac: qcom-ethqos: remove register field value obfuscations
    https://git.kernel.org/netdev/net-next/c/e6f43a41ba62
  - [net-next,03/10] net: stmmac: qcom-ethqos: change ethqos_configure*() to return void
    https://git.kernel.org/netdev/net-next/c/649a00c3926f
  - [net-next,04/10] net: stmmac: qcom-ethqos: move qcom_ethqos_set_sgmii_loopback() up
    https://git.kernel.org/netdev/net-next/c/3baa791f19be
  - [net-next,05/10] net: stmmac: qcom-ethqos: move loopback disable to .mac_finish()
    https://git.kernel.org/netdev/net-next/c/834c72ca306c
  - [net-next,06/10] net: stmmac: pass interface mode into fix_mac_speed() method
    https://git.kernel.org/netdev/net-next/c/cd0aa6515350
  - [net-next,07/10] net: stmmac: qcom-ethqos: pass phy interface mode to configs
    https://git.kernel.org/netdev/net-next/c/b560938163db
  - [net-next,08/10] net: stmmac: qcom-ethqos: use phy interface mode for inband
    https://git.kernel.org/netdev/net-next/c/b8ab32315e22
  - [net-next,09/10] net: stmmac: qcom-ethqos: move SerDes speed configuration
    https://git.kernel.org/netdev/net-next/c/fb42f19e671f
  - [net-next,10/10] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
    https://git.kernel.org/netdev/net-next/c/9192320a65b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



