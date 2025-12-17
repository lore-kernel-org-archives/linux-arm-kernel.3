Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FAED6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxjssOhapttl/JgPFJB+rkPJ6SCnWIsVEA8zbjgmVQI=; b=MA1UU/u9R52eggL72egu8A2iUF
	RnkJLqrCbrqdifMDZP961AvGS8ygKeBNY2niJffUJwEmuU1Z8De6UfswYu3KALtKR0CiQJGHGvBka
	oeL1IRnUgJ2MJCLzlSz24VVSK5WbZJ3KoEvHg+7j99eUN9eME6LotSUso2aXcJUYbaQCzIxpC/6ae
	FUXKRM3Mqm2dSzYqIvOhvmKU8oMLbAb3oYNzMO7iZAUXGyJTj1Kyqfp07EldpMGmaw4FY2bmdkDoG
	7lygIA8alvWEjQMnz9nxEXqujL5dhJDOjErDxJzM9qbMOky3RYSd9KuwOlCt9sDsuACJoVbHm32l6
	5cRtt/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoeJ-00000006cQs-2Sly;
	Wed, 17 Dec 2025 10:20:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoeD-00000006cHg-3lrQ;
	Wed, 17 Dec 2025 10:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 428A243B59;
	Wed, 17 Dec 2025 10:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965D6C4CEFB;
	Wed, 17 Dec 2025 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966845;
	bh=dxjssOhapttl/JgPFJB+rkPJ6SCnWIsVEA8zbjgmVQI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=He0K8SMt/9Qtq9EjcLEdPmwBMRQcAIpI9KkILD5Su5RLT2cV4ZDpNo3IXhx5uhez9
	 TV8En5Z/zShsXs4UC3e6bk8FAXOvTyJa1CKCECd2KVVjo0oRTMS/rye19WBqifE4ba
	 rVm02WZYUzbN7OK+e0VxNuXyDdxWj4adLKm8+73wOtR7QmbgK62Ns3xKi1kqxRKGnt
	 c44hyRR9Dz9ToWVOcT4Pj3Gk9A/2ynNOoskTAfmi6xbS0Uw3llgqkyTDS16DjwG6Ne
	 CSmjy4C2Mp5NberoC9Ei8LGePq2GT/M6WbWZq2G7C5tFwVphtirDOv1UuLp/bI7jxV
	 fe9vrJ/LEW5UQ==
Message-ID: <21d359fbd3c0279ad82ad3dc0f2494b3@kernel.org>
Date: Wed, 17 Dec 2025 10:20:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 17/22] drm/bridge: imx8qxp-pxl2dpi: get/put the
 companion bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022045_973203_3079163E 
X-CRM114-Status: UNSURE (   6.09  )
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

On Tue, 16 Dec 2025 18:58:50 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use the destroy hook to put the reference on deallocation.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

