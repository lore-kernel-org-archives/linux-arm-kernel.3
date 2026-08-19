Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F21C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdGAuHjlixpYdkT9xhMb3UwdzW0vQ2uOjAXrNRRpfaU=; b=fVygRvbsSlMf+S7eIx/7hdCNeV
	co434tpYD0rrtvXPgwtYLbOhvzwv75awTM8nrV53QoBGy+XMt6GDPEsxEGRIGquqdG4PGPE3GvIUk
	GaDxhb+cUCBU1UUSPsK9cXmh5bJdpk3SyIIsRsS10rg03pEo9cseGKwpZQ9+PemhuQZTPIV4Qjhod
	HXAA5BjMIFFbQYaNEOKHN9DQMOexKw96sWpF4+qfqeOkGZETDF5wek/aX1ONZOQ0ucProeOB4GVtp
	/6j1jHGEOrYxJhsw8GhA2Yle4212iJUMc9Czwe5M9igEYNT42Z5e1UiOB0aqmW9CktUlBttAj9aV5
	8V1MluAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfpB-00000009nto-3COE;
	Wed, 19 Aug 2026 12:55:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfp7-00000009nsl-1rlh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 12:55:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AFDC84E412D3;
	Wed, 19 Aug 2026 12:55:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78BB05FF42;
	Wed, 19 Aug 2026 12:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6F611C7107F;
	Wed, 19 Aug 2026 14:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gdGAuHjlixpYdkT9xhMb3UwdzW0vQ2uOjAXrNRRpfaU=;
	b=JDdNeju4PQ27vda3IH4TfbO/cyA11k9vzuM6jNfKZtTKw9a57ymiayvZlfyH1MFXFPUW6a
	YD3hCki30a3zBu/KNLDzTjQI0/UtC8qSPcFREwpWmwkU/p5omn4Z/XelrCA/Ax+Q/ru90C
	8P4380Ujv1MNiQP2Ru9Ko59omZ5RpYanV9sdfPAwB4uMA7MTZSnLxoj6M0iakmcHolx1Fc
	jSHwkfVRvI5bXwuOEuhYMx5PFAT/zUykNlUkQO+ec55wlA4Ln0lpO/zKqHWRBmNsrWp8WH
	h6ipFBfmRmUeycWv+PhIj1cEMZIJniOzgMTDDX8MbpAVBIW8fAeYIUA+rQjc0w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 1/5] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260819075238.3007087-2-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-2-damon.ding@rock-chips.com>
Date: Wed, 19 Aug 2026 14:54:46 +0200
Message-Id: <178714408665.358642.12561443857141730089.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_055517_733233_2A1E0E4C 
X-CRM114-Status: UNSURE (   8.32  )
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

On Wed, 19 Aug 2026 15:52:34 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add data-lanes property support to the port@1 endpoint for physical
> lane mapping configuration.
> 
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


