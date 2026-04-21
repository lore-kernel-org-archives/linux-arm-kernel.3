Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE0F8FA6A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKZf8xxpFuABnQc+Q/sZVGBB6lGknC2PmRrdojznxRY=; b=HqqAkCXDqc8VTR6mR29+DLxdEw
	5JeMNXzvoLMKrCWKZOLaJayCQuPRkQb175UWa4gPa0e9M8lRc0VtlihzPXU0+9rPGidZHSvw/cE1T
	HB0Eqq2J+YI676pIwp01galZlxTgdVhTz0Mq/lVM4Fj2bg6ZlXZz4iOvoOQejO8wjH+zapwUc+N5f
	n+CYVcNuJ5+grvKrWGloxzKFkLNeoTBKqEZmxstr441PZ9qZl1mYxyh5d22XB4JHrw1Kb8qoSntNd
	B3UmQYCCRebeXYF9C8TEi/CO+VdZCUFJl0loBlC0PNd4AfNKTThaNTIhjUha+OBlVbAl4Qtb9XOmC
	yGN+dsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAO0-00000008bBt-3MGV;
	Tue, 21 Apr 2026 12:39:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFANy-00000008bBR-24sZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 12:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yKZf8xxpFuABnQc+Q/sZVGBB6lGknC2PmRrdojznxRY=; b=KayMGw/U7f6U0o+MVkUTCLVn6k
	0SHiX1+lckzzD7EGtxujnxHDk1UDww/XxCwfEUDDbWsWHekp5fjXiN0P8IU0L/940BitOEjmKxETH
	wblmkC1SvSVhzMJuiMszFy/g7XTo2522FLOSFWOBe8zx/1+vq+jEITePQp2iV8z1ApIw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFANn-00GtRj-V0; Tue, 21 Apr 2026 14:39:15 +0200
Date: Tue, 21 Apr 2026 14:39:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421115008.2690541-1-j.raczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_053926_533955_827FC71D 
X-CRM114-Status: UNSURE (   7.02  )
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

> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
>  	STMMAC_STAT(rx_vlan),
>  	STMMAC_STAT(rx_split_hdr_pkt_n),
>  	/* Tx/Rx IRQ error info */
> -	STMMAC_STAT(tx_undeflow_irq),
> +	STMMAC_STAT(tx_underflow_irq),

Please take another look at this one and think about it.

    Andrew

---
pw-bot: cr

