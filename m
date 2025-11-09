Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0EECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPRMEMcp2dhUGBHSuTRmxmLz/+slEndBNL5XpFqtZ1U=; b=ke73s77asUyhWd8SR0791wAbRx
	IIy6ZgNG59oBz3OIm/7xMeIaE1tAl0ON7u4mxWxcW2ESr1agTv26ziuhW3bNW8w8rWUuQCn79lJcf
	BoVIksVPCr52rhxDdaO3PyP39eg6A6mHM9cHuT2x16qE80OCQX45jahZa5cIYTAfCrcQ83IFtio8M
	2IGC+3vo6+P2YQkvFVyXscSHtg9IMTCbOWdDAmUFG9CaxQrhN6E603sL5tlQLfITiVkpOYK455ebg
	sPW9Buh6IpLLhQs1CfmojPVjGVXE35v8JsuhoO92bnr8IC2GBf6ZDhiPVHBhN1i8G/guTPFHg4UUJ
	RXzq96kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8Ra-00000004A05-03x1;
	Sun, 09 Nov 2025 16:39:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8RW-000000049z5-1PZ0;
	Sun, 09 Nov 2025 16:39:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 082504E415EB;
	Sun,  9 Nov 2025 16:39:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCD0D606F5;
	Sun,  9 Nov 2025 16:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66E9011853189;
	Sun,  9 Nov 2025 17:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762706339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZPRMEMcp2dhUGBHSuTRmxmLz/+slEndBNL5XpFqtZ1U=;
	b=aIoKA3TZ8t6K+Vrshq3NfDorKiZuRejrlRcVM0UIqysbh10hoVWL/cFDQhnbe6lSgmOWR0
	uarz8vGDSht8iVMcwkPYyBxJjPFdP7M6zXkR37d8DrJIdoZygxRdQq+7li1H0hHStZwqWR
	daNbvdSgrgRc7RjtZdrQcXdI8UR0Aph/BG+sFxJJTMPqR/sWkHAj6VUwTAXQK8OSr8e/Mr
	KGNYX84FHVQkFyJhxmFq51m5AWO/5263nSruhA8vU2zzrFNPt2eFYtVdJFTHqJkYsTJkpW
	nyIToGDmgTbgMXEt7bAePomqHPtkWBJ+w4z9jj9+8PmpuLrHiKK2RuV0GMylRw==
Message-ID: <e309efc0-1b03-416c-8464-af92cc428acf@bootlin.com>
Date: Sun, 9 Nov 2025 17:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
 <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_083906_916947_EC70ACC0 
X-CRM114-Status: GOOD (  10.05  )
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



On 08/11/2025 08:58, Russell King (Oracle) wrote:
> On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> On 07/11/2025 15:29, Russell King (Oracle) wrote:
>>> -	switch (plat_dat->phy_interface) {
>>> -	case PHY_INTERFACE_MODE_RGMII:
>>> -	case PHY_INTERFACE_MODE_RGMII_ID:
>>> -	case PHY_INTERFACE_MODE_RGMII_RXID:
>>> -	case PHY_INTERFACE_MODE_RGMII_TXID:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_MII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
>>> -		break;
>>> -	case PHY_INTERFACE_MODE_RMII:
>>> -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
>>> -		break;
>>> -	default:
>>> +	int phy_intf_sel;
>>> +
>>> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
>>> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
>>> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>>>  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
>>>  		return -EOPNOTSUPP;
>>>  	}
>>
>> Probably not too big of a deal, but don't we now incorrectly accept the
>> "gmii" mode ?
> 
> We will accept GMII mode, but (a) does that matter, and (b) shouldn't
> the DT binding be checking the phy-mode (we have some bindings that do.)

Thanks for the clarification, that's fine by me then :)

Maxime


