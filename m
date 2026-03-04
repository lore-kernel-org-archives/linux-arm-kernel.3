Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA75EFCE41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5W0rWNkyqIYuvm8hc/o0jT6NtzcpJClwcC+P3CAwxA=; b=yN5qhKxQDLMj5KALUF/UQ4j0jF
	2bCYiXkhlai5VKez/bVePK7/jPb60K7KfYZzA2rpnV4J5lymHEsDU/jWCc/gB1nvyJ1yYsYdOzF59
	qVnp51tIZaFcSTNqyeEjRR80jhuVrPGzsfIxspAtLLtL+gPWEqJNSIHhRy4BEZBPdhcLA3/OCFbKU
	eDG9fXuptlbyeGRQgrPvEFeAaGQjTzEMvcDKlFVZaTo+TfT/NS40Iu4eufPO5flQxOG/1i51rD1Yx
	LBSm1AxmouWglyhVppZfusNQjzswI4lulmIj+WYKKy3xaBBjHMBHVNEqFWZ4pCTugn6FZv0Ybn1nL
	4KwMKK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsdf-00000000RlV-2ucW;
	Wed, 04 Mar 2026 20:16:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsdd-00000000Rl3-0Z6o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O5W0rWNkyqIYuvm8hc/o0jT6NtzcpJClwcC+P3CAwxA=; b=xYIGO1mN6A+vyyrQebHB5RDrjO
	Cax+vH7HBHBnKH3pJLlMqu2z+9wJ1DXp15d3kAdIEQcs/+91UX7VV7fEWMrG7q/rQzEnJ1gwRC+1t
	N7HNovYnSV6GPazhPDL+FQybwqYiogrhd9dVD54AIhVamfKzXl91omeJ5LmRa1Sv4CD0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxsdF-00AAfh-DA; Wed, 04 Mar 2026 21:15:45 +0100
Date: Wed, 4 Mar 2026 21:15:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggbmV0LW5l?= =?utf-8?Q?xt?= v6 3/5]
 net: ftgmac100: Add RGMII delay support for AST2600
Message-ID: <8b1e64cd-b48c-43c4-a184-82a6297f273b@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-3-68319a4c4110@aspeedtech.com>
 <ae88d56a-04c9-4a50-af22-5e439acd59c7@lunn.ch>
 <SEYPR06MB5134E02B840BA59CA81C21389D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134E02B840BA59CA81C21389D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_121609_196050_DC0C1922 
X-CRM114-Status: GOOD (  13.67  )
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

> > > Therefore, we calculate the delay stage from the rx-internal-delay-ps
> > > of MAC2/3 to add 26. If the stage is equel to or bigger than 32, the
> > > delay stage will be mask 0x1f to get the correct setting.
> > 
> > Please return -EINVAL. Asking for more than 7.75ns is clearly broken.
> 
> ...
> 	tx_delay_index = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
> 	if (tx_delay_index >= 32) {
> 		dev_err(dev, "The %u ps of TX delay is out of range\n",
> 			rgmii_tx_delay);
> 		return -EINVAL;
> 	}
> 
> 	rx_delay_index = DIV_ROUND_CLOSEST(rgmii_rx_delay, rgmii_delay_unit);
> 	if (rx_delay_index >= 32) {
> 		dev_err(dev, "The %u ps of RX delay is out of range\n",
> 			rgmii_rx_delay);
> 		return -EINVAL;
> 	}
> ...
> 
> These codes will calculate the ns delay to MAC delay index.
> (rgmii_delay_unit is 250 ps on MAC2/3)
> If set tx delay to 8 ns on MAC2 or MAC3, it will get index is 32.
> It is over the delay configuration range, here will return -EINVAL.

So is the comment wrong? No masking is actually done?

   Andrew

