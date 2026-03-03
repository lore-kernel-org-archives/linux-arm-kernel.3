Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C8EC0480
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VqdSiLdqihQlbAtlaHr1NspuDH4FWX3VxbhCxMkVSw=; b=NyJwtCprG4UTYlDcUuc+CM4zLa
	QfhvGptQPHP635YG/Pi90tvLTZcdsrAPWdJuX36i5Dvf1NUtUamsYt7FntNCQLgzpj6fPv5/W/RUG
	PqCLt60dgBfeSPSU1miPfclYEiFcmtDDQKxAoGUyj6AF+ofB91CnHaw45z19lLJ7NOpS3AfxnDOm3
	psXFwT1p/ZQ4djx7F0w2oVa4jnXgZPyjRrFPy2XYdyrt6/a1bMr+2wP/+cVk3mJCfjuX6sHwFDMRY
	4ixjLKBKf+Vv7yfqAXts8SNvQasWl3wx4XwYXKh75FtY/7LFnFgKdO195PoFnmYzE9YUA5apFpNyk
	vIBsjG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGz-0000000EtOf-1eeA;
	Tue, 03 Mar 2026 09:42:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGv-0000000EtJ8-49gu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:42:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 983B2C40FA9;
	Tue,  3 Mar 2026 09:42:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F11E85FF29;
	Tue,  3 Mar 2026 09:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 165681036968D;
	Tue,  3 Mar 2026 10:42:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772530946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VqdSiLdqihQlbAtlaHr1NspuDH4FWX3VxbhCxMkVSw=;
	b=Q4yN03iaCyv/eV6BAbQKagJi/sG1eDx8Wk6XLx0lSZrymBDDPXno5pN1Vo4oMkcWHpxMC+
	H/A6aU6BriokmFMb16Ol5ITx1snr1WlTlj2XAva17n1/Te5SJcB1R6sHPg86lUuKx8Di4S
	yt27W16DPPZv6M8K+wUKPV9FbyCnrs6esZbGvVxHY4wmNNs3xC/VYu7j3KsBriqrBC9PYQ
	RlRugbk+ji2iX7TLEaAD1qmGRqlPz8Euzhe8PXqis52T06pD5qBkNdPE2f4NuMrp+mCnw+
	u5sxz0Ek4zAb51JLymcBcoZZHiZGCo2jBkhp53f1fX62tg7+hQaGiTyhiphHwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:42:18 +0100
Message-Id: <DGT1RZRC2HD6.1LRG837BCF1UH@bootlin.com>
Subject: Re: [PATCH v9 06/15] drm/bridge: analogix_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
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
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210071225.2566099-7-damon.ding@rock-chips.com>
In-Reply-To: <20260210071225.2566099-7-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_014234_246881_901B8D3F 
X-CRM114-Status: UNSURE (   6.61  )
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
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
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

