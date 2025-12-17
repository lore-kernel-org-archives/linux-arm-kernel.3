Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46B1D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kx5AqxsQ5e1S1jySAz6WSVdqKpXXqGJgblqNldVpGOY=; b=ZHmNhADTHXj2OgtFaK/LszNLGN
	7Ft887Aeen4g+VzjcRtlbLXr34Gg/qoYD6fKfYaRWXTrs0NxU3IMTYAYOwPzA2rtxkWjCuVwiEWuh
	Ni9pV+OEc6PF1DaAvYubp22lZYkbW2ZpQ9qZanWEDPHmSuSFfCdphyIcDJ6uiy0VAXLD5ld6Xqcdj
	n1/4B8DIdgbdlprUI2tBF2NRWB9KRGm5XCOOe+QyasTjc1tb1jnNsmcQXeFjK4tVdSnozolTr76ke
	SZn5Agn+whSMQr+rcctWUYqk6SeLHe4r/PLEBuI1X8SWDn2aMnrs1JxOsA1sFMRUfWyX4nV2WJ7SQ
	WbPJlhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTo-00000006vqm-2Dr8;
	Wed, 17 Dec 2025 14:26:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTk-00000006vou-2Tum
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:26:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 018524E41C61;
	Wed, 17 Dec 2025 14:26:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C95BD6072F;
	Wed, 17 Dec 2025 14:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 740D2102F0AD5;
	Wed, 17 Dec 2025 15:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kx5AqxsQ5e1S1jySAz6WSVdqKpXXqGJgblqNldVpGOY=;
	b=aXZryHjew7b+veFlQFeIc/4hujos/2S3u2jWCsouWWL35gfB3oO+vyOOG/wVK+g1LpACs/
	vDsIbmw/mfAQw20Y9CThqnBr8lbGBFwic0XojTPGqUPODuFwnu6TFNE9E2wGm4mOzx5SdT
	Y8aE8NeVZ1o+3Gg+nvGoYNp4YCUyZyvGP1fsBvnYcNvyG3oWo5TDKXAnZGt2IgVaWDgb1g
	cCVqEHnpmplysiDxg6RWeMnAEfx5ispwauQtntYK48cA89DBlS+FUKkxl7l4TW8jrxJ5cq
	k6gRzGy7ylLkwOh0oQNkaFscL08PKyIq63lOMxQkaQqjKraCYZ3yOXjgHRlpMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:05 +0100
Message-Id: <DF0K7V50IFHF.2AD4ETTQ19CE0@bootlin.com>
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
Subject: Re: [PATCH v2 15/20] drm/tilcdc: Remove the use of drm_device
 private_data
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-15-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-15-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062613_065229_1599CE96 
X-CRM114-Status: UNSURE (   7.94  )
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
> The DRM core documentation recommends against using dev_private:
> "Instead of using this pointer it is recommended that drivers use
> embed the struct &drm_device in their larger per-device structure."
>
> This patch refactors the tilcdc driver to follow this recommendation
> by embedding struct drm_device within struct tilcdc_drm_private and
> replacing all dev->dev_private accesses with the ddev_to_tilcdc_priv()
> helper macro that uses container_of().
>
> This change aligns the driver with modern DRM best practices.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

