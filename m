Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE404E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnVrWEUtFgMvDpm5kd+ZvPWkuuGKmlEREXeXjJ/9WLQ=; b=Hgv/vhLsnyjZE0a2y1eWpYADVV
	U0skl8YU1g/7L/lFEDe00r7BWMC9OpIg1R2yPuJIBlaT4Tia1k5iMa26zcZZDyeYXTObpkewT6yiy
	/QsGcMs9sVha5UFLoBfiSewA3i7YtkRtzLd95xIfbM1sG0SlpmmodvKl9P9zkagsKGq3UivFaxett
	JCPcATdXQcFrsOmMgDb7MdOYsD8g7tDzP3KCJdU3M9G6gq+7cis5y0lsX++TqWPzL6Y7G/TKCF9Tc
	8ICNHUCfKWyic+2CvF5r6ACSJwiEV/MtMvQ1dNwvN6mMIfELfcNTuP8z4rjvlfus8wYoWXypopoC3
	HpCAbweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvAU-00000002oMF-1ZyF;
	Mon, 06 Jan 2025 22:01:50 +0000
Received: from smtp-66.smtpout.orange.fr ([80.12.242.66] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUv9E-00000002o1j-0Qrw;
	Mon, 06 Jan 2025 22:00:34 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Uv8xtgasrGcOqUv91t2CGv; Mon, 06 Jan 2025 23:00:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736200821;
	bh=QnVrWEUtFgMvDpm5kd+ZvPWkuuGKmlEREXeXjJ/9WLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Knj/XA/gpVUzVe4EkuDhwlNFpl7y04M6/5moZxeMxboXoZUWYOr6qlzRTqtNuWBG3
	 /MnW8YwGCMviEcnoV2JqsUluyeTkycD2nxfjYZNiruOjvLaYogZZzY8oAl9m4Td24Y
	 pYg4Z/jrut/XM9F6y3h1nqdZjtdy8lAW3t1w2sAQOXYO8ydYIYuV9CEMwd1PVh76v4
	 dqN9MflSQIWoZLVHXI3jOeiNuM5l8w4ZDt4Z1lfzhl3nfXKopCzzM8JLePvtwthV7G
	 LgXUMF95kAPUbB/M3yziRIliIN0woQ5by3smNzPMLz37eOdsxGpb4RgmhK0oBuSvy/
	 QfRYsK8viiV7g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 06 Jan 2025 23:00:21 +0100
X-ME-IP: 90.11.132.44
Message-ID: <1483780d-115f-4555-82b3-3e9cffe82dce@wanadoo.fr>
Date: Mon, 6 Jan 2025 23:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
To: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org,
 kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org,
 thomas.richard@bootlin.com, u.kleine-koenig@baylibre.com, eballetb@redhat.com
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250106131925.263240-1-s-vadapalli@ti.com>
 <20250106131925.263240-2-s-vadapalli@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250106131925.263240-2-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_140032_414856_C53F1DA0 
X-CRM114-Status: GOOD (  15.98  )
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

Le 06/01/2025 à 14:19, Siddharth Vadapalli a écrit :
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add register sequences to support PCIe multilink configuration for 100MHz
> reference clock. Maximum two PCIe links are supported.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> ***NOTE***
> Since I don't have the hardware required to validate PCIe Multilink +
> USB functionality, kindly *do not merge* this series until it gets a
> "Tested-by" tag with proper validation of the functionality.
> 
> Regards,
> Siddharth.
> 
>   drivers/phy/cadence/phy-cadence-torrent.c | 130 +++++++++++++++++++++-
>   1 file changed, 129 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
> index a281c0dfae97..b0b5f4bdd7e2 100644
> --- a/drivers/phy/cadence/phy-cadence-torrent.c
> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
> @@ -197,6 +197,7 @@
>   #define RX_SDCAL1_INIT_TMR		0x004CU
>   #define RX_SDCAL1_ITER_TMR		0x004DU
>   #define RX_CDRLF_CNFG			0x0080U
> +#define RX_CDRLF_CNFG2			0x0081U
>   #define RX_CDRLF_CNFG3			0x0082U
>   #define RX_SIGDET_HL_FILT_TMR		0x0090U
>   #define RX_REE_GCSM1_CTRL		0x0108U
> @@ -204,6 +205,7 @@
>   #define RX_REE_GCSM1_EQENM_PH2		0x010AU
>   #define RX_REE_GCSM2_CTRL		0x0110U
>   #define RX_REE_PERGCSM_CTRL		0x0118U
> +#define RX_REE_PEAK_UTHR		0x0142U
>   #define RX_REE_ATTEN_THR		0x0149U
>   #define RX_REE_TAP1_CLIP		0x0171U
>   #define RX_REE_TAP2TON_CLIP		0x0172U
> @@ -212,6 +214,7 @@
>   #define RX_DIAG_DFE_CTRL		0x01E0U
>   #define RX_DIAG_DFE_AMP_TUNE_2		0x01E2U
>   #define RX_DIAG_DFE_AMP_TUNE_3		0x01E3U
> +#define RX_DIAG_REE_DAC_CTRL		0x01E4U
>   #define RX_DIAG_NQST_CTRL		0x01E5U
>   #define RX_DIAG_SIGDET_TUNE		0x01E8U
>   #define RX_DIAG_PI_RATE			0x01F4U
> @@ -3131,6 +3134,101 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
>   	cdns_torrent_clk_cleanup(cdns_phy);
>   }
>   
> +/* Multi link PCIe configuration */
> +static struct cdns_reg_pairs ml_pcie_link_cmn_regs[] = {
> +	{0x0002, PHY_PLL_CFG},
> +	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0}
> +};

I think that some, if not all, of these new struct could be const, as 
elsewhere in this file.

> +
> +static struct cdns_reg_pairs ml_pcie_xcvr_diag_ln_regs[] = {
> +	{0x0100, XCVR_DIAG_HSCLK_SEL},
> +	{0x0001, XCVR_DIAG_HSCLK_DIV},
> +	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
> +};

...

CJ

