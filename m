Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBAD105F7B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqhrr8N3wxcKRhQBGvv4DdMrdCq70nJ/wYoM4jh+Ap8=; b=MHm/3v/8H66gYvSsP0xhFFxAJR
	FQXxnwexXUISMgBw/GKFqBDwIjYNPelEX+cqQmoMYEoF4PhPy3eGhIUJYj2YnhEuhYIrIHJSGPYx9
	4pPQLpxcRclVFINyRjBAxWKZN/DqgnxTufFv3kshW7/Za9VZofPp09hmIjltXYKaA7YDraaVI1cku
	qRzQvzhJoNAN+Y/6mCUHCQeVIHCwP3tpBZRjLF1zNoJ0MQufQB68Z1NSucUv5cjuqp6PSUqqHUdkr
	41UM8G3SQhEAlYWVS5lntlMrjLQ8BrFNJePRPNO1iO7tDKqt2A5t5G5pSuaq4qXR2gaUSK7jA7VIS
	HZZgapyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Vp-00000000Yth-2ioe;
	Fri, 13 Mar 2026 15:33:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Vm-00000000Ysl-1T5U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:33:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Va-0001kX-Md; Fri, 13 Mar 2026 16:33:02 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Va-0006Mi-0h;
	Fri, 13 Mar 2026 16:33:02 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Va-00000000EjJ-0Vjx;
	Fri, 13 Mar 2026 16:33:02 +0100
Message-ID: <30511e1e0ffd6579091fc4ed1cad084fd81b9c96.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: Prefer bus format set via
 legacy "interface-pix-fmt" DT property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>, Fabio Estevam	
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,  Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 16:33:01 +0100
In-Reply-To: <20260110171510.692666-1-marex@nabladev.com>
References: <20260110171510.692666-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_083315_077158_E9CC9129 
X-CRM114-Status: UNSURE (   8.73  )
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

On Sa, 2026-01-10 at 18:14 +0100, Marek Vasut wrote:
> Prefer bus format set via legacy "interface-pix-fmt" DT property
> over panel bus format. This is necessary to retain support for
> DTs which configure the IPUv3 parallel output as 24bit DPI, but
> connect 18bit DPI panels to it with hardware swizzling.
>=20
> This used to work up to Linux 6.12, but stopped working in 6.13,
> reinstate the behavior to support old DTs.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_brid=
ge")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied to drm-misc-next, thanks!

[1/1] drm/imx: parallel-display: Prefer bus format set via legacy "interfac=
e-pix-fmt" DT property
      commit: cdf26e1462c220629bb79d487263b66f8b679eab

regards
Philipp

