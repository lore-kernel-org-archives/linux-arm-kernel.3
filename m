Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF64CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ofRlSsFnhj/Eeu/sD0PofisXJqQ/KuD7u+eEwaLVpo=; b=WLU2BLEYYEBNPAcgXq8a/IFGCl
	VQCjcXME2/WSvn0Kg0XcwwYtxh2yA/dLkmQSfRZHxYJ/Naf0AyaJvdHgGV1ZnX5vj+c0LPPkesjXS
	TUEfMnE5bECiA6dg//XTa5sdr4vOBm/+SyfR5NfQUtPHaxUozH327+TQQpzLjzx6sUeHidRnp65Xj
	qcdM5b6qcmEz48FCzd0IKbELREAEJJv9mcJ2KzgCEbz5k54sSmcjzckErHkobS18BZJHFuSKrlqv/
	Kf+RSbl4AgM7X3a5IbGVNTlyGAgzRCSTJjN9A6ntMGhAT1VJEsw6gFu6AGIno6id0Npsx/ObnUWW6
	h+Giwr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE88I-00000001nYK-0xie;
	Wed, 29 Oct 2025 15:30:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE88F-00000001nX1-0fnG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:30:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC402C0DA85;
	Wed, 29 Oct 2025 15:30:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1C7F606E8;
	Wed, 29 Oct 2025 15:30:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB67117F828E;
	Wed, 29 Oct 2025 16:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761751835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+ofRlSsFnhj/Eeu/sD0PofisXJqQ/KuD7u+eEwaLVpo=;
	b=eB6wzXTCe/N3Q7dnaf6E9dD6yIWqSPDSn9o8vSlwVuWiOke9KspcmyR3CG1QVsw+HezX0y
	1X3jvFHAgVvLW7k+aUOuDRVmTgLNHUEO3Jb3BuAhw8b9nT00u7344feagp5jWlgxn+6ShB
	uFOtaX+PLP3cVmuPojb2e71INjODRojB3xvSIxQjBymXckqYskJBKFpCrtS8SsVpnVDBTJ
	n2W65bWJ73uXwf92pagwrmpkPIHj9zHjYnhiqecpGzL/r9vScHejb19tGlB2XiXcXEvJhA
	ZB7DFlblrUEZSB76ilrkkTxXfu2APGPgSKtbo+H5ODgnR9r6xURX9SY93+4I3Q==
Message-ID: <a58f9a1c-a2f7-4c61-838e-7808e157ae25@bootlin.com>
Date: Wed, 29 Oct 2025 16:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: stmmac: socfpga: Agilex5 EMAC platform
 configuration
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-1-1931132d77d6@altera.com>
 <a871daac-364e-4c2c-8343-d458b373e1fd@bootlin.com>
 <db213912-2250-4d3e-9b2c-a4e36e92e1cb@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <db213912-2250-4d3e-9b2c-a4e36e92e1cb@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_083039_525151_6121B45A 
X-CRM114-Status: GOOD (  16.28  )
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

Hi,

On 29/10/2025 15:53, G Thomas, Rohan wrote:
> Hi Maxime,
> 
> On 10/29/2025 7:04 PM, Maxime Chevallier wrote:
>> Hi Rohan,
>>
>> On 29/10/2025 09:06, Rohan G Thomas via B4 Relay wrote:
>>> From: Rohan G Thomas <rohan.g.thomas@altera.com>
>>>
>>> Agilex5 HPS EMAC uses the dwxgmac-3.10a IP, unlike previous socfpga
>>> platforms which use dwmac1000 IP. Due to differences in platform
>>> configuration, Agilex5 requires a distinct setup.
>>>
>>> Introduce a setup_plat_dat() callback in socfpga_dwmac_ops to handle
>>> platform-specific setup. This callback is invoked before
>>> stmmac_dvr_probe() to ensure the platform data is correctly
>>> configured. Also, implemented separate setup_plat_dat() callback for
>>> current socfpga platforms and Agilex5.
>>>
>>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
>>> ---
>>>   .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 53 ++++++++++++++++++----
>>>   1 file changed, 43 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> index 2ff5db6d41ca08a1652d57f3eb73923b9a9558bf..3dae4f3c103802ed1c2cd390634bd5473192d4ee 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
>>> @@ -44,6 +44,7 @@
>>>   struct socfpga_dwmac;
>>>   struct socfpga_dwmac_ops {
>>>   	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
>>> +	void (*setup_plat_dat)(struct socfpga_dwmac *dwmac_priv);
>>>   };
>>>   
>>>   struct socfpga_dwmac {
>>> @@ -441,6 +442,39 @@ static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
>>>   	return dwmac->ops->set_phy_mode(dwmac);
>>>   }
>>>   
>>> +static void socfpga_common_plat_dat(struct socfpga_dwmac *dwmac)
>>> +{
>>> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
>>> +
>>> +	plat_dat->bsp_priv = dwmac;
>>> +	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
>>> +	plat_dat->init = socfpga_dwmac_init;
>>> +	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
>>> +	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>>> +	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
>>> +}
>>> +
>>> +static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
>>> +{
>>> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
>>> +
>>> +	socfpga_common_plat_dat(dwmac);
>>> +
>>> +	plat_dat->core_type = DWMAC_CORE_GMAC;
>>> +
>>> +	/* Rx watchdog timer in dwmac is buggy in this hw */
>>> +	plat_dat->riwt_off = 1;
>>> +}
>>> +
>>> +static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
>>> +{
>>> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
>>> +
>>> +	socfpga_common_plat_dat(dwmac);
>>
>> I"m not familiar with this device (I only have a Cyclone V on hand), does
>> it still make sense to try to instantiate a Lynx (i.e. Altera TSE) PCS
>> for that IP ?
> 
> AFAIK, yes it is supported by Agilex V device family also.
> https://www.altera.com/products/ip/a1jui0000049uuomam/triple-speed-ethernet-fpga-ip

Ah nice to know, thanks !

this looks correct then :)

Maxime

> 
>>
>> Maxime
>>
> 
> Best Regards,
> Rohan
> 


