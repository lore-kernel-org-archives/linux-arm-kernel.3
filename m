Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF7C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag8OOt4g58qZfAkr65vyEbldEryl9kUs97VL2D42LQg=; b=FWPz0Iq4/PcMx8o2QB7g50FkWD
	zmoYelsPcjnNJgE9Jh8HVAuW3iBppi6/Z2PhSYeTIz0UomCMehqCInPgoYqW5dkswS9HMJ0vcvpj4
	4AsImQcpiqXTG6gadumO0wj5vME9vSuFW/7PuGeFiVtxngutaYu43G0l24p599vF4EV/FJk1ADgwH
	OtPkrYpcbPkXmvVEJlXe8KiEgUFSP77hChOt5wxs/zEp6scSsSLG7LMpcCucdj/AYHeXA0mLFP8ls
	derXl70VkGrAJb7fb8kYJsX8I02mI6xQhJ9PI0dghvF3cnzjMMRafQkR3WBsMuc9fDkHVMJ4m92HZ
	S/jn8GSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6okB-00000009AX0-0fnr;
	Wed, 16 Sep 2026 12:28:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ok9-00000009AWR-2gBq;
	Wed, 16 Sep 2026 12:28:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 7A86F602CC;
	Wed, 16 Sep 2026 12:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AF5CE1F000FF;
	Wed, 16 Sep 2026 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789561683;
	bh=Ag8OOt4g58qZfAkr65vyEbldEryl9kUs97VL2D42LQg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=dKLzkGYc0/3mpgfaS6gzmi91vcin3yP+BR4cW1bM77XZJq/S7Y0ulSwqpW1Y8u/rZ
	 GI+93U0KsAF1rpfCxt2CF+41KA0C+cUqP7h5/FhRRzuG29lc7Mp2bWTQ3oLPxFX1vT
	 Ksh11ouCV1LMgyhgMm7BBnfqQVVN/RCSk0RzhHmn4X8hA+TrU6FR7C6jXE/KN7viVq
	 WQ16Bve+OeEJuBOqLhWZ4r/MU7JwKgc4A9GkiWVrW9mt1Xr7FVeOsKcrKUWMx160dX
	 4aQHqDo49lTficzC+8nIY0jeoVS5DpGzRfJxQfXgfgcEY2LARAjakvN41tJmFhsF+b
	 y0ISnRT4+9lAA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 14:27:58 +0200
Message-Id: <DLGQO5S9MPAW.2XR8ZUJNGW2CO@kernel.org>
Subject: Re: [PATCH v4 5/9] drm/bridge: tc358775: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Tony Lindgren" <tony@atomide.com>,
 "Vinay Simha BN" <simhavcs@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.20.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com> <20260915-drm-bridge-drm_panel-cleanup-v4-5-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-5-30401d9406f3@bootlin.com>
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

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 6:46 PM CEST, Luca Ceresoli wrote:
> This driver does not use the drm_panel APIs at all, so no need to select
> DRM_PANEL.
>
> But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDG=
E.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqqLThIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hhCQF+KJt256zQHwKdDeDGqk58DkDT3hws7NWr
4pvvHCAl7/YzJz7sH1vM1qUgSpywm7rkAYCXJifap04158THPGOk6FmbuHDTWUzy
fGfd0BTzbmgoMyZt1Umk9kcnKaDFJUwk8xE=
=3pvO
-----END PGP SIGNATURE-----

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d--

