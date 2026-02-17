Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F616E68159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hDkuATiCpyYgWD6Cn1sKJCd2S8wLpxBVYbRq4yp+fo=; b=x6JoWP2f7t8QeVkppYVJGi2g0C
	NRQiX2Rmy96V870uBHeD7myUEIkQ0hDzc74iovpTBGaE7zAd+mJ4L8T32uGH9yidLlXNswnPZ4Ofc
	/JDogyKOtFcLSdFDwUs7JkimFlIS8rJRsxouiPqRjAdZ7+IPO45R1EcfWk3vBhnHcKpjo2V2JHtOq
	Cjw2N8+1+gKOz3W0LKnXZxY5wGcxtvXG5Kt5BAWvNFJl3Mt4McxyhuBWEVpQtSEq3usfHguQSTUh9
	qfSP3L31wJh3g0wANPAWryYaOcrRJoXux9+eRyEVbmBRW7wVHh5gUHAsX/Q8mwDTjC+LRhllBU7lD
	urGbZfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHny-00000007z0a-0bmk;
	Tue, 17 Feb 2026 09:55:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHnr-00000007yyy-1gZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:55:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn7-0007Wp-SS; Tue, 17 Feb 2026 10:54:49 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn6-001DDS-0B;
	Tue, 17 Feb 2026 10:54:49 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsHn7-00000007fIL-1EgV;
	Tue, 17 Feb 2026 10:54:49 +0100
Date: Tue, 17 Feb 2026 10:54:49 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217094152.19958-1-ian.ray@gehealthcare.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_015539_530467_5D93ACD4 
X-CRM114-Status: GOOD (  17.82  )
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

Hi Ian,

On 26-02-17, Ian Ray wrote:
> The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.

the on-demand rate calculation doe for the PLL1443X PLLs is not
sufficient for you?

Regards,
  Marco


> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 36d0e80b55b8..84279cf9f12b 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
>  
>  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
>  	PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> +	PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
>  	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
>  	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
>  	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> -- 
> 2.49.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

