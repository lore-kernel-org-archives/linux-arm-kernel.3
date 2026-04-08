Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937F1073C8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILRS2tCRwpgSNCOrN2fMzhW7JRxZunppcYH5nJ8Tj+I=; b=IjTfREd3AJTh+OlxGEdX1kHKNu
	cG8sNkclS8LVwx8ET2CYgdnKDGqjO01vRNnsDIQ1qZtSRio2hPyrfba7mhVEeCNb8iZ2W5hPBzY6Z
	e4/yQqkw/VEXMlJQK6wLDiAuVKfrShH2yrIzGX7yHWQN3GEmQ+DFFn8qtPVS3Ph6n61m2zGScv3Cn
	i9bsuGUhxK0epgFTyt49ZRNdaQO78+mElWgzvlNB8s0ldnCbBX/sfNBREmRXVv2U+hnsBEtFpIdgX
	rK1gHK94c2UqvsLEmZ7ojOJVKYVgonc+8RDYohZEQBGZ/VtAP90iHWP1BszPzoiZJVED7RDNO4/ZU
	9p/WU5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ2X-00000008gFb-3vIZ;
	Wed, 08 Apr 2026 10:21:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ2U-00000008gEg-49VM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:21:40 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wAQ23-0004mm-KN; Wed, 08 Apr 2026 12:21:11 +0200
Message-ID: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
Date: Wed, 8 Apr 2026 12:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
To: Paul Geurts <paul.geurts@prodrive-technologies.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: martijn.de.gouw@prodrive-technologies.com
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_032139_029858_2114C36C 
X-CRM114-Status: GOOD (  25.80  )
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

Hello Paul,

On 4/8/26 12:13 PM, Paul Geurts wrote:
> The i.MX8MM clock driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> 
> Explicitly initialize the clock driver in arch_initcall(), to make sure
> the clock driver is ready when the rest of the drivers are probed.
> 
> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")

Your commit message doesn't explain why this was a problem for you.
Does it delay your boot? What makes this patch a fix?

> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> ---
>  drivers/clk/imx/clk-imx8mm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 319af4deec01..7b2cf867b920 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -636,7 +636,19 @@ static struct platform_driver imx8mm_clk_driver = {
>  		.of_match_table = imx8mm_clk_of_match,
>  	},
>  };
> -module_platform_driver(imx8mm_clk_driver);
> +
> +static int __init imx8mm_clk_init(void)
> +{
> +	return platform_driver_register(&imx8mm_clk_driver);
> +}
> +arch_initcall(imx8mm_clk_init);

What happens if you build the driver as module with your changes applied?

Cheers,
Ahmad

> +
> +static void __exit imx8mm_clk_exit(void)
> +{
> +	platform_driver_unregister(&imx8mm_clk_driver);
> +}
> +module_exit(imx8mm_clk_exit);
> +
>  module_param(mcore_booted, bool, S_IRUGO);
>  MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
>  

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


