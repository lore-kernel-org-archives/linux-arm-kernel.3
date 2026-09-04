Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692BC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EARuoU2+4Ppoh54rAYFHVilx3BHYziNxsbRS7f9DEMY=; b=hMKxOgAZFi/VjBBqeH3e5UoihB
	okwlh8AwA15gVeDP5+RXjzn+FtZDC32g1TS3uA9NQDgn41GWEsVRW6wV1/Wh+peiHgVuTh5tl6vw4
	G+S4jMphl0noIgzaS9P3bjy+Yfv2BgMmnKSeEuua4nyqLor1v9uvwyCHOFbWvKxNlhw+aghTJzVP/
	bLIa/skuDfWLWn5UzNxZwwiwW6dQTiMacGPSTmDCKSeFiCjputsDQlukg2h91DOgttTRvkFh08dS7
	G/N+zTDTyQ000eb8qX1Uz/McdyNCZDXqIsSqFa3ezG5OPDreETii/NALsHcH297DwLCslHo+jEc9X
	ai2ghcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PPK-00000001OJK-3uzY;
	Fri, 04 Sep 2026 08:36:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PPJ-00000001OIv-3a9J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:36:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDC9660A8D;
	Fri,  4 Sep 2026 08:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3F91F00A3D;
	Fri,  4 Sep 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510980;
	bh=EARuoU2+4Ppoh54rAYFHVilx3BHYziNxsbRS7f9DEMY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=G8qDtKLsfO5uMyax8B940NgODoxvvXXWhkN5OLQuKDcYFhH0CmeyRV2haSxb4LG7r
	 MWSZsjXuzaG8vD/O/3jJvdMTlxYrsDfDWKGL2W9Q+AcdMqvt77uFbeWDDaasQyJnqU
	 /ynXB1GjWw6KKQ8SSbsZQ/q43Eah1Qqzl92vO4wz6IlwenlJAPTNU/JYMFJ/Yf0XFC
	 XAYUXkuVqpq6U/9dsPVEsY7h6ZPQ5DtCOMCIHMBsY5jIhW19m5HplwlhJ+ZAScasti
	 U+RWvxHTlSJ0G15qbEZn4lU2AAEP+BbdZPg9md32G3USyPeb4oQEC4l6t4RlycdAXI
	 Zm7UAgNa4yiiQ==
Message-ID: <66a60c26351f41e6c9660f1f18cea9f5@kernel.org>
Date: Fri, 04 Sep 2026 08:36:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 12/13] drm/imx: dc-fu: Get DPR channel
In-Reply-To: <20260904-imx8-dc-prefetch-v6-12-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-12-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:55:02 +0800, Liu Ying wrote:
> Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
> And, call it from dc_{fl,fw)_bind() to get DPR channels for
> FetchLayer and FetchWarp.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

