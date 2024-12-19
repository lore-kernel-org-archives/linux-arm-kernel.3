Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71CUMjBwFjihRihwd4NGt5FSHjRcvwtdhw60DmKXJGc=; b=vDhxgeb0Fchsp17WC58J+GIgoM
	v5aBrCkAUUYrKSEj+pjJh0vv8DBF9JJQDNKjJ3/ej5Ac5HS7TTlwyALAU+Cym6y91Mnklnbe6+b4R
	0SirX3JAU4UvDKTNM4GGmigSIjYyjhPrLRiNz9+ChkhnH0VbBhqAI3h8+URYMI2BZgKneCJPZDt6D
	uITlaJ1wEj/LK7Tx9e4DtKwn3UhOs8UTWuB8i1lSdnf+/NvDolSNRuGa0m5CMJhboEg4bsYirML35
	pSl9TW1MgLpjOoQ6lllfAiKIVgTCgu9z0w5NnKxg3NPGnFvTYFKy4tlzyu1ZS1Is9qxArmiodHsYV
	NkkDJDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9WN-00000000vZB-0D6h;
	Thu, 19 Dec 2024 05:56:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9VF-00000000vOG-366g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 05:55:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V7-0008By-CH; Thu, 19 Dec 2024 06:55:09 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V6-0049ds-0j;
	Thu, 19 Dec 2024 06:55:09 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V6-008Mx6-2s;
	Thu, 19 Dec 2024 06:55:08 +0100
Date: Thu, 19 Dec 2024 06:55:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: andi.shyti@kernel.org, frank.li@nxp.com, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <Z2O1PFr4ZQHXTsrX@pengutronix.de>
References: <20241218044238.143414-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218044238.143414-1-carlos.song@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_215517_776283_C76A2885 
X-CRM114-Status: GOOD (  29.54  )
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

On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
                                       do not exist?
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
> 
> So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
> IMX7DS_2N09P).

This link is not working, may be this one:
https://www.nxp.com/docs/en/errata/IMX7DS_3N09P.pdf

More practical is to include the erratum text with list of affected SoC
variants.

> "fsl,imx7d-i2c" already is documented in binding doc. This errata

s/errata/erratum

Errata is plural
Erratum is singular

> fix has been included in imx6_i2c_hwdata and it is the same in all
> I.MX6/7/8, so just reuse it.
> 

Please Fixes tag, this patch should go stable:
Fixes: 39c025721d70 ("i2c: imx: Implement errata ERR007805 or e7805 bus frequency limit")
Cc: stable@vger.kernel.org

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

With fixes in the commit message you can add my:
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
> Change for V3:
> - No ACK, so resend this patch.
> Change for V2:
> - I have tried to fix this issue at imx7s.dtsi in V1, according to
>   the community suggestion, I make V2 patch for i2c-imx driver to
>   avoid updating the FDT to fix an errata. Discussion in V1:
>   Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
>   Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
> ---
>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 350346a7892c..9d5caa032c5c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
> +	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

