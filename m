Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23929E7DEFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYLkpRWaYV8x8z9MUU6UtC2OJd7fEAIyh74fGdqvB5o=; b=rOxoaHpoFfuYzm+XlPIWqTHWTv
	xfjFHUDEdVstPROBxEbJCnwnASvpHlXIF+Ecl3uu2xkfkOFA9GvyyuXp5xAJFmRuS3L9fuRvWs1rH
	xu9LHH50YfW7LzDfYWzfZ2gCQU58ln0EOB4VySY26O1fMCyGdHkLgb4Ic41/Q6BAcA84BkH8SpJFc
	9OUBLsV1W2hGEei+e73yQBPe5pLy3Uyip5pD7SavkR6mxpqL7gDX9RgzE4sjRkQV8FSaPaitUClOR
	alvMjv80Z7u9pKUoS+mYhzn54nVzky2HYLpbh8a9WiojN4Zi17m89sg04q2tC1tyI/uB75vFyqAxz
	0NUhMLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwq8-00000005IaW-3UfU;
	Mon, 02 Feb 2026 16:31:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwq7-00000005Ia3-3rxp;
	Mon, 02 Feb 2026 16:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hYLkpRWaYV8x8z9MUU6UtC2OJd7fEAIyh74fGdqvB5o=; b=e8jYBKtwABmfwCKklvj3UVtznd
	F9Bu+dC8Q5ySj5uMALXFZu0OJ6NZIQlxeuD40JHV19A0U2ptJCGW75vhXMlqZtbEQHApFZfVNaITq
	PutdOG6xkvfJPa7Kv9n37xaIKpLPD1EUfndboSdC4ejo28rRSWPggNb163b+JcgjoDlAaUCREb+Hp
	25nuMfkqQ48r+gsYn0cV3dG++HA/f0rlEjDYYUE0UkbaET0jBmiG+1OrnbMuO5argsVWwt+UtMccN
	ta4+6132vcxM1qDOi+xyAMO9w7oFt72bV7toSNgQ3A0z/yA7PsfwOSBDD0NRpGC7Mc3wpsqJu0bDK
	TkKL44zg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwq4-0000000EqZt-3kHV;
	Mon, 02 Feb 2026 16:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770049904;
	bh=hYLkpRWaYV8x8z9MUU6UtC2OJd7fEAIyh74fGdqvB5o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IFTbcwoQUlzXLIER0BnmpPUbq5Ivhw4yhyeTrehH06PprPCTNA3FWQniH+f9QmVHA
	 Q8TnY2cHvfoGD5W5iZPYeU4MX8lYFoJtVzFHkhjcWlIiJNkgn+iFUZbPJRwbngxZk1
	 98G040CW+lorbnf09Q5g4hiB27Fd34MfQOIZVZxk9kc4Q2lDhr2YA5gh7Aq0RmOgjL
	 HtzqGFMYOsY44WD7NA8eqc/tXPfeDaqd4AsVEQsPdyuokyNC5ytkSFII4ARzKfOmFW
	 x3EaGol0df9Sloa+nJVQrg+N1GktyvSjjuc6ZtffHDhSp7lYl3OXU4zmNl6KGJ0rRE
	 kFLpgiKDxcE8w==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC77417E0182;
	Mon,  2 Feb 2026 17:31:42 +0100 (CET)
Message-ID: <5c1b6a5a5a10404e51bc281054d733dc78374994.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Detlev
 Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Nathan Chancellor	 <nathan@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Mon, 02 Feb 2026 11:31:40 -0500
In-Reply-To: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	 <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	 <3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
	 <da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
	 <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-a6XgCD27qq03YMrDQYTC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163149_097846_B18CE721 
X-CRM114-Status: GOOD (  34.75  )
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


--=-a6XgCD27qq03YMrDQYTC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 16:59 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> On Mon, Feb 2, 2026, at 16:12, Nicolas Dufresne wrote:
> > Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:09 +0100, Arnd Bergmann a =C3=
=A9crit=C2=A0:
> > > On Mon, Feb 2, 2026, at 14:42, Nicolas Dufresne wrote:
>=20
> > > Right, this randconfig build likely got closer to the warning
> > > limit because of the inherent overhead in KASAN, but the problem
> > > with the unaligned bitfields was something that I could later
> > > reproduce without KASAN, on ARMv5 and MIPS32r2.
> > >=20
> > > This is something we should fix in clang.
> >=20
> > All fair comments. I plan to take this into fixes (no changes needed), =
hopefully
> > for rc-2.
> >=20
> > Performance wise, this code is to replace read/mask/write into hardware
> > registers which was significantly slower for this amount of registers (=
~200
> > 32bit integers) and this type of IP (its not sram). This is run once pe=
r frame.
> > In practice, if we hand code the read/mask/write, the performance shoul=
d
> > eventually converge to using bitfield and letting the compiler do this =
masking,
> > I was being optimistic on how the compiler would behave. If performance=
 of that
> > is truly a problem, we can always just prepare the ram register ahead o=
f the
> > operation queue (instead of doing it in the executor).
>=20
> I think there are multiple things going on here, some of which are
> more relevant than others:
>=20
> =C2=A0- The problem I'm addressing with my patch is purely a clang issue
> =C2=A0=C2=A0 for CPU architectures with high register pressure when assem=
bling
> =C2=A0=C2=A0 the structure in memory. As a first-order approximation, you=
 can
> =C2=A0=C2=A0 see the lines in the output being 12.000 with clang, but onl=
y
> =C2=A0=C2=A0 600 with gcc in the godbolt.org output. The gcc version isn'=
t that
> =C2=A0=C2=A0 great either, but it is orders of magnitude fewer instructio=
ns.
>=20
> -=C2=A0 MMIO reads are clearly a performance killer, so assembling the
> =C2=A0=C2=A0 structure in memory and using memcpy_toio() to access the
> =C2=A0=C2=A0 registers as you appear to=C2=A0 be doing is the right idea.
>=20
> =C2=A0- using bitfields for hardware structures is non-portable. In
> =C2=A0=C2=A0 particular, the order of the fields within a word depends on
> =C2=A0=C2=A0 byteorder (CONFIG_CPU_BIG_ENDIAN), and the alignment depends
> =C2=A0=C2=A0 on the architecture, e.g. 'struct { u32 a:16: u32 b: 32; u32=
 c:16};
> =C2=A0=C2=A0 has the second member cross a u32 boundary, which leads to
> =C2=A0=C2=A0 padding between a and b, as well as after c on some architec=
tures
> =C2=A0=C2=A0 but not others. I would always recommend splitting up bitfie=
lds
> =C2=A0=C2=A0 on word boundaries and adding explicit padding where necessa=
ry.

Ok, got it, clearly the registers bitfield (which is a set of 32bit bitfiel=
d) is
fine (appart from endian, but this is deliberatly ignored). These are the o=
ne I
had mind, and are optimized with copy_toio.

For the SPS/PPS bistream, which is shared memory with the IP, I tend to agr=
ee
this might not have been the ideal choice, though the author did verify
everything with pahole for the relevant architectures (in practice only two
ARM64 SoC use this bitstream format). I'm happy to revisit this eventually.=
 And
would not hurt to share a common bitstream writer, that works with both end=
ian
in V4L2 (or use one from the core if that already exist).

Nicolas

>=20
> =C2=A0- Since most of the fields are exactly 6 bits offset from a word
> =C2=A0=C2=A0 boundary, you can try assembling all the=C2=A0 *_field_order=
_cnt*
> =C2=A0=C2=A0 fields in an array first that has all the bits in the correc=
t
> =C2=A0=C2=A0 order, but then shift the entire array six bits.



>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arnd

--=-a6XgCD27qq03YMrDQYTC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYDRbAAKCRDZQZRRKWBy
9BmnAP4v0H9AIDOJwkSt5nsCy1gJSeMTLHMTmG01wySik1NyDQD+Oxp+8Jhu76y/
V7e6xCFUqnyj6/L/L8hQ8Ob/lQOZVgQ=
=PulB
-----END PGP SIGNATURE-----

--=-a6XgCD27qq03YMrDQYTC--

