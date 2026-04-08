Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF7C1073C8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHseQhcXVYOXC7RipHyrkZffRjORcwNUA8E7tGxDZCA=; b=3y2JH2Ep44c+OaQ0cxfZ2t0+zM
	e+MYp2pd2UJfwsCWcy1hrCiWpCc7Ega+wxq+oZJktgUa4zev6di0iPlSSDrKf26Syu7gChiyqft2i
	Q6R8WrshM67EDCv7ZR727blz7cAPHOlot7bhThkAK/MJcl69UJbhtEc52VIFIW5FoKIaTVokujQXe
	vGqbDeK9MOWUOu16nxISIthtUj+ROkuAdc5l2YWXAN2dwe0Lnl0Y5JdnaTghsWKetY/yqJ8m3GmFf
	46AqEvOQrtIXUxBV1v5maYNa+F8dc6C2EFV7bJ87w9lr1XuBbs7Ngpeoec2l/oPC8I/17nxNkc1p9
	GNFgcf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ4v-00000008gRl-3jSj;
	Wed, 08 Apr 2026 10:24:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ4t-00000008gRD-48i8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:24:09 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wAQ4n-0005Ef-RL; Wed, 08 Apr 2026 12:24:01 +0200
Message-ID: <fabd81b1-0a08-4914-b92f-4ef23a6bf8a2@pengutronix.de>
Date: Wed, 8 Apr 2026 12:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
To: Paul Geurts <paul.geurts@prodrive-technologies.com>, srini@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, gregkh@linuxfoundation.org, p.zabel@pengutronix.de,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: martijn.de.gouw@prodrive-technologies.com
References: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_032408_048405_6F19FEE3 
X-CRM114-Status: GOOD (  18.29  )
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

On 4/8/26 12:19 PM, Paul Geurts wrote:
> The i.MX OCOTP driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink.
> 
> As the OCOTP driver is arch specific, but dependent on the i.MX clock
> driver, which is also initialized in arch_initcall(), explicitly
> initialize the driver in subsys_initcall(). This makes sure the drivers
> depending on fuses defined by OCOTP, which are initialized in
> device_initcall() are not deferred.
> 
> Fixes: 3edba6b47e42 ("nvmem: imx-ocotp: Add i.MX6 OCOTP driver")

Same question as the imx8mm-clk patch.

Your commit message doesn't mention what problem you had the with deferral.

> -module_platform_driver(imx_ocotp_driver);
> +
> +static int __init imx_ocotp_init(void)
> +{
> +	return platform_driver_register(&imx_ocotp_driver);
> +}
> +subsys_initcall(imx_ocotp_init);

Same question as before. What happens when you build this as module.

Cheers,
Ahmad

> +
> +static void __exit imx_ocotp_exit(void)
> +{
> +	platform_driver_unregister(&imx_ocotp_driver);
> +}
> +module_exit(imx_ocotp_exit);
>  
>  MODULE_AUTHOR("Philipp Zabel <p.zabel@pengutronix.de>");
>  MODULE_DESCRIPTION("i.MX6/i.MX7 OCOTP fuse box driver");

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


