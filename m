Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510BAD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47Oi92m+jF3e9mwd+fo0tBe+IYA4+obAYaYhdQgU5yc=; b=qHxWhcL1uuQlqzFfK8AwbEcHKx
	S7fak6T93c1PopC8Axp50pHQDvdm8gEz5UYd5zyhXRYLY9+AtVPXDPO3Ks5f8Cu8LgC2jK17IPP8w
	LUs+1fk0xygWJJb1jHp8JplFuJEjH+bTbcqyTeMbpL8gACgM61e03ojhrQ2Oiad2pQ6Z07gXKKXua
	mXXkvDM5wrIoVFlOuZVQo/7RCWJ6hsigWOYpv+5/tRjQs5giJcu0UzGmB6PJrZG1FTI8/x6bX91lE
	OqU4ULDykaguai0WJD19NuNS5KVmgqmzK0zBmWM8xP0/kc1TOfhMFHVSWq+HQL6yqwHE/Utt1g+Dh
	qr8fDJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiGD-00000006JUl-40Hn;
	Wed, 03 Dec 2025 08:30:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiGB-00000006JUQ-1epj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A552F43AF1;
	Wed,  3 Dec 2025 08:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3A9C4CEFB;
	Wed,  3 Dec 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750649;
	bh=zyF/r0fjZEG5Zc5d3W/4Gh2VeH+el4jv7LMS1PSNlk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rI6h+xJTutYGBiCMHFSC/CvZ/aY8wz+s4/Zl+p2h9DrLvfIzTqd/+d1iR4lErm5FB
	 mKQKFs37QSydLBwjhKPPZwTcCewwu9vwRaOKnDWzWiD0YAwKFCKAInPN20z5mmD7fn
	 tl8JtUqV3tiQsXc5zFT8Hi5EDUYl36G54aqvYte5xk6qTXQFkpq65iRsQ3o4WGXNtN
	 NCklPbkMxcfeLXearae5GTpSabNxYuf8ZOvHtVMKnxs1TQBgmIVeiWSG0BEA1a5KDf
	 abjPoyZNTSRel49GIShJu3LoR1+/e6jpovfKAlDCHifWa8lAhlupOrLbemnC5nh4e/
	 TGmHTfIEDA8gw==
Date: Wed, 3 Dec 2025 09:30:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	Jyri Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
Message-ID: <20251203-aromatic-heavy-loon-0cbd14@quoll>
References: <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
 <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
 <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
 <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
 <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
 <20251202114416.09624a4b@kmaincent-XPS-13-7390>
 <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
 <20251202121856.0da62885@kmaincent-XPS-13-7390>
 <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
 <20251202135605.053ada96@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202135605.053ada96@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_003051_497817_AF29DB3E 
X-CRM114-Status: GOOD (  38.22  )
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

On Tue, Dec 02, 2025 at 01:56:05PM +0100, Kory Maincent wrote:
> On Tue, 2 Dec 2025 13:51:59 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
> > Hi Kory,
> > 
> > On 02/12/2025 13:18, Kory Maincent wrote:
> > > On Tue, 2 Dec 2025 11:47:40 +0100
> > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > I will not NAK, removing bindings and breaking users is under some
> > conditions acceptable. You just need to come with the reasons and impact.
> > 
> > Reason "is ugly" is usually not good enough. Especially if things were
> > working.
> 
> Thanks for you reply.
> 
> > >>
> > >> DTS cannot go to drm, which means you either need to separate the change
> > >> and make entire work bisectable and backwards compatible for some time
> > >> OR at least document clearly the impact as we always ask.  
> > > 
> > > The thing is, if I split it, it has to be in 3. One for the of DRM bus flags
> > > support, a second for the the devicetree and binding change and a third for
> > > the whole tilcdc and tda998x cleaning stuff. I think I will go for one
> > > series, with better documentation.
> > > 
> > > Now, what is your point of view on my question. Will you nak any binding
> > > removal even if the binding is ugly and legacy and imply maintaining an
> > > non-standard tilcdc panel driver? I know it breaks DTB compatibility but
> > > there is several argument to not keep it. See patch 6.  
> > The binding being ugly and having to maintain non-standard tilcdc panel
> > driver may be nice things for us, the users don't care. The users care
> > if their board no longer works.
> 
> Yes I understand but then I have another question. At what cost should we
> continue to support legacy binding?

That's mostly question to platform maintainers and users. Extrapolating
kernel rule - we never break the user-space - we never break the users,
thus we take significant cost.

And that significant cost can be the cost of making the transition
smooth or smoother.

> 
> Just figured out this case already happened, ti,tilcdc,slave binding was
> removed from the tilcdc driver:
> 739acd85ffdb7 ("drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding
> support")
> 
> Even if there is still one mainline device tree that uses it:
> am335x-base0033.dts. :/

If that commit broke existing users, it is a good argument for your
changes, but you need to explicitly use that argument in commit msg.

> 
> > And how does this sync with u-boot? It also has code for at least for a
> > few of these boards.
> 
> U-boot has indeed a driver for the ti,tilcdc,panel binding.
> Changing this devicetree would beak display for these board in U-boot as it
> currently does not support the "panel-dpi" binding.

Thanks for checking, regardless of decision this also should be in
commit msg.

Maybe things were not working correctly for long time, so there is a
choice of fixing Linux side while breaking U-boot and not fixing, but
keeping bootloader working.


Best regards,
Krzysztof


