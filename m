Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DA0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igLcQFJBENfZ6b2j6uxGZ+Tt2w/r9Jg7A/CBm+xFZZ0=; b=BDBWvg29GvGWxTLp+Qh8HMa7eO
	EulNbnhVnUOR7US1wgEETP0BD9Q27nrSpZJRn8AAO+Gs//nKLe/sWrGQRHn+w7o3YMkIss39zE4wE
	VLEwrXruQGJYjNXHJUMTVukAU/d1bN6+GrASsM9xlRLo1u5Up2FjB4GfsjoFK2jkYFUBvu7L/C4Xk
	V1N4Qskrz8Hp2CfTmC2JL7i1ZJDs7yUo99Ax8ANVvF878Ov+mJ3NkXPmjSF1ubKEuKf2ui8UCGRf5
	FiYhbkI/d14e6iJ9UBXmVQDDRfhWSmOdElwBGOuyq+1RVsNDxu+MY9vWfRNTbe/4jNAHI3CQU/Q9D
	QfzLJ1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV7y-0000000DAiG-2emJ;
	Tue, 17 Dec 2024 10:48:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV6C-0000000DAKf-3pC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:46:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNV63-0001a5-EW; Tue, 17 Dec 2024 11:46:35 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNV62-003qk0-0G;
	Tue, 17 Dec 2024 11:46:34 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNV62-004VQ6-2Q;
	Tue, 17 Dec 2024 11:46:34 +0100
Date: Tue, 17 Dec 2024 11:46:34 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"marex@denx.de" <marex@denx.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V2] soc: imx8m: Add remove function
Message-ID: <20241217104634.2fc7yo6hprhx2wnt@pengutronix.de>
References: <20241217015826.1374497-1-peng.fan@oss.nxp.com>
 <20241217082637.i2ou6bbr3tc3uvof@pengutronix.de>
 <PAXPR04MB8459A91EEC932F41E24AE04488042@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459A91EEC932F41E24AE04488042@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_024644_948980_8B74F84C 
X-CRM114-Status: GOOD (  34.74  )
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

On 24-12-17, Peng Fan wrote:
> > Subject: Re: [PATCH V2] soc: imx8m: Add remove function
> > 
> > Hi Peng,
> > 
> > thanks for you patch.
> > 
> > On 24-12-17, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Unregister the cpufreq device and soc device in remove path,
> > otherwise
> > 
> > After reconsidiering the patch approach, I think we shouldn't add a
> > .remove() function and instead should make use of the
> > devm_add_action() mechanism for the proper unregister calls.
> 
> Would you please share why devm_add_action is preferred?
> 
> Something as below?
> +static void imx8m_soc_remove(void *data)
> +{
> +       struct imx8m_soc_priv *priv = data;
> +
> +       if (priv->cpufreq_dev)
> +               platform_device_unregister(priv->cpufreq_dev);
> +
> +       soc_device_unregister(priv->soc_dev);
> +}

I would split it into two action functions due to the following reasons:
 - cleanup during the probe() if something fails afterwards
 - no need for the if(priv->cpufreq_dev) check.

> In Probe:
> +       return devm_add_action(&pdev->dev, imx8m_soc_remove, priv);

The actions should be added directly after the succeful device
registration, e.g.
 - after soc_device_register(soc_dev_attr) and
 - after platform_device_register_simple()

Regards,
   Marco

> 
> Regards,
> Peng.
> 
> > 
> > > there will be warning when do removing test:
> > > sysfs: cannot create duplicate filename '/devices/platform/imx-
> > cpufreq-dt'
> > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > > 6.13.0-rc1-next-20241204 Hardware name: NXP i.MX8MPlus EVK
> > board (DT)
> > >
> > > Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform
> > > driver")
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >
> > > V2:
> > >  Add err check when create the cpufreq platform device
> > 
> > thank you for addressing this.
> > 
> > Regards,
> >   Marco
> > 
> > >  drivers/soc/imx/soc-imx8m.c | 41
> > > +++++++++++++++++++++++++++++++------
> > >  1 file changed, 35 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-
> > imx8m.c
> > > index 8ac7658e3d52..97c8718c2aa1 100644
> > > --- a/drivers/soc/imx/soc-imx8m.c
> > > +++ b/drivers/soc/imx/soc-imx8m.c
> > > @@ -33,6 +33,11 @@ struct imx8_soc_data {
> > >  	int (*soc_revision)(u32 *socrev, u64 *socuid);  };
> > >
> > > +struct imx8m_soc_priv {
> > > +	struct soc_device *soc_dev;
> > > +	struct platform_device *cpufreq_dev; };
> > > +
> > >  #ifdef CONFIG_HAVE_ARM_SMCCC
> > >  static u32 imx8mq_soc_revision_from_atf(void)
> > >  {
> > > @@ -195,10 +200,11 @@ static __maybe_unused const struct
> > of_device_id
> > > imx8_soc_match[] = {  static int imx8m_soc_probe(struct
> > > platform_device *pdev)  {
> > >  	struct soc_device_attribute *soc_dev_attr;
> > > +	struct platform_device *cpufreq_dev;
> > >  	const struct imx8_soc_data *data;
> > >  	struct device *dev = &pdev->dev;
> > >  	const struct of_device_id *id;
> > > -	struct soc_device *soc_dev;
> > > +	struct imx8m_soc_priv *priv;
> > >  	u32 soc_rev = 0;
> > >  	u64 soc_uid = 0;
> > >  	int ret;
> > > @@ -207,6 +213,10 @@ static int imx8m_soc_probe(struct
> > platform_device *pdev)
> > >  	if (!soc_dev_attr)
> > >  		return -ENOMEM;
> > >
> > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > > +
> > >  	soc_dev_attr->family = "Freescale i.MX";
> > >
> > >  	ret = of_property_read_string(of_root, "model",
> > > &soc_dev_attr->machine); @@ -235,21 +245,40 @@ static int
> > imx8m_soc_probe(struct platform_device *pdev)
> > >  	if (!soc_dev_attr->serial_number)
> > >  		return -ENOMEM;
> > >
> > > -	soc_dev = soc_device_register(soc_dev_attr);
> > > -	if (IS_ERR(soc_dev))
> > > -		return PTR_ERR(soc_dev);
> > > +	priv->soc_dev = soc_device_register(soc_dev_attr);
> > > +	if (IS_ERR(priv->soc_dev))
> > > +		return PTR_ERR(priv->soc_dev);
> > >
> > >  	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
> > >  		soc_dev_attr->revision);
> > >
> > > -	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> > > -		platform_device_register_simple("imx-cpufreq-dt", -1,
> > NULL, 0);
> > > +	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
> > > +		cpufreq_dev = platform_device_register_simple("imx-
> > cpufreq-dt", -1, NULL, 0);
> > > +		if (!IS_ERR(cpufreq_dev))
> > > +			priv->cpufreq_dev = cpufreq_dev;
> > > +		else
> > > +			dev_err(dev, "Failed to create imx-cpufreq-
> > dev device: %ld",
> > > +				PTR_ERR(cpufreq_dev));
> > > +	}
> > > +
> > > +	platform_set_drvdata(pdev, priv);
> > >
> > >  	return 0;
> > >  }
> > >
> > > +static void imx8m_soc_remove(struct platform_device *pdev) {
> > > +	struct imx8m_soc_priv *priv = platform_get_drvdata(pdev);
> > > +
> > > +	if (priv->cpufreq_dev)
> > > +		platform_device_unregister(priv->cpufreq_dev);
> > > +
> > > +	soc_device_unregister(priv->soc_dev);
> > > +}
> > > +
> > >  static struct platform_driver imx8m_soc_driver = {
> > >  	.probe = imx8m_soc_probe,
> > > +	.remove	= imx8m_soc_remove,
> > >  	.driver = {
> > >  		.name = "imx8m-soc",
> > >  	},
> > > --
> > > 2.37.1
> > >
> > >
> > >
> 

