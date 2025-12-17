Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66E7D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDX1qXUbxhjoP2T+6sGXnAdfnWZpwmfhKaz+lWV9Ox0=; b=AuYVmjB6qcEBgoBRz7kPltB1Kp
	rqhx6zU7Q+l+r5TUCGQni2RYx68RwXGYeoNMPRzBOBXcPIUMmqvcVHKqRjatwxcN8XH0FqKjYgzT0
	HHHUTazPgd2a1IbqX8SenTzXg8MS+ngXrgtAMud3VDP9a3f4HStnvsdd8q2Kv2SpU9K53STbXzGj6
	ACutiskn2uTfBsgv8vgpTbxCHEupksnNDaYdesZPVIE/f8aLafvUPxu9N+OBSwAk5z/HnFbt1wdcM
	wZrIZ6W0C3fcJf/CbrkMwA0Ew9l0r9epFcL9eGnpBDOv9cJ/3Yb5MY87NVTBEH09GI2NgT3SvC5ap
	IG11KkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsUQ-00000006wA7-1xyX;
	Wed, 17 Dec 2025 14:26:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsUK-00000006w5a-0qqm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:26:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAB6C1A2281;
	Wed, 17 Dec 2025 14:26:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 802546072F;
	Wed, 17 Dec 2025 14:26:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15734102F0AD5;
	Wed, 17 Dec 2025 15:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YDX1qXUbxhjoP2T+6sGXnAdfnWZpwmfhKaz+lWV9Ox0=;
	b=i557slcFQjwF4LQaQPzNhGuODav4tNj9ltFajgy5V9vFyDFB+He4fnZNUOo0gJEsxrDs7d
	FrNuHM8bi5+k1L/PJGhrrVC5UoVynX2II1ImSypDmv/uGWa752fHg/g9c18PLFF+7Ut1yL
	miWheZ4RFC05VPHCgP1e8SIgowzxuqWgEASqM7rMrHAa2iQ2symcSpKAmt7vWojs0jjXwo
	Cr8R9uam6K1DwxEBC0czPKqb1H5ivLqCzTtIcOdCflCTuAZzNcG3/1JxZ/cZqPfHuVgMBH
	psUIG/+yKlXWbwPvw3PYCUt+LEqCa0S7AFgLdasBF4oWFwqxwI8Q6M77LJEOHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:41 +0100
Message-Id: <DF0K8BWFMM5G.2DEY7RJB6SSBA@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 19/20] drm/bridge: tda998x: Add support for
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
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-19-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-19-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062649_667135_CACF2C5A 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
> Add support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to allow display
> controller drivers to create their own connectors. This modernizes the
> driver to work with the current DRM bridge framework.
>
> The implementation includes:
> - Refactoring detection and EDID reading into bridge-usable helpers
> - Adding bridge operations: edid_read, detect, hpd_enable, hpd_disable
> - Setting appropriate bridge ops (DRM_BRIDGE_OP_EDID, DRM_BRIDGE_OP_DETEC=
T,
>   DRM_BRIDGE_OP_HPD) and connector type (HDMIA)
> - Skipping connector creation when DRM_BRIDGE_ATTACH_NO_CONNECTOR is set
> - Handling conditional connector cleanup in bridge_detach
>
> The driver maintains backward compatibility by continuing to create its
> own connector when the flag is not set.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

