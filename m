Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0511BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qrj/vl1DHFrXDX+1+DvlplFey0wfCryM34lkbyV4D20=; b=B3gRflSnxJW6fcRiL6/lA/M/pV
	xJgGsWuv3fml7OS1X/0Na/j+B8wfXQSdTVgzpGcd4qH/edJezvK3W5v8bME3ORql6l1INN5H0KUd5
	v7//I2/744iSkh357NgXBbA2VQoFNqJbAH4eW7I55Wsd867ug8iDdOWAPKL/JnoxLGX7JSNDk/XLw
	V91CZkZR+BfN1gvcv47e00kFG0QsEph3z5Q30mOYk+NFw9Wxb/Z4fMYJ+RROqGy0BWMrQgt9AzvqX
	i9+mQkl7WXi9bpxZE14AaIvYqEz++BA+o42KPHxQBd7DbGKILpe8WiLy8PYUMBCJR759GaDjZV2nw
	98ttvGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkx3W-0000000GWJ1-0HVB;
	Thu, 20 Feb 2025 03:16:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwx5-0000000GUOY-2rgu;
	Thu, 20 Feb 2025 03:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 564595C5D4B;
	Thu, 20 Feb 2025 03:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298CEC4CED1;
	Thu, 20 Feb 2025 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740021014;
	bh=pD8ROzU5v7v1zdafWRXLtlZbryQ4ts3yYyJZ3srYQyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G2oaMXVKsFb+JmWdJyesdE7HFJck9SKKH6+yl1iffdn7Jn4KoKlMyY5tsuvzOoKfl
	 OsGvNE+vA6UPc8O9po9+irs/OY7dLy3a2YC1sEwltFWfEwFy9IylUSo+hsyDTe6Bmi
	 HLsOqePxhNr53LF6jAyzP6+YTdameuuAUsJkDqKhWjSuJmtZvtsSdnp5NVZo7BiCzy
	 bpPtC4jh3fChd4AXeeA2BTYgwMFz0iyO/oxtKLkEux9FsKW5pJCA9McLZ9gELXtsTD
	 RWeVMDNzJmuWDYCyhdWyVIUUPKPDe28OJVUyO2WsK3cFb4y2B9QZ/cxj7s8EPlHxS+
	 ozc6TvNglFVaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFAA380AAEC;
	Thu, 20 Feb 2025 03:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: further cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174002104449.825980.800457478148266618.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 03:10:44 +0000
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net, drew@pdp7.com,
 kernel@esmil.dk, edumazet@google.com, festevam@gmail.com, wefu@redhat.com,
 guoren@kernel.org, imx@lists.linux.dev, kuba@kernel.org,
 jan.petrous@oss.nxp.com, jernej.skrabec@gmail.com, jbrunet@baylibre.com,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, martin.blumenstingl@googlemail.com,
 mcoquelin.stm32@gmail.com, minda.chen@starfivetech.com,
 neil.armstrong@linaro.org, nobuhiro1.iwamatsu@toshiba.co.jp, s32@nxp.com,
 pabeni@redhat.com, kernel@pengutronix.de, samuel@sholland.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_191015_776981_165FD021 
X-CRM114-Status: UNSURE (   9.92  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 18 Feb 2025 10:24:25 +0000 you wrote:
> Hi,
> 
> This small series does further cleanups to the stmmac driver:
> 
> 1. Name priv->pause to indicate that it's a timeout and clarify the
> units of the "pause" module parameter
> 2. Remove useless priv->flow_ctrl member and deprecate the useless
> "flow_ctrl" module parameter
> 3. Fix long-standing signed-ness issue with "speed" passed around the
> driver from the mac_link_up method.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: clarify priv->pause and pause module parameter
    https://git.kernel.org/netdev/net-next/c/ff1a9b2e311f
  - [net-next,2/3] net: stmmac: remove useless priv->flow_ctrl
    https://git.kernel.org/netdev/net-next/c/bc9d75b0aaed
  - [net-next,3/3] net: stmmac: "speed" passed to fix_mac_speed is an int
    https://git.kernel.org/netdev/net-next/c/ac9a8587edc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



