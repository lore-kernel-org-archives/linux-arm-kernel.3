Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C3D36129
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoHGiteuV7hMCX1X06ZoEbGkc+AZlCRQS8/6hJy/kiU=; b=Jdpn7f86xo4xa1Z5FMa8FNc8fH
	U/eeAo0yg0L02gFEbmno2miY7KXshtiPvl/wg8x3yfNgq77Vj/G1Hq8zS7rsoMRsIjNLn3U7vAeCY
	ns/NyuvTnxEDfseOeD1+So2+wHWm21/o8ACb7bSvIDhh4bINEAPuiN7pA9gM+Twnu512GEsMvar2A
	F/BOpS8Q3BqmmDs/HKfA481nNZLnx8sX12ePuDF8M8evyLfzGOoLU01EtSGYrSMzIbzBptPDGz30m
	BrezHMVVB4b6JJGYg+JlJp2EtrNRLOfMhduteT7RWvE2n6rv9+Ti7Pv1kJIXxQbO5q7KH+AmWAedw
	DBMHiClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VO9-00000001NuE-0sSv;
	Wed, 06 Nov 2024 02:03:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VLK-00000001NUr-3xno;
	Wed, 06 Nov 2024 02:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 341585C4BB4;
	Wed,  6 Nov 2024 01:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97164C4CECF;
	Wed,  6 Nov 2024 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730858421;
	bh=iDGn6cF39S+5ch2f8pg8ENjGiBRJzy0HvH23scQjhcQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QPawd+Fx9U769Oe0hH0VRncvrDRfzDHq5qBMs7pShUOKH+0Xrzmx7OoJrTTJhcUHC
	 0IcO6mQpKWVUE/z//2UqZH8lE+UtMZ1hjJBN1Pr8lRj+IiNIQ09LKwmGie5eMkYDSJ
	 81PsQJu7PSsylnThW2p8U557I2VQVL8yKTS6m0lSL8oFBLXwVLgu93t1bOHpPFvPkC
	 tlaNXJONb9+I5Djpm7cB71PiAlh+EAQu/xrUCbKEvfsY+FXGBzEzxDJc1hCmtTUmKN
	 VIJZrX09TUDyPoR6T7HA4PQHyQWAgAcNXVPM0wrUYf92G5ZXj5EGyvuCq9pJ3Hxlfp
	 yNpo92C769Brg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE12A3809A80;
	Wed,  6 Nov 2024 02:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173085843050.764350.5609116722213276708.git-patchwork-notify@kernel.org>
Date: Wed, 06 Nov 2024 02:00:30 +0000
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
In-Reply-To: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, emil.renner.berthing@canonical.com,
 jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 andrew+netdev@lunn.ch, drew@pdp7.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, krzysztof.kozlowski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_180023_075383_4FB0D951 
X-CRM114-Status: GOOD (  11.34  )
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

On Sun, 03 Nov 2024 08:57:58 -0800 you wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> 
> The gigabit ethernet on these boards does need pinctrl support to mux
> the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> related dts patches are in linux-next. However, they are not yet in
> net-next/main.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/2] dt-bindings: net: Add T-HEAD dwmac support
    https://git.kernel.org/netdev/net-next/c/f920ce04c399
  - [net-next,v7,2/2] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
    https://git.kernel.org/netdev/net-next/c/33a1a01e3afa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



