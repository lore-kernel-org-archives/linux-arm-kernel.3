Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84FC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fIvh/Gna;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6Uemeas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=; b=fIvh/GnazeEB/4PoqYM1R2myOA
	3eDlU9zRBz6DYtj9i/gZT6RTN3AvT4cZsf8fiLbtmJrKjTKmvgtyVtwFWGICHlrZ1N66UFPmhTicp
	VNZXf4t8AFzav7fxDHa28c5XN8k3eABgbRf6xfs94J6S3UCxiMlqYxeBoYdARdI/Ufs53nO+z9sfE
	IMmFvwUI7YMVbbT37e61JlRkC6clarqSUcDtSML6/2lrtEigTNXrL//HfWMMoCIMkYXGwEFNTP1pj
	WlR5anOffP1WkZ8Oawg2QzuIfDT+I+IU27tZ1QqA5RgZZAl8IP8lVaVDvQAnJWBngYqWP9SbWqziC
	3TPjNQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYiu-0000000554E-0B9A;
	Wed, 04 Nov 2026 11:00:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYin-0000000551s-19xK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:00:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e5378b281aso3216465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=t6Uemeasz/VEXAFAG44bHCEH9i9WE3hL0g5hqYwj23CMD/PFYvIyu8BeqqCNG/4dng
         QuxiIBlfomfgGzLwL02HZob/zsJdMokvo38h6hC/uS9ZrqdAqThcSGe87/o020luYuKQ
         fz/Bw/Ujd7Y6ozdBfJHdyQx51D8hEBLQy/NeTdJgB7y/rzSjnoEayj6DL5lrkba0DueT
         gPyxe93PVhc069ymowpQFxwAx10yFqMYx0rNtRr92Qghr45mJMwzrxnnGx2XDkybBeRs
         UJHWYzaZFdCO4YT/45Rdl7qhUPdpD2w+dchwJeROka55v4rptjF5BR/25CNsILlymyQW
         z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=l7zDFftAIabuP7/5rhJHmAhHq2ozDZNH7gqYwTTJ/nSulGceL0v8gfwZH8mwSybe23
         nNf+PyhJq7HUFc0F24Kwb+sqtgj/wo9cHdDbh3eTahCj+Idyu0/ZlZCkRgq0XuEy0x20
         PnIm/CsjWRcBBv1LoIvprxY2ELSKgdID1vDuElGkQrvPJQXeJ6wRtbxgatrgJVZw+eKt
         0wlUS8tXMhfAfOM4z8l6s+xigDpRXoWnVqBR5tHjbamN1350tSfrfMt2Cua30TQ6FUvd
         gveSKHd07GonwxhozSVBj/EWaKU2cOV2QR/kHeWRGMFufZ9qHTgJURUdauFxwU6m6zN5
         CGRQ==
X-Forwarded-Encrypted: i=1; AKwUvByKuvaSkUUzEgww7EKNtfcTJsL4MHdcAeAvChXS8l/QKyhxelRnfCbcK1eor+3UA/31u+j3tKYVSmbQUuXBiGvp@lists.infradead.org
X-Gm-Message-State: APuU4Z8uBjN+Ig98jPqK38TrI4Ehp5G1I6ZWGlY4Jp+alu7NUPx9lGuF
	5Q8ue88DVTAD8nYvMyo+E0BsWHeyukea/MXwKiRpUf/mwcJtXRvhGgis
X-Gm-Gg: AYBFou0VX1oQo2ZT8Ns0a6pEMiqP/zniORiNdfEiyAYHQ2vDwqQkxinl3xyM3EadstW
	sDVYms47Rr+lC9nQvkyf84gr+iHFoyoO+Zrhn7q8p1gcZFZ/Amxs4hxpCfNExbqAUwfx7da4gfO
	vy6+KaPmEZByHpmk2HKf77dVjgrKzv8fQXjf6E0LBW9/VUMIu7UhJcuJLxB6//4muo7oGkQYJoi
	UjIC+UUaZnedjwjYnv7g2BB9xzY99mCN3oOQiR2CrkjD1K/i8zpcS881Z3899j7CN35/mw3PZGC
	vd83aAhvs5d1xP8RmoRaNAvI+rhBWERWw/ZObK5Np4sUPs9CuI87QjpBXVvmBmhfDw/wykPie5M
	7bWUGta0H7VdCccL3OnndBj2vjDDIncdWS82+uUY5+7DThAUjB4VhzqjYSPDhhisPX5mruADNWY
	Tc0v5u0BMYqEyRCS+XfBxR5aTbwGZLzAYePvNzko5Gs/JhcP1zUu9SGkLsqesuZ89cRWjJe2UMJ
	sy3keqYWdyHtXzjrrEywCC/Go419MhPdrRYIbLBLHYtSh4PAAmzF/PE4aCkrsTakvZ2HFENu4h3
	ZjY7URp8xuwI40vCFQEfCOREVbeE4V0tFIG/0Pgvc3hLo3nL/Nz/6pcR29yvz3gF+uo9wsYlekM
	8cfyV/EBv1nYL+BkMhk1yzW6SHQ1WQodDQKNRg8Qqg9UCn5qPyyhvOMZZvkbcNcfpa5WRPYzaPV
	AwMp7p5C4llmJPAsrvnvYy1WYMyg==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030001_320096_0AF06DCF 
X-CRM114-Status: GOOD (  20.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James



