Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E268D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3SdKe0+mpvWx/w9cqykw3mICMMKsX8oYQHThmIAD9I=; b=aFtFPg6C64F/Y4z8KPwVeqVv4R
	qaqPILnnv3Jiwxp93Yl7fun0AMf/Jff/I0EJgTYGUPFdXngwE79t16+yMpmJoP+T2SBqarZwvL9fc
	fK+sIO0Kt+lhmIfhAbhmqkoNllS/tyzVdb/zOqX5bmzv95oYVguuaSnfoReL+UzLaxqG11sbG4XKK
	34AAsbbVoK01WTV80nLNuwbIqc3G1q35EJ/HPPnAnTL+TIxZfejjN42MYI3rHyfKOaO8B3VMw5nrQ
	z9ReiHfYPvB1nbFcxsqqLRBIHDKkvkzlYEfHDRcj2fCcLGU/eHDfIg4QMC4kgU68MWy9CV0SvaWBO
	wZDN62+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTP-00000006vhI-0M7p;
	Wed, 17 Dec 2025 14:25:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTI-00000006vga-32m4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:25:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34EE4C1A59E;
	Wed, 17 Dec 2025 14:25:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BABAD6072F;
	Wed, 17 Dec 2025 14:25:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ED14102F0ADF;
	Wed, 17 Dec 2025 15:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L3SdKe0+mpvWx/w9cqykw3mICMMKsX8oYQHThmIAD9I=;
	b=JXMif9lSO/HF/s09Z1Fv0hHZ4pTNi4CKZu/x2lz6qckEmlQMvd3e74clghSiVAy/VJlD2z
	89mRCz3WjXhcAu8cn4R1Bl5KZ5Wgw98CDF+5NQlJ4ZJRWlmq8biMo2JQoqDMnVy5gUckfy
	qpcjJBPDRf6fbXQYyySrTUBtosGl5woV7rcygMESq0eVZe+G+XYhbmfgmr857SUHbsg2fM
	pIz3N7O9MSgy7XSKHr0Bhd+6Npl1CxyS30Ny37oLhDxyAfaK+m2abu34ckkUYcsL+lSQxU
	MhWAWn11TVv6JIYOORcW4M1Gvys3HYYLGXgoO6D82JsfBQbzGay+qGWCVOER7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:33 +0100
Message-Id: <DF0K7GL30M9O.2Y1P92MSM6CEY@bootlin.com>
Subject: Re: [PATCH v2 12/20] drm/tilcdc: Rename tilcdc_external to
 tilcdc_encoder
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
 <20251211-feature_tilcdc-v2-12-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-12-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062549_234112_971365F5 
X-CRM114-Status: UNSURE (   6.22  )
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc_external module describes the encoder part of the tilcdc
> driver. Rename it to tilcdc_encoder for better clarity and to make
> the naming more consistent with DRM subsystem conventions, where
> encoder-related files typically use "encoder" in their names.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Makes sense!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

