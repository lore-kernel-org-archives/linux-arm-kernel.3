Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89838CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adts3l2Tc2HL7pMTCzyNgLTZoJwd1o8ScVIe+2f9QiY=; b=enhzVXIXbBeRFlw5TjC0ppYMDt
	+/8ISpZzEoiWAnnLFa3SzYSJDmHtwb45pCr0BB4U5INi2wOsWRplE/pIfgnnCmjlA/d8bTzExb1NE
	58XbeMeB83bMQojSKJYaH0FxqviGipjTLNt4k1ulkj4G22n1JiRBE6c0pnAh6VRb7YxolvBTIJg9U
	y0VBzqfUofeRigZyzzAyZWphwFi1h6vfkPMzYbxIZS5iT+H602KuXSeEi7g8VOm9D8yakblPJKu0q
	xTA/XPz/9axgtsfAKzcUDIVkhsAx4/0IA25eVlIslOzV7w6V43UTiIP+dSJqsdtdzUqYNiYSH7DHm
	pJ7Dca2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umLjs-0000000FPEl-0huU;
	Thu, 14 Aug 2025 00:22:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umLhH-0000000FP7S-1bal;
	Thu, 14 Aug 2025 00:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D02CA5818D;
	Thu, 14 Aug 2025 00:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA00C4CEEB;
	Thu, 14 Aug 2025 00:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755130797;
	bh=XlgbVwqe2+GOBt7YjOqXv6d9ctUJHhlZNtOmAaTwDmY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A5HAAYovUWusXo1hOgiCsBQeqGsUFfV6hPix2r1mzHJAwfnm9n88zACZAPkcBGZwD
	 Mu0rC5NUWBbAMq5Hs/j/ZS33pcphkIOFxOUPGTBS4UOcWkkYXRsvhUMgAeAMdljYjx
	 vdf1xwWBJHT7/QKKK/xJVpMfGxH7n5CBGC7rxFNmlsRFIilM4CLliG4MNLOvY782RV
	 1IqiW1rCQ7319rurJzCbloxfBoPTrW+x0PMSY2Kvb9rV9HL2XGs/spYE2MZVPZ6Fvv
	 gnxdoJ08sLzu4y/SGdnqb95avIi3YKJ/fWnwGfe3A6to4benhBTDpOSuvAieovq+Xh
	 3E4ZwuKmz9TXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDC039D0C37;
	Thu, 14 Aug 2025 00:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: mediatek: wed: Introduce MT7992 WED
 support to MT7988 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175513080934.3827563.118467177001717184.git-patchwork-notify@kernel.org>
Date: Thu, 14 Aug 2025 00:20:09 +0000
References: <20250812-mt7992-wed-support-v3-1-9ada78a819a4@kernel.org>
In-Reply-To: <20250812-mt7992-wed-support-v3-1-9ada78a819a4@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, rex.lu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_171959_489189_A3A4CBD5 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, 12 Aug 2025 06:57:23 +0200 you wrote:
> Introduce the second WDMA RX ring in WED driver for MT7988 SoC since the
> Mediatek MT7992 WiFi chipset supports two separated WDMA rings.
> Add missing MT7988 configurations to properly support WED for MT7992 in
> MT76 driver.
> 
> Co-developed-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: mediatek: wed: Introduce MT7992 WED support to MT7988 SoC
    https://git.kernel.org/netdev/net-next/c/96326447d466

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



