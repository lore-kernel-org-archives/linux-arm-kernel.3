Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C2AD6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF1RncTQkbOGWTkq7AmQX0I4/AjQdHQiX4VwmihZVKI=; b=qGYfsNyHUtHt2t/5iYu2zBE4ED
	4WQGgHiDoYm4b3XNzp2j3TFouZmS4IxyHY7M90PPB7t0A3XOXm9KTv98eS4+5i/R3iOJcY/kcfHs6
	4cqU13TvJNqpIhGKDz3JjWL5CCkPmm/oNj+vvrW8hdyX57gjoLeuDlHtUqJ1wuakDQqA5GKxOTGbu
	hdknXJprq8U7p9kUjtUyehvUiGgeYhrmCGQjTaPx+TR2OqkKWhUG2ocGVHK8b/lBB6Ta5bneJlXX7
	/sQSW2sU7Ke+e7h71fUgA7mROnbm8wGgsm+oFHQR3jXtPrKz+Hb5zKsaKQq0GWMLwtr/cXFmz0C3U
	j884GY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoiW-00000006dpi-3hu2;
	Wed, 17 Dec 2025 10:25:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoiR-00000006dni-1UGt;
	Wed, 17 Dec 2025 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89CFD40DA9;
	Wed, 17 Dec 2025 10:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0376C4CEF5;
	Wed, 17 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967106;
	bh=piGOz6XLwLmQStZCMaEswKGAlrxEZpMArYG0KMxzGk8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=EOPQSEDwOiu0mSJu6Z6W+EyM/uxhXk+FScR/RinD0cNHcpBI7I3cj1OQmLCTWQ+X2
	 tqE+aofbQTtv1f7Y/wexf/hv5B4V3pvLPXt8fkCwQYrjnefOnxy5tqhkzCYKgUzU+D
	 gpyaKz6NlQOg2xzefPeeJoSRPl1iSCpxUav59vCf40pIoO1zhV+IheALsivwNbK0ZC
	 E6Sb81XYWfo/ztTcLp7GrWzS8WrCq3FDnsYSAWYK5aBjpkHJ3X8KcB4miZYD234f/l
	 +3kadcdvNwrABQdoB+9eQVC4ffG9NDALtOjVpJVz4vAY4IgzJc68mlLgvyottomNHx
	 ecIFb7Vc+6xDQ==
Message-ID: <aabaa59f3204da6203c62c5ba01dccd0@kernel.org>
Date: Wed, 17 Dec 2025 10:25:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 21/22] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
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
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022507_440349_DA28585F 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 16 Dec 2025 18:58:54 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set pl->next_bridge and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

