Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1213D65530
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=; b=GcC3gQLxrZ+NbYIO0RyEdpmqpL
	/fzuu335RLheTXQIJMCimblMrAYldGEEdLuHiUBQTRoPS9TN2IMiRxb5XsB3zNbhSJFE6v1tm4f7c
	PV6cynCdnRyQw161lZkiNQuGS4YEu6FLKU5nUS9QUQdLPuYjK6dEkxSXR9BHPKaj0Wi+LSMylCuHv
	a/cTXRG/NuMBa269ZHisUXRw0xZArwf7tHvIOtSov0bsunQ7I4kHUoflAKThtL6kbZj/SCY0e+Y1J
	6I2fcSpTguro+3eKPAO3/uivo50FKAWBlFOdjXaliX79o02wQyiLh3Vj4AhU1VEF7qYlDPww4wEAr
	27f+sXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVode-00000006bgy-296V;
	Wed, 17 Dec 2025 10:20:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodG-00000006bFm-02lw;
	Wed, 17 Dec 2025 10:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 685A84432A;
	Wed, 17 Dec 2025 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBFFC19421;
	Wed, 17 Dec 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966785;
	bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aQeoRHM+TibsLmXwFNHe2NxMIf97IfBwI3Pg30hMh9GSe9zJkjaTYVqnVFvUzK1eO
	 hqEQHweDaAiEYuLlPpORiJkPZIkXeo6wCE9zochTalRWSUuAlc5hFIsrO83aOjMHQc
	 dRDBXCaydtBWbBPLhu4uiRNN5MNGkCxbiijFFTpwoKsMjBiyz7fSzN05w0kR1HecYr
	 2BzJ+YfrqyRk3+VKVNamL+je8lR7xEqaXbUUbdtOq2oWqaScH4kTOjKtiYYWZwhkAP
	 PrQCawA95SgM7kkFgsvUlGK8wVa42zlA4iNvg64opzMHA23KfnBNWF7wPh3QPeq1fZ
	 N57d79xsvAOMQ==
Message-ID: <aff5a75a33e6e111347a7a79ebc26ddc@kernel.org>
Date: Wed, 17 Dec 2025 10:19:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021946_104537_2B03CAC6 
X-CRM114-Status: UNSURE (   5.96  )
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

On Tue, 16 Dec 2025 18:58:47 +0100, Luca Ceresoli wrote:
> imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
> every error except -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the two in
> imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
> error cause.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

