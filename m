Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F22D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHPbq1dYtFEjvHJOmjrG0z7tkyLA/1ZwEpWOGdSDZyA=; b=slXe36R5uGpq2dEb+guWiTjlaB
	nD/4ICTtYRyv6KTfTZlel4FDHQYZ8PLS0Ri61UYbW9DMgq3Bx/hxcF4D85olmhif4Xw5FD/6PxT1r
	cRne/aAI533sHjbaL4ZIcsbGfkUXF3STYXagRGcpKR1P9KBwiPgwoVUgTXaJBhzdp1+mgxojd7uDm
	LfD24i5tbvnZcQT8MDhQQNmBc14JxBIzqcCVcH+6Q+JvwlojoOsYa40Ce1TV2nCfuP0Th12y4vgjS
	y6Gs1FBEhlV95Yc9FdTCfVBQ6TXxgrD6GJvTjN1q6tPGAZkB3ksUjPW/t093cGsuKzhqZuqZeALE4
	fJOk2IAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsRf-00000006vMv-3D88;
	Wed, 17 Dec 2025 14:24:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsRc-00000006vLU-2alu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:24:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DED624E41C63;
	Wed, 17 Dec 2025 14:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2EA06072F;
	Wed, 17 Dec 2025 14:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36CBA102F0AD5;
	Wed, 17 Dec 2025 15:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NHPbq1dYtFEjvHJOmjrG0z7tkyLA/1ZwEpWOGdSDZyA=;
	b=EPdsImrU8FJFeSorGa/VDZlybvDbTuwaaEaRJh2BmZvRPWzx157bsPVfQv/rNfZ8ce4c75
	70F3N1udiyVKmYYtUourJJqbIB14hPNtA7qgeoS40NX0sASfppp48oYcBhIEl5cOTBx316
	1q4TBW1zeMdiilnOII9nl1Z9BfcK/pzImS5iXTyl/pOmuJkUXL2Zz7GxLnIppEgDj0ssna
	qL3V1fMWwwUzGA/oeNGpQa62pV/me2JgK3iwymfjJM8NvG322mCuoFAkb3D5AvybRmFHOW
	5dvv352MinuP0PswjdVTgRjgcefuthIR87l7lc5RqWWo7vOmbzE1UbclZKxTzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:23:51 +0100
Message-Id: <DF0K65TJOOB8.1G6MD72ZQOGFZ@bootlin.com>
Subject: Re: [PATCH v2 06/20] drm/tilcdc: Remove tilcdc panel driver
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-6-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-6-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062400_788774_6BA824F4 
X-CRM114-Status: UNSURE (   9.16  )
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc panel subdriver is a legacy, non-standard driver that has been
> replaced by the standard panel-dpi driver and panel-simple infrastructure=
.
>
> With the device tree bindings removed and all in-tree users migrated to
> use panel-dpi, this driver no longer has any associated device tree
> bindings or users. The panel-dpi driver combined with DRM bus flags
> provides equivalent functionality in a standard way that is compatible
> with the broader DRM panel ecosystem.
>
> This removal eliminates 400+ lines of redundant code and completes the
> migration to standard panel handling.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

