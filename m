Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D287DE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwAO7FwjKQWCsRFDEIAEZoW22CnjTZuuecKKIJuyFtE=; b=yCZ3QyxZcyCC3iaYQRtHckvpJO
	Wvh7OIrSHeCSRPpC6ijxtRk/xYBjqDXee42Fc7Hd8CKtZf3WgRvJvWFEeQTEWhRUMR1iof7Vn8n3a
	GDE3Tq47AulQj6tu5Gg2IU8XQTpVHdkEGXXCjeHWO6nHKpm87q0/hryZhwzJkVuJhxPBeijweUPnE
	Sk15ZY1tGF5ipdReYwzvmIE7bXi8ddx9kzYZSgKvpVrItCLCroZz8SmycbeccJzdeFtepjGVcUdBb
	n8iHQbx+53yT4G7ilE4WKjuwbl2l+QAb/5/B12HmaU6MMQcFxobeCnKJ8jgLQqHzsj+sNA9bwwv00
	dFwe5zJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVMsW-000000072JS-0ozh;
	Wed, 08 Jan 2025 03:37:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLgA-00000006sT3-04pv;
	Wed, 08 Jan 2025 02:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 034B4A42097;
	Wed,  8 Jan 2025 02:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51431C4CED6;
	Wed,  8 Jan 2025 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302816;
	bh=0VJ0VlDz5rspAVWwLkjGAzUZE+UkfAyNmv+7kf4MH+k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fy8rG13JaDo9O8wxpSpf55sdRUibKpahbJy65TFwz9NGrJCIJEofGD0msoymIQsty
	 dLtgm6vKbtZ9bdv9mLabILuGCi9qx15m8gkhSwPBlleJFz+AyR3mv43yX7Hvk07cQB
	 IdUbw4DeUDmsdHHZlpXnOHII7bZdO6LAyOf6jhBo7OZzoFsjpohQmlQLnRq0oh5dNb
	 1B9vgxDGcgJDHdG+RYE407KZo0c5dBJqMPRWFxM/QpcjKNsjLs7zoBtcaH1h9PhFSf
	 dlXfoQV5TSrIL13qb6nwW+mNydev+k/VigZnpEMOqTjFdCDy1AsKBHo6B7MI6o1kNw
	 N5Ry83WakCVug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFFA380A97E;
	Wed,  8 Jan 2025 02:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 2)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173630283748.168808.8376692486322535765.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jan 2025 02:20:37 +0000
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 daniel@makrotopia.org, davem@davemloft.net, dqfext@gmail.com,
 edumazet@google.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 sean.wang@mediatek.com, horms@kernel.org, UNGLinuxDriver@microchip.com,
 olteanv@gmail.com, woojung.huh@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182018_124180_4F8ECD2E 
X-CRM114-Status: UNSURE (   9.35  )
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

On Mon, 6 Jan 2025 11:51:31 +0000 you wrote:
> This is part 2 of the DSA EEE cleanups, removing what has become dead
> code as a result of the EEE management phylib now does.
> 
> Patch 1 removes the useless setting of tx_lpi parameters in the
> ksz driver.
> 
> Patch 2 does the same for mt753x.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: dsa: ksz: remove setting of tx_lpi parameters
    https://git.kernel.org/netdev/net-next/c/0945a7b44220
  - [net-next,2/9] net: dsa: mt753x: remove setting of tx_lpi parameters
    https://git.kernel.org/netdev/net-next/c/22cedc609759
  - [net-next,3/9] net: dsa: no longer call ds->ops->get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/60c6e3a59299
  - [net-next,4/9] net: dsa: b53/bcm_sf2: remove b53_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/08cef9e1b083
  - [net-next,5/9] net: dsa: ksz: remove ksz_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/e2d1b8090b69
  - [net-next,6/9] net: dsa: mt753x: remove ksz_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/9e66e8ebe7a9
  - [net-next,7/9] net: dsa: mv88e6xxx: remove mv88e6xxx_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/d3889a3d1351
  - [net-next,8/9] net: dsa: qca: remove qca8k_get_mac_eee()
    https://git.kernel.org/netdev/net-next/c/d19be79a67b3
  - [net-next,9/9] net: dsa: remove get_mac_eee() method
    https://git.kernel.org/netdev/net-next/c/2fa8b4383d24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



