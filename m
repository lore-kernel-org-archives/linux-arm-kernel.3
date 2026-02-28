Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0534D1048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 01:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5I1VxEcV2pKAkv9StM6h+bUekLg6n3u51XxkXEli8s=; b=VV236q404hFIc/fwLn9pFrXuyn
	AB/8iz6ka7CMVyFWGFHziop1VJd/plPsMOZ5e2xM86TthKXqTEPhd/K0uGJgaDZ0ksVj3AKtpFCfk
	lJ3SIfjGvQvw6/iLlcy8rK+d/2LZiRdEiSqvc6vkYtPCdc8MhRYudzIYd9ndUjqJ2FK8C6teBLg7d
	v5QaC1dbfjz0OptfPxFtOrzWzmkZ9pKkmYSqNJCtTrkzVrEm3sp0DFSh5c/Ros6OVN72+jm/MUL7O
	+PVAcoPX0HqpsJ730DgwCPxoWAHkmoxuskhtVaBAzWMfwAqZnPSYu2/VA7R3buZz94vCq6t40brPA
	bLsE19TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8sL-00000009NAb-3ECa;
	Sat, 28 Feb 2026 01:12:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8sJ-00000009N9l-0uQq;
	Sat, 28 Feb 2026 01:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772241124;
	bh=FTpFrrnmK4vqnqZPNlbSmsvAtJAjaotCdfMV7I/jZ7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lz/LW1LuOvvEBhbmXEg/YAcmk5SAaMQFyl8PRNds/r8U50ytwDoyvwU94Z74oLaGb
	 z4hrejurcVQ28QoicDRpwUJNbtIMrXGGhmezXKhTBhJii34j8ASqYO0q5rduJUbsty
	 9ZVBTDijFucEkvdQjPlOxjRoPuAP4elPr6+CaDwAXIgYYaB1WFQBu3CeRlF0s0HtoO
	 IKh/aYbBR3fiIIIJGauHyuzEFdu+KdR6rtzZfrN8j5Xt8LKQ/FTxYA+3VzfmC9/FSt
	 6zt6JueETqyV+9sEGTn9pCToUbUeQwUQSnoY+NYRL/HoqKWXjAlQT/1IBUE3iY+JqY
	 iu1czmZkLqZeA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A43E717E027A;
	Sat, 28 Feb 2026 02:12:01 +0100 (CET)
Message-ID: <da7a9990e3a10de809f8109a5c2ae69715bee2b2.camel@collabora.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Cristian Ciocaltea
	 <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 kernel@collabora.com, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley	 <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Date: Fri, 27 Feb 2026 20:11:58 -0500
In-Reply-To: <dc2e9e13-165f-4ca1-be29-aabdbf133856@kernel.org>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
	 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
	 <20260227-observant-roaring-ara-ef7eb0@quoll>
	 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
	 <dc2e9e13-165f-4ca1-be29-aabdbf133856@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-upWNrmByhbR1y4m3hEOj"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_171207_410924_D0AA6C80 
X-CRM114-Status: GOOD (  31.64  )
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


--=-upWNrmByhbR1y4m3hEOj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 f=C3=A9vrier 2026 =C3=A0 14:03 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 27/02/2026 12:37, Cristian Ciocaltea wrote:
> > Hi Krzysztof, Conor,
> >=20
> > On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
> > > On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > > > With the introduction of the RK3588 SoC, and RK3576 afterwards, two=
 more
> > > > register blocks have been provided for the video decoder unit.
> > > >=20
> > > > However, the binding does not properly describe the new hardware la=
yout,
> > >=20
> > > As you shown me last time with excerpt of address spaces from
> > > datasheet/manual, the binding correctly describes the hardware and ab=
ove
> > > sentence is not true.
> > >=20
> > > > as it breaks the convention expecting the unit address to indicate =
the
> > > > start of the first register range, i.e. 'function' block is listed
> > >=20
> > > Imprecise wording. "start of the main or primary register range"
> > >=20
> > > (if you have 0x1000 with one reg and 0x20000000 with everything, the
> > > unit address will be 0x20000000).
> > >=20
> > > > before 'link' instead of the opposite.
> > > >=20
> > > > Since the binding changes have been already released and a fix woul=
d
> > > > bring up an ABI break, mark the current 'reg-names' ordering as
> > > > deprecated and introduce an alternative 'link,function,cache' listi=
ng
> > > > which follows the address-based ordering according to the TRM.
> > > >=20
> > > > Additionally, drop the 'reg' description items as the order is not =
fixed
> > > > anymore, while the information they offer is not very relevant anyw=
ay.
> > >=20
> > > This is fine for me.
> >=20
> > Thanks for the additional feedback!
> >=20
> > If I'm not mistaken (please correct me), the only remaining (hard)
> > blocker for the series would be to improve this commit message.
> >=20
> > How about the following:
> >=20
> > =C2=A0=C2=A0=C2=A0 With the introduction of the RK3588 SoC, and RK3576 =
afterwards, three
> > =C2=A0=C2=A0=C2=A0 register blocks have been provided for the video dec=
oder unit instead of
> > =C2=A0=C2=A0=C2=A0 just one, which are further referenced in the datash=
eet by 'link table',
> > =C2=A0=C2=A0=C2=A0 'function' and 'cache'.=C2=A0 The former is present =
at the top of the
> > =C2=A0=C2=A0=C2=A0 listing, starting at video decoder unit base address=
.
> >=20
> > =C2=A0=C2=A0=C2=A0 However, while documenting RK3588, the binding broke=
 the convention
> > =C2=A0=C2=A0=C2=A0 expecting the unit address to indicate the start of =
the primary register
> > =C2=A0=C2=A0=C2=A0 range, i.e. the 'function' block got listed before t=
he 'link' one.
> >=20
> > =C2=A0=C2=A0=C2=A0 Since the binding changes have been already released=
 and a fix would
> > =C2=A0=C2=A0=C2=A0 bring up an ABI break, mark the current 'reg-names' =
ordering as
> > =C2=A0=C2=A0=C2=A0 deprecated and introduce an alternative 'link,functi=
on,cache' listing

I would suggest something around:

		   and introduce the actual hardware order "link, function,  =20
=C2=A0
                   cache" ...

The rationale is that there is no alternative, if you use the deprecated or=
der,
a hypothetical driver maybe interpret the offsets wrong. There is no possib=
le
backward compatibility with a new order, and you can't have two possible or=
der
in this syntax.

Though, the rational to break ABI and backward compatibility is something w=
e all
agreed on.

> > =C2=A0=C2=A0=C2=A0 which follows the address-based ordering according t=
o the TRM.
> >=20
> > =C2=A0=C2=A0=C2=A0 Additionally, drop the 'reg' description items as th=
e order is not fixed
> > =C2=A0=C2=A0=C2=A0 anymore, while the information they offer is not ver=
y relevant anyway.
>=20
> Yes, it's fine. My comments were actually not blocking, I just wanted to
> wait if discussion with Conor resolves somehow.
>=20
> But for me anyway:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
>=20
> Best regards,
> Krzysztof

--=-upWNrmByhbR1y4m3hEOj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaJA3wAKCRDZQZRRKWBy
9E7eAQD7eBKuRWQizFQXyLJYdA2O0SdCieGgFYeAuhPz4TNfvwEA+qq94TAEmNy2
274VsKH25GkqEIFDufTIZrfBHRxBuww=
=JQoX
-----END PGP SIGNATURE-----

--=-upWNrmByhbR1y4m3hEOj--

