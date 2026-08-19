Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF77C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poGXx/PkspQ0ocgMJHl3qYYcy7yFhgIOctjg9rM+9Ek=; b=vMdHVavWw3wcOzzuN6kiMNxd0X
	gSRtYTJJHo2TmsIusEioE0tdu1Qpz9onSKv2FTRC69sKcRFIl8jnmyC4zi7snW6wmkeQMnUnFe8J3
	HL7eVIPBaa+bL/Z2LNXITeIwmQaBMf2AI/aDCBYgMOdVn/tZI+f3yOZwjcoXEI2xO7mMPY2uBhwLQ
	gHObLDtKuzfGOKKq7BWzQu70au7YwmVsTQkd6wtOvCrwgsHt7CvDouE7GMQuBVSNDN3VhmmAxlm4m
	LavK/nAbe8+qJc0e90d8m2wYNRD1+awe99Vuf9bcFS/+y1BC4qEZsduP3vPu6mY14Gb8q3gE4CHZh
	AQTL5Pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiWb-0000000A7ad-26Yw;
	Wed, 19 Aug 2026 15:48:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiWY-0000000A7a1-3bQn;
	Wed, 19 Aug 2026 15:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787154495;
	bh=Nns172wxL0Ep4S9FnOGpNap2WkSsjjZKWZktzclPSJM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ti8Q1sowFKGW/WW92JCUdtPeDrx26VS8yBllFbIxTfXPJ6N0skNpr0k+sCX1tTM5q
	 7B8y02/R2ySANZAp42NGPjBahBxLOzLwRCNTQgf+71aFZYo0B6JfbVxY0zB3UwFWrY
	 yidYvI5FmislZoRRlCXAxTqIwtA2en0SvTxaoeho8dq/oRG9v9hiEEYKboQXVz2Tct
	 nnLguUfTqGv793z3B6xFV6x1OVfwEy1nvm/rw4QJhJmmXiadRWp0vDclF2fnN95jU+
	 K7kYevFLcmhI1jSmzuuB8df79eLoLMByXMrQoJUu0IDe1wMV7KMb4bwHSedK9dgN5H
	 maJofJgz6+HSA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A42D917E025E;
	Wed, 19 Aug 2026 17:48:13 +0200 (CEST)
Message-ID: <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,  Hans Verkuil
 <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Sinn	 <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Date: Wed, 19 Aug 2026 11:48:11 -0400
In-Reply-To: <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
	 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-gAMZ1BrMIjddsvqywxMw"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_084819_055853_737F3C7A 
X-CRM114-Status: GOOD (  10.10  )
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


--=-gAMZ1BrMIjddsvqywxMw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> +/* ------------------------------------------------------------------ */
> +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> +/* ------------------------------------------------------------------ */
> +
> +/* REG0: IP version / product ID */
> +#define VDPU720_REG_VERSION		0x000
> +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> +#define VDPU720_BIT_DEPTH		BIT(8)

Can you share a dump and share these register reset values. Looking at the
layout, clearly its highly modified, but probably derived from VSI multi-co=
dec,
but I'm thinking perhaps we'll learn more from that. Its always nice to jus=
tify
when adding more chips that are not strictly VSI designs (or maybe it is) t=
o the
hantro dirver.

Nicolas

--=-gAMZ1BrMIjddsvqywxMw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaoXQPAAKCRDZQZRRKWBy
9L97AP97ZqUufmP34nj7H6WO1VaHBkcmFPE1w2dWMA2Ud0d53AEAqqCnWF8UEG7K
NT0DsFxf8TDJvZBbMJ1719B7rBGgGAo=
=mBFn
-----END PGP SIGNATURE-----

--=-gAMZ1BrMIjddsvqywxMw--

