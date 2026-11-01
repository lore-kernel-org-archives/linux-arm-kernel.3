Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4zcO1w1;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=9UVX1Kpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HXvfofxYK0mJLvb5JZvTcm44cflpu/Uk4OWCfdYMWE4=; b=b4zcO1w1/38EQK
	nm3VkszXF1N9jseg2vhNCjjMB0XoWKJZ1kjU5e7yXjU1EnXbTWiVP3yOPi07ZXm+DatgIRflI90V9
	wkJlvTk48GTDsdMB4hO9cCOZ3dMSSesQQjgqkVBsTxVgg3KrOuWyJ2XH66f9VlpLYVV7JCzzg8+SZ
	rGd9LFx/GJMSA9vXSN+Y1uK4JjckG06x12nvvzGR8yTBvKOZ4tBhUXJP237MAz+pTYOmVFDD7YWkK
	XEpuj0+DX1TbyoVtQ+7VOYpcW/HF1YA6+o2rrq6OXL2V+9TCXVp0E6cTDpe03wnKsosEXdmm6dNIu
	UQD7K4DJkXRnR4bKxaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdC0-0000000EvHd-3trD;
	Sun, 01 Nov 2026 21:34:20 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdBy-0000000EvH8-2rwo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=HXvfofxYK0mJLvb5JZvTcm44cflpu/Uk4OWCfdYMWE4=; t=1793568858; x=1794778458; 
	b=9UVX1KpvbjZHoccxFDnE4VtMAp896QaqvNxOGUNP3i10/6HB6FLVHoBZmYObQbHPFhya40fEdAm
	rT+KR67EE6ElAJaEBYoA0TkaNWiIT2bQ52VXo9TRgS1wJ64SgQyfajWy7A8RrLm4UwrCLrOu9JJJV
	XF3FuSQzLQHZFWO/+fNcz1j4d9YylsF1cq3WLN56np2EzNsLNy3cV5FIaVxjxgZTd2k279CtRn8Bn
	v8QUUJ1Hv2wfMEznerLXuoSE5Lop+oIljo4FCCMJ0kdkh2uauitHj8/i9XTYeVvjRp6B5uOrYfALE
	J89QrSFmzJc6vJLW/OA3HSfrliZcUsJIgPqQ==;
Date: Sun, 1 Nov 2026 22:34:10 +0100
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
Subject: Re: [PATCH v2 9/9] ARM: dts: omap: dm8168-evm: enable MUSB
 multipoint support
Message-ID: <20261101223410.25cc6477@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-9-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-9-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_133418_729734_0C90DD08 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, 28 Oct 2026 17:06:10 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Christopher Obbard <christopher.obbard@linaro.org>
> 
> The DM8168 USB controllers are used in host mode and must advertise
> multipoint support to the MUSB core. Without this the kernel disables
> external hub support and warns:
> 
>     musb-hdrc: kernel must disable external hubs, please fix the
> 	configuration
> 
> On the affected board this also prevents devices from enumerating
> reliably, with descriptor reads failing with -EPROTO:
> 
>     usb 1-1: device descriptor read/all, error -71
> 
> Set mentor,multipoint to the default value of 1 for both MUSB instances.
> With this enabled, USB devices enumerate successfully on the host ports.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> index a6d42766a496..4b4e4d850231 100644
> --- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
> @@ -198,17 +198,14 @@ &mmc1 {
>  	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
>  };
>  
> -/* At least dm8168-evm rev c won't support multipoint, later may */
>  &usb0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&usb0_pins>;
> -	mentor,multipoint = <0>;
>  };
>  
>  &usb1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&usb1_pins>;
> -	mentor,multipoint = <0>;
>  };
>  
>  &sata {
> 


