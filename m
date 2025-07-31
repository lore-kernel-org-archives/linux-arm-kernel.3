Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6957C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=; b=GWEuzZHaMFuei0qcq1fot7KyvU
	hj4TQfyH8mmEgtRJL5j0d8AYp8d3vGV2CENkDqGv1XB88X6sag/HqI6zzFp8zNz21Py5L0SKmyybp
	F0o8CDQi+6cx7I4fuIPrKJHsQDkg8JyQAeqsHGDxpnnMg8FvJX7uj5RKF3a/j+CLE4UHGmoG28SMf
	H6K4b9nC2ET3CY52MLqA8FtodS+uQlUbSiVD4yahvm4HPToUIA7eTyRSapOS9DwJEQRLDBM38EzDV
	cOcYLquYjfaA+0abRljCZo3n1K8acmubEXSwCUkZQjZpe73jcs17oh8A0aoyaT0DZOF67QvADbgNE
	tBto2SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWGQ-000000045NB-0vNU;
	Thu, 31 Jul 2025 16:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWDL-00000004543-29JP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 31 Jul 2025 16:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=; b=k+xSNNT7KneuEORin2ZDvE9Oh0
	KrJCG7ScPasa17cKRewOYM+2iOp8/GhUP7GZQEVqhzBYQNkS7ULJ5b29Qi+StyUa4eIRJQrryIL8U
	mMi/rUHNwhIVW41KlapQAyBF1quDHLiW5clGaCTNkwCth3KdhGngQ1A6Win7cVCgD0eagZ3FH6584
	WPbWAYDvcDhuTRqTfBkx2e4hWRg/EzDJTC5x1SHnOzkLut4x6+OaaGtVGuXzpZ0Yi3ATXl2S1AXW7
	Zbg2hdZFmI7vY9BlvxOe1Z2sYF9hljPqK+UJuxM20Ix7xtYEByeewEml6r7qqW4sQLDrQhQ6OCAQ+
	5o3xUR4w==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWDH-0000000D6VE-31WS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:33:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4561607166aso8189535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979582; x=1754584382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=nXvg0mXz+U6Fs12ho8QSlXB3yjmN4bNHEaoESguR1Wv/S7sAAEHcJvwhsrX8v9MkNF
         TZet88Nx00J5zIXo+mogvRZjfIucuvpmA2jzyuX+QHhJopMs/kJa0IwJ0jeEGwwpb2S+
         kpeAKBh1AOTfOJUh5f73JNaL0TaGqtnR8yVMU9n7TaLyzq3FQOS94SMycOfZXCnAul+h
         3J/oopGaX6dqiSPXjaNP+TDKiZhxgycTpAlgJ9nLsiU519ZgITeFsfTw+cx+yP3N1VPt
         SABDqm62mH2jBzcSuR3ktFnA7EiCmN8Bynj0RItS7eUIv1H28wUp7nsMXoQy27qlXmrD
         uyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979582; x=1754584382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=oGDwVkPdKsfTCQw4bPClWox3h+ojm3oqZ7bYy1gY42L07fjMSSNZ93j7zXjXi928p7
         tqh1GTCPMvh2rqy/6BospY1/W0TnGeTlgpMwniMhvI5Ckf0arHoSjXhl9MkZ7xT6KSep
         mO9SRaITFuXYW7ND7dOGI/nBlEgu5qw3HML93Vj1+T03ew07SErLPIwoz1LcAikn6lRo
         scsmoQiH3R9SW+nkaweklRAj1XuIyI/qNLyeYxRLPd2KgD+Gc0ANwKpyaeBTKXTcDf+A
         BqZ0nzkusKbl+yfPOoKXh+uV4ucjMZOH3iCYfGtwYYZN/ohTGd+9UwEF9v2ji08U+GXP
         pteg==
X-Forwarded-Encrypted: i=1; AJvYcCVBDu0vUP+xjVT2tjLel7SCjUW8cMzPqJtPD1IQFw54otGHLNty3cJNXoudDq96xdrt0JKbEzx5maf0aKnG+UIT@lists.infradead.org
X-Gm-Message-State: AOJu0YwftpebUHmm/DX14i7VsyXTKOOfbgNvIRPmao41Ok2cT6i/zMZQ
	YQhkhExFDfJIpE3IUBRkT1PFxXGFZMdOn++qxH2N6U7kR2Z0ZABFpJIl
X-Gm-Gg: ASbGnctt9xY563+AluKPfhNPLFGWP3ItZA35mqJqkOkhPP0G87E3QcUPO67eUD5HIJg
	CLHGEKLxLnezb25FEi6FaAq2tnhP4ELHmC9YDXiP7UuVdwbF9B5zIVEKovAA9RLeQ/uDI9eRmnj
	ytkziiem9MzKuE/JJ4mOu+1CncnG8i8CbFj5MHI/JmPlufab7ohgX8JgtWnEpDYjfQaiUxl59Ql
	o8eywxMmhJ6yApOocNcpSx6YUEHDgUo5keF7tmx1ZJBf6v8huUgN1SbMYfpa5c93Vkq/dLbgRXs
	4ev/FqDBWsKiDzrD9xeczDqchEzuVlnN9dxZWOmMqi+oa7amFXhMaNHq78cRORNXnya9TeUT6p6
	+aYKQDvYcwKVig+Yw/wI4Q6LvNW8YH3zBQq0SxEJDlewNXT2aURsbS1uODULbUBKAy30t5f9zdH
	wVbSF9tqDu
X-Google-Smtp-Source: AGHT+IE42z7i7CovswTO03kEARLVTHTFnCJDTexv2D207gRXY26yhBPPOm+9zcqlKYN2OgVEMQVr4A==
X-Received: by 2002:a05:600c:4fd3:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45892bd1a95mr70310155e9.26.1753979581888;
        Thu, 31 Jul 2025 09:33:01 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm77810615e9.4.2025.07.31.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:33:00 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:32:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <llqwla5x22fmhktolfyfmfkeur5z46v7j54mr6bkxm3i7avwqu@57kwpnif3zjv>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
 <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
 <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyb25h5bm2euygmp"
Content-Disposition: inline
In-Reply-To: <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_173303_919511_7C4FF14F 
X-CRM114-Status: GOOD (  19.87  )
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


--dyb25h5bm2euygmp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Thu, Jul 24, 2025 at 02:17:08PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 22, 2025, at 14:21, Thierry Reding wrote:
> > On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> >> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269=
b:
> >>=20
> >>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47=
 +0200)
> >
> > Hi Arnd,
> >
> > it looks like you haven't pulled this yet, in which case, please hold
> > off for a little. There's a missing dependency on another branch, so I
> > need to redo this. I'll send an updated pull request ASAP.
> >
>=20
> Sorry I missed your message here and ended up pulling v1, which now
> conflicted with v2. Can you change v2 into an incremental series instead?

Sorry for the delay on this, things got a bit complicated as I was
trying to untangle everything. I've now sent v3 of the DT changes which
is effectively v2 without the dependency and with a patch on top to get
it incrementally towards what v2 was.

I've also sent v2 of the DT bindings changes which are needed to resolve
a DT validation issue for the new Tegra264 files.

Thanks,
Thierry

--dyb25h5bm2euygmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiLmroACgkQ3SOs138+
s6HtAQ//eSz+Bw+2b0FTb/6yzmbLV8BKO4lC7yIl+7FhjfmORCS05Fp7e1QRjuPS
bbAl5I9ubAxMtCG65Av112IIsC1jzy7wGiIKHZlyJ1mCyD6tng//b4TjWoaMZrv9
iIZ6VMuAnd2eBZyIByNOc+y6uTHhT4NQndUpDYuGgAyoZj1KxSaaEFggFJWv02Ej
roINesBhWn0vUJ2tPIq3a3KyyW7ewqV3sdKDJBQRwv1cCTm7MInGFAWZvNI38gPq
D4OPgKin7he9Ys3ksv/oTsRBsJ1U18vqoXIT2pVoc/vFyKc2kxQo6idHzztEdsyS
BzETIFoOG8LCMESiRRPF5ihJYA4hub9L7dVn8qFy9G4gvgyTRvO3ClN8XR4yf+91
NKy1ciKRRd78CAwGvRvyl8Dc7VBSBnTZRvRC6Asp+X9hqiDS3v38zf2ZMfUjRCt2
GrOrq5I/hq6MfTySyFxV6EJaqJqgTshD0NCC1sG7X2DPO10N2A3wfOZNDFFX8Voo
i3y5yAyGHsq+hbzzBOonRDKUFqzp1w4r/A9pjRpxl0fmb4IrlyCqbw/Q0AfxvPdj
ZS/iiiKv4UMrWKmqX9QzlrQqo1uT+1vj7wrMjs19gu5D2jURT7D49XPu6NjLquVD
XFD5ZsecCiFnDnqzkjJl0c1yhdwqjAsbFZIzjJf1IM3cPPvrFn0=
=Us0s
-----END PGP SIGNATURE-----

--dyb25h5bm2euygmp--

