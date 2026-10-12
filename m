Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69ACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVXA5NCyOx09Jcjre2nrjJDJnxVnZCUAkC7E4AFKOtI=; b=cNH3ibk1v7tatE2ZcFDShu66lt
	imD2ChUEhWHn0+ELVT3WTZC+H2myNgy23KU/KjJobcLZXQ6xfIRf2wUaWeZXgAPuziqxDj4OJzOu9
	0m83UlTjqsJ/KzW52dzBuYejEyNusqMzF7YYHchbdW5bk63j5lDlSCdh2WqQ35t10UuwV+KW6TrsH
	3WTenM3VPLF+LpL6lx5lvBni42xGVsCRpNzZMEc1G+c8jal4vOsBbPMOmABMCyT6yfmQoDdNJ7Mw6
	QGb7iM7uTo/pyjKiK+Y7t29ezGxLwsS9DG2ZhlNMxSbRS2pOq++E2tbS7QAQQpOqs2izK7E2hlVQx
	oIfkL39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ5G-0000000AzXQ-3BMw;
	Mon, 12 Oct 2026 16:41:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ5B-0000000AzWQ-05mZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:41:05 +0000
Received: from killaraus.ideasonboard.com (i68975AE2.versanet.de [104.151.90.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548F322B;
	Mon, 12 Oct 2026 18:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791823134;
	bh=psu8SUNxGWOkv+ylpg3Mn+GzzgQJS+IaRBtMvOCtzD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnc5ghg+R78pkLio/XQ2zib4fsPKVAHorkCShNxFoD4zgwwrLD2NIcUtbT8pUvzTs
	 Xw7bWX9M0vc7aktIrGNXxW1xwOq8V/a33mjOSm1DBMdHOXTOUhKAVVU4UyMX6bkCXr
	 Irp4BHU/3pyjtlDvlqUucJq65YtM9uPKgarMmyk0=
Date: Mon, 12 Oct 2026 18:40:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <20261012164054.GA56180@killaraus.ideasonboard.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094101_499690_143BD15B 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> This series adds a device tree overlay that enables the VGA output on Apalis
> iMX6, which is driven from a parallel RGB interface passing through a
> non-programmable video DAC.
> 
> The video DAC is a simple resistor network gated by an active-low
> data-enable signal. For the bridge to work properly, this series also
> changes the following in the dt-bindings and simple-bridge driver:
> 
> - dt-bindings: Add a new compatible for the bridge in the simple-bridge
>   binding. This is necessary because the existing dumb-vga-dac compatible
>   doesn't describe a data-enable signal polarity.
> 
> - simple-bridge: Add the VGA bridge match-table entry and timings
>   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

Is there schematics available anywhere ? That would help reviewing the
series ?

> 
> This change depends on another patch, and should be applied after it:
> 
> - https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u
> 
>   Adds the atomic_check function to the simple-bridge driver, which
>   allows the data-enable bus flag to be propagated through the DRM
>   pipeline. This is necessary for the VGA to work correctly on the
>   Apalis iMX6.
> 
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
> Leonardo Costa (3):
>       dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
>       drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
>       ARM: dts: imx6q-apalis: Add VGA overlay
> 
>  .../bindings/display/bridge/simple-bridge.yaml     |  1 +
>  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
>  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
>  drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
>  4 files changed, 111 insertions(+)
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

-- 
Regards,

Laurent Pinchart

