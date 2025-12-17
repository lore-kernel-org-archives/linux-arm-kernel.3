Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB71D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnNxtunhk2yGE92crKgwZuDyghpZFV6MjwtyyPhQ2Yw=; b=mp4vwgSn0gjG/+LSouTZ6vDW7a
	UwJwk7/LKAsLAaeswqvtvF/YEbsbHjspflK3P1sMqLz6TvKvAQbKt9sP4Vga7Xa9rChhM/czxNDLn
	oQMlUNUQ1MatN3eKIhD49oExLJBoSoE8Ojpv5LhlKQN7cGXwuiGMwG6sK1qNG5FEnE1vdBeIuk6z2
	8WNEX40HfpmGCyFfzIqWEwKkd+jHhvvdHgmoJ7NHFjcP183TqrBMbNxeRVkCURLCqxZdhl//KDcwe
	uAW9Df55kqpZWC2M3cySZEVCZG5clFh+tiKD8H5KQMtnT76HaD94LDsVxKDdsWnS5yQzNP9emmmC6
	Q60cWMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVojB-00000006e3v-0EQr;
	Wed, 17 Dec 2025 10:25:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoj8-00000006e30-1y8g;
	Wed, 17 Dec 2025 10:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1352D40DA9;
	Wed, 17 Dec 2025 10:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672F4C4CEFB;
	Wed, 17 Dec 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967149;
	bh=GnNxtunhk2yGE92crKgwZuDyghpZFV6MjwtyyPhQ2Yw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=YbFTZ/ocqRqcOLMTMFILNJXICobjQuhAvnKW71QN94skeBsUUZZrXpa9oyIL7q180
	 aDZCrv46lYFzWhM0uJgoZ+jlNKhDrOOZu/KHrXzJf9jrCrwOTa4ffpMNzzW0t5DpH8
	 6YA301b6LWbk2fVcMjIqMHi/PSX2LKOVPhb99OiuAJfhpYVZUZRhiWg7ViKjKgyPpm
	 dNdRREU/bPVPzTPFZknnUsYqACMtEajQG2UgYyiyNmvnEmG8y+e3hFkOENS8zZ9lf+
	 yXBfmQKV1K76D6m8N1wN3z/vaoZ7nZWPJC4umZ6tl1aQltuIQ/arYPqJ69xV9uLEcd
	 sNnkvhb9edgRw==
Message-ID: <e6df5ec2f2d0b38a533c3d154587948f@kernel.org>
Date: Wed, 17 Dec 2025 10:25:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 22/22] drm/bridge: imx8qxp-pixel-link: get/put the
 next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251217_022550_525274_5969A7B8 
X-CRM114-Status: UNSURE (   5.87  )
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

On Tue, 16 Dec 2025 18:58:55 +0100, Luca Ceresoli wrote:
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

