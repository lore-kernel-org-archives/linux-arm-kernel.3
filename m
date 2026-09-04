Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/nk14eD2Y0cqgzJGSt+5FjulJ5arXb8251Zy5w04Iw=; b=1oxs2hY8RChJmv/McaEZ6jzhkR
	Xcb78RKDB9wZogR/mn7VR9rJNN7dPP1+avYX3cJEw8XiA10+Y6mi3d6ynUBeDheChjUN4PNqZQdEo
	VvESAkDnoVatS1rX7fWRoKGb2dxT6VU5E+7QPnvNRf9FovvbJgCWNT9yrGwEESjuhsilUak5CcnCU
	aEwOMa7cVQXXt0YWAmNZuzbtretNeamqV4bYegd/tIiJuQYwLsOcyu7H3bhKZPNywajwLNmjgte3W
	ag16+jcKPP1XFcZMRC4w9eoPTfHCQcVHcPo5PEu9oWuUTH/FlzzFBQ1eHV/9gGkmTAphGZPnMofwR
	IMePe3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PMM-00000001Np5-0cff;
	Fri, 04 Sep 2026 08:33:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PML-00000001Nof-1G3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:33:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E16B34381E;
	Fri,  4 Sep 2026 08:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5851F00A3D;
	Fri,  4 Sep 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510796;
	bh=y/nk14eD2Y0cqgzJGSt+5FjulJ5arXb8251Zy5w04Iw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=jTGjJxP1aBNnB3vfu+LiWsWU/lVajEblCXSl6iHSZYPp6UGTE3BXo0Lhh/051QHsO
	 m/Zfk2EEsmpNzwD9Aqi1DUj6G3uRFNtsdw8PbyDBmpItS8Y3BWj0mBINDbfLeCQdmY
	 3J1I0N0AgAmwOAwdxYhNuc7UQbRMiHeFtxBSylUiCjTD0Nz9EZ94pU6GxRuRhoSs2C
	 Ukwy/s3zDvBp98es3I477+izGPFpiWvGSeEXnfwu2SnRiEI8ChwSM41P3ZmOw8gxrP
	 Vg/Z3Pj0ND9N3DtjqfssIcordwH/hBx8xjC/SBYeBvJUG5hSPwUcwyBe9eDKSv2gAB
	 mEBaOcdLb+gSw==
Message-ID: <d6323392130ed13cc5d1da8c2165115d@kernel.org>
Date: Fri, 04 Sep 2026 08:33:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 09/13] drm/imx: dc-lb: Support getting secondary
 input selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-9-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-9-26643e3f6cb7@nxp.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marek.vasut@mailbox.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 4 Sep 2026 15:54:59 +0800, Liu Ying wrote:
> Add a helper to get LayerBlend secondary input selection.  This is
> needed by disabling CRTC at boot in an upcoming commit which tries
> to get the selection.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

