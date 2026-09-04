Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27392C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4UqJL4I9Plor9CtIHU2V1yjT48iQ2MyrKeeW7z58WM=; b=IUHsY7A6ql3AFPkxgc+54w4os6
	R4dZCvZ3vuHpVExcC3Ycr+Wtcps+rF/qZaXlW7xfmod0DRIeoKgguJseHILJVN4DNhMwmUyOuXa6u
	ewtcmXEdx64872adqnFnlBrnUdkLa5CqEyRUR6sYXGJuhoaTFRZZ2FhAWY12wleCM0ee4rbkPj/X9
	kCa4aJ5Pb2i0g4E7utq81oIvzMUTkzuKf7Q7N927MbDDNEmlh+bucyRcnDbyzd8u4K+3XS2TediH6
	l8ghEOYBlewXR9lssgHJbsR5/KaIA8pTIuqrr2eABXfHm7I8j1ng2DwTqa81IhUQd617hRLvWSVyp
	/lTIZstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PMZ-00000001Nsv-1T6e;
	Fri, 04 Sep 2026 08:33:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PMX-00000001NsI-3on7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:33:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DBF660211;
	Fri,  4 Sep 2026 08:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC4D1F00A3D;
	Fri,  4 Sep 2026 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510809;
	bh=j4UqJL4I9Plor9CtIHU2V1yjT48iQ2MyrKeeW7z58WM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ct1XKUY0fnuFX5eiw09xoWPGKZlBikbdz3lQhjp1a77+eGvhCFYjurrfgI21cJexD
	 lpk9YpDb+U1yeFs5hwKRgXmPAEaS+d6bMtabxJEl12LTVbNH0K54I1H9z/h1iR3IZj
	 ZAolGmtwAsLT0wfqHOQoy23izYnhQDgMnxbox1S1cnTUWz0EL37f5XAqkcSlLZISoI
	 ex5US7EXLj0STQ1sGzJCNnG1Z75Hanw2pkeNDaWsAkNK3i0qBn/fHqHS1XicgFl4Fx
	 Wul7A20YfeWNMtpcZfKWvl/Q7rL0uU+khJoRDudZ2d8Nq7Ptop/UvW46jjpM00zCNR
	 CFhGUl+VDq+Yw==
Message-ID: <0d4f2e0275dbb7fd4db16f9e4393dad2@kernel.org>
Date: Fri, 04 Sep 2026 08:33:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 10/13] drm/imx: dc-ed: Drop initial source selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:55:00 +0800, Liu Ying wrote:
> It's unnecessary to set initial ExtDst source selection because KMS
> driver would do that when doing atomic commits.  Drop the selection.
> This is needed as a preparation for reading ExtDst source selection
> when trying to disable CRTC at boot in an upcoming commit.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

