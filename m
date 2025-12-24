Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA2E748FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 00:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztPo4RXt9nQb3i7Qi3Fqgd6ep5YYSUZ91Za0GHbzE5o=; b=wH8AxKFC5EurHXDmMTFCbCv48T
	NKJeBqBg6Xb9umRaUXD4BfaLYUvPxZFaBlVn6J8mVE90vCBO1GxpIB2BeTXDC3rFTh461iGerkPJh
	yU45R+Qu9DpXgevavuyxNpK4WoUJsHSFXJ/W7r8Zx2f8CyzAUe2lrAOXxpCXD8/YHZusGRefrM0kw
	2evoSTPd3fOiT95jo5qVxFkldaLxM6KTQ1TXuyHW6gpfqLOaxYeeQMCZLZlMaYDOmRK1o+noP2Bo/
	zrhfEPBuW0v45qRKXegc96PAqfU6ptpvZ9H3NF1mBYXaMhmeI9gtwul0UVZSFw1jVyzjJeIFtn5fR
	pOzUi+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCXO-0000000GCyg-3siH;
	Wed, 24 Dec 2025 00:15:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCXM-0000000GCxi-1edl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 00:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C081D432EF;
	Wed, 24 Dec 2025 00:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212BFC113D0;
	Wed, 24 Dec 2025 00:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766535330;
	bh=qk+TPjCHtriryA+kZAw0qyFg2zqhGdkatoHam4RPx9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXEzg/qDGk2n/ubE7jQO6s3yHa2IOqhgBQnSWrOvRuT5/SiUoPdZdpvrLgULoPzZL
	 PeUS/kexrMEOhDEkMavDbiYX5lw4vwxxKDkTwadKPBca/pQCZNPg1bP4sLviQ6GloG
	 9gUB5DGtsLvVAml1Hhn+hnip9ug9+W1SGsjJiT8ZYGiu3Ed3p8PiPBkOj/CQDQ762Q
	 tUVwBDxCSbwFcLnRwy/Ya5iLHBaTHDs+fgTfTx+0mxwUmqbH0jtkyoKM0d0oxQmMft
	 iHNinYiNA8kEpyclEsfAiecpbwBMfmYoj3/xyaReYbgPeVLTQxnnvupRQ5vnmnX+Du
	 +clp0FFIOdV9A==
Date: Tue, 23 Dec 2025 18:15:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <ctrcrgvevo2liu7v4us4aa37pmt5bytkky2mcvacp5bhmkjl22@sfwzfkgemtyf>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-3-shenwei.wang@nxp.com>
 <3bbemd2vbsfss3sqpjpokytvvzweoqrtiqygffj5vqazqk3jyq@eobv6ruriiwb>
 <PAXPR04MB9185AF0B5225CB8DD06F774289B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185AF0B5225CB8DD06F774289B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_161532_508721_C2B1E60E 
X-CRM114-Status: GOOD (  50.00  )
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

On Tue, Dec 23, 2025 at 07:47:31PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Thursday, December 18, 2025 8:24 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> > gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-doc@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v6 2/5] remoteproc: imx_rproc: Populate devices
> > under "rpmsg" subnode
> > 
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> > 
> > 
> > On Fri, Dec 12, 2025 at 01:43:38PM -0600, Shenwei Wang wrote:
> > > Register the RPMsg channel driver and populate remote devices defined
> > > under the "rpmsg" subnode upon receiving their notification messages.
> > 
> > Please provide a proper description of what "problem" this patch solves.
> > 
> > >
> > > The following illustrates the expected DTS layout structure:
> > >
> > >       cm33: remoteproc-cm33 {
> > >               compatible = "fsl,imx8ulp-cm33";
> > >
> > >               rpmsg {
> > >                       rpmsg-io-channel {
> > >                               gpio@0 {
> > >                                       compatible = "fsl,imx-rpmsg-gpio";
> > >                                       reg = <0>;
> > 
> > Surely there needs to be some "gpio-controller" and "#gpio-cells" here?
> > Would be useful if the example is somewhat complete, to give a picture of what's
> > actually going on.
> > 
> 
> Okay. Will add those in next version.
> 
> > >                               };
> > >
> > >                               gpio@1 {
> > >                                       compatible = "fsl,imx-rpmsg-gpio";
> > >                                       reg = <1>;
> > >                               };
> > >
> > >                               ...
> > >                       };
> > >
> > >                       ...
> > >               };
> > >       };
> > >
> > > +     drvdata->rpdev = rpdev;
> > > +     auxdata[0].compatible = devm_kstrdup(dev, imx_rpdrv->compat,
> > GFP_KERNEL);
> > > +     auxdata[0].platform_data = drvdata;
> > > +     dev_set_drvdata(dev, drvdata);
> > > +
> > > +     of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> > 
> > auxiliary_bus would be a better choice, but I don't understand why you probe a
> > rpmsg_device for each "gpio channel" and then from that create a
> > platform_device.
> > 
> > Why don't you just make the rpmsg_device register the gpio controller directly?
> > 
> 
> The "GPIO channel" is just one example-there are also "PWM channel", "I2C channel", and other channels. 
> The goal is to manage all these channels under a common logic, which helps avoid redundant code and keeps 
> the implementation consistent.
> 

If you make rpmsg_drivers for each of these channels/functions, then all
the common code should already be in the rpmsg framework.

What are you missing there?

> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +     rp_driver->rpdrv.drv.name = name;
> > > +     rp_driver->rpdrv.id_table = rpdev_id;
> > > +     rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> > > +     rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> > > +     rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> > > +     rp_driver->driver_data = driver_data;
> > > +     rp_driver->compat = compat;
> > > +
> > > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > 
> > This would then also imply that it's the gpio driver that registers the
> > rpmsg_driver.
> > 
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int rproc_of_rpmsg_node_init(struct platform_device *pdev) {
> > > +     struct device *dev = &pdev->dev;
> > > +     const char *compat;
> > > +     int ret;
> > > +
> > > +     struct device_node *np __free(device_node) = of_get_child_by_name(dev-
> > >of_node, "rpmsg");
> > > +     if (!np)
> > > +             return 0;
> > > +
> > > +     for_each_child_of_node_scoped(np, child) {
> > > +             compat = imx_of_rpmsg_is_in_map(child->name);
> > > +             if (!compat)
> > > +                     ret = of_platform_default_populate(child, NULL,
> > > + dev);
> > 
> > So if you don't recognize the child device node name you just register
> > platform_devices for each of the children?
> > 
> 
> Yes. That would register platform_devices without the platform_data.
> 
> > > +             else
> > > +                     ret = imx_of_rpmsg_register_rpdriver(child, dev,
> > > + child->name, compat);
> > > +
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static int imx_rproc_probe(struct platform_device *pdev)  {
> > >       struct device *dev = &pdev->dev; @@ -1114,6 +1253,10 @@ static
> > > int imx_rproc_probe(struct platform_device *pdev)
> > >               goto err_put_pm;
> > >       }
> > >
> > > +     ret = rproc_of_rpmsg_node_init(pdev);
> > > +     if (ret < 0)
> > > +             dev_info(dev, "populating 'rpmsg' node failed\n");
> > > +
> > >       return 0;
> > >
> > >  err_put_pm:
> > > diff --git a/include/linux/rpmsg/rpdev_info.h
> > > b/include/linux/rpmsg/rpdev_info.h
> > > new file mode 100644
> > > index 000000000000..13e020cd028b
> > > --- /dev/null
> > > +++ b/include/linux/rpmsg/rpdev_info.h
> > > @@ -0,0 +1,33 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/* Copyright 2025 NXP */
> > > +
> > > +/*
> > > + * @file linux/rpdev_info.h
> > > + *
> > > + * @brief Global header file for RPDEV Info
> > > + *
> > > + * @ingroup RPMSG
> > > + */
> > > +#ifndef __LINUX_RPDEV_INFO_H__
> > > +#define __LINUX_RPDEV_INFO_H__
> > > +
> > > +#define MAX_DEV_PER_CHANNEL    10
> > > +
> > > +/**
> > > + * rpdev_platform_info - store the platform information of rpdev
> > > + * @rproc_name: the name of the remote proc.
> > > + * @rpdev: rpmsg channel device
> > > + * @device_node: pointer to the device node of the rpdev.
> > > + * @rx_callback: rx callback handler of the rpdev.
> > > + * @channel_devices: an array of the devices related to the rpdev.
> > > + */
> > > +struct rpdev_platform_info {
> > 
> > I don't understand what this structure represents. Why is this glue between the
> > rpmsg_device and a made up platform_device needed?
> > 
> 
> The purpose is to have a shared array that can be accessed by all devices within 
> the same channel.
> 

What does this mean? How are multiple functions multiplexed over a
single rpmsg channel/endpoint?

Please provide a concrete description of how a device with some gpios
and PWMs would actually look in this model.

> > > +     const char *rproc_name;
> > 
> > You don't need this, because you can rproc_get_by_child(&self) and then get the
> > remoteproc name from that.
> > 
> 
> Good to know. Will try it in the next version.
> 
> > > +     struct rpmsg_device *rpdev;
> > > +     struct device_node *channel_node;
> > > +     int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> > > +                        int len, void *priv, u32 src);
> > > +     void *channel_devices[MAX_DEV_PER_CHANNEL];
> > 
> > Why 10? What does it mean?
> > 
> 
> This is based on practical experience. For example, on the i.MX platform, we typically don't have 
> more than eight same devices on the remote system.
> 
> > I think this becomes the list of the 10 grandchildren of the remoteproc (per child
> > node). So what happens if those matches against two different drivers, what will
> > rx_callback point to?
> > 
> 
> This is the limitation. That's why I used the map to populate the known child device for one specific channel.
> 

So for each rpdev_platform_info there can only be one type of client
driver. Where is this limitation defined? What happens if I put a PWM
and a GPIO controller under my rpmsg-io-channel?

Regards,
Bjorn

> Thanks,
> Shenwei
> 
> > > +};
> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > > +#endif /* __LINUX_RPDEV_INFO_H__ */
> > > --
> > > 2.43.0
> > >

