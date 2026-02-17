Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740AE68172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYlhtpdrfBQ8vdXnBTpJdJ7ccgw4Nw/Az0idcrGZBS8=; b=LL5k3UEuTUO8c78JJNVezwFO8t
	cBh+7FGuwT5NIXWH7DwDwBOnkzvv3yYxyjmRj4kIU25ryZ/ZF4SCV/pPylrYOhCTDZZRplv/Ql+eX
	DdGkGOdvl3YvnO1651+qjH8wbZC1DCH6L7NyZ4/9JIYlcTidwOuNs5wzzSRkx0Ic3PqV4qohAzDzz
	8rksSu4kjhoARDIGd1KliDCX8sddQ9KjO2IWQRVgBQyLysmCwpeRPGcfKJ3YzecN8do7tLRHUV7w8
	5UJsgZyNwe1DGiBZHTWqKQ7vJXDQjFWlsgAbRs0grcZZo+ZT5uFglkiHqPbkG3Eep8SaaCTDEcnWT
	b+rdT59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ0e-000000085OW-31XO;
	Tue, 17 Feb 2026 11:12:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ0Z-000000085Nw-38xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:12:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsJ0P-00086Q-FK; Tue, 17 Feb 2026 12:12:37 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsJ0N-001E7b-1N;
	Tue, 17 Feb 2026 12:12:36 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vsJ0O-00000007gOG-2jDJ;
	Tue, 17 Feb 2026 12:12:36 +0100
Date: Tue, 17 Feb 2026 12:12:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <il4ssuhxfnpgz2mrixybum4i5v2j6mmozqakedzav5miwbbezg@qfg25ybp7lpo>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
 <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
 <aZRBnD2KOP4PYP16@zeus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZRBnD2KOP4PYP16@zeus>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031247_795031_DBA5D241 
X-CRM114-Status: GOOD (  25.24  )
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

On 26-02-17, Ian Ray wrote:
> On Tue, Feb 17, 2026 at 10:54:49AM +0100, Marco Felsch wrote:
> > CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> > 
> > Hi Ian,
> > 
> > On 26-02-17, Ian Ray wrote:
> > > The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> > > for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> > > 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.
> > 
> > the on-demand rate calculation doe for the PLL1443X PLLs is not
> > sufficient for you?
> 
> Apologies! The on-demand rate calculation does indeed work. So please
> ignore this patch.
> 
> (The patch was needed on kernel 6.12 IIRC, and I automatically re-based
> it on 6.18 without re-testing. Once again, apologies for the noise.)

No worries, sometimes there are needs to very specific PLL setting due
to emc or so but these are rare cases and therefore I asked :)

Regards,
  Marco


> 
> > 
> > Regards,
> >   Marco
> > 
> > 
> > >
> > > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > > ---
> > >  drivers/clk/imx/clk-pll14xx.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > > index 36d0e80b55b8..84279cf9f12b 100644
> > > --- a/drivers/clk/imx/clk-pll14xx.c
> > > +++ b/drivers/clk/imx/clk-pll14xx.c
> > > @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
> > >
> > >  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> > >       PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> > > +     PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
> > >       PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
> > >       PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
> > >       PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> > > --
> > > 2.49.0
> > >
> > >
> > >
> > 
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> > 
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

