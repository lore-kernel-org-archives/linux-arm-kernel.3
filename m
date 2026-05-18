Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F88CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCIIJPedrSN9Nbfy8rMYwb7u5VqcNWKHuQcBf8AmRZs=; b=t79ax7QbCYXRMnfrm15FXijC7E
	TJxIoQn4r0mDWIBYT7dKV+i5tda72b155nb1zVdF4QpeOJFeVg1xRXxyELOTWNj5CpGKOy4DoRMPc
	1fY4vyTCAyhUAbW9yjBcJOyiBPlauv9tol1YBhTkqKJkIAwpGgIGwKyWTKrR31MbMk4XAFIJjZVhW
	D+88t2gFAH1dS7PB9TfRbqX7AuOy0j5HyY+B9y1cOjPuF4pON5Nd+USP/4NdteKfmrzG8ucEg3zde
	R+o1zklcWaQGoQ8yGtkWQAB74nIuopNVOPpTUciZE9xZ0KkZrrM410XQm0fsRzKCEMhEX2dzRPZ+l
	O9ev7X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrll-0000000ETPt-1GFr;
	Mon, 18 May 2026 06:48:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrli-0000000ETPK-3Dpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779086880;
	bh=yCIIJPedrSN9Nbfy8rMYwb7u5VqcNWKHuQcBf8AmRZs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rhb6Eg43fawS7KulytVw/afj3ttEg0nj3SdwaLqNePcoGJiVmQr7INEVY36wTkGpf
	 7gRk0gNebpLCaOTnAJiPe+S0NaFc7mQyCnDuHM+bly+eEScA2MdswmAL6H1NU0X67b
	 ffimn4S+Q0l0fbYRmip4G3GnylimDSmBH0o27rE5YGsEvnb/NbVVTbW3B1D09023S+
	 qslXNV4KhzfDQF5kVJDLAnOHmjTCd3rl5hVUm2a6/tvU3KE5oz0tSILFBbpMIxCYPV
	 ick4TLd4wrTDm8aYIM9jQrFzneghHldyF11c/Q2eTPrsW7IlBKvT3P5mlJeV+1H0iX
	 4RPpGvf0sFUHw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 547616025D;
	Mon, 18 May 2026 14:48:00 +0800 (AWST)
Message-ID: <bae3a186da639118d88ad2632c5edf8963946dc1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: name EDSFF and thermtrip
 SGPIO lines
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rex.Fu@amd.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:17:59 +0930
In-Reply-To: <20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com>
References: <20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_234803_006184_680D6AAF 
X-CRM114-Status: GOOD (  15.02  )
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

Hello Rex,

On Thu, 2026-04-30 at 13:44 +0800, Rex Fu via B4 Relay wrote:
> From: Rex Fu <Rex.Fu@amd.com>
>=20
> Name the Anacapa SGPIO lines used for EDSFF power-good and thermtrip
> assertion signals.
>=20
> The affected lines replace legacy
>=20

Which are legacy?

>  or unused=C2=A0
>=20

Which are unused?

> CPU-related names with the
> platform signal names used by userspace monitoring.

This is the kind of change that has the potential to break old
userspace. Why is it appropriate? I'd like a more precise discussion in
the commit message.

Was there some other underlying change (e.g. a new revision of the
platform design)?

Andrew

>=20
> Signed-off-by: Rex Fu <Rex.Fu@amd.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 +++++=
-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 2cb7bd128d24..fe960bb7bc27 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -912,7 +912,7 @@ &sgpiom0 {
> =C2=A0	"PWRGD_PVDDIO_P0", "",
> =C2=A0	"PWRGD_PVDDIO_MEM_S3_P0", "",
> =C2=A0	"PWRGD_CHMP_CPU0_FPGA", "",
> -	"PWRGD_CHIL_CPU0_FPGA", "",
> +	"HPM_EDSFF_PG", "",
> =C2=A0	"PWRGD_CHEH_CPU0_FPGA", "",
> =C2=A0	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
> =C2=A0	"", "",
> @@ -957,8 +957,8 @@ &sgpiom0 {
> =C2=A0	"PDB_ALERT_R_N", "",
> =C2=A0
> =C2=A0	/* L0-L7 line 176-191 */
> -	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
> -	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
> +	"L_EDSFF2_PG", "", "L_EDSFF3_PG", "",
> +	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
> =C2=A0	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
> =C2=A0	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
> =C2=A0
> @@ -984,8 +984,8 @@ &sgpiom0 {
> =C2=A0	"HPM_PWR_FAIL", "Port80_b0",
> =C2=A0	"FM_DIMM_IP_FAIL", "Port80_b1",
> =C2=A0	"FM_DIMM_AH_FAIL", "Port80_b2",
> -	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
> -	"FM_CPU0_THERMTRIP_N", "Port80_b4",
> +	"AMC_THERMTRIP_ASSERT", "Port80_b3",
> +	"CPU_THERMTRIP_ASSERT", "Port80_b4",
> =C2=A0	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
> =C2=A0	"CPLD_SGPIO_RDY", "Port80_b6",
> =C2=A0	"", "Port80_b7",
>=20
> ---
> base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
> change-id: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
>=20
> Best regards,
> --=C2=A0=20
> Rex Fu <Rex.Fu@amd.com>
>=20

