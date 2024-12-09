Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3E2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4J8jJJHEZp5k7pCfGlCabFqHA1ye2wNdFA0i4ey5Ts=; b=wxynV3/E8jroqsQSgwcnrFes0t
	87qTPIak51e6uH5HLAnwk/QNoYWBDMyBoghTyswMZPa8wrZvVD3rtsNdFixuW2TtP06hkkDoM+65C
	LGKjnZeiojSu1zrX8NWF+dYrMcgeW6s4KB1xffb7tYB0UIMs9E0CiyP6qp+C8loqVJ+AAzwNNAjK8
	NWrMU3zRmcI+uXuAsquPhCjctWElbLRFvairYbM/0Om9DO5Q3pOYzfKHf4+5w12Jzvcmscmq5WrsY
	A60y8hAYGxVPys6j6COeIH0SCfrcYp69carYCVtOS7agB1TG+Q5Jub22h30NDXUWrciES3KE5AUnC
	ibbiRWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdld-00000007yIv-10z3;
	Mon, 09 Dec 2024 13:25:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdZK-00000007uOr-3UAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:12:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85407A40321;
	Mon,  9 Dec 2024 13:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCCBC4CEE0;
	Mon,  9 Dec 2024 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749977;
	bh=wtt4YzjAc8RnxByK3Ro2ZvCNJOBCvnHq9hYtTBhLeOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJl7WhjDi/BWxqxPsHlk4v4npIJnpP1x4xwpteoef21w+K7CnesovMMWnbdTyIEho
	 AfJTx8b78PjN/6tvL6nu+NrTUONSTznf841w5fTNAisJAZav0u+zlKrUTtv2nwKUIF
	 ArSJyIFziJT7mJEg7hUprwIp8X9JTX3OiQ9LM08kbJxLF0jObClNE2gyxDEQyoAAAY
	 gut6DotkQq5Ee57xa/+LUHv6l3onXN1p1BcOSgNT+z7nUI5G1bSOS/W9vQAAFeu50j
	 FBK2VWjyekwx4VtnyKXWLTLOEFPKQlw1aOMlqKU8hgZMXt0h+o9s4VvqH8xOjZvakU
	 ZFxSkDGeRN0qQ==
Date: Mon, 9 Dec 2024 13:12:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
Message-ID: <c05f6ad8-2dc1-4ddb-b9c1-b2cddfe78819@sirena.org.uk>
References: <20241209105237.10498-1-o451686892@gmail.com>
 <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
 <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxzs0bX2niMoeW8l"
Content-Disposition: inline
In-Reply-To: <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_051258_933242_F88341E5 
X-CRM114-Status: GOOD (  16.91  )
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


--vxzs0bX2niMoeW8l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2024 at 08:51:28PM +0800, Weizhao Ouyang wrote:
> On Mon, Dec 9, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > >       // Set SVCR if we're doing SME
> > > -     cbz     x1, 1f
> > >       adrp    x2, svcr_in
> > >       ldr     x2, [x2, :lo12:svcr_in]
> > > +     cbz     x1, 1f
> > >       msr     S3_3_C4_C2_2, x2

> > This is against an older verison of the code so wouldn't apply now.
> > It's not also checking the value of SVCR, this is checking the SME flag
> > the check is against x1.

> This patch aims to fix the second check (SVCR_ZA_SHIFT) instead of
> the first one (the x1 SME flag you're referring to):

If we don't have SME we should be skipping over all the SME code and
never even looking at the value of SVCR.  Looking at the current version
of the code it does that, it branches to check_sve_in if SME is not
enabled.

--vxzs0bX2niMoeW8l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW7NQACgkQJNaLcl1U
h9Aq4Qf/Qg9p9l/NYKL8pF+MdwSLjxV0TtHVO294pRrIAlItPtbqpVocz9DV28ye
+vJfxK0cNGHLqaL1gnR/uBSmfhx37MFt8JYwuBl7+bI7THOI5B5jvM4aYQX7Ohpa
0RcrJak6NhWjaa7+Ro4GNl0Th9f6DrskXSrIkEWvuruiUfKzahUmed4WFVZM9mZK
+UnQxxZ2U7Cp+vx+ZTPGB0WcKT4W3ojoctJ0rBOmZP7/DDyX3Mz/f3R+JYyFpJNw
KaYtD6qeNsU2sRtOFDOytZ0534PeN2+rZOPJvfp7/wbW9V4C9Pz29YfbP47bUks7
2nyIY1pfoOUmkB0MwY7sb1PTnWwBnw==
=odYv
-----END PGP SIGNATURE-----

--vxzs0bX2niMoeW8l--

