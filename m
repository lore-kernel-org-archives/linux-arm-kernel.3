Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLLxn78u+8+1L7m4Hy+pK/B2niPXFochyMyqpQUziq4=; b=Hz9YZXgjM44MGidvOIpngTYCQD
	1k0XwVw7kPBOXJinVp2NDFQdfTuHPIuk/Xm5oSiXfK1T9wHOxLDz+IIn++jz1PdiTTuMR+lWz8Aj8
	EFCkIY5GvwtuyV5BLjLwXZW1jwts3PDPrc7xJSevREevpcrY5jqmYejZ01B5i5IqlE8eZ+40dj5q5
	ReNclVLuwq3rPIpJQ9Ra7+vJT7lqFeHYU1CfzxWRFfAMmFGreh0bSg4r/3a0Xn91vOBEkTx8VFgdR
	+0dFkqwD5XkXqkn8qM0uN7Kx9NGNcod4wgD3sD5ofnggtns92p7JqX+WvK6H+i7EKw2OyWx7jdH2z
	ipKYz5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoUk-0000000ELPQ-2EVb;
	Tue, 11 Aug 2026 15:34:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoUj-0000000ELPG-12vz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:34:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A526A43BE6;
	Tue, 11 Aug 2026 15:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB811F00A3A;
	Tue, 11 Aug 2026 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786462464;
	bh=FLLxn78u+8+1L7m4Hy+pK/B2niPXFochyMyqpQUziq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NlEf65KJ4XpLGNurN9j8nn2GOJSSfVMpCO9/jZwiID/Wg3+9PudhSLabjYh7IM5Wv
	 ZKH1aarc901hJSRvdg8kScs57A8w3EUsXtkJaJAVg81NGUjDk7t/Or7LCn8O4GH9sL
	 +Y/AgZCm8WWSvT8KcbGkApZOgJJ+l6ATmR5eqrxacLn4XDSViZp/XDqi3tnjfxvh7C
	 14UsUyYsBFVgauUYpbvTeewa9QS2CaV8zgq9gnS1ANVDEBTkQ4wNcNO7wQf4tF+dTA
	 JBc3kJ88y6JxPnR/mPomJY4K974XGnq9OWPa0RM/f6F3uJg9uEibYexElMM+RxmQBh
	 SMg7C8KrVvHjw==
Message-ID: <351d66fd-d904-4305-814c-0c3bda2361c4@kernel.org>
Date: Tue, 11 Aug 2026 10:34:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/4] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
Content-Language: en-US
To: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260716021932.20037-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260716021932.20037-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260716-monumental-daring-beagle-28e81d@quoll>
 <e3c2a7c5-35d3-4c40-9adb-39e9c8659af8@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <e3c2a7c5-35d3-4c40-9adb-39e9c8659af8@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/26/26 21:07, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 16/7/2026 3:56 pm, Krzysztof Kozlowski wrote:
>> On Wed, Jul 15, 2026 at 07:19:32PM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>
>>> The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
>>> implemented as FPGA soft IP between gmac1 and its PHY. This converter
>>> provides the RGMII TX/RX clock delays, so the MAC interface selector
>>> must be configured for GMII while the PHY is configured without delays.
>>>
>>> Add the "altr,socfpga-stmmac-agilex5-tsn" compatible to the match table
>>> and detect it in probe to force GMII for the MAC interface selector and
>>> strip the delay bits from phy_interface so the PHY is not configured to
>>> add delays already provided by the FPGA converter.
>>>
>>> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>> ---
>>> v4: Add Reviewed-by from Andrew Lunn.
>>>
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 ++++++++++++-
>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> index 1d7f0a57d288..bf591a68502f 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> @@ -69,12 +69,13 @@ struct socfpga_dwmac {
>>>    	void __iomem *tse_pcs_base;
>>>    	void __iomem *sgmii_adapter_base;
>>>    	bool f2h_ptp_ref_clk;
>>> +	phy_interface_t mac_interface;
>>>    	const struct socfpga_dwmac_ops *ops;
>>>    };
>>>    
>>>    static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>>>    {
>>> -	return dwmac->plat_dat->phy_interface;
>>> +	return dwmac->mac_interface;
>>>    }
>>>    
>>>    static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
>>> @@ -650,6 +651,15 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>>>    	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>>>    	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
>>>    
>>> +	dwmac->mac_interface = plat_dat->phy_interface;
>>> +
>>> +	if (of_device_is_compatible(pdev->dev.of_node,
>>> +				    "altr,socfpga-stmmac-agilex5-tsn")) {
>>
>> Don't add compatibles around the code. Does not scale. You have driver
>> match data exactly for that purpose.
>>
>>> +		dwmac->mac_interface = PHY_INTERFACE_MODE_GMII;
>>> +		if (phy_interface_mode_is_rgmii(plat_dat->phy_interface))
>>> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
>>> +	}
>>> +
>>>    	ops->setup_plat_dat(dwmac);
>>>    
>>>    	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>>> @@ -674,6 +684,7 @@ static const struct of_device_id socfpga_dwmac_match[] = {
>>>    	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
>>>    	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
>>>    	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
>>> +	{ .compatible = "altr,socfpga-stmmac-agilex5-tsn", .data = &socfpga_agilex5_ops },
>>
>> Otherwise dvices are compatible? They why would you need this entry in
>> the first place?
> Hi Krzysztof,
> 
> Just to confirm: should we add a separate socfpga_agilex5_tsn_ops and
> use that as .data for the TSN compatible, instead of checking the
> compatible string in probe and reusing socfpga_agilex5_ops?
> 
>
I believe that is right way to do it instead of looking for compatibles 
around code.


Dinh

