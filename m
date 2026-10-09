Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EE9CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 02:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xdgtLpjzbpWmGNyuK/NwNf8zISqtgETz6cQOW/oSCI=; b=l2pT2YHO2edvDkWAU7IxC3v9Yi
	ZTsbcDKmu0Vqsj1cyaZtJsFdF9RRNDQyGvwJLVWpUgszI2GTLZyoVj/5/orUCiebWzH/E1ViAoCTm
	gmAVtQBEAznCsDOi/ArHOieUiktVobwBJEXlr+mKc36kPZR6IvowI1lHJPG9YBKP9cn4gbCCvF03G
	iAIT5OYqtnydISA9a/kH6KmAT/7QzsOmt8uhX4TFyM1LlnQd5l/MnPLjti4mK/QAmtXuFklJRSEzZ
	4LlYCWLRSh+uMEweX/FcBfMAOCPtp+f/iBZfuFRkuciJICIPBIEsuuFVWEcP7iLIbeYmAgLbVQWIW
	aGOfA8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzu6-00000005GE6-0jqO;
	Fri, 09 Oct 2026 02:00:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEzu4-00000005GDu-3HeZ;
	Fri, 09 Oct 2026 02:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0EF960DB2;
	Fri,  9 Oct 2026 02:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8416F1F000FF;
	Fri,  9 Oct 2026 02:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791511207;
	bh=8xdgtLpjzbpWmGNyuK/NwNf8zISqtgETz6cQOW/oSCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hiR1gL/gH4HWrRzY881q+mhh4ba7xpPUTlfRq+zi18oi4mPyL7u3JM+EARwHTkfqJ
	 g2TnpYwoYQtjasL48DR9OJ71AOMCerIqUiT5AQk2yzqkSQCAXteQyXDVgNCq2fq36r
	 TtZcEhmFS/AUshYA4AVyFh1xsyld2Ezo9+ryf4lkM53k85kJQKOTORxuHOoyB570Qe
	 ftI2t7mnO5Y/gihfcdrgWbDRmTAEqi3Rxm3GL0K0E+JVrKHfJMYHRht0DlOFR8P+kY
	 LImXberAbvcepYsCS6roFZKxulKu74zdCdb016RLaihw7/noAIQID2rdkz5JP6HCf/
	 zh5xXQFhKGmwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7735A380AA63;
	Fri,  9 Oct 2026 02:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: move XPCS lifetime management to
 platform drivers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179151120601.517180.886475800307456718.git-patchwork-notify@kernel.org>
Date: Fri, 09 Oct 2026 02:00:06 +0000
References: <20261005221749.1104430-1-coiaprant@gmail.com>
In-Reply-To: <20261005221749.1104430-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com,
 linux@armlinux.org.uk, heiko@sntech.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
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

On Tue,  6 Oct 2026 06:17:49 +0800 you wrote:
> The current XPCS creation logic in stmmac_pcs_setup() is problematic
> for several reasons.
> 
> First, if a device tree specifies a "pcs-handle" but no select_pcs()
> callback is provided by the platform driver, the created XPCS cannot be
> used by phylink for PCS operations. The framework requires select_pcs()
> to return the PCS to the core, so the pcs-handle property becomes
> effectively useless for link management without the matching callback.
> The XPCS is still consulted by stmmac_phylink_setup() and
> stmmac_init_phy(), which makes the configuration silently half-working
> rather than clearly broken.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: move XPCS lifetime management to platform drivers
    https://git.kernel.org/netdev/net-next/c/f91afd7f7133

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



