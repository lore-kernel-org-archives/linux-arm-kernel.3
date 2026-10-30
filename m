Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95279606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WoswPWPR;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=GGswo4Q7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3oAdiQL1BBq/8Wx7+7+nnqKAavDIGqolwKSp3zNe53I=; b=WoswPWPRZ59B0l
	wR/Zo/lrpTZ7X993aamHrmec2TPF7vVDiBkxjH4Sw8oT8ZMMJMpwQSLQFU9/hvmjVkhIQVCaw0Ppm
	Tp+oXn6t93VWwd31sw4ax2/8TQ3tLj6exuH5jSmC54xb5uq3FJIRijCGoaFow5jnsLzM320M9Z8Ua
	c4wz+huyE+jc+BqQrenSCrugHE9DiIqXwut3SFMPsNXUmsT9Mb35de/0ti3fRSRLJdXPYTa7xg0n+
	qzDKjyTsWyC6Nu2lw5R4tNKT/+N3MifeKYRZJCEO7hE6JMa1kzbesqiPNWetDs9QnvRfUk1XqUGnZ
	BGtOZZiUAcAL8nMwew9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlOI-0000000Be9J-1voy;
	Fri, 30 Oct 2026 12:07:26 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlOF-0000000Be8g-31DT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=3oAdiQL1BBq/8Wx7+7+nnqKAavDIGqolwKSp3zNe53I=; t=1793362043; x=1794571643; 
	b=GGswo4Q7HNBjO4TfOrDi533WVeLpu59cRClXWYh0gpDWgaqTjoYJnO8+pvf6UcH2rLHZKbThxQq
	viNF6E6i5bqdgDSES5G929idm8vQjuxXFaqnVQhyT2TTBQJf6sBc7dVQ7vRtt408Jn6Nl9JEa3riK
	U5YbTj4tUKJSv2xNTJd5ea/AGHKN53vsxRBdRfGfJW31LtKHmk5ZqQMUdEW8vUN6zuN+48ZSmbwa9
	0We4Q4+JbchU/sTlIA6kNimHCLaIYpLaSZi7+nZNv7bDc8u73tomUSG+FEZPhpc1sU/AYoTR8CX/j
	bQjBbtCZli+pQXsLyE70BKEN36sIlIKxEQEg==;
Date: Fri, 30 Oct 2026 13:07:13 +0100
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
Subject: Re: [PATCH v2 7/9] ARM: dts: omap: dm816x: Remove hwmod code for
 USB
Message-ID: <20261030130713.3a404d50@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-7-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-7-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_050723_803476_5FF9FC0A 
X-CRM114-Status: GOOD (  24.52  )
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

On Wed, 28 Oct 2026 17:06:08 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> Remove the hwmod property from the USB controller node and the matching
> code from the hwmod data file as this is now deprecated.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi      |  1 -
>  arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
>  2 files changed, 22 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index b839ee29e9eb..55f4b91fa1fc 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -576,7 +576,6 @@ uart3: serial@48024000 {
>  		/* NOTE: USB needs a transceiver driver for phys to work */
>  		usb: target-module@47400000 {
>  			compatible = "ti,sysc-omap4", "ti,sysc";
> -			ti,hwmods = "usb_otg_hs";
>  			reg = <0x47400000 0x4>,
>  			      <0x47400010 0x4>;
>  			reg-names = "rev", "sysc";

As I have also some hwmod -> ti-sysc conversions cooking, I think I have
an idea why you put these two in one file. Doing this in lockstep should
be justified in the commit message.

I guess you have removed this and seem a fat WARN().
Analyzing omap_hwmod.c I found that every module action is guarded by
if (oh->_state != _HWMOD_STATE_INITIALIZED)
So I think it is time to just denoise that WARN(), since the
originial authors probably did not have ti-sysc conversion in mind.
I will prepare a patch for that. But then you can add that snippet to patch 6.

While merging this patches we just have to ensure that the hwmod removal
comes after adding ti,sysc stuff.

Regards,
Andreas

> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> index 9b5c728fb7da..b9735b507d6b 100644
> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> @@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
>  	.user		= OCP_USER_MPU,
>  };
>  
> -static struct omap_hwmod dm816x_usbss_hwmod = {
> -	.name		= "usb_otg_hs",
> -	.clkdm_name	= "default_l3_slow_clkdm",
> -	.main_clk	= "sysclk6_ck",
> -	.prcm		= {
> -		.omap4 = {
> -			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
> -			.modulemode = MODULEMODE_SWCTRL,
> -		},
> -	},
> -	.class		= &dm81xx_usbotg_class,
> -};
> -
> -static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
> -	.master		= &dm81xx_default_l3_slow_hwmod,
> -	.slave		= &dm816x_usbss_hwmod,
> -	.clk		= "sysclk6_ck",
> -	.user		= OCP_USER_MPU,
> -};
> -
>  static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
>  	.rev_offs	= 0x0000,
>  	.sysc_offs	= 0x0010,
> @@ -1250,7 +1230,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
>  	&dm816x_l4_hs__emac1,
>  	&dm81xx_l4_hs__sata,
>  	&dm81xx_alwon_l3_slow__gpmc,
> -	&dm816x_default_l3_slow__usbss,
>  	NULL,
>  };
>  
> 


