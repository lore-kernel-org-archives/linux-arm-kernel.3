Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6347B1091915
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mwk77xis2n3Xi3SnteeL2ohG2orQmcxYOHvsRcbmRzo=; b=UoEOARmAZI+nYbObYwOVZ1tvn8
	nkj5BJdPWCF6N4t+TlNHyydofP20e2738VJg7bc0r7gDbTBfIkIFXYDBvlDwXdpurYHoIn+NwqiAW
	jtiFPAR0P7i7S7Leo1GkzRH4f1XZtikfih6ZN1S3p9/1Ndb29NFOUBio/lD/iug4EVAwumBWYBnfr
	AoFFnTUXO/zUDYw2zCE2vkEpKAOobtXiOi9VV55cWSxpOr2rz0lujhywc6zjnJVcVPHQQSHTzljqt
	yrAIJTpA+HwpgK0qaVzw+yJSyMS79cYXYkUnGWCSlUJKBg1Kp5c04H2gzl/m6BeWhjLKveB/cv599
	vc7OGMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jai-0000000BUtg-1mVc;
	Thu, 19 Mar 2026 20:03:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jae-0000000BUtE-3DQI;
	Thu, 19 Mar 2026 20:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773950609;
	bh=Mwk77xis2n3Xi3SnteeL2ohG2orQmcxYOHvsRcbmRzo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GyK7utUdQY5E5LXqW5mcaITv5umgd4AWM1M+WPt8otL4ejjp4T4VXPXwc4YVUGBUZ
	 2shvNNt9XtwjqfOhKiC9g2fj+jz7wspuKHJVd3AoAeRS3p8V1/uj9xcGfBGopWjPmZ
	 eQgJE11omY1jXJeyo6t6KYy/48PfZ/kz5HHovR2WxQSdimiLphVDz01ZcSJrVxbQtP
	 CaEev16x+bU7URDp/tjZSqrrwwcdzQ5HftZWNtpfXqyyPb4MGRCVT8HU2jGJLiPozw
	 u0l0R9NMijyiEeKDmWOzmbv0pP6vEkkSWOW/MvMIAFDiibepTP5wpW8R5I1L0lbNjJ
	 Y9Rmb+US9phNw==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 758BB17E0D91;
	Thu, 19 Mar 2026 21:03:26 +0100 (CET)
Message-ID: <996341171629763ec9ecc0db6da61319ee99a970.camel@collabora.com>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
	 <Yunfei.Dong@mediatek.com>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, "nhebert@chromium.org"
	 <nhebert@chromium.org>, "nicolas.frattaroli@collabora.com"
	 <nicolas.frattaroli@collabora.com>, "daniel.almeida@collabora.com"
	 <daniel.almeida@collabora.com>, "benjamin.gaignard@collabora.com"
	 <benjamin.gaignard@collabora.com>, "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>, "hverkuil-cisco@xs4all.nl"
	 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Nicolas Prado
	 <nfraprado@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "frkoenig@chromium.org"	 <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>,  "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>,  "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 19 Mar 2026 16:03:24 -0400
In-Reply-To: <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
		 <20260211054149.27249-3-yunfei.dong@mediatek.com>
		 <6176231.DvuYhMxLoT@workhorse>
		 <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
	 <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-FrnHTvwmYEsqtrvCIYp9"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_130332_981761_74ABC0B1 
X-CRM114-Status: GOOD (  10.89  )
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


--=-FrnHTvwmYEsqtrvCIYp9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 02:13 +0000, Yunfei Dong (=E8=91=A3=
=E4=BA=91=E9=A3=9E) a =C3=A9crit=C2=A0:
> I had already confirmed with kyrie, he had changed the compatible patch
> in mt8189's patch set. So I just need to add mt8196's compatible.
>=20
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20260127024248.18=
406-3-kyrie.wu@mediatek.com/
>=20
> mt8189's patch set is based on this patch set(8196's).

I will ask to work the other way around. Kiril patchset is very close to be
ready, and once in, you should be able to rebase on top.

Note that this patch is miss-ordered, you should implement all the VCP/firm=
ware
part before you modify the probe function.

regards,
Nicolas

--=-FrnHTvwmYEsqtrvCIYp9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxWjAAKCRDZQZRRKWBy
9ArMAQDVgqfeQ32Oxh6+LvFyWrktt20lAWSdogk1BezddOC6mgD/cGIEIBvNjbWv
b3JO84r1cAky7hZHLayboQFUjo4INg0=
=J894
-----END PGP SIGNATURE-----

--=-FrnHTvwmYEsqtrvCIYp9--

