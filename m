Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D1ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwZzDwBPCLRG9PXoPEmqDXTwIe8HtG/ZkyvqpQ/vJjI=; b=Kf8uCqiZwKtjIYFmUhXChkZtYa
	3NaZAlTtBLBdz02KYg0iaZVIE/msf4Y5pEG0fniNQdiHSILCwMG0JVZU398UbqCM/SuzZHRehVtk5
	XMxf+OBaovzmpZ+W9cyNXt9h4nilPGA+AT0hXVkQwXV+DUVkBRbWbjsDvVQQY8STom0Jv+TvNEjo/
	3+7uIttloRvdQ2SAfBz4qwd2p1VxFFQCASjsSN426DST27S4mpQCDUUtl1vDURxRe9m3baYwRN3lo
	MOzFPzWNhhFitmI6G6x6343I31/xiXwl3RXlonP73ezo8+wPUwNKfAg4OCGEjG8ZfQNX48MhyI3cE
	Nv82WZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjn1-00000005Azy-19Tx;
	Wed, 20 May 2026 16:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjmz-00000005AzQ-20fT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A542160018;
	Wed, 20 May 2026 16:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CACA1F00893;
	Wed, 20 May 2026 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779294536;
	bh=ZwZzDwBPCLRG9PXoPEmqDXTwIe8HtG/ZkyvqpQ/vJjI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Bp5FUk2KQIbt0M3E/b0CPnjzwUNs8EBJdsRSekRvptNtrj2u2Q6r85nZBPtg7YRn6
	 JA2G47fw1QCrApRZngK4nI7hSlYcb7WJKH5BGk4P879upoScY0lHEpsvl1PAxQZsB2
	 hk3AWu9VmwY6rnKvdiK1GRHfEDwgccv7DyovfW419RUHt4+t00g4M4HXclIrOPSoOW
	 QoyXh9ektqGLBtQJwjOYRI7p5/3qdNyGFFOjy/EZUmEOt1KF9RhhPTAEhJgtQEGerM
	 18IFFGCRrLTktduM0EllzAaMmtb8H/T3fXGgTrESz1TOZ0w3xBHnL834O94HavrBnN
	 KFxMy+Dqta4Eg==
Message-ID: <c78d360919f00e3b6d3fbd56d035488e@kernel.org>
Date: Wed, 20 May 2026 16:28:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Alain Volmat" <alain.volmat@foss.st.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Brian
 Masney" <bmasney@redhat.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Chris
 Morgan" <macromorgan@hotmail.com>, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Daniel
 Stone" <daniels@collabora.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jani Nikula" <jani.nikula@intel.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sean Paul" <sean@poorly.run>, "Shengjiu
 Wang" <shengjiu.wang@nxp.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Wed, 20 May 2026 16:43:36 +0200, Javier Martinez Canillas wrote:
> Several DRM drivers define their own local macros or use magic numbers for
> the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
> instead these common rate constants could be included to a shared header.
>=20
> This series introduces these constants to the <linux/hdmi.h> header and
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

