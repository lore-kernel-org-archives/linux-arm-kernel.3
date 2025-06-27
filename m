Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9395C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zR4uFATNMv9RglHSXvIBPl+mh/+zjOtDjit754Sxl44=; b=zEuAIKBz+7Mndmq1x9J+3t7GVo
	8jFJhgCVfHbJbbYBbV1MdtTsHUbPSrAn/WtTIRuHyI18vEF3UW9v5/a3LiADULsSDc3DnTb+8tRrM
	RK5x+cid4KGGY6eIHSmfVcfnOjIzTOj54uH5E1oGwFjFQYR6Co67pYCZHA6B1eyEhJb5QhY0VZpiY
	KiwXrLDdRI+2KML00B6b5//hVp46jXJbi02TfSJ10ZwvO53OStgchJo46+f3jlHI9J8janRjbwEs8
	mO0jsz23SAnn3iWNFqm71YRO8NAM+LH4IhcsNsvcBsjSh4iRnsd7w7X1WEbccxR8KE0i/AyuMox/u
	P5i1NI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3xW-0000000Dtl0-0E8J;
	Fri, 27 Jun 2025 07:57:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3rP-0000000DskH-1UyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D86BA613B1;
	Fri, 27 Jun 2025 07:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD34FC4CEEB;
	Fri, 27 Jun 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010656;
	bh=JbS8tm4sqaGviJ8DSlzmMGTIfieonXmx71aSWeZoU2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeJ/n1qq3ZXWmrji1Fxkf4lxd7vQMVfta7pftk2AhMp0U/5OPSsmOlI/rtbbTfOEw
	 Dol/fq67fZUX0i2v3/q7nFlOTOLqSvaAPSWGA5SjPTqjVETnHyv/qs3KEUdnGfnsvh
	 skZkDQjlO4JD80YWV332VoFwQ13PB20Eu8WASTxpZI6L4VaPC0WKxhbLtA9WsYZ1Y3
	 PAwN1EERW1oBTFy9AXcpR+jcmUpCaa6vmyIAS+qpyGKDJ8chmUj596vFhVM0MNJ7jC
	 c/akt9A4lsLu1cwYJDTlrV/jwXz1KsWABx3G5YG8wKJQaUmmH3Dyj+2clEL95Mw0s8
	 kQw0PlxoHltFQ==
Date: Fri, 27 Jun 2025 09:50:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
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

On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>  
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.

You need to list and describe the ports.

Best regards,
Krzysztof


