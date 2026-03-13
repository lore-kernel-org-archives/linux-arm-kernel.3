Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7E4107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzP2F8ldfzZldEuB0zwnw7nG2Tv4Qz+d5X+msxEr7kw=; b=PMmbwKKc0nNIoCt9LCZrT/ATrR
	K+6/oH34E1MRjRiKPg7OsFCcSuuw5n8KFkWHvw9bp9dnKEfRafC+eWBimpDgJZbRrjnfEC58t0VGl
	KXro7Y+MFsBH+ikr11xVGwUqtEreIKpz3TGD5TnhTQaxH20HSc33BDMq5wn+Nm5q8hRXwTQBYEF25
	ZtlaSc/CcmKdUMIx2VmMSBhdvCgJGY54qhmoRFQ3vDeHmsI/nTyLLcedzdzUDqRhbhhhB9OK5cnXY
	DtuYWBJRya2OOTr89CTx0n+x8rWXp3zrt0ELxWvGDHMiOg7xe5SAwKheiiqhJOk5Z+t1AdH+s4fAp
	iQfhuFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16Bw-00000000krV-3nEO;
	Fri, 13 Mar 2026 17:20:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16Bs-00000000kqG-0H6n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:20:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DE53C4270F;
	Fri, 13 Mar 2026 17:21:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D338F60027;
	Fri, 13 Mar 2026 17:20:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 981B410368614;
	Fri, 13 Mar 2026 18:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773422442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vzP2F8ldfzZldEuB0zwnw7nG2Tv4Qz+d5X+msxEr7kw=;
	b=FQwm0oHlMEBGzEMCKMoMgbPWC9aQXWU0IQHzja3zCZvBOQseFndRbL1FYs5+RZuq9rAizx
	//+bQ4vUk+VzZ9SWkP7XJo02seGVxZL9jR2r/AR1tIiNRI1W5dODW7y+5aQiIZUncv6Pn3
	2EW3aaC2pLxqFIVeJ9W/yfPZphwqkwRzCN+JXWimvguIHFxbwOKjwSC5FTJhxh575mjxV5
	VP0OqEIBeGo1mvsT0ledGpg1JAnHL87zndYiA0RcsdiuoukHIGePL0hmUgPdZ3CF+y1pKC
	Gv9xiluP18x+AcY2pEbCxLuZbmOJ3STtfv71g0Ju5SQAeLMdb+tsn65cW5R5Iw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:20:31 +0100
Message-Id: <DH1TSA7A427M.359T6C2RFKRNY@bootlin.com>
Subject: Re: [PATCH v10 17/18] drm/bridge: analogix_dp: Remove bridge
 disabing and panel unpreparing in analogix_dp_unbind()
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
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310020029.178314-1-damon.ding@rock-chips.com>
 <20260310020029.178314-4-damon.ding@rock-chips.com>
In-Reply-To: <20260310020029.178314-4-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_102049_822722_971AE931 
X-CRM114-Status: UNSURE (   7.21  )
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

On Tue Mar 10, 2026 at 3:00 AM CET, Damon Ding wrote:
> The analogix_dp_unbind() should be balanced with analogix_dp_bind().
> There are no bridge enabling and panel preparing in analogix_dp_bind(),
> so it should be reasonable to remove the bridge disabing and panel
> unpreparing in analogix_dp_unbind().
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

