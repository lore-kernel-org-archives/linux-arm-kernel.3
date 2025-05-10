Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC6C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvGfz4+zhaqRCocFMaf0hgjCnm1CJTvyI1js5uNHlJs=; b=W/W23egthu3ECjxbVTy0RsxW/V
	ELY7o/Oa0+/YxU8rnahN8VeLPH8Xw9iWVzIlfzaIIo87NToundPpslf/JLE0lZ50ruNMPc48+yJtI
	bpu4/M7LT4Op6Zmq0bMx3LGxDO36yGXBj6oYxS1XUKqPY1CqFFU1pjK+3gn4JK9ljExTrvCTlgmAV
	N0xWzAVgsFYm6UofLcp2QR2sxwZVFWsEnhBHI+47GbvXz4EoaFat4lkMIYWI4ctCgcd8HBsPXly0+
	dkXZCFP55H6eHSNJkR2uG85y0UjFzGhnxitp1Dril0Px3cukpNhzzDaB1an60A+fXfMHP3gIZythU
	qomMOs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgmq-00000005lHs-432m;
	Sat, 10 May 2025 09:46:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgj7-00000005kpC-2BhS;
	Sat, 10 May 2025 09:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 810C9A4D7C6;
	Sat, 10 May 2025 09:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67518C4CEE2;
	Sat, 10 May 2025 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870156;
	bh=mvGfz4+zhaqRCocFMaf0hgjCnm1CJTvyI1js5uNHlJs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ldIPC27Bt9cUfcjCameGNcaKJEAzqc7AUG4thRUqo3qyHbBIdcMs8n0bTUIlQ5Tym
	 TJ7a9nhwlFa6+4GEQwIXU2cFx+VvQ3OOD4XQqH+HZ6e6O5slyTKfu+IY7orStEmsf7
	 eC0/5x1y0Vg6Xmq3EiJb6IJts6XegY1Z06KyQ77eaEbMVXv3ghE27h09P69DXIY8Gf
	 9QftRl1mTZGBFVanZ/8Q7gRLFPXgadbF10wjnLH+hZH7YFIa/GdZ/yr013KSFD4rSd
	 NWLTE5kwJ+ijvBSyCwBPXOzsriTpRCh+eVuiXMtGgY+rum+32WSQ8qr99iOs9aGbQ2
	 Y6mdWOA3Vy+qw==
Message-ID: <0bc432f67dc0cdb5fa307565df72af34@kernel.org>
Date: Sat, 10 May 2025 09:42:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 22/22] drm/todo: add entry to remove
 devm_drm_put_bridge()
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-22-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_024237_651036_FD4D4BD9 
X-CRM114-Status: UNSURE (   5.64  )
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

On Fri, 9 May 2025 15:53:48 +0200, Luca Ceresoli wrote:
> devm_drm_put_bridge() is a temporary workaround waiting for the panel
> bridge lifetime rework. Add a TODO entry to not forget it must be removed
> after such rework.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

