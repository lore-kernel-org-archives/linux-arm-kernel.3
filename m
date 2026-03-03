Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861DEEC0480
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKkT16WQ2PwFq6EXZ11CSb4MueygRWh/vL8xQ2NJLPE=; b=lTJ3lSzfYNAFimFaZtb64MHoky
	fx2UHtTYNjcErXOm32SqCuuKHn3HM92EE6m4Is3mYpboExWtDaulQ1JOzpSzM1bH5Kwp95PZ+vCBo
	BoENBTFgEj+snhmfg43ETqpjomcwBu7ttLaVV6gfbN3nBxqlpuNs7r5K6PA1o2jvewUYNjWBpXNjL
	jlg3xPsomlGwqKJgf65JVhaDRQ8UEBQlPSj4ccdDFv4AFxDaJuvXXdwnzGGQdGFrC/CDDPNfxKexP
	J8fb17nF6fI9Qv6SHDsQZZDj2rLAIbLTtM073GFnGooYvP8h+lMV4Mn3yHhlRBMw8kj77nUwoQzRU
	wPUYomAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGt-0000000EtJq-459l;
	Tue, 03 Mar 2026 09:42:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGq-0000000EtI1-2u2x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:42:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D3644E42500;
	Tue,  3 Mar 2026 09:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBD845FF29;
	Tue,  3 Mar 2026 09:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A39710369689;
	Tue,  3 Mar 2026 10:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uKkT16WQ2PwFq6EXZ11CSb4MueygRWh/vL8xQ2NJLPE=;
	b=zpd0maNm0gGPyBMoMvFv6uv8h6eEB/xLCqRbfpgmPhSK6O1NE4t6N+MJNeGgDcpwie+yWR
	p1LVP+zGwHf9yszOXzAjQOVAFGOTc5+dHzei2NNxyHz82ZUJ+84YQhHBPw6qZpOnyo/2Ta
	oLBfHg1j549L3NZ/a9Rfiv2/KFmv2GSSGhKk9yBfgU0hQmiSS1sB+uQpVPN7+J94cQEsBg
	9+J2mtuHdvuK4+8RJ1jMLFrRQ8IG8t/h/zAlg5iVFL2kZILVrJRs7F2FYFoBR1RTdUXuc+
	Vu3CosuVvx31LJUdxvHkpQekXJeoId9GmH+FN75HmMlEzjYay47l2LQH2gMz+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:14 +0100
Message-Id: <DGT1RY079AQY.39WPHSR0J6H9F@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 05/15] drm/exynos: exynos_dp: Apply
 of-display-mode-bridge to parse the display-timings node
X-Mailer: aerc 0.20.1
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-6-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-6-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_014228_872591_BA1A4997 
X-CRM114-Status: UNSURE (   8.28  )
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

On Tue Feb 10, 2026 at 8:12 AM CET, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
>
> In order to get rid of &analogix_dp_plat_data.get_modes() and make
> the codes more consistent, apply DRM of-display-mode-bridge to parse
> display timings.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

