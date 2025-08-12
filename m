Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DD0CA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8au1BkNQCBnNySZYfiMEj46zoU7WWHs+Ju163gDFc6o=; b=BIHKD2yyi0qTXhW2Pk3kVhEh6g
	xzAo27++L3O1J7eHQG7KhIxd3+MMbMwd+1+M9M+BB+zaI923v88GV/6iotKNW3xTvJYpCCVFCr6ES
	SgKZHCD3JFgibceoFW9p62u/7bJEtiisUXNaI2dLepZIMZysEoWV9qi0h12/sdOTM2+t0r21Kwl2K
	Up2jvLnY4+MNOWy5PygnCp8WwmWDn+1zek0/dDlLescvz7vIngTqpQ7nzc8Qg28hmsLS/jMUCjzW7
	xz1knTb+33u2aInIjCTelWJTI5q2Y5vrCfED83bEnvQJcGYZKrJExOxm9r63MmM5ie10tIm2svD3I
	WvjYJs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult3G-0000000BdIg-0GVy;
	Tue, 12 Aug 2025 17:44:46 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulphb-0000000B10Q-43dC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:10:13 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755007809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8au1BkNQCBnNySZYfiMEj46zoU7WWHs+Ju163gDFc6o=;
	b=xunq7241M6hc19Bn3WAarEymwrckCDjykmgAvQZ4VQbsrTAClXRwweHiQoupA3SOzTdnI8
	FZanaU4w22jwRoeytpngU5w8uLV7rdvFGZYDsZxbTUn3IaHEez09tTu1MiNOYtU4/+okcV
	hAxO9R4FzzqnRUmgcOI+bHjHjcVFGMhusj8cgNFM6lW7fU/p5k2EztxCZ8RymMhPxPpI5f
	lphtG9rMtLYs4vFZLko7nQWNTfLwpXVtY3z8P9Lz3ERwf/7JXkNzWAf1ENoXmhLmw2/qG6
	7yoFHtpTcnm+XlsGz6oWcZSxY0CV916mhxpnQhUZFTZdoZBBfqtaf1sxz3e7rQ==
Content-Type: multipart/signed;
 boundary=2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 16:09:56 +0200
Message-Id: <DC0ICB8ESISQ.1111XINSCI29S@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Detlev Casanova" <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
 <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
 <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
In-Reply-To: <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071012_308714_B8865B2A 
X-CRM114-Status: GOOD (  24.44  )
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

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 12, 2025 at 3:27 PM CEST, Nicolas Dufresne wrote:
> Le mardi 12 ao=C3=BBt 2025 =C3=A0 14:55 +0200, Diederik de Haas a =C3=A9c=
rit=C2=A0:
>> On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
>> > On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>> > > This series add a HEVC backend to the Rockchip Video Decoder driver.
>> > >=20
>> > > Patch 1 add the new HEVC backend.
>> > > Patch 2-3 add variants support to the driver.
>> > > Patch 4 add support for a rk3288 variant.
>> > > Patch 5 add a rk3328 variant to work around hw quirks.
>> > > Patch 6-7 add device tree node for rk3288.
>> >=20
>> > It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branc=
h
>> > locally and that also had this commit:
>> > - media: rkvdec: Keep decoder clocks gated
>> >=20
>> > Is that one no longer needed/useful/etc ?
>> >=20
>> > And 'chewitt' also had a commit to fix 8/10-bit selection:
>> > https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df=
926d435c7c
>> > "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>> >=20
>> > I haven't tried that one (yet), but did=C2=A0 try an other variant wit=
h
>> > changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
>> > in my tests. (Can ofc be PEBKAC)
>> >=20
>> > Would that be useful? I do/did have consistent problems with playing
>> > 10-bit encoded video files.
>>=20
>> nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
>> as it also exists with with H.264 files.
>
> The referred patch is against some out-dated kernel. In mainline linux wi=
th
> have:
>
> 	if (sps->bit_depth_luma_minus8 =3D=3D 0) {
> 		if (sps->chroma_format_idc =3D=3D 2)
> 			return RKVDEC_IMG_FMT_422_8BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_8BIT;
> 	} else if (sps->bit_depth_luma_minus8 =3D=3D 2) {
> 		if (sps->chroma_format_idc =3D=3D 2)
> 			return RKVDEC_IMG_FMT_422_10BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_10BIT;
> 	}

That's indeed the code for H.264.

> Which covers all cases supporte by the hardware. Chewitt seem to add a
> previously missing 10bit case, and forcing downconversion from 422 to 420=
. A
> downconversion is something to be chosen and applied by userspace, the ke=
rnel
> should pick a non-destructive format by default.

It's based on the 6.16 mainline kernel, but that patch is a 'fix' on a
not (yet) accepted patch he added on top of that for HEVC. So it not
working for me on H.264 must be from somewhere else in the/my stack.

Sorry for the noise.

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJtLOQAKCRDXblvOeH7b
bs3HAQCxT5YbN/2lR7MNLL4Ut6pvl9wf/Pgc1qE3anE5JNfU7wEA9hiJInBMZsPp
WQpNfZk10b6mmxacnf912uguESmwRgU=
=rf9k
-----END PGP SIGNATURE-----

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83--

