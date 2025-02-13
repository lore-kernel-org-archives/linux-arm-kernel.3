Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF1C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 03:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4FOovD+xrknUpkIxy9OFhncvOlb+IrCE67y2VHTJsM=; b=HyQz4a3S4uQXiYVX6cBLzZXLKt
	iuqKPnl/4t/nWy1Qd7eLZQmcq1L+tCYLvlXtqBe7lCj3cgCVHLb0nfWMHbBuAKzLxme+5OgyABZPw
	8F61jFBbrgbfzyIXz4WwbusEkXfteEvE+sDNdBw06ECypGASbW7Wc/IboXwRKYO/4jpAfOEUa5qIY
	4y8MF9WPQDmlDmZ2VajckqbV3/xauhoo1xQMcU16+SFSzT2KH8797O/FPZii0PZLDRXlFnOGaBngW
	2joyk9Urd45Rnxdph1WzemQtO2hK1FiqWlb38dfc/R7I84XdY+pMHfafML90Sp5Bm5X+4w+MUHmPy
	yHw4UUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQ6d-00000009cIK-0ivm;
	Thu, 13 Feb 2025 03:41:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQ5B-00000009c52-48XF;
	Thu, 13 Feb 2025 03:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 270E8A41340;
	Thu, 13 Feb 2025 03:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254F7C4CED1;
	Thu, 13 Feb 2025 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739418008;
	bh=47fkl5jB1AePFTNmClf5l/q5foDDtpswoxq6Q/otrc4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H1cQn/FO9QH+VL/WqtME+3CVl2UP5uFlPui9cpd4GYkKTMu8lPVuYCCuh+AAONBWV
	 lzxa4XngmGbqckwJV/HvRbC8gKSOo++sl/g+kcMhUOmOEUiX/aU2AdAcYXVn3Motgg
	 16xvq2LrlMBwrk3xCdbKYnZ/p0xpHl5lDy33E7ezJ7SVp5HvRDbMdvNSfE898jdXzr
	 LbXzUqjt4FRYWpHfivayoSJ/ygdfRepiHqoFYKELy4KqviiKPkRwMBoySBZA9ekxur
	 5yOH0EBOo1ZmGWLtyjYt8Xq7LNsmPYH+NM/Rv81e3TcuQhZfI6Y6my8VML5YOxXW75
	 HzCyBB5XzGc2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F8B380CEDC;
	Thu, 13 Feb 2025 03:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 1/3] net: phylink: provide
 phylink_mac_implements_lpi()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173941803725.748910.14257112590472895910.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 03:40:37 +0000
References: <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, davem@davemloft.net, dqfext@gmail.com,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, sean.wang@mediatek.com,
 horms@kernel.org, olteanv@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_194010_090405_D1304F02 
X-CRM114-Status: UNSURE (   9.25  )
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

On Mon, 10 Feb 2025 10:36:44 +0000 you wrote:
> Provide a helper to determine whether the MAC operations structure
> implements the LPI operations, which will be used by both phylink and
> DSA.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c |  3 +--
>  include/linux/phylink.h   | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next,v3,1/3] net: phylink: provide phylink_mac_implements_lpi()
    https://git.kernel.org/netdev/net-next/c/2001d21592e5
  - [net-next,v3,2/3] net: dsa: allow use of phylink managed EEE support
    https://git.kernel.org/netdev/net-next/c/b8927bd44f78
  - [net-next,v3,3/3] net: dsa: mt7530: convert to phylink managed EEE
    https://git.kernel.org/netdev/net-next/c/9cf21773f535

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



