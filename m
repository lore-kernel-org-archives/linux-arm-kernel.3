Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2861FD31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N91ZNsn3qztrZuL30JXioKyZiwVSCHDIpzX9kPk/ASU=; b=CgEmNrywMbBOVP7/SF7qkahMGS
	oXng+EvPGc0FQgrlYlrMBySwTgbtbmXqorZoSIvu0+XwEebaRA/3YolpuCqcCV9izk6zeKB28qxLY
	M07DQTtlO9Eb5VvHwW4C4X4iWWcpC4mpsvsP4QFQbYHzRn6+WgjpjqR/HZOdyNKuHJkYDL1eVZW85
	hugO27+0o3ag/U8C3z+XGH2c9dPI8Q2tjZ0oZvOC8FugtdGtvV0xAQmquj/1LkJv2H2+buy1yEZsT
	hgo//ebOTP0p7A5BuPtBAlCYAabY4TdZCovEwhVurrmDXduW7SRPcUEG6MkDyA7j0zpmJ0VuzYnRI
	bMIF8esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NX8-00000000FIg-3b7s;
	Tue, 05 Nov 2024 17:40:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NVP-00000000Eyw-1dPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 17:38:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BE38874;
	Tue,  5 Nov 2024 18:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730828285;
	bh=TXks1usl6xJPmU3zdu93XzI2GYWes4w/RqJ+hsmoerI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1FeLUnBkqz6K8s968EBaA8LpDUuftrlj20s85gYEPQ84Nejt+QnYQsbs+8EoRaq3
	 zrO4iRVBqVbCj9wPLP/nGMBiRG3xrAfb5POQnVkw2Bqzh9gogjS1oXSvodFLlrvEKd
	 u0lFQKT3xTlAlCbjvWDO02H6HJkB8hFNDZ5x7mNs=
Date: Tue, 5 Nov 2024 19:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com,
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105173805.GA19866@pendragon.ideasonboard.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_093815_624520_5CFB6FA0 
X-CRM114-Status: GOOD (  18.30  )
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

On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> > function.  IT6263 product link can be found at [1].
> >> > 
> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> > panel to pass the added mode validation logic in patch 3.
> >> > 
> >> > [...]
> >> 
> >> Applied to drm-misc-next, thanks!
> >> 
> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >
> > Where's the immutable branch Laurent asked for?
> 
> The patch set has been picked up after getting an Ack from Sakari,
> before Laurent's email. I am sorry if I rushed it in.

My review didn't exactly come quickly, so I won't blame anyone. The risk
of conflict in this file in v6.13 is very low so it should be fine. In
the unlikely case we have an issue, we'll figure it out.

-- 
Regards,

Laurent Pinchart

