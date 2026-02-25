Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913ADFD45E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr5lgA/rRHoUdFp55V1RyjGHKoc2R5nEKfY16eIKNcU=; b=m1LC1e9GwtwchxH26doT4y7Ncx
	und+Vfe1srr4+srGFO1hW9b2FWP18aDPwqM8sum9Wem3BhfDIILeclrS+0FzsuJry/97b3ppPmjmH
	GvNBEh3pT6M/+nzZsza2DjaE68GdqfBnQFGLDsn9k0vDqLPEKkviFHioyJ20Rt8Llh0Cirp1ccBcY
	GqF75ast5wtdnp18kRKtRM4CeYbeJp8Fjlavzo3TjvwhYOnOFnACJPGVHbD2q08+/6uW1oJNz5pPV
	xIeeYJ4VBv4yn9AB028tzI8Rzt9Ct9YHIH+JwHcIYpgZluDP2wsg8VQAIYGnEr3j1nBztkApeLaug
	2yDQQiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKnm-00000004o68-1OOH;
	Wed, 25 Feb 2026 19:44:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKnk-00000004o62-34sp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C387D60053;
	Wed, 25 Feb 2026 19:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC52C116D0;
	Wed, 25 Feb 2026 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048643;
	bh=gULMDKpUK/FsthYotcBl7chnm4qllNzSnegyiTsqh+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFeTZ1qYVM9zvwMEF9fTAoDLFyfPAk+eFT63ompAkDWfg0ihwPI7V4TtxQiai7ZTS
	 TUCxxiUqzi7GqRMrlGd5uqJKJl3zTs+Pp6c+M0vcRYw5QpMhnRstmFAkL395ie6LsT
	 nsgBrPn2clE5BTM5e9WW6Og6t7vD5oYcEk8+3VbEhgAry+/K4xQYrqXYi5zHhs1geb
	 g/BWPMdalCV1Airi7bcoe5pvKI64LCS2BR8GK5o9fTiQcbMkm8D4DBoJNp1IRAx3oM
	 UhqMBKBHSaIBj+WLxCIqyk8wZlxtPG1PEZiWlust+4DdTphiZ+5gVAt+w4fh5ij8bP
	 IKwfJA+52EEKA==
Date: Wed, 25 Feb 2026 13:43:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <2b72kkgwe5hio4uwrxj5oi72llkxhx7egw442fugq6unv7unah@5bfve7k3mvky>
References: <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
 <PAXPR04MB9185BB6443B9E1E407F409D68974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ndozoc6qdrpv3xuktumsah56im5rbtg6iwerq3xi2xkcuyewpx@szswqvojleg3>
 <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB917652D63DB090D22129D3D78975A@AS8PR04MB9176.eurprd04.prod.outlook.com>
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

On Wed, Feb 25, 2026 at 05:54:00PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Wednesday, February 25, 2026 9:53 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> > imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > On Tue, Feb 24, 2026 at 10:43:06PM +0000, Shenwei Wang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Tuesday, February 24, 2026 4:15 PM
> > > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>; Bjorn Andersson
> > > > <andersson@kernel.org>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; Linus Walleij <linusw@kernel.org>;
> > > > Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > > > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > > > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank Li
> > > > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah
> > > > Khan <skhan@linuxfoundation.org>; linux- gpio@vger.kernel.org;
> > > > linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > > > dl-linux-imx <linux- imx@nxp.com>; Bartosz Golaszewski
> > > > <brgl@bgdev.pl>
> > > > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg
> > > > GPIO driver
> > > > > Please explain how you would design your generic rpmsg-gpio driver
> > > > > which is derived From gpio-virtio?
> > > >
> > > > We have already seen the virtio commands are pretty much identical
> > > > to what i suggested.
> > > >
> > > > You could just replace virtqueue_add_sgs() with rpmsg_sendto() and
> > > > reimplement
> > > > virtio_gpio_request_vq() to be the callback registered with
> > rpmsg_create_ept().
> > > > The rest of basic GPIO handling should not need any changes at all.
> > > >
> > >
> > > Creating endpoints and calling rpmsg_sendto() is only a small part of
> > > the picture. You also need to manage the service announcement from the
> > > remote side and handle asynchronous notification messages. That entire
> > > flow is already implemented in the existing virtio_rpmsg_bus driver.
> > > Re‑implementing those pieces just to mimic gpio‑virtio over RPMSG would
> > essentially mean reinventing the wheel without any real benefit.
> > >
> > 
> > I can absolutely see a benefit to this, there are multiple different rpmsg backends
> > supported in Linux, so a gpio-rpmsg driver could be used by any one of them.
> > 
> > I don't see this to be a case of "reinventing the wheel". Instead we copy what
> > looks to be a very functional wheel and make it fit rpmsg.
> > This will result in some "duplication", but rpmsg already provide the life cycle
> > management and has a clean send/callback interface, so there shouldn't be any
> > inventing...
> > 
> 
> Interesting — could you walk me through how you’d structure the driver with the new 
> proposal? I’d like to see how you would layer it conceptually.
> 
> The current RPMSG solution:
> 
>      On Remoteprc                      On Linux
> GPIOs -> RPMSG -> VIRTIO == VIRTIO -> RPMSG -> GPIO-RPMSG drivers
> 
> The VIRTIO solution:
> 
>      On Remoteprc                     On Linux
>           GPIO -> VIRTIO == VIRTIO -> GPIO-VIRTIO driver
> 
> Your proposal:
> 
>      On Remoteprc                     On Linux
> GPIOs -> RPMSG -> VIRTIO == VIRTIO -> ???

What I'm suggesting is the following:

GPIOs -> RPMSG -> VIRTIO == VIRTIO -> RPMSG -> GPIO-RPMSG
       ^                                    ^
       \-----+------------------------------/
             |      
             |
With this interface on being directly derived from the existing protocol
(and likely the implementation as well) using gpio-virtio.

You can have multiple "GPIOs" (presumably a "bank" each) instances and
that will be reflected in having multiple "GPIO-RPMSG" instances.

I haven't made any attempts at implementing this, but it looks very
similar to gpio-virtio in concept and it looks very similar to the
exiting RPMSG tty in the sense of being a generic implementation.

To reach something functional on the Linux side it seems to be a matter
of taking the gpio-virtio driver, register a rpmsg_driver instead,
change _virtio_gpio_req() to use rpmsg_send(), and perform the actions
of virtio_gpio_event_vq() in the rpmsg_driver callback function.

Regards,
Bjorn

> 
> Thanks,
> Shenwei
> 
> > Similarly, I'm guessing that there's a firmware-side implementation of virtio-gpio
> > in Zephyr, it should be straightforward to transplant this to the rpmsg interface.
> > 
> > Regards,
> > Bjorn
> > 
> > > Thanks,
> > > Shenwei
> > >
> > > > Interrupt support does however need some changes. The
> > > > virtio_gpio_request_vq() replacement would need to see if the
> > > > received message indicates an interrupt and call the equivalent of
> > > > virtio_gpio_event_vq(), since rpmsg does not have a separate mechanism to
> > deliver interrupts, unlike rpmsg.
> > > >
> > > > At a guess, 90% of the code would stay the same?
> > > >
> > > >    Andrew

