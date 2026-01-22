Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okh8zWSHKFocd5l2jAesU+e5BZx6GIo/R20i3Ev7X/U=; b=44xLf0vkzNcx6m+seWD8LNIxnu
	/2tIpSq8bH2Hex6gCeEzh5i5S0iC1Xu0Roq+lu3d0xvuhYQEQlosBTy8CMEvPFZKs5qFqDAzMIFHO
	Yq9kCsrFkAHYZ3QPDsG94izF9k8JIlv4fgOEuwxoKsCDTSz6q2xsd8mQ2ed18qHpjLcvLV97mESjP
	Vb/SIRCLvigPZ+b9q5faEwdsuN9/V93bMwEo5kVh5P+fjgwqkkyIucjYbHapoC4rAkZH9T95WSecB
	HDsyIL4sijRRH6EiTgbKClBEWaqol/8tC67L2YGA1/swn8CJedJMXAxNi3I8I4ChH7ny3dOs/Rvu1
	kkI7IGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilOp-00000006NWh-117P;
	Thu, 22 Jan 2026 03:30:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilOo-00000006NWV-06AV;
	Thu, 22 Jan 2026 03:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20E0560132;
	Thu, 22 Jan 2026 03:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C648BC116C6;
	Thu, 22 Jan 2026 03:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769052620;
	bh=VE0iS3pWhp6so1Npva7qmx2mCLeL878OmKehB3Ye6Og=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tZwgaI77P+JBPQJRfwCjgWjgBKL1AI5szg6OnUW3QdB5dzwq2oWIgA6ltGY6CufSV
	 6m/USVvfKGbvMAVtFD08gU6iQnuhn520D/ApINoaXr3iYsXJ4oOTBCSqja6U9UFN2e
	 6zjTDCZbraviVYC2j3CxpK83nDswupz+gMBTkAPLnQQwUw1JhHA3QI2ekeMJp87ToR
	 nNGEkTDTt5ZTddlQyuGcqkM2qQudFkAVTWDuuTsftEWILjXAuk73FDdXVf90mkOEIj
	 tsIeKWkeosMVPNHHJfEw6Lxod9h6i3xz0Bg6eN/fLgQZOMCb740VX+Iz1Y5obRkyzS
	 JGchDmWWPdvDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8E8B3808200;
	Thu, 22 Jan 2026 03:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] airoha: Add the capability to read
 firmware binary names from dts for Airoha NPU driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176905261759.1542867.17011579181219560528.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 03:30:17 +0000
References: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
In-Reply-To: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 andrew@lunn.ch, krzysztof.kozlowski@oss.qualcomm.com
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

On Tue, 20 Jan 2026 11:17:16 +0100 you wrote:
> This patch is needed because NPU firmware binaries are board specific since
> they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
> MT7992). This is a preliminary patch to enable MT76 NPU offloading if
> the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.
> 
> ---
> Changes in v4:
> - Add missing MODULE_FIRMWARE definitions for EN7581_7996_FIRMWARE
>   binaries
> - Link to v3: https://lore.kernel.org/r/20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] dt-bindings: net: airoha: npu: Add firmware-name property
    https://git.kernel.org/netdev/net-next/c/03135a5a6ed3
  - [net-next,v4,2/2] net: airoha: npu: Add the capability to read firmware names from dts
    https://git.kernel.org/netdev/net-next/c/3847173525e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



