Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D610ECA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZwiRd4JpA+xTYM34D1mENI6YZR63Qw0QaDPwvT4gzE=; b=rQBK69/4CYITzHLEErC9ctO1xo
	Y6TKC2Fx8xmXcfKMRhbt9cKHTNe6meCdvjT/n+wa4K0WrRcqPCOXsEHmY5BmLZHAK/WZCNaNV8lfs
	7rw07Dg0Pop5InKAO7xT3097z1YUlkWsRsqWLo8CQlgcGsmFR77hDjP5bLRUPCvoCqmfdDp3juJ4T
	e4Q8MOmGqzQ5CDS9bczzjTMedPu/jvJAOSvBRAVPLhDAGD2Lm12HZJPLyAS5S4QndFmtpLY88GC2L
	xkGtIM1KbRTXK55MJj+oxjrfzDtN0xU/+3bHbDprnxyNh6iByggBv7ZFMnr7GKcxeMZlfdnzKJ0Wk
	qay7pJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEu1T-00000004xl3-2QD7;
	Thu, 08 Oct 2026 19:43:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEu1R-00000004xkY-34bu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:43:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A77B260DAD;
	Thu,  8 Oct 2026 19:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAE91F000FF;
	Thu,  8 Oct 2026 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791488600;
	bh=NZwiRd4JpA+xTYM34D1mENI6YZR63Qw0QaDPwvT4gzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boTpVs5sF+REI2wKV5fSoTw2NWmn+MTdUsV/8j/fV/Nw4dRGKlsFHFR0Nx4LJ16NZ
	 Ax/cHogE88gT4jo3fgQzHeM2vkhUtNyRCQEEYcdLoZa4FNOJI9fKe27kqopb2p6Bo4
	 VGohsikO1syqPowOqLywR3Nr1y7HWZc5JVKSOM16OVjwm3ctohb1H56/TTVp0txYUn
	 eYs8Iux1PisgmhrQnC4XHe29eFEI8WK+NnK3nV9Zsnyqs8bhMgBArCNvC4WLpcIWQu
	 oI3ND69q7obsnboE6+ghfIPaguaZODFJH3Bf6YT3qmctBiEknkMucYol8qwhMmmBRk
	 8Ph/den9jgvrA==
Date: Thu, 8 Oct 2026 14:43:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, upstream@lists.phytec.de,
	linux-arm-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>, Frank Li <Frank.Li@nxp.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-ID: <179148859709.884257.1016647053232080228.robh@kernel.org>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
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


On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> Thus allow "data-mapping" override for "auo,g104sn02" in the schema.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


