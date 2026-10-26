Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5K+8n3Q;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=jkx8cX5T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=; b=F5K+8n3QuRLSCF
	gf2VFi+KQzPCJAIQriNenskrv5j3fabpDlLyVJNH5PzrpVLSbwUFjZPveLvlbHOC8O6g3R16ZD7Zl
	jwJ8CARFNRGAq+e7grWFHdbJDmYcQOrhLjYyjyb1ijv2xd03BkYjGVmlEeBTrbLgcsoP3z0qAE/kd
	wrehW2qC63/4vLCgN/SSxQJCUfkjYNrQ6xCti0rV2KYyTwMey7lzGa3aAIYfKywqZcyl+CDbiXYl6
	P1Cg11/v46sZasFV7NLFtEW18UZ+P5RnCGVP5TjEdpsIM8f59yw9aQTi2V/LQesLiuvCJUjIZGiJO
	rY/GpTSI59L3pWSY/pYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFAw-00000001qWi-1sdh;
	Mon, 26 Oct 2026 07:31:22 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFAu-00000001qWN-2O6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 07:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=; t=1792999880; x=1794209480; 
	b=jkx8cX5TqdslkSVURbL0MWV0xb5pukNs3MzS8HWt8XufweME7v6ygn5K7YYcRInQG2RkaPlhGKg
	GkkQpcsilI0IJGe8M73987MTlZ1Iq3iY3XocPtrF69uhrBrEmL+WLQdJ3V1GxBTOhH6v1FQsAeSZr
	zOITrey94NT4ScohR8UFTvDUAFGniyte2qois7kXBZiKvbTg81g1GYBt7fKz9h1ZXRyNnkNljECmE
	ksSL+Y+OqlK+Tfu7iqthNccuSW7pkRSWEZyvS27qmRdu4Zn51IJ0M0ixacY5aONw/GQTZfuani7bJ
	BN/Y0X0fx6FpGs5f/ez+4fSNprj2onw3zX5A==;
Date: Mon, 26 Oct 2026 08:30:58 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Message-ID: <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026003918.155321-2-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_003120_635004_7CEB222E 
X-CRM114-Status: GOOD (  18.14  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 00:39:12 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> always-on before the driver stops doing it.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
>  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> index dc7ff108aa85..bd9c6c6fa117 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -154,6 +154,7 @@ sy7636: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  			};
>  		};
>  	};
No, please not. That regulator is in practice used with a not yet upstreamed
driver for the EPDC on that platform used to deal with the current kernels
fp9931 / tps65185 drivers. So it is very welcome to have it not always turned
on.


> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> index ff9d50942884..6cf5603c0752 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  				regulator-boot-on;
>  			};
>  		};


Here the situation is a bit different. If I remember correctly, there
is some special EPD logic in userspace on top of some ordinary kernel
display driver. But thesse things are missing is devicetree?! But
that might need to learn to deal with regulator enabling/disabling.

Regulator always on is probably not desired here, either.

Regards,
Andreas

