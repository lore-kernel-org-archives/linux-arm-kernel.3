Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC91D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yu16XEyw9bLMDoYJ+zHkZL/aNjTnCdD95ceJsG17TPY=; b=iQH+ra5AdphkMXR+OVXH2Xprei
	0TPwHx2xWjNOAsZdmuC6uDRkYYWP+P9SdtgM9mgHTxi5/bXCmqijqtoSuzF/GRBFTE/Ua7MmcD67v
	BT5n/wZUsownbTTz8/a05q3zfBMCdw0f2KrTfL+PcWav2x5tWtCEvbNTio3G123awplhKMf+zahZM
	a4PIijlj0hz/K1/w0VAtxhgcciTvqVMwivb/n3QKCba2yt2DePhsyPpaOE7OOY7uOh+7quLngXWR5
	+PjeZ5bRcUlUBpUc2trf1x9LlK0HXx9usFLaVN6xeSIStl4Iu9xBL8HiYuli9yBxPYgk4XZPjuem7
	FhexOmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoaI-00000006a9v-3SfB;
	Wed, 17 Dec 2025 10:16:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoaF-00000006a88-3AK4;
	Wed, 17 Dec 2025 10:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B449E4070A;
	Wed, 17 Dec 2025 10:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15011C4CEF5;
	Wed, 17 Dec 2025 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966598;
	bh=Yu16XEyw9bLMDoYJ+zHkZL/aNjTnCdD95ceJsG17TPY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ElMTuzdRZleWASiV3LxMqxicO5YHge98mbmKWpedTzcc0xQNNAjaHtosz8X6w2kE8
	 Qum1hWNV9vbOT0UvO1CTqpeBsSsVkB3cnjDC7OKnTbDBpGVlDW3cLXB+0xqX/mvAwd
	 95xxMLuCHBCCAwQYh83GnylHhPwpaznEcNyKCOAepX8CznH+0RDr+El2FERhdRaW8S
	 39a+8OP0UJzX5uC5WOQtQhlDS63xZwpkoQsQaCKt1tn4IcF8rT3razMFMxZ0/RUNU2
	 YC5fwf5I5TrFXig1hKfkm9BcjqYIuFSgDuq9+cx4iIw5qnfGI9pPirpjBr/XQ6WZGO
	 GsbMJtYRl27XA==
Message-ID: <1644597c6c9e114cd27898a80014c699@kernel.org>
Date: Wed, 17 Dec 2025 10:16:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 05/22] drm/arcpgu: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-5-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-5-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251217_021639_816244_89012725 
X-CRM114-Status: UNSURE (   5.84  )
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

On Tue, 16 Dec 2025 18:58:38 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put it when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

