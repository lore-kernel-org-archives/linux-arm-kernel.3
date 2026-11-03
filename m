Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=irC59qK3;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TO0ObZPI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=; b=irC59qK3aACOHOHnFTpfYIlGL3
	PVZSEOoRXbKxCYrcArDKLq6bGn2b4twWAWCB8qybiS2M4eCd6FIiKBe/KdjMk8KPO9Tep37VxOFS+
	jvUbZD9/3MkuHT85sEJOPuGukxSYYLeY/y5gupRN9Lz2SehVseDywU3I0fEMtK8rHrjySK1aUccsM
	kYMGzoMBRd45aYLk5wMCMoFPzkwEtydDH2v4E0/3LEz9qtpAibfi6RK7IZyEuH25BTIX/LvvQDoYt
	6+yPOCJjkD0Z+/suGnF5zXCHETV6MTCPOvtdgCyPPqNZAkfhWDMAYitxfcRzpr3BN4zPESFn8yJTD
	8UIoLslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4Ia-00000000sXI-1Cb7;
	Tue, 03 Nov 2026 02:30:56 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4IX-00000000sWP-2lOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:30:55 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-93f2049ea7aso271779985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793673052; x=1794277852; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=TO0ObZPIfO8ytd1FfQgKmoV2GGROzw1Syz9uNS4MUctWHf1hU/s2hEfK+DAgn8o8Dd
         xpzcmZDNOnn1wB9meAGoTimlZkbuyB5Fc6A19aREfp28srTtdk7/78m3gcaHQNiAyklB
         ILYP1UGnOBmk9/a9a2UaJdyNE1p58twE+BSx1/ESY2KvgRX3XsXG6o69PCv0N8X8kHF6
         eaX4TBPtYRz29BJPhxRDa1ScVUZvk24bR6hXG3WCQezjSQF95DkDqjKs+jIxfcDLGMQP
         SSFlVISSD+MzxZl0vcEVTv3ZgkQCXQjbyVpF3jpjBL9ot0MoQU7/jvtf8yUgC/dnwvo8
         jF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673052; x=1794277852;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=k8HGNmqs3cS0k4HqsC5vBvrUXzSNGQWKuHydHkHaVyYt5SLQ5iLyDwE22l1hHr+qLE
         9KK1hhUSt/h5+m4nYSn9cqTuXxXlBBd7HgcEPnf0QwrJ1QaCXh93gxCkcaAhK7eliy8g
         +5IrOFz9mhS7ElHYJ9qw8h9pN8AJzBnLqxZ+RaQ1FAla2zllB51JqciIfxU+IeUKNF1S
         f/BC95helohkKdKVXbdgM/65ytt8duW9yI1msFMlhgJCnA6eSTzpD/ZJRtatRc+xRMfs
         I5YD/JAKHfJITLaGljm967NSF2cvSk5/pqqyGBEUkBChVSrRcQyGmvLQgi4hoQQU6W7i
         m/+g==
X-Forwarded-Encrypted: i=1; AKwUvByP/V0xs+GjjWvpwpqj8yQ9DYxzmZt44ZyZkf8PkHzYGLjSmAghZChB6P95BVNKkl3O8jqB87qsm2d3kLwzbdKa@lists.infradead.org
X-Gm-Message-State: AFq9FYJC5c3bwMhxsB+37mCu23D1usLtizq+0rntI9QR3n684dMvjRFU
	WtEqX/dYsL/GqPA3I7sLkuwe7EECcKTiuvxPgfFLGtlNUZkahApHsZWCLS8H+xGUPu8=
X-Gm-Gg: AYBFou2CFA5NsYLN+pO9a57s4eAjy9mjXr1AbUQvHsQkVqTB55RxHzwawkdJasSXNgV
	ZAjSb/n9v2S8tXSu05iNwoEnyW4cbttQMafU2f/rHTDc5BSFUBidYWPvmGjOCHKAnLTjopRFu4V
	dikCR9uD3Xy3fmtU25hdd5ZCDPKoQfIGzn2bXdEhubfPUPsUZFCMc9zAqDYfarfKf+mDkmSiJLB
	od0J2WSckdgLBDN3PzjA1sUDFiKY+x79r/zztOKaJzoOyL2OdPqfI4I1Y/JYR/D61it0uO9gzIA
	iEHSlZU5N8xQpxx1mE1YOgJ3ZvbtXRIuZvCDlQIeJvRbJe5YaUOLXaCMz15Xi/IUvoTzSest5/n
	4ZDNG0otJU3Z0oOVx2FyQWRxuRQ1U3ksPtWq1bkKU5/lgpecxEdLppF5qlO+BEZasCncOWc/wRl
	FTCD7SGHlEe0f8jjoGNbJIdf3eWtGQyFGFxuulb0lnZixSHJCKFH+LgkhPi0Kg2EQ8HTC8KNz8S
	Y9dMM1Mx8TtCoASVYgUwQkl7Bt7tD3Dk445qAI2GRYkE68FUskGDbSioE/JoA+YMP+Kup5iuzj/
	ic/mzpn1J/xlF4zOp7hKwQ4ehU2FGDo1LllfXfA441pf+NzskwofJRU=
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr1959639885a.14.1793673051964;
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ae7f53sm964496885a.41.2026.11.02.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Message-ID: <69827153a6b0f3b863ebd764645efe0dc2fda6b9.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Quentin Schulz <foss+kernel@0leil.net>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael
 Riesch	 <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Date: Mon, 02 Nov 2026 21:30:49 -0500
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
	 <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-PyPL7slarfAow59TTGqi"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_183053_992246_83DDA72E 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-PyPL7slarfAow59TTGqi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 21:22 +0100, Quentin Schulz a =C3=A9crit=
=C2=A0:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Add Y10 format to the v4l2_format_info table.
>=20
> Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-PyPL7slarfAow59TTGqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaulHWQAKCRDZQZRRKWBy
9PIyAQCt+smxAv2SEhjb0K1aod+ajV5VdSqoZA6d/mIWZv+ihQD/UjLohcJqLbkz
k6t3aQWhYB2RTbM8wRfVMsnXdYFJ5QM=
=W+rh
-----END PGP SIGNATURE-----

--=-PyPL7slarfAow59TTGqi--

