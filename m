Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D87606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZ8nMNo2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1ECVZnz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LKUnUURPxCCQnn0/zAL5oUiqitujy5IJ59hG70436C8=; b=tZ8nMNo2TkibA55hRGTr2r+QeG
	wrkbuYZeCeWeeq/gVG6NNjGAZDjWseO4BmTO/c3wtlYG8muETHUfJv/lfA5llt3qBR5gqQ9XdZi+e
	S/nWQD5ClyAsL+RzJH6FCUKz0ZPH5gpxsE+HbabxdG+ZHnF/WxzdvDOOnpt1UpynebGaXConXgSdO
	pMxkBNr9zy+0D2WU4v0Z/kRFbdEkeuW45Emqhdwmqj8kXeYL3vwLD/knvc4BTANG2cSPZw1eHI+J7
	mWVIR/BxPlvrQaXtkRv4R1Bowlzr1Oc0NzCwwLxI8UfnfMqpWilBa+gfPy0qrBkTyy2NrscQEaQjp
	PVH0lTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCni-00000002CHI-01zL;
	Tue, 03 Nov 2026 11:35:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCng-00000002CH2-0s1e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:35:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55BF360616;
	Tue,  3 Nov 2026 11:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D331F000C1;
	Tue,  3 Nov 2026 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705735;
	bh=LKUnUURPxCCQnn0/zAL5oUiqitujy5IJ59hG70436C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1ECVZnzr9CJFL5gouN5bcvYxOOKQPlPPcVZy6yYN1vQrUnSjQV3w6oMe1KVR5lEi
	 zocpyAnPKFclr5Y04gMz3QqM/sKExagLeaV/dcZbYyiVNagXrDl3kRVRdsjUrjD3yj
	 9P9GS07DfygIeKkwAAajwhGA/HIP7Rktz/VsP1R7w0yJMOyJbFlTVy6gDw+Z6pt2Az
	 HLCuQtNXGvXVS3NLvljGFevVAQpDQQhgv4/bP0TKvE8iN1jFQytA36LhuJtgBd3D5d
	 UwbjSctQFgA/TiaVKGxuhWjFpvm9+dkW+FmotioQU2Xv5ticgT3AHP3hd1DppRI4vG
	 fLYY2cBR7ZATw==
Date: Tue, 3 Nov 2026 12:35:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: embedded-controller: remove
 #address-cells and #size-cells from required
Message-ID: <20261103-poetic-comical-skua-defb5a@quoll>
References: <20261022-cleanup_dtb_warning-v2-0-e9502fafec59@nxp.com>
 <20261022-cleanup_dtb_warning-v2-2-e9502fafec59@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022-cleanup_dtb_warning-v2-2-e9502fafec59@nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 03:37:05PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The "^fan-controller@[0-9a-f]+$" child node is optional, so it is not
> necessary to always have address-based child nodes.
> 
> "refer to the board hardware user manuals to see what features are present"
> Means fan-controller is optional, which may not present at boards.
> 
> Remove '#address-cells' and '#size-cells' from the required list.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change at v2
> - add descriptions about why fan-controller is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


