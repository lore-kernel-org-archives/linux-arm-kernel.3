Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1003AE64AB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQfWXnwBtjN4+gVX0bHkzy3HHnT2/jPXP6zHmg2fCvs=; b=vP+dZimr8ZIAngwvO9DXXrVau+
	1sWzJqOKgfXxwWJ+4w68MDCf17JlaDM1FcOVovxPkVVpL3sq5DqwCYNS48Td2Um5baFfda2FM+ycL
	5W5TAjOYrQh8s6Cb7RUKSwoAQx8dpC+q1C2lmYu0YDr5jtcaOyUK9uYWHbKs8i2Ddw69puWVYiviF
	1lbXhvrHTTWRxdKkPWsVT9WlXp9i6BOUnzWL/UytQGMQASDkryI+zehLZtafRLDm3nTghBJRZGEGh
	cBFmuUTMxP5qZCYnmM0eKjft0DI6a6xbxkz2nIp08JiIx1pFY8qBbZzm7LRMN9fpyDliimuABGldU
	iADo2JQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUNb-00000009rCH-3ATg;
	Tue, 03 Dec 2024 14:59:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUMb-00000009r4O-3cgl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=AQfWXnwBtjN4+gVX0bHkzy3HHnT2/jPXP6zHmg2fCvs=; b=Ln
	B4d1FLm6hFKT1zzUVBGaUbFqCSIXxlRMFuTgS6FHvoDQDHLEdDcUOJ8gi8ngmraFhNAug/S96vt/i
	t3QOSt5H8yDbjbaPbKmXFEjhTgrH+vleuSIwL0JbIp+/p6Xs3FsMCIm+Nafv2zdnT/daIZdJpICGx
	oZHrT0RltarQVX4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIUMM-00F6Nb-5j; Tue, 03 Dec 2024 15:58:42 +0100
Date: Tue, 3 Dec 2024 15:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
 <75eb13d7-b582-4056-b707-706865611706@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75eb13d7-b582-4056-b707-706865611706@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_065857_906576_9A95E18C 
X-CRM114-Status: GOOD (  12.27  )
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

On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
> Dear Andrew,
> 
> You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
> pmt is true is determined by checking the pmt_remote_wake_up bit in the
> hardware feature register. However, our hardware configuration only supports
> magic packet and not remote wakeup, so it must be overwritten in the glue
> driver.

Please add a comment explaining this. 


I'm not sure why the original code doesn't include magic packet as part
> of pmt.
> 
> source code:
> 
>         stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c
> 
>         priv->plat->enh_desc = priv->dma_cap.enh_desc;
>         priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
>                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
>         priv->hw->pmt = priv->plat->pmt;
> 
> Or modify the condition as follows:
> 
>         priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up || priv->
> dma_cap.pmt_magic_frame) &&
>                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);

Are there other glue drivers which would benefit from this? It is hard
for me to say if you hardware is odd, or if this should be a generic
feature which other glue drivers would use.

	Andrew

