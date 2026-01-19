Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E45CD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqokSB/0RBOseZeyT2qAuti6f2yMS8AqAjej/iFQSJA=; b=eq7HIzoXsmNBe7UQhpqx2bG2Qv
	scOweh5M9mYffzDMkgs6+9ZXl6+Hhfj+62aOvGuLrN+lPampDJjgAX5axVDbh8n9JeNtr6ixHuAG+
	Zu29635dNtUTb2Y1YXed+c9yKtuMYMckuHlmL9Uy/DAT8hdYcBhs5cJkgi8uavZJlI+BS7Qzr/5qy
	ZS2N2h974GTthf36qKZJw9qIasCOCY+rBDJAPQjEhfUqn2KO87Z0CVGS/NQz1zzQKKcZPGQaLe2yf
	i2i12YZb0nZFsOnNLWyDxFrseEehT/TVMfHI1HSGAbotR/lIEok1I2bzX+pmOy8TrF61NGq4dLLGF
	WIWLCFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxf-00000002Rel-1ea6;
	Mon, 19 Jan 2026 16:18:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxP-00000002RcW-1mlV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:18:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 915434E42176;
	Mon, 19 Jan 2026 16:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FDA960731;
	Mon, 19 Jan 2026 16:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B71610B6B0D3;
	Mon, 19 Jan 2026 17:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839497; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JqokSB/0RBOseZeyT2qAuti6f2yMS8AqAjej/iFQSJA=;
	b=VIjm40O9btn2BNORZgu1rSWFqSTOiWnukvS9ClC7/IpC3nUIk4dGSI86PLSEbDDn/FnoDX
	2PL+hO5tZrNft6PPrDOiADadKHEn7U+oictFAiyJDKpz7+z5O+WYB5H5RbUEuh7t1IL1fi
	rNCigWn/Me9UFD+pgDOy+51QMhD7KSRI4Li0vUsANhdeYAZS/7I6IiowdRHGy278RX3qNQ
	4wQBsr+3xoy0HDXRjcg0XBRh2ZagzgO1+v/1JKNFgrwZumeTlVIxY2h6PpWgUdG46xwLqk
	DTDPDowAyghuUoHioDnUAdFYv5NaEOmuL8wbW0QokAE/k6RqUrOmlCJ47QB9zg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:12 +0100
Message-Id: <DFSP9OPJNVYB.2C96Z9GQ17BW1@bootlin.com>
Subject: Re: [PATCH v4 05/25] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_081827_717748_08E8095F 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> To maintain backward compatibility while removing the deprecated
> tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> the legacy "ti,tilcdc,panel" devicetree binding to the standard
> panel-dpi binding at early boot.
>
> The conversion uses an embedded device tree overlay that is applied and
> modified during subsys_initcall. The process:
>
> - Apply embedded overlay to create a tilcdc-panel-dpi node with
>   port/endpoint connections to the LCDC
> - Copy all properties from the legacy panel node to the new
>   tilcdc-panel-dpi node
> - Copy display-timings from the legacy panel
> - Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
>   standard display timing properties (pixelclk-active, syncclk-active)
> - Disable the legacy panel by removing its compatible property to
>   prevent the deprecated driver from binding
>
> The result is a standard tilcdc-panel-dpi node with proper endpoints and
> timing properties, allowing the DRM panel infrastructure to work with
> legacy devicetrees without modification.
>
> Other legacy panel-info properties are not migrated as they consistently
> use default values across all mainline devicetrees and can be hardcoded
> in the tilcdc driver.
>
> This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
> only be enabled for systems with legacy devicetrees containing
> "ti,tilcdc,panel" nodes.
>
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@id=
easonboard.com/
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---

Looks very good now, thanks for the improvements!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

