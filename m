Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B960C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX+DfdPDJS9a13kDKGGrEeAGO5yF0YwMtgsA/rRk1q8=; b=qge1ljjIqkcNGTHxf+2eUeVQYS
	Ue+9MvgQuWDuhojB4qeXiDUeYcaWsew1snKwhjbDHDbVG5naSmCOvhJWAiCrxBTRuiN0mKnMv5mns
	qJ4FonGOnmdBuzkbCWa5+ve8zy2AiY4icVTiTMXq4uPCwGrQcTBlA+rwGoesRr692RlvDV4/kAURh
	FJMZ+X6dyXMU9JdenBVtxOpBv6bF5q6wgFjvl7u4GRfYhYLddEbszQUNjlakuDVDmcur8432uT2i7
	jbGso6+hE+9vIM4hpzRwzYXYSkJl41jRLMBiZZv+ES1Hjz9hqMjhad4hpjhrrKQS7fuu4R3bjkLOC
	YrQMdKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QOs-00000006leW-1sy0;
	Mon, 28 Apr 2025 15:28:06 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QMG-00000006l57-3bCj;
	Mon, 28 Apr 2025 15:25:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0B9743A20;
	Mon, 28 Apr 2025 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745853921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FX+DfdPDJS9a13kDKGGrEeAGO5yF0YwMtgsA/rRk1q8=;
	b=ITQM04VDt7fmcwJTpA470GvqYREg4UjmD+xWVApNtZqUgju3zc+SRsOlAtKcvyzml93ThI
	ZVoJC8eZI5CUSlNxPC4kwRkJxawNCdyGqeTorPOUHxrX1lPTZ81RA0M/RfJNOqEvcIoUhi
	JXzbKBaR2YvMkoD3fx4iU/xrxk1zIr+vPkqYEAYwCibsJaoY3DG5Y+n6hxrC3I0MG2uOM4
	jlCXqz4AtP5/rUv3oZgL+QSKF0e0t8DEQBQVj14MPDTQTYjchVADFjlK7Nn9PBnXHcFBK4
	F8Ymwmx488BTPEZGJjSU6yObmG719uE1WXvFtIhqNk94OF58i7ce1a6myz1S1g==
Date: Mon, 28 Apr 2025 17:25:16 +0200
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
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250428172516.79058e22@booty>
In-Reply-To: <20250428-wild-condor-of-defiance-cadf60@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
	<20250428-wild-condor-of-defiance-cadf60@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082525_049598_1387B0DF 
X-CRM114-Status: GOOD (  20.17  )
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

On Mon, 28 Apr 2025 13:39:23 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
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
> 
> This looks fine, but we need a TODO entry to clean this up later on, and
> a comment on devm_drm_put_bridge that this is inherently unsafe and
> must not be used.

Ah, I see, OK.

Quick draft:

 /**
  * devm_drm_put_bridge - Release a bridge reference obtained via devm
  * @dev: device that got the bridge via devm
  * @bridge: pointer to a struct drm_bridge obtained via devm
  *
  * Same as drm_bridge_put() for bridge pointers obtained via devm functions
  * such as devm_drm_bridge_alloc().
+ *
+ * This function is a temporary workaround and MUST NOT be used. Manual
+ * handling of bridge lifetime is inherently unsafe.
  */

and:

-	devm_kfree(panel_bridge->panel->dev, bridge);
+       /* TODO remove this after reworking panel_bridge lifetime */
+	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
 }

Does it look good enough?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

