Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45985C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16c8+dR6HK0YJK9HdtebFuRBOksx/FzCYGCA1VXItEE=; b=ajEQVI4SDpHGpXOLEnorCXtwuw
	hA7lsGjXo9HohuCtGm/nbgoBag6KB4yy0G+wUjoFGg4sDcPpx6gELJ814mRLP4bBZSGJOFltPjBQN
	DFbQALmLpk55cU6MHyeN0iYqTVlF14t5gH+FBasZjkrbisl+fRDXT2J85UT3ygGJLtDxIH0KS+uoV
	6+t7gZgqPrwxUqJrbqZFrtn7PsBErCmTagbWC/9wI2RB2x9i4GW0eXLP2hYOiGUO4u7Zwl/wqDDkZ
	W7Kdn01NhLCz7d9nPrAvRaiFZfAptK3WoWmujJ3ZgCy7uh52wPTBQqaXC4dCjw031TNLrtyive/+B
	zMp4LqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubget-00000005NF5-2h3F;
	Tue, 15 Jul 2025 14:29:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfPm-00000005ABg-0lgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=16c8+dR6HK0YJK9HdtebFuRBOksx/FzCYGCA1VXItEE=; b=LxVtsJyka2iWGcioJGwDwlizsr
	L4EoRNpGscSylpareAM6ksRdtJVRFOsui0skpA2/emISSuak68BrHCOwSX67AqvNVMsbZRfVt0T1x
	1GK7n791vGtFiKvcyV7KK6VVRcHhKCBcOhznASGSpV5vB2jBFhfT7ss8ERvpNv/FdH60=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubfPJ-001a2l-Pl; Tue, 15 Jul 2025 15:09:17 +0200
Date: Tue, 15 Jul 2025 15:09:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
	jszhang@kernel.org, jan.petrous@oss.nxp.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_060946_219077_326A4A77 
X-CRM114-Status: GOOD (  11.64  )
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

> > > +	dwc_priv->dly_param_1000m[0] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_1000m[1] = EIC7700_DELAY_VALUE1;
> > > +	dwc_priv->dly_param_1000m[2] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_100m[0] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_100m[1] = EIC7700_DELAY_VALUE1;
> > > +	dwc_priv->dly_param_100m[2] = EIC7700_DELAY_VALUE0;
> > > +	dwc_priv->dly_param_10m[0] = 0x0;
> > > +	dwc_priv->dly_param_10m[1] = 0x0;
> > > +	dwc_priv->dly_param_10m[2] = 0x0;
> > 
> > What are the three different values for?
> > 
> 
> Let me clarify the purpose of the three elements in each dly_param_* array:
>   dly_param_[x][0]: Delay configuration for TXD signals
>   dly_param_[x][1]: Delay configuration for control signals (e.g., TX_EN, RX_DV, RX_CLK)
>   dly_param_[x][2]: Delay configuration for RXD signals

Maybe add a #define or an enum for the index.

Do these delays represent the RGMII 2ns delay?

> > {
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_1000m[1]);
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_100m[1]);
> > > +		eic7700_set_delay(dwc_priv->rx_delay_ps, dwc_priv->tx_delay_ps,
> > > +				  &dwc_priv->dly_param_10m[1]);
> > > +	} else {
> > > +		dev_dbg(&pdev->dev, " use default dly\n");
> > 
> > What is the default? It should be 0ps. So there is no point printing
> > this message.
> > 
> 
> The default value is EIC7700_DELAY_VALUE1

But what does EIC7700_DELAY_VALUE1 mean? It should mean 0ps? But i'm
not sure it does.

	Andrew

