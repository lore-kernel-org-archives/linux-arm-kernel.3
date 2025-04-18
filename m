Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0014C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OafISoZhUhaEdsm2ZGrUseT8G1TVaT2AMpMVzxR8MWo=; b=AnImUeQUtqfcfIbyK5n5TTR9aq
	GGj4DBhe1YRUPW8wCvtdPvAlD2lorRPlOzNh44+Zt38VqJ4OJVxpbrfcxVPBEuvjtzuoEzsHdvOBF
	vZPhYAVXd7QnB8wpQHaHsKPZtMZ2EytS73mQIfmoLCtrDp1Gk7rwMbPCLvsrrbWqvQ8tzOPidF7F5
	H/Y8smVT/GtAWkWFWslcxvLHN8FOmtvHGKxT4fhA79tOhAujHTCQEsuwPte+roeJHDEtpdY6vWdfp
	J5HmR3qHqvMlcb7ypAOarNoJIzURoOTwrSIXmYjujCJ32zkaQSW3RZVI+uGD1csiM0nKFjQl90p5u
	JfF0/M/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pGa-0000000HAas-2xrp;
	Fri, 18 Apr 2025 17:12:40 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5p03-0000000H6ag-16uH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:55:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7952101BF2CB;
	Fri, 18 Apr 2025 18:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744995331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OafISoZhUhaEdsm2ZGrUseT8G1TVaT2AMpMVzxR8MWo=;
	b=c3/dltMH4hlPIX+EfxsFOfBkPLfU7ngh6Cln6oMIOPzvexs+YdePGXkMNBFe53ZtN4K2Up
	XoK9kcLw6S0HrCHjwbE1gYP10KoAZGnnrIIi4NeACtYZ9Z3VRxO0IFK6Ra1hRTITPqVsVr
	whZFwNRzMgk5rI5PlkWU8YxGsWVeMWLPbeQu1fQp8fWulsROIawbUafxSt03KOc0MuA/eD
	uEhKjT7qt21Z4Ob5oaon6w8uigPJby+gDOejE2nGTv6Ljqtl/cnk867fxx1CtUZZPXLleq
	VZD44fCa0wkaub5JLrhxLec6WMI23OgAox/tKi2eR9CwxVjMWPZjURGBFhvraQ==
Date: Fri, 18 Apr 2025 18:55:23 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	mark.rutland@arm.com, oliver.upton@linux.dev,
	shameerali.kolothum.thodi@huawei.com, maz@kernel.org,
	bwicaksono@nvidia.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.10 4/6] arm64: cputype: Add
 QCOM_CPU_PART_KRYO_3XX_GOLD
Message-ID: <aAKD+zsLwx8pBSOE@duo.ucw.cz>
References: <20250331143710.1686600-1-sashal@kernel.org>
 <20250331143710.1686600-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uRtdoxvThh96Le0+"
Content-Disposition: inline
In-Reply-To: <20250331143710.1686600-4-sashal@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_095535_449998_A2BB95A8 
X-CRM114-Status: GOOD (  10.52  )
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


--uRtdoxvThh96Le0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Douglas Anderson <dianders@chromium.org>
>=20
> [ Upstream commit 401c3333bb2396aa52e4121887a6f6a6e2f040bc ]
>=20
> Add a definition for the Qualcomm Kryo 300-series Gold cores.

Why are we adding unused defines to stable?

Best regards,
							Pavel
						=09
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -110,6 +110,7 @@
>  #define QCOM_CPU_PART_KRYO		0x200
>  #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
>  #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
> +#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
>  #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>  #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>  #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
> @@ -167,6 +168,7 @@
>  #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KR=
YO)
>  #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CP=
U_PART_KRYO_2XX_GOLD)
>  #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_=
CPU_PART_KRYO_2XX_SILVER)
> +#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CP=
U_PART_KRYO_3XX_GOLD)
>  #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_=
CPU_PART_KRYO_3XX_SILVER)
>  #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CP=
U_PART_KRYO_4XX_GOLD)
>  #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_=
CPU_PART_KRYO_4XX_SILVER)

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--uRtdoxvThh96Le0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAKD+wAKCRAw5/Bqldv6
8vZoAJ48zepYUTrWWvdYAtCXSQLoJtQE6ACfaD0JqwHWYDyjSqLDbgMAk6ef6+w=
=QQCx
-----END PGP SIGNATURE-----

--uRtdoxvThh96Le0+--

