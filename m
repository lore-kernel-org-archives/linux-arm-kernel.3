Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD75C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P8sDzkahWhhCT64GZn0Nrgekze9oIVFg2YRSKyBcuM=; b=PsXy3Xf5MAhpkabIAe4Rzi7KHq
	1701bkPj7Z3S4OVwUuNhAB6XSmbATqShrJYNa2MpgGDFnKGaU90LFcuylvOeMyh0QjsWrvbDje0ji
	Reu09TfxlIvvyy/PH6jYYPR0kA9z+7qtjumZFrjJ8JlVCkhGdWVKabzhbkIHtDD60ROYbimpaJOBE
	pJSyvcwvcHCYcABuAFg5xvEn/We8V7JF8Vr3Q3XqUVfnPog7PXRsvbtKC0MuA7Zp7jmpHjwQApijR
	387K/yxmRYBE2qFOsZRtpV835RYOuo8bbqn23PEIet7jOJhHoJmkZ156ONeMW+3Sh3NKTFsew8JKz
	ue8et0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aW8-0000000Afre-3uyS;
	Wed, 23 Apr 2025 13:52:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WVd-00000009zFL-2kzM;
	Wed, 23 Apr 2025 09:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2243EA4CD4D;
	Wed, 23 Apr 2025 09:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A295C4CEE2;
	Wed, 23 Apr 2025 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745400911;
	bh=8P8sDzkahWhhCT64GZn0Nrgekze9oIVFg2YRSKyBcuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuOO2u3Cx4wJMRt8kBTyR7w4O1A5fCUCktQ4067IV9XrWECd0zsGQfyY2KXwxAAjL
	 bcohNDuApp3O+XrdnY7uN+usEaYxwX1yS5bW6BeAimRk9Xgno0J5GiT9MVR2mnXPBN
	 0E3zZDYnKAb2am/Q7VVMX5WUzUcH7Nnoy+QO+ZeydZSfVQeTcfyMkkPw16JDXiVjcq
	 hIYhw9l+oTK8KdKsyCpi9E6fcRrdCdIMfsZloOkdGe8FRrlhSFYm01VHm+aXb0sL7B
	 mu8yCzZuBzSAtS9DhgxEgrg4iO7jUPCZEjqSpOtE7BI19pxeClVa8CuSD6GBu20Pe9
	 rEfdqPBtuTPGg==
Date: Wed, 23 Apr 2025 11:35:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Add compatible for
 MT6893
Message-ID: <5j5sp6jkayy3xojrnuiwlfm4gwd65dcoevef24l2wjnw7vm7qr@lh3ztubq4cxz>
References: <20250416120253.147977-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4q2qghcrkefhmt2"
Content-Disposition: inline
In-Reply-To: <20250416120253.147977-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_023513_769672_802AC40A 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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


--p4q2qghcrkefhmt2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Add compatible for
 MT6893
MIME-Version: 1.0

Hello AngeloGioacchino,

On Wed, Apr 16, 2025 at 02:02:53PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the Display Controller PWM IP found in
> the MediaTek Dimensity 1200 (MT6893) SoC, which is compatible with
> the one found in MT8183.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with Rob's Ack.

Best regards
Uwe

--p4q2qghcrkefhmt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgItEkACgkQj4D7WH0S
/k55tQgAlq1/IAh3RsXMDwoqCzmUuiKr7II2d4Wm5ALC76/irLZDfA5QQVU51/ai
+TfOCRLuh9K5Hqki3o7pEkYBS9naCujh5JYMyG9rVmFawRsO/eV1IJ0PS493ZF+7
0ELBMhPpmGol96JgkYpKeDBWlLTH8jLDK4pnH2FmE1tvN/OU8mSPvD6LuIJmhBdI
p5G4SIQNeTy9ydeJuoWnxO/NSiOBEyqfJxKE8xEFvWhEC4fpjXPzkYYqvQ+2MJbp
qQiHymfCWi5Zz2YUnnsm9c0I1GgoJTPl2Ad0FxPg5eGxpCj95WyyZJxM2VAG6SjA
xKukBj6MTSvGXAYh0VvNwBQ4LkaDfA==
=vDOt
-----END PGP SIGNATURE-----

--p4q2qghcrkefhmt2--

