Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7CDFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYZocCmk4lmGT9EFNgIlV7nk5A86HLgtF421diFCKSM=; b=vyxIgKkH5F2P7ovCo5F7UXa6jB
	37dO2Mg5HjWGNcudsnvALDVx3XwC4YVkpWEE6orBzHPBXEFyAUpOKPKxGs6JxkRLFpAU0gMsj9FfA
	Ms/zYY+BIlV3duxM1zDCiryzp3Gfl6IWREjsU979PDZGiNVHG0fKpt5dRmj/1zomvdpLyumQq1sCz
	NnIVCqEAha+rbRYn8HXBTFZcBlDywAnWQLcvuLt6m9I9BI8+DfVxKzJ+dd2PMT5rH1jQvyDCIzg1R
	18UWmEGrqYtQ4VXZAUCilpARhIWrwWN144UWYpW6ZhJmjCJJ7Tvtb6of0isntcpN/CJqWBaGCahzc
	XHsl4a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILep-00000004rPg-3rXs;
	Thu, 30 Apr 2026 07:17:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILem-00000004rOd-0bAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:17:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FE66C5EF3A;
	Thu, 30 Apr 2026 07:18:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F51B60495;
	Thu, 30 Apr 2026 07:17:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01BEB10729FC2;
	Thu, 30 Apr 2026 09:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777533470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fYZocCmk4lmGT9EFNgIlV7nk5A86HLgtF421diFCKSM=;
	b=WoOX+do3yybdEoFa7DAreeKsB6INbX37cr/NMH09jHfWInuntO3hyNCUd8njgEQQ/8q/nq
	+tJqUn/Te3H74VIoNZ5vFcOST8/qL1g/4YAgf2r6sXRQGlylKocFF3J6LAxZfyw1O2YE2k
	ACnNoz6aVp83gthH0GjBF7cr8a61DO/As8QDY0cRWoMZTXve+riChb5T2R21uOL97JGRt1
	g/M6amic3c8jEiyHpDiMsR0waP3nAGsxXB4Efw8McSyi6LcdYbMxwRgbkO7xkJgoURjY/O
	VW2OyV2jpCUUZHFAC/66EihwcmU391sA7D+A+/8qIVCX3FFBkJGc5X5u2q1m8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 09:17:40 +0200
Message-Id: <DI6B0UNV68LI.3PYKFFB0F1DH6@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Damon Ding"
 <damon.ding@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20260429140024.192432-1-arnd@kernel.org>
In-Reply-To: <20260429140024.192432-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_001756_632964_B5B52BCD 
X-CRM114-Status: UNSURE (   6.50  )
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

On Wed Apr 29, 2026 at 4:00 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, not all dependencies are met here.
>
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && =
OF [=3Dn]
>   Selected by [y]:
>   - DRM_IMX_PARALLEL_DISPLAY [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && =
DRM_IMX [=3Dy]
>   - DRM_IMX_LDB [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_IMX [=3Dy=
] && COMMON_CLK [=3Dy]
>
> Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx di=
rectory for multi-platform use")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

