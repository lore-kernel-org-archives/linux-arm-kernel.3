Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15591D0C855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4kWBn9gjdvScHFjE+y4UkWXcGn5pKA7zE+7suaO1v0=; b=ywJzj3TG7gaL2e3P6PrUYE/7C5
	jgtTs6PrnbouA7/LUVfIf6/QMcXfRwPMG1vT77qOn9SHZp7hkPeoe/53ZJtYb2locyZ/2qTicAMZJ
	ZjTdJ3zX7zpfShlg/W6IEzRAdXv5r8b08Se7IOvIxk+KfAyK0ZvYcoySfMWQi6Q7cJDXnUdhp7Qym
	wUPwW/c65htkiU+q/fV7s4dQDrZ7gxqsS1yAQZNVlsFNoar48eDfJ6AWOGZdYilnBCLunyc+isyNW
	ZSi0ySFWqkJl1BLum+858B6+caD5JbG20NeSWVtdd56S8a3uxJHdGg4gEZvapRQvwQfmsx/WXINis
	cN+GRfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfccr-000000071ep-31xf;
	Tue, 13 Jan 2026 11:31:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfccp-000000071e9-2Zgh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:31:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccf-0008LF-8r; Tue, 13 Jan 2026 12:31:41 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccf-000Pj3-1h;
	Tue, 13 Jan 2026 12:31:40 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vfccZ-000000005PZ-3ACz;
	Tue, 13 Jan 2026 12:31:35 +0100
Message-ID: <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
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
Date: Tue, 13 Jan 2026 12:31:35 +0100
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
X-CRM114-CacheID: sfid-20260113_033151_696956_09ADE2B5 
X-CRM114-Status: UNSURE (   9.45  )
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
>
> This used to work up to Linux 6.12, but stopped working in 6.13,
> reinstate the behavior to support old DTs.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_brid=
ge")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

