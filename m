Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D16DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UT95bLXGY5IEzB0fijX3mfVzEGvJ1LcjJS5f8nS+1A=; b=uk9nlWrORu8V2e+FCTyk9rgmRq
	jurok77HOeIoqVXRxJsh4HpE3qoogIvJfJBhjNlKgUjvmIAbtt409cYlvCcvwShOUScxGiHZP+1fw
	au/scao5aBfa6UkTsN2Csb6imIrydqh2fJ5+7VUe2ceoAhJxvbggzgxls6WiETIZpg/4YdlCnmKBl
	fthRID8v8rnXmAjValmPp2S7op64r+8G1BuCPegcNKPRIKjhOCyCzRGkUwF+M7TVIqOiOe3l8ZZOI
	uk4kpO8AuF/poJLEZSRWT5LlBv3xNdi1UuTrESQDr3aX4fdIDlMCEHH0bmPZKLV1X4aJVx6Rxm9Rp
	0J4VKhiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkei4-00000001ogB-2xIy;
	Fri, 17 Jul 2026 09:18:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkei1-00000001of8-03GN;
	Fri, 17 Jul 2026 09:18:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAF2040932;
	Fri, 17 Jul 2026 09:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BC11F000E9;
	Fri, 17 Jul 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279896;
	bh=1UT95bLXGY5IEzB0fijX3mfVzEGvJ1LcjJS5f8nS+1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GOKFWh+pfFbTfNTJR4GU/Twcbplcra7BM0uZsF1hLDaY5hFOTheKAhi24IHPeWNw0
	 xAhEo1uL47D1idT9QYYG6fxLWaQKFHIRdCF7lML/D9RTF+SdNGJzSUME0pCxZFEfAr
	 OKgmkexnRF0aa0tw/Ez6YksJ4fAZXeF5PupjPdB3um/cY3uQf5JzeTe54WNlQ89JlM
	 eVa0jT0lfg+WRmFOQ6sSB8hpERpoKGRZswKv21hqTor1xhKfS1IqU/BgySTBiTNYBu
	 c7XK3H7pyov/rVrAUxTjgIb7RM4m7AXXAcUntnauH6X0mJ0RhA0v5eYjM3f5UfvBGp
	 H6E1sW3gZ9enQ==
Date: Fri, 17 Jul 2026 11:18:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: reset: Add bindings for MediaTek MT6589
 reset controller
Message-ID: <20260717-rattlesnake-of-enjoyable-dignity-42da64@quoll>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
 <20260716161923.266315-6-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716161923.266315-6-akkun11.open@gmail.com>
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

On Fri, Jul 17, 2026 at 01:19:21AM +0900, Akari Tsuyukusa wrote:
> Add MT6589 reset controller bindings.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  include/dt-bindings/reset/mt6589-resets.h | 25 +++++++++++++++++++++++

Filename must match compatible.

Why is this separate from the patch adding the binding? Where is this
explained?

>  1 file changed, 25 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt6589-resets.h b/include/dt-bindings/reset/mt6589-resets.h
> new file mode 100644
> index 000000000000..18ef729022a9
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt6589-resets.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_MT6589_RESETS_H
> +#define _DT_BINDINGS_RESET_MT6589_RESETS_H
> +
> +/* TOPRGU */
> +#define MT6589_TOPRGU_INFRA_RST		0
> +#define MT6589_TOPRGU_DISP_RST		1
> +#define MT6589_TOPRGU_MFG_RST		2
> +#define MT6589_TOPRGU_VENC_RST		3
> +#define MT6589_TOPRGU_VDEC_RST		4
> +#define MT6589_TOPRGU_IMG_RST		5
> +#define MT6589_TOPRGU_DDRPHY_RST	6
> +#define MT6589_TOPRGU_MD_RST		7
> +#define MT6589_TOPRGU_INFRA_AO_RST	8
> +#define MT6589_TOPRGU_MD_LITE_RST	9
> +#define MT6589_TOPRGU_APMIXED_RST	10
> +#define MT6589_TOPRGU_PWRAP_SPICTL_RST	11
> +
> +#define MT6589_TOPRGU_RST_NUM		12

Not a binding, drop.

Best regards,
Krzysztof


