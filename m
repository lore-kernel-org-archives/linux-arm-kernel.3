Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCB8D2D0E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/8Bp9EtRi+dBpT7WJ1GJrg8Htbr6gXDuf6Ie0dhaGM=; b=BZ/4DB+y1Vi9b6nFv2/VCjBjiQ
	/AHxZo1uSVzuhjp4X5rj71qH+a4U1FyJ/Poq/N3s4C6B8C9AOF8BgeqdYYHJtQInl1x/LEJD6Phem
	rFOYxqlJNzePDpFhkH1yT1XpLNdEItE5XI5ZiCtrYGN5l+cfnPL71HoPsapHDhzn29115cLZn/9/j
	F2DVJmwDb1fy9cgMpFNCRYs9D3uJ++w4oloKJmgXch1ec0Hu1LK+j+OCIWLiV+wQLEraeVp6PcYNy
	0bQ6t1vsQ3zQdUJ6dY17yb6POGpCwWYYUqmShA8UBLvubyg2vmALSzxlLkN+986tbDd562B4ZeYoq
	+Igq3vQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdmf-0000000776R-472U;
	Tue, 13 Jan 2026 12:46:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdmc-0000000775r-3kr7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:46:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmU-0007Pm-HP; Tue, 13 Jan 2026 13:45:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmU-000QP4-2E;
	Tue, 13 Jan 2026 13:45:54 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfdmT-009sZG-2q;
	Tue, 13 Jan 2026 13:45:53 +0100
Date: Tue, 13 Jan 2026 13:45:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Message-ID: <20260113124553.qe7rai3bn6bff7hy@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
 <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_044602_934260_687CBD11 
X-CRM114-Status: GOOD (  22.86  )
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

On 26-01-13, Daniel Baluta wrote:
> On Tue, Jan 13, 2026 at 2:29 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> > 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> > index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff654c6481611375e3 100644
> > --- a/drivers/clk/imx/clk-fracn-gppll.c
> > +++ b/drivers/clk/imx/clk-fracn-gppll.c
> > @@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
> >         PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
> >         PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
> >         PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
> > -       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
> > +       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
> > +       PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)
> 
> Can you please end this line with a comma so that next addition at the end of
> the array will create a simpler diff?

Thought about this too but I don't know why I didn't added this.

Thanks for the input.

Regards,
  Marco

> Look for example at int_tbl array in the same file.
> 
> thanks,
> Daniel.
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

