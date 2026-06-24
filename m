Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB750CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwssO+47QsRfChEGZdtxq4U6eIg1dC3mtSSD7D78Iho=; b=g79UpxJ7eRrii4vfAmEXOnS4zc
	1tcb2NdwOTuPadKV0mGJvhDyPGwDkYhdfmQEF66PxTysyEoA0cekQs0Wk9nT8413WF3LSuVUHTczQ
	3KEqo1OzvsZTAqakcxjW8SXFQ1c4gg3tvlTUKbXQMldA4a5IxdVsUj3ASsteL9ilFKZv9NOLPoaIO
	cl9kAQy7Mqe5ttP8wtyjVntUxDbvaMh1WPS6pEeufb7k+CSM7voY6Xo2sc0S3VOFTPQAusyUbQUfX
	1y3KdbYZ229AFnZCk2PwdGGFcioLKFV5s00dmwBPrcKiruOLQj4JqP9WWnPu6V+QO9T7+FR0gGCVq
	eikKv9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHtV-00000007Hzt-49iT;
	Wed, 24 Jun 2026 07:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHtU-00000007Hzn-26SW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:19:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2550C43A08;
	Wed, 24 Jun 2026 07:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CACA1F000E9;
	Wed, 24 Jun 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285572;
	bh=GwssO+47QsRfChEGZdtxq4U6eIg1dC3mtSSD7D78Iho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTSKtRDR6CR2tM9kq4Uwbmjs3NPP2dXNmDh4Y0tQctdlO9Gg4BkKyZshlsX5TIrFV
	 B/bTxNwfTo3Sk2NOrtd5qY1CPkos17mbzuUmMFUsSpELWUUfzj/bJK8MDCLWftHH+J
	 v7Z046URD6DHJEOtTQPtUwy6ZXh9rSavoy+zwlcvn37D6me0fy34X1160PqhHMOZRn
	 K3dfuHLFLgSuMZgv5DGH329hYQtbOuXlX4safZpidz/ngLGq8JK4ydCLRxc9qKB0sp
	 +yiKxPzX0rMPSaJ7ymGlOO5VvzMZysxpBQmc96uQmi0DV550ssAZ9SMpU+bVZPyEKs
	 TZPh4gvnoTejA==
Date: Wed, 24 Jun 2026 09:19:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Message-ID: <20260624-copper-albatross-of-youth-6abae8@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
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

On Tue, Jun 23, 2026 at 02:25:44PM +0000, Gr=C3=A9goire Layet wrote:
> Use the ast2600 compatible string.
> This makes it more precise and enables specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..7c02633f2bd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
> =20
>  			vuart1: serial@1e787000 {
> -				compatible =3D "aspeed,ast2500-vuart";
> +				compatible =3D "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

Please start testing your patches. This for sure fails tests.

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=3D1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sourc=
es-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


