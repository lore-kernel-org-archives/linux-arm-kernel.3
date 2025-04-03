Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3583C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqnZi9xNGdDH/jnXjuRYKr/qyvU7hVYZoGPox9WqvZQ=; b=BBmSi2rczFgP0mZMMX/0RmsUSr
	02cMoDm7JqvMHn4CqwstAqOl0f5JqcOt9h38ybmXCF3jaTE2BWwxMAJLJjDgkxplLw3NjLRTYr5cG
	LjuJtb9+xSF2CvDuxUTKoxpjId9CH/sLndnInX95/FlHQOjO34idcTmL+iFpB1RFpRCj/HOfiyG27
	FoyTBVkX1o4//ngLxeIFsylUN7Gvx2D+qvBETBZEMjQKukW28rL9fT2RmG9I6d3MT+npEcFj6k1pf
	SLYVA3MPDp3SsjPXSqfU3WBfVEJhIPOFEzpBb3xscFrjhrgpZOFxxP9rnXwSqkKzb2oLZObb4jN4p
	4Ne6ivvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Reb-0000000A3wu-0pg2;
	Thu, 03 Apr 2025 20:59:13 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RXR-0000000A2MH-0v3N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:51:50 +0000
Message-ID: <528bb5d2-e0ce-4125-b11b-8b873230b0fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743713505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqnZi9xNGdDH/jnXjuRYKr/qyvU7hVYZoGPox9WqvZQ=;
	b=cMkY1rnLjoCSutN0LnPrIIbeiylbgHUF5siqjvtpqrEHhbFlfd8tJGNtFZasaXQ/yxzbhW
	rkY68sQU1f29x398O13gAAraIgukeEYGwwK/Dl+zcdHn8UgLAL9iQK0jEE8/veZde+0LEZ
	BTBjSb6S0sqhRd2HfKeRKtiYSgY0NEk=
Date: Thu, 3 Apr 2025 16:51:39 -0400
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 07/13] net: pcs: Add Xilinx PCS driver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Robert Hancock <robert.hancock@calian.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250403181907.1947517-8-sean.anderson@linux.dev>
 <Z-7vIbvtjIGS5hzr@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <Z-7vIbvtjIGS5hzr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_135149_623075_983A94C8 
X-CRM114-Status: GOOD (  20.42  )
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

On 4/3/25 16:27, Russell King (Oracle) wrote:
> On Thu, Apr 03, 2025 at 02:19:01PM -0400, Sean Anderson wrote:
>> +static int xilinx_pcs_validate(struct phylink_pcs *pcs,
>> +			       unsigned long *supported,
>> +			       const struct phylink_link_state *state)
>> +{
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(xilinx_supported) = { 0 };
>> +
>> +	phylink_set_port_modes(xilinx_supported);
>> +	phylink_set(xilinx_supported, Autoneg);
>> +	phylink_set(xilinx_supported, Pause);
>> +	phylink_set(xilinx_supported, Asym_Pause);
>> +	switch (state->interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
>> +		/* Half duplex not supported */
>> +		phylink_set(xilinx_supported, 10baseT_Full);
>> +		phylink_set(xilinx_supported, 100baseT_Full);
>> +		phylink_set(xilinx_supported, 1000baseT_Full);
>> +		break;
>> +	case PHY_INTERFACE_MODE_1000BASEX:
>> +		phylink_set(xilinx_supported, 1000baseX_Full);
>> +		break;
>> +	case PHY_INTERFACE_MODE_2500BASEX:
>> +		phylink_set(xilinx_supported, 2500baseX_Full);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	linkmode_and(supported, supported, xilinx_supported);
>> +	return 0;
> 
> You can not assume that an interface mode implies any particular media.
> For example, you can not assume that just because you have SGMII, that
> the only supported media is BaseT. This has been a fundamental principle
> in phylink's validation since day one.
> 
> Phylink documentation for the pcs_validate() callback states:
> 
>  * Validate the interface mode, and advertising's autoneg bit, removing any
>  * media ethtool link modes that would not be supportable from the supported
>  * mask. Phylink will propagate the changes to the advertising mask. See the
>  * &struct phylink_mac_ops validate() method.
> 
> and if we look at the MAC ops validate (before it was removed):
> 
> - * Clear bits in the @supported and @state->advertising masks that
> - * are not supportable by the MAC.
> - *
> - * Note that the PHY may be able to transform from one connection
> - * technology to another, so, eg, don't clear 1000BaseX just
> - * because the MAC is unable to BaseX mode. This is more about
> - * clearing unsupported speeds and duplex settings. The port modes
> - * should not be cleared; phylink_set_port_modes() will help with this.
> 
> PHYs can and do take SGMII and provide both BaseT and BaseX or BaseR
> connections. A PCS that is not directly media facing can not dictate
> the link modes.
> 

OK, how about this:

static int xilinx_pcs_validate(struct phylink_pcs *pcs,
			       unsigned long *supported,
			       const struct phylink_link_state *state)
{
	__ETHTOOL_DECLARE_LINK_MODE_MASK(xilinx_supported) = { 0 };
	unsigned long caps = phy_caps_from_interface(state->interface);

	phylink_set_port_modes(xilinx_supported);
	phylink_set(xilinx_supported, Autoneg);
	phylink_set(xilinx_supported, Pause);
	phylink_set(xilinx_supported, Asym_Pause);
	/* Half duplex not supported */
	caps &= ~(LINK_CAPA_10HD | LINK_CAPA_100HD | LINK_CAPA_1000HD);
	phy_caps_linkmodes(caps, xilinx_supported);
	linkmode_and(supported, supported, xilinx_supported);
	return 0;
}

--Sean

