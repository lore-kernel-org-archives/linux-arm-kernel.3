Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08416CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMxpQmTjCQ6YYHFflXj5KI5bPtCqrLFvEvMHOInAGjA=; b=1zajZT3iQebMAgVKJ72JtInfuV
	WTmEo7Lz1ltnKOjCh92qkS9+DhjdZ2tEwuE/Jc0vQA7Y0qcUEExzOATl8y7MextJspQYnK62huYMG
	I156qEoQcCtg4pt22ulJ/aBh+FXDRsZ2LNT7BKckKb6LjasbLd1po+VwVPs8RqjGDnvES2WjvyccU
	lZqE8quH99sZ2Ou3KIGRNsp9eEUqyBt7G5E5H/OADUfLAALfh+UPLgDlu4TpaXt4RV5XsR4YZu4qG
	y0DQuAKGJaJoOYJAiZgGr4DZ6aoA1RAgXNL5fLfZLx5I0/G7mTRN1i/OGapoMmXyDQL5gnRSaXTg3
	XLCGtA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRosz-00000001dBY-49mS;
	Tue, 26 May 2026 10:19:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRosy-00000001dB4-1zg4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:19:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBA0243B74;
	Tue, 26 May 2026 10:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1831F000E9;
	Tue, 26 May 2026 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779790783;
	bh=EMxpQmTjCQ6YYHFflXj5KI5bPtCqrLFvEvMHOInAGjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvOwFLahmsKGzLreqDRyvIkSIuhcPMXsklNZ5PHm9NhzHTLYjwfn5E/uRYB+NZJeH
	 T/Jk+mEYO8a0WZj/Np+770VbTN6QUgy/S3o8IkyKSwKxdOFQsarNsr2Ky/nDDRyY04
	 HwHCYK+e+JWfErkdLRsfQFru6w5lUz0jeSo2WW9mOelHjCHco5CZAE6XuWRE1++RAb
	 js3+2/8MjmCxanHWhzH/M+nng8pyZ8UCqgZ1SKybQO8tdkKdR/0VvQZzE8T3OtHp01
	 5TX7lrUxCz6qA7MwJkOsPaLWXW7gao4NH+y/Rb/ntqTMK1DQKMUx15TUYoV5iDTlKP
	 s98Idt/wW/Irw==
Date: Tue, 26 May 2026 11:19:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Preserve all guest ZCR_EL2.LEN values
Message-ID: <b4fdceb6-5fa7-4829-a60e-6f80f47f032a@sirena.org.uk>
References: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
 <ahSWwl-uCv4ZW-nE@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RL/ZeSeTiUvxwP7H"
Content-Disposition: inline
In-Reply-To: <ahSWwl-uCv4ZW-nE@J2N7QTR9R3>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_031944_536702_B4697A36 
X-CRM114-Status: GOOD (  18.38  )
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


--RL/ZeSeTiUvxwP7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 07:36:50PM +0100, Mark Rutland wrote:
> On Fri, May 22, 2026 at 07:00:04PM +0100, Mark Brown wrote:

> > Since b3d29a823099 ("KVM: arm64: nv: Handle ZCR_EL2 traps") when guests
> > write to ZCR_EL2 we have clamped the value of ZCR_EL2.LEN to be at most
> > that configuring the maximum guest VL. This is not the behaviour the

=2E..

> Have we sought feedback from architects? While I said "*or* the
> architcture requires a clarification", I think it should be clarified
> more explicitly either way given that the pattern is unusual.

> Given this is particularly subtle, please keep me in the loop when
> speaking with architects about this.

TBH it didn't strike me as subtle, I don't see anything in the
architecture which would lead me to expect the current behaviour.  The
psudocode all just has direct assignments for the write and there's
language in the ARM (eg, in the ZCR_EL2 description) saying "for all
purposes other than returning the result of a direct read of ZCR_EL2"
which seems specifically intended to cover there being a divergence
between the written and effective values, though I guess it doesn't
explicitly mention writes in the text. =20

When I saw the code it looked like something KVM was doing for some
KVM reason that was obscure to me, the lack of clarity seemed like it
was on the KVM side.

--RL/ZeSeTiUvxwP7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVc7oACgkQJNaLcl1U
h9C5hQf+Pn14856B4Py7Pz8HRV87FyRnoP8UMgUuC8d7Fz5BC0Xr+U6ugjlgZlry
yjK7eZ3LusILO/1JnPbdZLPuMFDgfKkwaGyDw4tvX+6mw7FZOTZP2+dfow8G7gQs
vE7CE0d8eBBL2mh6updIvf5IxImvyhC8ifSwxMEEt3xp5ROAxISABKA1V4eHJ6mT
ReWoLIonclaNncyt4mJEKzM0zDfL3NrVSmi4XGKKuqOeVGF2xf5c923LZk0/RoRp
nP3rQrOXpMTbikdif5N9SmMyzi2a0BoBN41+24axwLmcAeNeNtkhxy8s5ZlURz/1
pwwqS2hV/zq7pPoXhfVohlIA0XHTkQ==
=k37g
-----END PGP SIGNATURE-----

--RL/ZeSeTiUvxwP7H--

