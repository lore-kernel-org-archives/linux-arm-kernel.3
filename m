Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDBAD79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lxexy1NRGnGkNwTh+ZH9C7Afn1tu/sVb3g8M/zCZEQ=; b=e8oYnIcmkQR1Xkl3zQtmYfsgmF
	FaHTiiTouzYx+++NfG0eZEN+C8ULQ+NnsXupOEAl290yI+F4VjiqJpEwneHnxTwQaac81nVav8K8n
	hx53v6Zi7Qx1DM2guTs0k50t5ZqNA+WUP1BziRlRTJi9I0CJmZgpOzfaAQxga4NKaDeQ4n6reIhCj
	qyAeq65y1glMYmDO+0ZpqBq8ob1q8gBbIyl3HydvLzRVtJL3F/Mxa08MsiALdDDzl7/YW0YlD/49N
	BozZuxCbVe3C3niPIisgxUa8KpT1v4SJyabEHgaDQrIJk6+wGARAJMZna0Lo0oSvD/m0u9gpBzowZ
	ixgDtkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmARf-00000002aKF-2lFg;
	Sat, 31 Jan 2026 12:51:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmARb-00000002aJY-3wiU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 12:51:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9625B1A2B5E;
	Sat, 31 Jan 2026 12:51:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62646606B6;
	Sat, 31 Jan 2026 12:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E56119A8886;
	Sat, 31 Jan 2026 13:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769863874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/lxexy1NRGnGkNwTh+ZH9C7Afn1tu/sVb3g8M/zCZEQ=;
	b=xUz4nJ3SqjGSb47/RdZbD7Mz4iocZu5Lg7WWrLX+Q3XjVIFvvhEyp/qZle3m+2QW+oTtkk
	basmI5anMTEXc8TeVJSa7L+5cEIPDYB+Ahou91ptDdsT67GEcF/pyI1ogFHPEQVKO9HWaP
	3M7vzhz1wVR1lbwQsrieEA2GjG0S0DJ7kPdxNIB7mmOVKhLpIrWbFvHGBVRexKSkV2EoVy
	wvdeSCDukaZRYEZ/Z0r27A5wQWaX9jOq6N8+rNWHE59XfSqQTo1QLcUZjoQcbmcYDhSuTB
	+r83Re64f6lxJ1tj8TXY8V7ROzULO4dxPEsrW6lQzc3mTI7rgSIyl2e/EifVOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:50:59 +0100
Message-Id: <DG2SDKH3BPGG.1IIH4ZHVY4M69@bootlin.com>
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
Subject: Re: [PATCH v8 03/18] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-4-damon.ding@rock-chips.com>
In-Reply-To: <20251217093321.3108939-4-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_045120_118208_CBFAD27F 
X-CRM114-Status: UNSURE (   6.10  )
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
> According to the include/drm/drm_bridge.h, the callback
> &drm_bridge_funcs.mode_set is deprecated and it should be better to
> include the mode setting in the &drm_bridge_funcs.atomic_enable instead.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

