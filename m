Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB144CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOu4ZBZS3ncsEm35/gdQYd/WovKwaZKmk0wWBfIDLwg=; b=U3mCqVrz1vUse37yWqUiZwCgRE
	sNUO8RK5cYXO5A7OAj0Rtdc18UWIw4Lvh174g8ZEPEP0qNVSeaIaI6jDvg09J4yVMeIIkzE2WTk7T
	J6oPc3KjH+wlYiAlqIJSj4ovaYQtiZRD3k9M2Ny/eww2abQLrdsLacLMR073Am9lNo4oRDxqsRNi/
	CLBHvmqBol/Tz/nk14LtzDgDHH1tNzgcmPsmmIJ48KV9J5KjAWtWUn1hD7bJT7Swxz7443o7KSkJ4
	S+224nZItwxrJbGN9IAtlwXxS/pIKxea9/MPKYUE5e0lpdPjk1/xqDu2NO91vekdOTgBHD+f1/APU
	Sl/P9FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydgb-00000009J8C-22cZ;
	Tue, 16 Sep 2025 21:58:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydgY-00000009J6o-2xzJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B72B344971;
	Tue, 16 Sep 2025 21:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F4EC4CEEB;
	Tue, 16 Sep 2025 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758059881;
	bh=CcqKmNwdNBd1QSYXFhvxN7W/9Wyt7eWllgzAddhdYy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ff0iOsgWeFSHcTeP+dGPIZE+see6W5Xk0yB3GvGmc2vZjFAHD+0cOJDQjOvK7sBPT
	 KidWd8Ff7jxARe3IMVqzkSz1iZ8a/BqzboSiQGs+7nISP4hKhA7i1++VqObXtd8S63
	 n5HxUb/eABzGIZm1Uo3rC6nb+zzwY1CZyZWCGVRAouRYb3oLxoHOz9qKnw6ZVVJXb6
	 34/OB/25ornZ7DHWW1lBfUrPvT1gn1dUfECMj1n2njc7fOxn0b3+/oh+91kUV1ds7D
	 CHRjm6v50j66E5xNZVGgVzlQGtDknDj64j4kxeXCIRcclWJ1kjn2Ub7ACdvrYftLD3
	 5Cvtnk4Ki9cSg==
Date: Tue, 16 Sep 2025 16:57:56 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <20250916215756.GA4190660-robh@kernel.org>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
 <20250902123524.GK13448@pendragon.ideasonboard.com>
 <647fdf8a-835b-44d1-b0b8-a3d253a14787@kernel.org>
 <20250903192142.GA10637@pendragon.ideasonboard.com>
 <aLmnDASizRALzVMM@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLmnDASizRALzVMM@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_145802_792483_E3CD8FC2 
X-CRM114-Status: GOOD (  61.21  )
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

On Thu, Sep 04, 2025 at 10:49:48AM -0400, Frank Li wrote:
> On Wed, Sep 03, 2025 at 09:21:43PM +0200, Laurent Pinchart wrote:
> > On Tue, Sep 02, 2025 at 05:53:39PM +0200, Krzysztof Kozlowski wrote:
> > > On 02/09/2025 14:35, Laurent Pinchart wrote:
> > > > On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> > > >> On 02/09/2025 10:35, Laurent Pinchart wrote:
> > > >>>>>>          compatible:
> > > >>>>>>            contains:
> > > >>>>>>              enum:
> > > >>>>>> -              - fsl,imx8qxp-mipi-csi2
> > > >>>>>> +              - fsl,imx8ulp-mipi-csi2
> > > >>>>>> +    then:
> > > >>>>>> +      properties:
> > > >>>>>> +        reg:
> > > >>>>>> +          minItems: 2
> > > >>>>>> +        resets:
> > > >>>>>> +          minItems: 2
> > > >>>>>> +          maxItems: 2
> > > >>>>>> +        clocks:
> > > >>>>>> +          minItems: 4
> > > >>>>>> +        clock-names:
> > > >>>>>> +          minItems: 4
> > > >>>>>
> > > >>>>> But according to this, the ULP version requires more clocks than the QXP
> > > >>>>> version.
> > > >>>>
> > > >>>> If only clock number difference, generally, it is still compatible and can
> > > >>>> be fallback, especialy driver use devm_bulk_clk_get_all().
> > > >>>
> > > >>> That's a driver-specific implementation decision, so I don't think it
> > > >>> should be taken into account to decide on compatibility.
> > > >>
> > > >> The clock inputs do not restrict compatibility. If Linux can use
> > > >> fallback to bind and operate properly, then it's a strong indication
> > > >> devices are compatible.
> > > >>
> > > >> Imagine exactly the same registers, so same programming interface, but
> > > >> one device takes one more clock which just needs to be enabled through
> > > >> its lifetime. Such devices are fully compatible, even though clock
> > > >> inputs differ.
> > > >
> > > > That's only the case if someone enables the clock, isn't it ? From a DT
> > > > binding point of view, how can we know that the extra clock will be
> > >
> > > We talk about software using the binding in this particular case. Can
> > > the software use fallback? Yes, it can.
> >
> > The Linux kernel driver, in its current implementation, can, yes. No
> > disagreement about that.
> >
> > > > enabled by a component separate from the driver (in this case by the
> > > > fact that the devm_bulk_clk_get_all() function gets all clocks) ?
> > >
> > > If you go that way, only 100% identical devices are compatible.
> > >
> > > >> I also wanted to express exactly that case on my slides from OSSE -
> > > >> slide 28:
> > > >> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro
> > > >
> > > > Quoting that slide, you wrote
> > > >
> > > > "Two devices are compatible when the new device works with Linux drivers
> > > > bound via fallback (old) compatible".
> > > >
> > > > That is clearly the case here for the existing *Linux* driver. But what
> > > > if the driver called devm_bulkd_clk_get() with a device-specific list of
> > > > clocks ? Or what if the same DT bindings are used on an OS that has no
> > > > clk_get_all() equivalent ? This is my concern with declaring those two
> > > > devices as compatible: they may be from the point of view of the current
> > > > implementation of the corresponding Linux kernel driver, but DT bindings
> > > > are not Linux-specific.
> > >
> > > It seems you think of compatibility as new device is compatible with old
> > > kernel, e.g. one not requesting that clock. We don't talk about such case.
> >
> > No no, I'm considering compatibility in the same sense as you. Sorry if
> > that wasn't clear.
> >
> > > > Or do DT bindings assume that drivers have to always enable all clocks
> > > > declared in DT, even if they don't know what those clocks are ? That
> > > > seems error-prone, in quite a few cases drivers need to handle separate
> > > > clocks in a device-specific way, with for instance a particular
> > > > ordering, preventing them from using devm_bulk_clk_get_all(). If all
> > > > drivers are required to manage all clocks declared in DT, this would get
> > > > messy quite quickly.
> > >
> > > I don't really want to dive into such specifics, because it is
> > > impossible to create a generic rule of out.
> >
> > We're on the same page there :-)
> >
> > Compatible strings model compatibility with software. As DT bindings are
> > not OS-specific, they should be designed based on the concept of a
> > driver, and not on a particular driver implementation. As a conceptual
> > generic driver can't be precisely defined, we will always have edge
> > cases.
> >
> > In this specific case, I think that devm_bulk_clk_get_all() is too much
> > of a Linux-specific concept to consider that devices with different
> > clocks are compatible. Even considering Linux only, a driver that needs
> > to handle at least one of the clocks in a particular way (for instance
> > to guarantee a device-specific clock sequencing requirement, or to
> > retrieve or set the frequency of a particular clock) will need to get
> > clocks by their names, making fully generic handling of all clocks not
> > possible.
> 
> New added clocks is simple clock, needn't specific handler. Only need
> enable at runtime resume.
> 
> Back compatible is hard to decouple with driver's implement 100%.
> 
> Compatible string C1 have clock A, B, C
> Compatible string C2 have clock A, B, C, D, E, F
> 
> A, B, C is common for both C1 and C2, which need special handle.
> D, E, F is simple enable at probe or runtime resume.

I think it would only be backwards compatible if clocks D, E, and F were 
entirely optional and could be left unmanaged.

> 
> Can C1 be back compatible C2 (assume all the same except only D, E, F
> clock difference)? It is always depend on drivers' implemment.
> 
> Add back compatible have NOT bad impact for drivers and bindings. Although
> back compatible "C1", "C2", driver still use can use C1 firstly to do
> special process.
> 
> 
> > For such drivers, difference in clocks will preclude
> > considering two devices as compatible.
> >
> > As this is somewhat of an edge case someone will need to make a
> > decision, and I won't fight tooth and nail over it.
> 
> Agree. Need a guide line. My opinion is
> 
> back compatible if there are no new drvdata (pltdata) in drivers.
> Needn't back compatible if need add new item in drvdata(pltdata) in drivers.

That's a good indication, but not 100%.

If the chip overall needs kernel changes anyways, then backwards 
compatibility for 1 block doesn't really matter so much other than 1 
less patch. 

Rob

