Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFC1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IVmwrk7aGTZcp/7NN8zrGIfqqXduX0J3M9hpB/pHPA=; b=LYxRf2BGaF76Un1dKmYW30gCEs
	E61k00IWOAduS1t/fcHIuiwD4aEd/XwPqi1+xPmaNAZYVatVB74db5CdOOAjx/l+pdBdHBBWpM+WK
	lCW3p9duqH1q9U2K6stWghzwi36F/oi7QSwHF1dHxQWOkTj6LlM13J0juTB6FShT0c2FfZu3ux+fH
	WdZQD2NaheX9xqvujNH5L0ZmJJwp3aizAceSHCS9y1WdDIgHEZkLN/oxkUYbhMwlCBRnFTTTkJBex
	Be0Eb5isdr1cZTnsk/vHwnEGVhk0LRW9uCG5tSCYixYc/g0rD7fjSsIOn7KaWz5hJ5n8CyYB7LrqY
	xkinT/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zEb-0000000Ehy2-0e82;
	Thu, 24 Apr 2025 16:15:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yLg-0000000ETJu-1jmh;
	Thu, 24 Apr 2025 15:18:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4481743B2E;
	Thu, 24 Apr 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745507923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IVmwrk7aGTZcp/7NN8zrGIfqqXduX0J3M9hpB/pHPA=;
	b=FtyAuiP8ARUUv2xs4PPtC4FuRrb5XYgrq7nTPDnp6BcGNmDvjt3hiUhZJ4gakGWOTMm285
	izxLY19qRdbJgJHFDSKAmWuF147STQIQIY3Vvwl7qEaG7qJvaXjNpLiY9Vfya0P+MRrZDU
	AaSSvmPNKnk2zfXYGcIo6csHPDBpesNfnl+mfWjAWossSdTGC2MKU8egwvpd6GBwyGo54M
	fRZ/GwgbtAhX6Rj0x9SRnbLCNylZJ2rKp10NgYWNfJY6XoWyZWuZlAVflEcsvXYf2Mdzcj
	OQ1uc5DdEPbXp2iO9ebp0rO3bbg1DWD4/1SRv2zche6VhM3c2W8AAxGm0SHemw==
Date: Thu, 24 Apr 2025 17:18:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250424171838.21a95d80@booty>
In-Reply-To: <20250408-thankful-husky-of-weather-355cae@houat>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
	<20250408-thankful-husky-of-weather-355cae@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081848_586417_D1DC0054 
X-CRM114-Status: GOOD (  29.31  )
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

Hi Maxime,

On Tue, 8 Apr 2025 17:51:08 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Mon, Apr 07, 2025 at 05:27:39PM +0200, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > The devm lifetime management of this driver is peculiar. The underlying
> > device for the panel_bridge is the panel, and the devm lifetime is tied the
> > panel device (panel->dev). However the panel_bridge allocation is not
> > performed by the panel driver, but rather by a separate entity (typically
> > the previous bridge in the encoder chain).
> > 
> > Thus when that separate entoty is destroyed, the panel_bridge is not
> > removed automatically by devm, so it is rather done explicitly by calling
> > drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> > panel_bridge in current code, so update it as well to put the bridge
> > reference instead.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> >  	if (!panel)
> >  		return ERR_PTR(-EINVAL);
> >  
> > -	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
> > -				    GFP_KERNEL);
> > -	if (!panel_bridge)
> > -		return ERR_PTR(-ENOMEM);
> > +	panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
> > +					     &panel_bridge_bridge_funcs);
> > +	if (IS_ERR(panel_bridge))
> > +		return (void *)panel_bridge;
> >  
> >  	panel_bridge->connector_type = connector_type;
> >  	panel_bridge->panel = panel;
> >  
> > -	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
> >  	panel_bridge->bridge.of_node = panel->dev->of_node;
> >  	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> >  	panel_bridge->bridge.type = connector_type;
> > @@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
> >  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
> >  
> >  	drm_bridge_remove(bridge);
> > -	devm_kfree(panel_bridge->panel->dev, bridge);
> > +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
> >  }
> >  EXPORT_SYMBOL(drm_panel_bridge_remove);  
> 
> I'm fine with it on principle, but as a temporary measure.
> 
> Now that we have the panel allocation function in place, we can just
> allocate a bridge for each panel and don't need drm_panel_bridge_add_*
> at all.
> 
> As I was saying before, it doesn't need to happen right now, or before
> the rest of your work for hotplug goes in. But this needs to be tackled
> at some point.

I totally agree this needs to be handled eventually, and also to get
there in steps.

The current status of this driver is not ideal, so I paid attention to
not make it unnecessarily worse when writing this patch. Do you think
the current patch is OK for the next step? I'm going to send v2 in a
few hours, so don't hesitate to mention any improvements you deem
necessary.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

