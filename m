Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27016C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bz9b9HTv2sWKqYaZLjCkIaHyjCRTMEZ4N5CM7lBAIjs=; b=BYKJj8D9Nz3kTT/RgSFK+ujZvz
	MYiGEaWx6sNOf5Cy4/ws2vdo917sEGLzjoZdZAFpjlGqNUAXdl0yNFnOuHIC+ZDRsjtMPwHPuqeNR
	0S5OgQcPmq3KX0B1yNHvb1YVFV4M1PKt+IMo2Uk4cgUo+ItD80Az8OI52oOeYWaaZ+GEo58EbCkIy
	NSGKsUMZlJgnDTdrHyeEJ0MVJtiQUIzi0m91+4pA/9BebEVwIRQtCUmR8sNYpN89rooxaf3GQuz4m
	8zSx2z6e0CipY+Bn1SJ070gJoylBUj+7iIONdd7irz/4JayDSMf6iBfPDYzWXFjty5n08S2oMqESi
	13BLpITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z2z-0000000EZeO-2q05;
	Thu, 24 Apr 2025 16:03:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uka-0000000Dr2e-13Ph;
	Thu, 24 Apr 2025 11:28:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AD1F43A07;
	Thu, 24 Apr 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745494091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz9b9HTv2sWKqYaZLjCkIaHyjCRTMEZ4N5CM7lBAIjs=;
	b=WTO+fOKy08+k3R6VOo4FgIrrMPsiB/nAVAOfJMQAdVSxjWQogtIY5cFgPAk1SOOSNg84v5
	YAycUQfirISNqB46b6Rq2Kb0/kVJ/dVEDf6CJhl7XDUG4q1uUDmCk208gBMtVQ1QLCcowA
	g+fPgfDstAalRZjliFX6HSgfLCdZRZcUtPau+3ZpOneb+uQBqfC5TO3g1NgDEjHo5A2vBl
	J+gh7wITo8g5J8vLAI13NXWX+GLjyMQP1oVXIARzj/ipCf1WquNYUKY8S/ZYFKBK0oZlOQ
	bt2f1BodPSa+XQVEebdOJs0qRrfqWeThlK3iYiydfl+WN4DaUXnuKi9a5EyTRA==
Date: Thu, 24 Apr 2025 13:28:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski
 <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 29/34] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250424132804.30bcc49a@booty>
In-Reply-To: <6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
	<6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgruhhlkhesshihshdqs
 ggrshgvrdhiohdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_042817_477552_ADE4D96A 
X-CRM114-Status: GOOD (  15.39  )
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

Hello Tomi,

On Wed, 16 Apr 2025 15:31:41 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> On 07/04/2025 17:23, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> > which delegates to a submodule (zynqmp_dp.c) the allocation of a
> > sub-structure embedding the drm_bridge and its initialization, however it
> > does not delegate the drm_bridge_add(). Hence, following carefully the code
> > flow, it is correct to change the allocation function and .funcs assignment
> > in the submodule, while the drm_bridge_add() is not in that submodule.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> To add to my last mail, this clearly cannot be right, as it changes 
> kzalloc call to devm_* call, without removing the kfree()s...

Thank you very much for having tested this patch and found the mistake!
I have checked all other patches in the series and found no other
instance of this specific flaw, but a couple flaws of a different
nature. I'm now fixing all of them and will send v2 later today.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

