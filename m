Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6EBC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 00:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loaup6M7nmFVgDsycPXZTNCIL4DrwsLtwdZU75D6IS0=; b=ZyLk/ctTe6s8jBSWF9PPBKnSzK
	ylMAW/pvyxckHTNX6AC+bbwgHRx3SNh74wc4Bl6RSPxhR8HjSAS6K9yB9nZymZK8lt1tr84MmizcT
	sCsFRpL5tuDU4a+sqwv4z9rPp3gz8b+EHD1fwu1iu150lO2bgO5EqHWTkq1HH6oQgKP3nFMPwvSl/
	jGFcPTrGOzeUj9omnr8CPfiDDn8VmAQmFS/9zH0o/8ZjLIjc99spiY0pI62rcK59H+qyojX9HG3oy
	i7dXgMZ3LiNfl35xcTiNTh85QFQRDyhKHfxzLAo34tyO/cAPEPMOi9qGYoVnEL70VJkCsE2xBAVoS
	PtwtE8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCic-00000008vRZ-00ZG;
	Thu, 17 Jul 2025 00:43:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCfA-00000008v4S-0GqN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 00:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A78C44B01;
	Thu, 17 Jul 2025 00:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D266C4CEE7;
	Thu, 17 Jul 2025 00:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752712791;
	bh=0oNS4QWWuAKBe/4MiGtK8XIFEH9xPGCkiqUULk4IQ3c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DuElOaY7VElFjy6DeOABFGnHEXUoRPEzuSlyqZhb7Nt//JW4FhB+QYikCl3We5Vg4
	 49I5rwd8mO3MUSbKmY8yd7BcqQHMIVIqPc0AIlXNL5nT4VR8iv6lPM6lPiOn4x6aWr
	 xUmm3kyF03921beAkmmAxWyNkOF2OnXMKU6NnDwvGPWEntsN9mzQ9yJcVGpjt5AyC6
	 NIkUh3mtBZu5NQOdA6tgO0yE5ov5l4NrJO6wJ9jZvv9lmyi++1VPfScmnPsjdAvxxW
	 GH9lCkna8HANkef3CZh4NP1Q2uwT2UJ3rIKmTkKVBrMXYmjk8aQ/vho2D7IQk8U1jj
	 TycJ5dBxjweAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE150383BA38;
	Thu, 17 Jul 2025 00:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] Expose REFCLK for RMII and enable RMII
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175271281150.1376782.14178930908812628013.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jul 2025 00:40:11 +0000
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_173952_123635_876A8B19 
X-CRM114-Status: UNSURE (   9.44  )
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

On Mon, 14 Jul 2025 09:36:58 -0700 you wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This set allows the REFCLK property to be exposed as a dt-property to
> properly reflect the correct RMII layout. RMII can take an external or
> internal provided REFCLK, since this is not SoC dependent but board
> dependent this must be exposed as a DT property for the macb driver.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] dt-bindings: net: cdns,macb: Add external REFCLK property
    https://git.kernel.org/netdev/net-next/c/1b7531c094c8
  - [v2,2/5] net: cadence: macb: Expose REFCLK as a device tree property
    https://git.kernel.org/netdev/net-next/c/dce32ece3bb8
  - [v2,3/5] net: cadence: macb: Enable RMII for SAMA7 gem
    https://git.kernel.org/netdev/net-next/c/eb4f50ddfdd3
  - [v2,4/5] net: cadence: macb: sama7g5_emac: Remove USARIO CLKEN flag
    https://git.kernel.org/netdev/net-next/c/db400061b5e7
  - [v2,5/5] ARM: dts: microchip: sama7g5: Add RMII ext refclk flag
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



