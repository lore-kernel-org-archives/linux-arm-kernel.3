Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C163ED6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kPgttVA85WUBiDZ3+tveQVCEKPW/E4F6Uu67NSYlO8=; b=guLkV+Pz0GS6D0rn6SRBIb2flp
	I8NDSodS8K8PCbQzx13JbgT8tfvqI5P3km6QCoQ5z1gjPD7tDV6lp1+5K9cW8GeXoksfm/anXX8OH
	1ftyQwX0mSzP++gG2s0tKNbMwBlHWKvGoryshWyZdafDzEbvU4Sj/IoSBU62o/XzFXUGO8G7XqyRr
	m1ghD1VgOOLAiwXaU8F9Rqgg+/f7giT4FZqKqY+UoS0OFFdDh3k66RJoVAXFL/gqtYb+KhIIvJbDY
	JKKbt8mCjErqKZbWhsoFOAJuh3C/siph3sB9LtAlH4/29xDTHnLo+SLt2MLoXZegSEtHzr7x6IBKg
	HBWZoY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVob6-00000006aPd-0Y7v;
	Wed, 17 Dec 2025 10:17:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVob4-00000006aP4-3qMY;
	Wed, 17 Dec 2025 10:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB29A6055D;
	Wed, 17 Dec 2025 10:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B3CC4CEF5;
	Wed, 17 Dec 2025 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966649;
	bh=5kPgttVA85WUBiDZ3+tveQVCEKPW/E4F6Uu67NSYlO8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=mpFFuDbFB2N995Z8rmUjbLTvUb+82/eMCoGzZKWMd8vBNeDxd8f3wGAoiRXkbMg4O
	 hCICfS8phbqqZ1sH2Pvr7I6HR9evkmyGbzSxYGZfEy+N0t8sCOW/EOmWn55xn3G/7E
	 xpEDOVG3QU5q6YGh6KTXk/ji/d50rdRM0A5MCp4djCpMX0f0mfzT7onVAjPfteGjiT
	 CojpYGIrSCcPsnZDVkEjTa8jwC4PgVgrSRwxI93g7nCD39c2aYuLpfTU8euPhVhiKC
	 zbqBImjqXr3h6cc9CvBghtSrf0h1FjIcLyVuhos2ifT/nuuXcZHVf52SDC2BW/UIE4
	 03I9XM+c/T6bQ==
Message-ID: <5797d5b801c1c43b31ddf70d385c8ef1@kernel.org>
Date: Wed, 17 Dec 2025 10:17:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 07/22] drm/bridge: ite-it66121: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Tue, 16 Dec 2025 18:58:40 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

