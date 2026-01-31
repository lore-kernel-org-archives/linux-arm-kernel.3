Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA99D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSxS9wHGDtdAjX1/5+mH0Huzdhx7zLjNEB5f+DdlTHs=; b=kCLV9UExyZDU+8XYb7g+UKq8R5
	9ZjezkS0bx/snDYPkb7HK1foWBaA2RDerE59N3dhwHZHXn6RR87flZeTIUy9LhuXKNg8jXgid3Ocd
	mROog76sOqh/H6MO0HYi/dKy3WlnRtNpks6WJMgu6y1IDjiqr47jq9zGJqIK07tIm4+CqTXh7sXQN
	OGybxLPha9mfy2ZORQw5/vIgLDnwQIUu6VKsqse+0VZ4AkW5SppVdsZUUQx4QZhuIrnfMTdDsRF8t
	XHrT6OmCEdHAnAB3owq/3RrZQz5XvZuJgYHxR/ogsBmms/OO0mXF+h6kVXKN/NILiMfrbeSTAdxuZ
	dB/iKjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBDT-00000002esN-2zG2;
	Sat, 31 Jan 2026 13:40:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBDR-00000002es1-0qn2;
	Sat, 31 Jan 2026 13:40:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B4BBB1A2B62;
	Sat, 31 Jan 2026 13:40:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68E36606B6;
	Sat, 31 Jan 2026 13:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 915C8119A8886;
	Sat, 31 Jan 2026 14:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769866840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XSxS9wHGDtdAjX1/5+mH0Huzdhx7zLjNEB5f+DdlTHs=;
	b=WTuQ2mhaaXw/P7Q25lzFfVTRcWPv/hugf9DkEQvyFph1whXGvriM4dSVQvFK4TtrcxnOQu
	IAMhT3QpPx2uJAbmP8FqQUPbtPh/g4NUG3r9iSs8IC1BM4ptqVxeF9JgZ3oUy1SToqGgAz
	FywDfiaBr+6xyHGJq9KCWX2rrECQtJKsSSLuAhSYB7WRmgjVNhdUoXJXnFDeMv70xeHxcW
	VSMFMHQqwqVrXq6zx+RYNMQ2OesienWcAOHAVgUpRY0aOweknThfG5iGej6R1TEpxBI8TB
	t4pNxRlvealMsJ+yFWLRGtldVaRAdu53+YnKrwyp3aN89lawwYRC0LJaxEwJ+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:40:29 +0100
Message-Id: <DG2TFGURV519.27PQFYSUMS6C7@bootlin.com>
Subject: Re: [PATCH v8 07/18] drm/exynos: exynos_dp: Remove unused
 &exynos_dp_device.connector
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
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-8-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-8-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_054045_377250_B3EBBF80 
X-CRM114-Status: UNSURE (   6.63  )
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

On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
> The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
> but never used. It should make sense to remove it.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

