Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE21606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CORtk49r;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5sxNQ7Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cx8dHJCA4VYiy10LgBmbN/sMFQQ+NghKdL/5fLQ6wlg=; b=CORtk49rFOXL6H
	WQjwBIKUbXUXzVjvDTch9ziNO3eSJlfsffquz14eT0TcZ2fO44A6qXsgy+1uEVjpxE/4gP9XVM3YE
	m0quGKgGNR2E9fHPCE14szfoCxACUNm4sF1pdJpmQo8hTjwu2QAUnimVnZ3k7cFqfYRnzNFteaB/5
	Q6mSQCAgmbe0XIPGBkRkcAr++HyN+L84vbPgsETfadGZnehUdb6uVKqqMtNlcuKvraIdqHGkg2LvF
	AzFW/0gkYZvfSNS+khslQF40As/XWalaPVdOaTeTbMpSVgP+Y63+xt+hjCl2EObYBKN78X+d3qxk0
	suwXLZDsZjWbQniKwdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVIj-0000000ABg0-1QE5;
	Thu, 29 Oct 2026 18:56:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVIh-0000000ABfb-23oh;
	Thu, 29 Oct 2026 18:56:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A12D7601EE;
	Thu, 29 Oct 2026 18:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E9F1F01816;
	Thu, 29 Oct 2026 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300194;
	bh=Cx8dHJCA4VYiy10LgBmbN/sMFQQ+NghKdL/5fLQ6wlg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=X5sxNQ7YYTgxZ8adqrLm471dQvWeWFB3M3tjwVPaUAgPAJ+rKKkEx9k8wM2sAcWJW
	 4sxt9fY4FN2SEbTPIBPnJQ5h/3j/diFhdhq7JhihwUELz0S2/L0aYnw/CoNZ6pOKvg
	 LRUFPS2mv3V96NKow2N6sV//r2q/WlKvnKBLWtfQWty9ZYAk6I7h3q7R4E6tqIUbWd
	 +ewhTkYRuIpKXiusZBw3nz8jXPv3pFXCNrdnO3PDrvPaBU3R2YEb4SAj9yTlxXs0FI
	 plB4bvHim77RoLnArEFUHK9ytSHfLdQvo1DEQ5vSC0oOQ6d+QcHWIZVLMZAtZGV7d+
	 PWUgDe24570LA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add support for Everest ES7202
 PDM ADC
From: Mark Brown <broonie@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20261021124552.767218-3-jerrysteve1101@gmail.com>
References: <20261021124552.767218-1-jerrysteve1101@gmail.com>
 <20261021124552.767218-3-jerrysteve1101@gmail.com>
Date: Thu, 29 Oct 2026 18:56:27 +0000
Message-Id: <179330018771.62540.301527067818961107.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SW+P999vmgK1SgjJAmpmz7r83A8kxMgYkaMdTC3Hm+Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIeT7vb2B0stVzBwNRrVtSN/Bj+1O0i5pbfH52QKpkWP
 TeqbuqnjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk3zmG/+lLzzzVfp2/vPWl
 0NypeWI9/J/uu0wNMNjk9Cz48cea7W8ZGWYZ9PPt6jukkiU6d5Un4wTnzUnRYaEOH6PiS9dc25Q
 ezwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
> converter controlled over I2C. The device outputs PDM data to the SoC
> PDM controller and is configured through registers for supply voltage,
> analog front-end and per-channel PGA gain.

This looks pretty good, a few relatively minor issues below but nothing
major.

> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1274,6 +1274,16 @@ config SND_SOC_HDMI_CODEC
>  config SND_SOC_ES7134
>  	tristate "Everest Semi ES7134 CODEC"
>  
> +config SND_SOC_ES7202
> +	tristate "Everest Semi ES7202 CODEC"
> +	depends on I2C
> +	select REGMAP_I2C

You should also add this to SND_SOC_ALL_CODECS.

> --- /dev/null
> +++ b/sound/soc/codecs/es7202.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Everest Semiconductor Co Ltd.,
> + * Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> + */

Please make the whole comment block C++ so things look more intentional.

> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>

linux/of.h and sound/pcm_params.h aren't needed I think.

> +static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	/* status and device-id registers are read-only, never cached */
> +	return reg == ES7202_CHIP_STA ||
> +	       reg == ES7202_DEV_ID1 ||
> +	       reg == ES7202_DEV_ID0;
> +}

A switch statement would be neater and would probably generate
equivalent code.  Are you sure that the ID registers are actually
volatile, that's quite unusual?  If they've volatile the hardware is
accessed on each read, if you just omit the default then they will be
cached after the first read.

Also should the rest register be uncached so we don't try to write it
back out as part of a cache sync by mistake?

> +static const struct regmap_config es7202_regmap = {
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +	.max_register	= ES7202_DEV_ID0,
> +	.reg_defaults	= es7202_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
> +	.volatile_reg	= es7202_volatile_reg,
> +	.cache_type	= REGCACHE_MAPLE,

I notice that other Everest devices set use_single_read and
use_single_write - especially for write we can easily trigger
multi-register write as part of a regcache sync so if the device lacks
support it'll create bugs.

> +	es7202->supply = devm_regulator_get_optional(dev, "vdd");
> +	if (IS_ERR(es7202->supply)) {

Unless the device can operate without power this should be a normal
regulator_get(), the core will substitude a dummy regulator if it's not
configurd by the firmware.

-- 
Mark Brown <broonie@kernel.org>

