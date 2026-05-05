Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3146CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2sQjPwQjVogPKORjYm3DBEszMCtQIEFuNya/PKLwFo=; b=RbrS1nYX9XQreYdnT/C8uaYmLj
	0jFkHvtsuyIxQ5rtUOhUlHeBjIUfo+lpaJu+7pTWHh+BjZMVtfVQJLL+hrviQHRu5oKzClIgkxYhA
	SOquc/2Mae9woMM1vGGXnGW35PVVOJ4FACZJmyiaQDkH4+e+qxy7v/dwBbdI+UEXeetvi7fNO1+z2
	7ISotUQ4E0A/YfGtkRF36RBSXWIyPyabimLm4Pv+b84su2oZ5LjHlfnaYZ45l3h/AZ35YxyiD49h2
	Ffx14p2xvf/hqsRxxj96gVgXw0AS9HRZjBq9hY54Sqe1OBH0Zsl4PZT2YNJgwGrrc4f62xjowFveR
	3XPmj2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN1v-0000000HVDN-1iLX;
	Tue, 05 May 2026 21:10:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN1u-0000000HVD8-1qag;
	Tue, 05 May 2026 21:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 766786024D;
	Tue,  5 May 2026 21:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C20C2BCB4;
	Tue,  5 May 2026 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778015409;
	bh=YJRd4B8dBI7NnuwfxeAAKCP/9sHlFCzWsZu+lnLLO7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIvLSBvl1Cpo4rpWBWXR85ZTXl2vG6EzcWbfoLxY7dK0d4JlrAtBNLJr3Ocuy7W+P
	 OUu/mHrbIYpCgGiCHL9T0/v1sCpPvGHtqudcd9d1LHTAF5/db9dL6nv/sY5hT+BgnT
	 2d+QtWiXpqrejubxHb0E+BDSgQJeLVuXeOUisTeqYdeAtxIA4VP6942dl1Fqj0wmzB
	 KqxeJwZsQX4v9oGzBvEAQFRsl8LBKZ2iytOeCQJ3jBov4AnIQ/nzy9MYeB2SO/h+S0
	 cY4fBa9rDHQ2PyWJkwHLDm3s4P66z1Z6ePCI8MXAdt9AfNllldpwDeDs52UPBt7zwo
	 Hn7WmEtXAhllg==
Date: Tue, 5 May 2026 16:10:06 -0500
From: Rob Herring <robh@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source
 definitions
Message-ID: <20260505211006.GA3875657-robh@kernel.org>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
 <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
 <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
 <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
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

On Thu, Apr 30, 2026 at 12:12:55AM +0700, Bui Duc Phuc wrote:
> Hi,
> 
> > Yes. And the ABI. You cannot have ABI which has an incompatible
> > implementation. IOW, when implementation contradicts the ABI, something
> > is wrong.
> >
> > The question of course if read_bool() is here incompatible. From the
> > actual code point of view, it is compatible, but how it is documented
> > and how it is intended to use: it is not compatible.
> >
> > Also if future schema-kernel-ABI checker gets implemented, the tool
> > might report here a mistake for that reason. read_bool() means property
> > is bool.

It is doubtful such a tool would do per binding type checking given 
types are global and we've avoided making types per binding so far.

> >
> > > If the hardware supports wakeup functionality,
> > > referencing the core schema is sufficient. Hardware description should
> > > not be constrained by the current driver implementation
> > > ( e.g. the use of device_property_read_bool() ).
> > > Bindings should remain stable and generic, while drivers can evolve over time.
> > So you claim that bindings can define property as integer, but drivers
> > can evolve and for example read it as string?
> 
> I see your point regarding the ABI semantics and the intended use of
> read_bool().
> My understanding is that the I2C core currently uses of_property_read_bool()
> for wakeup-source as a presence check, even though it has no way to
> determine in advance whether a specific device will define the property as
> a boolean or a phandle-array in its DTS.

If this was a problem, then it probably would have been fixed already 
because it generates a warning. An I2C device probably isn't all that 
coupled to SoC power states, so boolean is probably always going to be 
used here. But maybe not.

If we do any cleanup here, I think that should have exactly 1 location 
that reads this property instead of 77. Perhaps the driver core can just 
handle everything and drivers don't have to deal with it.

> >From a behavioral point of view, switching to of_property_present() would
> not change anything, but it would better reflect that the driver only checks
> for the existence of the property without assuming its type.
> 
> If the expectation is to strictly follow the binding types, then
> of_property_present()
> seems more appropriate here.
> I can prepare a patch accordingly and send it to the I2C maintainers for
> review and feedback.
> 
> > >
> > > Re-defining the type locally duplicates the core definition. If the
> > > core schema evolves,
> >
> > There is no re-definition here. This is choice of subset of types.
> 
> The flow is: core schema → YAML binding (ABI) → DTS (actual usage).
> >From a high-level perspective, the binding may appear to redefine the
> property type by narrowing its scope, while the DTS selects one valid
> representation from the permitted set.
> 
> > Where is Rob's suggestion to do such cleanups for EXISTING code? I only
> > see that new code should come like that.
> >
> > Anyway, your commit msg is for me incorrect because it misses all this
> > points I made. Whether the schema code is correct, I'll defer to Rob,
> > although I still claim the same I claimed before at v2 or v3 of your
> > previous work - this should have defined type.
> 
> You are right that Rob did not explicitly request cleanups to existing code.
> I included them to improve consistency while working on the new parts,
> but for now, I will stop modifying the existing code and wait for
> Rob's feedback.
> Since there are differing perspectives, I would appreciate a consensus
> on the preferred
> approach before I send out the next version to avoid redundant rework.

It's really outside the scope of a device binding what is used for 
wakeup-source as that depends on the platform. So I think just 
'wakeup-source: true' in device bindings is fine. I don't think we have 
to change all the existing cases either, but the patches are already 
written so I don't have an issue applying them.

Rob

