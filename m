Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C337C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksZUcQBRxfvrV0GF/ZsHrJNnDemhmoO3mBUTr3d4ttw=; b=qdw1qwRMjGCRqO70BvKWT/fC1e
	LDqaQot+a59srwSftcPhnixV66R2DMmNRZsilK1qLMlCaLlZ4ZJNozhZQpKsWRuqU2/xOHhpnexHP
	bK+/wyjmMZEhfFZjRh+4Sc5nCksmTKGkyjyTufXuxjCdhyJd/GokWTAXHzQHTfJiPKr9bu71Hqycv
	x4q3yDYo4hbFBRLABskeztwyAo2Jg7Qe6MKZHoc/VZxCFwfIrnqZrmWQdPG8NjxseqFDDrb1+tpkJ
	/46l4p2TKQvC05DwaTXqMsHKpi2DJpHDXEhtx8/KBv//O+3ZeIOEf7mCwBg1RPM9PGSJu5ENb5CFW
	vSko0sHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x246B-0000000Gzse-0moM;
	Thu, 03 Sep 2026 09:51:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2468-0000000Gzqo-38VY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:51:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 363F9600D4;
	Thu,  3 Sep 2026 09:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8011F000E9;
	Thu,  3 Sep 2026 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429067;
	bh=ksZUcQBRxfvrV0GF/ZsHrJNnDemhmoO3mBUTr3d4ttw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IZnupfLnB5NnabUmmPHFLLqcj0tLvoXZG6m8JXAQlJJVY9D4wNgLickloA6RWq58R
	 QxNe2kdGnUVkMDcs7O2IcEdx0yRn2WWY6dkzbMZYp0ucDLNnQdKNvGyhV9TlWGs8lA
	 BUl0a3VKoQVvYGnvnjuqDADX8gaqpjYbsvt/I3DtLtsxmiOHSJqwZGLRgb/kLuhzo9
	 GY34XWD/lsXHu8QErIh0ehSTsk5tC3Vsu2SuZHZsxseSe2lRYa1aBafmFcbAuaub/g
	 6XGyYIUTYwP6GtG8Jso9AXOsxkyrT62ef4xVkolMo2I+nI42g+6c5IkERsd0R/zGFh
	 dLhW34Q8JO/IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ABD3811965;
	Thu,  3 Sep 2026 09:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: reconfigure RX packet parser table in
 stmmac_hw_setup() after reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178842900914.3234406.11176564790633654802.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 09:50:09 +0000
References: <20260831-stmmac_tc_cls32_reconfigure-v1-1-21cb459e64ae@oss.qualcomm.com>
In-Reply-To: <20260831-stmmac_tc_cls32_reconfigure-v1-1-21cb459e64ae@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 31 Aug 2026 19:06:38 +0200 you wrote:
> The core software reset issued in stmmac_init_dma_engine() during
> ndo_open() callback clears the MTL RX packet parser registers, but
> stmmac_rxp_config() is only invoked from the cls_u32 add/delete paths.
> After an ifdown/ifup cycle the hardware therefore runs with the default
> all-pass table while priv->tc_entries still reports the filters as
> installed. Re-apply the RX packet parser table from priv->tc_entries in
> stmmac_hw_setup(), right after the software reset, so the filters are
> restored when the interface is brought up again.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: reconfigure RX packet parser table in stmmac_hw_setup() after reset
    https://git.kernel.org/netdev/net/c/6b8fed2675fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



