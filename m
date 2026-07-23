Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7CBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0M9MI9dB901g7cMmjTeOdPTQ6Gbf1ggOTiUNsSEHfQ=; b=rjHdqZXn8myy834EX4MWgDil+6
	osCP42z4jK+Y1R3ZRNPuLmVYipcz9Si/SRmCeY7Tx1JEPY1lLGHgVvrExdibzfXU8moIe8lFUO9YQ
	8r4DvoU4X7vO7v+UV0VX0Y9UkKrplnKqrxfR4nAGRW8LxjDAiLHEVtodzVp9LRHNx36bPP4I95jLY
	HDRsLdZpLBE88RL+HUgCmjNsOniPpvTL42fGhnJc97hgA8cX887/UczI8JdXSySDJm53afxbAm1b7
	JhntO2fZcc1iYI/a0Bt1Js6tGEARTv8MaWtaii1l56zXn/i2vN9+ZfU7EO3a2uqube5y7hOCuNsj2
	hpCjRfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzGt-0000000EyYB-34Rz;
	Thu, 23 Jul 2026 19:39:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzGr-0000000EyXZ-00Fb;
	Thu, 23 Jul 2026 19:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835588;
	bh=G0M9MI9dB901g7cMmjTeOdPTQ6Gbf1ggOTiUNsSEHfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Pfv6T1TPiUoHMM8XOwWq3m9en+TZtkiHrQ2rbxona1O1sAaw25V90llKOZcuzq3f7
	 j68dTeoDGGFEtv6qdvAFgBM8BhHhUj9xDL2zPqB7HSg2Ia6CpY0HLHMF4OBicd4icm
	 hK7V43P/axbMKKilDlAJ9dsbhUJ00ExG9dxCAtbXATaaalmhzvLEnfbH9qctlVehG7
	 t+rnoePEbI5Z1kquA8jSiue5lGvcaH3uTW8X5ETrVSiwYAYMsDaPyzkgXtEBWe4tDl
	 otZc6woBFcv91VTkf1f1ozczcSAnT6ad3K8p1AiGJYB5U+Q+dyBZFkt/fTbOmp5Ovk
	 Nge3QqZdiDmJQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D36BA17E0A46;
	Thu, 23 Jul 2026 21:39:46 +0200 (CEST)
Message-ID: <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com, 
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ezequiel@vanguardiasur.com.ar,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 15:39:45 -0400
In-Reply-To: <amJgcHf2vVDb75nR@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
	 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
	 <20260723004642.2075233-1-gahing@gahingwoo.com>
	 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
	 <amJgcHf2vVDb75nR@collins>
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
	protocol="application/pgp-signature"; boundary="=-dZVtlSGeZCfvrclufsh3"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_123953_203744_948ED884 
X-CRM114-Status: GOOD (  14.39  )
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


--=-dZVtlSGeZCfvrclufsh3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul.

Le jeudi 23 juillet 2026 =C3=A0 20:41 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> In my opinion it would be fine to have two drivers, but it's really up
> to you. Since you already have a v4l2 base for it, I would encourage you
> to move it to my proposal, which will probably be finalized in a shorter
> time frame than the other proposal and lets you reuse the code you've
> already written. Then you could also add RK3576 support to the drm-ish
> Vulkan Video proposal without too much work when it is ready, reusing the
> RK3588 work.

My main concern is that once you exposed an API, the transition path is nea=
r
impossible unless you accept to support both APIs concurrently. So I may ra=
ise a
slight objection on the above proposal. Once we have the code shared (Detle=
v is
working on it), you'll see that Detlev (and Daniel Almeida) implementation =
is
just a step ahead, and adding RK3576 to an RK3588 is just a minor update (i=
ts
the same chip, different minor version). On top of which, once the kernel d=
river
will have settled, adding more codecs will mostly (or entirely) happen in
userspace.

With no offense, the RFC here requires significant work before it can be
upstreamed. A lot of the code is hex tables generated from inspecting a run=
ning
driver. So there is a lot of work to decipher this into clean code.

On that aspect, if you are missing any reference code or technical
documentation, let us know, though I believe most of this is public informa=
tion
for this chip.

regards,
Nicolas

--=-dZVtlSGeZCfvrclufsh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCamJuAQAKCRDZQZRRKWBy
9ChrAQDFYy3+9EG1k90i3qFuQHquFaa7OckWKYC1S7LgGkjApAD2KOYjLf8wKd7p
VqiNDw9wJaVm7ANxBYaRrp7s4J2DCw==
=OgIE
-----END PGP SIGNATURE-----

--=-dZVtlSGeZCfvrclufsh3--

