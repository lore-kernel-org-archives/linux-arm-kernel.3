Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE93CF6BE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjdnKLGbGj7ApxflVZeMDcDhVr+BADzqrFCPwgCMEBo=; b=2eDWvC/AZXpA+SSWCDU10AuI5F
	55jQOE5OTawjhwuKQyLkYAbmQykWDZBeOqQttHWolXlb/srBiS+XcTUtEaMXpAFpzdSPMNKugpmiM
	ijorq7ABbnHq2GTPBk6KV0Rux/g/DzLBgACtAxEh95uy0IiwkuxRqscfd05sTAUxAgIVgaTGEMzgs
	BbSzNEzaofxh4yPR20foTYw+jCWXsh7uN+tbWZqRgD58usQD6QzTWLUbOMKibzVhJDxdj1ZgZr8ts
	I9r1ZK6+rBINk2XYGSUR2fIiH6vcFj0XK0/7vNjteW06v1nT1+M1O/RWV6wATs48wCqZEf94/ieY5
	30RCFbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl9A-0000000GEth-1YW9;
	Thu, 08 Jan 2026 08:13:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl97-0000000GEqx-1k04;
	Thu, 08 Jan 2026 08:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0338D43D2B;
	Thu,  8 Jan 2026 08:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AC3C116C6;
	Thu,  8 Jan 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767860008;
	bh=JjdnKLGbGj7ApxflVZeMDcDhVr+BADzqrFCPwgCMEBo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fT2RheeeyulRtIaXyF3201Qt5BhwBo7XvngYPkZjouAH5rC29/xeoDEQWqABBtMbM
	 oBFYI8EID8htHkTJ+FAmIT67qBNv2IB+5sUf/zLALlMpRAbAJVSOTwMXVnyzFe054N
	 O+qkIvUPO6LCBTRdfTb4T9repPmsFFbei8WmKKbgZ8guYKcPYN2iRkdOFIBJSZQEcn
	 YwIs50hD2nwvGUreu1EKXUSvL9D32ISEmSYYBmWx4aJz8jA2/Lh6nY5RMbbWCzXLiw
	 uOejMPLt83ngJIYaR4REPDEk8229SFro8gNgxHAgK2oITPYhzpy1gM7kP4/sjE2UL6
	 YIG1QgrroOhBQ==
Message-ID: <c7665bbfcb73ac5eb5a5d7f311485503@kernel.org>
Date: Thu, 08 Jan 2026 08:13:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/6] drm/mediatek: mtk_hdmi*: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_001329_469743_60355C9C 
X-CRM114-Status: UNSURE (   5.80  )
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

On Wed, 7 Jan 2026 17:22:02 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

