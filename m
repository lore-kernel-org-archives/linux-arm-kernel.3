Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D639C5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oKZyEL1iFYFoci4IXHQCxEI6U5/P8tMDAAAIOgG5Z0=; b=VkeO96d8nnVllu7sGhc+5Y0kZZ
	UUaV88GWhT3ooCRDUwzDz9rEu9Fs5UJeWe4/iJDWW8eeQY1R2vlYdHcJzekvazmQjkHc/S8cAKXRi
	iDo3+xeE/BBvTjMWI0deZ1wjlf75GWTZkrXR8T+StMcohA9b3WxIjctxPpBE+8bIZQ42yWXV6LZSk
	jv1XvHmr6VQq8jNdXCHk9aJrzQWS4tmTSiL1G0HhaWVXZGPUuHA4hqMhW6EsAs2jxMwLGGf1uqVJx
	MqsRisBFWG3QyLB1UA6gEIDg5iO42W7ijWFmwy4gzHWHdgzagtrOrOYtibWiuHo6e+18UyfA6O3LO
	FLv8xVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOwi-0000000DMj7-0MDw;
	Fri, 21 Aug 2026 13:06:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOwf-0000000DMih-3txV;
	Fri, 21 Aug 2026 13:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787317562;
	bh=1oKZyEL1iFYFoci4IXHQCxEI6U5/P8tMDAAAIOgG5Z0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jC8zUfnGP7gSO/2/x9VfE+lhwoDDxQz9Dfv+WfKjkxZBOE5tU4ST2YHpWfTR+nbVf
	 w39gTOMnUuo5TSPkTKpv/HV/GoR1RGO2//GsX0TVWJrkYbl4/gtsCnct+GviLUwfa/
	 hxtxbH/Sj2mOWqIdp1C7vyb+i4Mo9eEu+ULVyJXqJzad4c/iHBJ4GDyaRrpZ8Q51Wa
	 5l26bjb7mAhEv3C38cqwTkkCQKVsl2/EvIWJC1OUb6HEbuuDmsKQtxH19sSkidRPA1
	 89xeIN+GcvbN04ajeFxO7FYiAOUCKz2GHxnHrmDcVNviP9l0LhppVJVUhQ+1eML4tA
	 m22TB+4A6jrcg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0937617E07F7;
	Fri, 21 Aug 2026 15:05:59 +0200 (CEST)
Message-ID: <c9ddec85a5de725af79d140132d46371a73d2519.camel@collabora.com>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Andrzej Pietrasiewicz	
 <andrzej.p@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai
	 <wenst@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org
Date: Fri, 21 Aug 2026 09:05:58 -0400
In-Reply-To: <6947a89b-8fa0-499a-9be8-c48d9bb5e7a7@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
	 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
	 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
	 <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
	 <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
	 <6947a89b-8fa0-499a-9be8-c48d9bb5e7a7@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-tmfNo+9PGdky19ZZ2lcq"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_060606_133728_E2938360 
X-CRM114-Status: GOOD (  10.15  )
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


--=-tmfNo+9PGdky19ZZ2lcq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 21 ao=C3=BBt 2026 =C3=A0 06:28 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> Patches 1-3 could be useful on their own though, so you might want to
> take them. They are untested on real Hantro hardware, but I could give
> them a go on the JPEG encoder.

Ack, they effectively address real issues. See my comment on the end_prepar=
e()
on error part.

Nicolas

--=-tmfNo+9PGdky19ZZ2lcq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaohNNgAKCRDZQZRRKWBy
9M4sAP0b7XVB6+Qd0ltXyk6c44QXcTPZ8iEAaG+P6UwddRLm6wD9FUdFqv+G4kOa
6UjQN7bqfdkvp02H7oxIJ5WO9A9mOgk=
=et6H
-----END PGP SIGNATURE-----

--=-tmfNo+9PGdky19ZZ2lcq--

