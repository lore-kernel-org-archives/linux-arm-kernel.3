Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE008FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDi/O1w5Axi6gLmkd/iMBiKPKutsBbGBBRskX87UFl8=; b=0Iq+Yf1SRXuxDGzsuj2sNWsM+e
	vLBub1V9CQG7IvSy+RdoEpu5CxBOICG9Q8S8cVGD2EyDcPZQ1N5f9zaOfqxlupdEYy0daItC6wSkv
	K0NHM6pDrvAQM9TVAZPY0DDul4snRzbKczdc7JJ1m6K1adR8E3QAM99djMYqIg7hOQu6V+sgKgVkp
	K1AaS2qoyvN6WCj+VhZB3Vn8u4Rdrz62eSR4kFqcTC4DgKQ5/6ZivGumvBc3JFigfpS5GywQM1+Y3
	bRaxO71Z/dax6E7AT3+L2fNajLfaETH9x3c8H05IbsJmEaItA/DsRF2HzDEZ+O9ZJ0/NNRtIVeSyj
	vSYxLkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIKl-00000004c8R-3Yej;
	Wed, 25 Feb 2026 17:05:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIKg-00000004c7l-2VVT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:05:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKL-00010T-QT; Wed, 25 Feb 2026 18:05:33 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKK-002avE-0S;
	Wed, 25 Feb 2026 18:05:33 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vvIKL-00000004yoK-1Zi3;
	Wed, 25 Feb 2026 18:05:33 +0100
Date: Wed, 25 Feb 2026 18:05:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] i.MX SDMA cleanups and fixes
Message-ID: <4srixmuzaay4tetvlgribjtri5rm7akycy545vrg3d62ifmjsg@iflrkv65u3k5>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
 <aZ8cVP7E-BOEJKFu@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8cVP7E-BOEJKFu@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090554_656857_2B05B108 
X-CRM114-Status: GOOD (  27.24  )
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

On 26-02-25, Frank Li wrote:
> On Thu, Sep 11, 2025 at 11:56:41PM +0200, Marco Felsch wrote:
> > Hi,
> >
> > by this series the i.MX SDMA handling for i.MX8M devices is fixed. This
> > is required because these SoCs do have multiple SPBA busses.
> >
> > Furthermore this series does some cleanups to prepare the driver for the
> > upcoming DMA devlink support. The DMA devlink support is required to fix
> > the consumer <-> provider issue because the current i.MX SDMA driver
> > doesn't honor current active DMA users once the i.MX SDMA driver is
> > getting removed. Which can lead into very situations e.g. hang the whole
> > system.
> 
> Marco Felsch:
> 
> 	Can you help rebase these patches?

Sure, will do.

Regards,
  Marco


> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Changes in v2:
> > - Link to v1: https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de
> > - Split DMA devlink support and SDMA driver fixes&cleanups into two series
> > - Make of_dma_controller_free() fix backportable
> > - Update struct sdma_channel documentation
> > - Shuffle patches to have fixes patches at the very start of the series
> > - Fix commit message wording
> > - Check return value of devm_add_action_or_reset()
> >
> > ---
> > Marco Felsch (10):
> >       dmaengine: imx-sdma: fix missing of_dma_controller_free()
> >       dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
> >       dmaengine: imx-sdma: drop legacy device_node np check
> >       dmaengine: imx-sdma: sdma_remove minor cleanups
> >       dmaengine: imx-sdma: cosmetic cleanup
> >       dmaengine: imx-sdma: make use of devm_kzalloc for script_addrs
> >       dmaengine: imx-sdma: make use of devm_clk_get_prepared()
> >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma_device
> >       dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma-controller
> >       dmaengine: imx-sdma: make use of dev_err_probe()
> >
> >  drivers/dma/imx-sdma.c | 181 ++++++++++++++++++++++++++-----------------------
> >  1 file changed, 96 insertions(+), 85 deletions(-)
> > ---
> > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > change-id: 20250903-v6-16-topic-sdma-4c8fd3bb0738
> >
> > Best regards,
> > --
> > Marco Felsch <m.felsch@pengutronix.de>
> >
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

