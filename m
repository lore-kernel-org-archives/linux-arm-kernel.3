Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31157D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXeSnaeUCeq2poCC8SB7HwoeEyqC5tY0nRKawuzYQpY=; b=txCMAFWX5RY8iNlzqXsqqBPla2
	5faiCOZ/ZUxD1v2j417Xgs7N5v3SN2r/D5yx7/J/SoPRiYznr2RSYxm4mI9rlc4aEm7GSFRPlOn/I
	92jFHg7ZzNB0neJ30PzmIGCBTX/cH6Kpd35GfOevh6yCFvnX1swbJHOhhGQstXCt9fT3VJSZhn9Vx
	PcOywDWCMb4USuP41A612K0U0n40dv8vWc0lo+kE362pEDggU+lZOFBcu7f0nilLSOoezFpAQVmJg
	/Xyzp9Lro3NUxG3HnoDyZ4MShzI8EKBEpWhh+32myWyoTHi389LumvcRKmNovnMIlWQgJMaP6veYc
	1JgweC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsOF-00000006urr-3HWt;
	Wed, 17 Dec 2025 14:20:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsOC-00000006uqd-2pxj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:20:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AB454E41C63;
	Wed, 17 Dec 2025 14:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2B406072F;
	Wed, 17 Dec 2025 14:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5F1C102F0AD5;
	Wed, 17 Dec 2025 15:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FXeSnaeUCeq2poCC8SB7HwoeEyqC5tY0nRKawuzYQpY=;
	b=LHcy7tbcWgKNnbGmUxOlMOBySmxpFEfq3HpPYCboxqOS0InHSE2jsyLPoDc6g1K2IZE/7t
	3buuqUiZoTVvR0KidqwpqnHZzuKCUrptEpiBRoyQ+XN66Ig72pyOXXTojG9kVBcfJkjeps
	An6pX7EtnKRkGqT25rAc1S1a38lAMmftuJ6bcaNx/7W/7w4s3gmhv6/Hmo2jd27iegZQtk
	lwjk63yzkf+h3o1fjamDFT12Z/8OSL8U62AuB06sLvCQTTeox8gqrmmjCBjcoqZSdvcbtH
	4OAyX3SjocA/4RKzdC1VUi35zIKIQVzSlYEL8nN7+dYicXCQbgjQOJo3UvTMFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:20:09 +0100
Message-Id: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
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
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062028_843926_61481031 
X-CRM114-Status: GOOD (  13.45  )
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
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

Code looks good. Based on your testing, which covered both boards currently
setting simulate_vesa_sync and boards not setting it:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Still it would be good to have this series, and especially this patch,
tested by someone having access to other TI boards.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

