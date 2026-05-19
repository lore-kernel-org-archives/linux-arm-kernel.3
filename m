Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C2DCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/fYndH2Vs7NB88fzEwua/oXTYtST1f+c6W/LM52uBc=; b=hI7qtruCgSGDvC5VG6/j0g8MU3
	Xml4IZsMSYP8tDtC/gxYYeiCgjrvQV4C4KmBLxokuEJv5z+Yv9SA9USoC+R1xqXSt/CM+SIfQX8cY
	vBCVcvIQRKHqYzBhjXIeqQAkx98/8hiX3Q5MMdDXJlH2vnY2/MuSMQdj80+yEVknLQcsgX2Xl4f4p
	vib7SZ8zzq+Q5NHzgNsAxhEr2hWxxRbzEXpMlMXzmlSg40dtGruX4NQg2Bj09X5a6GHdIyWXTp6ql
	WNgIsVjNzbxOAUREpIIrmtx/eYKd4PiFncuedhe3wCq2Ec2VLICJGAP0gxVUu+EfwoMCo2IUDChlM
	UMvDYRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHF2-000000011N1-2Nos;
	Tue, 19 May 2026 10:00:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHF1-000000011MR-0f9d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BEA660129;
	Tue, 19 May 2026 09:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E2AC2BCC6;
	Tue, 19 May 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184798;
	bh=Z0vKOc7r2kW2KPOzWgaoABhrSGC1H7vmq3e+2RoG+fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uazA7qn39Omh173quvgScKbx7HCKeRL5BymeukmCnA2ZOHIFCW/MgtzRgHnrHVrbd
	 qfQ5XibtlS9lWsn8JHXxV9Qi0VGwv4ZDTjjJfmmpvqpPeHYCcCyu5atvr/7ZjHTR7+
	 Vql7GU3IIDUO3yVHftc8PmZ5D3Nkiu2cZak8x7rP71GIlwypGcAMfKRmyW4hpzJ4Vp
	 s8WhQEx86QlmYKnW52dSCN1l4aXGhnDJziAmG99IpDBrraDENYAihAtv7UXTE5ipp9
	 ASX5F+OrGZ8e5ytGfKWmvXUjN/6kdJvoCdUMg4qvfD78Fj5+Nx9zROKvAftMrl59U/
	 NtMVqdyPR7SCQ==
Date: Tue, 19 May 2026 11:59:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:DRM DRIVERS FOR FREESCALE IMX 5/6" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: Add television encoder
 (TVE) for imx53
Message-ID: <20260519-azure-mackerel-of-judgment-dcab1b@quoll>
References: <20260512223137.1190096-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512223137.1190096-1-Frank.Li@nxp.com>
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

On Tue, May 12, 2026 at 06:31:35PM -0400, Frank Li wrote:
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the I2C bus used for DDC (Display Data Channel) communication
> +      to read EDID information from the connected display.
> +
> +  dac-supply:
> +    description:
> +      Regulator supply for the TVE DAC (Digital-to-Analog Converter).
> +
> +  fsl,tve-mode:

This should be a required property, based on current driver code.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      TVE output mode selection.
> +    enum:
> +      - ntsc
> +      - pal
> +      - vga

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


