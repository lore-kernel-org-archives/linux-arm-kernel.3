Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4AD1098784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifATUcW7DWuBHecdArq6aT4AJccdVJ7KXJNjJs6AB/M=; b=JCEzm1XnNQyu56Zs7Zq/4shg1g
	ebcKybMs/nOk2dniuzxPsZ0cTwAAOqB6YFf7EDMIvAU7bIQRS/jLs1P0ZDGRrasvud980P0HdGvPT
	pFr50fj3qn3Z8z80rs13SMdGkCfizkmj5Xrcoq3Wz3S+11h3Y9uwecJ0sgU24bVupxjSASrKkOeGF
	Lz3pRwe5dp4aqkkVCu7sJGWE91rsCoUtjYNNT2c8Wp1wKip4ugbbF6L1AqrhutHMfsboWv7T57e9d
	AZ738zmfgOMw2CFwwB91QhxTdMYd703Ho12CI4DjfIXZeScDB7iSUtCNYRZSvHc0Av2X51CL1+BKK
	j7uEGssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZcV-0000000CpZo-0KlR;
	Fri, 20 Mar 2026 13:10:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZcR-0000000CpZO-0kTy;
	Fri, 20 Mar 2026 13:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774012223;
	bh=ifATUcW7DWuBHecdArq6aT4AJccdVJ7KXJNjJs6AB/M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NYXT4OKDxR71XnYfyMTBSqcjqtlVrKQU/gxxxeVDFU/pOAT797efWm2A3UmvCHbyy
	 oitbB5r1aRUey51OdrvwfhhGIoNgB/QaOT5ThKHY/Bo1aXjkUePb0PpnO0RZHqWFa8
	 j5krSyz9N0rogyqUsguBnwFLHi+1ZnuDoplaxAtCNs8+M+01G+7ULGMcEmJhycoaur
	 Nsh/Vr34voZFlJjpl7UmlU70cDJMOq6/X8Al1VNQ24k0glZCTcn5Y+tJarMf0PmHlf
	 UOG/NXTAZQH721kEtgRWZXk8Hv3xdRzYWhxrk0pH7Eoix3f5WGxaYS1gnbS4Koihsx
	 DNbAQyW+8Mn0Q==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38B0117E0280;
	Fri, 20 Mar 2026 14:10:20 +0100 (CET)
Message-ID: <38e0241fe56f9d3af2de57b6380368fdcf5acc64.camel@collabora.com>
Subject: Re: [PATCH v8 0/9] Enable video decoder & encoder for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Irui Wang <irui.wang@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz	
 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>, Tiffany
 Lin	 <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel	
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 20 Mar 2026 09:10:17 -0400
In-Reply-To: <20260320055940.15961-1-kyrie.wu@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-67RujEEiCsWXeIp1gjT6"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_061028_027112_EAC486DE 
X-CRM114-Status: GOOD (  14.48  )
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


--=-67RujEEiCsWXeIp1gjT6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kyrie, Yunfei, Irui,

Le vendredi 20 mars 2026 =C3=A0 13:59 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
>=20
[...]
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/patch/20260211054149.27=
249-2-yunfei.dong@mediatek.com/
> [2]
> https://patchwork.linuxtv.org/project/linux-media/patch/20260302035244.89=
94-2-irui.wang@mediatek.com/

While this one is now ready, it still can't be merge, because the other ser=
ies
it depends one have not been updated to use the pdata properly. In fact, it=
s
quite likely that some of the patches in this serie must be moved up the ch=
ain.
This type of linked submission is making my life extremely difficult, and c=
auses
massive delays.

Basically, in a chain of 3 series (and probably 4 since the first one does =
not
apply), the refactoring that causes all the series to not be accepted is
happening in the third one. Angelo and I have been clear for weeks, if you =
need
a constant value for a platform, it goes in the platform data. Don't do swi=
tch
of strcmp at runtime, these are constants and we already did string matchin=
g to
in the probe to find this pdata. Once the missing data is added, simply mak=
e a
final patch adding the pdata structure for the platform. Use this v8 of the
MT8189 support as reference, it is as I said ready, but it does not apply d=
ue to
broken dependencies.

I can't easily fix this, so please work together, synchronize your submissi=
ons
so that we can get the MT8196 and MT8189 support finally merged.

regards,
Nicolas

--=-67RujEEiCsWXeIp1gjT6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab1HOQAKCRDZQZRRKWBy
9FzIAP4oohtwocrtFhnn2WfKDHxvJ5uVcuOyFDF7hFnej0jx7wEAy97yTrE8Oj2B
qJZbPwpS2fk4KcvWecW4UPbX07ZLIAE=
=sleb
-----END PGP SIGNATURE-----

--=-67RujEEiCsWXeIp1gjT6--

