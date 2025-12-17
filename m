Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BCD65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpFTNZp1BkY5aeHm9MwA/7jopV+H1qGUXOIS+V2/270=; b=klwxVr4wJEAjDjv90cNa1Z0yuC
	LB3CS+afppc81VKX3lEBue6stQ3OZ0ugouz9m7npdJabhD09HqLCpm436WbOO/XqSVLxOc97TEVJh
	6HiyK8QC0xVF8HfKMO5yGLNQowNUnnnSKwXHQHZwd+V8HybU1V9ZSQmgmdZnGZc+GAsaLHuFl9mj3
	DYe3Az4IYiswinpJ5wozDW7AKC6jZea8gDU65mrcHXcIzp72ppWROL5s5Hle+/IyE8qF1z/2YsfOO
	81bpwNuD+Ppeul1/oOZJTTNEXdOsG9IEgOZBs/Dmvl2lKfDIYsGWtGNRwOVeq6Z8UUMgY4GsGt6s5
	3UPGFd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsUX-00000006wEd-04yA;
	Wed, 17 Dec 2025 14:27:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsUT-00000006wB0-0efy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:26:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABDD11A2285;
	Wed, 17 Dec 2025 14:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F29F6072F;
	Wed, 17 Dec 2025 14:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDDEA102F0AD6;
	Wed, 17 Dec 2025 15:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WpFTNZp1BkY5aeHm9MwA/7jopV+H1qGUXOIS+V2/270=;
	b=niEu2lja+3bMOVifguU8UiBsXtDpKAzyE74Rrbcp9L4Po1XhqbQrvBQ4Lr/IKYTQA7eq6k
	5TL6KhGh56B9nzBmEjBzLRXeYg0AnyFehDTv5sdkICdyI952XF3XHp8PSiieBe9epf6o2W
	cqkzM3h+zuQ1Ug2UNG0gTTT5FBO50BG89adtQ+eUT5abkxWx2gZ3iYxjf/4p+bcPUkGchK
	9gmUWTztvfgIGRG9qsDr369Ped9ap4JRnmGuR/EtYehR3ucarDykV/rvWG2lbw50FsIWX1
	G3PtuNxDfGtO1gveFu98+SXSaB68mFENQ5EcCEhU+RsyXBNkJyDXRqWRgIilCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:49 +0100
Message-Id: <DF0K8FGRVIGZ.1UTD9XSHX4CVF@bootlin.com>
Subject: Re: [PATCH v2 20/20] drm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-20-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-20-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062657_409077_6D838AFD 
X-CRM114-Status: GOOD (  10.99  )
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

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:
> Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
> attaching bridges. This modernizes the driver by delegating connector
> creation to the bridge subsystem through drm_bridge_connector_init()
> instead of manually searching for connectors created by the bridge.
>
> The custom tilcdc_encoder_find_connector() function is removed and
> replaced with the standard drm_bridge_connector infrastructure, which
> simplifies the code and aligns with current DRM bridge best practices.
>
> This change is safe as there are now no in-tree devicetrees that
> connect tilcdc to bridges which do not support the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

