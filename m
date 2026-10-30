Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DA606B804
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KCydyeRE;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=rpi2pbA6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rDB876/ff+fBnvKU3vkMsJPrB3yMK9FSKQEQCqA48Qk=; b=KCydyeREzJknpF
	qU9VCOCU8Uw64bzqyVbZtfsUhldiOLJLws6MjbyCgQ0BVZDFLFCV0Yr5lZ3yDGKCCXC7chOAC72Px
	YHUKEdrabC2WariUv7NH0iT4WWCLxrXNvXCCeu9qBVUGNecgIjzChrGy+y1hQNwzzs8OHHj9sTK/0
	7nbrrF4eQCIrjrLMZqWnv6E90YRWe41XnGwWFoXnmgdVIbqqVtpJnWtsuq/sje1Y+OmqvPz8+/85V
	UZ0ozFUJN52w5pFCXybkXtuoSRniBB+2k2K5lAwv8VlcelKv8Lweu7stZNzIkNZPBJ22J9rGpCJ+x
	Wgirxlt404K0CPN1cNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjtE-0000000BP6t-1y0Y;
	Fri, 30 Oct 2026 10:31:16 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjtB-0000000BP5E-3oQN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=rDB876/ff+fBnvKU3vkMsJPrB3yMK9FSKQEQCqA48Qk=; t=1793356273; x=1794565873; 
	b=rpi2pbA6ef11vCe9Ivh+TbHb/Ix01uAtK37wORuD90ahOWaGfFKg2CMwYhtRbyrK7xfJNnKDUdT
	TI6L9r6+KDJz325yGgpH3Dsazn0IEVNyvZfAOg5sRAPJ5XoqUjErlhcUxb+nEXjx7kosjUsyLQWJq
	K7vBxZGw2JPd/UCiPQ12121ZYpX27gLNEdbNPwBnBhMz9suSh8Y1Kcw9bYz+GBDfbPh8PonUZWHCK
	YvxO/cuqI0y5zIWAv+i0pwTLbhboVveizLQERQIAJFNo6zyK2xGxDok3PEhSjsuP8WRVA2DKU/xvd
	WR4dJRuzAM34pe/MRmvXTCu6EHhCFI3lfwWw==;
Date: Fri, 30 Oct 2026 11:31:05 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/9] ARM: dts: omap: dm816x: Add specific pinctrl
 config defines
Message-ID: <20261030113105.15042e2b@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-1-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-1-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033113_952314_EFF2D851 
X-CRM114-Status: GOOD (  15.66  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 17:06:02 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
> Using same definition as OMAP2/3 except pullup/down enable macros, which
> are inverted for this SoC.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
> new file mode 100644
> index 000000000000..b93f971cbe95
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This header provides constants specific to DM816X pinctrl defines.
> + */
> +
> +#ifndef _PINCTRL_DM816X_H
> +#define _PINCTRL_DM816X_H
> +
> +#include <dt-bindings/pinctrl/omap.h>
> +
> +#undef PULL_UP
> +#undef PULL_ENA
> +
> +/* DM816x mux bit defines */
> +#define PULL_ENA		(0 << 3)
> +#define PULL_DIS		(1 << 3)
> +#define PULL_DN			(0 << 4)
> +#define PULL_UP			(1 << 4)
> +
> +#endif
> 


