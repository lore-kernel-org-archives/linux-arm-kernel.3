Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01310C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8Ja6/a3LpsNikXMFN9mPpoVU7tbsy+AC+1J6TmEO5o=; b=TURy+lETYrdaKZeU1TvTXWYz4y
	BiZWzpMKI27r9itE4EtzU3ahR6BubfS4uXGToX2zFhPZbHy0rkbuorGfbvAf4ri4VMMsnpO79LiVv
	+rhfurm/xDWJCE4DmEWZKkSbnskNCm8Twh4NW2zYeiA1LnuqpUcT16xN58DnqMDUT6DHJaSnJ22I0
	HiWPBGZvriRq9EJplXrzRV2G1j+ivDluS0tUJoVe5gK+PD/KA2uUwFshU88rBw3mlZFGc39wpSJ8D
	Qpp3uZA0rmnVWra0nNw0tSQIz3xTOInXxSqSBQLwqVxh2XZEsjPP5gJbudUKJB6KaWA0qPznLpsGj
	7+vNwpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QF-0000000DQC4-0psM;
	Fri, 11 Jul 2025 01:19:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzSr-0000000D89b-2yAd;
	Thu, 10 Jul 2025 22:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF66E613AC;
	Thu, 10 Jul 2025 22:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EB6C4CEE3;
	Thu, 10 Jul 2025 22:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185400;
	bh=cHem7GO1bpm2QPnhafnGHzow7N5rhbfN6nvXGgTABss=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L0Lp/QhjolORcf2uLdp8zFhHVHLbR0Z6qPPZ5QmeiqyfD2UCo7zBMAYzpIemCiQAw
	 gcyiC4tuohiskaV7uVb+E0B11seyKbVUYQmVYcqwFIGitfjbQ1IVfpkHOOQ4WE5h1A
	 xYOriUVV1NdRRwoubiglpFMEOWUIdOwKFHuljHOOKGdz/kQjA7/7H5hQnHpA2iOAR/
	 kFebSVa3WvjI+jZ72vRxMQSRManTSnlfkkq7poXEr59I64j/2rkG3vJb9JsuLZr0Oh
	 7pFZ5h4Z/eVc8x6HikECphStLbxKFq7SXP2BSAbQ9qjlVg94bEArHzOhJ/LO/jRwmu
	 TO1P3z1TH85+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFD8383B266;
	Thu, 10 Jul 2025 22:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jul 2025 22:10:22 +0000
References: <20250709111147.11843-1-linux@fw-web.de>
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 cw00.choi@samsung.com, djakov@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 johnson.wang@mediatek.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, daniel@makrotopia.org,
 lorenzo@kernel.org, nbd@nbd.name, frank-w@public-files.de,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Wed,  9 Jul 2025 13:09:36 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series continues mt7988 devicetree work
> 
> - Extend cpu frequency scaling with CCI
> - GPIO leds
> - Basic network-support (ethernet controller + builtin switch + SFP Cages)
> 
> [...]

Here is the summary with links:
  - [v9,01/13] dt-bindings: net: mediatek,net: update mac subnode pattern for mt7988
    https://git.kernel.org/netdev/net-next/c/29712b437339
  - [v9,02/13] dt-bindings: net: mediatek,net: allow up to 8 IRQs
    https://git.kernel.org/netdev/net-next/c/356dea0baf4c
  - [v9,03/13] dt-bindings: net: mediatek,net: allow irq names
    https://git.kernel.org/netdev/net-next/c/23ac2a71bdbd
  - [v9,04/13] dt-bindings: net: mediatek,net: add sram property
    https://git.kernel.org/netdev/net-next/c/c4582a31efd9
  - [v9,05/13] dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for mt7988
    https://git.kernel.org/netdev/net-next/c/588cb646ce70
  - [v9,06/13] dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
    https://git.kernel.org/netdev/net-next/c/66a44adf4c3d
  - [v9,07/13] arm64: dts: mediatek: mt7986: add sram node
    (no matching commit)
  - [v9,08/13] arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
    (no matching commit)
  - [v9,09/13] arm64: dts: mediatek: mt7988: add basic ethernet-nodes
    (no matching commit)
  - [v9,10/13] arm64: dts: mediatek: mt7988: add switch node
    (no matching commit)
  - [v9,11/13] arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
    (no matching commit)
  - [v9,12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
    (no matching commit)
  - [v9,13/13] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



