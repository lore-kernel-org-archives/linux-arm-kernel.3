Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0941CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAtPapBFiQNF5+T1jlgE+0TU0U2f21oWpo20rWUR63I=; b=iIE+c+OiQ0mh0TdYaXeXBw97B5
	xhKsaKhG0bHnwDIFaPkAFy8fe/hIr2emB+lacbAXT+Qp5dHH6hL18qzA/8jJ2a26NSJpgSpfdcICL
	p9YDvx1fREeC/8im9o33cHhGsHHu+dex9qlSYK8yhsbENted5aIOPnInNOd8g6IYr6iaK/3lX3BRU
	+lEu6+fqZ8cB2G2lblYo9XWEhYaLXEqwOkovbVMGk2v5A3ubFYim+lc5q2wOSWyW7MyeY8v8zrdwV
	fPxKesnLh61Fp1hIA01FmczuBoKmQZe5gLx1bQr1tRL4XRobJPaPtEP/oPCzCtZqOeIR08v7rn23o
	BPxvzC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNQ-00000001Yy6-0kkt;
	Tue, 02 Sep 2025 19:09:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQEj-0000000HMDB-4Bgc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:35:47 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 07E00C77;
	Tue,  2 Sep 2025 14:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816477;
	bh=rgeAkaerMuo7pPYf7CTpR6admWuQ1J9uhjoEpdbvc5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt0/hwhJAsbh9xgjvpHX8ZlaNZWIqk8ZIYHl74D/RpN1aB5NiuYJ4sbekghmfQRpw
	 +Fd9A/vmmT2nwwMUYmeRtG4iUHsePTSDC6VPwjWx/jvbSLPcmsnu1qiKBY/+y+WTvx
	 YvS/mGTYyrZxv2mBisLcvTFnx0vJHCWg7VeZxaaQ=
Date: Tue, 2 Sep 2025 14:35:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250902123524.GK13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_053546_176009_361400E3 
X-CRM114-Status: GOOD (  28.05  )
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

On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 10:35, Laurent Pinchart wrote:
> >>>>          compatible:
> >>>>            contains:
> >>>>              enum:
> >>>> -              - fsl,imx8qxp-mipi-csi2
> >>>> +              - fsl,imx8ulp-mipi-csi2
> >>>> +    then:
> >>>> +      properties:
> >>>> +        reg:
> >>>> +          minItems: 2
> >>>> +        resets:
> >>>> +          minItems: 2
> >>>> +          maxItems: 2
> >>>> +        clocks:
> >>>> +          minItems: 4
> >>>> +        clock-names:
> >>>> +          minItems: 4
> >>>
> >>> But according to this, the ULP version requires more clocks than the QXP
> >>> version.
> >>
> >> If only clock number difference, generally, it is still compatible and can
> >> be fallback, especialy driver use devm_bulk_clk_get_all().
> > 
> > That's a driver-specific implementation decision, so I don't think it
> > should be taken into account to decide on compatibility.
> 
> The clock inputs do not restrict compatibility. If Linux can use
> fallback to bind and operate properly, then it's a strong indication
> devices are compatible.
> 
> Imagine exactly the same registers, so same programming interface, but
> one device takes one more clock which just needs to be enabled through
> its lifetime. Such devices are fully compatible, even though clock
> inputs differ.

That's only the case if someone enables the clock, isn't it ? From a DT
binding point of view, how can we know that the extra clock will be
enabled by a component separate from the driver (in this case by the
fact that the devm_bulk_clk_get_all() function gets all clocks) ?

> I also wanted to express exactly that case on my slides from OSSE -
> slide 28:
> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro

Quoting that slide, you wrote

"Two devices are compatible when the new device works with Linux drivers
bound via fallback (old) compatible".

That is clearly the case here for the existing *Linux* driver. But what
if the driver called devm_bulkd_clk_get() with a device-specific list of
clocks ? Or what if the same DT bindings are used on an OS that has no
clk_get_all() equivalent ? This is my concern with declaring those two
devices as compatible: they may be from the point of view of the current
implementation of the corresponding Linux kernel driver, but DT bindings
are not Linux-specific.

Or do DT bindings assume that drivers have to always enable all clocks
declared in DT, even if they don't know what those clocks are ? That
seems error-prone, in quite a few cases drivers need to handle separate
clocks in a device-specific way, with for instance a particular
ordering, preventing them from using devm_bulk_clk_get_all(). If all
drivers are required to manage all clocks declared in DT, this would get
messy quite quickly.

> (although I focused on reversed case when devices are not compatible,
> because that is decisive case).

-- 
Regards,

Laurent Pinchart

