Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Olra4gYfmU26QXLSZoYONDuJKBUusYrRdN/NXz7ie4U=; b=rDtawdw8xRLatr6qvdQjLdgwzz
	BnC8sMqAWImRh6ZaEtRi2vychYIIr6cbCT7NgB5Pb1CQ3rLCjaqszkduzBLJ5SPtg44wBzI8tARmm
	OE0ni8Ok4H6ecdIZ4AUKoZGMvb2bZXxTRKz9sN6uNAslPm9j4513Ivs2ugL74DuOYatPzFe9ozz5U
	Y0Fh1YFhUJlKcfz3S0PyEdaDi+osh8NlN6s9mTXCkQwSVQuKnONm+QrPDYTQu3UVhFEKUedP51255
	nkCzYpW3uybo5llVFzesRpZ7PVQUB2ko+BXogudzVUaZLHhbrn+7NU8pe3L8eCiGGxktzZQUTLNE0
	3d3SOZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi3G-0000000FhGE-3YyL;
	Wed, 21 May 2025 11:56:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhsw-0000000FfLx-3yBb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:45:25 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uHhsc-00018T-H7; Wed, 21 May 2025 13:45:02 +0200
Message-ID: <721420c6-5e65-48a4-81c5-b161d0df8cfd@pengutronix.de>
Date: Wed, 21 May 2025 13:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: inherit pins_100mhz from
 pins_200mhz when unconfigured
To: ziniu.wang_1@nxp.com, haibo.chen@nxp.com, adrian.hunter@intel.com,
 ulf.hansson@linaro.org, linux-mmc@vger.kernel.org
Cc: imx@lists.linux.dev, s32@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
References: <20250521112042.266111-1-ziniu.wang_1@nxp.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250521112042.266111-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_044522_979291_00DE1DE6 
X-CRM114-Status: GOOD (  22.38  )
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

Hi Luke,

Thanks for your patch.

On 21.05.25 13:20, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> On some new i.MX platforms, hardware guidelines recommend using identical
> pin configurations for SDR50/DDR50 (100MHz) and SDR104/HS400 (200MHz)
> modes. But defining two identical pinctrl for 100MHz and 200MHz in dts
> creates redundancy.

I am not convinced this is an improvement. If 200mhz is missing, it's understood
that it's not supported. Now if 100mhz is missing, it means something different
depending on whether state_200mhz exists or not. This is more mental overhead
than having:

  pinctrl-names = "default", "state_100mhz", "state_200mhz";
  pinctrl-0 = <&pinctrl_usdhc1>;        
  pinctrl-1 = <&pinctrl_usdhc1_uhs>;   
  pinctrl-2 = <&pinctrl_usdhc1_uhs>;

where it's directly evident that you share pinctrl states.

> In this case, omit explicit 100MHz configuration,
> driver will inherit 100MHz pinctrl from 200MHz.
> 
> Preserves existing behavior if 100MHz is configured but 200MHz not (e.g,
> imx8mp-navq.dts usdhc1 supports SDR50/DDR50 but SDR104/HS400 not).

This conflicts with the binding, which doesn't allow for state_200mhz
to exist without state_100mhz, so that would need adaptation.

As noted before though, I don't think we really need to change anything
here though.

Thanks,
Ahmad

> 
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index f206b562a6e3..dfd8be5000c8 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1810,6 +1810,9 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>  						ESDHC_PINCTRL_STATE_100MHZ);
>  		imx_data->pins_200mhz = pinctrl_lookup_state(imx_data->pinctrl,
>  						ESDHC_PINCTRL_STATE_200MHZ);
> +
> +		if (IS_ERR_OR_NULL(imx_data->pins_100mhz))
> +			imx_data->pins_100mhz = imx_data->pins_200mhz;
>  	}
>  
>  	/* call to generic mmc_of_parse to support additional capabilities */


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

