Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3ACD41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4yhiEdqHPp6VgKPdi1QUcpge0/L2Md1zAgoZsacHiI=; b=e31Th+QzszD/aLyymD16TTDMTW
	K/BzX7V5HJSUiOeTzSqVF5yNGIRyDZbdvJ6d0dJgV8SDo/TnPhgnUfgGNdsDNH5jn4n8n8/IChLl+
	FwuZFD2zVFwON3LYpaT0U5qxHEucZlZPWyNzTd2ox0DCvakxa/GKI2Qxfq25tyI/BdcTLyigYJb4v
	Th2t/a836ILEi5QVxKfKrSHbsqYYq049mSbIPtS1Jywcct1+JU8+Bl5ZM/IFcIi9BJ7BEsmRJHUWh
	hjHSlge9se8fJYLuJhllMCvs5cT4UN37qdb4K6r6SexY9hD3oq62ZqQ7ZnWT1P40m6PNhy2gz69Vm
	jwsUO/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdCR-0000000GS37-1SMk;
	Thu, 11 Dec 2025 09:43:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdCO-0000000GS2k-2uwk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:43:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6274F4E41B72;
	Thu, 11 Dec 2025 09:42:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E8356068C;
	Thu, 11 Dec 2025 09:42:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C738103C8C1E;
	Thu, 11 Dec 2025 10:42:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p4yhiEdqHPp6VgKPdi1QUcpge0/L2Md1zAgoZsacHiI=;
	b=fpTiITXfCsh40SYD7VWJHqi5wBsspqquE0CxrrNPLtD/md5AnfSnWGfkUm9SOKrLEVtbnL
	Z99BI3AGBPXDR0+OQyocHivaJ4GAbj0vYuUqmmXmAagdmxWoXPRrJ5OcjiyL8ioHk0yWim
	wpY0vBTo5/BWwy8LYI0rP0emmxYaX2fY/SmBkLwADFA+JGJn8XSxG3hFaieBJCWBpOm/HU
	p/FJHg36tTI8wn+dfe2x/mNnIdUQ3gk7udOy52e3k1fV2JWcNoHA4aYvSEvPHxtnAkjHaz
	7+k8gIyY/HDHS68hfpb3tMQqh3ngJjbJ9UoYaHZFu1nxGVVgS48GAXfNueARhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:42:50 +0100
Message-Id: <DEVAFQ7XD89Z.XPEGS4AOAF1W@bootlin.com>
Subject: Re: [PATCH 08/21] drm/tilcdc: Remove component framework support
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
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
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_014300_867575_EA82F269 
X-CRM114-Status: GOOD (  12.47  )
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

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously used the component framework to bind
> external encoder subdrivers (specifically the TDA998x HDMI encoder).
> With the removal of these subdrivers in previous commits, the component
> framework is no longer needed.
>
> This commit removes all component framework infrastructure including:
> - Component master operations and bind/unbind callbacks
> - The is_componentized flag and conditional code paths
> - tilcdc_get_external_components() and tilcdc_add_component_encoder()
> - TDA998x-specific panel configuration
>
> The driver now uses a simplified initialization path that directly
> attaches external devices via the DRM bridge API, eliminating the
> complexity of dual code paths for componentized vs non-componentized
> configurations.
>
> This cleanup removes approximately 140 lines of code and makes the
> driver initialization flow more straightforward.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

This driver is complex already, supporting two different modes (one of
which used in a single case only) makes it just worse. So this cleanup
looks very useful.

Provided it's tested on hardware:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

