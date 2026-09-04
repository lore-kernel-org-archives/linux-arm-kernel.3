Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F18DC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hf2+Ic93e5NS9F8YWg601XTrq19GOkYx2bwFIAfD+Rk=; b=qWVNop98uMQU2WNUa3bUIVisOM
	dcDVg0/0QkALwVDr/j4hzz/iUgnrK3KbqVyN2IJr0vZMAP7B/5xROirjXDcZxBJYIF+uZdX1G5u5c
	oMyGCGdSkFXqb7ijElC9jOQQS0v140JuHsGJHEMJdzlZ+viofkJV0EkTWkOmLphsdWJybg8cvX+Q2
	GnmjCqYHU+Ka3cSHikWnXvp3Ate4LPjqP1hAL85EW2W4DSKB2AIbS5iJNIHg55/QaaBQ+i3KZt2ha
	sDxXy5CchtVTWjkpq6/gXJHRVKUfOUwLrsECGW4zrVP38T70xSb/hzT4d4Kv9YONHC/m34xP6FeT3
	DBd7GpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PJ7-00000001NKJ-1Xp8;
	Fri, 04 Sep 2026 08:29:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PJ6-00000001NKA-3WJ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:29:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2203160211;
	Fri,  4 Sep 2026 08:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5147F1F00A3D;
	Fri,  4 Sep 2026 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510595;
	bh=Hf2+Ic93e5NS9F8YWg601XTrq19GOkYx2bwFIAfD+Rk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=IOQEwmmgPFvVH8Lb5FfWv7nVkg9Q0tplPkuN+phV0vJrNgEN4v6VYVSDodxo96ZCD
	 lTgcQ0KFoK2oP13UYjYBSLrmYtFAoQ39pJFPOkrY4G+aNEaYUO7lPjRfOI0MQNjac6
	 OD7sXULWhSojKhnoTD88Ob5gMdfjI3Q9ssVzJ16OCvGbaz56qY9LuZaFLqgF0PH/St
	 RTZbgEOAt633G4lO+vuXvWjw7VAkBq+WstleW7Lxl5Cwl/gLeOJzcpcoUxSob7sfYS
	 v+7NiZnvjHePwFascVaelX+vjIDVzWMx1nuskzELBg4hnZdOM2oKp+IDkxRJ5r7gKt
	 QXiEF8E4veDOQ==
Message-ID: <e43d4e34d4a0f76f78877901d53d2f33@kernel.org>
Date: Fri, 04 Sep 2026 08:29:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 06/13] drm/imx: dc: Add DPR channel support
In-Reply-To: <20260904-imx8-dc-prefetch-v6-6-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-6-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:54:56 +0800, Liu Ying wrote:
> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> It fetches display data, transforms it to linear format and stores it
> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> driver to support the DPRC.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

