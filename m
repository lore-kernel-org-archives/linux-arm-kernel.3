Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8FEA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZeUGH/lmPkQ+aeDfJvyUvyarahPQUbQ9ViirgESqgY=; b=xdd/Xkgjk93BxqZxkrSofPxjF7
	6d5w1VOt4AylANc8I8JYhdw4k95ecMvAifi2a9BC2WhA7jxM555ZgZYRVK1Yl3JQjAhOFiGtdSDmK
	o56iZenhSOulq1NIgww+g9rAuT0MeBiuIdiJmRFzoWUZ9l+xAxa1iQAmXRMNEvC0axguM6iX1foi5
	b9V15iLC3s6hLxlb+cZOSIu5xKsYWa0ew407Xm8AIVYQcf1bXd3aPNl99vBvOtIgV57htirrXYjV9
	pBW+frnkxnL/vsSfUy9mmAqXbF+NFRcdqdEZ4XhakPBV33Akmb4KxTLHHUNPsUitUNeNYw8H9B/n7
	L45VdW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUdt-00000000FOZ-11v6;
	Mon, 23 Feb 2026 12:02:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUdq-00000000FO4-43yY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FZeUGH/lmPkQ+aeDfJvyUvyarahPQUbQ9ViirgESqgY=; b=Gxs6x5Q2sBIHtbQll5mAdrsGBm
	J4P9x9KB/tX37XqPK4lBQryeVq6NUEhPoDX4QwdXf6U/EFspdkh16tAzSkumSHp+0Rxj1sqjixwD3
	KpukrfPP9FYZAIJx/o02MWXvn15FLyXeoi1h5oXsZI+w/ORFLDdoY7EYuuLo8lXGaWeAPDvASB7P1
	T4u505EgKjPIvR8SUF7UhwVgQIH5ixMUafdhKPaPHnO5DUm21gqRA6A/8yTBMKxq2UySOaA140mU1
	IopUAWJBYAMwHMrkkwztI87Af7gsy6mjhs6f+NVcEH44BydI8LTFPQxNGJ3SmFjMah649oL1K7R9D
	xh4B3CUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuUdl-0000000041f-1xCY;
	Mon, 23 Feb 2026 12:02:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuUdj-000000007LS-0fmz;
	Mon, 23 Feb 2026 12:02:15 +0000
Date: Mon, 23 Feb 2026 12:02:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: use circ_buf helpers for
 descriptors
Message-ID: <aZxBxoq8_QUzUcud@shell.armlinux.org.uk>
References: <aZw86hpjQ-3w3xqJ@shell.armlinux.org.uk>
 <E1vuUJu-0000000AfEO-2kPP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vuUJu-0000000AfEO-2kPP@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_040223_005196_14F87245 
X-CRM114-Status: GOOD (  10.90  )
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

On Mon, Feb 23, 2026 at 11:41:46AM +0000, Russell King (Oracle) wrote:
> @@ -4571,8 +4562,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	/* If we only have one entry used, then the first entry is the last
>  	 * segment.
>  	 */
> -	is_last_segment = ((tx_q->cur_tx - first_entry) &
> -			   (priv->dma_conf.dma_tx_size - 1)) == 1;
> +	is_last_segment = CIRC_CNT(tx_q->cur_tx, first_entry,,
> +				   priv->dma_conf.dma_tx_size) == 1;

Bah, I thought I fixed that, but it seems I merged the fix patch into
the second patch not this patch. :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

