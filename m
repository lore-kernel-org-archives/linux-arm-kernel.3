Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90288C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F88PMn+KfFPQHSJv4c9qlI3FIDQbc1OFp6CRrqpwMkc=; b=MSHKO73+G0DANj1NNQZu0+C+0t
	VkGT7mLsKeT7D9olgiT+5RVCmhWdX13ZPHKfNl/QJj8eU8OOaaa4zwwFbU/waswHAzUAiT2ZmyOI3
	TcUMWjOFPgtXp8WGa7mnBGEC4NO4speb7SpPCX42WR0S4kYjpRv+6fmORPDWRQdjq/KOoypHExwd0
	iovHKUQiH1qmOo/ZZL4iKUTEz2tcSx+jSdUzt66gxdkV0dc1HpJcSPUzDBxu5ZlBgKyb3RLym/M5n
	rUVs9wANTI6qU430+qQr//+fbrdpMELZr2eJTvgLDEkLHSghQPG47OSuBehwewBd1dFsK7rF0R81Z
	ICxW6Nrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JzB-00000002BpV-1eJ2;
	Mon, 14 Apr 2025 13:36:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Jx3-00000002BLN-3f1k;
	Mon, 14 Apr 2025 13:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F88PMn+KfFPQHSJv4c9qlI3FIDQbc1OFp6CRrqpwMkc=; b=QJ2KPLjI4D1ax9AF+EVe06M5rP
	HFweb3aQZofnDem9HniedQaTbKVtC5GjQ3zqXPa12Pvo1rotvQygLQdYukiZpLPZbpzi/GX3k5vCk
	63uVq5WVrJ9tl4HBPs22yNL9+pHQvdhkHwONDbGJx07ZWGkfSTuDCWXAiNIh73dOPPF0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4Jwn-009CAe-6v; Mon, 14 Apr 2025 15:34:01 +0200
Date: Mon, 14 Apr 2025 15:34:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v5 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Message-ID: <5e394736-00c6-4671-a55e-6019ce245b01@lunn.ch>
References: <20250414113458.1913823-1-parvathi@couthit.com>
 <20250414130237.1915448-6-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414130237.1915448-6-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_063417_909053_6EDAB315 
X-CRM114-Status: UNSURE (   6.40  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +static int icssm_emac_get_link_ksettings(struct net_device *ndev,
> +					 struct ethtool_link_ksettings *ecmd)
> +{
> +	return phy_ethtool_get_link_ksettings(ndev, ecmd);
> +}
> +

> +static int
> +icssm_emac_set_link_ksettings(struct net_device *ndev,
> +			      const struct ethtool_link_ksettings *ecmd)
> +{
> +	return phy_ethtool_set_link_ksettings(ndev, ecmd);
> +}

> +/* Ethtool support for EMAC adapter */
> +const struct ethtool_ops emac_ethtool_ops = {
> +	.get_drvinfo = icssm_emac_get_drvinfo,
> +	.get_link_ksettings = icssm_emac_get_link_ksettings,
> +	.set_link_ksettings = icssm_emac_set_link_ksettings,

The wrappers don't do anything, so why not just use
phy_ethtool_get_link_ksettings() and phy_ethtool_set_link_ksettings()
directly?

	Andrew

