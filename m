Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAEFD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9QkcPpjDy8u+QLA0YmdH9TnxrqhsJKIiLdwqcuEWgQ=; b=P9x5/cbBY22MAlmMhElpa3yN0r
	S5CMgsxJXmjaCSqcvZd8YAD7JpMcZHp/uWLIstwMprq70BSTrxUnXrq2IL/iHHoFFoLoWjuzvE/Nk
	PQM2ggnJForxI/auEL5OrZBSaDCyhvIS15xUhlbNXK5oPeApgTyrGq4BSMfropt/+wcTQ31gjOMPZ
	R24mzo7dBlooxfl32MyQMyktw0hpojdPB+V6pCO2LNfy/0duIle0MQG2eTD2iBP/206kCAXuSkzrY
	UrYCuwY7AkpkFdAMDtQRSzrVhLcjts/GcUpDOTKAVpytbzbjZ99coBUPuZ5+aZRC9Td7wI3/FsfMv
	wfl+RWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq9o-00000002F8I-2kXj;
	Mon, 19 Jan 2026 14:23:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq9l-00000002F6E-2tla;
	Mon, 19 Jan 2026 14:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 223BA44314;
	Mon, 19 Jan 2026 14:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27D3C19423;
	Mon, 19 Jan 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832579;
	bh=fiqL2210uT1qUhHAJ17YtkjmIE+maRxzVtmI/uPQI3M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oWo/1RstEV3QGFIHLofwpXfSlzA18z/g+p0TFR6bZeSqWafgyI9QJKAvTvVUlVMCd
	 +SqHpeYukNxFS1oR0pv8Z2vk6oNlxkQJ3KRSsVrlRR9ASslMvw82/G6E10pim7A1OP
	 acLPnWHbo8jSQjKRrOgUyxQztN+XC6UVMMOhCUpN8tljKtDyxeb1+1gE/xO04Cjf4g
	 dSp9cLkVihm9sTBCU7upA6tXsa+5iwB47ZqOn34XEDXTirYbSigxo3A8pRQB28KMW/
	 se1nrHUJ7FubjkzSG3vdfm7/vg0PQmaS6AQJyUtJ6Ytat9QB5w5WdDO6KYLG7aDmKj
	 rPW4sOwcKr7Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F29BD3A55FAF;
	Mon, 19 Jan 2026 14:19:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: convert drivers to .get_rx_ring_count
 (part 2)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176883236852.1426077.755495066523870761.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:19:28 +0000
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
 somnath.kotur@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name,
 sean.wang@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, shayagr@amazon.com,
 akiyano@amazon.com, darinzon@amazon.com, saeedb@amazon.com,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 Shyam-sundar.S-k@amd.com, Raju.Rangoju@amd.com, bharat@chelsio.com,
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
 jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_062301_809000_FE453E82 
X-CRM114-Status: UNSURE (   8.03  )
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

On Thu, 15 Jan 2026 06:37:47 -0800 you wrote:
> Commit 84eaf4359c36 ("net: ethtool: add get_rx_ring_count callback to
> optimize RX ring queries") added specific support for GRXRINGS callback,
> simplifying .get_rxnfc.
> 
> Remove the handling of GRXRINGS in .get_rxnfc() by moving it to the new
> .get_rx_ring_count().
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: benet: convert to use .get_rx_ring_count
    (no matching commit)
  - [net-next,2/9] net: tsnep: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/efa375c44090
  - [net-next,3/9] net: mediatek: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/e33bd8dd7f1f
  - [net-next,4/9] net: ena: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/289f714a084c
  - [net-next,5/9] net: lan743x: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/05ba3044865d
  - [net-next,6/9] net: xgbe: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/507353bf84fc
  - [net-next,7/9] net: cxgb4: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/ceec168d03db
  - [net-next,8/9] net: macb: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/d1c7ed5dfa35
  - [net-next,9/9] net: txgbe: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/c4279332f479

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



