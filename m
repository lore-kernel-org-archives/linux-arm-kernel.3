Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F62C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzEE2wp1KsYSjP5PjapuI6k/BdRSLopq4SwBxJM0G+g=; b=JIrVgQPkF80fF1u8xwsO63s3l7
	DIXAuoRIcYzgt12RbjbXksGY86mP/Lte2Y0N30/L1ORWc6WtorFmQbFUtPiSDFFKK50V+/h+1Amqg
	mwZmghRf0rnrbHhKEkWZSq0au2R89l1yaXX+k1aVb7VdnB2z9v/+KQirH2nrznYo7Zj80hsN7jqZt
	idbGPVmDluI5a7t357+K9CAMvJUZDTYNkV76saHUGpiHX1XAEeQ11ev+REZGsGIh57k5CycLaJdX3
	zMWQUqCs76LmSUmjKtjmyds/44QCTlLXCFpNksojRyrJ8NlroMMC6J8vuGOBANt2iKrsCscu1m1CM
	/ls+8JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHUr-00000009ofE-2EQS;
	Fri, 25 Jul 2025 12:25:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHQR-00000009oAc-3vqP;
	Fri, 25 Jul 2025 12:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VzEE2wp1KsYSjP5PjapuI6k/BdRSLopq4SwBxJM0G+g=; b=uQBRNsr/1NXyUp9/NeMDwD2uZD
	Ube38Esxgns0WJBBo/eDNAdjTih+kR/vEPXVFJ1eBAsBktukl1ZJfTLioqdpPgqorYpTyOpUBcnLL
	dRpVlobuCGe1TjWAPImiP/wd0ITU/R20PjoPuf0FSnrcQzWZc7edKNsom8LXnqCSvk5w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufHQL-002rXl-Fq; Fri, 25 Jul 2025 14:21:17 +0200
Date: Fri, 25 Jul 2025 14:21:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: use MAC TX delay for ROCK 4D
Message-ID: <add11c8d-34b1-476c-96b3-964eb2a3de6e@lunn.ch>
References: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
 <f22243f5-759a-4ff2-8d14-6edb49d87c52@lunn.ch>
 <mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmcampwiajvj4a@r5zs4d3jdm5p>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_052123_974989_13735C5F 
X-CRM114-Status: GOOD (  11.74  )
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

> > Have you tried "rgmii-id" and small values for tx_delay? If the
> > hardware needs 2.1ns, for example, the MAC could add 0.1ns and the PHY
> > adds the default 2ns. That would allow you to conform to the DT
> > binding.
> 
> The MAC code (drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c) looks
> like this, so "rgmii-id" results in no MAC delays being applied:
> 
> 	case PHY_INTERFACE_MODE_RGMII:
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
> 					    bsp_priv->rx_delay);
> 		break;
> 	case PHY_INTERFACE_MODE_RGMII_ID:
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
> 		break;
> 	case PHY_INTERFACE_MODE_RGMII_RXID:
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay, 0);
> 		break;
> 	case PHY_INTERFACE_MODE_RGMII_TXID:
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, bsp_priv->rx_delay);
> 		break;
>     ...
> 
> Also the default values (if properties are missing in DT) are
> rx_delay=0x10 and tx_delay=0x30, so changing this logic risks
> breaking some boards :(

Just as an experiment, could you enable setting delays for
PHY_INTERFACE_MODE_RGMII_ID and see if small values do work for you.

If they do, we can then figure out a way to actually do it without
breaking other boards.

	Andrew

