Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49092C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygTdeuwc1i7RyvsawYkcbeG8xHD6ruDsvhDDf9HOw4U=; b=AvslztlnvkOUZ50aSdg8uZB2xr
	axzZaDBaguandR54yAZfVym7DhbnV0mQwpGHs3EjADP/QZgjCHTg8zhDGTPieyuF6BqH/kRWwb9AM
	GlDhUOwQlDTU4Ry1BF3IXT9wj9x4Am55xm/QJR0ULZD3vF4DpA9tDpUEFBhYQy8SGLJle1EHqdK7U
	xZo6XKPsKFSE5CL3lOwREuTChSUreBIAZz94p8R/+fL3aJzEQCk02NHc1ePmEbnJv9xUvAe4zAMxn
	QDZqI4tIzvkEj9ooDREpEsNFKl8OLi4iR6NfNyRvGFh20b0HimDYuXOwOlStp9y8Re7T8sp/1IgTm
	hgJfyVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfpH-00000009nx9-3Icq;
	Wed, 19 Aug 2026 12:55:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfpE-00000009nuV-0Hq7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 12:55:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FF454E412D4;
	Wed, 19 Aug 2026 12:55:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B0D15FF42;
	Wed, 19 Aug 2026 12:55:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01B3311C71083;
	Wed, 19 Aug 2026 14:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ygTdeuwc1i7RyvsawYkcbeG8xHD6ruDsvhDDf9HOw4U=;
	b=s/dcREpnOnlNpCoAA+1Eun7M51rBb5QT79Gxej55mADMEauWW2ZNDZPtTXrhFsMvsAeVhs
	zlU81iHrTh2A4wLbEHUdV+MxsNE3uhThgg8crsZVjdSAT6ZiBzkQdC2QXxRc8YWSvQasYN
	YX0Xx7arFtAkbC/mxFzfTX0wvWSxLCrLpd/E/d/yViFo1ZHuu8tcJfTrnnuG7wgWIY4WS/
	XZxgHLMwIL7kGifi1F3fTCE6avqBKQjxW5UV+cD5J3Ogs5Jo6Yi10nHvdqywtj1INPaV1u
	99IXZzaBvwwoVWsIbyrEXNXgvokdj6KDy2Lu95fEp1HmWnm3R+KSNMITuW/2cg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/5] drm/bridge: analogix_dp: Restore mandatory
 samsung DP DT properties
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260819075238.3007087-4-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-4-damon.ding@rock-chips.com>
Date: Wed, 19 Aug 2026 14:54:46 +0200
Message-Id: <178714408666.358642.12912882529209046607.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_055524_282831_15AA349D 
X-CRM114-Status: GOOD (  10.45  )
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

> Revert the change that made samsung,link-rate and samsung,lane-count
> optional for Exynos DP. Add error checking to fail probe early if the
> required DT properties are missing.
>
> If these properties are zero, &link_train.link_rate and
> &link_train.lane_count used in the subsequent link training flow will
> also be zero, resulting in link training failure. Although all existing
> Exynos DP DT nodes already contain these two properties, this potential
> logic issue still needs to be fixed.
>
> Fixes: 0d0abd894ead ("drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288")

If it's a fix, please add 'Cc: stable' too.

Also please add to the commit message the detailed analysis you wrote in
the v6 discussion, so that it will easy to find in the git history, in case
it's needed in the future.

With that added you can add: Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


