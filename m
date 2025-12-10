Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCFCD3E76A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHScQ9epIs7tSkBpcNfLT2ySqJpIcU3hl0yiRWEMSxU=; b=yds5cs7f14F/QzCDunk6KMHWpD
	zszgMncjm1u+JWZt1umwOW7JR/vYz8jKvC2KceZPiIywhPi7++YKu7xbMEzvoWrJLgNB/b5rfQfvr
	q5Xi6yimmKSeIHoIRpqte2eEGO3msz+VujQD9JFXiugXpdP6a64z/a8DoMReHLIR582y9ZLJi8zwi
	vc7VqXA4KCBHBKvqGMfm5p1um2QBWIl5vHwJSFYsyzUg/h3Pd/oWHvb+Wg6iJjONBI4v+7hU4Wr5x
	VDOkghF7LPcD1VfSeJ2h6fRWlY75u3RdVUsH7S3cxLfiuYoPoHFhUlofYoMhYNtMk3eIYfjoyCDmZ
	JOwnCMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOeU-0000000FjSE-1rG7;
	Wed, 10 Dec 2025 18:11:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOeR-0000000FjRf-2DfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 18:11:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A4FD4E41B4E;
	Wed, 10 Dec 2025 18:10:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D59F760714;
	Wed, 10 Dec 2025 18:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63FF8103C8CB3;
	Wed, 10 Dec 2025 19:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765390254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHScQ9epIs7tSkBpcNfLT2ySqJpIcU3hl0yiRWEMSxU=;
	b=O6jczRAHlyE369TuBgKbSoI5sr+D8r2p/p/jJJNzLR9kXxPqm7i8xrI7fQB90odCyPIXe1
	4YZEYdjGPIrzpd27WpJ88/6qed4b09CpY+O8jxnssomse8LoTt8CSvaA6wr3dlSpRtijCJ
	vAHmY6R0ZD1eQUyUZarC66Ne+Ux/2RcQd5t77tAyFL1OfRlXrUkmm1ZMn+BPB5r7RdTl7h
	Qk+hr7+AYIIFJwhZj0Tgwd+BKfz6bdCRIMotppabJdlVf4Bs8C4uOdOKVnpS/5nLW/u5hk
	/fANJbwQ2wd/+NdKjXBdlPyCrER7pQDgNesMJqkCFPh9spNiUJ1olbTsiUR65A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 19:10:45 +0100
Message-Id: <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_101059_704499_8ABD2484 
X-CRM114-Status: GOOD (  14.41  )
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

Hi K=C3=B6ry,

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc hardware does not generate VESA-compliant sync signals. It
> aligns the vertical sync (VS) on the second edge of the horizontal sync
> (HS) instead of the first edge. To compensate for this hardware
> behavior, the driver applies a timing adjustment in mode_fixup().
>
> Previously, this adjustment was conditional based on the simulate_vesa_sy=
nc
> flag, which was only set when using external encoders. This appears
> problematic because:
>
> 1. The timing adjustment seems needed for the hardware behavior regardles=
s
>    of whether an external encoder is used
> 2. The external encoder infrastructure is driver-specific and being
>    removed due to design issues
> 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
>    may not be getting the necessary timing adjustments
>
> Remove the simulate_vesa_sync flag and apply the VESA sync timing
> adjustment unconditionally, ensuring consistent behavior across all
> configurations. While it's unclear if the previous conditional behavior
> was causing actual issues, the unconditional adjustment better reflects
> the hardware's characteristics.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Only few board currently use tilcdc not associated to a bridge like the
> am335x_evm or the am335x-evmsk.

Have you tested this change on any affected board?

The change looks good to me but without some testing it would be risky.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

