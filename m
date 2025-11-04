Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F32FCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqrKvT/39GIw4bETHcXxm6B86XwJZy5zQulp7Zkzg80=; b=38x61NersLCilhB+qxlH/DHt9K
	+AvSuY4zOlvMSYRCfrSC4MCQG9UnS/tMYOiDWblH612nxwjrMpTtghhvO/r2cW8ajHxAr8Cv0TU0p
	/CnXp9K2FTHCu0S0X1sS8VevENA1UEKfVwRjC7JanxjO6BSUuPaaoMSobEHAhF6co96e5msjB0O1r
	KRoui3ArhX523OTDKUbdtIfDGbM2pMdtReuOPwG6RhKPzpszLzOL2r8jzM73jKSuQE7neZoBgvjcY
	/4k0b0hf8uuJfgf7sIOGn4xE9hc5tJEcokNWstH9J1ZY61hKTNtaRBpbDmIlzMPqwII/GZl8RlYco
	RhCaPIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGD1M-0000000BVpy-2a9q;
	Tue, 04 Nov 2025 09:08:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGD1J-0000000BVpa-17uM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:08:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 19D7C4E414F0;
	Tue,  4 Nov 2025 09:08:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2ACD606EF;
	Tue,  4 Nov 2025 09:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87FD110B50499;
	Tue,  4 Nov 2025 10:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762247281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IqrKvT/39GIw4bETHcXxm6B86XwJZy5zQulp7Zkzg80=;
	b=aPVPylMf2uPJTc5vq8FUwy26OuucAub5M8J+o+CEOCkoo6sjLGddx2uuKXPLxChca5uE9n
	rCXLuYN1N5fV0jjH/bgGSLJaTrW4CvemCkaJB58wOL+bN8kMOtZUORX0zHjAvWGVCblCRL
	1mOBICgLxRa47LV5NCBmyt104DOWZex53RAm0Lhb9Yok62+5FpbXSPK3BuCkl9tKKzmAUQ
	tbxFO3TU5e2f50fJyb69LnMQWuCzGv6/9rCll6F26cvAbX8GJofb+wJvvg2nZA3WXgI79A
	/g9jd600NqLXDLBVOrJk4PHYNpsN0UOSDA7OAEXG7oR8YBNadRWHBTijAJ96/w==
Message-ID: <4f029450-df4f-419d-adb4-493a8ca03e63@bootlin.com>
Date: Tue, 4 Nov 2025 10:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/11] net: stmmac: add stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
 <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
 <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_010805_750902_3351D8AD 
X-CRM114-Status: GOOD (  25.55  )
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



On 04/11/2025 09:49, Russell King (Oracle) wrote:
> On Tue, Nov 04, 2025 at 09:34:31AM +0100, Maxime Chevallier wrote:
>>> +int stmmac_get_phy_intf_sel(phy_interface_t interface)
>>> +{
>>> +	int phy_intf_sel = -EINVAL;
>>> +
>>> +	if (interface == PHY_INTERFACE_MODE_MII ||
>>> +	    interface == PHY_INTERFACE_MODE_GMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>>> +	else if (phy_interface_mode_is_rgmii(interface))
>>> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_SGMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_SGMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_RMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_REVMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_REVMII;
>>> +
>>> +	return phy_intf_sel;
>>> +}
>>> +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
>>
>> Nothng wrong with your code, this is out of curiosity.
>>
>> I'm wondering how we are going to support cases like socfpga (and
>> probably some other) where the PHY_INTF_SEL_xxx doesn't directly
>> translate to the phy_interface, i.e.  when you have a PCS or other
>> IP that serialises the MAC interface ?
> 
> It also doesn't differentiate between MII and GMII. That's fine for
> this - this is about producing the configuration for the dwmac's
> phy_intf_sel_i signals. It isn't for configuring the glue hardware
> for any other parameters such as RGMII delays.
>  
>> for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
>> when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
>> we need to output RGMII.
> 
> From what I remember for socfpga, you use an external PCS that needs
> GMII. This function doesn't take account of external PCS, and thus
> platform glue that makes use of an external PCS can't implement
> .set_phy_intf_sel() yet.

Makes sense

> As noted, it also doesn't handle TBI (which,
> although we have PHY_INTERFACE_MODE_TBI, Synopsys intended this mode
> to be used to connect to a SerDes for 1000BASE-X.)

That's fine by me, thanks for the clarifications :)

> 
>> Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)
> 
> Yes, there will need to be a way to override this when an external
> PCS is being used. I suspect that all external 1G PCS will use GMII,
> thus we can probably work it out in core code.
> 
> Note, however, that socfpga doesn't use the phy_intf_sel encoding:
> 
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RMII 0x2
> 
> #define PHY_INTF_SEL_GMII_MII   0
> #define PHY_INTF_SEL_RGMII      1
> #define PHY_INTF_SEL_RMII       4
> 
> It's close, but it isn't the phy_intf_sel_i[2:0] signal values.

> 
Yeah :/

I'll give this series a try on dwmac-imx once I get a bit of time then !

thanks,

Maxime

