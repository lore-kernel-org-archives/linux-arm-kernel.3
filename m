Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF127CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsOL7gKY95ZlweZ6HtHYMMp/zJ4Jc6WF1IOkPwHyaww=; b=HNy1ZpDhLNEg/Y7hzInOg+Tvos
	1oetbfYSG0OgrZyTDKE9Sixyk+8NF3AzDPmc4IyjsuYujROpUvdiPhDH7OFf+eH1ph0AXHtSZPR+8
	Rg/SEoTjxmvA/J9NUY6BHGSFZTyIsZNNWDmYqU9/dHRaF3BfYZItM3eHzmhJMpDG4FuRLgEc4i0ao
	oqoj03ciodN/UegduItgItVyVGNNBFEg1otykeuWSRTjxTUdjn5SRtUZtLwDrwBAusoce4qKUHO7L
	keqMJlQndALAIE2IhD6ATRH34lk5bck+C64BBWbe/Um+gH13NK5IP9uwUvnJLHMp47N4JWb6URF/C
	SrqFLM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0avK-00000009HI5-3SPx;
	Mon, 22 Sep 2025 07:25:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0avJ-00000009HGb-0Gts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F65344D2E;
	Mon, 22 Sep 2025 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C390C4CEF0;
	Mon, 22 Sep 2025 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758525920;
	bh=bNTfL5I1HrJwgg3RyucnAg9Ny8UlD82CDsINuJPuY4A=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=SdgKRW2IVYV/lYDUogSBPykH4MHszba5CItDyw9gRgpyMnwwTCxXa3jZ3HtZvXwXe
	 /vKehzFEdN7eV6vYCwpmA6iWDc4YEZEsdMiW3k2xZ3UVNHVbjnH5OHUWa44z0DWpuW
	 pZ9iqV3JNI6BYDfrk6it6Wo8b8QkJDziYWCXCvS/OcqgUgAxaXqY4ugZ5ofQ2YrJil
	 ItSxi9QAZtemn4QyX/RdQVo+rZ76fvXBCkLsTeq9ZwwyR0jSOAfvPKZf5UHQI9ZFLt
	 7nAHrZbq1yZyaISv/tndXRg24jCZp1jeWaNy7nUrTMEl5SW4blj/8QTb4mk2y8Rzh9
	 FoVqGJH6uOovQ==
Content-Type: multipart/signed;
 boundary=c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 09:25:16 +0200
Message-Id: <DCZ5ETIF2Z99.39M5HLYLNMX44@kernel.org>
Cc: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <detheridge@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <rs@ti.com>, <afd@ti.com>, <conor+dt@kernel.org>,
 <frank.binns@imgtec.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
 <matt.coster@imgtec.com>, <nm@ti.com>, <robh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
X-Mailer: aerc 0.16.0
References: <20250919193341.707660-2-rs@ti.com>
In-Reply-To: <20250919193341.707660-2-rs@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_002521_131979_C6091F76 
X-CRM114-Status: GOOD (  15.61  )
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

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Update the memory region listed in the k3-am62p.dtsi for the BXS-4-64
> GPU to match the Main Memory Map described in the TRM [1].
>
> [1] https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf
>
> Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> Requirement for the following series:
> https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

On a am62p. am67a/j722s works fine.

>  arch/arm64/boot/dts/ti/k3-am62p.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/t=
i/k3-am62p.dtsi
> index 75a15c368c11..dd24c40c7965 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> @@ -59,7 +59,7 @@ cbass_main: bus@f0000 {
>  			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripher=
al window */
>  			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* Main CPSW */
>  			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x01d20000>, /* Second periphe=
ral window */
> -			 <0x00 0x0fd00000 0x00 0x0fd00000 0x00 0x00020000>, /* GPU */
> +			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
>  			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripher=
al window */
>  			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
>  			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00010100>, /* CSI window */

Given the fact that the GPU node is in the shared
k3-am62p-j722s-common-main.dtsi:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaND53RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jFAgF+PRlVCLYRS7Z0WBq8MkC/8ZmN0RukErWq
OLIEtPIP2HDzCjlfuNJy65XicaYdlNNRAYCLD6F0UYmahHelXHb5Ogh9DeW75zXx
CKsxLOTz+GKkE4PClxcfbsUQWqVCAqtqs04=
=4KGH
-----END PGP SIGNATURE-----

--c997b55b19e805b8d77f671d41ea0560a0177cf2f91277c718c4bd2d2ff8--

