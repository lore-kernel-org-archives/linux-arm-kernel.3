Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC415606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mY6TbmON;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=eIV7NZyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+SIrY3lV5sFHoGq82hO8Ug8L5qjWnUkl/nbUlfalUZE=; b=mY6TbmONS+ehq+
	ms9uPhQNd64I/p6Zv6j8RvLd0KCkOx0ZTi1O/J07fGr6P+nxGrlV/272TCRS7DQu336Fbw3Dbxo/M
	A2dSNLtE4YFQLuHw5xxl7BVjgClVHW0bMG7Fr0U1wXzaWVQtKQ+J42jCJ1N1ZH9T0I+jazhgEeBGU
	SZd76G25H7iTk6g9UxbY0+341EtEaZ/ydS/cD3tvq+xcFt+HjSVfZruUiw+m8WUyHkpO+GM0pLx/a
	vs3jpskq6UtQIyI0zIxVlN0VMKNxZ01TsF1wW99o92Wov1wwUiKdr6Ru1O6QKM1PxM8emY4dbKn77
	8w8GU/HTuzMNzS1LAnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwX-0000000BPbU-3pXl;
	Fri, 30 Oct 2026 10:34:41 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwQ-0000000BPV9-0zAb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=+SIrY3lV5sFHoGq82hO8Ug8L5qjWnUkl/nbUlfalUZE=; t=1793356474; x=1794566074; 
	b=eIV7NZyIesMjHeH8b8LFD2j6fZDjL3ywXPLTTMPKOvS5T53tBt86XUow6Vw/4zbm8ZSdrGVczZX
	j8rD8WyBMmgXm73hyUtWljQvCOO9TI0PJP9OgQtBSiNsosH5rO2/yfvZrMlFW4wUZUHJmpxBlAUzy
	eGq76m7fLzKT57ZKbTl8Gh76IFqNO6hv5QxcE9Ai0WEITo0yOcLTw2HVlIzdGL1u17rLB4OHNrjLs
	x1AV0Hj59llP/Qk/xExjoId+75JFRVppqiCPNg/9HFcepkIrfNSfpVlPATQCIIqVRbvXdi3BTWAt5
	e7KPwCh4xUi51PGc1DrZJg3tRibIOX/uWhxA==;
Date: Fri, 30 Oct 2026 11:34:24 +0100
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
Subject: Re: [PATCH v2 2/9] ARM: dts: omap: dm816x: use dedicated SoC
 pinctrl
Message-ID: <20261030113424.3f4f53fc@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-2-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-2-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033434_288236_4C0E8A1E 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, 28 Oct 2026 17:06:03 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
> identical to OMAP2/3. They are actually inverted between Pullup/down
> enabled and disabled (third bit in pinctrl registers). Using dedicated
> DM816x pinctrl header to differentiate between the SoC families.
> This changes the effective pull configuration of the dm8168-evm NAND
> pins. Tested on DM8168-EVM with no functional impact.
> 
> Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index ee0090f7aa64..261ebca8863d 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -3,7 +3,7 @@
>  #include <dt-bindings/bus/ti-sysc.h>
>  #include <dt-bindings/clock/dm816.h>
>  #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/pinctrl/omap.h>
> +#include "dm816x-pinctrl.h"
>  
>  / {
>  	compatible = "ti,dm816";
> 


