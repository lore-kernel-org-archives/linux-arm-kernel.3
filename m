Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD77CD0428
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 00:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6EsJBuPaTQ8n4gqdOjxukw8oUUsgcs/dSV9NPRhYEY=; b=V+NB4n1XzwO2i97W0dVrPRj0/1
	IURsWYX+O5Djmc3/V8BomXdX6dl1BbNbaFISAjganLuo+eT7knqaABzje8CvhQnmC5ziuCZyne0xf
	J2K1pI0Vn3DV1FfT3x8T/s8xdUP89bWiuVzUhE/PckBKxLTMlCKi6FN2GXmELiWvHwLZGH6GCF9ky
	U2aqenHq2uz9Ws/L1pFAXD25qbGHL9/JNcE4zb/5oU5CsMxExZjYQbzauy065BdOJE4y5qQ4FvxxT
	N/8xUmEKTPjKPzW9wC//F4nVw63BqAKFWC2BaxB2VteeFvDaTsGZETTlc+izs1mFeq51oOCKHQih8
	DtdTrZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcurQ-0000000CGAv-03oU;
	Tue, 06 Jan 2026 00:23:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcurO-0000000CGAi-1U9g;
	Tue, 06 Jan 2026 00:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36EA36011E;
	Tue,  6 Jan 2026 00:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68F3C19424;
	Tue,  6 Jan 2026 00:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767659019;
	bh=mo5R6mKrz2vthuRvZIdV31+9mqo3e6GoV8tjx0DpTFQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fig9GE94J7e2SX1VlKMk+mLNb2lr7mY8m9YpX1oWPYtzDHUOuo3n+QLO5XjJWG9SJ
	 I+2DcuT6W5tN26ab/949WutRpK71uzdgVA5FLNdJt1FcPnPTjigLJMbZ8Abq9tj9Lt
	 BJCSLfD2U33s08vz88NQ4DhEBN6FI17+qbRECzn4ZpF3+pJAKpEeF3BsM+nvdr9vRt
	 GC3BZeTRvU9tybLGqUj0mNeBvgavwUdDanmVUEIJduC9/Gz59IcmL0ZSLO8FbrwYnk
	 +YP3N+jTBlJxY2cKg0yHzrQgI68CXgOfJhLsMujn2kBc9+NWaOBMwrK9Umi183A3mH
	 4NeowFODVcDAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7BC380A966;
	Tue,  6 Jan 2026 00:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: mediatek: enable interrupts on AN7581
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176765881803.1339098.2859731628279711762.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jan 2026 00:20:18 +0000
References: <20260102113222.3519900-1-olek2@wp.pl>
In-Reply-To: <20260102113222.3519900-1-olek2@wp.pl>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 benjamin.larsson@genexis.eu
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

On Fri,  2 Jan 2026 12:30:06 +0100 you wrote:
> Interrupts work just like on MT7988.
> 
> Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/net/phy/mediatek/mtk-ge-soc.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net-next] net: phy: mediatek: enable interrupts on AN7581
    https://git.kernel.org/netdev/net-next/c/2e229771543b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



