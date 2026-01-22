Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FBFD3EE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf62LPsNBJJc+nNviKSXYVgB/daStsOOACWI2sWPQ/U=; b=wjW7WVGrLr4sMoFs4Tzzi6hiYp
	oYuzxHoHMPuaLzKWDHa02w15TuC3Iwh6yQArTJ/gHJ78c+OH30mfm3LRFPCcwb0ZNt44MYuTL1JUE
	sVDFuuscQOLasnc/J9ajYwRKtsYqFo11cISzObsJNz1/BtLbLrquki8cc4AZClhfEyzxVfdXpzDUS
	jlLkevX4u7f6nnjymOReXg+EuDCffFetBkRUFZmY9VitDVeDOoguNVoKlFL92yiHFad24kGAvCUL+
	ziPaoPMsPRsca/bwge5K+902o5oZxXXjZCMpPWFDnIz25GUmbm7h8qh+Q++1KHX/o47N59peORw6B
	lKuEqs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwA9-00000007HT7-1cEG;
	Thu, 22 Jan 2026 14:59:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwA5-00000007HSI-28v3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:59:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB125C21AA4;
	Thu, 22 Jan 2026 14:59:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAC72606B6;
	Thu, 22 Jan 2026 14:59:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80F09119B808A;
	Thu, 22 Jan 2026 15:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769093988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cf62LPsNBJJc+nNviKSXYVgB/daStsOOACWI2sWPQ/U=;
	b=Dk2p8KNEABiQBml98LmxVUAcMkPc20waRc+crQnRxhxC4u/aWW0IaOQAVE2ujhMZr/4az9
	6X+M2Hxp0mWZijF1E2E4E62Vpr5O4v0WS45YGiH7DedTpWWieWeIX2vVZjghsX2QZtfgAP
	4JxbQGbu5Y/QMxWxT00qjAU6k8OMoSQkF/gpHWW+a5nYhYCoy8KUeF4NHtkixatyFTxiKE
	RX1ip4glQdHhVFXm9IMawRXlLXJw+GS9ndCv/p7LDCQb6hwhmlpGIcs/Ci5KnrBS/tJWyC
	VOE5/yW9gj2SC6G3WdZ6B+LZJCF39KPRTTu8htJ5g4dhXxSSRGY8KXpJZ7wXLQ==
Date: Thu, 22 Jan 2026 15:59:41 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v4 19/25] drm/tilcdc: Convert to drm_device-based
 logging helpers
Message-ID: <20260122155941.400e2f56@kmaincent-XPS-13-7390>
In-Reply-To: <DFSRFUYPL99P.WTKNJRWA36F7@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
	<20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
	<DFSRFUYPL99P.WTKNJRWA36F7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065953_684745_04F53B95 
X-CRM114-Status: GOOD (  12.90  )
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

On Mon, 19 Jan 2026 19:00:18 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> > Replace dev_* logging calls with their DRM equivalents.
> > This aligns with the DRM subsystem's logging infrastructure and provides
> > better integration with DRM debugging mechanisms. The drm_* helpers
> > automatically include device information and integrate with DRM's
> > debug category filtering.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v4:
> > - New patch. =20
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> But please avoid adding more patches to a v2+ series unless there is a
> specific need. It does not help getting it applied.

Thanks for your reviews and sorry for that.
This indeed does not help reviewers to easily keep track in the review proc=
ess.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

