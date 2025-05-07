Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUkZFmqLpaya2SvixZMFXiK5vMoC/WgZVFpr9qlTBnY=; b=b7/9MEgfAGOjM/2QQdooal8Z3u
	2bPZai/q4m9ZC/fIfdUs3jeA8BHAJ+M6AuuC3Ikn5gwN3N0hmQjPFYOAvKWt27/7SV3fsegJK7kdx
	W8+wbWHiHCnGsduWIyddr2ii2sP92iBETqr48gMCTM2if2CFoZkIIUEsKEDbMFWLs8dfn8GGSofrl
	gCimGZw0ynb6FWtPmvSNjG/GXEnJM0bBk8bbAOlI3uYOJ8cq/T8/cndZHAYI8z2Ho+tZ2MQ3sb4Xm
	ZS1AP4ABFKL+S27ocj8PHNue5mGKSqILUgpeLseFGdeWFCy1XTxk1BBeQDZOyx8hAwzx7cfSK7kG1
	PnGnqm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg59-0000000Fqrq-0403;
	Wed, 07 May 2025 14:49:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfWT-0000000FiZo-2yJg;
	Wed, 07 May 2025 14:13:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7A8943A17;
	Wed,  7 May 2025 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746627197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUkZFmqLpaya2SvixZMFXiK5vMoC/WgZVFpr9qlTBnY=;
	b=adYesO7D1P7ynosW29lwbsjTgJFaCmVyHEon+flnFOa0BvpYbgiRnF+Xmpud0uAtagWCKR
	3oskQarIGt0LOBcEzJnasoloDFldQLXTPGfiIhzFPFxQ44Bv9OhNB8OfgtRyxM7+9P43cR
	EkU5M3wIV4eMfygkH8Z49lCMg02BGC3HtUgDaN8q7xI8pIpFMVELZovDj9NLGU/agK2QHw
	g3CUt2Har990IGmx7V543phmv8Wv4XvzKKsAS8THOhfgcNBUADs19379Lxd8e7/I43vGMD
	r3WqKePwg6IikvuHOAtVe8FiAWFIlf69nPFcMS8m4pDVEx1m0DuHF1UEztkH0g==
Date: Wed, 7 May 2025 16:13:11 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250507161311.6e434f2f@booty>
In-Reply-To: <430d497d-45a1-436d-91fd-635854f80c9f@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
	<553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
	<20250430112944.1b39caab@booty>
	<f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
	<20250506224720.5cbcf3e1@booty>
	<a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
	<20250507091244.32865a71@booty>
	<430d497d-45a1-436d-91fd-635854f80c9f@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_071321_881376_2AE9A69E 
X-CRM114-Status: GOOD (  39.32  )
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

Hello Liu,

On Wed, 7 May 2025 18:16:28 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> >>>> After looking into this patch and patch 31(though I've already provided my A-b)
> >>>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
> >>>> should have the same life time with the embedded DRM bridges, because for
> >>>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
> >>>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
> >>>> the life time for the embedded channel/bridge structures only, but not for the
> >>>> main structures.  What do you think ?    
> >>>
> >>> I see you concern, but I'm sure the change I'm introducing is not
> >>> creating the problem you are concerned about.
> >>>
> >>> The key aspect is that my patch is merely changing the lifetime of the
> >>> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> >>> the bridge is removed from its encoder chain and it is completely not
> >>> reachable, both before and after my patch. With my patch it is not
> >>> freed immediately, but it's just a piece of "wasted" memory that is
> >>> still allocated until elsewhere in the kernel there are pointers to it,
> >>> to avoid use-after-free.
> >>>
> >>> With this explanation, do you think my patch is correct (after fixing
> >>> the bug we already discussed of course)?    
> >>
> >> I tend to say your patch is not correct because we'll eventually make sure
> >> that removing a bridge module is safe when doing atomic commit,  
> > 
> > I think your sentence can be rephrased as "your patch is correct with
> > the current code base where bridges are not (yet) removable, but there
> > will be a problem when they start to actually be removable".
> > 
> > Is my understanding correct? If it is, I agree on that sentence.  
> 
> Nope, I meant your patch should align the life times of the main structures
> and the DRM bridges, for the sake of the kinda long term goal - remove bridge
> driver module safely when doing atomic commit.

Again, I don't think there is any bug introduced by this patch (once
the NULL ptr deref bug we already discussed is fixed). No bridge can be
removed as of now, with or without this patch.

You concern that this patch would make things more complex in the
future, when bridges will actually become removable and they could be
during atomic updates. But about this...

> > The work to have removable bridges is massive and non-trivial, so it
> > will need to be tackled in steps. The grand plan [0] is:
> > 
> >  1. add refcounting to DRM bridges (struct drm_bridge)
> >  2. handle gracefully atomic updates during bridge removal
> >  3. avoid DSI host drivers to have dangling pointers to DSI devices 
> >  4. finish the hotplug bridge work, removing the "always-disconnected"
> >     connector, moving code to the core and potentially removing the
> >     hotplug-bridge itself (this needs to be clarified as points 1-3 are
> >     developed)  
> 
> I'm busy with internal things these days and cannot look into the grand
> plan and steps closely, sorry about that.

...I'll wait until you have time to look into that more closely. There
is just no way to understand this whole topic without some dedicated
attention, which takes time unavoidably.

In the meanwhile I am going to send v3 soon with the known bug fixed,
so the best version is available to continue this discussion.

> > I am at step 1 right now. Removal during atomic updates is step 2,
> > ideas about how to implement that are already being discussed [1],
> > there's a practical plan proposed by Maxime with the goal of reaching
> > removable bridges without breaking things along the path.
> > 
> > [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
> > [1] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/
> >   
> >> which means
> >> the main structures should have the same life time with the DRM bridges.  
> > 
> > The word "lifetime" mean two things for bridges:
> > 
> >  * the time span during which memory is allocated for a struct
> >    drm_bridge (along with the embedding struct)  
> 
> Note that with your patch set the imx8*-ldb drivers and this bridge driver
> won't allocate the DRM bridge along with the embedding struct.

By "embedding struct" I mean the struct imx8qxp_pc_channel that embeds
the struct drm_bridge. Sorry, I realize my wording was ambiguous.

> This makes
> me worry, because maybe these drivers are the only "special" ones in this
> patch set and I don't want them to be "special" after your patch set is
> applied.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

