Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB40CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0oLF9PPM/miVZiAxQmpoB8LRhhiWttKDdQc8zfH4KM=; b=hlyVgrA+tZEFxBC4HzbpeXXZ4F
	hzLgiDvdAkuCpBbsgqLc+b41oPwUQUsXkDGHBeH0QMR5uIF9kzdjv54tNrwo4jsDSEFKzPuLm+HO2
	0GeTfikflr5L7kQGBw12EQRTnH0OmP5qGftGWDcedUj5jCK80SCT3kmC9n7wlRs3Efz5XZg1JxmlS
	8o87oI84GcznjY9FXECbg1dVB0UZXHP+cbkoVLqkcONGNnRsSBjBWnefw1APfrcVXMC5Pk2kv/1lY
	ATX1mRGQ8rMSPsWT8vrFEBOkVZIAhECQf5cRoGIPylhvcN7Rd2S+2g8wVMo/0gib2uCJ1/l2wisu/
	Hq9tGQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzS0-00000008HHX-3iY0;
	Thu, 04 Sep 2025 02:11:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utxri-00000007ziS-1WT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C4B4365C;
	Thu,  4 Sep 2025 00:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D84C4CEE7;
	Thu,  4 Sep 2025 00:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756945813;
	bh=8YlLKo7oKMWe8nMTgXzhGD4l4zeBWdl4jzzaNRcv3tI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=odTFl1GKsc0uOzFyuMlYWir6XzVmSovsSYkA/xcaWKNQtdYQlS9T3uBVU9o2PoHWA
	 7Z1fpfd8zoBxEgMigj3OdlYdg+E7uhhRRqQwRbGpSoukVwTIjsi35J6SvPeuHxXtel
	 r32A6otZXFewij2nw6qwkycC5XSa3m1gyVykv3RVLkQdoYEh5rzB78+XNHtHz29kbo
	 3ADAomyrMukrTo2wGOeW6kGpBYnyhlEXTgl9LgGLzyfprTmgtLw36C3To/zkyB2UiY
	 QQKe/+5l/3KHjBwxcc1vv0xXv4o4kV0DwW38s1xJUJs6e7IYiJINqnrlgjt1V+X1ew
	 7LME9mPlprWdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF72383C259;
	Thu,  4 Sep 2025 00:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/3] net: stmmac: allow generation of flexible
 PPS relative to MAC time
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694581848.1248581.9473792758575091904.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 00:30:18 +0000
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
In-Reply-To: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jstultz@google.com,
 tglx@linutronix.de, sboyd@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_173014_420784_2165A573 
X-CRM114-Status: GOOD (  12.90  )
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

On Mon, 1 Sep 2025 11:16:26 +0200 you wrote:
> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
> the command previously used with a MACv4 for genering a PPS signal:
> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
> did not work.
> 
> This is because the arguments passed through this command must contain
> the start time at which the PPS should be generated, relative to the
> MAC system time. For some reason, a time set in the past seems to work
> with a MACv4.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/3] time: export timespec64_add_safe() symbol
    https://git.kernel.org/netdev/net-next/c/96c88268b79b
  - [net-next,v4,2/3] drivers: net: stmmac: handle start time set in the past for flexible PPS
    https://git.kernel.org/netdev/net-next/c/adbe2cfd8a93
  - [net-next,v4,3/3] ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



