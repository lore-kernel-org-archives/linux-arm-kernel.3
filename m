Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1bFnNVPRoPXRe2lbSAPjFZMOBdQSzQO9/nUgJAix0k=; b=NxGE3U8LHhMyIfzggV3aGN2DUy
	1f1HdpYPWevDm2oLNgmILBn47p7MCm7aaf2/T1w9GHfAVXda+Vw6W4zqI5Yup7Otqdx4U7JrHUrP1
	/a0zkjW1V/A/JOFSt6VLqQxsjCQVYm7fPv5ZjrHeRMz7Fzd5A5FcgbntAiumC1UFBi3RNnRSP9kVj
	Iv8Y78LivSV3n5dS92baloVqKLBYJcjW4v3VKnOB4yix7ECePnnM87lCB1TdliGsEZAyp8K2mvlli
	GkEtb7zEsXGAid8J5wnpT3tG7eahP7T4xqdwpdJNoIKhZ1xnABScpemFvwSa98mfUg/sjS1ZzJkra
	tnA+B2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQV-00000008E2o-3qLu;
	Thu, 04 Sep 2025 02:10:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt3Y-00000007RqW-3LrU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 19:22:10 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A2428CB;
	Wed,  3 Sep 2025 21:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756927256;
	bh=1XkDG//kNC9pcHdUsnMMluOmThV+nzlV6FDY6msTIcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOIgM5jzXL81DqRvttrGC0d7U5b7m1zy0HRlJ4Ok+6JHs0REcK/P5dqWi0U5gUceg
	 NdWsv15iOcIUlISDchNKHNGr/bqD0iTvWm49or2gWxfqz8GOuu+YU6B+5bjebXJdMU
	 BbgT9Lmh49OgVDVnE5/qw5rnrYuW82jfiHCWMRWI=
Date: Wed, 3 Sep 2025 21:21:43 +0200
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
Message-ID: <20250903192142.GA10637@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
 <20250902123524.GK13448@pendragon.ideasonboard.com>
 <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_122208_975990_1669BC9B 
X-CRM114-Status: GOOD (  45.34  )
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

On Tue, Sep 02, 2025 at 05:53:39PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 14:35, Laurent Pinchart wrote:
> > On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> >> On 02/09/2025 10:35, Laurent Pinchart wrote:
> >>>>>>          compatible:
> >>>>>>            contains:
> >>>>>>              enum:
> >>>>>> -              - fsl,imx8qxp-mipi-csi2
> >>>>>> +              - fsl,imx8ulp-mipi-csi2
> >>>>>> +    then:
> >>>>>> +      properties:
> >>>>>> +        reg:
> >>>>>> +          minItems: 2
> >>>>>> +        resets:
> >>>>>> +          minItems: 2
> >>>>>> +          maxItems: 2
> >>>>>> +        clocks:
> >>>>>> +          minItems: 4
> >>>>>> +        clock-names:
> >>>>>> +          minItems: 4
> >>>>>
> >>>>> But according to this, the ULP version requires more clocks than the QXP
> >>>>> version.
> >>>>
> >>>> If only clock number difference, generally, it is still compatible and can
> >>>> be fallback, especialy driver use devm_bulk_clk_get_all().
> >>>
> >>> That's a driver-specific implementation decision, so I don't think it
> >>> should be taken into account to decide on compatibility.
> >>
> >> The clock inputs do not restrict compatibility. If Linux can use
> >> fallback to bind and operate properly, then it's a strong indication
> >> devices are compatible.
> >>
> >> Imagine exactly the same registers, so same programming interface, but
> >> one device takes one more clock which just needs to be enabled through
> >> its lifetime. Such devices are fully compatible, even though clock
> >> inputs differ.
> > 
> > That's only the case if someone enables the clock, isn't it ? From a DT
> > binding point of view, how can we know that the extra clock will be
> 
> We talk about software using the binding in this particular case. Can
> the software use fallback? Yes, it can.

The Linux kernel driver, in its current implementation, can, yes. No
disagreement about that.

> > enabled by a component separate from the driver (in this case by the
> > fact that the devm_bulk_clk_get_all() function gets all clocks) ?
> 
> If you go that way, only 100% identical devices are compatible.
> 
> >> I also wanted to express exactly that case on my slides from OSSE -
> >> slide 28:
> >> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro
> > 
> > Quoting that slide, you wrote
> > 
> > "Two devices are compatible when the new device works with Linux drivers
> > bound via fallback (old) compatible".
> > 
> > That is clearly the case here for the existing *Linux* driver. But what
> > if the driver called devm_bulkd_clk_get() with a device-specific list of
> > clocks ? Or what if the same DT bindings are used on an OS that has no
> > clk_get_all() equivalent ? This is my concern with declaring those two
> > devices as compatible: they may be from the point of view of the current
> > implementation of the corresponding Linux kernel driver, but DT bindings
> > are not Linux-specific.
> 
> It seems you think of compatibility as new device is compatible with old
> kernel, e.g. one not requesting that clock. We don't talk about such case.

No no, I'm considering compatibility in the same sense as you. Sorry if
that wasn't clear.

> > Or do DT bindings assume that drivers have to always enable all clocks
> > declared in DT, even if they don't know what those clocks are ? That
> > seems error-prone, in quite a few cases drivers need to handle separate
> > clocks in a device-specific way, with for instance a particular
> > ordering, preventing them from using devm_bulk_clk_get_all(). If all
> > drivers are required to manage all clocks declared in DT, this would get
> > messy quite quickly.
> 
> I don't really want to dive into such specifics, because it is
> impossible to create a generic rule of out.

We're on the same page there :-)

Compatible strings model compatibility with software. As DT bindings are
not OS-specific, they should be designed based on the concept of a
driver, and not on a particular driver implementation. As a conceptual
generic driver can't be precisely defined, we will always have edge
cases.

In this specific case, I think that devm_bulk_clk_get_all() is too much
of a Linux-specific concept to consider that devices with different
clocks are compatible. Even considering Linux only, a driver that needs
to handle at least one of the clocks in a particular way (for instance
to guarantee a device-specific clock sequencing requirement, or to
retrieve or set the frequency of a particular clock) will need to get
clocks by their names, making fully generic handling of all clocks not
possible. For such drivers, difference in clocks will preclude
considering two devices as compatible.

As this is somewhat of an edge case someone will need to make a
decision, and I won't fight tooth and nail over it.

> We decide here about
> programming interface mostly. Can Linux use the one from fallback-device
> to properly operate the new one? Can the same driver bind to fallback
> and operate the new device?
> 
> If you enable clock by clock for whatever reason, e.g. very specific
> programming power up sequence, then answer would be: no, Linux cannot
> use fallback because handling clocks differ.

-- 
Regards,

Laurent Pinchart

